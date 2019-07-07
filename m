Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14D3615D9
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 20:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B1B89AB6;
	Sun,  7 Jul 2019 18:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
 [209.85.221.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B506889AB6
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 18:22:05 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id s16so2063641vke.7
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jul 2019 11:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BFQUy06MAfGO03HZDUdREoH2Wm9PnraN6PTFOCfevog=;
 b=PjhfNGTDRBgaZo9EfCXwbjxdInNYe4RM+oy1SwcXZa3holFpKEVVkcp3ZUAT+pVsPF
 810y/jpYCQCLLxgQDIGUxOnueeMi9mgkQhO3N76Vl53iaTWEDvXYSOCS9f0OTPq3IyrA
 QSLqdQF1h2ozcNW6KDEqVjeQuyuqF9XUHq48FJK8saRRLyQYP7W1T4gd9KpgDvyrDStg
 xLe853Xdxq4Ekut/8fB6Ijah2UpLAXkjPA5xCpiJXITUcQkZNGlxcj/i7MacHKdY0PC7
 K8JrzHB+tnDKe9vfeH2eU7CbZP5o9Scet5NJ1ndxlXe+ZUhKmVUaD+v8L6qOzjUOz9Kj
 o2Qw==
X-Gm-Message-State: APjAAAV5C1b/YDr7ftEJ4bcUiTldhpameqXbhxDlpZy0HxXVZIUxNRQi
 uTdnlM4ERpULRyqC4DP6OyiEb1P//+Q3VKqYm9w=
X-Google-Smtp-Source: APXvYqzbAKBbTaDw81uVgPSMRiL+MVnHsB4yJlM9yzy5+mRjj/Pep2d6xKB1oiVzgG9teoD5XX0DqMYSgbJE+DxYVK4=
X-Received: by 2002:a1f:b6c5:: with SMTP id g188mr243321vkf.2.1562523724803;
 Sun, 07 Jul 2019 11:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190707180852.5512-1-laurent.pinchart@ideasonboard.com>
 <20190707180852.5512-3-laurent.pinchart@ideasonboard.com>
 <20190707181415.GA5308@pendragon.ideasonboard.com>
In-Reply-To: <20190707181415.GA5308@pendragon.ideasonboard.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 7 Jul 2019 14:21:53 -0400
Message-ID: <CAKb7UvgvcMhS+3arQrBeVHO+mhC0C4iHD-pqZmTbZkqvc7JR=A@mail.gmail.com>
Subject: Re: [PATCH 02/60] video: hdmi: Change return type of
 hdmi_avi_infoframe_init() to void
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgNywgMjAxOSBhdCAyOjE1IFBNIExhdXJlbnQgUGluY2hhcnQKPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cj4KPiBTb3JyeSwgZm9yZ290IHRvIEND
IEJhcnRsb21pZWogb24gdGhpcyBwYXRjaC4KPgo+IE9uIFN1biwgSnVsIDA3LCAyMDE5IGF0IDA5
OjA3OjU0UE0gKzAzMDAsIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBUaGUgaGRtaV9hdmlf
aW5mb2ZyYW1lX2luaXQoKSBuZXZlciBuZWVkcyB0byByZXR1cm4gYW4gZXJyb3IsIGNoYW5nZSBp
dHMKPiA+IHJldHVybiB0eXBlIHRvIHZvaWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCA1ICstLS0tCj4gPiAgZHJpdmVycy92aWRl
by9oZG1pLmMgICAgICAgfCA5ICsrLS0tLS0tLQo+ID4gIGluY2x1ZGUvbGludXgvaGRtaS5oICAg
ICAgIHwgMiArLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMiBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9oZG1pLmMgYi9kcml2
ZXJzL3ZpZGVvL2hkbWkuYwo+ID4gaW5kZXggYjkzOWJjMjhkODg2Li41NGZiN2NmMTFkMWEgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2hkbWkuYwo+ID4gKysrIGIvZHJpdmVycy92aWRl
by9oZG1pLmMKPiA+IEBAIC01NiwxNSArNTYsMTMgQEAgc3RhdGljIHZvaWQgaGRtaV9pbmZvZnJh
bWVfc2V0X2NoZWNrc3VtKHZvaWQgKmJ1ZmZlciwgc2l6ZV90IHNpemUpCj4gPiAgICoKPiA+ICAg
KiBSZXR1cm5zIDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVy
ZS4KClByb2JhYmx5IHdhbnQgdG8gYWRqdXN0IHRoaXMgdGV4dCB0b28sIHRoZW4/CgpbSSBoYXZl
IG5vIG9waW5pb24gb24gd2hldGhlciB0aGlzIHBhdGNoIGlzIGdvb2Qgb3IgYmFkLCBqdXN0IGhh
cHBlbmVkCnRvIG5vdGljZSB0aGUgaW5jb25zaXN0ZW5jeS5dCgpDaGVlcnMsCgogIC1pbGlhCgo+
ID4gICAqLwo+ID4gLWludCBoZG1pX2F2aV9pbmZvZnJhbWVfaW5pdChzdHJ1Y3QgaGRtaV9hdmlf
aW5mb2ZyYW1lICpmcmFtZSkKPiA+ICt2b2lkIGhkbWlfYXZpX2luZm9mcmFtZV9pbml0KHN0cnVj
dCBoZG1pX2F2aV9pbmZvZnJhbWUgKmZyYW1lKQo+ID4gIHsKPiA+ICAgICAgIG1lbXNldChmcmFt
ZSwgMCwgc2l6ZW9mKCpmcmFtZSkpOwo+ID4KPiA+ICAgICAgIGZyYW1lLT50eXBlID0gSERNSV9J
TkZPRlJBTUVfVFlQRV9BVkk7Cj4gPiAgICAgICBmcmFtZS0+dmVyc2lvbiA9IDI7Cj4gPiAgICAg
ICBmcmFtZS0+bGVuZ3RoID0gSERNSV9BVklfSU5GT0ZSQU1FX1NJWkU7Cj4gPiAtCj4gPiAtICAg
ICByZXR1cm4gMDsKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZTUJPTChoZG1pX2F2aV9pbmZvZnJhbWVf
aW5pdCk7Cj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
