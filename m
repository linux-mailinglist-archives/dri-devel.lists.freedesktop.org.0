Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9983EDBEA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 10:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C3E6E248;
	Mon,  4 Nov 2019 09:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EEE76E248
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 09:50:05 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f2so7318044wrs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 01:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=zkMcvSms/U4Qaw7R6HtNgaBc3dEVSO6odZWh6NsVfGM=;
 b=OU5YnRM6VItXLyWd4WXfMQ+z+V52mNf/+nzbkwyVcmDWw2jmijyg66o75/eViu/kBj
 nLp2mkLYsvyCRCEj6ZsiB/cGguPPiwLJvFSY2DN8s1Y5U4p3PQs1fRq4JmzAIkTqQJBg
 O1oyCXPR0tbpFQ8/5CdxVUGz9msV/s3ox8YlMdYX7DdVmUgZVTTyFA23bR33StznMUcA
 7ecqjx4KKhdoG2Wv8Gduw3oAPzTG7tSKSK9rWTL4y1UnYXqhcKsC65ydMVc8fQBUkezL
 3a+PJqa3EyXhOFVs1f78/38ybBWG5k2b9RP1ay0IFMHhaKetYXf2i1ljbXmqHxPPkZxh
 ijNA==
X-Gm-Message-State: APjAAAWL4H86Z3Wfnoo1xCUkYUfwhJZ2dCqFQAp5iIFo4fcz4l8X0l4h
 YJu3LAOclc0Y6gQW/lASyPYjgQ==
X-Google-Smtp-Source: APXvYqyS9IIRVxDZNgalOrFWi0oIEgRyORArI8t1YtTjTqwHb+ZD4S0expj0K0dwt02Xt23TJXmrPA==
X-Received: by 2002:a5d:55c7:: with SMTP id i7mr23332669wrw.371.1572861003981; 
 Mon, 04 Nov 2019 01:50:03 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id r3sm35307740wre.29.2019.11.04.01.50.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 01:50:03 -0800 (PST)
Date: Mon, 4 Nov 2019 10:50:01 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] fbdev: c2p: Fix link failure on non-inlining
Message-ID: <20191104095001.GB10326@phenom.ffwll.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20190927094708.11563-1-geert@linux-m68k.org>
 <CAMuHMdW7fkPjqppQYESDf4ZLKcCrxhMUyCn0=tm6kxPSxf5mGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdW7fkPjqppQYESDf4ZLKcCrxhMUyCn0=tm6kxPSxf5mGA@mail.gmail.com>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=zkMcvSms/U4Qaw7R6HtNgaBc3dEVSO6odZWh6NsVfGM=;
 b=ReXeIciiF4NFFhQ/IHMb4yYMIlGw4cQRP3qdhGM+219nNZPv24yYUgtPBwOjkmgo6c
 ZwdFIwEcVH/odn/N6q36fHsB2YJEd2OlYTTLSAJyPfwDyXnEsLekH35c5/8HH4OHVTS+
 +bRNSLbWFjNLk+2TPLtrWBgVbLUz7xWK5NV48=
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMDg6NDM6MDdBTSArMDEwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IEhpIEJhcnRsb21pZWosIEFuZHJldywKPiAKPiBPbiBGcmksIFNlcCAyNywg
MjAxOSBhdCAxMTo0NyBBTSBHZWVydCBVeXR0ZXJob2V2ZW4KPiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+IHdyb3RlOgo+ID4gV2hlbiB0aGUgY29tcGlsZXIgZGVjaWRlcyBub3QgdG8gaW5saW5lIHRo
ZSBDaHVua3ktdG8tUGxhbmFyIGNvcmUKPiA+IGZ1bmN0aW9ucywgdGhlIGJ1aWxkIGZhaWxzIHdp
dGg6Cj4gPgo+ID4gICAgIGMycF9wbGFuYXIuYzooLnRleHQrMHhkNik6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYGMycF91bnN1cHBvcnRlZCcKPiA+ICAgICBjMnBfcGxhbmFyLmM6KC50ZXh0KzB4
MWRjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYzJwX3Vuc3VwcG9ydGVkJwo+ID4gICAgIGMy
cF9pcGxhbjIuYzooLnRleHQrMHhjNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGMycF91bnN1
cHBvcnRlZCcKPiA+ICAgICBjMnBfaXBsYW4yLmM6KC50ZXh0KzB4MTUwKTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgYzJwX3Vuc3VwcG9ydGVkJwo+ID4KPiA+IEZpeCB0aGlzIGJ5IG1hcmtpbmcg
dGhlIGZ1bmN0aW9ucyBfX2Fsd2F5c19pbmxpbmUuCj4gPgo+ID4gV2hpbGUgdGhpcyBjb3VsZCBi
ZSB0cmlnZ2VyZWQgYmVmb3JlIGJ5IG1hbnVhbGx5IGVuYWJsaW5nIGJvdGgKPiA+IENPTkZJR19P
UFRJTUlaRV9JTkxJTklORyBhbmQgQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFLCBpdCB3YXMg
ZXhwb3NlZAo+ID4gaW4gdGhlIG02OGsgZGVmY29uZmlnIGJ5IGNvbW1pdCBhYzdjM2U0ZmY0MDFi
MzA0ICgiY29tcGlsZXI6IGVuYWJsZQo+ID4gQ09ORklHX09QVElNSVpFX0lOTElOSU5HIGZvcmNp
Ymx5IikuCj4gPgo+ID4gRml4ZXM6IDkwMTJkMDExNjYwZWE1Y2YgKCJjb21waWxlcjogYWxsb3cg
YWxsIGFyY2hlcyB0byBlbmFibGUgQ09ORklHX09QVElNSVpFX0lOTElOSU5HIikKPiA+IFJlcG9y
dGVkLWJ5OiBub3JlcGx5QGVsbGVybWFuLmlkLmF1Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPgo+ID4gUmV2aWV3ZWQtYnk6IE1hc2Fo
aXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Cj4gPiAtLS0KPiA+IFRo
aXMgaXMgYSBmaXggZm9yIHY1LjQtcmMxLgo+IAo+IENhbiB5b3UgcGxlYXNlIGFwcGx5IHRoaXMg
Zm9yIHY1LjQ/Cj4gVGhpcyBpcyBvbmUgb2YgdGhlIDQgcmVtYWluaW5nIGJ1aWxkIHJlZ3Jlc3Np
b25zLCBjb21wYXJlZCB0byB2NS4zLgoKQXBwbGllZCB0byBkcm0tbWlzYy1maXhlcywgdGhhbmtz
IGZvciB5b3VyIHBhdGNoLgotRGFuaWVsCgo+IAo+IFRoYW5rcyEKPiAKPiA+IHYyOgo+ID4gICAt
IEFkZCBSZXZpZXdlZC1ieSwKPiA+ICAgLSBGaXggRml4ZXMsCj4gPiAgIC0gQWRkIG1vcmUgZXhw
bGFuYXRpb24uCj4gCj4gR3J7b2V0amUsZWV0aW5nfXMsCj4gCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKPiAKPiAtLSAKPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3Rz
IG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCj4gCj4gSW4gcGVy
c29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYg
YSBoYWNrZXIuIEJ1dAo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
