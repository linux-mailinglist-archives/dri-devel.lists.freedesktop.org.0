Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14D5D34E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2788F6E02C;
	Tue,  2 Jul 2019 15:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 651FA89FF7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:47:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62FkSbB002392; Tue, 2 Jul 2019 17:47:40 +0200
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwf0w4ux-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 17:47:40 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 839AC31;
 Tue,  2 Jul 2019 15:47:37 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 49270487E;
 Tue,  2 Jul 2019 15:47:37 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019
 17:47:37 +0200
Received: from localhost (10.201.23.16) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 2 Jul 2019 17:47:36
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <benjamin.gaignard@st.com>, <alexandre.torgue@st.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <olivier.moysan@st.com>,
 <jsarha@ti.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH 0/3] drm/bridge: sii902x: fix audio mclk management
Date: Tue, 2 Jul 2019 17:47:03 +0200
Message-ID: <1562082426-14876-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_08:, , signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=eo0SzcMpscMimbmWzsOIbcgLXEFvCBh20u1KgFabFbU=;
 b=bNblDuWO7jsVSN+PfB2xxe0ZDiUyeLXWo9o19zQpFArkhjHGUlIZjoe3y6ozfdtvABAP
 pML3jxpdhSHUr0F+rW9u+8eDOVVxoLwjl72bwQm4mvdgihEK0F6GQu344lB/NNK55Zx2
 6ps1iKV9RlCN9mT9wRTpM7LmiaKcXU7hBQmU2Xn9Nk/i0yan20CCTNOfZ19w9gBWSCKY
 fd8d5mfLUoPJTKUMTwDYgSuD12wohApr0fn+P9FnDW6pvalvQt98b1PmWIgZa7OEdtjG
 kirHv3JZVJvm3fSoJILvjvIbBcBFoIOP3PT9oveWGCciIeCjII4W1Mzei/wRDh0XMmns KQ== 
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

Rml4IGF1ZGlvIG1hc3RlciBjbG9jayB1c2UgZm9yIFNpbGFiIHNpaTkwMnggSERNSSB0cmFuc2Nl
aXZlci4KTWFrZSBhdWRpbyBtYXN0ZXIgY2xvY2sgb3B0aW9uYWwsIGFzIHRoaXMgY2xvY2sgaXMg
bm90IG1hbmRhdG9yeS4KCk9saXZpZXIgTW95c2FuICgzKToKICBkcm0vYnJpZGdlOiBzaWk5MDJ4
OiBmaXggbWlzc2luZyByZWZlcmVuY2UgdG8gbWNsayBjbG9jawogIGR0LWJpbmRpbmdzOiBkaXNw
bGF5OiBzaWk5MDJ4OiBDaGFuZ2UgYXVkaW8gbWNsayBiaW5kaW5nCiAgZHJtL2JyaWRnZTogc2lp
OTAyeDogbWFrZSBhdWRpbyBtY2xrIG9wdGlvbmFsCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9icmlkZ2Uvc2lpOTAyeC50eHQgfCAgNSArKy0KIGRyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2lpOTAyeC5jICAgICAgICAgICAgICAgICAgIHwgNDAgKysrKysrKysrKysrKy0tLS0tLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCi0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
