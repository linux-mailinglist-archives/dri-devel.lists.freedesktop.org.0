Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE0F58B09
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 21:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F946E4BB;
	Thu, 27 Jun 2019 19:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0786E4BB
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 19:44:12 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id i8so3499450oth.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 12:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dg1R5Uo32WYkkl3u1ix25+2ks+vFMVLaKn6JsNIbvzk=;
 b=DCcB+UyCJD5aChGbwhD2ITQb6LshtKVk+QcN7Bz9yNbV2TjG/hOWK79tZdMeoSMO6q
 pRxAIF0PI7My+NJSOGqx7wENM4Q2BeiiMVbZxNWYwooPPasCkQb5/C34chdTU8ggP5WC
 p/smk0HnvUJrYGclZMw13yN845KfQJn36qBpmrG/I9VlQ38HGYndF5Vhli06dW0FtGhI
 aUQblpvA422WRhITTJKDPCAtFGKYz5pJRSmwxkBF8OYtOuF1e4KoZk9qJ2al52vbTqmQ
 tv9NZZ5mH3IhCoSS9yWL8Xp58IanLHe3G5nat0z7JfZkreT9OnslEZfvrRk6zdFSmKTc
 ua+Q==
X-Gm-Message-State: APjAAAW10zPsBVqXFOWOxsMxTTpT5SyNJm2PfYmtl6TFLDq8OXmE752K
 auNao1Okrh6ahCzy45OqRyqBcARd1JnaP6Mwkv2JtQ==
X-Google-Smtp-Source: APXvYqy8d5D0lTl2v+MH7FMTmjk/5LP/GDPtK/KvswFJia8XMylNu7kDUlfYn7kVgH+/KXfJHiKJKN36WrVTMaVZggo=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr4771408otp.106.1561664651379; 
 Thu, 27 Jun 2019 12:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <699d7618720e2808f9aa094a13ab2f3545c3c25c.1561565652.git.mchehab+samsung@kernel.org>
 <20190626212735.GY12905@phenom.ffwll.local> <20190627113122.34b46ee2@lwn.net>
In-Reply-To: <20190627113122.34b46ee2@lwn.net>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 27 Jun 2019 21:43:59 +0200
Message-ID: <CAKMK7uGU1X-KvuZGMj3GHNOiqYOuvwq-12o91kBj7JeOf3gjvw@mail.gmail.com>
Subject: Re: [PATCH] drm: fix a reference for a renamed file: fb/modedb.rst
To: Jonathan Corbet <corbet@lwn.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Dg1R5Uo32WYkkl3u1ix25+2ks+vFMVLaKn6JsNIbvzk=;
 b=ADujp90SmUPcFGS9mqRIeJ31riDOHSFmqqsPgEW35NxBXOqkUTJmxkbDTDrxVpuPs+
 foj05KsSjZSsrJlrZ2kJbJiA7SVzaHc453oD5Mn4aGeGDRtcMimDHYpf7gxb+OPcGXQL
 NGkOCQRHra+m8ZFYd/zRammMH0zbVKw0tCNSI=
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, David Airlie <airlied@linux.ie>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgNzozMSBQTSBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBs
d24ubmV0PiB3cm90ZToKPgo+IE9uIFdlZCwgMjYgSnVuIDIwMTkgMjM6Mjc6MzUgKzAyMDAKPiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gPiBPbiBXZWQsIEp1biAy
NiwgMjAxOSBhdCAwMToxNDoxM1BNIC0wMzAwLCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6
Cj4gPiA+IER1ZSB0byB0d28gcGF0Y2hlcyBiZWluZyBhcHBsaWVkIGFib3V0IHRoZSBzYW1lIHRp
bWUsIHRoZQo+ID4gPiByZWZlcmVuY2UgZm9yIG1vZGVkYi5yc3QgZmlsZSBnb3Qgd3Jvbmc6Cj4g
PiA+Cj4gPiA+ICAgICBEb2N1bWVudGF0aW9uL2ZiL21vZGVkYi50eHQgaXMgbm93IERvY3VtZW50
YXRpb24vZmIvbW9kZWRiLnJzdC4KPiA+ID4KPiA+ID4gRml4ZXM6IDFiZjRlMDkyMjdjMyAoImRy
bS9tb2RlczogQWxsb3cgdG8gc3BlY2lmeSByb3RhdGlvbiBhbmQgcmVmbGVjdGlvbiBvbiB0aGUg
Y29tbWFuZGxpbmUiKQo+ID4gPiBGaXhlczogYWI0MmI4MTg5NTRjICgiZG9jczogZmI6IGNvbnZl
cnQgZG9jcyB0byBSZVNUIGFuZCByZW5hbWUgdG8gKi5yc3QiKQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWIrc2Ftc3VuZ0BrZXJuZWwub3JnPgo+ID4K
PiA+IFdoYXQncyB0aGUgbWVyZ2UgcGxhbiBoZXJlPyBkb2MtbmV4dD8gSWYgc286Cj4gPgo+ID4g
QWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4KPiBJdCBk
b2Vzbid0IHJlYWxseSBhcHBseSB0byBkb2NzLW5leHQsIHNvIHRoYXQncyBwcm9iYWJseSBub3Qg
dGhlIGJlc3QKPiBwYXRoIHVubGVzcyBJIGhvbGQgaXQgdW50aWwgYWZ0ZXIgdGhlIG1lcmdlIHdp
bmRvdy4gIFNlZW1zIGxpa2UgaXQgbmVlZHMKPiB0byBnbyB0aHJvdWdoIHRoZSBEUk0gdHJlZSB0
byBtZS4KCmZiZGV2IGlzbid0IGluIGRybSAoeWV0KSwgc28gSSBkb24ndCB0aGluayBpdCBhcHBs
aWVzIGhlcmUgZWl0aGUuIEkKZ3Vlc3Mgd2UgbmVlZCB0byB3YWl0IHVudGlsIGFmdGVyIC1yYzEg
d2l0aCB0aGlzIG9uZS4gVG9waWMKYnJhbmNoL21lcmdlIHNlZW1zIGEgYml0IG92ZXJraWxsIGhl
cmUuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENv
cnBvcmF0aW9uCis0MSAoMCkgNzkgMzY1IDU3IDQ4IC0gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
