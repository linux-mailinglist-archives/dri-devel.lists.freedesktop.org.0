Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A34D172142
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 23:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4AD6E3C1;
	Tue, 23 Jul 2019 21:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09E6E3C1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 21:07:10 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id n5so45603445otk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 14:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hzz7GvZmVNUIEg2vdFuobiy/ybjfM36GExlAr9zgJIY=;
 b=Q2FgJmKadL2FeGlWyJLUpW2RV/Hj94kZwc75ddH9QY21hC07ehqRGOUGBmCySpYjW+
 LIb4RHIJ2CbL1AjhtDUyzBBcIRnPZe5axArhoR8UA3rk1c+xpvOKK0fnqt4TiMrab8E6
 Lhhab/5BgZIZR0CuxWFUNhRgplRFoT/y9tNJ9xe/ghUoqhfDiRloxIh6cOrhXzEf4VfN
 9VbbpsGM4ZZbw4DAJnErNWDXQIFsvasjJA9JhCP80ZnrWsqmNMjqADVkthD5s7A1GMZw
 M0anpcgvmA93EFjM19/FdAgG0qUD5MRTVfKu8dlQH/dr8s/MSZPv7SmC8lBv5xpvjd+p
 OrHw==
X-Gm-Message-State: APjAAAUstUToB5p7c2R39CCbISLDAhBY6b/XFUdzpXIexRZpeTz4tayX
 VzoNu1HWwH4xg6N23puNgRnCQAFbw1RazNk6R8w=
X-Google-Smtp-Source: APXvYqwIzZ8fzTqv0nBzRUnVyfr5ld3ZcfdHFyc1VhmkB6EBsdmyMrjymZ3LLtDSd4750cVSUgAQbZNuYgZVier8PcA=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr20686835otp.106.1563916029544; 
 Tue, 23 Jul 2019 14:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190723133755.22677-1-linus.walleij@linaro.org>
 <20190723133755.22677-2-linus.walleij@linaro.org>
 <9c9b77b3b76e7a7e87c7c3d9076a8339362157bd.camel@redhat.com>
In-Reply-To: <9c9b77b3b76e7a7e87c7c3d9076a8339362157bd.camel@redhat.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 23 Jul 2019 23:06:58 +0200
Message-ID: <CAKMK7uHVudGdTzQS3Q6qVTZtDU-UsSQ2K04M9VvZHxzXo0DHOw@mail.gmail.com>
Subject: Re: [PATCH 1/3] RFT: drm/pl111: Support grayscale
To: Adam Jackson <ajax@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Hzz7GvZmVNUIEg2vdFuobiy/ybjfM36GExlAr9zgJIY=;
 b=hfDRuYXpZnCOSj8BAHqrD9nVDzG1ceddj/KmOgXWEZhOQe/oyJm8RvJuGm6qPykYtx
 Um0XpLky5LsMXIi6BhQwogy4xS4MaSNXVVf3w+ML7FxGSxFWoemoH3HE97i2c41K4REg
 1gjz6VW71K+/AaKUQVvWkx4Mk75WZrFKCk7To=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Fabian Vogt <fabian@ritter-vogt.de>, Daniel Tang <dt.tangr@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgNzoyNSBQTSBBZGFtIEphY2tzb24gPGFqYXhAcmVkaGF0
LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDIwMTktMDctMjMgYXQgMTU6MzcgKzAyMDAsIExpbnVz
IFdhbGxlaWogd3JvdGU6Cj4gPiBNaWdyYXRpbmcgdGhlIFRJIG5zcGlyZSBjYWxjdWxhdG9ycyB0
byB1c2UgdGhlIFBMMTExIGRyaXZlciBmb3IKPiA+IGZyYW1lYnVmZmVyIHJlcXVpcmVzIGdyYXlz
Y2FsZSBzdXBwb3J0IGZvciB0aGUgZWxkZXIgcGFuZWwKPiA+IHdoaWNoIHVzZXMgOGJpdCBncmF5
c2NhbGUgb25seS4KPiA+Cj4gPiBEUk0gZG9lcyBub3Qgc3VwcG9ydCA4Yml0IGdyYXlzY2FsZSBm
cmFtZWJ1ZmZlcnMgaW4gbWVtb3J5LAo+ID4gYnV0IGJ5IGRlZmluaW5nIHRoZSBidXMgZm9ybWF0
IHRvIGJlIE1FRElBX0JVU19GTVRfWThfMVg4IHdlCj4gPiBjYW4gZ2V0IHRoZSBoYXJkd2FyZSB0
byB0dXJuIG9uIGEgZ3JheXNjYWxpbmcgZmVhdHVyZSBhbmQKPiA+IGNvbnZlcnQgdGhlIFJHQiBm
cmFtZWJ1ZmZlciB0byBncmF5c2NhbGUgZm9yIHVzLgo+Cj4gV2hhdCdzIHdyb25nIHdpdGggRFJN
X0ZPUk1BVF9SOD8gWWVzIHRoZSBoYXJkd2FyZSBpcyBub3QgcmVhbGx5Cj4gInJlZHNjYWxlIiwg
YnV0IGl0J3Mgc3RpbGwgYSBzaW5nbGUgY29sb3IgY2hhbm5lbCBhbmQgdGhlcmUncyBub3QKPiBy
ZWFsbHkgYW55IGFtYmlndWl0eS4KClllYWgsIEkgdGhpbmsgd2l0aCBhIGNvbW1lbnQgb3IgYW4g
YWxpYXNpbmcgI2RlZmluZSB0byBfWTggKG9yIGJvdGgpCnRoaXMgaXMgZ29vZCB0byBnby4KCllv
dSBwcm9iYWJseSBzdGlsbCB3YW50IHRvIGV4cG9zZSB0aGUgcmdiIGZvcm1hdCBzaW5jZSB0b28g
bXVjaAp1c2Vyc3BhY2UganVzdCBhc3N1bWVzIHRoYXQgeHJnYjg4ODggd29ya3MuIFNhbWUgcmVh
c29uIHdoeSB0aGUKdGlueWRybSBkcml2ZXJzIGRvIHRoZSBzdyBjb252ZXJzaW9uLgotRGFuaWVs
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgor
NDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
