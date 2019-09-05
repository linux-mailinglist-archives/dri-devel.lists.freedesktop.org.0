Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38881AB2C6
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 09:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5CAB6E175;
	Fri,  6 Sep 2019 07:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843216E044
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:18:01 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id t11so1547525plo.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2019 09:18:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mukYH+OPB5B2Q8cIXti1kEopT3yxftlik4aW1yItWl0=;
 b=YD0/h3f2xB/Rck6EnWnVYLITfuQerrLmBCbbcTY50944ONKt0r6Aavo5KDsNH5xwDH
 hXwTSxMkN4oyKMx0qlOTlAER/gWEejoLBPuiAP6QOj5dsT6f/f7tNxCIF3j1YAAzS5lz
 7b2Ovl051M9iYgS0i3F7SgDrHt9590QUS7HcIL31L9Y3EMhWWnB70u+t38enr2fzRvyz
 JkqbBeIkJCYivoDXzgYBmUPnM/6XzeMB3h1c1FcA7B3yu0CFQSBrZB8KYCuB1qbOkaxi
 2Ntsfy6PhNt+GdUku7ysp8nrviZY8jFn9Q6yF8oCzV9K29G940XaJePR6rnvhLzLAfHS
 uBiA==
X-Gm-Message-State: APjAAAXDWfW7l03tsyzYVZx7GHBivvfpOMUW5l2/A9gTKtfW1eyfy78p
 FTycckhJWNKpZ3aNugThp3Hz1g==
X-Google-Smtp-Source: APXvYqzStzXxTWL+1VFEsqINN1zYVOMyUuv7eD3n8K9EXYt6eOChXB640bT4MB9P7QjeXftsWyVKSw==
X-Received: by 2002:a17:902:b583:: with SMTP id
 a3mr4258322pls.52.1567700281066; 
 Thu, 05 Sep 2019 09:18:01 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net.
 [68.147.8.254])
 by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.17.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 09:18:00 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: stable@vger.kernel.org
Subject: [BACKPORT 4.14.y 00/18] Backport candidate from TI 4.14 product
 kernel 
Date: Thu,  5 Sep 2019 10:17:41 -0600
Message-Id: <20190905161759.28036-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 06 Sep 2019 07:01:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=mukYH+OPB5B2Q8cIXti1kEopT3yxftlik4aW1yItWl0=;
 b=Kl4bnPESFCY769er88olLvIMydPIt7MSvRLFnbrMUBFJe2XGXC8oNJ+eB44CxUq8Z8
 icVfI4Z7Zv2fzyYYpmgSfOeLpo80hrioId35SGiSFn9P8y2EAYTnu2zhJFWW2+ZCCuVB
 Acsg/wxujlaWpromsOPO/XEkL8skQ8K6nxVzl/UgdDGnWguc6yvHxK/Wv797MeTMZZKg
 uTS6IS/ihZs3WKvkhpct4BSG3iQljiRqCPgkcGGvlkMO9io8/jgOGOyYiaq1v5JzqePy
 StJEuicwLxbARj/KoZGqt30jsFFl3ji38xfmmhdmOvICWnSF2ih5SFi0lKIRKtupViAc
 aAVw==
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
Cc: linux-pm@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgcGF0Y2hlcyBhcmUgYmFja3BvcnQgY2FuZGlkYXRlcyBwaWNrZWQgb3V0IG9mIFRJJ3Mg
NC4xNC55IHRyZWUgWzFdLAp3aXRoIG1vc3Qgb2YgdGhlbSBhbHJlYWR5IGZvdW5kIGluIHRoZSA0
LjE5Lnkgc3RhYmxlIHRyZWUuCgpUaGUgc2V0IGFwcGx5IGFuZCBjb21waWxlcyBjbGVhbmx5IG9u
IDQuMTQuMTQxLgoKVGhhbmtzLApNYXRoaWV1CgoKWzFdLiBodHRwOi8vZ2l0LnRpLmNvbS9naXR3
ZWIvP3A9dGktbGludXgta2VybmVsL3RpLWxpbnV4LWtlcm5lbC5naXQ7YT1zaG9ydGxvZztoPXJl
ZnMvaGVhZHMvdGktbGludXgtNC4xNC55CgpBbmRyZXcgRi4gRGF2aXMgKDEpOgogIEFTb0M6IHRs
djMyMGFpYzMxeHg6IEhhbmRsZSBpbnZlcnRlZCBCQ0xLIGluIG5vbi1EU1AgbW9kZXMKCkFydmlu
ZCBZYWRhdiAoMSk6CiAgQVNvQzogZGF2aW5jaS1tY2FzcDogSGFuZGxlIHJldHVybiB2YWx1ZSBv
ZiBkZXZtX2thc3ByaW50ZgoKQ2hyaXN0b3BoZSBKYWlsbGV0ICgxKToKICBBU29DOiBkYXZpbmNp
LW1jYXNwOiBGaXggYW4gZXJyb3IgaGFuZGxpbmcgcGF0aCBpbgogICAgJ2RhdmluY2lfbWNhc3Bf
cHJvYmUoKScKCkNsYXVkaW8gRm9lbGxtaSAoMSk6CiAgaTJjOiBvbWFwOiBUcmlnZ2VyIGJ1cyBy
ZWNvdmVyeSBpbiBsb2NrdXAgY2FzZQoKRGFuIENhcnBlbnRlciAoMSk6CiAgbWlzYzogcGNpX2Vu
ZHBvaW50X3Rlc3Q6IFByZXZlbnQgc29tZSBpbnRlZ2VyIG92ZXJmbG93cwoKR3VzdGF2byBBLiBS
LiBTaWx2YSAoMSk6CiAgQVNvQzogdGx2MzIwZGFjMzF4eDogbWFyayBleHBlY3RlZCBzd2l0Y2gg
ZmFsbC10aHJvdWdoCgpLZWVydGh5ICgyKToKICBtZmQ6IHBhbG1hczogQXNzaWduIHRoZSByaWdo
dCBwb3dlcmhvbGQgbWFzayBmb3IgdHBzNjU5MTcKICBQQ0k6IGRyYTd4eDogQWRkIHNodXRkb3du
IGhhbmRsZXIgdG8gY2xlYW5seSB0dXJuIG9mZiBjbG9ja3MKCktpc2hvbiBWaWpheSBBYnJhaGFt
IEkgKDEpOgogIG1pc2M6IHBjaV9lbmRwb2ludF90ZXN0OiBGaXggQlVHX09OIGVycm9yIGR1cmlu
ZyBwY2lfZGlzYWJsZV9tc2koKQoKTmlrbGFzIENhc3NlbCAoMSk6CiAgUENJOiBkZXNpZ253YXJl
LWVwOiBGaXggZmluZF9maXJzdF96ZXJvX2JpdCgpIHVzYWdlCgpSb2dlciBRdWFkcm9zICgxKToK
ICB1c2I6IGR3YzM6IEFsbG93IGRpc2FibGluZyBvZiBtZXRhc3RhYmlsaXR5IHdvcmthcm91bmQK
ClJvbWFuIFllcnlvbWluICgxKToKICBtdGQ6IHNwaS1ub3I6IGVuYWJsZSA0QiBvcGNvZGVzIGZv
ciBteDY2bDUxMjM1bAoKU3VkZWVwIEhvbGxhICgxKToKICBtYWlsYm94OiByZXNldCB0eGRvbmVf
bWV0aG9kIFRYRE9ORV9CWV9QT0xMIGlmIGNsaWVudCBrbm93c190eGRvbmUKClRha2FzaGkgSXdh
aSAoMSk6CiAgQVNvQzogZGF2aW5jaTogS2lsbCBCVUdfT04oKSB1c2FnZQoKVG9ueSBMaW5kZ3Jl
biAoMSk6CiAgZHJtL29tYXA6IHBhbmVsLWRzaS1jbTogZml4IGRyaXZlcgoKVmlnbmVzaCBSICgy
KToKICBQQ0k6IGRyYTd4eDogRml4IGxlZ2FjeSBJTlREIElSUSBoYW5kbGluZwogIG10ZDogc3Bp
LW5vcjogY2FkZW5jZS1xdWFkc3BpOiBhZGQgYSBkZWxheSBpbiB3cml0ZSBzZXF1ZW5jZQoKWnVt
ZW5nIENoZW4gKDEpOgogIGNwdWZyZXE6IHRpLWNwdWZyZXE6IGFkZCBtaXNzaW5nIG9mX25vZGVf
cHV0KCkKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMy50eHQgICAgICAgICAgfCAg
MiArCiBkcml2ZXJzL2NwdWZyZXEvdGktY3B1ZnJlcS5jICAgICAgICAgICAgICAgICAgfCAgMSAr
CiAuLi4vZ3B1L2RybS9vbWFwZHJtL2Rpc3BsYXlzL3BhbmVsLWRzaS1jbS5jICAgfCA1NiArKysr
KysrKysrKysrKysrKy0tCiBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW9tYXAuYyAgICAgICAgICAg
ICAgICAgfCAyNSArKysrKysrKy0KIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LmMgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21haWxib3gvcGNjLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNCArLQogZHJpdmVycy9tZmQvcGFsbWFzLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTAgKysrLQogZHJpdmVycy9taXNjL3BjaV9lbmRwb2ludF90ZXN0LmMgICAgICAg
ICAgICAgIHwgMTcgKysrKysrCiBkcml2ZXJzL210ZC9zcGktbm9yL2NhZGVuY2UtcXVhZHNwaS5j
ICAgICAgICAgfCAyNyArKysrKysrKy0KIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jICAg
ICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3BjaS9kd2MvcGNpLWRyYTd4eC5jICAgICAg
ICAgICAgICAgICAgfCAyMCArKysrKystCiBkcml2ZXJzL3BjaS9kd2MvcGNpZS1kZXNpZ253YXJl
LWVwLmMgICAgICAgICAgfCAzNCArKysrKysrKy0tLQogZHJpdmVycy9wY2kvZHdjL3BjaWUtZGVz
aWdud2FyZS5oICAgICAgICAgICAgIHwgIDggKystCiBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMyArCiBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMyArCiBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jICAgICAg
ICAgICAgICAgICAgICAgfCAgNiArLQogaW5jbHVkZS9saW51eC9tZmQvcGFsbWFzLmggICAgICAg
ICAgICAgICAgICAgIHwgIDMgKwogc291bmQvc29jL2NvZGVjcy90bHYzMjBhaWMzMXh4LmMgICAg
ICAgICAgICAgIHwgMzAgKysrKysrLS0tLQogc291bmQvc29jL2RhdmluY2kvZGF2aW5jaS1tY2Fz
cC5jICAgICAgICAgICAgIHwgMjEgKysrKysrLQogMTkgZmlsZXMgY2hhbmdlZCwgMjM1IGluc2Vy
dGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
