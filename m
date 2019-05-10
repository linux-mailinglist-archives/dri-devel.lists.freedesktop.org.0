Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA7C19EEC
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 16:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE6889339;
	Fri, 10 May 2019 14:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06B2893B9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 14:20:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AE1A8q018315; Fri, 10 May 2019 16:20:30 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2scbkaj2fs-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Fri, 10 May 2019 16:20:30 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D418C31;
 Fri, 10 May 2019 14:20:29 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 81557113A;
 Fri, 10 May 2019 14:20:29 +0000 (GMT)
Received: from SAFEX1HUBCAS23.st.com (10.75.90.47) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May
 2019 16:20:29 +0200
Received: from localhost (10.201.23.97) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 10 May 2019 16:20:28
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
Subject: [PATCH v2 0/5] Add supply property for DSI controller
Date: Fri, 10 May 2019 16:20:18 +0200
Message-ID: <1557498023-10766-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.97]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=SFxogR9JPF6xdKCGoAamjmYfeUtysrEoecdQ7E/pxnY=;
 b=mEL2JpCF2XTXzAYSgFKO3ZZSG1AtAHEA3xHUV3AAztHXrLVyy5gNUe/YZG6XVi3GBobL
 /CMniv9lTNLF/SoWjiCKqKaVpamyr/RM15PGCeglVxiSMum0h8TaGN0DnwFfMBPKokMp
 JDHGqRXK0GfXCWc5y+jZSx6hFQOmtMcQa+HJoIDkbxL63gHT+ZDhnb4V+byBXEfT+USI
 fKMCPAvj32RSQO6WFgDpUpMKUq8IggydLO1icYXcjqzmt2LEwdkRuuhedAbCClmLNZM1
 nnWOR9f2ltj3T2piC8A7gYI5q5UfftWaRFI/usmAh5Cc5iPSFRx7kwqjdKECk7wWtGk9 pg== 
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

VGhlIERTSSBjb250cm9sbGVyIG5lZWRzIGEgbmV3IHByb3BlcnR5IHRoYXQgcG93ZXJzIGl0cyBw
aHlzaWNhbCBsYXllci4KQmluZGluZyBoYXMgYmVlbiB1cGRhdGVkIHRvIGRvY3VtZW50ZWQgdGhp
cyBwcm9wZXJ0eS4KRGV2aWNlIHRyZWUgb2Ygc3RtMzJtcDE1N2Mgc29jLgpNb3ZlIHJlZzE4ICYg
cmVnMTEgdG8gc3RtMzJtcDE1N2MgZGV2aWNlIHRyZWUgZmlsZS4KUmVtb3ZlIHByb3BlcnR5IHBo
eS1kc2ktc3VwcGx5IHByb3BlcnR5IHRvIHN0bTMybXAxNTdjLWRrMi5kdHMgZmlsZS4KCgpDaGFu
Z2VzIGluIHYyOgotIHJlbmFtZSBwYXRjaCBkcm0vc3RtOiBkc2k6IGFkZCBzdXBwb3J0IG9mIGFu
IG9wdGlvbmFsIHJlZ3VsYXRvcgotIHJld29yayBkd19taXBpX2RzaS1zdG0gcHJvYmUgc2VxdWVu
Y2UKCllhbm5pY2sgRmVydHLDqSAoNSk6CiAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHN0bTMyOiBh
ZGQgc3VwcGx5IHByb3BlcnR5IHRvIERTSSBjb250cm9sbGVyCiAgZHJtL3N0bTogZHNpOiBhZGQg
c3VwcG9ydCBvZiBhbiBvcHRpb25hbCByZWd1bGF0b3IKICBBUk06IGR0czogc3RtMzI6IGFkZCBw
aHktZHNpLXN1cHBseSBwcm9wZXJ0eSBvbiBzdG0zMm1wMTU3YwogIEFSTTogZHRzOiBzdG0zMjog
bW92ZSBmaXhlIHJlZ3VsYXRvcnMgcmVnMTEgJiByZWcxOAogIEFSTTogZHRzOiBzdG0zMjogcmVt
b3ZlIHBoeS1kc2ktc3VwcGx5IHByb3BlcnR5IG9uIHN0bTMybXAxNTdjLWRrMgogICAgYm9hcmQK
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3N0LHN0bTMyLWx0ZGMudHh0ICAgIHwg
IDMgKysrCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzICAgICAgICAgICAg
ICAgIHwgIDkgLS0tLS0tLS0tCiBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1lZDEuZHRz
ICAgICAgICAgICAgICAgIHwgMTYgLS0tLS0tLS0tLS0tLS0tLQogYXJjaC9hcm0vYm9vdC9kdHMv
c3RtMzJtcDE1N2MuZHRzaSAgICAgICAgICAgICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL2dwdS9kcm0vc3RtL2R3X21pcGlfZHNpLXN0bS5jICAgICAgICAgICAgICB8IDQ1
ICsrKysrKysrKysrKysrKysrKystLS0KIDUgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygr
KSwgMjUgZGVsZXRpb25zKC0pCgotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
