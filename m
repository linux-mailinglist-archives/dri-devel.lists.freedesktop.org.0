Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9124EBBC2
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 09:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60EAD10F5A7;
	Wed, 30 Mar 2022 07:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2062.outbound.protection.outlook.com [40.92.41.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8028E10F199
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 06:57:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iey146HOF8kzsOlknQek2ZXcgh3yx2tgpcgukrfv2XRd7a54cazT/T8wWJVr2X+lz/gYj1IQNKTZ5AfJMBOJP6q5/LEwtf5f/dB6h+UHHmRC7YNjPZe2CFQY1a5gEncz5hKagbVbFtDrvw31iyu21v97xIwdBdGH8765i6mts2nT+GbQPWmZ86mzboAf0z226RCg+oe7j0NMqswv9koNLsAaFo8W820ldxfM4agH2L3OJbRuZ2tp7hrnnWvFLq/UUY/D9yWtPdoI2eOuqQekR2KU+aVGnM0SMCE4ac5meHuZBU/aApRe2sXCjEWlfLptKYbFGsxKhWZAjUmSPeYpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKI3GoILL8J0bxYQu35N2DmC4fv2Mj+Xqybrzz8r/jk=;
 b=kKyviKAwC7OprBeIz5MbMZYTa/rb6vlHp+aQd4r2+HV4PyK3XYNQA57F56iYaBgEC0rE0HvTBWVnGgyuZ1pmsO9Tb88yadbUddr/orfZaNyHkewce8Kaa7l76uSVtfMvOznoiZQZ3rwYYfsGiRDMykURWqjmI93D56Ay2Zya6ZU9KoEn6Fq6lUrP5ekCY4tKMBb4ow+2KpEsGlv1+7VlnXdeIC8xhh5P4G/RTmkoMvsOKRXxmsvwf46cVE+SiTesakriYjhY3/+I0ilz0n0zI1PfMTZT8/zM/fM8PUnG4RsZtTnn+i/aVw9ITfRIQ05TD5VPd1tfOucOXQDoALJk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BL0PR02MB4883.namprd02.prod.outlook.com (2603:10b6:208:54::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Wed, 30 Mar
 2022 06:57:49 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6%6]) with mapi id 15.20.5123.018; Wed, 30 Mar 2022
 06:57:49 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom
 wled backlight and link to panel
Date: Wed, 30 Mar 2022 12:26:39 +0530
Message-ID: <BY5PR02MB70091CBCF76C99109C72E7C8D91F9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330065639.245531-1-jo@jsfamily.in>
References: <20220330065639.245531-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [WQpQL0JZKQSPSIv41xyjLSJIzn9P2abAjlHy3217uC9I8r0ot/MZSxCDUMbL8Bk8]
X-ClientProxiedBy: BM1PR0101CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::25) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220330065639.245531-4-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4717930d-b0e0-47f2-12d1-08da121a99f9
X-MS-TrafficTypeDiagnostic: BL0PR02MB4883:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EoMCVrj1ufded3BuamDk8WOjuKiVjNlG5WgnpxMI3Be5waQeQaHoUyl6/468HfSId1gYVAjRNqx8xoona2qA/R6NLFf+ucldS2wBt0g4l9PA7muDTC7ZyAzN1eZlsZcaAmAvoohA3tyxlSgxm1W7QRKlvIJ3Yo3oDBeYFb9niYV/Ys56RpccB2+lBDtlM5PG3tJH0XLB9reanOD6QEW5NR8pB8A3EymR9kR6CjIBmLw9/qHGQaKraBzOYm1vfSHNM0TkgfQjV2v/02zy6BX7viCrvcZwUK3glEWKDkvD1ek53DczPkLKyOVQXTNSxciC2T0AW5mj5DqvrA42kC6ssdPtxoNXueasClexx4xZ4Tv8zvBZjdWWDQS3ZM8Qmpzy2N8Ktzvlt6FMjZeYe4TnIE4yJgfQGLV7992lIRrbX1DiMh2wvkzDuCdzD1vURff3WiPr/q8d+0wzr99oMO6u6t0don3ya3ugX/C3EPwVfy9HVyl6EancpzwuuveZ9qcHEMGqGdTNlhIRmbEMHpuaPcB3m1LuVhCmXga9MURZ/y+6NJcGBCD4Z822ScoMLe6FyIPDIrpOWhVPW3hMMDz35w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jBQvohd8gqQ8ul0Njm7eOoY5oVabYSgBIj2BOPFLnCFyQSFwofslfsAMPvIK?=
 =?us-ascii?Q?hGeDI42Cg+ZAM203FfV7j8Nd9hgXX4derqMVecqMlW+Zjm+Gy/jbLDR8W+LX?=
 =?us-ascii?Q?6Jvf3Jfcl3k4Q6ESmK/b1E91zxLn4CF1CApltqQsqcKhnoXntGsqHB9yxPcI?=
 =?us-ascii?Q?AE5EF6U2hR9pGb+hFEqUJ7ZMfYdfW3819SEYDamlMkSSJwp5F/SdrIXb++Us?=
 =?us-ascii?Q?07cR2C+FP5MTh377CsslENETc3ITZtLAb2qrXHCR61e80L0YxuslfMckbuBW?=
 =?us-ascii?Q?EVCvl6BSmReYFDLNn93sIip2g4CtUV9xBc8DfaH6Zd7RVcpsQVChiewTBhoM?=
 =?us-ascii?Q?58LKzvJ+y1PG9Ge84ol5m+adXjEYgpx6AYekFRePi1bEfhW/RO9mLz+iZ3m/?=
 =?us-ascii?Q?EVeXVgbvObavHPb2FPvW/yAFxz7Sc7B+z3wjnsA/DBAE7JaWGcnHlq6DutMv?=
 =?us-ascii?Q?w34iitM6rXOrNret6hUYBJWtn3/4KH3SlTOBaN43bEvyWsellIg0018ptqle?=
 =?us-ascii?Q?zTU8uJWNXa+01TC0EJoJIs+x8Rxg0BbWStnjuVIKEVj5oEG+TLf9qu7Ss5b6?=
 =?us-ascii?Q?xSCFS8JkzkzH57y/pqnqd1A7a5htrPmS9RSCaNYUs/SSfHeleIkQup9UR58o?=
 =?us-ascii?Q?N0lI6lBEBx3W2ntTpcDbmJjLQBUjY9cgFuLgyHS4VXjz3QReUUYb2cGZTSLG?=
 =?us-ascii?Q?DbtJLzKhkHroh2zk8B0ufKvaUd21Ldn9YqnQsJkPR4xlfGt0zEc6cediRksL?=
 =?us-ascii?Q?wZFNL/WZJNw5WLomqKLDH5bmLVRtKp2XANHmvuWRsv8a06h12veGWw4S6XAb?=
 =?us-ascii?Q?UaT+6zxw/heNpAp2pwwlMuGCrjsx3bI+031gG+4fU8d+fLDifyWUFr94sJya?=
 =?us-ascii?Q?Mbswh7gpZWJK1LgSxdw4PZ6lf9/Il2tUI3Qn/s0mxthZ6cdGsBBMDIk8rXqA?=
 =?us-ascii?Q?B/tNz7ml4JWWWVHrzPu3jd4QQdKBMSbVatrVBP0N10oUTz5/+Yc6+5s6p1gC?=
 =?us-ascii?Q?wz19GcQcVV7ienAar9pehyteNbmu22db/Venk3HpUgeG1Butg0FQjgqU57xU?=
 =?us-ascii?Q?8be6fM5hKz1UrnkkuN0kZEZf5SQWR1ErEafH2+9kum35S84zCBIfOoiTiXNs?=
 =?us-ascii?Q?XUTO3x8QipT/RcvXj0FLojo1E4UCpBpF8/HzONmIiFQNSM28qcihG0a4bJqI?=
 =?us-ascii?Q?1qCzFWl94ksVJFhnZtdW++bGTu1qUhQctR63pHDpaTwhiCJj4Qxt5XgLzjfV?=
 =?us-ascii?Q?jFsjRO1H44z0A75NsvzGFTVEBwDwexMYvjCOr+4eLTpSgD/rjrK9cyJwBYl7?=
 =?us-ascii?Q?prEL4+kvb/5xaMQhhsSqJcG6FP5RtxVTY3OMpSBC2vULatYvCkOnOiQLBA8N?=
 =?us-ascii?Q?c2t49rtEPEtjbOCenMwFB83Q2zUgl5jkasqI1i7mfO+WDEcDkGGOcLf1r481?=
 =?us-ascii?Q?KgWfrnU+FT36+JT/Q63J5F3tXn3Ky0nqIYyM75GEN5SIdFOxuGF8Ig=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 4717930d-b0e0-47f2-12d1-08da121a99f9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 06:57:49.2095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4883
X-Mailman-Approved-At: Wed, 30 Mar 2022 07:32:47 +0000
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
Cc: Amit Pundir <amit.pundir@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xiaomi Poco F1 uses the QCOM WLED driver for backlight control.
Enable and link it to the panel to use it.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 798fc72578a7..3ebb0f9905d3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -231,6 +231,7 @@ panel@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		backlight = <&pmi8998_wled>;
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		port {
@@ -314,6 +315,18 @@ vol_up_pin_a: vol-up-active {
 	};
 };
 
+&pmi8998_wled {
+	status = "okay";
+	qcom,current-boost-limit = <970>;
+	qcom,ovp-millivolt = <29600>;
+	qcom,current-limit-microamp = <20000>;
+	qcom,enabled-strings = <0 1>;
+	qcom,num-strings = <2>;
+	qcom,switching-freq = <600>;
+	qcom,external-pfet;
+	qcom,cabc;
+};
+
 &pm8998_pon {
 	resin {
 		compatible = "qcom,pm8941-resin";
-- 
2.35.1

