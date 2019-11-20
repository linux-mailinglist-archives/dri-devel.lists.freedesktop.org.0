Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7BB103BA3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1B46E998;
	Wed, 20 Nov 2019 13:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8116E998;
 Wed, 20 Nov 2019 13:36:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2249F21939;
 Wed, 20 Nov 2019 13:36:21 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:36:19 +0800
Message-Id: <20191120133619.11415-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574256983;
 bh=6BvqkSk8AIwBhUKqtp6RBtg7rVitYauvILovxIcQx8s=;
 h=From:To:Cc:Subject:Date:From;
 b=J+gKNBmppFpbzaC+DLXN2imnQ+Ix9vzshMFKKzSe67vJOqQ/+gO08NYC1qKJmwVHL
 WeqhAvh22Hh64EAiEfSU94lqEH3XB6QHNVRBa0qkn6f32SxElT5XUhBG/+809q3At6
 IfGHsNeXZbNT6/dQY0BpWsgWVLg3mRCmz/39XzwM=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25m
aWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvS2NvbmZpZwppbmRleCAzNTU4ZGYwNDM1OTIuLjljOTkwMjY2ZTg3NiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9LY29uZmlnCkBAIC0yLDcgKzIsNyBAQAogY29uZmlnIERSTV9OT1VW
RUFVCiAJdHJpc3RhdGUgIk5vdXZlYXUgKE5WSURJQSkgY2FyZHMiCiAJZGVwZW5kcyBvbiBEUk0g
JiYgUENJICYmIE1NVQotICAgICAgICBzZWxlY3QgRldfTE9BREVSCisJc2VsZWN0IEZXX0xPQURF
UgogCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBEUk1fVFRNCiAJc2VsZWN0IEJBQ0tM
SUdIVF9DTEFTU19ERVZJQ0UgaWYgRFJNX05PVVZFQVVfQkFDS0xJR0hUCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
