Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4617BC2147E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 17:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2813B10E297;
	Thu, 30 Oct 2025 16:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Xuekq/pi";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Xuekq/pi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023142.outbound.protection.outlook.com
 [40.107.159.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE0810E297
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 16:47:52 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PvBZvh2CGRvKP1J0gOfcCxslcUa8GdG3xjJ0jwSE1crC/UQ8vDbYgokB/pIatN6Icv0ciapBKWzyjybAgE82JOskoFEvf1Ad/rQKTWF77x5X6OBPejYeOcFLp+cPHBL2UVEZsPYBI9mRS3rCh3r+DU0sQIlHNtGmeoSoA9jASzIOHIyEheEB4uQ7+HUZ9zMDQLiGL8jyIVmn9GdVsUOnKrhbW5viuvnfHrAyoNZS/+UCtjbkX+nWx0IfzqTe418SsWRj49r73fK3UycJHlnCXimxg/srzTG9sBjM7x+8ljq933gdUFAqFMLTBxVE+IFcxqmQixnQQdXcDTW1KXOOGw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiH9hJSO6zb6a+Kr0q3KbAkKSiT1K4hSXWohutaphjc=;
 b=QAjwCg3EHbITqN4F9rYIsa5oqhqXfm2gjzUDNO3dVej1Hvuvw57BZ45isuDRJ+zGlA3bv4NTHCNRDPdloboBwon33VOQymIvMvCB37ibr/tzmOJUfQ75iMHoAJH7M/o8KaB5A3CZ85IOIab0zsKoEVMnXUAywTZZhndkNgxiIQCKDEYEcoze7a49N3WLm+7xCgrFduFkXyJNN2+CW+UsFIk6mjBvqyMrsJ9kWJPTbTJtJh/CcqnZKJzJr66dsQXNsyPDH59VY7bq+T6Lpk9a0xyEJV3qDsNkNgzUXl8I+kER7EReviWeNVCkg35XWgQdBknPy433b5dz2G+asy9diQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiH9hJSO6zb6a+Kr0q3KbAkKSiT1K4hSXWohutaphjc=;
 b=Xuekq/pi5WGA3Lp3xoWlrjg63PFvyVkZE0gkCGDvDRASN7Q57tBPidlAIHIKCCOfGl8BQ9rQB+mLDPd8DUrLGYzO4FSlGdE9eLicYxMPXrlxrXjaEymDeqLqHVWLJQeCDTdxY72tQhUQftSvUTdP8qrqOnYh5h+NWYSiP89EQ+s=
Received: from DUZPR01CA0101.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::22) by AM7PR04MB6888.eurprd04.prod.outlook.com
 (2603:10a6:20b:107::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 16:47:47 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::77) by DUZPR01CA0101.outlook.office365.com
 (2603:10a6:10:4bb::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 16:48:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Thu, 30 Oct 2025 16:47:46 +0000
Received: from emails-8604699-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-121.eu-west-1.compute.internal [10.20.5.121])
 by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 66053806F4; Thu, 30 Oct 2025 16:47:46 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1761842866; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=jiH9hJSO6zb6a+Kr0q3KbAkKSiT1K4hSXWohutaphjc=;
 b=bHJkYJ1QBeW1I/EGw8jkb9OMN+IaLqak6tsLgAMWYLyXJ4vbqBXTD83w3tTiT0/iJScbt
 X78OMJZzRQ6QShE9CY2gxJDv7X0RRf3KbsYvzsTMf2qHbmCdRl84HzXeqDJXT6/HTVjvv+0
 UmFgTSITLLryN+qNLock5ojgdDWpjhI=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1761842866;
 b=DQt5no1V6nK+S+N7RQQEYw0UiCJ5PxZ7K25lDZcHfVpTVzb+/5JXQmXqUjdEvLNyPAoPh
 u4C+bZV29eKuxu3nsthvhzJMa1mXGdf9MxIMiG1jrzrec43BHJWAUSzdBE37Kl3J+7RMQX+
 FJ1BiKSMNTC09EhxnT2iqDSvNhAjx6o=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dM3f5eC0AtIB+Y8Y0VAOqUZUMePC7YyCFh0U/1yl/w5O54DBroItVHrCndtwEKNnXI7aGLlx/2/qwW4bICH/J5g1JhFOKmGcCKhhADzhi77X2VOx61+WPMjvzDb85TC4U4pebZGR20OsC8nJ6Mi8XPe6D/J0J8BdSDMrmr3mGcurGIqk/3FPbnRHELEtdjapvrLtPFY0qYfg5aveJbfgao8ceZMgRT1VZFt4hczu8EeNxJ/ippbZwQV0C2UZHlVgJZ1KzPpyNJxrub1oI56j4vQj0gGJaAlHN1twmPKjjtCyPMyCiHZiIYyTcdgJpILf0fzYXAKNnBrfqHmok81SxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiH9hJSO6zb6a+Kr0q3KbAkKSiT1K4hSXWohutaphjc=;
 b=yN5gSIhxGLcddCIMqc+WxDrUXCQVziJ8AiNbJ16c44nts4WX13kiC4IF52YywdCSu25WuthuXKjRas+JdJWpSUuZAlYdqWSeYg0JongnZcX1CX+kz23vVy422HdfTCb6pwWFDFWOtKhR6QUKi1oWLtuvRrEYe74IxpAtEIwE40l8I2eatMKGW7GGA2/Tq6AKcDcuHebr1erXeYLugnQYTOZcvRJUzOAKz6wAB8erEACml46ZUGHtagszGnNGwJ3SCtuPLP8jRodG4x1Dr64orcp+KNVY4zu3ma6R9/TzqzCxXAia+XeuIdlsWu7Uvgz2hLRqENJw9MFYAOjiuq6BGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiH9hJSO6zb6a+Kr0q3KbAkKSiT1K4hSXWohutaphjc=;
 b=Xuekq/pi5WGA3Lp3xoWlrjg63PFvyVkZE0gkCGDvDRASN7Q57tBPidlAIHIKCCOfGl8BQ9rQB+mLDPd8DUrLGYzO4FSlGdE9eLicYxMPXrlxrXjaEymDeqLqHVWLJQeCDTdxY72tQhUQftSvUTdP8qrqOnYh5h+NWYSiP89EQ+s=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by OSKPR04MB11367.eurprd04.prod.outlook.com (2603:10a6:e10:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 16:47:34 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 16:47:34 +0000
From: Josua Mayer <josua@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>
CC: Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 10/10] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Thread-Topic: [PATCH 10/10] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Thread-Index: AQHcR2nm7jmPZdZ/6UqZ+VqzMlEuOLTa6vMA
Date: Thu, 30 Oct 2025 16:47:34 +0000
Message-ID: <094ecbbd-ece7-44f2-b8dd-542d06544112@solid-run.com>
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-10-683f86357818@solid-run.com>
In-Reply-To: <20251027-imx8mp-hb-iiot-v1-10-683f86357818@solid-run.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|OSKPR04MB11367:EE_|DU6PEPF0000B61C:EE_|AM7PR04MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: fee00290-7ec3-43b6-1e55-08de17d40dcd
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MUVOZ3lCek0wUXYwSnJyVTlTQ2V5U3RDMjRnR0l0OGdqRmthd0xHSXN6ZTFR?=
 =?utf-8?B?U3F3UGdCNWlsUWpxL2FQNm1pWlErME1kQk9zU0xISGlQZFJNLy9EQ3VnblUz?=
 =?utf-8?B?azZDY3lteDJuQWN4MmZCUTF6dW9MM1hIRTNYVGZuQUplVy96Y0Jzb0NVaW13?=
 =?utf-8?B?OFdBYkUxUERtNjBJVTBKNDNsdlRZK0Zac2VTUEJwdGIvUlNxN0J2aTlHdHNP?=
 =?utf-8?B?dFdTQ0NQenVZK0ViS3U3aUNFWVJxTGJLa1Z1cjVVUEhJcVlzblNDSjMyTERa?=
 =?utf-8?B?anYrVTB3TzdDWVN0a0ZweDN6U243RTlrS1JNNE95RVQzS21RMmNoNlNpelZz?=
 =?utf-8?B?Nm4rV25jaEZpaHhIRU5FQ0xNenV3UzFQVUtCU204bmJ5dC9XUWlOMGUrekZ5?=
 =?utf-8?B?cEx0aGJzdDNsOGlwZGM3TThQREhWeGUweHd3UWVHcS8zZSswNlVxRWI3aXdG?=
 =?utf-8?B?SHUzbHphSXQ4Ly92ZDR2OWgzWEhMcTF3dmlXU0hteFphOVBoR2NWSS9XNFFQ?=
 =?utf-8?B?R0haNWt2V2E1QllBZm9YM2lJQ282QjNzY0d4eVZySGJTeHR6UXdsQjdHY1ZH?=
 =?utf-8?B?djBJZERqWlBxbFRFQ0JGbmFJWldEKzNUTEtrRGtNcDA3Z3lZL3NiYktYNlE3?=
 =?utf-8?B?blVjQ1hlakRtR1huMnF2VEh4cnBLdVRJNFpPSGJxak55Z0ZHNVU0N09pNTFK?=
 =?utf-8?B?dSt1bkFmV3VLR0dOSHVCNm8xektWUTJDUVJFNm9IRVJGZEd0LzF1L1N1ZG5v?=
 =?utf-8?B?d2xOdkh1SUIrYWlrMWFmTGpyWkdKYlBkcklPMkNjaTdqRHlXWHkvWXN4Rzhv?=
 =?utf-8?B?T0FWTzhBNkdJN3BCZlpWaW50YzdKTkliNWxwSVZwYW5UV1dSQ1lNZ2pEWno5?=
 =?utf-8?B?WUtzUDQ0ekdYMjBGYmlJR1ZST0s2YlN2TDBCMlNEZ2Y0anV3NzBwaW40TSs1?=
 =?utf-8?B?akYraXZMRlA2UHN4UTNpYlJCSDVmeVlKb2dIanNMemJXdUp3UUg3OWUvY0VO?=
 =?utf-8?B?bk1rSkJaekZDdEpHdHBGbnVRdGpiWUFDZkhLWEtzZ1lWbHZNYlQrUDIzcVhu?=
 =?utf-8?B?KzY0SWljLy9hOFhxRFFXc003ZE8zMkRtZmgySThWTnRtR3pkYmhMM0J4OXA0?=
 =?utf-8?B?enhwK2VnNks0R3kwUGpkQnA5aXQxNTB4MGFJak5lSTlZakRFa0k2bzNoNGdB?=
 =?utf-8?B?YnBiSEk3UW90eXlRTzNxbXpjNkcrNUtaMkY1Qmt6VnFMYUdRaW9OUldXazVz?=
 =?utf-8?B?TzlYOFdEL01GaHNBWk56dmZycXQvbUVCZnBmSm10ZjU3THJoNFhTQm9helh6?=
 =?utf-8?B?SmxGNVUySlBORVJUL28xVFZMZTYxU2pUaDgwa2E1RVRwTm9YMVlhRnFFUkxk?=
 =?utf-8?B?ZGFJRkFUMXN4V3pVb2c5TmZ5aXRwNjlBaXFvQ1o4Z2NUU2l2Tm90cHhFM0Fm?=
 =?utf-8?B?R2xLdXpEZ1lKbUdSUkU4aGZDNCs0RE1BL29scjQ5WUlCcGRxYnRGYWFuVko1?=
 =?utf-8?B?YUdQRktQT1l3b21rZkJIa1J6cnlBdG5PdkloOTh6OWJtcG00RTVxa0pqVFN4?=
 =?utf-8?B?a0h2YTJWMVI2OHo5OTRtaWJkTVVocmRBeHJUWHVtQTRSdCt4UEsyeUlQR3dq?=
 =?utf-8?B?Q2V4SFBQUVIxZmdOWnpuTG9TU0J2MVZwaDR6eGVQcVAzdDlERGlHTG1Hd2Ev?=
 =?utf-8?B?NlovWnFIanlhQWJKU3FOc25vRm9xTUdxamkrUFpzQ2E1SHNrOFVvTTQ0SzlF?=
 =?utf-8?B?ck51ekVENS9JenhUZ04ycUFYK1pzaTVnWEQrV05OYitnbXJPeTJadjErT2Rt?=
 =?utf-8?B?YytkQUVXUEloazNCT0ZhS1IxdHlaR0tZQzNkbXl4YjRvd1piM0hrVW9VUVIw?=
 =?utf-8?B?ZHpWb1IzY0h0Vllka0FGT29CNWIyVXoyU0llbHF6YmxLZ0JtNUt0MGFndDA3?=
 =?utf-8?B?czRoekt6YUZGeTg5c1lYT1RybVFYaHNSRXZ5NVR6aFY3YVQ1bnFsVC9MR0VZ?=
 =?utf-8?B?dXorNUtVdmNmWmYvK2xXTjFRZnR1b3hJT1JoOHNLeFRZYm8vemUyUU1WM1ly?=
 =?utf-8?B?eHZnWlovVmRBMVpmTVBrN3dYcEFVUG84VndLUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C7BCA6071BEBF48A038BA0F4854FBDF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11367
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 5a177687a8b14350a803d929838d5de9:solidrun,
 office365_emails, sent, inline:d2f983e1515754cdab4444136324b4c0
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f830b4c4-fd12-4ca7-15d2-08de17d40687
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|14060799003|35042699022|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eURRU3lOVmpkTDlEV3RwSWZmdGhGZldkNEIxaDBCVDM1b29ITks1Q09lTmFM?=
 =?utf-8?B?cmVZZUtWR21Zd1NCTlhpOHY5dFUrS20xSlVnN0l0TzR0di84R2YxZkx6ZzhR?=
 =?utf-8?B?aWtZZC8wNnRFRlN3N1lKQ0VFTGV6cVo3R091ZHR1ODVldUJ2bnNTeFZ5d3Bo?=
 =?utf-8?B?bTFvUEVHWTI0cVYwYXlLcjZVOTRBYUxpMldPcUdzZmtnaFpJY2JqekFsQkNu?=
 =?utf-8?B?WlUwcHRZa1hHdG5sM2psRU1vM09tWUhhZVZwTk9HTnlaVm44cEZPSWh4Z05E?=
 =?utf-8?B?cURYQmNsVXl1S0pEc2RyN2ZMbkJZMHVKZnVFR0t4MlNyczFHdUJJclVSVE92?=
 =?utf-8?B?ZzVTT25DbnVQeWtBNnZIMXVkVE9BS2JvU0Y2Qy9xa2ZLWEhRTURVOHhmUFg2?=
 =?utf-8?B?bnIrR1FIZGdUT1h6Z3NuVWNiWnNYMy8rc3p4aG5KUWkzR09WMzJhTWdyeFBi?=
 =?utf-8?B?YWlCdUp4UzRZL0dXeTlmZWptVFV3N0tRMU1pR0xUSW51ZUdRVytUOG4xSFBw?=
 =?utf-8?B?N3NJRFFqYkFlWFNxbEwwQ2xaOXNPMkYxazY2RGlGeWZodFFpeHRvMlpEL3lu?=
 =?utf-8?B?T2lvSVJpZ0FERndSZXJ1Zk1PM2tlSkV2bzM4bkZEM0VyZDIrWVVKV0FRbTBp?=
 =?utf-8?B?TU9hL1UvN3hRSlVYeXRqeFJkWjg1T0ZQY2VvT29qUG1mVXN6d3lwdVlqZlFO?=
 =?utf-8?B?U3ZnQzVETFpBSXVKNmwyMDdBZFVmZ0xyT01UcVY0QjNYTjVXL1BjY0U1c2do?=
 =?utf-8?B?TXJqUDRaOFpMbEVOSGg0S3ZZcmpua0FGNmpacW9nM3FCUXFQb0RQR2hLVlZr?=
 =?utf-8?B?M3haeDZITnNyWEpqSkNLL1FoVUYrL08ybHF0OEJsaGM2YUNjQ0pvcE9vR2VN?=
 =?utf-8?B?KzVZaFlWbkVxWGVRQTRQS2toWTA5VUF5RFUyOS92am9rQktjblN5TEtNdWY5?=
 =?utf-8?B?d1cvQ2piZFM1WmQ1eGIzaXduWWlLNVRBVmZ5bmhlc0s3bStHMU5Xd3Z0NUtE?=
 =?utf-8?B?cXBiNXlWcTk4Zkx2eEdkNjNxTkF5aDQ5MWJMV1ZadG5XNEVRSmV4Z3JRYkV5?=
 =?utf-8?B?QlI0b3A3VWVwR1lPT2RueTlQdkl4ZG5hWTVWL3ZzMXdXQUVXY0g4U3pCOHZm?=
 =?utf-8?B?TG9BT1Q0K1ZqRFJOL2ZMM0FtdU9SUFRBbThSeHBUN2RnZlh6bVFKNFplTUF0?=
 =?utf-8?B?S2REWW9vQnNPTHBwdzlYMWRnQ1JDZDV4czFqNVRLWTVHUVI0c2VYUE9NSCs5?=
 =?utf-8?B?QUlQTFJsNDE3Umc4WmlKVDYybFBiZ09NN2c4QXQxN0VNMjRDcTJKSEtTNDBn?=
 =?utf-8?B?Y1BBR213c3ZTSDloTEpPQ2pJWWVuVThYOG1Zekc5N0dHK2JaZ0xrR1RleFY0?=
 =?utf-8?B?Mkd6aEpLZjU0ZWNQYnBzYVBYcEcwakVaS3VRT2wwanRwOEtvVFJwM0tDZksw?=
 =?utf-8?B?QkpjV2RsaTkxMjFOVXJIODNPSjVEOVdrR2c4OVpjdVVDZENyNGttaXN5d3M3?=
 =?utf-8?B?RWNiRWhEZFFZRzNqdjBSQ1NwMGxzekIxbVFwUlRPSk5yRmJBdE0vMnFDYlJp?=
 =?utf-8?B?dGpLSnZZNi8rbHJkSkpRaVpoSmpQa01XRk8ySXNmNTd3ZUJxb0Y1TVFGWmcy?=
 =?utf-8?B?aTJmeWFMTERRSWhKeHFWaGp1bUJGNitpU1laRm45b1RtNEJxdVpvSlhjKzJE?=
 =?utf-8?B?bjFCT0tEZm1KOG9Ld05BN1FuTXpTK3NPWGFML3pyMDkzdVA5d3JpSlNnRjJo?=
 =?utf-8?B?ek02TDhlUWp4REpndUorR2F2Q01pODB3R0xNWG9oQ1lpQmt0L1NkMUp6U3Fo?=
 =?utf-8?B?RVM5SzU5VFhXbVIxcWU1YS9VVkhkbUxaOHNDUDNJcUkxa1hhTDZXU2t6Umpp?=
 =?utf-8?B?c25rYWp3RlJwSUJaWUZra2R6Q1NnZlFUUVRHTHVNYkMrYlllYlZlTUZ5d1FD?=
 =?utf-8?B?b1QvN1JOMCs4YmZLbnFVVlh4K0ZvOWNoelZGOVFZemlkdnMzc0hUaXRFeXRK?=
 =?utf-8?B?Z0t0a1M5L0p6eUlvN1BBMGNWV2M2T2ZrR3pDMHVoZFZWTTNPZ0tFVmZzS0R3?=
 =?utf-8?B?RGl0SENUTFpHM3AyK1AvSHpBUS9DU0lXc2xuazF6MWlMSWV2YkljYXNWVlFn?=
 =?utf-8?Q?e6PQ=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(14060799003)(35042699022)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 16:47:46.4807 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fee00290-7ec3-43b6-1e55-08de17d40dcd
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6888
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

QW0gMjcuMTAuMjUgdW0gMTg6NDggc2NocmllYiBKb3N1YSBNYXllcjoNCj4gQWRkIGRlc2NyaXB0
aW9uIGZvciB0aGUgU29saWRSdW4gaS5NWDhNIE1pbmkgU29NIG9uIEh1bW1pbmdCb2FyZCBSaXBw
bGUuDQo+DQo+IFRoZSBTb00gZmVhdHVyZXM6DQo+IC0gMUdicHMgRXRoZXJuZXQgd2l0aCBQSFkN
Cj4gLSBlTU1DDQo+IC0gMS8yR0IgRERSDQo+IC0gTlBVIChhc3NlbWJseSBvcHRpb24pDQo+IC0g
V2lGaSArIEJsdWV0b290aA0KPg0KPiBUaGUgSHVtbWluZ0JvYXJkIFJpcHBsZSBmZWF0dXJlczoN
Cj4gLSAyeCBVU0ItMi4wIFR5cGUtQSBjb25uZWN0b3INCj4gLSAxR2JwcyBSSjQ1IEV0aGVybmV0
IHdpdGggUG9FDQo+IC0gbWljcm9TRCBjb25uZWN0b3INCj4gLSBtaWNyb0hETUkgY29ubmVjdG9y
DQo+IC0gbXBjaWUgY29ubmVjdG9yIHdpdGggVVNCLTIuMCBpbnRlcmZhY2UgKyBTSU0gY2FyZCBo
b2xkZXINCj4gLSBtaWNyb1VTQiBjb25uZWN0b3IgZm9yIGNvbnNvbGUgKHVzaW5nIGZkdGRpIGNo
aXApDQo+IC0gUlRDIHdpdGggYmFja3VwIGJhdHRlcnkNCj4NCj4gU2lnbmVkLW9mZi1ieTogSm9z
dWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+IC0tLQ0KPiAgYXJjaC9hcm02NC9ib290
L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUgICAgICAgICAgICAgfCAgIDIgKw0KPiAgLi4uL2R0cy9m
cmVlc2NhbGUvaW14OG1tLWh1bW1pbmdib2FyZC1yaXBwbGUuZHRzICAgfCAzMzUgKysrKysrKysr
KysrKysrKysNCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtbS1zci1zb20u
ZHRzaSAgIHwgMzk1ICsrKysrKysrKysrKysrKysrKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA3
MzIgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvTWFrZWZpbGUgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmls
ZQ0KPiBpbmRleCBjNTYxMzcwOTdkYTNiLi4zZmJjOGExYTFiZjZlIDEwMDY0NA0KPiAtLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmlsZQ0KPiBAQCAtMTI0LDYgKzEyNCw4IEBAIGlteDht
bS1ldmstcGNpZS1lcC1kdGJzICs9IGlteDhtbS1ldmsuZHRiIGlteC1wY2llMC1lcC5kdGJvDQo+
ICBpbXg4bW0tZXZrYi1wY2llLWVwLWR0YnMgKz0gaW14OG1tLWV2a2IuZHRiIGlteC1wY2llMC1l
cC5kdGJvDQo+ICBkdGItJChDT05GSUdfQVJDSF9NWEMpICs9IGlteDhtbS1ldmstcGNpZS1lcC5k
dGIgaW14OG1tLWV2a2ItcGNpZS1lcC5kdGINCj4gIA0KPiArZHRiLSQoQ09ORklHX0FSQ0hfTVhD
KSArPSBpbXg4bW0taHVtbWluZ2JvYXJkLXJpcHBsZS5kdGINCj4gK0RUQ19GTEFHU19pbXg4bW0t
aHVtbWluZ2JvYXJkLXJpcHBsZSArPSAtQA0KPiAgZHRiLSQoQ09ORklHX0FSQ0hfTVhDKSArPSBp
bXg4bW0taWNvcmUtbXg4bW0tY3RvdWNoMi5kdGINCj4gIGR0Yi0kKENPTkZJR19BUkNIX01YQykg
Kz0gaW14OG1tLWljb3JlLW14OG1tLWVkaW1tMi4yLmR0Yg0KPiAgZHRiLSQoQ09ORklHX0FSQ0hf
TVhDKSArPSBpbXg4bW0taW90LWdhdGV3YXkuZHRiDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0taHVtbWluZ2JvYXJkLXJpcHBsZS5kdHMgYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0taHVtbWluZ2JvYXJkLXJpcHBsZS5kdHMN
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uMTEwZTdmZjFm
ZjEzNQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhtbS1odW1taW5nYm9hcmQtcmlwcGxlLmR0cw0KY3V0DQo+ICsmdXNib3RnMiB7DQo+
ICsJc3RhdHVzID0gIm9rYXkiOw0KPiArCWRyX21vZGUgPSAiaG9zdCI7DQo+ICsJdmJ1cy1zdXBw
bHkgPSA8JnZidXMxPjsNCj4gKwkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gKwkjc2l6ZS1jZWxs
cyA9IDwwPjsNCj4gKwlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiArCXBpbmN0cmwtMCA9
IDwmdXNiX2h1Yl9waW5zPjsNCj4gKw0KPiArCWh1Yl8yXzA6IGh1YkAxIHsNCj4gKwkJY29tcGF0
aWJsZSA9ICJ1c2I0YjQsNjUwMiIsICJ1c2I0YjQsNjUwNiI7DQo+ICsJCXJlZyA9IDwxPjsNCj4g
KwkJcGVlci1odWIgPSA8Jmh1Yl8zXzA+Ow0KPiArCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzQgMzAg
R1BJT19BQ1RJVkVfTE9XPjsNCj4gKwkJdmRkLXN1cHBseSA9IDwmdl8xXzI+Ow0KPiArCQl2ZGQy
LXN1cHBseSA9IDwmdl8zXzM+Ow0KPiArCX07DQo+ICsNCj4gKwkvKiB0aGlzIGRldmljZSBpcyBu
b3QgdmlzaWJsZSBiZWNhdXNlIGhvc3Qgc3VwcG9ydHMgMi4wIG9ubHkgKi8NCj4gKwlodWJfM18w
OiBodWJAMiB7DQo+ICsJCWNvbXBhdGlibGUgPSAidXNiNGI0LDY1MDAiLCAidXNiNGI0LDY1MDQi
Ow0KPiArCQlyZWcgPSA8Mj47DQo+ICsJCXBlZXItaHViID0gPCZodWJfMl8wPjsNCj4gKwkJcmVz
ZXQtZ3Bpb3MgPSA8JmdwaW80IDMwIEdQSU9fQUNUSVZFX0xPVz47DQo+ICsJCXZkZC1zdXBwbHkg
PSA8JnZfMV8yPjsNCj4gKwkJdmRkMi1zdXBwbHkgPSA8JnZfM18zPjsNCj4gKwl9Ow0KPiArfTsN
CklzIGl0IGNvcnJlY3QgdG8gc3BlY2lmeSBib3RoIHVzYi0yLjAgYW5kIHVzYi0zLjAgaW5zdGFu
Y2VzIG9mIHRoZQ0KaHViIGV2ZW4gdGhvdWdoIHRoZSBob3N0IGlzIHVzYi0yLjAgb25seT8NCg==
