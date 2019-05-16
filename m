Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A25214E2
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDD9898BC;
	Fri, 17 May 2019 07:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTP id C060A894C0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 14:14:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D5D51715;
 Thu, 16 May 2019 07:14:58 -0700 (PDT)
Received: from e112269-lin.arm.com (e112269-lin.cambridge.arm.com
 [10.1.196.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86ED53F71E;
 Thu, 16 May 2019 07:14:55 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 0/3] drm/panfrost: drm_gem_map_offset() helper
Date: Thu, 16 May 2019 15:14:44 +0100
Message-Id: <20190516141447.46839-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
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
bmQKaW50cm9kdWNlcyBhIHNobWVtIGhlbHBlciB0byB3cmFwIGl0LiBUaGlzIG1lYW5zIHRoYXQg
dGhlIHNobWVtCmltcGxlbWVudGF0aW9uIGNhbiBiZSBrZXB0IGluIHN5bmMgd2l0aCB0aGUgc2Vt
YW50aWNzIHRoZQpkcm1fZ2VtX3NobWVtX21tYXAoKSBjYWxsYmFjayBwcm92aWRlcy4KCnYxOiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNTEzMTQzMjQ0LjE2NDc4LTEtc3RldmVu
LnByaWNlQGFybS5jb20vCkNoYW5nZXMgc2luY2UgdjE6CiAqIFJlbmFtZSBkcm1fZ2VtX2R1bWJf
bWFwX29mZnNldCB0byBkcm9wIF9kdW1iCiAqIEFkZCBhIHNobWVtIGhlbHBlcgoKU3RldmVuIFBy
aWNlICgzKToKICBkcm0vZ2VtOiBSZW5hbWUgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoKSB0byBk
cm1fZ2VtX21hcF9vZmZzZXQoKQogIGRybTogc2htZW06IEFkZCBkcm1fZ2VtX3NobWVtX21hcF9v
ZmZzZXQoKSB3cmFwcGVyCiAgZHJtL3BhbmZyb3N0OiBVc2UgZHJtX2dlbV9zaG1lbV9tYXBfb2Zm
c2V0KCkKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVycy5jICAgICAgfCAgNCArKy0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jICAgICAgICAgICAgICAgfCAgNiArKystLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5jICB8IDIwICsrKysrKysrKysrKysr
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMgfCAgMyArLS0K
IGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYyB8IDE2ICsrLS0tLS0tLS0t
LS0tLS0KIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0K
IGluY2x1ZGUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmggICAgICB8ICAyICsrCiA3IGZpbGVz
IGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
