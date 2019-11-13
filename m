Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 548ABFA0B8
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 02:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D8B6EC48;
	Wed, 13 Nov 2019 01:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AB06EC48;
 Wed, 13 Nov 2019 01:52:16 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 854452245D;
 Wed, 13 Nov 2019 01:52:15 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 079/209] msm/gpu/a6xx: Force of_dma_configure to
 setup DMA for GMU
Date: Tue, 12 Nov 2019 20:48:15 -0500
Message-Id: <20191113015025.9685-79-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015025.9685-1-sashal@kernel.org>
References: <20191113015025.9685-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573609936;
 bh=GnLDcU3GQlLVz86X48Q6AD2uliaNpA6HTGkKvjNyt+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gB9HJpqDdkNOgBy9jkUEw3G8Uoic4x+ZlNqZeANFoioZBIcevSajfY53pkB9pqHlE
 G4y7P+l8oZGIlTvZ75klbgKlyNL42lyycOmeJiAgFu3Giy8JeQNk/3K0PwF1UVw+Mo
 fyz74bCE1NQ4P0SHyThVlA8qzaC/A6mAbXROuXpc=
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
Cc: Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sibi Sankar <sibis@codeaurora.org>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KClsgVXBzdHJlYW0g
Y29tbWl0IDMyYWEyN2UxNWMyOGQzODk4ZWQ2ZjliM2M5OGY5NWYzNGE4MWVhYjIgXQoKVGhlIHBv
aW50IG9mIHRoZSAnZm9yY2VfZG1hJyBwYXJhbWV0ZXIgZm9yIG9mX2RtYV9jb25maWd1cmUKaXMg
dG8gZm9yY2UgdGhlIGRldmljZSB0byBiZSBzZXQgdXAgZXZlbiBpZiBETUEgY2FwYWJpbGl0eSBp
cwpub3QgZGVzY3JpYmVkIGJ5IHRoZSBmaXJtd2FyZSB3aGljaCBpcyBleGFjdGx5IHRoZSB1c2Ug
Y2FzZQogd2UgaGF2ZSBmb3IgR01VIC0gd2UgbmVlZCBTTU1VIHRvIGdldCBzZXQgdXAgYnV0IHdl
IGhhdmUgbm8Kb3RoZXIgZG1hIGNhcGFiaWxpdGllcyBzaW5jZSBtZW1vcnkgaXMgbWFuYWdlZCBi
eSB0aGUgR1BVCmRyaXZlci4gQ3VycmVudGx5IHdlIHBhc3MgZmFsc2Ugc28gb2ZfZG1hX2NvbmZp
Z3VyZSgpIGZhaWxzCmFuZCBzdWJzZXF1ZW50bHkgR01VIGFuZCBHUFUgcHJvYmUgZG9lcyBhcyB3
ZWxsLgoKRml4ZXM6IDRiNTY1Y2E1YTJjICgiZHJtL21zbTogQWRkIEE2WFggZGV2aWNlIHN1cHBv
cnQiKQpTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3Jn
PgpUZXN0ZWQtYnk6IFNpYmkgU2Fua2FyIDxzaWJpc0Bjb2RlYXVyb3JhLm9yZz4KU2lnbmVkLW9m
Zi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNo
YSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYTZ4eF9nbXUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhf
Z211LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCmluZGV4IDlhY2I5
ZGZhZjU3ZTYuLjljZGU3OWE3MzM1YzggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E2eHhfZ211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
bXUuYwpAQCAtMTE0MCw3ICsxMTQwLDcgQEAgaW50IGE2eHhfZ211X3Byb2JlKHN0cnVjdCBhNnh4
X2dwdSAqYTZ4eF9ncHUsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKIAogCWdtdS0+ZGV2ID0g
JnBkZXYtPmRldjsKIAotCW9mX2RtYV9jb25maWd1cmUoZ211LT5kZXYsIG5vZGUsIGZhbHNlKTsK
KwlvZl9kbWFfY29uZmlndXJlKGdtdS0+ZGV2LCBub2RlLCB0cnVlKTsKIAogCS8qIEZvdyBub3cs
IGRvbid0IGRvIGFueXRoaW5nIGZhbmN5IHVudGlsIHdlIGdldCBvdXIgZmVldCB1bmRlciB1cyAq
LwogCWdtdS0+aWRsZV9sZXZlbCA9IEdNVV9JRExFX1NUQVRFX0FDVElWRTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
