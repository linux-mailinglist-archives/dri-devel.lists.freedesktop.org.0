Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9FE19EF5
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 16:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2FE893CD;
	Fri, 10 May 2019 14:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EF589452
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 14:20:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AE1mfP025399; Fri, 10 May 2019 16:20:35 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2scfv2s5w3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 16:20:35 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 93E8234;
 Fri, 10 May 2019 14:20:32 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6FD32113A;
 Fri, 10 May 2019 14:20:32 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May
 2019 16:20:32 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May 2019 16:20:32
 +0200
From: =?UTF-8?q?Yannick=20Fertr=C3=A9?= <yannick.fertre@st.com>
To: Yannick Fertre <yannick.fertre@st.com>, Philippe Cornu
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/5] ARM: dts: stm32: add phy-dsi-supply property on
 stm32mp157c
Date: Fri, 10 May 2019 16:20:21 +0200
Message-ID: <1557498023-10766-4-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
References: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version : content-type
 : content-transfer-encoding; s=STMicroelectronics;
 bh=ivD85ODEdVutRWfgtTPWNnPbQXujrje21LXvsEkrE2s=;
 b=JCLpIIjlmoFRg8oC07A6kg6fAkRqd2GcEkLBdXkS9fpdH2IS/e/7v+BfKIYocB0AMfLv
 UvhauRwirRMMsMYh7Vi9o6VgwaKKwQ5yME6Lu9WP+s2c4HVJxYk8rxJXs6cLDHBNT3a0
 mv76HXNpWmOlO9WjTYhwuDfWAKk2wM8r7yWktSbKkjwyGPFAUfoIHuorppQBNeaw9ef0
 rCaCkbZgIJ6UVKn+iCmlHc7mAnHRvWTtECfn0G4/vlPbI0qRZVwGfuURiJIpB6GW3jXh
 lRIjRMxbjeyXKieq4/1dtinctzGTxm9Bg8YaStXQXaDltqKj5xj6q++TA69E3Vi/rsKJ Lw== 
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

VGhlIGRzaSBwaHlzaWNhbCBsYXllciBpcyBwb3dlcmVkIGJ5IHRoZSAxdjggcG93ZXIgY29udHJv
bGxlciBzdXBwbHkuCgpTaWduZWQtb2ZmLWJ5OiBZYW5uaWNrIEZlcnRyw6kgPHlhbm5pY2suZmVy
dHJlQHN0LmNvbT4KLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpIHwgMSAr
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2Mu
ZHRzaQppbmRleCAyYWZlZWU2Li42YjE0ZjFlIDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0
cy9zdG0zMm1wMTU3Yy5kdHNpCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLmR0
c2kKQEAgLTExNTYsNiArMTE1Niw3IEBACiAJCQljbG9jay1uYW1lcyA9ICJwY2xrIiwgInJlZiIs
ICJweF9jbGsiOwogCQkJcmVzZXRzID0gPCZyY2MgRFNJX1I+OwogCQkJcmVzZXQtbmFtZXMgPSAi
YXBiIjsKKwkJCXBoeS1kc2ktc3VwcGx5ID0gPCZyZWcxOD47CiAJCQlzdGF0dXMgPSAiZGlzYWJs
ZWQiOwogCQl9OwogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
