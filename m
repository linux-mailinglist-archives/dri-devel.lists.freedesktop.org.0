Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DB1A97251
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 835B310E0A4;
	Tue, 22 Apr 2025 16:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="j+i3oo5o";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="OEWBybqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332B810E0A4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:17:08 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7sLmY009013;
 Tue, 22 Apr 2025 17:16:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=U3fpOiSmO13BsEZzNhRJ27a0a
 W57buvKmAcZbvHSDU0=; b=j+i3oo5oUyn89anyS0953nlwp8fV/E9uCA+/LNmwY
 vswUXBU0wpY6vdnni1QDN3+G13lkb0ZPYKfAbn77NL3uNUGDzceiYgqttdJbAwQf
 m0IdFJZbJ99nE6VTXOp0PTlwmHgTNQxwTE589H+ySf9vlUThUuDFcVNl8HMN+uWI
 cVgp4dVjFReTvy9xg/+CBS6NzFcKArVoIblKq2jW1PIy5ywOfYlvGB+aXHynCqDX
 UtXQkVggNlZGiENHZcq/yW543FV7t0Ww5gMmMVMCRylyOyMZ2Gdpw/SXXFhzykBV
 l6vIZcHn/Dn1eraeSx03Iuq6N4pc1zJZJk1UoBQiFDVNw==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazlp17012053.outbound.protection.outlook.com [40.93.67.53])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 46423t1uux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Apr 2025 17:16:55 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XV47vz/ba+tE4JoVEz6Tsih+6FgTeCRHFAH75WbwBZbCCn2oIIsYiGPu93Mrpxb1uPhTyvwwnRsF3gjDiIwtyfkyI3R+kmDRn5qI+dlQJbNbI1gXiO3PDXx/lTRVDoQm6sbU40dLrSsCO6Ptb6nn8LaDCscj7clFaOSsRs3YpY7X5gipmB4mmS86ZK9VSqFJ+pJ/EF/HKgq7/MmVzn8MG30rOdpZN67AhpRzpBXg66qqewoZWduZ+OoqvSg+ZtiNAIWCEfa/nuAZMYOK87Gz6iYO1AoXMZWIltIyRtQNxG4kPgkqm1R5rosBEIHD10rIvG66HaGMPkwqZkH7EDzidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3fpOiSmO13BsEZzNhRJ27a0aW57buvKmAcZbvHSDU0=;
 b=vsAHuIM2HymSvvpVDvyHPpQzrVpEi4f4O7duXy/COXSMJsmVY1F5jJsQ+I3Oiqjf4ZvtV/6RPNP4IIcJKDTLASPUGhyd0Qyb37eIsSTzfFuAtRThStez25lsREupGmbcgibmvA4x1Q3rKuStjgNwvLRO5LO9S0iM4cjlUDtm/UGOWiDH22MDLY/PpAWRyg/nlFxdKwsC8Ykwe+Ex7cwF3/njEEoeYBZgAcPDvhyozf7nWdftjj917U7c3BCPFZRWS35euOVcvY5rkTY42tClMvsQsZ3QYIf3YIHzKBZMd5YHZ1yt//U67/UnuqrTp/W81nQnMtygKaIngA4blleE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3fpOiSmO13BsEZzNhRJ27a0aW57buvKmAcZbvHSDU0=;
 b=OEWBybqOx2zX0SvvTYf6t701loZWq+sTQPRVXEHoO62pcGzVQZtGAGR8hen2qgTUYsKLWqo032mi67xItsm6FRxoBPl/myQyGGRekkJyQp8ezmckyVKwaq+C4tUzGaJvwD8Po8Y9KDnaeY3dXvI5M9F7E5b2kIcvkV1zQZ+psT4=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB7224.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:334::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Tue, 22 Apr 2025 16:16:53 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 16:16:53 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 0/2] Add optional reset for the drm/imagination driver
Thread-Topic: [PATCH v6 0/2] Add optional reset for the drm/imagination driver
Thread-Index: AQHbs6H1OQ/J2D1FFUWYBtMB1FUrJA==
Date: Tue, 22 Apr 2025 16:16:53 +0000
Message-ID: <a000c060-bd0b-4225-aa6f-fcfb84b307bf@imgtec.com>
References: <CGME20250418112258eucas1p28186b27890dbed4cbc05b2ddd8f94327@eucas1p2.samsung.com>
 <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
In-Reply-To: <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB7224:EE_
x-ms-office365-filtering-correlation-id: f8430380-5734-423a-3323-08dd81b9184a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|4013099003|4053099003|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WmUvMmppQ1RKSk9wRjN3dERWNU5hYThzYkExT0JRNks4djJFL1FkNHFOSHJB?=
 =?utf-8?B?Z3ZDWDRXeWZBSFlUYjdKZEZkZUo0b1ZLcjhBOEcxZEg2Q0pUZGp1OTNhVkdq?=
 =?utf-8?B?WHpqbmdkSExlRSt6WTVtRkFjMXYvZDhScmxLK2Vrb3B0MmljbTVwNC9ITmxE?=
 =?utf-8?B?aFRXa3JYZXhvbFYyUjg3ekVXMmlVZ2NiUnZIK25lTjZGQjZ5MHFkZmNLVjJI?=
 =?utf-8?B?UmVVaXZNTjJVTjlNTElObW1yM1V4RHAxRjUxVWxHSjhhQmtFNHpTZlV5ZUdp?=
 =?utf-8?B?YUlhL21SWkVPZXBXTmthRXMraWY4MXRZQkU4MzZUQTB2MFBJekN2dWZmUjN5?=
 =?utf-8?B?T3hFMmpZbmhMTzMxRmR0UndxcUQ3WDB5RTJaYzNlMERVSUg0RHBYMzZYR2Mx?=
 =?utf-8?B?a2NtMGlwd3d3bjFLd2VSNTN2YmZUbWJDSXAvSWN1MWpxcnVwVjFuZ3B5UHIr?=
 =?utf-8?B?K3dOaHByL1lNNkZrNlp4eGFVVGJ5TDdFTXd2bytxS01Hdkdjd2FPQi9ZYThB?=
 =?utf-8?B?SE1DQXgrN21VaVQyNkN5Q0ZRWUxXLzlINENnRUUvNE52MUl0MXNSOHlERU9n?=
 =?utf-8?B?OFZEOGR5TTRqVS8xZllhMEloV3pZMHFZNFlDMkV3SmFWMytWcHhwMU9QVUZX?=
 =?utf-8?B?TkY0MGpnNDVycEVHT1l4clIrYTJDWHROWTRadldkTi9wcmpKTmFZcjVBTC8r?=
 =?utf-8?B?bmh4MDRmbTFXSll2L1JpNWtuVTlZcVVsUWFDSzNGZzNobVJ6Z3l2a2N3S3hU?=
 =?utf-8?B?SXJUNkpTaFFGeTdzME5HVVBRdUR1NVNiWUVISkRyVGczOU50R2VlVlpPT0tx?=
 =?utf-8?B?aWFLTEpoalZkUk5TT3NNV1U3M2JpWE0rdGFrNXppNDlvNlNGMks3K1lMVCtu?=
 =?utf-8?B?V2ppc3Jvcjd2ejhMc2hSa3BpREN6dkl2Slg1dnpOUTZXeHVBc0syZUwvRHh3?=
 =?utf-8?B?ZGtvOTBBVEtlSXRxQVhmWkdraERxWGRXcm9ONmpLOHhKUm1Zb2tSYzBSVEFP?=
 =?utf-8?B?S2lHRUdJbzhVMmpyNForcklRTk1lbFVXbjRwQVNyMVRTRnNCRGJ3aTVLZDFk?=
 =?utf-8?B?RUNyeGozUEpNS2tNY3hPN21KZWkwdzE0K09zdURzOWRiNTdVSnF0SzVEVUtT?=
 =?utf-8?B?TllrZy9VZEdjaVpOSW5nRnpxSDFjbWJYc24yOEtmbUFnVWhtb2JKdzJiOFVZ?=
 =?utf-8?B?ZERaYlR5Rkdla1NFSTQ0Zk0zdEtSeEM0R1Z0OG8rRnF4aWZTZGRVUTFLSVRD?=
 =?utf-8?B?K1pLUll2b1VxWVdrRGdaVUg5ckRZSmdJeGMzSXBDckdjK1dpb01vTWhvZzZu?=
 =?utf-8?B?SnE5bVZGV3NiUEQvUzZTZzNUUFkrRnNGZFllMlk0TnhSVXR3YVZiM2xyQjBS?=
 =?utf-8?B?MFdhdmUyVjAyejBvcnZFT2l5VHdhRmV6NVhiQ25QUEZmMTdmdG1CaE82R0Zx?=
 =?utf-8?B?S2VPQmp6MVhNZFNkWXhLQmV5K0lFSllRazdCZ1VUcGVFNXJ0WDlaYy9BNTJj?=
 =?utf-8?B?UUEyK01wMUxSeStON0cvSEJKcDZZUTk4SEFjKzdJWXNJZlJxN0tEK2pSWTF3?=
 =?utf-8?B?ZWdxM3JnOTVESHpPRGZ2UHJybC9qakc0VHluNkhrbmI2NEtsbUFtUVV5WDZW?=
 =?utf-8?B?NEVtQWZyNU1oZ1dzU2FYTWd1eG84WjR3STNWblh1VUNndlNoR3c0VTdBSTRl?=
 =?utf-8?B?QndnRU12THRSQU9qSXRIM2pGbW1zRXhHblhmdmZSRzJQSHd0dGVQSjFPMVFw?=
 =?utf-8?B?Y2JHN3JxSDVjVUtxK0lsTEtRdGovblRmY0sxbHhMTEdPempOWjIxd0FVOG9O?=
 =?utf-8?B?c3N6WEZpR2V5ZFZxbStnU2tvRFRMSDdmZzM4NUJBMktCOGU2VkQyQmtHL3Fs?=
 =?utf-8?B?NFFHQlhlYUI4dGtidGx5elJMTVZTTHF5NmUweFhSa2pGSzk1dTdhYzNtNWF6?=
 =?utf-8?B?NUJ5Y21sOTUzMFhManY1OFpkOWJmcyt5N0tjekNpakZiK3ZzWjk2TVBXU3gx?=
 =?utf-8?Q?PX03CSTmJZRy4AmrbXP1UGjeu8F98U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(4013099003)(4053099003)(7053199007)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHorSDhCNVZDOE5zM2lmRGlPbDRSbVczd21NTmcxWjkreGNUWXp6TGlJZ3Qz?=
 =?utf-8?B?WHRRNGg5RklXdjFDVGdiV2tPNFY0WTRqakRvSVRwSjhqcjl4RlNZT1lEcmQy?=
 =?utf-8?B?aU9NU0JCeUM2bG40dzJ0Nnh5ME9iZThCejYxUG5udjRZMVpxU3QvRGpMR2Jn?=
 =?utf-8?B?UURtaEJ5cmVFQjdzSGRGNFF2MGtOcGxkZHhyM2JSMlVNQXI4OXJndG9qSGlp?=
 =?utf-8?B?eGs2b0Y4UkVDd3Fja1pnY2VJd2V3bWhhUEFXUjFJUG8vNEljelNMQ3AzNXJl?=
 =?utf-8?B?Nnp2QnhXL3ladHdZc0dDWjdyVWRER25naWNtaFJTbHZjMzljSnNQZU1WZFBs?=
 =?utf-8?B?RmxmZ2F1WWpRWXBRdVpZVlVJUnU5eWowQkg1SHAzbCtCam5uZ3pHQUZCcGhG?=
 =?utf-8?B?RGRCeWdZRjFWWGdRNXZsUkJIZ1RQcG9xclE4NEFRNHdqS25SQTJ6Qk5YYTFm?=
 =?utf-8?B?SmhqZENOYTZxV2I1aEsvTVA2RWJBUGtENkplYTBISVpLWjJMNVU0bEtmRTJG?=
 =?utf-8?B?aVY0Ky9MSWpaR082OVJ2K1AreFljVGhaekpha3N6bFNORWEwLzkvTGRnbE9N?=
 =?utf-8?B?MVFBbnFSMllQMDlHd0dVVjh1dmwvbk1kWmF1dzhHNU1pMkRoTmpuZEI5bVhq?=
 =?utf-8?B?b2RhUGJzR0xmcURkQmpFWGNqaTlkM0VyalEzNzlHZFJYeW41cE95NkwrSVgz?=
 =?utf-8?B?VzE0WWdORnlSekZPdUpVQzh1TS9xSmpGVENpMTdXdGhHUFAzaUI3TjB1Nmlr?=
 =?utf-8?B?Q0VXQTdnT1NqUmlXVkw1cjVwV0RMcHdDQjNGdGp5Z1BKOGdJck9ha0FEVGdO?=
 =?utf-8?B?NUg2ZG5SZWdsOGdXbWFzdng3TENvdFRLMVZEdGZqYkFCMGRSSFl3SkpuMTZ6?=
 =?utf-8?B?TDkwVUFsbVBkdUxyTHNZVGh1c21mMzNCcHkxQ05mbndLT3p4TVhXdlBYcDVQ?=
 =?utf-8?B?VnYzU3A0NjhvZmJmQlFHNGcvU0sycHdjdUdhMVdGNVhMMnNnTUZwU2t5ajM4?=
 =?utf-8?B?RjhweXlnV1RwV2p0VHZWYkRYWVlWejVUeHlGRjZxYTMxNkQ1TmpUUjN3WktL?=
 =?utf-8?B?RHlidWVmaGk3WWd2MW1QL1RQSkV6eTNUMlBoQ0RRZDM0akJGZ2JLanFsaHg1?=
 =?utf-8?B?MUpiMjgycFFxZHRvRXJaK0RXaS9rbDcwRW90KzZNOXhXdngwQnJMR0dCWXlO?=
 =?utf-8?B?Y2Y1eElpa2EzNkVlcGZUSDJsRlpRZ0ZmNlZSTUczekNwbENPSURRaGg5cUxP?=
 =?utf-8?B?SWJrY2RhWHFDcVBvdGUzUTlqR25kcUd3dHU4TzJMekV4UmdWUHJyai9HUklL?=
 =?utf-8?B?U1RrTzFPZFRaMnViZmtXMXR4c0ZvcXV6RGdQMldXS3JSblBGUzM5RGMrMk5O?=
 =?utf-8?B?WG5DQzJoaEFZRmVySlcwRTVOR3QyYVFibVNRTXhDUFZhU0VmcUNEWXgzQ0hT?=
 =?utf-8?B?U0JuU0dNeEFIMjh2WXpqa0ZJRWMvdHFTTktSMnBvRktPbjlOb042bFF2QUYr?=
 =?utf-8?B?V0pvUEFSa0JMQmlNTjJ6VkhuRzE1N1hieGhCdmlwQVgzUzBKSzVXc0xscmxz?=
 =?utf-8?B?LzFDSEpEMjI4dnh3UkR4ZGxlOFlPbDB6aHMxMHEvcnFwRFF3alFCUm1KOXZy?=
 =?utf-8?B?R2pBZjRCUG10eElyOXg3czlLMVA5SFYyMC9BR3c5WGxwaG5Bc29aR1ZYOGxl?=
 =?utf-8?B?VVB0bTFtZU5XdlNEdEFPcVlSZGM0Skl3ZjJhaEJOM2tUQXdDYnhWNlBuR3Vo?=
 =?utf-8?B?QWF6UjN2RXJDNFFqVVdJR3RyUmIrMmNqbElsR0FFRW5LYlNqOVVhRGtkMWo4?=
 =?utf-8?B?ekVJQ1hiejRKRTEyMENKbWhJRjZ1d0tXZWI0TnQyRFJJVmR3dzFQRlMvN1pu?=
 =?utf-8?B?MEdmMDFiY3dwZzJ4bkdPWGlDQTlFMUJqNU03d2dKaFR1QjNpMG5RdzFhQW5R?=
 =?utf-8?B?WUJjYTM0dDJpTVlFMjF2NkVIdk9GNFJaMnZkeEZIZnoyck9SeCtOV25GOGo5?=
 =?utf-8?B?L2pLUDBhVkkzQzZNQjNjVkVmaGExZEhkTTA1YjdEQzhnU3pFV3VNQU5LZmN6?=
 =?utf-8?B?bnp2bmRydXh5NElFSFdDQkErai8zT3VuYktOalhPeVp1dGxEeUZZVEp4czRQ?=
 =?utf-8?B?em9SWmhGcERXdmoyMDhOUzhiMXk0dVNrTFJ2MmMrTmpwZTBMZVcwMUgveXJr?=
 =?utf-8?B?Rmc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HKaCKcgOdfPnCRiQkNbnjz6z"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f8430380-5734-423a-3323-08dd81b9184a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 16:16:53.2655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t3HqB/bbr74MGTYS2tOgxA61Sn4Lp5+BShyzAeLIEyQXYzd9+vFebKgl9b4un26KSBOKE5/vuNk69Rb9MWad4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7224
X-Authority-Analysis: v=2.4 cv=L60dQ/T8 c=1 sm=1 tr=0 ts=6807c0f8 cx=c_pps
 a=ydJsu2O7MsUe9Yn0EaA5IQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NgoYpvdbvlAA:10 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8
 a=rfBMbQ_DIeE9E_4OlkcA:9 a=QEXdDO2ut3YA:10 a=ynLwMIKwuAuj_iVqJbgA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 4euoqEXy8NTuAB-40V1JReGl9o1k6H0i
X-Proofpoint-GUID: 4euoqEXy8NTuAB-40V1JReGl9o1k6H0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDEyMiBTYWx0ZWRfX9Jbsz2JlffPN
 IwVdEFjOQ1fBZscCISrvzaV52QBfnlPkCt132kUIsQomCTGM5QrhmbUXRTsJg45v+/hwl6FTI4D
 kA157vx7Z7dpsynBlOE8wxUFbEJ08UqRcND3aLz5n5fBnBNd0o9/rskyfPZsSEsx669L3pz6dJ6
 rKAaxZj/pDxLbph+1FqLdK76FDnfiM1f2faZa5Qb3EQg9xS+xPp+dNDkOumv2Y4crMp/OIka3s0
 41J4gBBhoAaO8MbEQO+KWvREdURj5rq8PssJjojzWvGGTtWXUpFI4HNapjdP+1y62h5aRegU7nQ
 24EwJZSR8/6FFnMrjZ5yA/b9f4IG8fim/0hyKsMWJ2J3E3CF3zoofHZx/hJS7RQBRMgrgbgaojj
 I4d9ZLW9L0wPTQp2isCJPiPBlUWp9Wm+N22LOzjkIDLcJ1CDnUyDE2lU2QdMIBlEph9wGL4C
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

--------------HKaCKcgOdfPnCRiQkNbnjz6z
Content-Type: multipart/mixed; boundary="------------UAYQIlZjV4iUNm0m8vS0Ed9a";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <a000c060-bd0b-4225-aa6f-fcfb84b307bf@imgtec.com>
Subject: Re: [PATCH v6 0/2] Add optional reset for the drm/imagination driver
References: <CGME20250418112258eucas1p28186b27890dbed4cbc05b2ddd8f94327@eucas1p2.samsung.com>
 <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>
In-Reply-To: <20250418-apr_18_reset_img-v6-0-85a06757b698@samsung.com>

--------------UAYQIlZjV4iUNm0m8vS0Ed9a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 18/04/2025 12:22, Michal Wilczynski wrote:
> This patch series introduces and documents optional reset support for
> the drm/imagination driver. While developed as part of a larger effort
> to enable the Imagination BXM-4-64 GPU upstream, these patches can merg=
e
> independently.
>=20
> During the upstreaming process, we discovered that the T-HEAD TH1520 So=
C
> requires custom code to manage resets and clocks from the power-domain
> driver [1]. Nevertheless, adding this reset capability is necessary, as=

> the GPU Device Tree node would own the reset control and would manage i=
t
> for boards like BPI-F3 that don't have custom requirements for handling=

> clocks and resets during their startup sequence.
>=20
> For more context, please see the cover letter for the larger series [2]=
=2E

Hi Michal,

Thank you for persisting with these changes, I know we haven't always
made it easy for you!

This series (sub-series?) is:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

If nobody has any objections, I'll apply it to drm-misc-next tomorrow.

Cheers,
Matt

>=20
> [1] - https://lore.kernel.org/all/20250414-apr_14_for_sending-v2-0-70c5=
af2af96c@samsung.com/=20
> [2] - https://lore.kernel.org/all/20250219140239.1378758-1-m.wilczynski=
@samsung.com/=20
>=20
> This series is versioned to maintain continuity with the bigger patchse=
t
> it is a subseries of. Please find below changelog for the
> drm/imagination reset part:
>=20
> v6:
>  - no changes, just a re-send, bumping version to avoid confusion
>=20
> v5:
>  - moved the recommended 1 microsecond delay after de-asserting GPU
>    reset to the Imagination driver itself=20
>=20
> v4:
>  - reverted reset-cells configuration to single cell as in v2
>  - addressed minor implementation issues in the DRM/Imagination reset d=
river
>=20
> v3:
>  - refactored reset driver to use zero cells
>=20
> v2:
>  - updated the drm/imagination driver to act as a reset controller
>    consumer. While this patchset is focused on the LPI4A board, the
>    reset controller is designed to be useful for other boards, such as =
the
>    BPI-3F, which also require a reset sequence after power-up.
>=20
> ---
> Michal Wilczynski (2):
>       dt-bindings: gpu: Add 'resets' property for GPU initialization
>       drm/imagination: Add reset controller support for GPU initializat=
ion
>=20
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml |  3 +++
>  drivers/gpu/drm/imagination/pvr_device.c           | 21 ++++++++++++++=
+++++++
>  drivers/gpu/drm/imagination/pvr_device.h           |  9 +++++++++
>  drivers/gpu/drm/imagination/pvr_power.c            | 22 ++++++++++++++=
+++++++-
>  4 files changed, 54 insertions(+), 1 deletion(-)
> ---
> base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
> change-id: 20250418-apr_18_reset_img-b102988052de
>=20
> Best regards,


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------UAYQIlZjV4iUNm0m8vS0Ed9a--

--------------HKaCKcgOdfPnCRiQkNbnjz6z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaAfA9AUDAAAAAAAKCRB5vBnz2d5qsK3O
AP9ypQ1eCIPkayBlpBBSTfYVSkABT/bX3Bcf99Gbc31xJAEAlCkmE+vw3d7DXITPOwosD5DLysvd
7KAapFgOxTexQQA=
=kCqS
-----END PGP SIGNATURE-----

--------------HKaCKcgOdfPnCRiQkNbnjz6z--
