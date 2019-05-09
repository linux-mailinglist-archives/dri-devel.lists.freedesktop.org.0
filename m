Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3538018610
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8087789B9A;
	Thu,  9 May 2019 07:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F39899C7;
 Thu,  9 May 2019 02:04:09 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id EB91C45025;
 Thu,  9 May 2019 02:04:08 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org
Subject: [PATCH v2 3/6] ARM: qcom_defconfig: add display-related options
Date: Wed,  8 May 2019 22:03:49 -0400
Message-Id: <20190509020352.14282-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509020352.14282-1-masneyb@onstation.org>
References: <20190509020352.14282-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557367449;
 bh=roNLN3Mj1evBi7xtgS8Wa270btNgdehCMU7wdeUBHcY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WFGRqyQDTBKqMeMjTecu9um8qm1/sirdcZgaPae1ZfvwcTSmt6y0wX/F4zS2coYLW
 IWe6Tg/zyaqnbE6Ud4DCJkoQpikGyIat0gAxwlL7GUSNmHLjYbeb9F/C/utgeKApYt
 lk9fHDGGJnGCIwnkCqmMp6qMKQujIykr6AonmlY8=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBDTUEgKENvbnRpZ3VvdXMgTWVtb3J5IEFsbG9jYXRvcikgZm9yIHRoZSBNU00gRFJN
IGRyaXZlciwgdGhlCnNpbXBsZSBwYW5lbCwgYW5kIHRoZSBUSSBMTTM2MzBBIGRyaXZlciBpbiBv
cmRlciB0byBzdXBwb3J0IHRoZSBkaXNwbGF5Cm9uIHRoZSBMRyBOZXh1cyA1IChoYW1tZXJoZWFk
KSBwaG9uZS4KClNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24u
b3JnPgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3Jn
PgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKLSBOb25lCgogYXJjaC9hcm0vY29uZmlncy9xY29tX2Rl
ZmNvbmZpZyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmln
cy9xY29tX2RlZmNvbmZpZwppbmRleCBjMTg1NDc1MWM5OWEuLjRmMDI2MzZmODMyZSAxMDA2NDQK
LS0tIGEvYXJjaC9hcm0vY29uZmlncy9xY29tX2RlZmNvbmZpZworKysgYi9hcmNoL2FybS9jb25m
aWdzL3Fjb21fZGVmY29uZmlnCkBAIC0zNyw2ICszNyw3IEBAIENPTkZJR19BUk1fQ1BVSURMRT15
CiBDT05GSUdfVkZQPXkKIENPTkZJR19ORU9OPXkKICMgQ09ORklHX0NPUkVfRFVNUF9ERUZBVUxU
X0VMRl9IRUFERVJTIGlzIG5vdCBzZXQKK0NPTkZJR19DTUE9eQogQ09ORklHX05FVD15CiBDT05G
SUdfUEFDS0VUPXkKIENPTkZJR19VTklYPXkKQEAgLTE0NiwxMiArMTQ3LDE0IEBAIENPTkZJR19S
RUdVTEFUT1JfUUNPTV9TTURfUlBNPXkKIENPTkZJR19SRUdVTEFUT1JfUUNPTV9TUE1JPXkKIENP
TkZJR19NRURJQV9TVVBQT1JUPXkKIENPTkZJR19EUk09eQorQ09ORklHX0RSTV9QQU5FTF9TSU1Q
TEU9eQogQ09ORklHX0ZCPXkKIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFPXkKIENPTkZJR19C
QUNLTElHSFRfTENEX1NVUFBPUlQ9eQogIyBDT05GSUdfTENEX0NMQVNTX0RFVklDRSBpcyBub3Qg
c2V0CiBDT05GSUdfQkFDS0xJR0hUX0NMQVNTX0RFVklDRT15CiAjIENPTkZJR19CQUNLTElHSFRf
R0VORVJJQyBpcyBub3Qgc2V0CitDT05GSUdfQkFDS0xJR0hUX0xNMzYzMEE9eQogQ09ORklHX0JB
Q0tMSUdIVF9MUDg1NVg9eQogQ09ORklHX1NPVU5EPXkKIENPTkZJR19TTkQ9eQpAQCAtMjYyLDYg
KzI2NSw4IEBAIENPTkZJR19OTFNfQ09ERVBBR0VfNDM3PXkKIENPTkZJR19OTFNfQVNDSUk9eQog
Q09ORklHX05MU19JU084ODU5XzE9eQogQ09ORklHX05MU19VVEY4PXkKK0NPTkZJR19ETUFfQ01B
PXkKK0NPTkZJR19DTUFfU0laRV9NQllURVM9MjU2CiBDT05GSUdfUFJJTlRLX1RJTUU9eQogQ09O
RklHX0RZTkFNSUNfREVCVUc9eQogQ09ORklHX0RFQlVHX0lORk89eQotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
