Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1C43212F9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 10:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799F16E92A;
	Mon, 22 Feb 2021 09:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2EE6E92A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 09:22:53 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11M9Korh016507; Mon, 22 Feb 2021 10:22:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=selector1;
 bh=c1aebQ0l+1wgZ6Yg2/4eGkGmBoaVEzzO8QSq6ZSd5Uw=;
 b=vhiV8BnoY5HnAmz5KjdyLzuugaCLOUpfsjXwve1YovHu0WR8Kzx7+y6fK37tY+u8MFdl
 PWf3Tahu7cLxeCwMIlGuIHbenHb5Yfqu4tmHzZXUcoQ+NcfYmviFY9w3NiweTrpUv3CQ
 6oGZ+XtAuMe7okQnu80BF3mP7dUpGDmuRlDmgG/6wfzUZjEWDvJGrmcl/+pmhFQcFBui
 EixY5FfWrXF6P/tr9BAak35JXu7VSgkcJuAUrhHECFPVvXPNBGJOVJfM+wvYMNGvDU84
 UwZYeiz9RoYeMsSVknXWTw2dWz9WyoOqV0fyQGF7WWs2u9GHkLNPNj/Bjm7uvVHUNf72 lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36ttn6tndd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Feb 2021 10:22:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 025D4100038;
 Mon, 22 Feb 2021 10:22:43 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2CB721F0A4;
 Mon, 22 Feb 2021 10:22:43 +0100 (CET)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Feb
 2021 10:22:43 +0100
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Mon, 22 Feb 2021 10:22:43 +0100
From: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>
To: Yannick FERTRE <yannick.fertre@st.com>, Philippe CORNU
 <philippe.cornu@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 Sam Ravnborg <sam@ravnborg.org>, "Joe Perches" <joe@perches.com>
Subject: [PATCH 0/2] Standardize DSI driver logging system
Thread-Topic: [PATCH 0/2] Standardize DSI driver logging system
Thread-Index: AQHXCPxG7Aav2VLZYkepVFMirMgYKw==
Date: Mon, 22 Feb 2021 09:22:43 +0000
Message-ID: <20210222092205.32086-1-raphael.gallais-pou@foss.st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-22_02:2021-02-18,
 2021-02-22 signatures=0
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
Cc: Raphael GALLAIS-POU - foss <raphael.gallais-pou@foss.st.com>,
 David Airlie <airlied@linux.ie>,
 Yannick FERTRE - foss <yannick.fertre@foss.st.com>,
 Raphael GALLAIS-POU <raphael.gallais-pou@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
 Philippe CORNU - foss <philippe.cornu@foss.st.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The use of DRM logging macros was removed and dev_err_probe() replaces
condition, showing errors but not EPROBE_DEFER.

Yannick Fertre (2):
  drm/stm: dsi: Avoid printing errors for -EPROBE_DEFER
  drm/stm: dsi: Use dev_ based logging

 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 58 +++++++++++++--------------
 1 file changed, 29 insertions(+), 29 deletions(-)

-- 
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
