Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D4FAE6761
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 15:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D642889131;
	Tue, 24 Jun 2025 13:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="AW6CM9E3";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="MMYi7yXM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359F410E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 13:54:26 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 55OCIbP1036377;
 Tue, 24 Jun 2025 14:54:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=eVz56u9fIxeU6sD5V+WKeUZwW
 2pwnr7+sFUdyjqfpQw=; b=AW6CM9E34/W/sl9ruggLrJwQCs/vOtrdOJFRiQ5Mt
 ycE5lTzx+xgUhVpCJBMB3NdyKHOrfPDqKZBwxPmPc7pKDFKA430/OOUz7omcWboC
 z9ACxbjZFKhucmD6SFuvaSufQtdD2xG0jEYivW59ebuck0u8Ave7IWeHfBqTTWVL
 Nr7Q77FaMSj2Vo281nQAp2zD/ZZ/edzpt0cVTa9Z4xvTrsDIX6XPMQzvTRDiN32T
 Gr2An61xKlwissWuG6PTt095NlzJYh3OD2lkPFi7RFALe6uey0wU/XYYq7s30S/p
 KkOhFctEgpVGcblveuFOtNuzF8rloQ/yBpakvg75QgY9A==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021089.outbound.protection.outlook.com [52.101.95.89])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 47f7v6rrj5-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 24 Jun 2025 14:53:59 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMFVOzXhBWsauq6NsE3NsJgf5uT0CeIxeJSRue1BSpA7gleYACROX2eEJG53E3/Re0lRCuTAyCcxoxrnQa6SS29rK19fR018jPvi1eJTsej235eUo/iZEpNxgt4qTpOMi0AjK/K1RZcceArOsoBIFM8J2P8QbxWGoiM21SJ3F+CIpS0VhGby3mKgDOOWjhgl/FZjrPMBIBdIeCsnwrdMAqojxCJDLH9fKpZUQ9l9cqL4VDnCseIGadS7ogvpQhVakvaQ1JrLCXuLTAKwtdeumXdWHcCQaB0/Vqp8xiYotqHKMFF6Qw/jhWevlHvN2P/hc3PTTe0WxXMZ+1fvKSbraQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVz56u9fIxeU6sD5V+WKeUZwW2pwnr7+sFUdyjqfpQw=;
 b=OUNIOhA/gF+yYLDQ/YReIDICgB1M9irHP/HCZqnvn8enW3j02Z4EPxlZtE3SQbE7L8BTki24xBB8m1OeKy2fudCrj0jkpba4riJLCFaDjQlvLLEnKPKsY3f5QFeA+tixAv0KFyD2/+WM5LBwoKxf373YjSiSOYZ6wIFZLIYiwEo34NKTaM3c8pfp5vQtmEZMskcNHDfPnUpduS//hU0vI+3tpV0Csz8mn/mprDUJXZ6qgNn5eVxTozNJrE2hFkSe9bRVIxrSLOJjnQay1Dx22Gj9z7z0qieuVNH4D0TwoM7nPj6xFs+gQ1gisk5w5n04wMfz8ZdOMwN0anhesRkmQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVz56u9fIxeU6sD5V+WKeUZwW2pwnr7+sFUdyjqfpQw=;
 b=MMYi7yXMk+3Lh0mYsctTVrrPlqZ7cme4KUuonL+4oMBqoNLIoV1M7dT2UqEVZNVVw/2khkkSRdW3pg9Mmr1Ci1zXecB3Hy1JD0ouplTSV5z5tLFrxGLpVV95SKepntbErzC73tYR3R9u9uhJ5cjxChrK5UQmkNgMpnWgOr+aB0U=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB3595.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1b5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.28; Tue, 24 Jun 2025 13:53:55 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 13:53:55 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v6 4/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Thread-Topic: [PATCH v6 4/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Thread-Index: AQHb5Q9tCU5ekZJzRE2aHCAXI5Vygg==
Date: Tue, 24 Jun 2025 13:53:55 +0000
Message-ID: <a265a20e-8908-40d8-b4e0-2c8b8f773742@imgtec.com>
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-4-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-4-6583ce0f6c25@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB3595:EE_
x-ms-office365-filtering-correlation-id: 740cc12f-260d-49e6-a7cd-08ddb3268f90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?aWlLQ2t4WHNCMDRSTHZMd1hRakg3SUsvcUJVaTJBZDBKcDVwMkdjQ1VBUjRE?=
 =?utf-8?B?OUdmcXlibmhHa2VkeXVmVWlVL0lQYkhGcHZvYXk2ODlNbnh5QnFxazZhVHFF?=
 =?utf-8?B?UzV2ZkdydzlxRkZlUTZtMExwb3lnamt0NlFFdzBJb1g2Tnh5c2d2QjVUbzd4?=
 =?utf-8?B?UWxweWJxTlZ1OGQwcG1GN3c3VVNhWGV4VkN1WGV0YVE5Y3lhVnp2VVB2dkFz?=
 =?utf-8?B?cjRXaVdlVHhhU0FseDRQbjFQVlJaOTg3UGo5Um11blY4VUs0YVI1RWxvL29N?=
 =?utf-8?B?bzZNNnh0WGZWWGgremxZSnR3dnQzY1gzcnF0WEp1eTJuM1lpY0hOTWJNSXdW?=
 =?utf-8?B?UlVlRWhyMmtteG9CdHByZ2RtKzEwTGZza056U281ZU0wdHJpY1lkNlhPTnFC?=
 =?utf-8?B?NkkyOHVEL2VKYXA2eThJSjg2VTRGK0JuU1lsR1VxdzJhVEEwK1oyVmF1WDdZ?=
 =?utf-8?B?MzRjc1dOOC96eGhhbEQzUWtTUkZPV0JPVjVOL0JWTXluUHJNWDdqZXViek43?=
 =?utf-8?B?OEZ4M2U3NHlXM0hpOXc4WEl0d1EzN043bzVCem9KdVp3UmovWWdUQ0o5MnF4?=
 =?utf-8?B?bjQ4MmlPNXEwTXdMRGVtL2s0RFp4WHdwOEdGNFpPcWRPbkJtMUtQRnR2TUly?=
 =?utf-8?B?elV1MFZ4ZjJ3NGFpU1VWUkpOL090anNDKzZnNjRhaHJBZmZmWDgvQUkvN2RH?=
 =?utf-8?B?UmptUU1keFBxak9NYlRDS0V0dkdaZXpWeEtmMVNvRkJ2SnJ0OGFiYjZZZUh6?=
 =?utf-8?B?Y05KdWpuQk4wNkdtOCs1dklFcm5FMUxYTzl3UHk5b3pBK05RU2pvK21TeTE5?=
 =?utf-8?B?U3FaOW44V3ArYnFOVVA2cHJrU1dCaXNoWk1WdU9yeUNSa2xrTmxxelQ4aEJ1?=
 =?utf-8?B?aW56V0IxREhaNGh3cVpXaFp6VGtaWjN1bmJKd1FlTk45ZkoyQy93UG1OZjhi?=
 =?utf-8?B?bFh1aDhtNCtpbEpsbFNVOU4yR0tKK2VaSzI1RzEyYkpLVWRBaHdYR1AxQlVE?=
 =?utf-8?B?VFRKQlhCYnFuclh5U25yRGprS3dvQlRqV0w5SXJnams1Rkp0RzFKczBzZWhx?=
 =?utf-8?B?UVBhRmcrVitpSWRhTFFRRlAwZ3F5cVFsMGFNdFVoWUtHWkpZUlFRYTRQcjNQ?=
 =?utf-8?B?aW5Od2VzY2s4bUdNdFBSUlRwUnd5dno1YUVna1N0VWZnMzlvSGdCV3l5ZUE3?=
 =?utf-8?B?OVJhZUNocjAwQXpQTXE2bG9ld3FGRm14UnVGMlRIQk1hUzFUTWNKcG9kcnJv?=
 =?utf-8?B?bEZJVEFNaXNmSUV4Y09FK0NvSlBTbEhSczAzdVBkY2c0UWUxNzh3TnR4RUkr?=
 =?utf-8?B?QXV4QUJPOGN3MGRIOXZHanpHQy9SNCthaVVJby9mbk5lc09hcFdOTGRJTjBQ?=
 =?utf-8?B?ZkdtbEh6SFVrWU5WOUlvOHBVRmNSVWRoc2NSc29SQTBaclA1Q2ZZWVJxaW45?=
 =?utf-8?B?UlY3dmJtcXJkWFdOa0hVVG5waDlBaDNpdEsvVjA5QkYvQnZaUnFiWkRLUWpO?=
 =?utf-8?B?TnpWTEp2ZUxGdlZrejJUZHdkdWMvMlFtaFdvSkVxeTdCT25FMkMyRTJGN1d0?=
 =?utf-8?B?RzVmUWV1Q1B3ZFdDbEVIdjBZd09QSjBUVG5ON0huZFVHZTJCaWhVck5nRmdK?=
 =?utf-8?B?bHZmZTRORXBaZkwxNjVVVGdyMkg1cUltSzVzUkorWGVtUmxrR2s3UjBWMURH?=
 =?utf-8?B?UXpUZnFtcmRGNi84Y2tKdjk2ZitxcEdJRE1SQ1dFWWk1R3FCUG5ITjFIbmdG?=
 =?utf-8?B?Z0FTSVZQaDhDaGRkczliR2pjWEdYU2E2K0wvWXUvcVAyQnkwZnhSTkJxVlFW?=
 =?utf-8?B?MnEvOWVWMldBekZyenRNUGxFUWVFQ3pOV2FRQWdNSDQyUDdqeGs2NGxBM09G?=
 =?utf-8?B?Y3pHUDZtS2IxNkVUN1N2WE1VN3JxREk4TUFkRktiZEhZRExwQzlhZk5rcC9Z?=
 =?utf-8?B?VlcwQjNYZDVRTDRUUGEzTTFzVTlkZlR4REQvbU1ENWI2aEF1cjY0eGlaUDVH?=
 =?utf-8?Q?+5/rP1vk+MtUCc7KnYMfiTK+VtEaA4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V1kvZWtnazBwMjVyKzlhRDJSQkw4azBjWVVLeER3Y0hFSnZTRHZ3QW84N09S?=
 =?utf-8?B?bDU1eU5SOHMySHFIL1ZmOUo3dTBjZzEyeXVUamplazJuaU5YT2tpbFVFd3da?=
 =?utf-8?B?d05HNjJmRDRtSzFZT09ub0Jma2hRejVUbm1qTms0Z3NiTVlQWnF6T3NpcDJZ?=
 =?utf-8?B?bEdoZDRickhwSm4vZWZlTjdRZHE3cS91NDc5emtaUmRROThrTnM2MlFYekdO?=
 =?utf-8?B?NmtzT2pWMFU3TGtMWnpBQ1RPVk5oVEhZYVQxYysxdlZtL2ZmRmp3SmFRWEVt?=
 =?utf-8?B?Z0w5RlBVeW1WOWdkQVpENFpaeUpZWnNIek1odjYzQXM1ekRUN0xBWVJZQmxq?=
 =?utf-8?B?b1RiSlBoZnp6RkZPMUNIejVtUURjTjJnRjZSU1RrMDZOT0g4QUZNNndUNVNB?=
 =?utf-8?B?MFpRZHIwVForY3g0dEgrMFBGSXg2QXk1dXVqVXZpdXMzUS9WbXcrQTBzTWxj?=
 =?utf-8?B?cVN5dUNmOUM1cnRWUmg4T2V5dW56ZDMwV29pekpwZmNLQmxJN0NuNTgzUHAr?=
 =?utf-8?B?dUZPM01XUUFWTGVOVk9XOFZHL29lWlh3Q3FjZ3BDQXhVbnREc0dncmNRMWMx?=
 =?utf-8?B?NE92eVdOVzc1WVdFRlZaeEZrRmRDTDIvSUlBTGN0VGhWUEhVZkVFNG9iSE8x?=
 =?utf-8?B?T3pBN1RjN2p2bkwyVlVOTnIwNG5pNFg1b1RYR3N4cnhOODNFUUUxOEkvNzQ2?=
 =?utf-8?B?c0FiQkpJWkkvM0xsWlFlWHNnZEUvVFhnVmVBNTdTZCt1cXZJd2NYMTNwNmFD?=
 =?utf-8?B?TmduclJsQjFoNkNsWTlaRytxcGNCTTJKYU5ZcmFWUXNCbTB1RXJLYkpRVGpK?=
 =?utf-8?B?K0JpS1dHV09HenFRaDJlVFh3OSt4NkhPKzZvYXQyR0hXTk5uNnB6ZHQ0RlZ3?=
 =?utf-8?B?eGdTMUVxcXl4WVRNVGo5Qzg4eGVpVzRUb0lhSHVzUmw3bENQazROR000aCs0?=
 =?utf-8?B?U3ZDRWNmdVBmRnZDZUFJazZmZzlKdlpENXptVDNPTHlOTnl0SjNuMmRuYWNV?=
 =?utf-8?B?QW1pS0dQNUxWV3NSSFFaaHpzcTFVOVd5NDlUdFl5Vi9qZkRnS0d5OFRQSVBP?=
 =?utf-8?B?b1BjemlleGJwOThlTHVXZ0FpRXlEWEs2UXBVT1EzZ1U5REx4dGFVdTJjUldx?=
 =?utf-8?B?WkVsdHBnTG1FTFpkUHJTNkpxY1NzRnlpM01qUVcrTzZXM0tYNS9QTHBTc1Jl?=
 =?utf-8?B?YVlTQ21IWGRibVN4UXR5cnJUbStjY29LWGVIaXBwbExHUEprb2swQ1FneVpB?=
 =?utf-8?B?Wk9oRzBuZXExMS9HZ3pQa1ZFQnp5MG1rbUo3UjNreWpBQS9SaW9qWTA0bmdn?=
 =?utf-8?B?QWZmWFBQUTVoQVJoTmZsOWY2WUwzMllmVGlJWnlxdWgzbDA2QW1qSi93TnBr?=
 =?utf-8?B?cXI5MTFMcUhFQVRVcTBhd3habUVTMHVqNU9NamtKLzlVSnMwUlBEYnFtbzNP?=
 =?utf-8?B?K21qbGlhSHJ2VTIxamZqSEtmUjJ4eEUwbGw5UDg0cStHdjgycHRxdnZZeDFE?=
 =?utf-8?B?ZlhubDh1Z0ZlUUNoNmc5Mkx0d0FLWU9RbzdSRUhadkZBU201L2Q0R0JLL3BQ?=
 =?utf-8?B?U2d1M3NoYUtxUHRGdFBEMUcvVkZTa0ZxRjBHTGozUDdtbGFJRVBlbk5Xc1h1?=
 =?utf-8?B?NWVvZFNhVTFuN1BJK3lMakZ2cm9mWXRZcjBLMkRCRTdKdVloQzN1YUNQR01J?=
 =?utf-8?B?WHI1bU1BTlVVTHJHY3Z1WUdBaytFcXFtWXplbVFSY2ZjU1hPNHY3dUlnVThh?=
 =?utf-8?B?L0Zma2tXQm5pakMxbVk4UjVQOEV0ZjFRY1Y2SThlNjdXV2tyVDllVngyaXND?=
 =?utf-8?B?Si9RMGtSYU1XZUU5Uy9iUTBaZVpTbE15SW5MVFlxcVRPQTVRRVFNQWJVZG5P?=
 =?utf-8?B?bHM0bjRJQmVZZ2t6YkhMcXpSSDh3SDRUQ1V2NlZLcVVGanRITmxVTmJXYkEw?=
 =?utf-8?B?S3Y4L1N3ckx6SlF5VzRPcjhJN3grWmVBdUpUS0JOZmkrWkJsZmVTbjlMK1lY?=
 =?utf-8?B?TGtFSy9CKzVTUE55MjFUZG9IQ1Z6RTVEOFJOaTJUR2Q4V2tpdmFDbndqemR2?=
 =?utf-8?B?UGhrYWhmMkFyVTR0SE1jNVNwTmw0OVNpSzhkbnRvVEtJTlZYU25YamF6WnUx?=
 =?utf-8?B?YzYyV3QxR3M4ZW1UOUFBSFhsYjhEVUlsbkVkV2h0NnZJM1c1Umt1T2FidEZa?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IBejQfPoo2i05yzlIf6sSrMQ"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 740cc12f-260d-49e6-a7cd-08ddb3268f90
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 13:53:55.5111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YVPVgZ3EGkaASLYxOkHEUBOW0skDaOfhYxjWL6m3IoZq0UgrtWlB0CcgbCHMIk/HBsYF0NV/dZhE6uHoiESFFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB3595
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MSBTYWx0ZWRfXyUqVCCaoSSOd
 S4yiYy5VpW28nSw4kHiPq9dwBZYfkxxGzSvyqF2WDCHYXkWSA0epvVwJTQ3eSsVk9Xm0q2f/oq4
 1NiNyOiph9r1t5Lo+DKrtKTeTPVNXgMJI0X8zCtquejgn+p0V8YWo5uBDx6xAD8vCacYhirjiHq
 noyCql8bymQpg89OjyCAGK311GoMo5s6p/ZTV08bPxPYg/4UVKsHKsfZ6VWnSMEUd2/gSeg/+Z2
 WPRcPwbSnE4Jh3cVUJAZZTGt9a+yGbuc9Qnrh/RNuVHychWoMpL8IGusKr8q+Si0QvkGb++LjDD
 piVn5mW/FPiTh1kR3AExFEWdIwvbektA0Ozi3/+1btsH6734fwhIrZfRC/FPT6AoG8EXDFvoUrd
 DVCnQ3eZ
X-Proofpoint-ORIG-GUID: q1e9Pk7Y3p_c1UJFi4SghlI3h1CapmtH
X-Proofpoint-GUID: q1e9Pk7Y3p_c1UJFi4SghlI3h1CapmtH
X-Authority-Analysis: v=2.4 cv=HL3DFptv c=1 sm=1 tr=0 ts=685aadf8 cx=c_pps
 a=XGMez45H97LGCOkXRSAzOA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NgoYpvdbvlAA:10 a=KKAkSRfTAAAA:8
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=4qWUp5DYNchnrSo_bwgA:9 a=QEXdDO2ut3YA:10
 a=3s9oWg2mQBtviNRdVbEA:9 a=FfaGCDsud1wA:10 a=cvBusfyB2V15izCimMoJ:22
 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------IBejQfPoo2i05yzlIf6sSrMQ
Content-Type: multipart/mixed; boundary="------------F06OPyo0Jzv1ArsECaRz8M06";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <a265a20e-8908-40d8-b4e0-2c8b8f773742@imgtec.com>
Subject: Re: [PATCH v6 4/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
 <CGME20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2@eucas1p1.samsung.com>
 <20250623-apr_14_for_sending-v6-4-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-4-6583ce0f6c25@samsung.com>

--------------F06OPyo0Jzv1ArsECaRz8M06
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23/06/2025 12:42, Michal Wilczynski wrote:
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.
>=20
> To cleanly handle the TH1520's specific power requirements in the
> generic driver, this patch implements the "driver match data" pattern.
> The pvr_soc_data struct, associated with a compatible string in the
> of_device_id table, now holds pointers to platform-specific power_on an=
d
> power_off functions.
>=20
> At probe time, the driver inspects the assigned power_on function
> pointer. If it points to the pwrseq variant, the driver calls
> devm_pwrseq_get("gpu-power"), requiring a valid sequencer and deferring=

> probe on failure. Otherwise, it falls back to its standard manual reset=

> initialization.
>=20
> The runtime PM callbacks, pvr_power_device_resume() and
> pvr_power_device_suspend(), call the power_on and power_off function
> pointers. Helper functions for both manual and pwrseq-based sequences
> are introduced to support this.

Hi Michal,

My apologies for not responding to previous revisions of this series. In
general, my main earlier complaints were already addressed by others and
the series generally looks good to me.

Just a few notes from me in this and subsequent patches.

>=20
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/Kconfig      |   1 +
>  drivers/gpu/drm/imagination/pvr_device.c |  31 +++++++--
>  drivers/gpu/drm/imagination/pvr_device.h |  19 ++++++
>  drivers/gpu/drm/imagination/pvr_drv.c    |  30 ++++++++-
>  drivers/gpu/drm/imagination/pvr_power.c  | 112 ++++++++++++++++++++---=
--------
>  drivers/gpu/drm/imagination/pvr_power.h  |   6 ++
>  6 files changed, 152 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imag=
ination/Kconfig
> index 3bfa2ac212dccb73c53bdc2bc259bcba636e7cfc..5f9fff43d6baadc42ebf48d=
91729bfbf27e06caa 100644
> --- a/drivers/gpu/drm/imagination/Kconfig
> +++ b/drivers/gpu/drm/imagination/Kconfig
> @@ -11,6 +11,7 @@ config DRM_POWERVR
>  	select DRM_SCHED
>  	select DRM_GPUVM
>  	select FW_LOADER
> +	select POWER_SEQUENCING

Given this is (currently) the only platform that requires this
dependency, I'm not super enthusiastic about selecting it here. Given
the modular way the pwrseq code has been written below (which I really
like!), would it make sense to make that code conditional on
CONFIG_POWER_SEQUENCING rather than pulling it in here by default?

>  	help
>  	  Choose this option if you have a system that has an Imagination
>  	  Technologies PowerVR (Series 6 or later) or IMG GPU.
> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm=
/imagination/pvr_device.c
> index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..c1c24c441c821ccce59f7cd=
3f14544a91ef54ea9 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.c
> +++ b/drivers/gpu/drm/imagination/pvr_device.c
> @@ -23,8 +23,10 @@
>  #include <linux/firmware.h>
>  #include <linux/gfp.h>
>  #include <linux/interrupt.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/stddef.h>
> @@ -618,6 +620,9 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	struct device *dev =3D drm_dev->dev;
>  	int err;
> =20
> +	/* Get the platform-specific data based on the compatible string. */
> +	pvr_dev->soc_data =3D of_device_get_match_data(dev);
> +
>  	/*
>  	 * Setup device parameters. We do this first in case other steps
>  	 * depend on them.
> @@ -631,10 +636,28 @@ pvr_device_init(struct pvr_device *pvr_dev)
>  	if (err)
>  		return err;
> =20
> -	/* Get the reset line for the GPU */
> -	err =3D pvr_device_reset_init(pvr_dev);
> -	if (err)
> -		return err;
> +	/*
> +	 * For platforms that require it, get the power sequencer.
> +	 * For all others, perform manual reset initialization.
> +	 */
> +	if (pvr_dev->soc_data->power_on =3D=3D pvr_power_on_sequence_pwrseq) =
{

Not a huge fan of this check. Semantically it doesn't make a lot of
sense =E2=80=93 why would we only care about the power_on callback specif=
ically?
See my comment below.

> +		pvr_dev->pwrseq =3D devm_pwrseq_get(dev, "gpu-power");
> +		if (IS_ERR(pvr_dev->pwrseq)) {
> +			/*
> +			 * This platform requires a sequencer. If we can't get
> +			 * it, we must return the error (including -EPROBE_DEFER
> +			 * to wait for the provider to appear)
> +			 */
> +			return dev_err_probe(
> +				dev, PTR_ERR(pvr_dev->pwrseq),
> +				"Failed to get required power sequencer\n");
> +		}
> +	} else {
> +		/* This platform does not use a sequencer, init reset manually. */
> +		err =3D pvr_device_reset_init(pvr_dev);
> +		if (err)
> +			return err;
> +	}
> =20
>  	/* Explicitly power the GPU so we can access control registers before=
 the FW is booted. */
>  	err =3D pm_runtime_resume_and_get(dev);
> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm=
/imagination/pvr_device.h
> index 7cb01c38d2a9c3fc71effe789d4dfe54eddd93ee..3f35025e84efac031d3261c=
849ef9fe105466423 100644
> --- a/drivers/gpu/drm/imagination/pvr_device.h
> +++ b/drivers/gpu/drm/imagination/pvr_device.h
> @@ -37,6 +37,9 @@ struct clk;
>  /* Forward declaration from <linux/firmware.h>. */
>  struct firmware;
> =20
> +/* Forward declaration from <linux/pwrseq/consumer.h */
> +struct pwrseq_desc;
> +
>  /**
>   * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR devic=
e
>   * @b: Branch ID.
> @@ -57,6 +60,16 @@ struct pvr_fw_version {
>  	u16 major, minor;
>  };
> =20
> +/**
> + * struct pvr_soc_data - Platform specific data associated with a comp=
atible string.
> + * @power_on: Pointer to the platform-specific power on function.
> + * @power_off: Pointer to the platform-specific power off function.
> + */
> +struct pvr_soc_data {

Nit: can we make this struct pvr_device_data? It's being used as the
top-level struct of_device_id.data value, which means it may contain
more than just SoC-specific details later on.

> +	int (*power_on)(struct pvr_device *pvr_dev);
> +	int (*power_off)(struct pvr_device *pvr_dev);

I'd prefer to see these two functions extracted to a separate struct so
_that_ structure can be defined as a constant for *_pwrseq and *_manual
variants and have _those constants_ used in the dt_match table (and, for
example, the check above).

> +};
> +
>  /**
>   * struct pvr_device - powervr-specific wrapper for &struct drm_device=

>   */
> @@ -98,6 +111,9 @@ struct pvr_device {
>  	/** @fw_version: Firmware version detected at runtime. */
>  	struct pvr_fw_version fw_version;
> =20
> +	/** @soc_data: Pointer to platform-specific quirk data. */
> +	const struct pvr_soc_data *soc_data;

With the type rename above, I guess this would fit better as something
like compatible_data or maybe runtime_data? Naming is hard :)

> +
>  	/** @regs_resource: Resource representing device control registers. *=
/
>  	struct resource *regs_resource;
> =20
> @@ -148,6 +164,9 @@ struct pvr_device {
>  	 */
>  	struct reset_control *reset;
> =20
> +	/** @pwrseq: Pointer to a power sequencer, if one is used. */
> +	struct pwrseq_desc *pwrseq;
> +
>  	/** @irq: IRQ number. */
>  	int irq;
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/im=
agination/pvr_drv.c
> index b058ec183bb30ab5c3db17ebaadf2754520a2a1f..97ccf4a73964ed3752ed1a7=
98231c41cc5c70030 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1481,14 +1481,39 @@ static void pvr_remove(struct platform_device *=
plat_dev)
>  }
> =20
>  static const struct of_device_id dt_match[] =3D {
> -	{ .compatible =3D "img,img-rogue", .data =3D NULL },
> +	{
> +		.compatible =3D "thead,th1520-gpu",
> +		.data =3D
> +			&(struct pvr_soc_data)
> +			{
> +				.power_on =3D pvr_power_on_sequence_pwrseq,
> +				.power_off =3D pvr_power_off_sequence_pwrseq,
> +			},
> +	},
> +	{
> +		.compatible =3D "img,img-rogue",
> +		.data =3D
> +			&(struct pvr_soc_data)
> +			{
> +				.power_on =3D pvr_power_on_sequence_manual,
> +				.power_off =3D pvr_power_off_sequence_manual,
> +			},
> +	},

Can you define a "default" instance of this so it can be reused below?

> =20
>  	/*
>  	 * This legacy compatible string was introduced early on before the m=
ore generic
>  	 * "img,img-rogue" was added. Keep it around here for compatibility, =
but never use
>  	 * "img,img-axe" in new devicetrees.
>  	 */
> -	{ .compatible =3D "img,img-axe", .data =3D NULL },
> +	{
> +		.compatible =3D "img,img-axe",
> +		.data =3D
> +			&(struct pvr_soc_data)
> +			{
> +				.power_on =3D pvr_power_on_sequence_manual,
> +				.power_off =3D pvr_power_off_sequence_manual,
> +			},
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);
> @@ -1513,4 +1538,5 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
>  MODULE_LICENSE("Dual MIT/GPL");
>  MODULE_IMPORT_NS("DMA_BUF");
>  MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
> +MODULE_FIRMWARE("powervr/rogue_36.52.104.182_v1.fw");
>  MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/=
imagination/pvr_power.c
> index 41f5d89e78b854cf6993838868a4416a220b490a..49b66856b9916b1d13efcc3=
db739de9be2de56b6 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -18,6 +18,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/timer.h>
>  #include <linux/types.h>
> @@ -234,6 +235,71 @@ pvr_watchdog_init(struct pvr_device *pvr_dev)
>  	return 0;
>  }
> =20
> +int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
> +{
> +	return pwrseq_power_on(pvr_dev->pwrseq);
> +}
> +
> +int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
> +{
> +	return pwrseq_power_off(pvr_dev->pwrseq);
> +}

I'm not sure what the standard method of gracefully handling unsupported
configurations at runtime is, but I suppose we could just have
alternative stub versions of these two functions that error out if
!CONFIG_POWER_SEQUENCING.

> +
> +int pvr_power_on_sequence_manual(struct pvr_device *pvr_dev)
> +{
> +	int err;
> +
> +	err =3D clk_prepare_enable(pvr_dev->core_clk);
> +	if (err)
> +		return err;
> +
> +	err =3D clk_prepare_enable(pvr_dev->sys_clk);
> +	if (err)
> +		goto err_core_clk_disable;
> +
> +	err =3D clk_prepare_enable(pvr_dev->mem_clk);
> +	if (err)
> +		goto err_sys_clk_disable;
> +
> +	/*
> +	 * According to the hardware manual, a delay of at least 32 clock
> +	 * cycles is required between de-asserting the clkgen reset and
> +	 * de-asserting the GPU reset. Assuming a worst-case scenario with
> +	 * a very high GPU clock frequency, a delay of 1 microsecond is
> +	 * sufficient to ensure this requirement is met across all
> +	 * feasible GPU clock speeds.
> +	 */
> +	udelay(1);
> +
> +	err =3D reset_control_deassert(pvr_dev->reset);
> +	if (err)
> +		goto err_mem_clk_disable;
> +
> +	return 0;
> +
> +err_mem_clk_disable:
> +	clk_disable_unprepare(pvr_dev->mem_clk);
> +err_sys_clk_disable:
> +	clk_disable_unprepare(pvr_dev->sys_clk);
> +err_core_clk_disable:
> +	clk_disable_unprepare(pvr_dev->core_clk);

Nit: there were blank lines before each label before.

> +
> +	return err;
> +}
> +
> +int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev)
> +{
> +	int err;
> +
> +	err =3D reset_control_assert(pvr_dev->reset);
> +
> +	clk_disable_unprepare(pvr_dev->mem_clk);
> +	clk_disable_unprepare(pvr_dev->sys_clk);
> +	clk_disable_unprepare(pvr_dev->core_clk);
> +
> +	return err;
> +}
> +
>  int
>  pvr_power_device_suspend(struct device *dev)
>  {
> @@ -252,11 +318,7 @@ pvr_power_device_suspend(struct device *dev)
>  			goto err_drm_dev_exit;
>  	}
> =20
> -	clk_disable_unprepare(pvr_dev->mem_clk);
> -	clk_disable_unprepare(pvr_dev->sys_clk);
> -	clk_disable_unprepare(pvr_dev->core_clk);
> -
> -	err =3D reset_control_assert(pvr_dev->reset);
> +	err =3D pvr_dev->soc_data->power_off(pvr_dev);
> =20
>  err_drm_dev_exit:
>  	drm_dev_exit(idx);
> @@ -276,54 +338,22 @@ pvr_power_device_resume(struct device *dev)
>  	if (!drm_dev_enter(drm_dev, &idx))
>  		return -EIO;
> =20
> -	err =3D clk_prepare_enable(pvr_dev->core_clk);
> +	err =3D pvr_dev->soc_data->power_on(pvr_dev);
>  	if (err)
>  		goto err_drm_dev_exit;
> =20
> -	err =3D clk_prepare_enable(pvr_dev->sys_clk);
> -	if (err)
> -		goto err_core_clk_disable;
> -
> -	err =3D clk_prepare_enable(pvr_dev->mem_clk);
> -	if (err)
> -		goto err_sys_clk_disable;
> -
> -	/*
> -	 * According to the hardware manual, a delay of at least 32 clock
> -	 * cycles is required between de-asserting the clkgen reset and
> -	 * de-asserting the GPU reset. Assuming a worst-case scenario with
> -	 * a very high GPU clock frequency, a delay of 1 microsecond is
> -	 * sufficient to ensure this requirement is met across all
> -	 * feasible GPU clock speeds.
> -	 */
> -	udelay(1);
> -
> -	err =3D reset_control_deassert(pvr_dev->reset);
> -	if (err)
> -		goto err_mem_clk_disable;
> -
>  	if (pvr_dev->fw_dev.booted) {
>  		err =3D pvr_power_fw_enable(pvr_dev);
>  		if (err)
> -			goto err_reset_assert;
> +			goto err_power_off;
>  	}
> =20
>  	drm_dev_exit(idx);
> =20
>  	return 0;
> =20
> -err_reset_assert:
> -	reset_control_assert(pvr_dev->reset);
> -
> -err_mem_clk_disable:
> -	clk_disable_unprepare(pvr_dev->mem_clk);
> -
> -err_sys_clk_disable:
> -	clk_disable_unprepare(pvr_dev->sys_clk);
> -
> -err_core_clk_disable:
> -	clk_disable_unprepare(pvr_dev->core_clk);
> -
> +err_power_off:
> +	pvr_dev->soc_data->power_off(pvr_dev);
>  err_drm_dev_exit:
>  	drm_dev_exit(idx);
> =20
> diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/=
imagination/pvr_power.h
> index ada85674a7ca762dcf92df40424230e1c3910342..d91d5f3f39b61f81121357f=
4187b1a6e09b3dec0 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.h
> +++ b/drivers/gpu/drm/imagination/pvr_power.h
> @@ -41,4 +41,10 @@ pvr_power_put(struct pvr_device *pvr_dev)
>  int pvr_power_domains_init(struct pvr_device *pvr_dev);
>  void pvr_power_domains_fini(struct pvr_device *pvr_dev);
> =20
> +/* Power sequence functions */
> +int pvr_power_on_sequence_manual(struct pvr_device *pvr_dev);
> +int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev);
> +int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev);
> +int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev);

Perhaps the extracted structure of function pointers could be declared
here as e.g. struct pvr_power_sequence_ops, allowing these functions to
be contained to pvr_power.c.

Cheers,
Matt

> +
>  #endif /* PVR_POWER_H */
>=20


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------F06OPyo0Jzv1ArsECaRz8M06--

--------------IBejQfPoo2i05yzlIf6sSrMQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaFqt8wUDAAAAAAAKCRB5vBnz2d5qsNim
AQCg/KB/h8UF2rzGyWelaX1s2OE33MEzv0xe+UhzoT4pfAD+Mjs3FbE08RXjZFwRk/gEhHvdhxiO
uLW67nNoxCcW1ws=
=0eFp
-----END PGP SIGNATURE-----

--------------IBejQfPoo2i05yzlIf6sSrMQ--
