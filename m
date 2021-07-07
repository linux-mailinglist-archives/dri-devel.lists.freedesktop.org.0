Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9753BE4AA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACD876E055;
	Wed,  7 Jul 2021 08:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E30B6E055
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:48:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1678fZUe029506; Wed, 7 Jul 2021 10:48:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=selector1;
 bh=X2A5zaJ3/upwREqwE0Vhej/FGY58c6pTzzxOXfWJAPI=;
 b=6k1KxoxKocPZGaGuTAZhjUNdkV/2745hCIlSADrS+/TeBIFclGm5GO1/O3j8/r3ZDiRq
 cjOIym/vkNPeBPNtR4LICBV3ug9aGp9gC9Zw6tkhC57F0aTMah4M62sOQrAhQSe7igZ3
 sWs9SEiYxd3SA56XQN09qq6zHFXGeXSJJXKL4OMEwanhr1LUVnMXBt9voFQz37gA8b7+
 UvMVxD3U3V+a7B4XWckwHrKKZQy4yDd+NV2RGd3Zi+h37OKCm7ikyQptO1Xig8IxgCiy
 OAWWMuoOPsg0gjvLFFjKLcOxN1UGvJg+Df9W6mWVa5jTgKwfYGEGV0tf5C8+sONKriVv Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39n8ysr1gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 10:48:23 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C5AE210002A;
 Wed,  7 Jul 2021 10:48:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B427216EDE;
 Wed,  7 Jul 2021 10:48:20 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 7 Jul
 2021 10:48:20 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.015; Wed, 7 Jul 2021 10:48:20 +0200
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Yannick FERTRE - foss
 <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>, Matt Roper
 <matthew.d.roper@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
Thread-Topic: [PATCH 0/2] Add "BACKGROUND_COLOR" drm property
Thread-Index: AQHXcwzWM52+nQh1ikqrNewj647ZyA==
Date: Wed, 7 Jul 2021 08:48:20 +0000
Message-ID: <20210707084557.22443-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_05:2021-07-06,
 2021-07-07 signatures=0
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
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series aims to add a generic background color property for CRTC as
discussed in the conversation:
https://patchwork.freedesktop.org/patch/439585/

This patch "drm: add crtc background color property" is strongly inspired
of Matthew Roper's.  Please see:
https://patchwork.freedesktop.org/patch/333632/

Raphael Gallais-Pou (2):
  drm: add crtc background color property
  drm/stm: ltdc: add crtc background color property support

 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++
 drivers/gpu/drm/drm_blend.c               | 34 +++++++++++++++-
 drivers/gpu/drm/drm_mode_config.c         |  6 +++
 drivers/gpu/drm/stm/ltdc.c                | 48 ++++++++++++++++++++---
 include/drm/drm_blend.h                   |  1 +
 include/drm/drm_crtc.h                    | 12 ++++++
 include/drm/drm_mode_config.h             |  5 +++
 include/uapi/drm/drm_mode.h               | 28 +++++++++++++
 9 files changed, 132 insertions(+), 7 deletions(-)

--=20
2.17.1
