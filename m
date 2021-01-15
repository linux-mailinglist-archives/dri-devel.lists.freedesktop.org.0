Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 967462F7EAB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 15:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5807E6E43B;
	Fri, 15 Jan 2021 14:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1545 seconds by postgrey-1.36 at gabe;
 Fri, 15 Jan 2021 14:58:36 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA276E43B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 14:58:36 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10FESAKE007013; Fri, 15 Jan 2021 15:32:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : subject
 : date : message-id : mime-version : content-type; s=selector1;
 bh=L3iN3yrmVDvMpCGi/fPZ69/2cDOE2wson7OCPRa1tMI=;
 b=H5Tdd/yRm3AeJIeQyynaeHBYWspkbUwkJrm5rMUEEv0sJ2zwuIeqMaa0d3ZCE/lngtlH
 HTMHTWcU8kxQC46rwfcQ/EwYFiWwdbKWvOabhp/dIhii6EIVYgKp4T/h1xVMVMWtF7vT
 i8NylSeFJ0TI2dQ/kIMWeul5jmKTpVeU1xYfkxkS6Me2OQhRSuodRk1xO7+tepOrHZjM
 PAbEFUghx5h7F/znypMCJTcKYMKZbvkHo6xL+aoL9YGpOxrePQOw69NzdYKOUVs5aZCu
 amYOhcbwoKvkKM/qe8k8ehuxvzbr9cYVsZ8f7TED7XVS0qqCVWjQAU1m/lUczQ3FwWTx kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35y5gxm2vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:32:43 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A033B10002A;
 Fri, 15 Jan 2021 15:32:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6E6CE24974F;
 Fri, 15 Jan 2021 15:32:41 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Jan 2021 15:32:41
 +0100
From: Yannick Fertre <yannick.fertre@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] ARM: multi_v7_defconfig: add STM32 CEC support
Date: Fri, 15 Jan 2021 15:32:36 +0100
Message-ID: <20210115143236.27675-1-yannick.fertre@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_08:2021-01-15,
 2021-01-15 signatures=0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable CEC support for STMicroelectronics as loadable module.

Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c5f25710fedc..05cc0607a9ad 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -656,6 +656,7 @@ CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_VIDEO_VIVID=m
 CONFIG_CEC_PLATFORM_DRIVERS=y
 CONFIG_CEC_SAMSUNG_S5P=m
+CONFIG_CEC_STM32=m
 CONFIG_VIDEO_ADV7180=m
 CONFIG_VIDEO_ADV7604=m
 CONFIG_VIDEO_ADV7604_CEC=y
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
