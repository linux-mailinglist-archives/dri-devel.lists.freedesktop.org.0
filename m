Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91954E7137
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 13:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4266E7E6;
	Mon, 28 Oct 2019 12:19:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB636E7E6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 12:19:53 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id v2so7979999ilq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 05:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dc1c8u3hukir3oPx/zrCumMpjl7/p9MlfwHDO0Mnpv8=;
 b=WMK/7ASMNKi/L9DoBFp7WVTaqv1wDlgFDbsOKT3IH6svBTXGUqPe1zrhhOMeIXZanF
 DZM4+BW0ndD6pQ7gS4OwjFWMqjDcYycJUU1e+5bv9Mn2TGKw5SmBQBMXMbBPwvjoVveX
 7QqJG5M69evOw3tzG7FtDeOwtgbPP1ZADLqT38X5lv7hLbgPQeUmVLBngbJWb89R1elf
 fYweDPrQ0h7yHK6pLoUpWkrsaMQAKwM+gy502VOVSheSXHHUbtXkpU9YM11VKJjjKQbj
 aRRL/8ewMBgnKInLDNI/HP2yPSMqOx2udKqNB39z6HI9/9n4MECZtWMC9xZwZUnGnB3A
 hJPw==
X-Gm-Message-State: APjAAAXL61NvcpIgsZzDSGLKM6VJeNfrkSGyfMnGcry6+02+70sp5BcN
 BpU1H7SWQBIfTjU/X5THZJtexBy47EJyhT+UpXY=
X-Google-Smtp-Source: APXvYqwLLI6KwbQV8tqE2fiuP3DXQup3mYDMcHXvVN0FaWTQwKqpIaCTQP2JKG7nppz5bisbSpgqeqf225/CJoaOOYU=
X-Received: by 2002:a92:ce44:: with SMTP id a4mr6427947ilr.298.1572265192683; 
 Mon, 28 Oct 2019 05:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-3-boris.brezillon@collabora.com>
In-Reply-To: <20191023154512.9762-3-boris.brezillon@collabora.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 28 Oct 2019 21:19:17 +0900
Message-ID: <CAAQKjZMh3=5=8JzkHYTeEGrOKNfN=eULTuXx1ZTDbsL7u3HQEw@mail.gmail.com>
Subject: Re: [PATCH v3 02/21] drm/exynos: Don't reset bridge->next
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dc1c8u3hukir3oPx/zrCumMpjl7/p9MlfwHDO0Mnpv8=;
 b=EpyUtk0gTOfzOAJFTnHDTpoXdwbIYeh8t7J62/VY2aVevHBQGNuN3c1NSQwtKfz5Cx
 h2zjt5452uhH7qB+ErFvj/LqgzPC9xZC5NsDG5uMgRDWZKWauiAHMWf0gQEjaI4qbk5+
 IKTfo6IZwNUmAsjwgl4/aXXuZeRvedEI95j+MRsU/xVMn3ngANBkRU2fOo9gD4OzXZQ4
 C78jtHqrVhoCI1EioFIAqtkUfeoDDpoNvtkEWm1eE3CPeWxRLWCZ8aEvy/Z+7pAE5/kc
 sggnFuQYBMRUU8UPNgXUMKjww2McSKjxAp1Cka0ZeJtZqcgOM+iRiG2WM8qi8znZYesB
 K4Mg==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjAxOeuFhCAxMOyblCAyNOydvCAo66qpKSDsmKTsoIQgMTI6NDUsIEJvcmlzIEJyZXppbGxvbgo8
Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+64uY7J20IOyekeyEsToKPgo+IGJyaWRnZS0+
bmV4dCBpcyBvbmx5IHBvaW50cyB0byB0aGUgbmV3IGJyaWRnZSBpZiBkcm1fYnJpZGdlX2F0dGFj
aCgpCj4gc3VjY2VlZHMuIE5vIG5lZWQgdG8gcmVzZXQgaXQgbWFudWFsbHkgaGVyZS4KPgo+IE5v
dGUgdGhhdCB0aGlzIGNoYW5nZSBpcyBwYXJ0IG9mIHRoZSBhdHRlbXB0IHRvIG1ha2UgdGhlIGJy
aWRnZSBjaGFpbgo+IGEgZG91YmxlLWxpbmtlZCBsaXN0LiBJbiBvcmRlciB0byBkbyB0aGF0IHdl
IG11c3QgcGF0Y2ggYWxsIGRyaXZlcnMKPiBtYW5pcHVsYXRpbmcgdGhlIGJyaWRnZS0+bmV4dCBm
aWVsZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20+Cj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIHYyOgo+ICogQWRk
IExhdXJlbnQncyBSLWIgKEknZCBsaWtlIHRvIGhhdmUgYSBSLWIgZnJvbSB0aGUgRFJNIGV4eW5v
cwo+ICAgbWFpbnRhaW5lcnMgYmVmb3JlIGFwcGx5aW5nIHRoYXQgb25lKQoKQWNrZWQtYnk6IElu
a2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KClRoYW5rcywKSW5raSBEYWUKCj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RwLmMgfCAxIC0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcC5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHAuYwo+IGluZGV4
IDFlNmFhMjRiZjQ1ZS4uNDc4NTg4NWMwZjRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcC5jCj4gQEAgLTExMCw3ICsxMTAsNiBAQCBzdGF0aWMgaW50IGV4eW5vc19kcF9icmlkZ2Vf
YXR0YWNoKHN0cnVjdCBhbmFsb2dpeF9kcF9wbGF0X2RhdGEgKnBsYXRfZGF0YSwKPiAgICAgICAg
ICAgICAgICAgaWYgKHJldCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9ERVZfRVJS
T1IoZHAtPmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJGYWls
ZWQgdG8gYXR0YWNoIGJyaWRnZSB0byBkcm1cbiIpOwo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGJyaWRnZS0+bmV4dCA9IE5VTEw7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJl
dDsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+IC0tCj4gMi4yMS4wCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
