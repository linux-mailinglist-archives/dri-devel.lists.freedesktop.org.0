Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A583BDE1C9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 12:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF2D10E135;
	Wed, 15 Oct 2025 10:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="mSNcnB5Z";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="rHqfthsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ECC10E135
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 10:55:52 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59F4qt6E2588522; Wed, 15 Oct 2025 11:55:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=z5J4QYbs8U3pd35wnssrnfFQH
 1kDS3eNgwd6n3j8fKY=; b=mSNcnB5Z8+MWqGAMUUqKDay7qKk/sXidZd0RPTA7s
 Sapu5un42NTaMjCBKQnhp9EM2mHCXNW2mVR5kCGoNBr+lfP36/zua2Jv46m0PvM6
 HDaUnH1GsrN20NAPtfe7BaVSlD8OAQdjrJqjsscqb6yP5hZHhPu+O83mz2eCmPTP
 6SOGS9ejH+k1wfIx1QRxnnXurHvLD9PzeoAxcWzXv6Z/yt3q1SIxel/rbKuRtWaJ
 8ZxBCuwYdyPLTbyeIxcxudCAfdtMzoceFGXLBvml/H711+Y+XqO/Ej+W03EyOX3p
 L+szUm+6nCV/lx86suTEi5e16eSCRWW18uDchQua7Dq9w==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020143.outbound.protection.outlook.com [52.101.196.143])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 49qdgn3w17-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 15 Oct 2025 11:55:42 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W2g9+lgi8dm/YmGJu1mJip4T9tn8FKN5WDiD2j13+JVrJCw4yXtssHaUO6NoTOg2Zgklqcr8+iaA6q3kT5aqXaGYlCTjkzv9sCZ14u6yLdnCEZX/LPWFlI7sQV4BwkXbxjalLTM03njc6k8bu7IWajNyHcbl0pv0mTUzJFbYWw2NSNIYB1hoyzEHL4//8nzq1hNKyk+olpq2phkHirrMdmSva2RX42Ury+Hj899MXtfAsrUCfI+ICaVNra/Jmr+MAqMdGvrpejdzo6ieFGDa1ghvik/JyihnBVBRXA+Vulw14eXzGmAAXPDCUXDouf0OoEIaiV6e5OwGs+urIjV7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5J4QYbs8U3pd35wnssrnfFQH1kDS3eNgwd6n3j8fKY=;
 b=qhEhWmmkVxFzF5UYbcYOMhWMmPf2mgSLBSKQ2+Y8QqoNdXjcZp6OAN0OKi4XYoJg9ALck/V5cgZG7Ceu6F6XublZSgDV+ILGLKQWUVrOqpTOMsKRR3irUNtl2A9yoS0CEExrkKYkO9KAqcTDhIPiUxYITqFqr/2zrrcK4ghDxsF5wqbwSTtf2C9CIYyBJ0WxRFVz6vMx5BBpJDiSQS4lJPdOJZNixcZIbnmgpr6WAoqSMsCrKbNMaoGhlMuFHX6tv90RtWmzseQnYIaR6d0qXRg2pfTFOcVIXl/rLh3EGwGeCg0qbj1bZEY+G4hrETIc7CxqK8xXVjCQMPayXgZeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z5J4QYbs8U3pd35wnssrnfFQH1kDS3eNgwd6n3j8fKY=;
 b=rHqfthsGG2HKV7Xp166qj0+9CWmkTsWF57WV1CdJp0jY/BbNTTFRtOmYlV2LmpJTB4kfQlOewLT3SGDA07wSabTdNfsChUEYI9cEcmMIlgxO9E5KzKKvwqFCBoqMctzM65CQV0wh5RII0r4x2NgqlY0KlDGPZxQ3oBO6ZG77sZQ=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB6504.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2cf::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Wed, 15 Oct 2025 10:55:40 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%5]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 10:55:40 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>, Marek Vasut
 <marek.vasut+renesas@mailbox.org>
CC: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David
 Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, Alessio
 Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm
 <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, Rob Herring
 <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Thread-Topic: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Thread-Index: AQHcPcI+XfbCVl28PE2GDuGsqzc8bg==
Date: Wed, 15 Oct 2025 10:55:40 +0000
Message-ID: <dd7e09c7-995f-4ef9-a5bc-ff6c8be64ae1@imgtec.com>
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
 <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
 <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>
In-Reply-To: <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB6504:EE_
x-ms-office365-filtering-correlation-id: 6427dce5-3211-464d-bca6-08de0bd96156
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?LzN4SHNib0d0czVmSmExWFZhUGh2WldJa2tFanFiZGpRZDg0ZGc5M0d0K0JP?=
 =?utf-8?B?RndaRlpPZjdTQzJYVERTWnFjVTNoSmVid2ZFOWIrR1hOb3hkUDgyZnV3ZU9Y?=
 =?utf-8?B?Qi9VeTdGN1R4RFFGQllrK0dFTWNHenE1RmJEVEhVdUdYNmZIRzFjMnNDMnVG?=
 =?utf-8?B?dEVrRmkrM0gybkFxSDhqbEtXVnp5aWFtaE5ibVZqYURINGhsSGcybHVsaFFK?=
 =?utf-8?B?Um9SMXdhMG13ZHBCVUhteU1jM0RsQ1RRdVErdDYvOVJ4c2dTYkg3cEZmanRQ?=
 =?utf-8?B?NUFmQThmNXRyeHcyaUtTbjVCYjNwNUJHWE9mdFpQbWRrSTVJbXE5THRFOHUv?=
 =?utf-8?B?eFFzdk1yZXMva1Q3ci9renNOMGh6cTRIY3VqUlNGNFZFZ09iY0FpVEFhSFNX?=
 =?utf-8?B?QkxvdjJ3L1dhanFUNmJMakdlVVZZTFBEUVk3dGN3VzVwSlRRdGxLRVkwWTZu?=
 =?utf-8?B?akhFYXNMb0s4cUZSbURFdS9NNWFDcVJjVmN3RUptSUxITDRWM3c0K05NWitk?=
 =?utf-8?B?TytEdWJuOGJscWZxMExEWnhUeFJLT0kyS0I0VDBMTzRhRW1qOUFoQ2pjRXNh?=
 =?utf-8?B?ZXdUT2d2cnF1M0d1amtmZTJZekYyNnhISGNPbHdWVDVadzRSWUtyS2V1NWQw?=
 =?utf-8?B?N2hXVllmcjM1dnErUDQvZzhkeHJZdUtNV3lzODNuK0M0QzdHNzBYUitXR3FY?=
 =?utf-8?B?K210WUhmU2QrM1o0cUFhMGtMZjNUdzB6NGxUOS9BaG95YzlKaXpDeVMrTmxz?=
 =?utf-8?B?ZklMNktHR2pMbWVvSUsrZnF3dENyaHVjOGdGaE5ZcDVQRTV6SVVhYlgvVlE1?=
 =?utf-8?B?cjF3S0lQTXVJVWRqNkk3NmdNZ2ZNVldBbGxnV1hpOUF3N2tzdGo2VVdic3pZ?=
 =?utf-8?B?U3ZBcjEyczBkVkRRbjEvNnVXYnd3ZWhjQ0p1M2hLYklWOGc1THRMMU8xL1Bl?=
 =?utf-8?B?WjhveDJIZTFUcGJOT2FkSTREQUN3WFBtOU00eTZ0NFJvQURoTTJScG8xVXRK?=
 =?utf-8?B?V05wMGV3TUJaVUp5UjdWS3NWN2Z0YnJGdTNGZVdIanRZcUo4Zjh5d0lwZ3ov?=
 =?utf-8?B?OFl5OHVzU2ROK05WZ0g3cGdhQmMrcXI4NGkyNkt5NnBMUGxQVFByWFAxNUhQ?=
 =?utf-8?B?NDhLZWNtZEI5ZU1xVktDTDc4N0ZYRW1mUmlEdFdLQ0gzTEUwd3p3U09oWWxo?=
 =?utf-8?B?NnVzOXQvQ3BpMTFTWkNhRTVKVkZ1REE2RWtKa3N6dWFUMXNxY0JtaWlidXJm?=
 =?utf-8?B?MEthN05ZZ0RSNVZYUDEwZTRMekJERUFTWWRiak15WUp0TzdVOVlhOFRBY1hM?=
 =?utf-8?B?eVBrcnRUcUc1WWdJTFJQSlZoTmtjSlJrMGlocWpTMU1HZUV5a2w0Q3pUaDFE?=
 =?utf-8?B?WURJdlhrOTZsZHM4c1RPWVBoWU5pVU9ZNVNkOTU3bUxRMXpXMmEyb1F4U1Zr?=
 =?utf-8?B?Q0FmcTk1Rk9zRkkraVlGeVhhbllhKzNnOHc5dHRPamZtK290OVN6Qld3eitF?=
 =?utf-8?B?YmlwTFd4ekJkMWFob0JKV1VwT0EzbEc1dFFnckVuZllabDIrdXFVcG1SODQw?=
 =?utf-8?B?c3BkVTdtd2oxQk9WV0xCZlhvTW1XZVNmSzZyUHpicVJld3k2cVh1SkZXZGVh?=
 =?utf-8?B?amNqcjg0VkNOM2dHS0FnNVBHeFZOazFPVDVvVWNPT3l5YXNWUnZ3RnFSdWsz?=
 =?utf-8?B?ZmxzNjFydU1KWHErZE1lU04wTVo4SU9JMW4ybjRoM2xKSytaUnc2M0ZvWWpP?=
 =?utf-8?B?aWxkeStBZkVsZFA2NStuaUxyU3FEUm12cTdjQXpXZytpVTY1Z0pLOThaZkd0?=
 =?utf-8?B?RHYzMlI5VXI4RGp1QXBFK0pobEQ2eEVhWWVhOEsrS1M1cjQvNmVFUDJJcmRR?=
 =?utf-8?B?cDB5TzdDNGwwKzhEYlFNRndQclZpak5MalFGVDNVNVhJdVdFN015RXBhdlBY?=
 =?utf-8?B?aEtzYklITmgvTGdCMHFqNHhKLzRWdlFEMUd2WGRMREp0WVRjSVM3UVlocENK?=
 =?utf-8?B?b0tPTGJsUjhDOWlPcldYQTNUWTdMMER3Y2JWeUsxaEVpbmtsa0xXN3paMWkr?=
 =?utf-8?Q?vMfahe?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?azBJbjBUV2h6VDRnSG9zV3RLM293Z3ptTTZnQ29oS2JKczZhalZkRDZZSklK?=
 =?utf-8?B?dmUxajNZT3crMWp5MkdRWVhCNTdVQjR4M0hzQVk0aVhHRTdSYXVTOEk3Z2lZ?=
 =?utf-8?B?dUhNL1p3Ym15MFZyWmlTVThoTHFjOWFrWThLSjRoY0F1Q2NJNk5HcnJVWDhk?=
 =?utf-8?B?eUozcjMwMks5Z1d1VUc3MUhydG9tdnRKK3ZQTFRQakY2WjlWL1FKWERKcHdL?=
 =?utf-8?B?cmpCVDFOZFY5TDlpYk1HOGdCNEIvSE5IZEVLelE0K21LcUdZRStGa2pxTVZC?=
 =?utf-8?B?aHFTRVd5YklUVjZHZDZod3BHZE9YNEZVMmhzRCs4V1dNWnJyVUtHak9vK3gw?=
 =?utf-8?B?ZHVlaUtqNWFuVW5PdTExdmdRN3FGRTczc3pIZDRCOGozRlI3cUhxZStUWnhu?=
 =?utf-8?B?YTdESmNlMGRlZkRlNlRNYWdDaVhhWTlsRnc4aVVjMVBLY1RyK3VCVzRaakIx?=
 =?utf-8?B?VVVaRnNMSGZSYkhiRGE0aUh2eVdCRUE5ZkJBZ3NackwxVHlDNG1VRE5zQVBX?=
 =?utf-8?B?NGhXdXgyOFVVc0x0VHI0REZpSE1pTnpYWFpmajI0WEdhbHcyYmJaZmJ5MzVp?=
 =?utf-8?B?eGQ0SnlrYzhjWnVhZ3lmVVFSeWEyOVJ2d01vZ3R2TG51L3F4WWJxcitlaW00?=
 =?utf-8?B?ZDR3ZVFLYXUvQ3hYbmN4SEVENzdsQUlJSk5JUXhhWUNZTHpzdCtoQXBvSisw?=
 =?utf-8?B?T0xKSGxxUFZhLzhKTWd5Vk9mZ29MZ3ZXS2VGNjhDR2VaTzdjVmpGNDlWMkU0?=
 =?utf-8?B?SXFCb2N5SzRRZDZLVVRncUQ5N0daTmFkejRIYzBHRGpvQU9ZYjIvdE04YWtr?=
 =?utf-8?B?dG5DTnlKaG1aRFdmemkxUmJXV1hrSXNmTVpCNnZuK1JMZ2NtbkJMVnVMaUo5?=
 =?utf-8?B?S0pUTW5vTSs4WW5ZaHlyeUJWdHNCWmJJZUlzSTlDSlRHN2hWZTNzdkZBdkdk?=
 =?utf-8?B?ZDZQVFZ2TE1HSHNSYXdXU3Y2SGczWjJYZTJXd3h1ekRScEsydmxWUWQ3ZmtQ?=
 =?utf-8?B?MFFnWXJla25IeStUTXVpZ3BjNlVKZ3ExZkVIbDY2T29oQ2huMUJldUVjRllG?=
 =?utf-8?B?MExmdVc5aVNxTXJzQTVaOHduYk5uY1RtSFF1ckhocDIyM1RGd0R1S3lCZ1px?=
 =?utf-8?B?cjdZM0ZhQTVZeU02eS8zdUFSWGRPMWJQOEQzSjhidkRTWUtjMmdYOHhMejhD?=
 =?utf-8?B?WDhlR2tIUlU1dXdJVE1FZzlpYXVkS0ZlNkp1NVc4elhIZkJEcWFXUWdpRHgr?=
 =?utf-8?B?SkM1L2ErN2FGWnBOZEl5TmxOQk94a3haUDFzU1hVK0dyRFo2UmVCQ1QralVG?=
 =?utf-8?B?bHM2V0hXcHVwZXpia0NoYllmME9vWUNiQ3RxUXJ3T2lpanNtUTE2cU1CMEZm?=
 =?utf-8?B?LzRGdHgyRUtORzljdmYxQnV0UDQ4RUtyT0dtdGpzaUFmOGhoTkQ4TkEzbzNB?=
 =?utf-8?B?c0E0RVl5Vm9ob1Z6TnMzZlZLWE9qNEV3K3JwaEE5ZEtTQll5VG1ia2pWVGNY?=
 =?utf-8?B?ekJVaG01b1BkcHJtVjRFSm12UUlpWGRhRVNJSVkwMkxYaU1ycC9mTFRCNlVn?=
 =?utf-8?B?Nk1QVjl3L3NlZm0wdVhMbUR1UWVNQWswQm5kYTVPQ3hUQmlhaGRUOVZvaFZj?=
 =?utf-8?B?S3VabDJoODNFdmRhUG9rMXFkYkpNVEZiY2xQcDNtNUp3RTNWK2hkT3R1NXFq?=
 =?utf-8?B?eWtORm02U3VqNE10SmR5aVBQWGdWUE9INjhzVFZJTkUzdjNjSXZ5WkdVcjIy?=
 =?utf-8?B?Zys0VTAvbHN2ZU14TUlTTHU5WmZGeFlCNE1tZjg3M0t6aHRoNTZlcHlGTno3?=
 =?utf-8?B?akd2STEzZ0JBbFZ6dXJ6TlZJYVhnNFI1cW5BNkdNSksvYUg3MWZNM1E0Qkp4?=
 =?utf-8?B?RS9jYlBZdEkzQ21SeXZaRWtBMmhJcXJWK0N0RUJHUHN4eEdnNFBKWFJwNmlz?=
 =?utf-8?B?ejJrZU1hejg0MWQ2RnpDTWxYMU8va1cvTlJCQjR3TWRmVE4xaHVjSzNjUXNo?=
 =?utf-8?B?amMrNXNNczZpM2YzdTZQTzBldUQwNGJyTjNUOUVBMHI3c0txODhISVpacE9l?=
 =?utf-8?B?M1dpZ2Z3d2hrZHpYd21tN2VoNUhYT25jQ0Zwd1NzWnRtQ1V2b3hHN1RuU3VL?=
 =?utf-8?B?MTV0STVDWTB0U2dYSVlXcXhZbGNPUlpaZWJEbjdjZFZ2Q1JqK045Z2JxRUtZ?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xmucXCUYOvwFKqaqae5qtp9d"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6427dce5-3211-464d-bca6-08de0bd96156
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 10:55:40.1419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z0sFIT7LlzHDW1AoqBQRekZ5A1q8CSKDBAWwFCTSF2EOj+LREfIUeKQy9TSIPlJQ9RLUGCCoIE4zQlCQ0QLiSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6504
X-Proofpoint-ORIG-GUID: dErhA-VDe0YzoaTHNfsKiZy_TWA4IPdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA4NCBTYWx0ZWRfX5r8OBG5t33ic
 xpDQRrvDUZ6SeoXSv7jiVmn1f4PhTTDs+MtOOnw9Nzjj2xJPA5v384o7LFy2VYHsxW7Mcoda6b4
 cLzUzODjApNuhbGSqoELidsHjqKQK2rYfb7lRrP28+KiIo8NosTF4BRGtH5gFFw/dn/DDfg2vcd
 tizBcY57NvNRJVeDid5H399MRYcnuL+jiTnUfcF7auku5wTTwY2nqAJGurJQPUwveX7C0p245jv
 IaHWPHamfjij03UMdR4GF0GtiL7oQzv2iAAD0si+GZO0m64h/ule6N32HvbmNjZJZ8p+BemzZXQ
 s5cnJ2XvHwxNL0UcBRNKTepC5SQF/qanuCnmbU+Z4iwgL0Bmi8OclzUzVQZNlvpYn5GupnRlvei
 RxF7J7VBdPJux4DZ3t1bbM2ZOPhp/A==
X-Authority-Analysis: v=2.4 cv=H5PWAuYi c=1 sm=1 tr=0 ts=68ef7daf cx=c_pps
 a=+bwlm27Do9H9cYqZrITUUg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=r_1tXGB3AAAA:8
 a=GduRsdAIHHuW2NQLC0cA:9 a=QEXdDO2ut3YA:10 a=tYz9v21IF3AURZH8fC4A:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: dErhA-VDe0YzoaTHNfsKiZy_TWA4IPdS
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

--------------xmucXCUYOvwFKqaqae5qtp9d
Content-Type: multipart/mixed; boundary="------------LsFhzgt27erm8t4oeO0VNb4e";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <dd7e09c7-995f-4ef9-a5bc-ff6c8be64ae1@imgtec.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <20251013190210.142436-2-marek.vasut+renesas@mailbox.org>
 <d4ec2cc2-882a-4842-ad8c-42033ceb2bc7@imgtec.com>
 <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>
In-Reply-To: <e93779e7-026b-4b48-9d9b-dfef3d953749@mailbox.org>

--------------LsFhzgt27erm8t4oeO0VNb4e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On 14/10/2025 23:59, Marek Vasut wrote:
> On 10/14/25 1:52 PM, Matt Coster wrote:
>=20
> Hello Matt,
>=20
>>> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
>>> @@ -2565,6 +2565,18 @@ gic: interrupt-controller@f1010000 {
>>>               resets =3D <&cpg 408>;
>>>           };
>>>   +        gpu: gpu@fd000000 {
>>> +            compatible =3D "renesas,r8a77960-gpu",
>>> +                     "img,img-gx6250",
>>> +                     "img,img-rogue";
>>> +            reg =3D <0 0xfd000000 0 0x40000>;
>>> +            interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
>>> +            clocks =3D <&cpg CPG_MOD 112>;
>>> +            clock-names =3D "core";
>>> +            power-domains =3D <&sysc R8A7796_PD_3DG_B>;
>>
>> My comments here apply to the other dts patch (P3/3) as well since the=

>> integration appears to be identical between the two SoCs.
>>
>> There are two power domains on this GPU and the SoC exposes both of
>> them; no reason to fall back to the single-domain scheme here.
>>
>> I know the sysc driver declares the dependency of _B on _A, but the dt=
s
>> shouldn't rely on that, so can we have:
>>
>>     power-domains =3D <&sysc R8A7796_PD_3DG_A>, <&sysc R8A7796_PD_3DG_=
B>;
>>     power-domain-names =3D "a", "b";
>=20
> Both SoCs fixed in V2 , which I will post in a few days , thanks !
>=20
>>> +            resets =3D <&cpg 112>;
>>
>> Is this a reset line? Is it a clock?
>=20
> This is a reset line. The MSTP controls both clocks and resets, but
> this particular phandle describes reset control.

Ack

>=20
>> I see this pattern used throughout
>> the Renesas dts, but I'm just thinking how this will interact with the=

>> powervr driver. The reset line is optional since some hardware
>> integrations manage it for us during the power-up/down sequences, whic=
h
>> appears to be the case here with the MSTP control (from my brief dig
>> through the Renesas TRM).
>=20
> As far as I can tell, the pvr_power.c toggles the IP reset after the
> IP clock were already enabled, so the IP should be correctly reset.
> What kind of problem do you expect ?

I think I'm just being paranoid about the weirdness (to me at least) of
having one device be treated as both clock and reset line. Assuming this
is tested as working, I'm okay with it, especially as it seems to be the
norm for Renesas.

>=20
>> Related, see my comments on the bindings patch (P1/3) about how clocks=

>> are wired up in this SoC.
> I tried to reply to that one, hopefully it makes some sense.

Looks like we've figured it out there, thanks for your comments!

Cheers,
Matt


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------LsFhzgt27erm8t4oeO0VNb4e--

--------------xmucXCUYOvwFKqaqae5qtp9d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaO99qwUDAAAAAAAKCRB5vBnz2d5qsFjl
AQDeHGZAYgKly8XP0AiV5JH22pXqCnCP3v/UStcssZnEJwD9FIQa0cPtmLkJbJh2KcekilTFSdYc
W7YMqbEuW0m4CQY=
=uN1l
-----END PGP SIGNATURE-----

--------------xmucXCUYOvwFKqaqae5qtp9d--
