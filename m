Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259BF105308
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 14:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FC56EE63;
	Thu, 21 Nov 2019 13:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9816EE63
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 13:29:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78A5A2070B;
 Thu, 21 Nov 2019 13:29:27 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sun4i: Fix Kconfig indentation
Date: Thu, 21 Nov 2019 21:29:24 +0800
Message-Id: <20191121132924.29485-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574342969;
 bh=yyXJzn+XyQztYsAFDd+jIydz3QhsmNmW5iErSayP8O0=;
 h=From:To:Cc:Subject:Date:From;
 b=vtPUseQuJskD7wyazERwtvJ8t1Sms7TRZTBm5ohv8JJ8fsTsXV88KKk53IZf0rgBe
 9pqHaek7jcNnWod6esgscEZ5OPINcLL6NgBnXRaDYZtO/ghn6gpIi/3YmF7LvqSOLs
 Du1HBnToU+wvA3Ho4ToPB/3auWhW1t7vz0InSOXE=
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
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9LY29uZmln
IHwgMTYgKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvS2NvbmZp
ZyBiL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9LY29uZmlnCmluZGV4IDM3ZTkwZTQyOTQzZi4uNTc1
NWYwNDMyZTc3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvS2NvbmZpZworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvS2NvbmZpZwpAQCAtMTcsMTggKzE3LDE4IEBAIGNvbmZp
ZyBEUk1fU1VONEkKIGlmIERSTV9TVU40SQogCiBjb25maWcgRFJNX1NVTjRJX0hETUkKLSAgICAg
ICB0cmlzdGF0ZSAiQWxsd2lubmVyIEExMCBIRE1JIENvbnRyb2xsZXIgU3VwcG9ydCIKLSAgICAg
ICBkZWZhdWx0IERSTV9TVU40SQotICAgICAgIGhlbHAKKwl0cmlzdGF0ZSAiQWxsd2lubmVyIEEx
MCBIRE1JIENvbnRyb2xsZXIgU3VwcG9ydCIKKwlkZWZhdWx0IERSTV9TVU40SQorCWhlbHAKIAkg
IENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhbiBBbGx3aW5uZXIgU29DIHdpdGggYW4g
SERNSQogCSAgY29udHJvbGxlci4KIAogY29uZmlnIERSTV9TVU40SV9IRE1JX0NFQwotICAgICAg
IGJvb2wgIkFsbHdpbm5lciBBMTAgSERNSSBDRUMgU3VwcG9ydCIKLSAgICAgICBkZXBlbmRzIG9u
IERSTV9TVU40SV9IRE1JCi0gICAgICAgc2VsZWN0IENFQ19DT1JFCi0gICAgICAgc2VsZWN0IENF
Q19QSU4KLSAgICAgICBoZWxwCisJYm9vbCAiQWxsd2lubmVyIEExMCBIRE1JIENFQyBTdXBwb3J0
IgorCWRlcGVuZHMgb24gRFJNX1NVTjRJX0hETUkKKwlzZWxlY3QgQ0VDX0NPUkUKKwlzZWxlY3Qg
Q0VDX1BJTgorCWhlbHAKIAkgIENob29zZSB0aGlzIG9wdGlvbiBpZiB5b3UgaGF2ZSBhbiBBbGx3
aW5uZXIgU29DIHdpdGggYW4gSERNSQogCSAgY29udHJvbGxlciBhbmQgd2FudCB0byB1c2UgQ0VD
LgogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
