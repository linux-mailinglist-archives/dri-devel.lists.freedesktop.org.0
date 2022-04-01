Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9904EE52F
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 02:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F0710E469;
	Fri,  1 Apr 2022 00:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12olkn2064.outbound.protection.outlook.com [40.92.22.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9499910E464
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 00:19:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8AcyZ2qREMKTMkUc8HTR0CHn20WThShjptS2qOhfv+W6StBtCRT8OUbIqJmWw9UZ6SspTeP/ExYARhWss/Uv/Wz7vb9LhwDVFw2ntXiwfSO21MbLwg30VzwnJVgssI0mDKmb7fjp4aJgknra2Xfop/drUXgw39ol1YP8z5K6I4Kuku98Jt3dh5epIzBQ6dohnMqWOk063hQXPMxchLjxm4w6+jtnUU0A4B9Sk2YtlyXPP/v1cDHa+sPpfY7lHp968orcMEGiQVo1v7kP61KHyfIR3LHaZadJcNcjgztWGaG0PEGzRCNfXcqF/BdiERXvCRHBd31imJIKePXPNCvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMEzQu4F0mBvq7aOQq/fBrabir7c9sgCK8g5nQFjLYU=;
 b=oec/D8yE/63lBEaDhGlrj/U3PI6kWlBgIVY0nKxgmapG2jBOR29COE7z+g7h91yZMdylMTLRyr8Q4RyjRjsnik1CggLSZQjVnos1Y4K/pq37zj6/ocXr+1wmuvyVZnJnhE0MG0cCm9zWVGM20WMicSvWmaaA+i3UPPFxRxQ7r3WrSxFd27M6z0/Jhw5C6EX6FBO/D3M+PqGqyef66tIcZggwOwoq7s6nihgkUiUu8dRpv3SiD5aPCiHCa78cptT61FE4uZ7YtvbY2Q4ziifrE/n0o9fJFF2BRm2vu6XOm1uNAHbXIwCaw9e1UuMs2hNwegcJeEMHOH1C/2Tah9oMPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by MWHPR02MB2253.namprd02.prod.outlook.com (2603:10b6:300:5c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.23; Fri, 1 Apr
 2022 00:19:09 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::413f:bae6:4e5e:5ae6%6]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 00:19:09 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: enable qcom
 wled backlight and link to panel
Date: Fri,  1 Apr 2022 05:48:10 +0530
Message-ID: <BY5PR02MB70092607CD7CDD8CF8BCD464D9E09@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401001810.81507-1-jo@jsfamily.in>
References: <20220401001810.81507-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [xDvow7uE4poCKjt/5+igvmqfozsigKY2ns/ub/vloTaWsblgwLA4GhmBKkvIHIJz]
X-ClientProxiedBy: BM1PR0101CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:19::17) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220401001810.81507-4-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96dfad78-a4fb-4351-8730-08da13753d67
X-MS-TrafficTypeDiagnostic: MWHPR02MB2253:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dz9GnjDOMj//WXdh4H2jNgv+/AI6KsuWJUnfWiJTQnQ38/4j9WDU1HBAaIGIBBnGOZz6u3ZP7Fnmj8zvvGfKGp4p3smIsAeX1Ac4CQukLf0aGTMvERfQ1bObcwL/U/x3yNN4TJKZ0e9DuFeQQNoxOd6LO/kmV9xSE5vBqirfZef9ks728hI+pwRZZtQhDgR/Ww49834egfbBrNPI/tSEns6c3ZUL8zkAadyBC3JmG+VndR9uVNE6N6ipKbEbzKEIk22vpm6vlg3I4ij29v/cpsVq7j7PusUhC/NRFOeTF/LDrS7Xx2PAG/r0/o2ftOiuHDzEJw1GjJiDpsQYQSLBJmoa/lidYHo/rV2I4L5zeOm4oM1KF97sCYt7nh+sP4SIP26pLaYJzAePboMRWd6oQ22uhjrOIYYhhxMnTIPYV3EhB98KTyNs7P1kC3kHTn4CaQrw9AFSpEfuOl5C/8B9Rh7RO7xIF/278sUtw4Sm68xJc+c8+Bmv2xFyS4piMHavgD3zEwHfuNKb/9TBh19daEzt7GSLVnPwJiIEQxchiG6C2aFA8Pv6ELTmisBExbtxJzl7p4Z2QeMhqy7b4o/0/w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?muhNLRFzYq5U1zV4IR6FjvjZdichdN4zwdqZqYOAskxnCvMDdMPHv+WvBMv8?=
 =?us-ascii?Q?JraMpg3EZ2Q4pJ3K7/D/GyimZDM2+1Fyob192pvU/a8ayEhiXbDmgTJ8IkPT?=
 =?us-ascii?Q?vbtV5n5CnFp2SCUAzj3OAbMPO0TlAmfcFFqYhGmNUYo6fYM05aCDNY5pKbuX?=
 =?us-ascii?Q?kTdHLMzPwyH6CKBiQ480FxPTV1VpuejTIxsYy00vyCEI4l2yrfoQuhhtvVXC?=
 =?us-ascii?Q?RyMovcEuWlPCEKgzjitCgtbXYuaHrKieGwI1GZU/xuqWNbLDc91WQmu67XS2?=
 =?us-ascii?Q?tpUlNPmWjd6UI2eK/rjDqIomflEu1p9+h7FlB3AgGE7K0UhGq8TiWytPZgwe?=
 =?us-ascii?Q?8R2WUFyjc6myR35QA0hDcZOd7+SZB8Bh7BXUq1tRhcMrOcfVZY5hS+z3QIhh?=
 =?us-ascii?Q?5QquI7HuzQK2o/rvEunYml++IPkD8ca+TijCpHz+/aJUze+Ih4FwRyTq6r/V?=
 =?us-ascii?Q?NVXeSZtL92/25E4TrY8jvXCIoqmTHjXRBn59aWphkQCiMq48xeEcTTjrfgd0?=
 =?us-ascii?Q?Uutkbi9gvYqn526foBhn/Ot15EC95VzrMLk19+H5hdEEdcOjfh4/1kS1SxRc?=
 =?us-ascii?Q?UyGju0J1t5OGv2yAd9gv0ISHr20fAiJjBGZ+Ooj+CmokRdQHa9y4hCXSK6/k?=
 =?us-ascii?Q?kP0oYViO1Xjdi8k0UFdeL5lkv/KU+4rMkxMe1j08iI/JQA7WJQ3r+fWQXdca?=
 =?us-ascii?Q?/eY7r1Qs4XJyZ0BSo2bB68+kNyN72XEcpm/ReEwsZ481ixBwnNvYGxXyA/Cn?=
 =?us-ascii?Q?VvUE0kRoRpsbtUbfYdUAfePKaNtGz2M0fXK+5oh0mH1QxUvZH3I2YV8dlbLl?=
 =?us-ascii?Q?IZy5iPfwKvR4jhzpy7zz5PX3BjYYIE+NPAzLpE0Ps7l14p3yExwzLorGCCGK?=
 =?us-ascii?Q?Xq1Id8zH69QrJMXZb8V2kvZwySQwI+ZyvATkfQYeVkf3fW0qND2SPEqyxqJ8?=
 =?us-ascii?Q?2ZOyjNCCTYwz9tzsFvN44cQtkKz81Q/EES2DPrzDIV8eRZMoFg70UNObky7Z?=
 =?us-ascii?Q?/RSNV8lk+FCXZgH+lJbjehB/9KDWRkmpukoRfVMA1U/m1kQ63e5NF6ymUKNZ?=
 =?us-ascii?Q?gnB2ljGwAHmYtj5HzunJo6RwyAl6NaetFE6/JJCTmkP0iLvVd3jmbK2O1U9H?=
 =?us-ascii?Q?lwdXrH+SivQ8M63ginKrfHZKgFGuivxF0q9mvUpNQ9d8UamX61k9LA4VSGI3?=
 =?us-ascii?Q?ILlELKtRC9Cx8u8i2rV6Tc67DF6qMsPjGQVuvy5sJhE6NeCyZYQcMpNVFmja?=
 =?us-ascii?Q?sBkhOsWU5iMh6FQPYL4HrgE+14bp+tTS33z40mC4kaFxUbFBp3Wt3D12kvqs?=
 =?us-ascii?Q?LTFGqNwlfscpoMdYt9QvBCE6PYktNBEiDp2ntk9JF6jSjVoay2eQaw4QXU9g?=
 =?us-ascii?Q?y/g8ddCPdBS9Af2SEt8HksHwH9sI+b3dVe/yQOgjI3YQomNSb+DWEr/3bw1O?=
 =?us-ascii?Q?ZMFrBDouh3XRKzwf8PglleKGW/2TtI6NcpCUy354WDSFPuNkzS0RHg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 96dfad78-a4fb-4351-8730-08da13753d67
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 00:19:09.3806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2253
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
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xiaomi Poco F1 uses the QCOM WLED driver for backlight control.
Enable and link it to the panel to use it.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
Changes in v2:
 - Remove qcom,enabled-strings property as either it or qcom,num-strings
   should be present. qcom,num-strings is specified and sufficient.
   (Marijn Suijten's Suggestion)

 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 798fc72578a7..d88dc07205f7 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -231,6 +231,7 @@ panel@0 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		backlight = <&pmi8998_wled>;
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
 		port {
@@ -314,6 +315,17 @@ vol_up_pin_a: vol-up-active {
 	};
 };
 
+&pmi8998_wled {
+	status = "okay";
+	qcom,current-boost-limit = <970>;
+	qcom,ovp-millivolt = <29600>;
+	qcom,current-limit-microamp = <20000>;
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

