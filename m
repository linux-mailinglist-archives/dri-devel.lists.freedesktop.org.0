Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDB3A6E3C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494BA89786;
	Tue,  3 Sep 2019 16:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C598689755;
 Tue,  3 Sep 2019 16:25:50 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6E4D23697;
 Tue,  3 Sep 2019 16:25:49 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 017/167] drm/i915: Rename
 PLANE_CTL_DECOMPRESSION_ENABLE
Date: Tue,  3 Sep 2019 12:22:49 -0400
Message-Id: <20190903162519.7136-17-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527950;
 bh=3HZcg6Wa9KHkOEdnpkOwcP6R0/P6zfM1cCkAiJLfuVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KryyxzS6sCfmWJzps3F/DvOnbU+2LhntOudlxb2vJNc0a3Zuzsfy66F81WxNkNErO
 FDiHzUEiDHi5UP55layqjllxKSLRafw9YAiyii0iNjoePXqfjNFq0m5B371Wk4H7vs
 lrIpZDKeYVIfkRW7mEjdkmVDNpyhkLb1OuHrhOyQ=
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
Cc: Sasha Levin <sashal@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+
CgpbIFVwc3RyZWFtIGNvbW1pdCA1Mzg2N2I0NmZhODQ0MzcxM2IzYWVlNTIwZDZjYTU1OGIyMjJk
ODI5IF0KClJlbmFtZSBQTEFORV9DVExfREVDT01QUkVTU0lPTl9FTkFCTEUgdG8gcmVzZW1ibGUg
dGhlIGJwc2VjIG5hbWUgLQpQTEFORV9DVExfUkVOREVSX0RFQ09NUFJFU1NJT05fRU5BQkxFCgpT
dWdnZXN0ZWQtYnk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KQ2M6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IERoaW5h
a2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpSZXZpZXdlZC1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KTGluazog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTgwODIyMDE1
MDUzLjE0MjAtMi1kaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbQpTaWduZWQtb2ZmLWJ5OiBT
YXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9yZWcuaCAgICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxh
eS5jIHwgOCArKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgKaW5kZXggMTZmNWQyZDkzODAxNC4uNGUw
NzBhZmIyNzM4YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5oCkBAIC02NTMxLDcgKzY1MzEsNyBA
QCBlbnVtIHsKICNkZWZpbmUgICBQTEFORV9DVExfWVVWNDIyX1VZVlkJCQkoMSA8PCAxNikKICNk
ZWZpbmUgICBQTEFORV9DVExfWVVWNDIyX1lWWVUJCQkoMiA8PCAxNikKICNkZWZpbmUgICBQTEFO
RV9DVExfWVVWNDIyX1ZZVVkJCQkoMyA8PCAxNikKLSNkZWZpbmUgICBQTEFORV9DVExfREVDT01Q
UkVTU0lPTl9FTkFCTEUJKDEgPDwgMTUpCisjZGVmaW5lICAgUExBTkVfQ1RMX1JFTkRFUl9ERUNP
TVBSRVNTSU9OX0VOQUJMRQkoMSA8PCAxNSkKICNkZWZpbmUgICBQTEFORV9DVExfVFJJQ0tMRV9G
RUVEX0RJU0FCTEUJKDEgPDwgMTQpCiAjZGVmaW5lICAgUExBTkVfQ1RMX1BMQU5FX0dBTU1BX0RJ
U0FCTEUJCSgxIDw8IDEzKSAvKiBQcmUtR0xLICovCiAjZGVmaW5lICAgUExBTkVfQ1RMX1RJTEVE
X01BU0sJCQkoMHg3IDw8IDEwKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jCmluZGV4
IDNiZDQ0ZDA0MmExZDkuLmY1MzY3YmRjMDQwNDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9k
aXNwbGF5LmMKQEAgLTM1NjEsMTEgKzM1NjEsMTEgQEAgc3RhdGljIHUzMiBza2xfcGxhbmVfY3Rs
X3RpbGluZyh1aW50NjRfdCBmYl9tb2RpZmllcikKIAljYXNlIEk5MTVfRk9STUFUX01PRF9ZX1RJ
TEVEOgogCQlyZXR1cm4gUExBTkVfQ1RMX1RJTEVEX1k7CiAJY2FzZSBJOTE1X0ZPUk1BVF9NT0Rf
WV9USUxFRF9DQ1M6Ci0JCXJldHVybiBQTEFORV9DVExfVElMRURfWSB8IFBMQU5FX0NUTF9ERUNP
TVBSRVNTSU9OX0VOQUJMRTsKKwkJcmV0dXJuIFBMQU5FX0NUTF9USUxFRF9ZIHwgUExBTkVfQ1RM
X1JFTkRFUl9ERUNPTVBSRVNTSU9OX0VOQUJMRTsKIAljYXNlIEk5MTVfRk9STUFUX01PRF9ZZl9U
SUxFRDoKIAkJcmV0dXJuIFBMQU5FX0NUTF9USUxFRF9ZRjsKIAljYXNlIEk5MTVfRk9STUFUX01P
RF9ZZl9USUxFRF9DQ1M6Ci0JCXJldHVybiBQTEFORV9DVExfVElMRURfWUYgfCBQTEFORV9DVExf
REVDT01QUkVTU0lPTl9FTkFCTEU7CisJCXJldHVybiBQTEFORV9DVExfVElMRURfWUYgfCBQTEFO
RV9DVExfUkVOREVSX0RFQ09NUFJFU1NJT05fRU5BQkxFOwogCWRlZmF1bHQ6CiAJCU1JU1NJTkdf
Q0FTRShmYl9tb2RpZmllcik7CiAJfQpAQCAtODgxMiwxMyArODgxMiwxMyBAQCBza3lsYWtlX2dl
dF9pbml0aWFsX3BsYW5lX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfY3J0YyAqY3J0YywKIAkJZmItPm1v
ZGlmaWVyID0gSTkxNV9GT1JNQVRfTU9EX1hfVElMRUQ7CiAJCWJyZWFrOwogCWNhc2UgUExBTkVf
Q1RMX1RJTEVEX1k6Ci0JCWlmICh2YWwgJiBQTEFORV9DVExfREVDT01QUkVTU0lPTl9FTkFCTEUp
CisJCWlmICh2YWwgJiBQTEFORV9DVExfUkVOREVSX0RFQ09NUFJFU1NJT05fRU5BQkxFKQogCQkJ
ZmItPm1vZGlmaWVyID0gSTkxNV9GT1JNQVRfTU9EX1lfVElMRURfQ0NTOwogCQllbHNlCiAJCQlm
Yi0+bW9kaWZpZXIgPSBJOTE1X0ZPUk1BVF9NT0RfWV9USUxFRDsKIAkJYnJlYWs7CiAJY2FzZSBQ
TEFORV9DVExfVElMRURfWUY6Ci0JCWlmICh2YWwgJiBQTEFORV9DVExfREVDT01QUkVTU0lPTl9F
TkFCTEUpCisJCWlmICh2YWwgJiBQTEFORV9DVExfUkVOREVSX0RFQ09NUFJFU1NJT05fRU5BQkxF
KQogCQkJZmItPm1vZGlmaWVyID0gSTkxNV9GT1JNQVRfTU9EX1lmX1RJTEVEX0NDUzsKIAkJZWxz
ZQogCQkJZmItPm1vZGlmaWVyID0gSTkxNV9GT1JNQVRfTU9EX1lmX1RJTEVEOwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
