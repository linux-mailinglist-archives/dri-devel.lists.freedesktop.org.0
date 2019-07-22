Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 151F27054E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 18:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FC889349;
	Mon, 22 Jul 2019 16:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7033389349;
 Mon, 22 Jul 2019 16:21:49 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id u64so7952595vku.8;
 Mon, 22 Jul 2019 09:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uhXfKQ2lO+ZIKIlfjwL+ucNzoKOLtWXI7gWhXYnLYqg=;
 b=t6F7DIJESrG7p/lybwk/d81k6BSMdM4TcUTAWkMWBvF/My88M6oQhpEdllxwUs5LaA
 RsFBgbtNro/7KN9RCG6gcZ5iw9MxhJplOJjQESkQhf35d0YzVkbiLaeD5j33zou6VT5j
 aHdC55eV6sNSBZFKlnQiuUX/lwLNHowp5iiPgS5OFm0vmyInsPSSaxQO0behlQMinnNi
 DbLnjCBsCU/3yJ/TibxFreIQxxJBAoiCqz+hu0RjdXJEDKXY0d5w5Ph8JU1LN3ExWZGI
 gDktxlKpBdnO+b5ejstLkf2aVdgFziT41Za6bEqlvsRi/qtJMKipXOi/G1TJ3NvrVVin
 lQqQ==
X-Gm-Message-State: APjAAAXR7NPZG0n5G4ZdLPpDHbQOXP/SYjFSPmMz2f2owFr/9Y27MLK/
 v7O1Kqdlna8XPoPJhaFs+SthbqLzxClNCmteLej8XR16
X-Google-Smtp-Source: APXvYqwb1ZI4VR3blWW/Jx7zmiiI2sJ9tDIN1jNcKBsgLbrS2BOZXpi1JxbY8ikNV9j6XYnjouLOzCK07PjCUKtbyog=
X-Received: by 2002:a1f:2242:: with SMTP id i63mr25692406vki.69.1563812508500; 
 Mon, 22 Jul 2019 09:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190720084527.12593-1-sam@ravnborg.org>
 <20190720084527.12593-4-sam@ravnborg.org>
In-Reply-To: <20190720084527.12593-4-sam@ravnborg.org>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 22 Jul 2019 17:21:25 +0100
Message-ID: <CACvgo52DvcwzezNt2K4kMWESeUDE=P3VzDD9PWY-8aV7mh2UyA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/via: make via_drv.h self-contained
To: Sam Ravnborg <sam@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uhXfKQ2lO+ZIKIlfjwL+ucNzoKOLtWXI7gWhXYnLYqg=;
 b=fkKUWoetrDdz/FLtFAkHzdUbYweF+U9falgo26LIq1EKBzPBHZP4aUTlZTWpIV6Aog
 /lD74vaF1tr0vBbNKLqaLgze/xgAgVvzh/bL0E6Jhl/0J2Msc/3CjJMJIYACPq9ynC2a
 4/8yrdSkWr1xq8UxACEIy/ewEAC1JN6l0SsYkouFNS/rq9AwnxMdj0Bd43x9Sp8H/NNi
 xq1rdK50exFy/+YO+KSDek0RjsuLn7y/Ef1XUisF8DIcWZpSVoAQkSQa7g1dTB2BE7Cn
 plya8CuEiiYq8wSy2L8qyj/ROND/cBMK4q//H4k2Wj/tMkrzrxH/k8xqEUqtJZequchB
 55oQ==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 openchrome-devel@lists.freedesktop.org, Kevin Brace <kevinbrace@gmx.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>, Ira Weiny <ira.weiny@intel.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMCBKdWwgMjAxOSBhdCAwOTo0NSwgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPiB3cm90ZToKPgo+IEFkZGVkIGluY2x1ZGUgb2YgaGVhZGVyIGZpbGUgdG8gbWFrZSB0aGlz
IGhlYWRlciBmaWxlCj4gc2VsZi1jb250YWluZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IEtldmluIEJyYWNlIDxrZXZpbmJyYWNlQGdt
eC5jb20+Cj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiBD
YzogIkd1c3Rhdm8gQS4gUi4gU2lsdmEiIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgo+IENjOiBN
aWtlIE1hcnNoYWxsIDxodWJjYXBAb21uaWJvbmQuY29tPgo+IENjOiBJcmEgV2VpbnkgPGlyYS53
ZWlueUBpbnRlbC5jb20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+Cj4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gQ2M6
IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS92aWEvdmlhX2Rydi5oIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKQo+ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgoKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
