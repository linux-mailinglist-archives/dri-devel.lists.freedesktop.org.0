Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D81A54E0
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 01:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0F96E359;
	Sat, 11 Apr 2020 23:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5496E358
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Apr 2020 23:08:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EF6A20708;
 Sat, 11 Apr 2020 23:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586646500;
 bh=HTk2LAY6m/2PMyKiWa3R+YV94N6VTF94/lp0Bd3u8mQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=epjX8Tu8mE9rd0C9egezR8ANqYz/pJ50ZP1J3WwjvjrcEY0XepXP00I5V/TXTo2vQ
 jGX6ZgIRZXut82Y259429UsT4lQo9aa8YV3wacNCGiVap/wCfRKDGgY37D8Qah91zw
 Pr2zX6db6+ofV2o9zh4YmRdkPy6+B83rl6DbNj0Q=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 061/121] drm/crc: Actually allow to change the crc
 source
Date: Sat, 11 Apr 2020 19:06:06 -0400
Message-Id: <20200411230706.23855-61-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200411230706.23855-1-sashal@kernel.org>
References: <20200411230706.23855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClsgVXBzdHJlYW0g
Y29tbWl0IDNjYjZkOGU1Y2Y5ODExYTYyZTI3ZjM2NmZkMWMwNWY5MDMxMGE4ZmQgXQoKT29wcy4K
CkZpeGVzOiA5ZWRiZjFmYTYwMGEgKCJkcm06IEFkZCBBUEkgZm9yIGNhcHR1cmluZyBmcmFtZSBD
UkNzIikKQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+CkNjOiBF
bWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgpDYzogQmVuamFtaW4gR2Fp
Z25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KTGluazogaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwODIxMjAzODM1LjE4MzE0LTEt
ZGFuaWVsLnZldHRlckBmZndsbC5jaApTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9kZWJ1Z2ZzX2NyYy5jCmluZGV4IDJlY2UyOTU3ZGExYWYuLjZiMjBkYTI3OWJjN2YgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKQEAgLTM2Nyw3ICszNjcsNyBAQCB2b2lkIGRybV9k
ZWJ1Z2ZzX2NydGNfY3JjX2FkZChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAKIAljcmNfZW50ID0g
ZGVidWdmc19jcmVhdGVfZGlyKCJjcmMiLCBjcnRjLT5kZWJ1Z2ZzX2VudHJ5KTsKIAotCWRlYnVn
ZnNfY3JlYXRlX2ZpbGUoImNvbnRyb2wiLCBTX0lSVUdPLCBjcmNfZW50LCBjcnRjLAorCWRlYnVn
ZnNfY3JlYXRlX2ZpbGUoImNvbnRyb2wiLCBTX0lSVUdPIHwgU19JV1VTUiwgY3JjX2VudCwgY3J0
YywKIAkJCSAgICAmZHJtX2NydGNfY3JjX2NvbnRyb2xfZm9wcyk7CiAJZGVidWdmc19jcmVhdGVf
ZmlsZSgiZGF0YSIsIFNfSVJVR08sIGNyY19lbnQsIGNydGMsCiAJCQkgICAgJmRybV9jcnRjX2Ny
Y19kYXRhX2ZvcHMpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
