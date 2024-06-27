Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3FF919F8B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 08:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D76810E14A;
	Thu, 27 Jun 2024 06:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z8v7TxSi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115D610E14A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 06:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6FGOh3Em0ui/3GlyrKMF/cmB0eNTfeYZd2el5t5VrmlX41CiK9KAz/c7BSvBQpQH9oDxyY2/hpxPGD99dSAr01bdZvoTHFJM6eV5XjtW9gyXayoVd2/NYst342UUwHS1roTmHRqQu7UFLwwqSClJEYmTXRQ++CnROmQ5RRWRxSR42LbMLBs5FJo4kjoGSOyOLZwlUOi5Ymu+5DPV23NTuqbm2942c/LZhcY0KVZH/uTNTA5ICKF0xtJJ+eNzLW+6Rx95HP1IilV2aciyRfEZyWQugS7n1Fr60jxbHmgkfvmzDpVmsKa/T2WtHTQQP30hqQAuTDI7kldjyfceOQ3sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NeLua0cj9XBmn3yL+q2XkRAaKXoFlG1CxntSceFPdY=;
 b=oCGctQUlDZWK5W3K/jjHrU+WUHiZs7XeI6/RQUerzDX8y9cD1yrA7uzgl2jo09Yy16pYFaNr7evA2svKSx19jtK63R9wM18z4oaUPBTCi1VxDlR8WYYcvu1PjdCkQ0EBoOWYrVveaeHqfz4Y6NS4k7Sr/dSaC+5pfmmDYQthItU71p8bdA0D/AbKkv4ayg0D3UY7M/Dzspw8Cd0GxjF8UEAKdttB3zZDHGdCL2z+KGggFQ3ouo6vNmfWy6cQsiHWcctTjXTqlqpg/hjrHWfcYuF9R6QWXXiI55dLZGH+jaEZgxicbhCB3UyaFgLTMENCrr6ELbETkB+rtVf3tRnwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7NeLua0cj9XBmn3yL+q2XkRAaKXoFlG1CxntSceFPdY=;
 b=z8v7TxSil3Hkx85YONUY27Vg5S4cd/enLtpTmdTnmqjWBf/FP7Y4LsrQG31ONhE0zEGyOhhVTvvBECMxAbBhDFPUuRjpnlIMh4sOiqdCn0OYSRLJICob2fWjJqdgpTB2aI3awQXXIGXMTJZaz5zWdsccXimIS+d8Tg1dkz0zNfo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 06:48:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:48:31 +0000
Content-Type: multipart/alternative;
 boundary="------------5bzmUVoyC3OXSe0CF2nITZZN"
Message-ID: <c88fd8ea-bf1e-49d1-b020-d714a82c5bd8@amd.com>
Date: Thu, 27 Jun 2024 08:48:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "mripard@kernel.org" <mripard@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "willy@infradead.org" <willy@infradead.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <1ce8cea2fdb4169ce827b0bd20d472e697f23c38.camel@mediatek.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1ce8cea2fdb4169ce827b0bd20d472e697f23c38.camel@mediatek.com>
X-ClientProxiedBy: FR2P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: be31b165-72b9-4bf5-581d-08dc96752833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmdaZzgrcEhPeTFLQU1jMHdHY0t0TzV6RVZPQXBXMW1CMHRsMXNRN2xxc1RQ?=
 =?utf-8?B?Ump0aFVjQWsxeHJYc1FpeDc5SEFrMVY2eGs1N2N3NDhWS1lOazhtWkpOdStY?=
 =?utf-8?B?ZWVjdkxmaEI3QlJkS3prNkJOSWo2YXBjR0dGUUtBSjNFUXYyQjdKZU1CQndL?=
 =?utf-8?B?My9qaGthYjRYSXJZSTRXZ0hDREljL3A3U0dwQSszazM0TTY0aTFWWHZsakFv?=
 =?utf-8?B?a1ZzMU5SV2I5bUtydWlOdlRaVWwwYUVzWGFoMzZtRkdrNXdWaHpEaUtKM2Uy?=
 =?utf-8?B?bHh4WnVidGlvNmZsdXY3RzVmMTQvcW9BUEU3ZGtpTzRNeFRhUlUrUU9EYWFo?=
 =?utf-8?B?VkEvNEU2ZG5ESUY2azBNR2lmd0cxQUEvcFQ2UUFwdnAwVjRQYVBwenNKQlB6?=
 =?utf-8?B?clhZanlnemFwM0hxZmtFcDYxMkN3N3dWUUxlcnpENmpiRnJ3T3oxbGJxQ0NV?=
 =?utf-8?B?dFNtVEx6YTMxT21lKzVQMnZhUmI3bmNpYy9IYk5leVRWQk00TDV6V1h0UFRP?=
 =?utf-8?B?b3ROVldYU21Fd3ZEZ2NlYzhJSEloY01UdjA0VFpuUzI2SDN5UDc4ZGdJZ092?=
 =?utf-8?B?Njl6YlQwYTBVTThtN1doYzcxZVVkRzlPRnVVdS9HbWZjY2JZSFpZbUx2ZXd4?=
 =?utf-8?B?QWlwckkwK1M0STN4OFdTNFZGUUJLZ0pseGFLcWFaVWxDL1NXU0pyY3BEUzF0?=
 =?utf-8?B?WWI5TVluMVdnZzZxM0tIdHN0R25LNHg4MlZ3Q3lkWjJRb0RmaVJUL2p3NFRq?=
 =?utf-8?B?MEsvaHZ6ZFA3SlZTWjN1enpLa3g2K2dLNHNVTlhTdmYvOVJMWEN0ZUkwVzha?=
 =?utf-8?B?Q0ZNaDVXMlR4OXJsMTdGVEwwVVBLODNTRUdHL2YweE5kamRzbm5NNzdWK3Fu?=
 =?utf-8?B?dkpDNnVrVkxBV25Xenh1N0hKdmp2NUdoS2hYbytNUEFPS1hqNGM5dWM3dE9I?=
 =?utf-8?B?YlpJT2VtMHBia2VnOG5yQkkvSzJoRkpZRkNueG9jbnNqWEFCT0hxWTNvZUQ3?=
 =?utf-8?B?dmhMUHVBV0QwRDhpczY5NFpqMUxlakxRS0pNMm1qSG02RnIrMnN0ZnIvdGVE?=
 =?utf-8?B?czRZdjUza0Q5V2w0KzF1dmVjeTVGNytBdWFyTEw5b2REWGR0cE5haWJhWnhY?=
 =?utf-8?B?QURHd0tMdXlaUnBuOGk0RTZJdmNLNUd5a3J0T1NtaER0U2t5VHVuM3NxMDkw?=
 =?utf-8?B?YW5KOHNlMkhvT0JjMm94T1J1UVdVd0lYY1pWcmprdkxSUzlhT2tyWnBnOVdD?=
 =?utf-8?B?ZmhEaWVyUXQzOG1iREM0YURwSlVxRkhFTGtrRm5LSi9KZFlZY2hjdmVHTlBW?=
 =?utf-8?B?OGFTV1QvYmxBTitUTW93ZkJQNm04cUFaZDlJcllHM2RPRndlTDNkbmgxdmZz?=
 =?utf-8?B?NHpuWHVoa3VFZjBaNmlRYTlKSUF4bGMzRE5GQ3Z5UXc0SnFGNU1hcnIwcFZ1?=
 =?utf-8?B?OUZDZnZiU0pVZk8xOGlGNHUzSldsTzZOcTJSZjRkUVd4SDR2RTZvb2pqVXRh?=
 =?utf-8?B?YllSN1dXcDlTemZRdGdXOVhBdWtTRGIrY2NkK0VVRmVHaEZXczFSODlpc1kw?=
 =?utf-8?B?b3ZzS1MvMUJUc01DR21tcGl6QmJaTzVDUHhUbXJ6enBhSFYwTnhraEliTGhJ?=
 =?utf-8?B?QklJS2g0R0JTUVV3bHVGbFUxYWZoNEQ4N3dWOTlKbDE0ZzNEUXB2dThLYmhn?=
 =?utf-8?B?STQ3WUt1M3BEREZSNnNXUmRZckd0aXZsanJ4Ymcwc1hkWE8zUUxVbkpTSnBa?=
 =?utf-8?Q?zt1z77CilrHZLG6aQQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHRzUXpnWGd1Tm1YU2VjM2dOcy9jalZ4T21pZjZ1TE5TRG1RQzNtcHIvbG1o?=
 =?utf-8?B?UGE5aUpWZ21GdGdEbCtERkhENHNEOEZxU0pxSU1IOGQ0dWN4dW91UmphYklh?=
 =?utf-8?B?MXRIYzcydDdZQTJYaFBKNkFZTnloMXh4RWlXWU5vVW1PbFJFMjNGNFk4NlJi?=
 =?utf-8?B?dTVTMEJWdE1FSVovWWlES2Z2M3BWbnQ3ajJuWmd1TnhkeC8rbmN2NCtZUCs1?=
 =?utf-8?B?cDd4S1ovSWw2d3pHc3pGT0w3eUlTeUVtdEdSWmtrM3g4M2dFYnhlL0dYOEs2?=
 =?utf-8?B?Ky84cWtqN1RkU2tJMnVIbG1tN0JWUDdGV0hKNkhvcXVpbk1QRmdScFgxS3Jj?=
 =?utf-8?B?ZVFqMGJKQ0dsYUdlVnZuUXRmd29HeWtBbUVWTEczL2IyeVFMNDJDLy8yZldU?=
 =?utf-8?B?YzFmM1lxellTK1dSR24rK2FqZTF3aVAwc2lOQ0FRc3pxWllNZUJtQW5mQ3M5?=
 =?utf-8?B?TDhsWnJDUHlwcGZHYTBkRGk2dFJmTHUxUGF4bkhUTXNDL1ozMkluSmoybU9R?=
 =?utf-8?B?dWR1M0UrbjBZTURsVkZucTVqekRYMGpnWDRoSjQzWXFTSDVBT2ZGTGFaZTla?=
 =?utf-8?B?NndMdUY2TFVRZGhiNXZkc2dMR2hjZ1djaVZ2R09Ma2lOVEFyemRqMmZML1o1?=
 =?utf-8?B?UGMvYXRZTzhKM2FoN0xWOTlGL21IR01pTnVtN0p1aWlpV1RITEorVDdvSDdF?=
 =?utf-8?B?eERNZmRiUmx6MFV3VnBOYkRGZFlXMWNVaGVqU2w5Q0lJaFFCRU03K04rOUpT?=
 =?utf-8?B?cE5Qc2dyL2lZdnFFTTVHNUdRVUpSRGgyc0hZMFhaZlhlQjBJMHRSb2h0SVFm?=
 =?utf-8?B?NG1yMTJSSXBDUDlBUTZGUTRETzg1Q0x0QzdsbXA0azIycEJWd1BNTzMxQ2ZO?=
 =?utf-8?B?S3NUaVFUZ3BkRFJHVEMybHg2aWphQitKRTh1cFE1c3FlYTN3VTdONGJ5R1lT?=
 =?utf-8?B?R1JhcWNMaDMrSk1zMzlMcW5TS2JUSGF4SUljdkdueFdrZzNxV1pUazU4cVdS?=
 =?utf-8?B?bDQrZWFEcy9XZWZXcHJmSHRNL2wvNEdNNFJSTldMZFlpMUFlZkNVYjR3WFE4?=
 =?utf-8?B?TzdXVjUweEpmRGZ2eUN3blB3N2NNZ3lvaHVKeHpXY3ZpaUx1UER3Z2dML0Rv?=
 =?utf-8?B?ZU1XWEloVTFKeFJCODdNbFpKSm0wRDBIUHlGMFR2blFPN0RCNmY5WkVJYytQ?=
 =?utf-8?B?eHhNdzZTbTM4Mnlhd2lVckVCR1pwblF2NEVaUVFNM3JVZTVJS1EzcUpZaWxp?=
 =?utf-8?B?NWJmUlBGcndSL1pPYzFNSStlc1dldVFHM0dJUnlQWTE1V0xkbUwzMTIzV2d1?=
 =?utf-8?B?UGtuaEFHUU91OUJiTE13UE1XUnZYcVhYQ0NYRDVmM0tuaEUzS1J3dWd2KzBo?=
 =?utf-8?B?dTR0ZzVBVmkzaWdTZ0NoV1FqT3h1VzZoWmgxYWRwNzFnWUFzUnUyNEtPTENV?=
 =?utf-8?B?b3gyVUNmTjNreE9QUXBCcXhoY2JLSVZ5amQxdmIwaTVKN0Q0UHptMXpHOXo1?=
 =?utf-8?B?SWJoeXgrRWtyYkZVSWNCVmZqODhGeHpSakxuenVOOU41ajQ0OUFMNVdvem9r?=
 =?utf-8?B?ZExzS3RBbFdCK3FXakZFUVFFak9rV1ZiQWpFdkxoMHdxYXNMUVZkV3JVcW1G?=
 =?utf-8?B?Q1pqZVhhTVJualBJRjR6bVdIQWw0d2xVZ1ZsK3g1eU5NaWUrVy9remJ3eHpP?=
 =?utf-8?B?eVVlWXRJc0EvNkpWNjdVYjJZWGdCVHFJZUU1blhSZHd1VHMzWFhzRGxkTThK?=
 =?utf-8?B?d1BNZE1ZZHJiVzNsVDQyZnJ3Mk1jSGEwUlIrRzVrSkVublZSSnZsNTRIWEZz?=
 =?utf-8?B?TUFQREJ4NENNdWUrQ0JBZnBEaisrOEdsMWY3YzBWZEVRelFPTnZ0UnBIbnJQ?=
 =?utf-8?B?cGViYmpLTEJUNGxGQlAzdm8vRHNVVUdEM3dBRDBLUEhDbUo1Qzc0ajBMd1p6?=
 =?utf-8?B?WFRkaC81ZmNBN0I3N3ZtQ29lbGRWbk5tVHM5VUdhVjZXNGx0bDNsWW1jV1VF?=
 =?utf-8?B?RFhMMVF2YjY2RThaL0MzNkhZNnBQR3FLQlVja0dTSTlJak9KMlNlTzl4eTNw?=
 =?utf-8?B?dExQL0Yrd0xlWnZlMGRMTWlZNzhjbkNrZFVFcEYyY3pGTENZZDNtZTVoQ1h6?=
 =?utf-8?Q?8db3mpf4ySqp0NqNLilFyfUdV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be31b165-72b9-4bf5-581d-08dc96752833
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:48:31.0885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDdxecl0d0t1Fj0Ilcq3lSLHpz+hUkkSr2Q40WIbNEZRL5JB65NAHSfGwh5izca7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265
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

--------------5bzmUVoyC3OXSe0CF2nITZZN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 27.06.24 um 05:17 schrieb Jason-JH Lin (林睿祥):
>
> On Wed, 2024-06-26 at 12:49 +0200, Christian König wrote:
> >   
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> > Am 26.06.24 um 10:05 schrieb Jason-JH Lin (林睿祥):
> > > > 
> > > > > In the step 3), we need to verify the dma-buf is allocated from
> > > > > "restricted_mtk_cma", but there is no way to pass the
> > >  secure flag
> > > > >  or
> > > > > private data from userspace to the import interface in DRM
> > > driver.
> > > >  
> > > > Why do you need to verify that?
> > > 
> > > I need to know the imported buffer is allocated from restricted cma
> > > and
> > > mark it as a secure buffer in mediatek-drm driver. Then, I will add
> > > some configuration to the hardware if the buffer is secure buffer,
> > > so
> > > that it can get the permission to access the secure buffer.
> >  
> > Yeah so far that makes sense. This is basically what other drivers do
> > with secure buffers as well.
> > 
> > But why do you want the kernel to transport that information? Usually
> > drivers get the information from userspace what to do with a buffer.
> > 
> > In other words the format, stride, tilling and also if it's a secure
> > buffer or not comes from userspace.
> > 
>
> Thanks for your clear explanation.
> I think this is what I want, but I can't find any DRM interface to pass
> the secure flag from userspace.

Well stuff like that is usually device driver specific.

So you should probably use something device specific which tells the 
driver that this buffer is encrypted.

> > What the hardware usually handles internally is things like
> > encryption keys, but you eventually get the information where to look
> > for the key from userspace as well.
> > 
> > Handling inside the kernel would only be necessary if userspace could
> > for example crash the system with invalid parameters. But for
> > encryption that is usually not the case.
> > 
>
> Yes, that's true.
>
> > > > 
> > > > > So I can only verify it like this now:
> > > > > struct drm_gem_object *mtk_gem_prime_import_sg_table(struct
> > > > > drm_device
> > > > > *dev, struct dma_buf_attachment *attach, struct sg_table *sg)
> > > > > {
> > > > >     struct mtk_gem_obj *mtk_gem;
> > > > > 
> > > > >     /* check if the entries in the sg_table are contiguous */
> > > > >     if (drm_prime_get_contiguous_size(sg) <
> > >  attach->dmabuf->size) {
> > > > >         DRM_ERROR("sg_table is not contiguous");
> > > > >         return ERR_PTR(-EINVAL);
> > > > >     }
> > > > >     mtk_gem = mtk_gem_init(dev, attach->dmabuf->size);
> > > > >     if (IS_ERR(mtk_gem))
> > > > >         return ERR_CAST(mtk_gem);
> > > > > 
> > > > > +   mtk_gem->secure = (!strncmp(attach->dmabuf->exp_name,
> > > > >  "restricted",
> > > > > 10));
> > > > >     mtk_gem->dma_addr = sg_dma_address(sg->sgl);
> > > > >     mtk_gem->size = attach->dmabuf->size;
> > > > >     mtk_gem->sg = sg;
> > > > > 
> > > > >     return &mtk_gem->base;
> > > > > }
> > > >  
> > > > Complete NAK from my side to that approach. Importing of a DMA-
> > > buf
> > > > should be independent of the exporter.
> > > > 
> > > > What you could do is to provide the secure buffer from a device
> > > and
> > > > not a device heap.
> > > > 
> > > 
> > > You mean I should allocate buffer in mediate-drm driver not
> > > userspace?
> >  
> > Well that depends. The question is if you have multiple drivers which
> > needs to work with this secure buffer?
> > 
> > If yes then you should have a general allocation heap for it. If no
> > then the buffers could as well be allocated from the driver interface
> > directly.
> > 
>
> Yes, this buffer needs work with GPU and DRM drivers, so this general
> "restricted_mtk_cma" will allocated in userspace, then being passed to
> GPU and DRM.

Well do you really need a separate heap for that? In other words is only 
a certain part of the system memory capable of being encrypted?

Or would the "normal" CMA heap do as well and you only need to setup 
your hardware properly for encryption?

Additional to that in most other drivers buffer sharing and encryption 
are two separate things. In other words other drivers do something like 
this:

1. Allocate the buffer.
2. Import the buffer using DRM_IOCTL_PRIME_FD_TO_HANDLE.
3. Set additional buffer properties, e.g. format, stride, tilling, if 
it's secure, which encryption key to use, where to map etc...

So as far as I can see the problem you are facing is that you try to 
mangle everything into DRM_IOCTL_PRIME_FD_TO_HANDLE. Why not make that a 
separate IOCTL?

I mean we intentionally don't provide things like format, stride, 
tilling etc.. to DRM_IOCTL_PRIME_FD_TO_HANDLE. Encryption is just 
another of those parameters.

Regards,
Christian.

>
> > > I just have modified this to userspace by the comment here:
> > > 
> > > 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240403102701.369-3-shawn.sung@mediatek.com/#25806766
> > > 
> > > > > I think I have the same problem as the ECC_FLAG mention in:
> > > > > 
> > > > > 
> > > 
> https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/
> > > > > 
> > > > > I think it would be better to have the user configurable
> > > private
> > > > > information in dma-buf, so all the drivers who have the same
> > > > > requirement can get their private information from dma-buf
> > >  directly
> > > > > and
> > > > > no need to change or add the interface.
> > > > > 
> > > > > What's your opinion in this point?
> > > >  
> > > > Well of hand I don't see the need for that.
> > > > 
> > > > What happens if you get a non-secure buffer imported in your
> > > secure
> > > > device?
> > > 
> > > We use the same mediatek-drm driver for secure and non-secure
> > > buffer.
> > > If non-secure buffer imported to mediatek-drm driver, it's go to
> > > the
> > > normal flow with normal hardware settings.
> > > 
> > > We use different configurations to make hardware have different
> > > permission to access the buffer it should access.
> > > 
> > > So if we can't get the information of "the buffer is allocated from
> > > restricted_mtk_cma" when importing the buffer into the driver, we
> > > won't
> > > be able to configure the hardware correctly.
> >  
> > Why can't you get this information from userspace?
>
> As I mentioned here:
>
> https://patchwork.kernel.org/project/linux-mediatek/cover/20240525232928.5524-1-jason-jh.lin@mediatek.com/#25886488
>
> I tried some DRM interfaces using buffer FD and arg->flag as
> parameters, but it didn't work. So I ask for your help here.
>
> But I think I should find DRM maintainer to add the secure flag to DRM
> interface now.
>
> Regards,
> Jason-JH.Lin
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

--------------5bzmUVoyC3OXSe0CF2nITZZN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 27.06.24 um 05:17 schrieb Jason-JH Lin (林睿祥):<br>
    <blockquote type="cite" cite="mid:1ce8cea2fdb4169ce827b0bd20d472e697f23c38.camel@mediatek.com">
      
      <p>
      </p>
      <pre>On Wed, 2024-06-26 at 12:49 +0200, Christian König wrote:
&gt;   
&gt; External email : Please do not click links or open attachments until
&gt; you have verified the sender or the content.
&gt; Am 26.06.24 um 10:05 schrieb Jason-JH Lin (林睿祥):
&gt; &gt; &gt; 
&gt; &gt; &gt; &gt; In the step 3), we need to verify the dma-buf is allocated from
&gt; &gt; &gt; &gt; &quot;restricted_mtk_cma&quot;, but there is no way to pass the
&gt; &gt;  secure flag
&gt; &gt; &gt; &gt;  or
&gt; &gt; &gt; &gt; private data from userspace to the import interface in DRM
&gt; &gt; driver.
&gt; &gt; &gt;  
&gt; &gt; &gt; Why do you need to verify that?
&gt; &gt; 
&gt; &gt; I need to know the imported buffer is allocated from restricted cma
&gt; &gt; and
&gt; &gt; mark it as a secure buffer in mediatek-drm driver. Then, I will add
&gt; &gt; some configuration to the hardware if the buffer is secure buffer,
&gt; &gt; so
&gt; &gt; that it can get the permission to access the secure buffer.
&gt;  
&gt; Yeah so far that makes sense. This is basically what other drivers do
&gt; with secure buffers as well.
&gt; 
&gt; But why do you want the kernel to transport that information? Usually
&gt; drivers get the information from userspace what to do with a buffer.
&gt; 
&gt; In other words the format, stride, tilling and also if it's a secure
&gt; buffer or not comes from userspace.
&gt; 

Thanks for your clear explanation.
I think this is what I want, but I can't find any DRM interface to pass
the secure flag from userspace.</pre>
    </blockquote>
    <br>
    Well stuff like that is usually device driver specific.<br>
    <br>
    So you should probably use something device specific which tells the
    driver that this buffer is encrypted.<br>
    <br>
    <blockquote type="cite" cite="mid:1ce8cea2fdb4169ce827b0bd20d472e697f23c38.camel@mediatek.com">
      <pre>&gt; What the hardware usually handles internally is things like
&gt; encryption keys, but you eventually get the information where to look
&gt; for the key from userspace as well.
&gt; 
&gt; Handling inside the kernel would only be necessary if userspace could
&gt; for example crash the system with invalid parameters. But for
&gt; encryption that is usually not the case.
&gt; 

Yes, that's true.

&gt; &gt; &gt; 
&gt; &gt; &gt; &gt; So I can only verify it like this now:
&gt; &gt; &gt; &gt; struct drm_gem_object *mtk_gem_prime_import_sg_table(struct
&gt; &gt; &gt; &gt; drm_device
&gt; &gt; &gt; &gt; *dev, struct dma_buf_attachment *attach, struct sg_table *sg)
&gt; &gt; &gt; &gt; {
&gt; &gt; &gt; &gt;     struct mtk_gem_obj *mtk_gem;
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt;     /* check if the entries in the sg_table are contiguous */
&gt; &gt; &gt; &gt;     if (drm_prime_get_contiguous_size(sg) &lt;
&gt; &gt;  attach-&gt;dmabuf-&gt;size) {
&gt; &gt; &gt; &gt;         DRM_ERROR(&quot;sg_table is not contiguous&quot;);
&gt; &gt; &gt; &gt;         return ERR_PTR(-EINVAL);
&gt; &gt; &gt; &gt;     }
&gt; &gt; &gt; &gt;     mtk_gem = mtk_gem_init(dev, attach-&gt;dmabuf-&gt;size);
&gt; &gt; &gt; &gt;     if (IS_ERR(mtk_gem))
&gt; &gt; &gt; &gt;         return ERR_CAST(mtk_gem);
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt; +   mtk_gem-&gt;secure = (!strncmp(attach-&gt;dmabuf-&gt;exp_name,
&gt; &gt; &gt; &gt;  &quot;restricted&quot;,
&gt; &gt; &gt; &gt; 10));
&gt; &gt; &gt; &gt;     mtk_gem-&gt;dma_addr = sg_dma_address(sg-&gt;sgl);
&gt; &gt; &gt; &gt;     mtk_gem-&gt;size = attach-&gt;dmabuf-&gt;size;
&gt; &gt; &gt; &gt;     mtk_gem-&gt;sg = sg;
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt;     return &amp;mtk_gem-&gt;base;
&gt; &gt; &gt; &gt; }
&gt; &gt; &gt;  
&gt; &gt; &gt; Complete NAK from my side to that approach. Importing of a DMA-
&gt; &gt; buf
&gt; &gt; &gt; should be independent of the exporter.
&gt; &gt; &gt; 
&gt; &gt; &gt; What you could do is to provide the secure buffer from a device
&gt; &gt; and
&gt; &gt; &gt; not a device heap.
&gt; &gt; &gt; 
&gt; &gt; 
&gt; &gt; You mean I should allocate buffer in mediate-drm driver not
&gt; &gt; userspace?
&gt;  
&gt; Well that depends. The question is if you have multiple drivers which
&gt; needs to work with this secure buffer?
&gt; 
&gt; If yes then you should have a general allocation heap for it. If no
&gt; then the buffers could as well be allocated from the driver interface
&gt; directly.
&gt; 

Yes, this buffer needs work with GPU and DRM drivers, so this general
&quot;restricted_mtk_cma&quot; will allocated in userspace, then being passed to
GPU and DRM.</pre>
    </blockquote>
    <br>
    Well do you really need a separate heap for that? In other words is
    only a certain part of the system memory capable of being encrypted?<br>
    <br>
    Or would the &quot;normal&quot; CMA heap do as well and you only need to setup
    your hardware properly for encryption?<br>
    <br>
    Additional to that in most other drivers buffer sharing and
    encryption are two separate things. In other words other drivers do
    something like this:<br>
    <br>
    1. Allocate the buffer.<br>
    2. Import the buffer using DRM_IOCTL_PRIME_FD_TO_HANDLE.<br>
    3. Set additional buffer properties, e.g. format, stride, tilling,
    if it's secure, which encryption key to use, where to map etc...<br>
    <br>
    So as far as I can see the problem you are facing is that you try to
    mangle everything into DRM_IOCTL_PRIME_FD_TO_HANDLE. Why not make
    that a separate IOCTL?<br>
    <br>
    I mean we intentionally don't provide things like format, stride,
    tilling etc.. to DRM_IOCTL_PRIME_FD_TO_HANDLE. Encryption is just
    another of those parameters.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:1ce8cea2fdb4169ce827b0bd20d472e697f23c38.camel@mediatek.com">
      <pre>

&gt; &gt; I just have modified this to userspace by the comment here:
&gt; &gt; 
&gt; &gt; 
<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/linux-mediatek/patch/20240403102701.369-3-shawn.sung@mediatek.com/#25806766">https://patchwork.kernel.org/project/linux-mediatek/patch/20240403102701.369-3-shawn.sung@mediatek.com/#25806766</a>
&gt; &gt; 
&gt; &gt; &gt; &gt; I think I have the same problem as the ECC_FLAG mention in:
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt; 
&gt; &gt; 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/">https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/</a>
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt; I think it would be better to have the user configurable
&gt; &gt; private
&gt; &gt; &gt; &gt; information in dma-buf, so all the drivers who have the same
&gt; &gt; &gt; &gt; requirement can get their private information from dma-buf
&gt; &gt;  directly
&gt; &gt; &gt; &gt; and
&gt; &gt; &gt; &gt; no need to change or add the interface.
&gt; &gt; &gt; &gt; 
&gt; &gt; &gt; &gt; What's your opinion in this point?
&gt; &gt; &gt;  
&gt; &gt; &gt; Well of hand I don't see the need for that.
&gt; &gt; &gt; 
&gt; &gt; &gt; What happens if you get a non-secure buffer imported in your
&gt; &gt; secure
&gt; &gt; &gt; device?
&gt; &gt; 
&gt; &gt; We use the same mediatek-drm driver for secure and non-secure
&gt; &gt; buffer.
&gt; &gt; If non-secure buffer imported to mediatek-drm driver, it's go to
&gt; &gt; the
&gt; &gt; normal flow with normal hardware settings.
&gt; &gt; 
&gt; &gt; We use different configurations to make hardware have different
&gt; &gt; permission to access the buffer it should access.
&gt; &gt; 
&gt; &gt; So if we can't get the information of &quot;the buffer is allocated from
&gt; &gt; restricted_mtk_cma&quot; when importing the buffer into the driver, we
&gt; &gt; won't
&gt; &gt; be able to configure the hardware correctly.
&gt;  
&gt; Why can't you get this information from userspace?

As I mentioned here: 

<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/linux-mediatek/cover/20240525232928.5524-1-jason-jh.lin@mediatek.com/#25886488">https://patchwork.kernel.org/project/linux-mediatek/cover/20240525232928.5524-1-jason-jh.lin@mediatek.com/#25886488</a>

I tried some DRM interfaces using buffer FD and arg-&gt;flag as
parameters, but it didn't work. So I ask for your help here.

But I think I should find DRM maintainer to add the secure flag to DRM
interface now.

Regards,
Jason-JH.Lin

</pre>
      <pre>************* MEDIATEK Confidentiality Notice ********************
The information contained in this e-mail message (including any 
attachments) may be confidential, proprietary, privileged, or otherwise
exempt from disclosure under applicable laws. It is intended to be 
conveyed only to the designated recipient(s). Any use, dissemination, 
distribution, printing, retaining or copying of this e-mail (including its 
attachments) by unintended recipient(s) is strictly prohibited and may 
be unlawful. If you are not an intended recipient of this e-mail, or believe 
that you have received this e-mail in error, please notify the sender 
immediately (by replying to this e-mail), delete any and all copies of 
this e-mail (including any attachments) from your system, and do not
disclose the content of this e-mail to any other person. Thank you!
</pre>
      <!--}-->
      <!--type:text-->
      <!--{--></blockquote>
    <br>
  </body>
</html>

--------------5bzmUVoyC3OXSe0CF2nITZZN--
