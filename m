Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7907434A59
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 16:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA4C89A1F;
	Tue,  4 Jun 2019 14:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B53A8982D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2019 12:53:48 +0000 (UTC)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pAzTh/eDM="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box by smtp.strato.de (RZmta 44.22 DYNA|AUTH)
 with ESMTPSA id i01b98v54Cra7YC
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 4 Jun 2019 14:53:36 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
 marek.belisko@gmail.com
Subject: [PATCH 2/2] drm/panel: simple: Add Ortustech COM37H3M panel support
Date: Tue,  4 Jun 2019 14:53:34 +0200
Message-Id: <de4649e5beb7a0b18357314cca11739699405c85.1559652814.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559652814.git.hns@goldelico.com>
References: <cover.1559652814.git.hns@goldelico.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 14:26:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1559652827; 
 s=strato-dkim-0002; d=goldelico.com;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=OPxHWZ0Yqa8jx7PmQiTW3yC8b4PfhAE9TVHtEW0aA74=;
 b=Omg9Xf58DudoiqD++g9imnCj9lae8b5zc+ue5KNozPWpx1TO6mRAdK06X8CSG6d7sA
 w9/sPT4Xvsi7ZWxEz7juBnjoEsu0BcGOMceXVsht0kFXcgurBu49xb7TD5IdInZ2+Znj
 6XaKb+dWLN3LxvocyQ3zcQe+RxtjWuCFKDvhjXgLlvEN0Na+2ssszNxg5BrRoIjeyxbZ
 9BQokLMVB1yJcfOc/9xGKlVcHb+4hdaZNzBWSN1vEyayx2UajxiISCuzmQyWbTHcJEsn
 A64FlXN64Kje4xr+4PtAPT7lZ0HiEQUkcNzjXeU/vaa2Od/triY9HV9PI1kKAFECK2W3
 m7hQ==
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
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNoYW5nZSBhZGRzIHN1cHBvcnQgZm9yIHRoZSBPcnR1c3RlY2ggQ09NMzdIM00wNURUQy85
OURUQyAzLjciIFRGVCBMQ0QgcGFuZWwuCgpTaWduZWQtb2ZmLWJ5OiBILiBOaWtvbGF1cyBTY2hh
bGxlciA8aG5zQGdvbGRlbGljby5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNpbXBsZS5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDMzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKaW5k
ZXggNWIyNzgyOWM1YTc4Li4xODkyZDAwYmUxNmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zaW1wbGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwt
c2ltcGxlLmMKQEAgLTIwMDcsNiArMjAwNywzMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVs
X2Rlc2Mgb250YXRfeXg3MDB3djAzID0gewogCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9S
R0I2NjZfMVgxOCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBv
cnR1c3RlY2hfY29tMzdoM21fbW9kZSAgPSB7CisJLmNsb2NrID0gMjIxNTMsCisJLmhkaXNwbGF5
ID0gNDgwLAorCS5oc3luY19zdGFydCA9IDQ4MCArIDgsCisJLmhzeW5jX2VuZCA9IDQ4MCArIDgg
KyAxMCwKKwkuaHRvdGFsID0gNDgwICsgOCArIDEwICsgMTAsCisJLnZkaXNwbGF5ID0gNjQwLAor
CS52c3luY19zdGFydCA9IDY0MCArIDQsCisJLnZzeW5jX2VuZCA9IDY0MCArIDQgKyAzLAorCS52
dG90YWwgPSA2NDAgKyA0ICsgMyArIDQsCisJLnZyZWZyZXNoID0gNjAsCisJLmZsYWdzID0gRFJN
X01PREVfRkxBR19OVlNZTkMgfCBEUk1fTU9ERV9GTEFHX05IU1lOQywKK307CisKK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBvcnR1c3RlY2hfY29tMzdoM20gPSB7CisJLm1vZGVzID0g
Jm9ydHVzdGVjaF9jb20zN2gzbV9tb2RlLAorCS5udW1fbW9kZXMgPSAxLAorCS5icGMgPSA4LAor
CS5zaXplID0geworCQkud2lkdGggPSA1NiwJLyogNTYuMTZtbSAqLworCQkuaGVpZ2h0ID0gNzUs
CS8qIDc0Ljg4bW0gKi8KKwl9LAorCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhf
MVgyNCwKKwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdf
UElYREFUQV9QT1NFREdFIHwKKwkJICAgICBEUk1fQlVTX0ZMQUdfU1lOQ19EUklWRV9QT1NFREdF
LAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIG9ydHVzdGVjaF9j
b200M2g0bTg1dWxjX21vZGUgID0gewogCS5jbG9jayA9IDI1MDAwLAogCS5oZGlzcGxheSA9IDQ4
MCwKQEAgLTI3ODYsNiArMjgxMywxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9p
ZCBwbGF0Zm9ybV9vZl9tYXRjaFtdID0gewogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAib250YXQs
eXg3MDB3djAzIiwKIAkJLmRhdGEgPSAmb250YXRfeXg3MDB3djAzLAorCX0sIHsKKwkJLmNvbXBh
dGlibGUgPSAib3J0dXN0ZWNoLGNvbTM3aDNtMDVkdGMiLAorCQkuZGF0YSA9ICZvcnR1c3RlY2hf
Y29tMzdoM20sCisJfSwgeworCQkuY29tcGF0aWJsZSA9ICJvcnR1c3RlY2gsY29tMzdoM20wOTlk
dGMiLAorCQkuZGF0YSA9ICZvcnR1c3RlY2hfY29tMzdoM20sCiAJfSwgewogCQkuY29tcGF0aWJs
ZSA9ICJvcnR1c3RlY2gsY29tNDNoNG04NXVsYyIsCiAJCS5kYXRhID0gJm9ydHVzdGVjaF9jb200
M2g0bTg1dWxjLAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
