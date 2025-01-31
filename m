Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5AAA23FBA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 16:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7D510E38F;
	Fri, 31 Jan 2025 15:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="wvYxOC9e";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="UnFRx7x7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8FA10E38F
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:39:56 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VF52ts028234;
 Fri, 31 Jan 2025 15:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=p1qN964Tuv6R3CuQc8x+d61tr
 SRtSxmEWc4NvXCBgew=; b=wvYxOC9eZqENtVsbAmM64DSW+8T6SXPvj/ryJY9If
 0p9EBOABThjepA+ZpgoBSQka11NL6IR0RPuEVbH86VBvYHesd7EN6I/HvGBAOxat
 pQCjcE1yLI4E1sAlJxiGBf5INsla+abPapHDtm7h2cwwbs+iqjCzcOj2eE+BslmL
 0WjKxCzhtWVHImSI2DZjABg2HKNj+8j39VVvCtS79+6in4/DnkuHQ7zQyRck39RG
 0on8ajZdNrLxnvqeZYsn+fCOYYuigLvnmTAmYxdFBAO9BxVwToWlYYCzLh2FMN7l
 KJKOqfaOK/8s3MaD+f+qljhQUpkCYjznM0KT34lCkGqNw==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazlp17011030.outbound.protection.outlook.com [40.93.68.30])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 44enydak27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 15:39:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBPGyyW4iz9pZIQaEEgVNeDMMC1CCbeDiUjq+djmwkD9rvkgWpwTKUxuljRy4gIkDm2N5gHtXtCyDYgwjYZwsbBXHjXNzK1HJFxj+jVimaF8i/xSSehELlR1tK+8c0IiyDxKvGvXN2xfuzVcaHY2EfL73V0gpTyP/qYMK2kVVY8TjwRGqi7Ftbkofi7hNEDNui+2LpwjHv1DPCr1LOp8hqOsQTweWVVqVD6bALiebcoitptybEvieqZ0hM9FfYi+i1irF6+a+dDHyexxRj3QZklH09A7LM2LkOjH0zakclb3t2DlFQ2CxZajd7kuzQMZ23MpbDv5nIu5s478+lWXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1qN964Tuv6R3CuQc8x+d61trSRtSxmEWc4NvXCBgew=;
 b=yjdCPO6pLZJEt4CrbHhXhlRFMVNVOtgwoafkpAxlEGd49Yxn53+i/JEgyjHfLqKlXg5DS3NYK2rtVcdWYrBDUXfJAJl8Zu/U8Sy/cY1ajzpwGao5y8hCxATFTgKZ866NelpjZHpFtmq+8A0BjLJXr5YcBPBSa5r8H58SFAFsA6SDoHEPC8TZiO8nmeXaMZ5LHx2zUMfFHSybE87CFffCug3cOvQAcaHaK+djX3chv+uw4DqpRj6zWetuhpSIHXlzXzMMi/QCMsw49FZUR/eIE0mwJts8xJm959YlnXhJS4t8Fw13so8NYlItBCDn8nzZ7EbrghAllzk4J3TeEQ6n/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1qN964Tuv6R3CuQc8x+d61trSRtSxmEWc4NvXCBgew=;
 b=UnFRx7x7UgM2Nn3gIRF3CZcagAqhyK1MubbkOpqp7A0r7oD+iwIEPvt/yBzjNM4xs6xwpWWfIq3eOnEMU6pZngvF1r+L6s/3mljnau8W7KNF6G8fBrXxdKvKB4S84ChivSU+j+wbFUXLpF8m0CJoSv9gCuIBzlpA18wbZLVmSVo=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5503.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:287::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Fri, 31 Jan 2025 15:39:31 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:39:31 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, "mturquette@baylibre.com"
 <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "drew@pdp7.com" <drew@pdp7.com>, "guoren@kernel.org" <guoren@kernel.org>,
 "wefu@redhat.com" <wefu@redhat.com>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "paul.walmsley@sifive.com"
 <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, Frank Binns
 <Frank.Binns@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "jszhang@kernel.org"
 <jszhang@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v4 10/18] drm/imagination: Add reset controller support
 for GPU initialization
Thread-Topic: [PATCH v4 10/18] drm/imagination: Add reset controller support
 for GPU initialization
Thread-Index: AQHbc/ZSaeV8ojs45k+go/8pmi3jdA==
Date: Fri, 31 Jan 2025 15:39:31 +0000
Message-ID: <fd46f443-b1f9-4f82-8d73-117cda093315@imgtec.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194838eucas1p1829115b2b05d209a7c277eccf56e0b90@eucas1p1.samsung.com>
 <20250128194816.2185326-11-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-11-m.wilczynski@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5503:EE_
x-ms-office365-filtering-correlation-id: c95010f7-6a86-4a0b-0b67-08dd420d749c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?RmRyV1NrTXJ0RjhRS0QzaUdzWnBGVUpmd1VTcEZ0UkZGT0FneHhodTdPR2t1?=
 =?utf-8?B?QTVuTTdCU0VWVGFzMkRKOEMyU3FjZ3R6bjJHaDVmOFdEU1FzbUpjaHFNeThR?=
 =?utf-8?B?bjZnc1VIZHk1ZktwZVdBNCt3cXkwNzB4OWloeHBiQkd3Ykk1VmxjZno5MXVl?=
 =?utf-8?B?WGFiRnF1ZUNSZXZVbU1PbUZKb0hkdkJsYXhKaEM2UE1rODhac2VtN01OT2ow?=
 =?utf-8?B?OGR4ZmdReklNM0JROFhCcHhkRHF2THBQaHdsK0JBUzI5ZEtPbHVKVlJ6ZUxC?=
 =?utf-8?B?VkJIdlMydUtmWVhiYUF6dlJWSFk2UEpuTjNLR2Z6emdrbzdHc0xWMWJ0RVJj?=
 =?utf-8?B?L2FQT1Z1ZjJ2UnFCdDk5OEgzZEg1UW01RCt1UzlqeWdMM2dGMGpQMzh1QTdN?=
 =?utf-8?B?MzdYQTRURStqYzdVL2cxYm5FTEZiYzlUdnpxSHFlV0I5MzlvVzFVaHFtU29w?=
 =?utf-8?B?Z2s0QWFqMFBPcitlMkdlZnBhLzJUR1VreGpaWmdtZ256Znl6TnpDekFSYTNR?=
 =?utf-8?B?VFVYTm9td1YvRzg2SDNydnRlM2Ivdm5EeWgrQUlaRGovTlExNU85cFJ1b3la?=
 =?utf-8?B?YThqaVNUSklhVERCQ3puSFptTXlJQmNzQm1hNXNzc2Z2R3hBQStRUFZBY2VF?=
 =?utf-8?B?dklHOEsvQ1NIK0szdFBydHpWU3dFRW1MZEczSVBzaWgzMk1UQTZnTXFqTjhJ?=
 =?utf-8?B?V3NKRUZKd085VkpsOHJJVjJlV0xIc0U2ZWRhaG1IZmhObWEwRk0remJqaVIw?=
 =?utf-8?B?WWFoUUdVamk5b283NEdXb0pHemdpSlRHUWlMVlRTNXZKTHIwS0RGcE85b2h5?=
 =?utf-8?B?M05JNllxQ1NyeGZzc21FNFdvbnNBWTZqWmNwNW9nVlV0eW9pMUNtWmVZcVJl?=
 =?utf-8?B?dG1ZV1did2UvUWZ3K1RZdnlxZ2RsY2p0NkRBTzdTQ3FGSXdNeE1zNFZkN2k2?=
 =?utf-8?B?V0ozVTV0NFIrallSMWhFcmdEM0JNdFQzdmoxN1F5Um5kVnJQRVNDaFFnemk3?=
 =?utf-8?B?YUtrQSt5UGdQRThUcEU3ODRNd0ZNVGpCU2wraHR6LzhIK0pIZkdNRTNvcmZs?=
 =?utf-8?B?MW5kWDhHbVRLRnpzMmpXek1QQmI1QXhJRFBCaW1UQ2lYRVdDR0t5b0tLRHdq?=
 =?utf-8?B?Um5yTXJzelhrUCswdzZDY2ZJSFdvYklmNmdnajF4djZjdHo2bytrZERXSWJE?=
 =?utf-8?B?b3pvdUZEcGoyd00vZmV1Q0h1SzVac2lQL0h5ODJBZXI0ZUp2VDVMeEVPZFNN?=
 =?utf-8?B?b3JobWN5d05TQTA3VGlFRnl3ZXVCbmIyQ0ErWXJleVFMcXRZbkhwYW56RXRY?=
 =?utf-8?B?endPSWJmNmhoYW53MEdVQ29ZTlZYM3Z3M3hMMWJtMGZIWklrT0YvSFFyM2hB?=
 =?utf-8?B?c1FhckdYNEl0V3NDeWxsQ1BpMTIzb3M1V1VMcEJLbzdmaWRNNW5sUnBieUNX?=
 =?utf-8?B?cEd0NklCN05yMkN6Z002TkpESGsxRFlEUm05MWg1Q09WeTFjYksvVXIrUTNT?=
 =?utf-8?B?N1FyN0FZWllUTDdlQWlSZzRuYTJBekxnNjJtMWRBU2gwa3hsZGZDQStNUUM3?=
 =?utf-8?B?OExRb25DTU1VdmNZRTBKWUtXNnN5aUlqSitxNTc1NDZjSUgrMkdoNTQyenZ0?=
 =?utf-8?B?Q2lxRW1YdFpEU1VuVVp6S2plL0lWbmdHY0hRY1IrVUdlQURSNHJSSzV6Uk5L?=
 =?utf-8?B?TXUrT1Z0elZhaGQrSkI2d3R4ODlLWi9CendvWHZ1bTJSNk5NMDdvOHN0YXgv?=
 =?utf-8?B?Q2dxcVNyZ3I1ZEFtOWhoT3pqb1FubHNlU3N5RHZRZHBCcklvZytwS1pkeVpU?=
 =?utf-8?B?MjUvekRWeDFqTUEzK0MzYmZCcWtIYW9BQ3Zpb04vaDM3T3B4cHd3dkdXS2xv?=
 =?utf-8?B?ZEZTMzdsRTg4YWpLMUQzcTd4T3g3QThJaGhzbUNqYUsvZzEzbm1LOE8yblRD?=
 =?utf-8?B?T2t0ZjlyL0RTZTRyYVNPWk43N1JGZGZMWEJRTEg3OEJiQXhDMzhhdDljK1cx?=
 =?utf-8?B?b0podG9DTEFBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vyt5MWMrbGtzNW00WjRuZ2s3L1llWDIwSVBoQzh2Tm1oYnlXRjB2TGdZWlFE?=
 =?utf-8?B?TThIRHYrcmVFNXBEdmF6Y1BzSFdaSDVQSmFyazhTTkMzaHJUK1pnTEtLKzQ1?=
 =?utf-8?B?eHgyWWlheTZjaWN1WTVsdVZiUXVKMkdPU2dlREVkVzBNNjhFT2NwSWxDZ0tV?=
 =?utf-8?B?a1JUYjlwL0JKQzI2Y0J5TmNEUjA0SjR5cU15SmxTRnFSa1BKZ25QMit2eVNh?=
 =?utf-8?B?OEd1TXIzVjZVOVZLbGJzendkaWh6Tm13LzBVdmNxcFI3VTB1TENuZERMNk85?=
 =?utf-8?B?aXo0QzdmUkgwSUVWaXdTcjY3MlRPTXJBeWI2NktyUjZ2dmhnRHpBUFVoSm5t?=
 =?utf-8?B?YUVsVjNpTklLNHVKaWRxQzRIT05NTGxjQzFOd2ZzUDdLa3czamRFZmdjOGtZ?=
 =?utf-8?B?UmlQc0lQRlhybFNsKzM1RnhZeGVyUk9IanRMZm5LUDJ1K3ZjZDJJelNhT2w3?=
 =?utf-8?B?R2tnVjhIVWM0NzlDYS96amJIdFFiRmJ1aUZqa21SMzF6a3piZGxMY2lTbGdD?=
 =?utf-8?B?OXl2MkZmVXhIb1dXT3cySEZRcmF3SE04NzF1OWg2b0x4cUNGSy9wQ1RQZXVV?=
 =?utf-8?B?THFac3lNdVZrcUNoc21jMFF3L2dYazFOUjlOVzZLVjY0N0syOVdFU1JxYk1R?=
 =?utf-8?B?ek80V0lSa3d5S3pxVWhIaGFYaDMxcFUrWFgvNzlsMHYxYmFoUkZNOVhBZFpm?=
 =?utf-8?B?VTU0cm1XYXFvL1BOdzNBSTBlMm5EcUVmTnppcVZzUGVMaTBobDhob0tJUWVi?=
 =?utf-8?B?YjBLY1VDOHpuWHVVUmtPNVE0eVduVXJhM1VvblQ5eUFXMTNDZUxTWExDdVlT?=
 =?utf-8?B?ZUtRLzdYb2pyUlEvNEVadm15U01QbUpFOTBlS1RaZEhCci92UjFxTWlQd2F5?=
 =?utf-8?B?TlR5dWd0dUZQZkRYQlVhVk11T3FLRyt5YjFGRHhGSTVHMktHRTljdTVIZmYy?=
 =?utf-8?B?TC9DRHd1b0l5SGpNdGtCY01RdjB0UmlONFAxc2ZCR2xsanJjYzYxUDl2UWNN?=
 =?utf-8?B?NnNmSXEvNjVSQmt5TDFKbE9lYS80TUMvUEZySFJUVi9Da0NmSTRlK0F3anM2?=
 =?utf-8?B?WFJkbWhGelRFaXZjdGMzOVltbEw1WEJFdmIvZzlsaXU2YzJ1V0ZQWkp6SWxo?=
 =?utf-8?B?YTl5QnQwdGl5dzltREp5V0c4UzQrOTJrTFZPbFRvRG1XNzZyd1BTeG9TQVFu?=
 =?utf-8?B?QVY4YjVyYkYwM0FtaTYzbVhGMWJaZ2YxL216VG5JVXJ4WjZVMS81dVFYclF4?=
 =?utf-8?B?MXlWYUp3VzdoY2hWUCttN1h3R1dRZml3SzVLLzY2RWhVeGMxNWp1ZnoxR0pi?=
 =?utf-8?B?eUZ2d0JGOTJrdi81TnE4UWlna0tMd2pzU1ZaNzR1UmtBZnBEOWdzYkFsY0VE?=
 =?utf-8?B?b1g5TGM2THNYWHcrUmdqWGdFTFVsVTZWTk9zT0FnaVpIT2h3RFFYRXlQUkNO?=
 =?utf-8?B?R2hEczl6U3NUL0toV2ExbURtdXlSNzFjYzdZSFhsZSs5aVZGMWhoNW9QT3pj?=
 =?utf-8?B?K0IxQ3I0UjRYWElNc3ljZW0wN1g1L3BzZGw5MU9NWkV2b3gzdXNGaUlNRmhP?=
 =?utf-8?B?N1NqWDZhSXBKd1JPc0dPakNZWnNmSEh1SmNFb2MyWFlNckMyOTBvenZmdW9j?=
 =?utf-8?B?SkQyaG9LQjBKRVl3aEliRHJlZXFhK25LVU80OVM4WS84azdNdnU5NzN0dWFU?=
 =?utf-8?B?bStJU0dVUVBtbTI1WlJSY0szemszMnJTWkNHRnI4T3NzRnE3YmJPL2sydDBT?=
 =?utf-8?B?UUpGbTl0NXhvT2xhZWVpdUNldTcyTUJ0L25wa2ZLY1M5eXFiM25RY3dMVDBX?=
 =?utf-8?B?THJzOC9kUjhPZVhNQmlTY1NPTWVkMlh6UU5OZ3dGTFNUbUdqVStGcnJKeWhO?=
 =?utf-8?B?OXg1OFBnSnRsb3VXZHZwQUdOZXJqREZjeUhpbURXWXB1eVpuczFacG9VbWVC?=
 =?utf-8?B?UW5tS3NzZytKWkNwTFduZis3VkdXSUlUZjBIT1ZzS3RRK2djdjJ0RW52cVBY?=
 =?utf-8?B?MW1iSENBY21vYTJWeGdLRUlsZ3BDeXdRZmN1bVE4OUtoYVd1Q2hrUmYvNkgw?=
 =?utf-8?B?NlNaWU9mQU90eUdIaEoycG9ZU1FzRGkrekpMZEZXanFGQlMySlZrVEw2NFlw?=
 =?utf-8?B?TGhNckxlMlV1S0doTG5mNjU4VXJyWjgvVThSVTVHNnE3cWpwSFU3aWhaL29a?=
 =?utf-8?B?blE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DXa8rneT8fhJ55pTEKU0QuO5"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c95010f7-6a86-4a0b-0b67-08dd420d749c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 15:39:31.4467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EinnYa+dKCJQ/GF/LZJVJVc7QyFUYf8QP+iAwdPbBzSpAdycZEvqJJ3RUTcKj0mSjL11bQK4pvS3y4I1cSrLdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5503
X-Authority-Analysis: v=2.4 cv=OcxiDgTY c=1 sm=1 tr=0 ts=679ceeb6 cx=c_pps
 a=h72tj/vcfevIRsfYUpnJeg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=jLrEm19SgYDvxoDDXOkA:9 a=QEXdDO2ut3YA:10
 a=S57EuMD_WVfD5Wtj-XYA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: kmMEDkSo_mA3yH8WVQtMXmXZPp0oi1K_
X-Proofpoint-ORIG-GUID: kmMEDkSo_mA3yH8WVQtMXmXZPp0oi1K_
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

--------------DXa8rneT8fhJ55pTEKU0QuO5
Content-Type: multipart/mixed; boundary="------------dT5J3fciB6XdX12J3tbfN9Ye";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
 m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Message-ID: <fd46f443-b1f9-4f82-8d73-117cda093315@imgtec.com>
Subject: Re: [PATCH v4 10/18] drm/imagination: Add reset controller support
 for GPU initialization
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194838eucas1p1829115b2b05d209a7c277eccf56e0b90@eucas1p1.samsung.com>
 <20250128194816.2185326-11-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-11-m.wilczynski@samsung.com>

--------------dT5J3fciB6XdX12J3tbfN9Ye
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/01/2025 19:48, Michal Wilczynski wrote:
> Certain platforms, such as the T-Head TH1520 and Banana Pi BPI-F3,
> require a controlled GPU reset sequence during the power-up procedure
> to ensure proper initialization. Without this reset, the GPU may remain=

> in an undefined state, potentially leading to stability or performance
> issues.

Can you reword this to clarify that _all_ IMG Rogue GPUs have a reset
line that participates in the power-up sequence but some SoCs handle
this in silicon and/or firmware without exposing the reset line
directly (as the currently supported TI SoC does).

>=20
> This commit integrates a dedicated reset controller within the
> drm/imagination driver. By doing so, the driver can coordinate the
> necessary reset operations as part of the normal GPU bring-up process,
> improving reliability and ensuring that the hardware is ready for
> operation.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/pvr_device.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/imagination/pvr_device.h |  9 +++++++++
>  drivers/gpu/drm/imagination/pvr_power.c  | 12 +++++++++++-
>  3 files changed, 41 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm=
/imagination/pvr_device.c
> index 1704c0268589..ef73e95157ee 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -25,6 +25,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/stddef.h>
>  #include <linux/types.h>
> @@ -120,6 +121,21 @@ static int pvr_device_clk_init(struct pvr_device *=
pvr_dev)
>  	return 0;
>  }
> =20
> +static int pvr_device_reset_init(struct pvr_device *pvr_dev)
> +{
> +	struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
> +	struct reset_control *reset;
> +
> +	reset =3D devm_reset_control_get_optional_exclusive(drm_dev->dev, NUL=
L);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
> +				     "failed to get gpu reset line\n");
> +
> +	pvr_dev->reset =3D reset;
> +
> +	return 0;
> +}
> +
>  /**
>   * pvr_device_process_active_queues() - Process all queue related even=
ts.
>   * @pvr_dev: PowerVR device to check
> @@ -509,6 +525,11 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	if (err)
>  		return err;
> =20
> +	/* Get the reset line for the GPU */
> +	err =3D pvr_device_reset_init(pvr_dev);
> +	if (err)
> +		return err;
> +
>  	/* Explicitly power the GPU so we can access control registers before=
 the FW is booted. */
>  	err =3D pm_runtime_resume_and_get(dev);
>  	if (err)
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm=
/imagination/pvr_device.h
> index 6d0dfacb677b..f6576c08111c 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -131,6 +131,15 @@ struct pvr_device {
>  	 */
>  	struct clk *mem_clk;
> =20
> +	/**
> +	 * @reset: Optional reset line.
> +	 *
> +	 * This may be used on some platforms to provide a reset line that ne=
eds to be de-asserted
> +	 * after power-up procedure. It would also need to be asserted after =
the power-down
> +	 * procedure.
> +	 */
> +	struct reset_control *reset;
> +
>  	/** @irq: IRQ number. */
>  	int irq;
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/=
imagination/pvr_power.c
> index ba7816fd28ec..e39460d594bd 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -15,6 +15,7 @@
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/timer.h>
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
> @@ -252,6 +253,8 @@ pvr_power_device_suspend(struct device *dev)
>  	clk_disable_unprepare(pvr_dev->sys_clk);
>  	clk_disable_unprepare(pvr_dev->core_clk);
> =20
> +	err =3D reset_control_assert(pvr_dev->reset);
> +
>  err_drm_dev_exit:
>  	drm_dev_exit(idx);
> =20
> @@ -282,16 +285,23 @@ pvr_power_device_resume(struct device *dev)
>  	if (err)
>  		goto err_sys_clk_disable;

This is where I'd expect to see the 32 cycle delay that's currently in
P9 ("reset: thead: Add TH1520 reset controller driver").

If it turns out that delay is required in the reset driver, would you be
opposed to adding it here as well? It's a very small amount of time and
would make this codepath more versatile to future reset controllers.

Cheers,
Matt

> =20
> +	err =3D reset_control_deassert(pvr_dev->reset);
> +	if (err)
> +		goto err_mem_clk_disable;
> +
>  	if (pvr_dev->fw_dev.booted) {
>  		err =3D pvr_power_fw_enable(pvr_dev);
>  		if (err)
> -			goto err_mem_clk_disable;
> +			goto err_reset_assert;
>  	}
> =20
>  	drm_dev_exit(idx);
> =20
>  	return 0;
> =20
> +err_reset_assert:
> +	reset_control_assert(pvr_dev->reset);
> +
>  err_mem_clk_disable:
>  	clk_disable_unprepare(pvr_dev->mem_clk);
> =20

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------dT5J3fciB6XdX12J3tbfN9Ye--

--------------DXa8rneT8fhJ55pTEKU0QuO5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ5zusgUDAAAAAAAKCRB5vBnz2d5qsJba
AQCWFFQ0oujc0Pyob5edMcvzdr9QksGreyj/bM2gT+hnAgEAwQDrImD/aog93PRObykb6maOBgLQ
c60MxnqbH+B3PwI=
=bST6
-----END PGP SIGNATURE-----

--------------DXa8rneT8fhJ55pTEKU0QuO5--
