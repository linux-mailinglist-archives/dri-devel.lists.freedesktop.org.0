Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1700103BEA
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B8A6E5ED;
	Wed, 20 Nov 2019 13:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F316E5C8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:39:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BEB4224FA;
 Wed, 20 Nov 2019 13:39:14 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:39:11 +0800
Message-Id: <20191120133911.13539-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574257155;
 bh=Z+eZq7iwaPRpNAmDEUhF3PizbEv3Dh2gfpmI5l4V05M=;
 h=From:To:Cc:Subject:Date:From;
 b=uBE6mFT2S2HqG0fxEeNser1ycs5Wah7tXw+553v0tnVu76p1E/2bfxulblhcJm445
 M2KCMFt1flU9UnhKlPQrdxQoKu4FI3MQG9sY0sd4ylQ5GSG2YhD41hinHq2qiYUNQs
 jwxrxF4zdDduA9a0oclRRcJewaFRIEPK5flDDcgU=
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
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRqdXN0IGluZGVudGF0aW9uIGZyb20gc3BhY2VzIHRvIHRhYiAoK29wdGlvbmFsIHR3byBzcGFj
ZXMpIGFzIGluCmNvZGluZyBzdHlsZSB3aXRoIGNvbW1hbmQgbGlrZToKCSQgc2VkIC1lICdzL14g
ICAgICAgIC9cdC8nIC1pICovS2NvbmZpZwoKU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9LY29uZmln
IHwgMTIgKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9LY29uZmlnIGIv
ZHJpdmVycy9zdGFnaW5nL2ZidGZ0L0tjb25maWcKaW5kZXggZDk5NGFlYTg0YjIxLi4xOWQ5ZDg4
ZTkxNTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9LY29uZmlnCisrKyBiL2Ry
aXZlcnMvc3RhZ2luZy9mYnRmdC9LY29uZmlnCkBAIC05NSw4ICs5NSw4IEBAIGNvbmZpZyBGQl9U
RlRfUENEODU0NAogCSAgR2VuZXJpYyBGcmFtZWJ1ZmZlciBzdXBwb3J0IGZvciBQQ0Q4NTQ0CiAK
IGNvbmZpZyBGQl9URlRfUkE4ODc1Ci0gICAgICAgIHRyaXN0YXRlICJGQiBkcml2ZXIgZm9yIHRo
ZSBSQTg4NzUgTENEIENvbnRyb2xsZXIiCi0gICAgICAgIGRlcGVuZHMgb24gRkJfVEZUCisJdHJp
c3RhdGUgIkZCIGRyaXZlciBmb3IgdGhlIFJBODg3NSBMQ0QgQ29udHJvbGxlciIKKwlkZXBlbmRz
IG9uIEZCX1RGVAogCWhlbHAKIAkgIEdlbmVyaWMgRnJhbWVidWZmZXIgc3VwcG9ydCBmb3IgUkE4
ODc1CiAKQEAgLTEzMiwxMCArMTMyLDEwIEBAIGNvbmZpZyBGQl9URlRfU1NEMTI4OQogCSAgRnJh
bWVidWZmZXIgc3VwcG9ydCBmb3IgU1NEMTI4OQogCiBjb25maWcgRkJfVEZUX1NTRDEzMDUKLSAg
ICAgICAgdHJpc3RhdGUgIkZCIGRyaXZlciBmb3IgdGhlIFNTRDEzMDUgT0xFRCBDb250cm9sbGVy
IgotICAgICAgICBkZXBlbmRzIG9uIEZCX1RGVAotICAgICAgICBoZWxwCi0gICAgICAgICAgRnJh
bWVidWZmZXIgc3VwcG9ydCBmb3IgU1NEMTMwNQorCXRyaXN0YXRlICJGQiBkcml2ZXIgZm9yIHRo
ZSBTU0QxMzA1IE9MRUQgQ29udHJvbGxlciIKKwlkZXBlbmRzIG9uIEZCX1RGVAorCWhlbHAKKwkg
IEZyYW1lYnVmZmVyIHN1cHBvcnQgZm9yIFNTRDEzMDUKIAogY29uZmlnIEZCX1RGVF9TU0QxMzA2
CiAJdHJpc3RhdGUgIkZCIGRyaXZlciBmb3IgdGhlIFNTRDEzMDYgT0xFRCBDb250cm9sbGVyIgot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
