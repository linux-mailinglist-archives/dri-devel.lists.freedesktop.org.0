Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3F15643A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FFC06E30B;
	Wed, 26 Jun 2019 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FB66E0B7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:46:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 9C04B2607B5
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: 
Subject: [PATCH 0/2] Associate ddc adapters with connectors
Date: Tue, 25 Jun 2019 11:46:34 +0200
Message-Id: <cover.1561452052.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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
Cc: linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgZGlmZmljdWx0IGZvciBhIHVzZXIgdG8ga25vdyB3aGljaCBvZiB0aGUgaTJjIGFkYXB0
ZXJzIGlzIGZvciB3aGljaApkcm0gY29ubmVjdG9yLiBUaGlzIHNlcmllcyBhZGRyZXNzZXMgdGhp
cyBwcm9ibGVtLgoKVGhlIGlkZWEgaXMgdG8gaGF2ZSBhIHN5bWJvbGljIGxpbmsgaW4gY29ubmVj
dG9yJ3Mgc3lzZnMgZGlyZWN0b3J5LCBlLmcuOgoKbHMgLWwgL3N5cy9jbGFzcy9kcm0vY2FyZDAt
SERNSS1BLTEvaTJjLTIKbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lz
L2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9pMmMtMiBcCgktPiAuLi8uLi8uLi8uLi9zb2MvMTM4
ODAwMDAuaTJjL2kyYy0yCgpUaGUgdXNlciB0aGVuIGtub3dzIHRoYXQgdGhlaXIgY2FyZDAtSERN
SS1BLTEgdXNlcyBpMmMtMiBhbmQgY2FuIGUuZy4gcnVuCmRkY3V0aWw6CgpkZGN1dGlsIC1iIDIg
Z2V0dmNwIDB4MTAKVkNQIGNvZGUgMHgxMCAoQnJpZ2h0bmVzcyAgICAgICAgICAgICAgICAgICAg
KTogY3VycmVudCB2YWx1ZSA9ICAgIDkwLCBtYXggdmFsdWUgPSAgIDEwMAoKVGhlIGZpcnN0IHBh
dGNoIGluIHRoZSBzZXJpZXMgYWRkcyBzdHJ1Y3QgaTJjX2FkYXB0ZXIgcG9pbnRlciB0byBzdHJ1
Y3QKZHJtX2Nvbm5lY3Rvci4gSWYgdGhlIGZpZWxkIGlzIHVzZWQgYnkgYSBwYXJ0aWN1bGFyIGRy
aXZlciwgdGhlbiBhbgphcHByb3ByaWF0ZSBzeW1ib2xpYyBsaW5rIGlzIGNyZWF0ZWQgYnkgdGhl
IGdlbmVyaWMgY29kZSwgd2hpY2ggaXMgYWxzbyBhZGRlZApieSB0aGlzIHBhdGNoLgoKVGhlIHNl
Y29uZCBwYXRjaCBpcyBhbiBleGFtcGxlIG9mIGhvdyB0byBjb252ZXJ0IGEgZHJpdmVyIHRvIHRo
aXMgbmV3IHNjaGVtZS4KCkFuZHJ6ZWogUGlldHJhc2lld2ljeiAoMik6CiAgZHJtOiBJbmNsdWRl
IGRkYyBhZGFwdGVyIHBvaW50ZXIgaW4gc3RydWN0IGRybV9jb25uZWN0b3IKICBkcm0vZXh5bm9z
OiBQcm92aWRlIGRkYyBzeW1saW5rIGluIGNvbm5lY3RvcidzIHN5c2ZzCgogZHJpdmVycy9ncHUv
ZHJtL2RybV9zeXNmcy5jICAgICAgICAgIHwgIDkgKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19oZG1pLmMgfCAxMSArKysrKy0tLS0tLQogaW5jbHVkZS9kcm0vZHJtX2Nv
bm5lY3Rvci5oICAgICAgICAgIHwgMTEgKysrKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
