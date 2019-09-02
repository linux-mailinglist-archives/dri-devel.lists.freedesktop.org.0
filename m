Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEC5A5533
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EFF8904A;
	Mon,  2 Sep 2019 11:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC3C8904A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:44:51 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e17so1575191ljf.13
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UERzkZeHqs2M/DaXeekOuo53YHuA0FbKsrnm1WqRnJo=;
 b=lrxznCuM7J2nl0Aa6jXZWtCHQrssZMgC8qUgOzQznNsUfnhwDnYyB+V0ysYXtzY61/
 CPqSVUS/Q4oLUHeVeaHIj2btTbzVGT9mK6Gc+ciQ2PNgypwc+oB7Iz6EP1MerOyCH3bD
 mOuznRSNoTOx4ZqQhWBhAzS7IyvgjWdECzwOvwL/6pOg2BUdVXmevFHXYv9LgaG6HizL
 CoBU2IlMT+tKj+8WppvW5QT/LLFyDA67y3c9d5GvA62Yaq0fpJZenPleLs6oQNxgBwlx
 dZcfH9zh/XEs546OF8vFFRzmEidHD2xYEuEDcfeTWdJIR69rs9owFv6znfX66Cw5qmlL
 ovEw==
X-Gm-Message-State: APjAAAXAsbiBhVbVP/tXo78MZyO5D+3f/4V3ZsF056vf4VHR4FDVkefE
 Ie8715YWYR2UDxr1YjqUe1C2tsW9tfQvyHBLudJG9Q==
X-Google-Smtp-Source: APXvYqx0FTdNcuHOrjdyKTT9BrHgdteQCIaamg1cZB+w6uVcm8g9XIEMxfuhHSjqkM8WtaAz2hzGe2LeNStwhv0g6eQ=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr16055656lji.37.1567424690216; 
 Mon, 02 Sep 2019 04:44:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190902090633.24239-1-linus.walleij@linaro.org>
 <20190902093517.GA12946@ulmo>
In-Reply-To: <20190902093517.GA12946@ulmo>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2019 13:44:38 +0200
Message-ID: <CACRpkdb_X+Eia=mhHrXBcBn0osMtw6bKU6uAS5AV8ASV63qBkg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Add DT bindings for Sony ACX424AKP
To: Thierry Reding <thierry.reding@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=UERzkZeHqs2M/DaXeekOuo53YHuA0FbKsrnm1WqRnJo=;
 b=Bb8664rWR73vmxDFygGW0MsZsynoRa9z++TTvHL0SuXoVzYMfj/Jz0OKXNGy3AZxOe
 bACheVETlJ+vkwdDp7c/sILY/z8Jm3+FyLK5t6dA9b8V6+lcQKJoxD/iwXc56X1rF29y
 JToJxak7+eNWbCzS3BYUPx7Gg5a/lLTvHj+MgfBjYfeCqjJu1Dx1f8LABPVfuWEFU+pD
 8K2A9H8FsXsWRzQU81jUsZWlPYVuullfE0Auap/KYr43BmD9MjJl9aoBvd2AvLHTh+qQ
 H5Vm9+j1h+3DsgdLOb+2tREUhF1QYOdIAyRLLRd/f/ghql3X/1fVwLg36iH0FZ/jhbCH
 dN2w==
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMiwgMjAxOSBhdCAxMTozNSBBTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKCj4gPiArICBkc2ktY29tbWFuZC1tb2RlOgo+ID4gKyAg
ICAgdHlwZTogYm9vbGVhbgo+ID4gKyAgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgIElmIHRo
aXMgaXMgc3BlY2lmaWVkLCB0aGUgcGFuZWwgd2lsbCBiZSB1c2VkIGluIGNvbW1hbmQKPiA+ICsg
ICAgICAgbW9kZSBpbnN0ZWFkIG9mIHZpZGVvIG1vZGUuCj4KPiBJJ20gbm90IHN1cmUgdGhlcmUn
cyBjb25jZW5zdXMgb24gdGhpcyBvbmUgeWV0LiBJIHRoaW5rIHNvIGZhciB0aGUKPiBkcml2ZXIg
ZGVjaWRlcyB3aGljaCBtb2RlIHRvIHVzZSB0aGUgcGFuZWwgaW4uIFRlY2huaWNhbGx5IHRoaXMg
ZmFsbHMKPiBpbnRvIHRoZSBjYXRlZ29yeSBvZiBjb25maWd1cmF0aW9uLCBzbyBpdCBkb2Vzbid0
IHJlYWxseSBiZWxvbmcgaW4gdGhlCj4gRFQuCgpUaGUgd2F5IHdlJ3ZlIHVzZWQgRFQgaXMgZm9y
IGEgYml0IG9mIGJvdGggaGFyZHdhcmUgZGVzY3JpcHRpb24KYW5kIGNvbmZpZ3VyYXRpb24gSSdk
IHNheSwgYnV0IEknbSBubyBhdXRob3JpdHkgb24gdGhlIHN1YmplY3QuCgo+IEkgdmFndWVseSBy
ZWNhbGwgZnJvbSBkaXNjdXNzaW9ucyBJJ3ZlIGhhZCBvbiB0aGlzIHN1YmplY3QgdGhhdCB0aGVy
ZSdzCj4gdXN1YWxseSBubyByZWFzb24gdG8gZG8gdmlkZW8gbW9kZSBpZiB5b3UgY2FuIGRvIGNv
bW1hbmQgbW9kZSBiZWNhdXNlCj4gY29tbWFuZCBtb2RlIGlzIG1vcmUgcG93ZXIgZWZmaWNpZW50
LiBUaGlzIHdhcyBhIGxvbmcgdGltZSBhZ28sIHNvIEkgbWF5Cj4gYmUgbWlzcmVtZW1iZXJpbmcu
IFBlcmhhcHMgeW91IGhhdmUgZGlmZmVyZW50IGluZm9ybWF0aW9uIG9uIHRoaXM/CgpObyBpZGVh
LiBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHZpZGVvIG1vZGUgd2FzIHByZWZlcnJl
ZApidXQgSSBoYXZlIG5vIGlkZWEgd2h5LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
