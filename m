Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF49E4764C5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 22:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E540D10F8C4;
	Wed, 15 Dec 2021 21:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E002610F8C4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 21:47:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFF2cfK011435;
 Wed, 15 Dec 2021 22:47:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-type; s=selector1;
 bh=l/ohPNE652ih2nrYsY5A9VdKCfXMU8dIPHQc3eu6nFE=;
 b=QUEUD5VI/sZ1NUP0NKulv6RwqrrshHqDNpekG48SU2cB9UVl6aJ5v5xtBdGuMAHTqGvF
 sbnzuAb5oNEZDxlSH91V1+PEFUU3q2gmxIn5rPA4rPT2T1ONDnAB6GfMEZpAvVlrZxhv
 PLGzael/rGXOSShzxcPor0SwnaXNjxkyPNo/9VGII+ZxdpKU80MOOkmoZGgw8HeBufh+
 cTueKwmbSHGhpWZ1rqKO7kD+yh+TyR+K+W5PBGGFlYiyxlqcHv/Pvj7IZvsRNTN9Zimh
 9Rq+8y+oK0bT0mzSDSGBFZ9eHipiQnoKtd8vtqXAr0eBRtEtjwuBQ1USiX74BBUfxnf5 fQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cy79j611w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 22:47:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D3C7B10002A;
 Wed, 15 Dec 2021 22:47:02 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BF2F420A74A;
 Wed, 15 Dec 2021 22:47:02 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 22:47:02
 +0100
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/5] drm/stm: new features to display controller
Date: Wed, 15 Dec 2021 22:46:51 +0100
Message-ID: <20211215214651.19798-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_13,2021-12-14_01,2021-12-02_01
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

Hello,
List of new feature:
* Replace the legacy register access by regmap API.
* Support of YCbCr 422 output
* Update layer shadow registers per plane.
* Support of YCbCr output (planar, semiplanar & coplanar)

These featues are available only with last hardware version of ltdc
(0x401000) link to patch"drm/stm: ltdc: support of new hardware version"
(https://patchwork.freedesktop.org/patch/465207).

Yannick Fertre (5):
  drm/stm: ltdc: switch to regmap
  drm/stm: ltdc: add YCbCr 422 output support
  drm/stm: ltdc: add per plane update support
  drm/stm: ltdc: add support of flexible pixel formats
  drm/stm: ltdc: add support of ycbcr pixel formats

 drivers/gpu/drm/stm/ltdc.c | 639 +++++++++++++++++++++++++++++--------
 drivers/gpu/drm/stm/ltdc.h |   9 +-
 2 files changed, 518 insertions(+), 130 deletions(-)

-- 
2.17.1

