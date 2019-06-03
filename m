Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4680132ADB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 10:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F28891B3;
	Mon,  3 Jun 2019 08:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42948891B3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 08:31:53 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x538VI0P012223; Mon, 3 Jun 2019 10:31:49 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sundrs730-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 03 Jun 2019 10:31:49 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2F8931;
 Mon,  3 Jun 2019 08:31:45 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE3CF2514;
 Mon,  3 Jun 2019 08:31:45 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019
 10:31:45 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019 10:31:45
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/stm: ltdc: No message if probe
Date: Mon, 3 Jun 2019 10:31:34 +0200
Message-ID: <1559550694-14042-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_06:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=E3rVaIy9kAIHI7M+214fHf8F4WB/bpg155JaSxbNFQ4=;
 b=ejkUkIvy9/n+XTOUFTHEic+5n733rjUac84ytlorYMH7sM9c1SEGoeE2tPPOaQQvObQD
 yKHW5phkhg3z/KcLKjHRxkL/a2TdIbUrf4s6fNWDUlYF2S/IksOnpjntbXPr+2J4THPh
 uwgX+OYSxOJrOde0FoQ11zD/sLBEgVriYtokLX1paw6Hn+A+yx363N61csMOvWb4d9lM
 0RC+r0JlSGZdwKRl6/TH+1121ZGTsAZETdNgu0ghxisDXIazS9WH3mLmX+n6VRk/1Qe2
 irMiT/VcNhhl9zeQweWl0/93PFNZ00UNPG5PDYzG2K/h8s8Ll/YlRpW4FoXXa3I7mT80 Jw== 
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

UHJpbnQgZGlzcGxheSBjb250cm9sbGVyIGhhcmR3YXJlIHZlcnNpb24gaW4gZGVidWcgbW9kZSBv
bmx5LgoKU2lnbmVkLW9mZi1ieTogWWFubmljayBGZXJ0csOpIDx5YW5uaWNrLmZlcnRyZUBzdC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N0bS9sdGRjLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vc3RtL2x0ZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCmluZGV4IGE0MDg3
MGIuLjJmZTZjNGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9zdG0vbHRkYy5jCkBAIC0xMjI5LDcgKzEyMjksNyBAQCBpbnQgbHRk
Y19sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQogCQlnb3RvIGVycjsKIAl9CiAKLQlEUk1f
SU5GTygibHRkYyBodyB2ZXJzaW9uIDB4JTA4eCAtIHJlYWR5XG4iLCBsZGV2LT5jYXBzLmh3X3Zl
cnNpb24pOworCURSTV9ERUJVR19EUklWRVIoImx0ZGMgaHcgdmVyc2lvbiAweCUwOHhcbiIsIGxk
ZXYtPmNhcHMuaHdfdmVyc2lvbik7CiAKIAkvKiBBZGQgZW5kcG9pbnRzIHBhbmVscyBvciBicmlk
Z2VzIGlmIGFueSAqLwogCWZvciAoaSA9IDA7IGkgPCBNQVhfRU5EUE9JTlRTOyBpKyspIHsKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
