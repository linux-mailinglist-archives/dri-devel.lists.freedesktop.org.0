Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1EA58FB1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE33F6E86F;
	Fri, 28 Jun 2019 01:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3EF5F6E077
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:53:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C977C360;
 Thu, 27 Jun 2019 08:53:26 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 905553F246;
 Thu, 27 Jun 2019 08:53:24 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v4 0/2] drm/panfrost: drm_gem_map_offset() helper
Date: Thu, 27 Jun 2019 16:53:16 +0100
Message-Id: <20190627155318.38053-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
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
ZW50YXRpb24uCgpQcmV2aW91cyB2ZXJzaW9uczoKCnYzOiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9sa21sLzIwMTkwNTIwMDkyMzA2LjI3NjMzLTEtc3RldmVuLnByaWNlQGFybS5jb20KQ2hhbmdl
cyBzaW5jZSB2MzoKICogQWRkIGEgY29tbWVudCB0byBkcm1fZ2VtX21hcF9vZmZzZXQoKSBleHBs
YWluaW5nIHRoYXQgaXQgY2FuIGJlIHVzZWQKICAgd2l0aCBzaG1lbSBjbGllbnRzIGFzIHdlbGwg
YXMgZHVtYiBjbGllbnRzLgoKdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA1
MTYxNDE0NDcuNDY4MzktMS1zdGV2ZW4ucHJpY2VAYXJtLmNvbS8KQ2hhbmdlcyBzaW5jZSB2MjoK
ICogRHJvcCB0aGUgc2htZW0gaGVscGVyCgp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDE5MDUxMzE0MzI0NC4xNjQ3OC0xLXN0ZXZlbi5wcmljZUBhcm0uY29tLwpDaGFuZ2VzIHNp
bmNlIHYxOgogKiBSZW5hbWUgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQgdG8gZHJvcCBfZHVtYgog
KiBBZGQgYSBzaG1lbSBoZWxwZXIKClN0ZXZlbiBQcmljZSAoMik6CiAgZHJtL2dlbTogUmVuYW1l
IGRybV9nZW1fZHVtYl9tYXBfb2Zmc2V0KCkgdG8gZHJtX2dlbV9tYXBfb2Zmc2V0KCkKICBkcm0v
cGFuZnJvc3Q6IFVzZSBkcm1fZ2VtX21hcF9vZmZzZXQoKQoKIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHVtYl9idWZmZXJzLmMgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMg
ICAgICAgICAgICAgICB8ICA5ICsrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2dlbS5jIHwgIDMgKy0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZHJ2LmMgfCAxNiArKy0tLS0tLS0tLS0tLS0tCiBpbmNsdWRlL2RybS9kcm1fZ2VtLmggICAgICAg
ICAgICAgICAgICAgfCAgNCArKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDIzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
