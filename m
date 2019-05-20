Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD94265F5
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C892D89B29;
	Wed, 22 May 2019 14:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id 10B9889248
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 09:23:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9499374;
 Mon, 20 May 2019 02:23:24 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3F0B3F575;
 Mon, 20 May 2019 02:23:21 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v3 0/2] drm/panfrost: drm_gem_map_offset() helper
Date: Mon, 20 May 2019 10:23:04 +0100
Message-Id: <20190520092306.27633-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
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
Cc: David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Sean Paul <sean@poorly.run>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFuZnJvc3QgaGFzIGEgcmUtaW1wbGVtZW50YXRpb24gb2YgZHJtX2dlbV9kdW1iX21hcF9vZmZz
ZXQoKSB3aXRoIGFuCmV4dHJhIGJ1ZyByZWdhcmRpbmcgdGhlIGhhbmRsaW5nIG9mIGltcG9ydGVk
IGJ1ZmZlcnMuIEhvd2V2ZXIgd2UgZG9uJ3QKcmVhbGx5IHdhbnQgUGFuZnJvc3QgY2FsbGluZyBf
ZHVtYiBmdW5jdGlvbnMgYmVjYXVzZSBpdCdzIG5vdCBhIEtNUwpkcml2ZXIuCgpUaGlzIHNlcmll
cyByZW5hbWVzIGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkgdG8gZHJvcCB0aGUgJ19kdW1iJyBh
bmQKdXBkYXRlcyBQYW5mcm9zdCB0byB1c2UgaXQgcmF0aGVyIHRoYW4gaXQncyBvd24gaW1wbGVt
ZW50YXRpb24uCgp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDUxNjE0MTQ0
Ny40NjgzOS0xLXN0ZXZlbi5wcmljZUBhcm0uY29tLwpDaGFuZ2VzIHNpbmNlIHYyOgogKiBEcm9w
IHRoZSBzaG1lbSBoZWxwZXIKCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkw
NTEzMTQzMjQ0LjE2NDc4LTEtc3RldmVuLnByaWNlQGFybS5jb20vCkNoYW5nZXMgc2luY2UgdjE6
CiAqIFJlbmFtZSBkcm1fZ2VtX2R1bWJfbWFwX29mZnNldCB0byBkcm9wIF9kdW1iCiAqIEFkZCBh
IHNobWVtIGhlbHBlcgoKU3RldmVuIFByaWNlICgyKToKICBkcm0vZ2VtOiBSZW5hbWUgZHJtX2dl
bV9kdW1iX21hcF9vZmZzZXQoKSB0byBkcm1fZ2VtX21hcF9vZmZzZXQoKQogIGRybS9wYW5mcm9z
dDogVXNlIGRybV9nZW1fc2htZW1fbWFwX29mZnNldCgpCgogZHJpdmVycy9ncHUvZHJtL2RybV9k
dW1iX2J1ZmZlcnMuYyAgICAgIHwgIDQgKystLQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyAg
ICAgICAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZ2VtLmMgfCAgMyArLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYu
YyB8IDE2ICsrLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgICAgICAg
ICAgICAgICB8ICA0ICsrLS0KIDUgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMjMg
ZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
