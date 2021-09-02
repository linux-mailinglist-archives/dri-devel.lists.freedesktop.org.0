Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5BA3FF03C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 17:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C586E5BD;
	Thu,  2 Sep 2021 15:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F0A6E5BF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 15:31:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 182Ehat5032332;
 Thu, 2 Sep 2021 17:30:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=selector1;
 bh=FqkU+U2qaJ6aY22CM876gTpmSnYzT1Zb7tNI+fa5WoY=;
 b=r2k3EHW9CDxpMe6gIJbnOrL8BawSiDBuAkKMPvEoweet4/ueOXi3cmsM0K5nioK3/+sS
 BV1SCjcp/RUAfi2VgPSVwS2Ovh7cOvvJdVAMaxypk0nORjIdqc++bvs1etrbKvne1LYF
 fOvjoQ8EckSPaEbnDrZLkc0EpXJapBz4MatKKagIw6sh79EmUJhrBWiNguMbixKXuxur
 NwyIE01OaDcNnjNiugsLI7ltysATmrDKDf6tm9SzSiINZw5qlcrbUKTY8b69d7qdiXEx
 5xgv3jVlhDgmNrquMMQPz3BI+yDpgBLRIl1ljJd3L7+mMUdt/0GH+VZzOqx7fmYXTufb BA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3atujr26nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Sep 2021 17:30:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05EEA10002A;
 Thu,  2 Sep 2021 17:30:59 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA875218104;
 Thu,  2 Sep 2021 17:30:58 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 2 Sep
 2021 17:30:58 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1497.015; Thu, 2 Sep 2021 17:30:58 +0200
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Yannick FERTRE - foss <yannick.fertre@foss.st.com>, Philippe CORNU - foss
 <philippe.cornu@foss.st.com>, Benjamin Gaignard
 <benjamin.gaignard@linaro.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE - foss
 <alexandre.torgue@foss.st.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Raphael GALLAIS-POU - foss
 <raphael.gallais-pou@foss.st.com>, Raphael GALLAIS-POU
 <raphael.gallais-pou@st.com>
Subject: [PATCH] drm/stm: ltdc: attach immutable zpos property to planes
Thread-Topic: [PATCH] drm/stm: ltdc: attach immutable zpos property to planes
Thread-Index: AQHXoA+GiNV5N6DIcUSGOuN2jPsbMQ==
Date: Thu, 2 Sep 2021 15:30:57 +0000
Message-ID: <20210902152605.12420-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-02_04,2021-09-02_03,2020-04-07_01
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Defines plane ordering by hard-coding an immutable Z position from the
first plane, used as primary layer, to the next ones as overlay in order
of instantiation.

This zpos is only an information as it is not possible to modify it,
blending operations are still applied from the top to the bottom layer.

This patch helps to remove a warning message from the Android
Hardware Composer.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 195de30eb90c..bd603ef5e935 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -1024,6 +1024,8 @@ static int ltdc_crtc_init(struct drm_device *ddev, st=
ruct drm_crtc *crtc)
 		return -EINVAL;
 	}
=20
+	drm_plane_create_zpos_immutable_property(primary, 0);
+
 	ret =3D drm_crtc_init_with_planes(ddev, crtc, primary, NULL,
 					&ltdc_crtc_funcs, NULL);
 	if (ret) {
@@ -1046,6 +1048,7 @@ static int ltdc_crtc_init(struct drm_device *ddev, st=
ruct drm_crtc *crtc)
 			DRM_ERROR("Can not create overlay plane %d\n", i);
 			goto cleanup;
 		}
+		drm_plane_create_zpos_immutable_property(overlay, i);
 	}
=20
 	return 0;
--=20
2.17.1
