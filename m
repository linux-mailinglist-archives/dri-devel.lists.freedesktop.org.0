Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2836392F4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 19:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F8589168;
	Fri,  7 Jun 2019 17:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF0B89168
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jun 2019 17:21:02 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b11so2196425lfa.5
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 10:21:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4D91HzfNlEzUNnFN7tLM07Lh/kR1e806a5ZjRrM9eYA=;
 b=nX7f7XzMxqNTRVROZv+GwCZ/UR3B2x5WR3gFdTHF14rwY/t1izwS0K1r/PZj+x8Jvf
 GDi6RceZlVE3CaT3XG0sh0raAb1CqFMbonSjJMHwFtA3FNxoQKhULlS3l9Nr3i8HtR41
 ENPzNzy8OwVehylmDSTAr50Xk6BKajyaHEqHme4rS4OW4KeNNrDX3Zn5GugO0PS+2q4n
 AQbZIP0RU9BELaTo4gB3Ixl8dZLwfbIA1IJ/jL5q+po2mwnTN54VSNvwR1Z7IbbhZWIV
 b11et1Ib40IlCtaudgxZkyxmpmcT3WsmqiI3ngqnuVvzAULObMWpOBuLwWJekn3Mb4TD
 T70g==
X-Gm-Message-State: APjAAAWtzIihQSoTJ2dtH6A10D49Ol9hqhXjaXCEuMsaXy3tAVgGpLrO
 qOii+xqYifKVl5dYaF/X+PsAAP8rZrs=
X-Google-Smtp-Source: APXvYqyag2KFsOH/CqlTL8hAVp2wyXIBvoCxCZZZEfNi7U29ape1jAaQhwRGd5hvYZoOYZYyQ6LJFg==
X-Received: by 2002:a19:f817:: with SMTP id a23mr13960196lff.123.1559928060048; 
 Fri, 07 Jun 2019 10:21:00 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id i195sm503602lfi.87.2019.06.07.10.20.59
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 10:20:59 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 131so2418637ljf.4
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 10:20:59 -0700 (PDT)
X-Received: by 2002:a2e:4246:: with SMTP id p67mr28756012lja.44.1559928058812; 
 Fri, 07 Jun 2019 10:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tx_2-ANvU3CsasrHkaJsyRV+NxP1AoM0ZSu8teht3FuEg@mail.gmail.com>
In-Reply-To: <CAPM=9tx_2-ANvU3CsasrHkaJsyRV+NxP1AoM0ZSu8teht3FuEg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Jun 2019 10:20:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgOGPPO6owAcRiBd0KJpmjH-C83-=_N6QeQzyiCW4kb0w@mail.gmail.com>
Message-ID: <CAHk-=wgOGPPO6owAcRiBd0KJpmjH-C83-=_N6QeQzyiCW4kb0w@mail.gmail.com>
Subject: Re: [git pull] drm fixes for v5.2-rc4 (v2)
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=4D91HzfNlEzUNnFN7tLM07Lh/kR1e806a5ZjRrM9eYA=;
 b=Nd9RRPFRO2C5Q5+TuDI+2EliAG0BEJiHbUEtvqa2sciOCFIdPA9T6u5w8lx+m0b/zA
 WlO74VC2uvGEdDbUcOenUGd0uBMJdkZw9gz+WcfFKOwn4ICV7YHHfpfwNL+3ffsQMQGD
 IOa0Rnt4fVjhNTjZMvJnDHc2t1GFUqxdR+WKo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gNywgMjAxOSBhdCAxMjoyNCBBTSBEYXZlIEFpcmxpZSA8YWlybGllZEBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gSSBzZW50IHRoaXMgb3V0IGVhcmxpZXIsIGJ1dCBJIGZvcmdvdCB0
aGUgc3ViamVjdCwgYW5kIHRoZW4gQmVuIGFza2VkCj4gYWJvdXQgc29tZSBub3V2ZWF1IGZpcm13
YXJlIGZpeGVzLgoKV2VsbCwgdGhlIGZpcnN0IG9uZSBhdCBsZWFzdCBoYWQgdGhlIGFkZHJlc3Mg
dG8gcHVsbCBmcm9tLCBhbmQgdGhlIGRpZmZzdGF0LgoKVGhlIHNlY29uZCBvbmUgaGFzIHRoZSBz
dWJqZWN0LCBhbmQgbWVudGlvbnMgbm91dmVhdSwgYnV0IGRvZXNuJ3QKYWN0dWFsbHkgaGF2ZSB0
aGUgdGFnIG5hbWUgb3IgdGhlIGV4cGVjdGVkIGRpZmZzdGF0IGFuZCBzaG9ydGxvZy4KClRoaXJk
IHRpbWUgaXMgdGhlIGNoYXJtPwoKICAgICAgICAgICAgICAgICAgIExpbnVzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
