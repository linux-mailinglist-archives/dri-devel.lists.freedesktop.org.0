Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7982103B89
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:33:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 761816E965;
	Wed, 20 Nov 2019 13:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2DB6E965
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:33:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87976219FA;
 Wed, 20 Nov 2019 13:33:51 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:33:48 +0800
Message-Id: <20191120133348.6640-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574256833;
 bh=I2ItxMWjRTEwYmAhHosn5S3+pzi92xqBKTYGklWPoUI=;
 h=From:To:Cc:Subject:Date:From;
 b=DXLsXb1V6t+zEdcUm0IV+EcRRH5mN6kgkgu5xpppSYvdEfjEDweqKnvvNe2Jq1PgL
 UyiNDWj3EFBVqrvpPkA5X0jWyW2Zc8pS0qkrN+NMx7QBl5WukUMYSnzLE2Q9kSWchf
 3sk5RnjK+QqRXtVk5CA8HYUnBzW9Z8m4aAOz0tQ4=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29u
ZmlnIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2NvbmZpZyBi
L2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9LY29uZmlnCmluZGV4IDZmNDIyMmY4YmVlYi4uMTY3
MGE1Y2FlM2M3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2NvbmZpZwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvS2NvbmZpZwpAQCAtMjgsMTcgKzI4LDE3IEBA
IGNvbmZpZyBST0NLQ0hJUF9BTkFMT0dJWF9EUAogCSAgb24gUkszMjg4IG9yIFJLMzM5OSBiYXNl
ZCBTb0MsIHlvdSBzaG91bGQgc2VsZWN0IHRoaXMgb3B0aW9uLgogCiBjb25maWcgUk9DS0NISVBf
Q0ROX0RQCi0gICAgICAgIGJvb2wgIlJvY2tjaGlwIGNkbiBEUCIKKwlib29sICJSb2NrY2hpcCBj
ZG4gRFAiCiAJZGVwZW5kcyBvbiBFWFRDT049eSB8fCAoRVhUQ09OPW0gJiYgRFJNX1JPQ0tDSElQ
PW0pCi0gICAgICAgIGhlbHAKKwloZWxwCiAJICBUaGlzIHNlbGVjdHMgc3VwcG9ydCBmb3IgUm9j
a2NoaXAgU29DIHNwZWNpZmljIGV4dGVuc2lvbnMKIAkgIGZvciB0aGUgY2RuIERQIGRyaXZlci4g
SWYgeW91IHdhbnQgdG8gZW5hYmxlIERwIG9uCiAJICBSSzMzOTkgYmFzZWQgU29DLCB5b3Ugc2hv
dWxkIHNlbGVjdCB0aGlzCiAJICBvcHRpb24uCiAKIGNvbmZpZyBST0NLQ0hJUF9EV19IRE1JCi0g
ICAgICAgIGJvb2wgIlJvY2tjaGlwIHNwZWNpZmljIGV4dGVuc2lvbnMgZm9yIFN5bm9wc3lzIERX
IEhETUkiCi0gICAgICAgIGhlbHAKKwlib29sICJSb2NrY2hpcCBzcGVjaWZpYyBleHRlbnNpb25z
IGZvciBTeW5vcHN5cyBEVyBIRE1JIgorCWhlbHAKIAkgIFRoaXMgc2VsZWN0cyBzdXBwb3J0IGZv
ciBSb2NrY2hpcCBTb0Mgc3BlY2lmaWMgZXh0ZW5zaW9ucwogCSAgZm9yIHRoZSBTeW5vcHN5cyBE
ZXNpZ25XYXJlIEhETUkgZHJpdmVyLiBJZiB5b3Ugd2FudCB0bwogCSAgZW5hYmxlIEhETUkgb24g
UkszMjg4IG9yIFJLMzM5OSBiYXNlZCBTb0MsIHlvdSBzaG91bGQgc2VsZWN0Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
