Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552ACB2F32C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 11:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E96210E8B5;
	Thu, 21 Aug 2025 09:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="gCO9rBM8";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="nYdIaURv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6357810E8B5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 09:03:15 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 57L4Kf7v2738248; Thu, 21 Aug 2025 10:02:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=ELWzlHvXduYDkeSS3UcmVcihf
 HIt8MRs5ppjAGg95KM=; b=gCO9rBM8sgrzUbEcg22UpZpacivdrJgt3YpdrGJyT
 t4gGWCJuZBMmdx5A3lTJoTQgPZUrEwAys5gj91UQ8RtqLAauA+1Zjn8usaIM2d1Y
 a8LqmfaBuKstv4AQAiiFA2v6o8QzNDTPT1Q6UaEoB0+iHI3q6p6Z6fU5kimiPW5c
 SVqXfgzUBWgTmtHNIevHbZ/D+SYkCZSci0sAiNRdC2yKKmioCDGaGJw9K52OanN3
 qqJ38MxY1YBWDR0G/K/TgWO1BSJUnwSgaxl5AxABAXD7coirfr0GT0EAK9LWIw8h
 vELk3gT7EabROyJw118wnwMP/YRlWWozMkX1YduVWywEQ==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020108.outbound.protection.outlook.com [52.101.195.108])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 48jj2qnadx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 21 Aug 2025 10:02:55 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1858awBqq6c+laUZWljaM3c7nl4bmbg4CNLp4x3E2zgbB4jFFIN2X0GrPi4pVfHllIqwc7/o6ujJS7g4RlOWIsgOuD8wcAT0qIIlxExGRnLnK8fcqmge/iNoP3HG/9D6sFhEy4Fw++xaARNF+vHtb20JrLIn5BbqztTct+snlFsbRb0A9AY0zAAlFgYEVYYNLCp2qWLBdP6Xm9k+EjwpQ059UtapXThFPBFeKMLwrKMMaMQHXBMVOpzf/BqfHFh7KFnhY3QGGcqC06YWAiu46n+AECKwPGC+Dtrt1cR5n69z+5y+t1NqRJ0FQuHHEBMAFay91jFwa0Nm9/vFdYRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELWzlHvXduYDkeSS3UcmVcihfHIt8MRs5ppjAGg95KM=;
 b=qvE/2u4Y72m/4wH/VJ4R5PnFn38r26dJihZ+ScWLNyFaPSTykqxh4CLqPVePPhl9X3Sc8oQRlIcKWjcX71yt3JC6oBkRiK2xExgiMwfsyhd2KERi3zP+oVyzCCk6nlaIxpdnEnBiiSVIgzRtq2nt9z0oRgZJx5nq961eaPKtd0egGBLkLsyb0lTAb7dsiOxTr/2dZa2KsprxhlBNQQpX4xRfz9SqgXz4GO2z5UPoxmj6cXwQEBJQuu3Q0PY9jFZgYRGfhMc8hF+mNNcXmSZ6CP/PJS5AdtvMeweuvulJJ+OVcTujqfIZvEBd53xDyop164Acomk/5TeK2vLcws/clQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELWzlHvXduYDkeSS3UcmVcihfHIt8MRs5ppjAGg95KM=;
 b=nYdIaURvEUupV9olBf/RM1CXLgYAitpRx0sg99Jl67jVZVy4fOjNVMqCJhedNjoeClzkyr7IvhDu/Gg6OPaPmlQlykyF2V4e5FlTkQ9Nm3Ms4MI3Pz44PzTIAfrX6Xak7o5eSN6bJDqbFPLtXI4LuVGNPpIF8rn0siX3gZbjqq0=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO4P265MB3712.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1cf::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.15; Thu, 21 Aug 2025 09:02:51 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 09:02:51 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Michal Wilczynski
 <m.wilczynski@samsung.com>
CC: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel
 <p.zabel@pengutronix.de>, Frank Binns <Frank.Binns@imgtec.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v12 1/4] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Thread-Topic: [PATCH v12 1/4] drm/imagination: Use pwrseq for TH1520 GPU power
 management
Thread-Index: AQHcEnpfrcxk3htevUamrDFaR6uzlg==
Date: Thu, 21 Aug 2025 09:02:50 +0000
Message-ID: <27d70d29-9e37-4905-9d22-0266c8a290a2@imgtec.com>
References: <CGME20250820085609eucas1p2938d69999f4d7c9654d5d2a12a20c906@eucas1p2.samsung.com>
 <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
 <20250820-apr_14_for_sending-v12-1-4213ccefbd05@samsung.com>
 <CAPDyKFqeOUwTbZEUFmHS2Onyj5LZ1b26vGgC4=UHUOxhwbzjRw@mail.gmail.com>
In-Reply-To: <CAPDyKFqeOUwTbZEUFmHS2Onyj5LZ1b26vGgC4=UHUOxhwbzjRw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO4P265MB3712:EE_
x-ms-office365-filtering-correlation-id: 00388a74-a8eb-41e0-1a26-08dde09181da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?U3diRWIycUtzNWpGMW9WYjZjM0hyNVUzRlZ6bVVtcW9CYy9uNU14bVpCV25F?=
 =?utf-8?B?WnNFdWczQ0hUTnJ3MThCa29ZLzNHUFEweENYQjM0RllwcTNLNTMra3NYTG9k?=
 =?utf-8?B?OWhLUXNpK255VUpEMm9ZbS9vUFpIRkNQSG56RGVNMnVsaFExSUZZVC96NXl3?=
 =?utf-8?B?SUl4c1pDdVBCVzRNTXpSYlpHYVEzWW1XWmJraUZpaWd2NlRvcnU1YWtQU1VD?=
 =?utf-8?B?cFNxQVVRUUV2a2doaVkrcFFQTUJPaUpVL203OGtPTjNsL0EySHlOOWZKbWRT?=
 =?utf-8?B?cEh2WFpMeXRHaXlBd2ZWK2RFYVQzWnZobHFhOGxNbHpTVnduSGUxOE1zNWpm?=
 =?utf-8?B?OWIwMllGN0lwK2FpS254TmV3b3BCQUF0Sk5tMDNJNUN1SHVUTnpQRDBlc2xx?=
 =?utf-8?B?VHB1dnl3MVBJT3BDUjN0a29HZzBwcVd2WFpyQmJlSmUwVE5jWFZYL0wxeTdP?=
 =?utf-8?B?S2FrUUx1eDRublpzOEpWYmtQZmNLZFBGcVd1OGFRc0hpZ3ZiYTYrSGpKSjA3?=
 =?utf-8?B?QnRueisySVhQRTl6ZCtZV256WlBLTTBiS3QyVjJMdUExaDhHQUNUeVZMUlNl?=
 =?utf-8?B?MmtSVC8wZk5jUWdxSzNLclV5OFFqOUZTNWtKNXI2RGdmK0p6QVJhYm5TQTRR?=
 =?utf-8?B?aUVEc0dWdnZJcTlnRThPdmpvblErd3g2UzVvYVRsMUJoWFJQK1U0QU5zbkhK?=
 =?utf-8?B?Ly9xTUVMKy90MFFjYzM2L0VGTVgwQUJoejM1eVNlUmMwcHlkQUhWVDQrREJX?=
 =?utf-8?B?MHBodUxGVmNMQU5rWHRCY1Q4TWp5QTZ1WTROSUNJUkowcFY3UmZvL25DQnhE?=
 =?utf-8?B?QUdwa0VyNCtSb1QvWGtzVVJxc1NEQWVFc0h3RUdMMnJGQW1rQW5xbkxJcWs2?=
 =?utf-8?B?aGRZREE0aVJXbjVpdjF0dG8zSDhUYm90ZmxPQUh6WkpFakRVU3l3Ukx6QmVW?=
 =?utf-8?B?SlArUGZETHBicGVoZm15cml2RTJSUzd0OGExSUhFdHJQNDNLV0Q3YklaOUFO?=
 =?utf-8?B?OG40MmZiNURNaUZKR3NTUWhQdnVUVXc3a2J2dkxQbzVYWGhJTEZ2T3A2c2ty?=
 =?utf-8?B?KzJrWDREVW9YRUZJeDdjMjNXOCt0MkNQanM4YlJLQjlIUSswTTh1cnluMW5u?=
 =?utf-8?B?OHlJZFprcG95T1BkTVdNMGtXRS8xc01CNkxSVTV6dmUrdzBNMUgzUmtIMWtP?=
 =?utf-8?B?LzBlUzZIMlk5bmd3UjF1VFBPSklzcUZmWnFaOGl1M2NCR3IybWNEMTFGNm9j?=
 =?utf-8?B?M1gxb016ZWpwbEROK1FISDFxaWVjRWMrclJ2ODdmSFNRZ1VMLzYwN2JNMEt2?=
 =?utf-8?B?NXY3ZHBRVHJ2bzBxNS8yTUFkSEpDeWEreDA3MUZIS3QyZnBGMjJGVnNPYnlZ?=
 =?utf-8?B?Z0lwQWVuRld6R2gzbFd5ZlFSVWE2RlNYRjVhQmMwRW9HcjY5c0JzUWNzUHdH?=
 =?utf-8?B?QUd6OHl1UFlONjdtOG5NOEM2TUd3WkI3V1VVYklZVWVENzdENHBlZWpZcWZE?=
 =?utf-8?B?TDRObVgwdVpCS2JxWUlhY2lHclhZa1U3QzV6N0V6RUV4YkJBVUxyWUlFOGRV?=
 =?utf-8?B?QjlhVzUyTU5rQ2NyTWcvVkNVc2hKRFdhK1Q2MEo1VGhlNUFmN1IrZUJEdTZ0?=
 =?utf-8?B?MG96RDlwdTJCYzdJYy9pb2pTUk5VaE52VTRCbDQ3LzZlR25scUhaZllMenFR?=
 =?utf-8?B?SStrVFpvVVRmTi9ZNU5CSmdmN21YMExpRzMrSWJQL1FHVUJJTklvQXFocDJE?=
 =?utf-8?B?L2Y3L2UrcGF6NFYzeEVjYkxhdWxEY3ZvRHR1ZUJWUzYwTjN1NXN0cHBZdmRW?=
 =?utf-8?B?SWJEOWFsRytxRzBnemZkcjBYUWdwUnMramRIdm5PUmp2T0Z6WlE5Smpubzdp?=
 =?utf-8?B?UGZreXk5V1RhT3lZQkNBd2pEVnl5UmNWNTh1alFDd1BFTDVKU0tCbXFtT0xx?=
 =?utf-8?B?bVdyVjJDQTU5UjJlSkJGU1VCcFJVZitEVkl1ZkVja1dVc2xta3VLTXdJbmVP?=
 =?utf-8?Q?Izirww8lSbI9xmkfzdBlizexL+FHXk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(4053099003)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnByOXhCdkhQalJJeFEyVktiKyt6Y1NaVDkrMDlTcFBSSmE5REF0MjcvNVd6?=
 =?utf-8?B?azJNa3lzaEx3SnNlNjB4MGowSjU5SDZlMnJCT25STFpCMzZMb24wWWtBSlRz?=
 =?utf-8?B?NnJoRm5tKytaczlGUVZwZFFSSEdMallscFA5YXltRXBmbGxvM0hVUytjSHpl?=
 =?utf-8?B?ZnI5bHZyU2lvVXpkNGdYcFo2NlBPN0hRc3phQW01NVVqN2dIL0loeFM4RmR1?=
 =?utf-8?B?OU5Wcy9ONk9qaXN6N3lab3JMQkhJNEF6emhNbmVVNlFFK3M2VHhGN0Zja0hI?=
 =?utf-8?B?MTVrTndQZjVzNm9ROFBqM291MUIyNk5nenk3ZHZTS3h2ZDB1VC80TUpsZ3ZC?=
 =?utf-8?B?YnZBUWpjeHFsK0ZJRDlBbEFjY3RjSlpMQ2dDQkFkejRkNlBBV3ByM2I5ZlFi?=
 =?utf-8?B?ZHhKNEJXMStvZjAxTGp4K2RsQ0t3M2dkbmRXZ1B2ckp0WVYxZEJhRGRlZm9U?=
 =?utf-8?B?WWlRVFRIR0hiQzZ0UklIS3pzYWcwWFdrcGVjWkJSVjhwNXJpRmJVTm1aZFhF?=
 =?utf-8?B?TG1UYjdlczN3bUhYQzFrSWE4WDY0NENVVU0vRWN2WDdNZzlNVHNRRjNZZmp4?=
 =?utf-8?B?Y2t1RVM3Rm1QUGl6Qm5TWGFOZzNMMUJsSFY5NVhQK2ZSNFRJNWZWeWpUeG1O?=
 =?utf-8?B?UC93WThyblEwTkQvVUE2eFAxaHhEaXVuUytKY0l0VHdpS091MXFiSDM3WEtj?=
 =?utf-8?B?NEZkZXlBL3FKZUtCZGR2YkZPeHRmWGVwQVdETWkwY2VNbVBwNEpyTlNuTE4r?=
 =?utf-8?B?WG4wNXd5a0VWU2huVXVmRExOQXNVUkxCeFRMYkNZL2VPdjJCNDVjTlJ1dGtB?=
 =?utf-8?B?SXZlZHNDUXRFckwwV1hIa3p4L3FGOGpHVGRKbkRkUU9LY3JsbEJUMkRGK0xL?=
 =?utf-8?B?Mm1OSllMR0VVNnZJNVNpN2J4NWtwSHo3dlRnUzVzTnBucDR4TmthK0JackFQ?=
 =?utf-8?B?UmVVRW51UU9uTWFiKzVEK2ZhU1UzWGFoREtxd1ZUT2VXVzRWV1dRODNrVk84?=
 =?utf-8?B?ZmwvR21KajRKYVJZNWNIanJpQ0VxR21OMkRrYkZOWGxSU2xvR0pNOHlncUx4?=
 =?utf-8?B?SXJuTnVhRmVmNEN1Vm1TSXFDN0tuQW1MRHhqcS9GbCs1eVdpVGdmS09QTGY2?=
 =?utf-8?B?b0FqQVJjUDFSOXJzdmtXMk5SdUNMdDdvNGZWR2FCY1FaVzhzYUZkNGxpZ3JY?=
 =?utf-8?B?T2h4cUVOV1kvbWdmeGlLK3RtNGtkMWhJb2R5UHMxR005Q2NxYkF3NmloWGdp?=
 =?utf-8?B?VytyY1ZCQ2NXYjlVcXFocGd2MkxZR1Q5Y3JOMHpMc1NKSVF4cjgybTdFM05S?=
 =?utf-8?B?SC9TVkRkMjdaem02aWd3dUpTOUlhK081Z1RRbzFFMDBKamtSODRENlBoNXRQ?=
 =?utf-8?B?VW9XTnZUeE1QV0hOWldYMzJKZEFxNmdhWFZueVdCYjN4cWJSVTN5MUU4a3Nt?=
 =?utf-8?B?Ryt3bHhYcGFoR0VZbDRGQkN2YkpIdXFhbzRnb1pHWmdWeFdRK1Q5amZxT2RU?=
 =?utf-8?B?TURocWFETHJOVEh4bTR4UVJxbFN1VTlGbXdOcjdmcndvS1BNVTJmbkFSekR4?=
 =?utf-8?B?V2haZFhJb2lLSENFRGNLdkR4bW94blBlMXo1Z2ttYVo0NVlVYVgvdTdmcCtt?=
 =?utf-8?B?dkJqL2lnSUlaRUJ4aU5hWk00QSt4bVBRR3pLY2VhZVRGdndtcUx2Vm1WbzFR?=
 =?utf-8?B?MlUyQmp2S0tscVhYcSthalBxUjZZaFlMdjlXWnJoNkcva1g5Q2ZVYkZYdkln?=
 =?utf-8?B?dmtLZk9KK2xVMjhEajhRSC8ydXVISTljN1o0OHJIbXZCVHNneDd0RXk4MWl1?=
 =?utf-8?B?cmpESkNtdzdNN0R6RC84ci9WbXg3VU44UmVyWEZwOENMUHRCL1Y0TnJmUWtS?=
 =?utf-8?B?VzlwdGVYbTduMG9yRm96dithNjlSMUxSeFdYMnFVR2tjckxxNE9pSjV6QVVI?=
 =?utf-8?B?Wld2eHFMTlRPa0dXSEV1Z3F2RDdUK3hjTzB6WUpVRVhxRlhweXVxQ2YrMk00?=
 =?utf-8?B?TldHd21qR0M3VDhMSE1VUXptNEdUTkdDSWc3c3RxZDFKc3MrcG1SSTVQZlh6?=
 =?utf-8?B?d1hkUDlWZUNubWpIV1NZdkQ1R1J6Tm5FdVVYR2JWdjNEcGxidEtIL3JGU2NF?=
 =?utf-8?B?NHl6c08yTjZ3TTNOdUZEV1RaVTh2Mmc3SHRBcFdJQ2JYYWpvd2JpbC80UXE5?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pO1n71RM0RGpVh08a2JDY0fO"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 00388a74-a8eb-41e0-1a26-08dde09181da
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 09:02:50.9727 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aRhonREi8dQ/77nHBONZntUYTEGgb3lIhhrDFMEjV4P91xDqwjrPkbiWeaptCQZUI2/MlOMafvxEQBK3xXQhpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB3712
X-Authority-Analysis: v=2.4 cv=FodcP2rq c=1 sm=1 tr=0 ts=68a6e0c0 cx=c_pps
 a=BiIdyD/7WWdsakcmwxy6cA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=NgoYpvdbvlAA:10 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=suRIpz00yrdexZQq2NUA:9
 a=QEXdDO2ut3YA:10 a=8phQkBtYVeM1x3jINw4A:9 a=FfaGCDsud1wA:10
 a=t8nPyN_e6usw4ciXM-Pk:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-ORIG-GUID: TdIyx0MTa1opfuV-bPR6TfM02SdtSITS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDA3MCBTYWx0ZWRfX+j2qPkcqHM0p
 ICxyGErylnSLhXlh+su/LoEkd6A8UNFqNvzM648G7dJU1abVMAeLfe+PleUbCZeiY8TMj9RVE6H
 2GLzos53+pokC3I+KaMsZfk5JXfcnlyCn6KGqFCIW9xvi4CUbFxf0SYC0arusVl3r+nGWJTxJea
 duiyKsN5kszTOMyIolISC7AxZRVfFFh9NSffAvf8aYx30r88YX10NPz7NhsgsWb6H5Z2I7ngNbe
 WAwAZtI63wgl0ysYZX3dLZVnBiQ+T5Z+oQQtfbNCa5aycOR2C+4WMKDHhCNCH0TC51YBGO0am3t
 RAP8q3LHeF0pHAS3SN2hFeLU4+6cW3IrzhYuygPr2K8Ob6uXUzzcCBv97RWNN/YU+soNFSTXNJ5
 tcyJ5IE6ttzxxOakHk2FIxjT4QKvew==
X-Proofpoint-GUID: TdIyx0MTa1opfuV-bPR6TfM02SdtSITS
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

--------------pO1n71RM0RGpVh08a2JDY0fO
Content-Type: multipart/mixed; boundary="------------HSLxHC03v0J1ufjRUGumkuRv";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns
 <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Drew Fustini <fustini@kernel.org>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <27d70d29-9e37-4905-9d22-0266c8a290a2@imgtec.com>
Subject: Re: [PATCH v12 1/4] drm/imagination: Use pwrseq for TH1520 GPU power
 management
References: <CGME20250820085609eucas1p2938d69999f4d7c9654d5d2a12a20c906@eucas1p2.samsung.com>
 <20250820-apr_14_for_sending-v12-0-4213ccefbd05@samsung.com>
 <20250820-apr_14_for_sending-v12-1-4213ccefbd05@samsung.com>
 <CAPDyKFqeOUwTbZEUFmHS2Onyj5LZ1b26vGgC4=UHUOxhwbzjRw@mail.gmail.com>
In-Reply-To: <CAPDyKFqeOUwTbZEUFmHS2Onyj5LZ1b26vGgC4=UHUOxhwbzjRw@mail.gmail.com>

--------------HSLxHC03v0J1ufjRUGumkuRv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20/08/2025 18:08, Ulf Hansson wrote:
> On Wed, 20 Aug 2025 at 10:56, Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> Update the Imagination PVR DRM driver to leverage the pwrseq framework=

>> for managing the complex power sequence of the GPU on the T-HEAD TH152=
0
>> SoC.
>>
>> To cleanly separate platform-specific logic from the generic driver,
>> this patch introduces an `init` callback to the `pwr_power_sequence_op=
s`
>> struct. This allows for different power management strategies to be
>> selected at probe time based on the device's compatible string.
>>
>> A `pvr_device_data` struct, associated with each compatible in the
>> of_device_id table, points to the appropriate ops table (manual or
>> pwrseq).
>>
>> At probe time, the driver now calls the `->init()` op. For pwrseq-base=
d
>> platforms, this callback calls `devm_pwrseq_get("gpu-power")`, deferri=
ng
>> probe if the sequencer is not yet available. For other platforms, it
>> falls back to the existing manual clock and reset handling. The runtim=
e
>> PM callbacks continue to call the appropriate functions via the ops
>> table.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/gpu/drm/imagination/pvr_device.c |  22 +---
>>  drivers/gpu/drm/imagination/pvr_device.h |  22 ++++
>>  drivers/gpu/drm/imagination/pvr_drv.c    |  27 ++++-
>>  drivers/gpu/drm/imagination/pvr_power.c  | 174 ++++++++++++++++++++++=
++-------
>>  drivers/gpu/drm/imagination/pvr_power.h  |  15 +++
>>  5 files changed, 201 insertions(+), 59 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/dr=
m/imagination/pvr_device.c
>> index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..294b6019b4155bb7fdb7de=
73ccf7fa8ad867811f 100644
>> --- a/drivers/gpu/drm/imagination/pvr_device.c
>> +++ b/drivers/gpu/drm/imagination/pvr_device.c
>> @@ -23,6 +23,7 @@
>>  #include <linux/firmware.h>
>>  #include <linux/gfp.h>
>>  #include <linux/interrupt.h>
>> +#include <linux/of.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_runtime.h>
>>  #include <linux/reset.h>
>> @@ -121,21 +122,6 @@ static int pvr_device_clk_init(struct pvr_device =
*pvr_dev)
>>         return 0;
>>  }
>>
>> -static int pvr_device_reset_init(struct pvr_device *pvr_dev)
>> -{
>> -       struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
>> -       struct reset_control *reset;
>> -
>> -       reset =3D devm_reset_control_get_optional_exclusive(drm_dev->d=
ev, NULL);
>> -       if (IS_ERR(reset))
>> -               return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
>> -                                    "failed to get gpu reset line\n")=
;
>> -
>> -       pvr_dev->reset =3D reset;
>> -
>> -       return 0;
>> -}
>> -
>>  /**
>>   * pvr_device_process_active_queues() - Process all queue related eve=
nts.
>>   * @pvr_dev: PowerVR device to check
>> @@ -618,6 +604,9 @@ pvr_device_init(struct pvr_device *pvr_dev)
>>         struct device *dev =3D drm_dev->dev;
>>         int err;
>>
>> +       /* Get the platform-specific data based on the compatible stri=
ng. */
>> +       pvr_dev->device_data =3D of_device_get_match_data(dev);
>> +
>>         /*
>>          * Setup device parameters. We do this first in case other ste=
ps
>>          * depend on them.
>> @@ -631,8 +620,7 @@ pvr_device_init(struct pvr_device *pvr_dev)
>>         if (err)
>>                 return err;
>>
>> -       /* Get the reset line for the GPU */
>> -       err =3D pvr_device_reset_init(pvr_dev);
>> +       err =3D pvr_dev->device_data->pwr_ops->init(pvr_dev);
>>         if (err)
>>                 return err;
>>
>> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/dr=
m/imagination/pvr_device.h
>> index 7cb01c38d2a9c3fc71effe789d4dfe54eddd93ee..0c970255f90805a569d7d1=
9e35ec5f4ca7f02f7a 100644
>> --- a/drivers/gpu/drm/imagination/pvr_device.h
>> +++ b/drivers/gpu/drm/imagination/pvr_device.h
>> @@ -37,6 +37,9 @@ struct clk;
>>  /* Forward declaration from <linux/firmware.h>. */
>>  struct firmware;
>>
>> +/* Forward declaration from <linux/pwrseq/consumer.h> */
>> +struct pwrseq_desc;
>> +
>>  /**
>>   * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR devi=
ce
>>   * @b: Branch ID.
>> @@ -57,6 +60,14 @@ struct pvr_fw_version {
>>         u16 major, minor;
>>  };
>>
>> +/**
>> + * struct pvr_device_data - Platform specific data associated with a =
compatible string.
>> + * @pwr_ops: Pointer to a structure with platform-specific power func=
tions.
>> + */
>> +struct pvr_device_data {
>> +       const struct pvr_power_sequence_ops *pwr_ops;
>> +};
>> +
>>  /**
>>   * struct pvr_device - powervr-specific wrapper for &struct drm_devic=
e
>>   */
>> @@ -98,6 +109,9 @@ struct pvr_device {
>>         /** @fw_version: Firmware version detected at runtime. */
>>         struct pvr_fw_version fw_version;
>>
>> +       /** @device_data: Pointer to platform-specific data. */
>> +       const struct pvr_device_data *device_data;
>> +
>>         /** @regs_resource: Resource representing device control regis=
ters. */
>>         struct resource *regs_resource;
>>
>> @@ -148,6 +162,14 @@ struct pvr_device {
>>          */
>>         struct reset_control *reset;
>>
>> +       /**
>> +        * @pwrseq: Pointer to a power sequencer, if one is used.
>> +        *
>> +        * Note: This member should only be accessed when
>> +        * IS_ENABLED(CONFIG_POWER_SEQUENCING) is true.
>> +        */
>=20
> This looks like something that should be taken care of by the pwrseq in=
terface?
>=20
> Ideally there should be stub functions, when CONFIG_POWER_SEQUENCING
> is unset, right?

This one is my fault, I was just reviewing from the patches when I
requested that note and didn't appreciate that the pwrseq header
includes stubbed-out functions already. Lesson learned.

>=20
>> +       struct pwrseq_desc *pwrseq;
>> +
>>         /** @irq: IRQ number. */
>>         int irq;
>>
>> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/i=
magination/pvr_drv.c
>> index b058ec183bb30ab5c3db17ebaadf2754520a2a1f..af830e565646daf1955519=
7df492438ef48d5e44 100644
>> --- a/drivers/gpu/drm/imagination/pvr_drv.c
>> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
>> @@ -1480,15 +1480,37 @@ static void pvr_remove(struct platform_device =
*plat_dev)
>>         pvr_power_domains_fini(pvr_dev);
>>  }
>>
>> +static const struct pvr_device_data pvr_device_data_manual =3D {
>> +       .pwr_ops =3D &pvr_power_sequence_ops_manual,
>> +};
>> +
>> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
>=20
> Ditto.
>=20
>> +static const struct pvr_device_data pvr_device_data_pwrseq =3D {
>> +       .pwr_ops =3D &pvr_power_sequence_ops_pwrseq,
>> +};
>> +#endif
>> +
>>  static const struct of_device_id dt_match[] =3D {
>> -       { .compatible =3D "img,img-rogue", .data =3D NULL },
>> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
>=20
> Ditto.
>=20
> I don't see anything wrong with allowing the driver to probe with the
> compatible below.
>=20
> When it then tries to hook up a pwrseq handle and fails, then the
> probe function should fail. Right?
>=20
>> +       {
>> +               .compatible =3D "thead,th1520-gpu",
>> +               .data =3D &pvr_device_data_pwrseq,
>> +       },
>> +#endif
>> +       {
>> +               .compatible =3D "img,img-rogue",
>> +               .data =3D &pvr_device_data_manual,
>> +       },
>>
>>         /*
>>          * This legacy compatible string was introduced early on befor=
e the more generic
>>          * "img,img-rogue" was added. Keep it around here for compatib=
ility, but never use
>>          * "img,img-axe" in new devicetrees.
>>          */
>> -       { .compatible =3D "img,img-axe", .data =3D NULL },
>> +       {
>> +               .compatible =3D "img,img-axe",
>> +               .data =3D &pvr_device_data_manual,
>> +       },
>>         {}
>>  };
>>  MODULE_DEVICE_TABLE(of, dt_match);
>> @@ -1513,4 +1535,5 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
>>  MODULE_LICENSE("Dual MIT/GPL");
>>  MODULE_IMPORT_NS("DMA_BUF");
>>  MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
>> +MODULE_FIRMWARE("powervr/rogue_36.52.104.182_v1.fw");
>>  MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");
>> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm=
/imagination/pvr_power.c
>> index 187a07e0bd9adb2f0713ac2c8e091229f4027354..58e0e812894de19c834e1d=
fca427208b343eaa1c 100644
>> --- a/drivers/gpu/drm/imagination/pvr_power.c
>> +++ b/drivers/gpu/drm/imagination/pvr_power.c
>> @@ -18,6 +18,9 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_domain.h>
>>  #include <linux/pm_runtime.h>
>> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
>> +#include <linux/pwrseq/consumer.h>
>> +#endif
>>  #include <linux/reset.h>
>>  #include <linux/timer.h>
>>  #include <linux/types.h>
>> @@ -234,6 +237,132 @@ pvr_watchdog_init(struct pvr_device *pvr_dev)
>>         return 0;
>>  }
>>
>> +static int pvr_power_init_manual(struct pvr_device *pvr_dev)
>> +{
>> +       struct drm_device *drm_dev =3D from_pvr_device(pvr_dev);
>> +       struct reset_control *reset;
>> +
>> +       reset =3D devm_reset_control_get_optional_exclusive(drm_dev->d=
ev, NULL);
>> +       if (IS_ERR(reset))
>> +               return dev_err_probe(drm_dev->dev, PTR_ERR(reset),
>> +                                    "failed to get gpu reset line\n")=
;
>> +
>> +       pvr_dev->reset =3D reset;
>> +
>> +       return 0;
>> +}
>> +
>> +static int pvr_power_on_sequence_manual(struct pvr_device *pvr_dev)
>> +{
>> +       int err;
>> +
>> +       err =3D clk_prepare_enable(pvr_dev->core_clk);
>> +       if (err)
>> +               return err;
>> +
>> +       err =3D clk_prepare_enable(pvr_dev->sys_clk);
>> +       if (err)
>> +               goto err_core_clk_disable;
>> +
>> +       err =3D clk_prepare_enable(pvr_dev->mem_clk);
>> +       if (err)
>> +               goto err_sys_clk_disable;
>> +
>> +       /*
>> +        * According to the hardware manual, a delay of at least 32 cl=
ock
>> +        * cycles is required between de-asserting the clkgen reset an=
d
>> +        * de-asserting the GPU reset. Assuming a worst-case scenario =
with
>> +        * a very high GPU clock frequency, a delay of 1 microsecond i=
s
>> +        * sufficient to ensure this requirement is met across all
>> +        * feasible GPU clock speeds.
>> +        */
>> +       udelay(1);
>> +
>> +       err =3D reset_control_deassert(pvr_dev->reset);
>> +       if (err)
>> +               goto err_mem_clk_disable;
>> +
>> +       return 0;
>> +
>> +err_mem_clk_disable:
>> +       clk_disable_unprepare(pvr_dev->mem_clk);
>> +
>> +err_sys_clk_disable:
>> +       clk_disable_unprepare(pvr_dev->sys_clk);
>> +
>> +err_core_clk_disable:
>> +       clk_disable_unprepare(pvr_dev->core_clk);
>> +
>> +       return err;
>> +}
>> +
>> +static int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev)
>> +{
>> +       int err;
>> +
>> +       err =3D reset_control_assert(pvr_dev->reset);
>> +
>> +       clk_disable_unprepare(pvr_dev->mem_clk);
>> +       clk_disable_unprepare(pvr_dev->sys_clk);
>> +       clk_disable_unprepare(pvr_dev->core_clk);
>> +
>> +       return err;
>> +}
>> +
>> +const struct pvr_power_sequence_ops pvr_power_sequence_ops_manual =3D=
 {
>> +       .init =3D pvr_power_init_manual,
>> +       .power_on =3D pvr_power_on_sequence_manual,
>> +       .power_off =3D pvr_power_off_sequence_manual,
>> +};
>> +
>> +#if IS_ENABLED(CONFIG_POWER_SEQUENCING)
>=20
> Again, this should not be needed. Instead, the call to
> devm_pwrseq_get() should return an error from a stub function if
> CONFIG_POWER_SEQUENCING is not set, right?
>=20
> The similar should apply to pwrseq_power_on|off(), right?
>=20
>> +static int pvr_power_init_pwrseq(struct pvr_device *pvr_dev)
>> +{
>> +       struct device *dev =3D from_pvr_device(pvr_dev)->dev;
>> +
>> +       pvr_dev->pwrseq =3D devm_pwrseq_get(dev, "gpu-power");
>> +       if (IS_ERR(pvr_dev->pwrseq)) {
>> +               /*
>> +                * This platform requires a sequencer. If we can't get=
 it, we
>> +                * must return the error (including -EPROBE_DEFER to w=
ait for
>> +                * the provider to appear)
>> +                */
>> +               return dev_err_probe(dev, PTR_ERR(pvr_dev->pwrseq),
>> +                                    "Failed to get required power seq=
uencer\n");
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
>> +{
>> +       return pwrseq_power_on(pvr_dev->pwrseq);
>> +}
>> +
>> +static int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
>> +{
>> +       return pwrseq_power_off(pvr_dev->pwrseq);
>> +}
>> +
>> +const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq =3D=
 {
>> +       .init =3D pvr_power_init_pwrseq,
>> +       .power_on =3D pvr_power_on_sequence_pwrseq,
>> +       .power_off =3D pvr_power_off_sequence_pwrseq,
>> +};
>> +#else /* IS_ENABLED(CONFIG_POWER_SEQUENCING) */
>> +static int pvr_power_sequence_stub(struct pvr_device *pvr_dev)
>> +{
>> +       WARN_ONCE(1, "pwrseq support not enabled in kernel config\n");=

>> +       return -EOPNOTSUPP;
>> +}
>> +
>> +const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq =3D=
 {
>> +       .init =3D pvr_power_sequence_stub,
>> +       .power_on =3D pvr_power_sequence_stub,
>> +       .power_off =3D pvr_power_sequence_stub,
>> +};
>> +#endif /* IS_ENABLED(CONFIG_POWER_SEQUENCING) */
>=20
> Yeah, this looks really messy to me.
>=20
> If there is something missing in the pwrseq interface to make this
> simpler, let's add that instead of having to keep this if/def hacks
> around.

Agreed (now that I've actually done my homework), I see no reason to
keep the IS_ENABLED(...) checks around.

Cheers,
Matt

>=20
> [...]
>=20
> Other than the if/def hacks, I think this looks good to me!
>=20
> Kind regards
> Uffe


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------HSLxHC03v0J1ufjRUGumkuRv--

--------------pO1n71RM0RGpVh08a2JDY0fO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaKbgugUDAAAAAAAKCRB5vBnz2d5qsCto
AP95CAYLSlqylQy/qCleff4Zke9TydtB5uBHBHZpSrDo3AD+K3p8QEhLiR+h+EqBS58mw9YblP1J
sKb/hAUjU0lO8g8=
=Fupx
-----END PGP SIGNATURE-----

--------------pO1n71RM0RGpVh08a2JDY0fO--
