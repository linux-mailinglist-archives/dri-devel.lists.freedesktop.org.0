Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4178A23FF6
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 16:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD7210E375;
	Fri, 31 Jan 2025 15:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="XHL+yCy1";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="rAhoNDjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E04810E375
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 15:59:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VF5862028286;
 Fri, 31 Jan 2025 15:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=SVZDo1DKTcymmHWqBuAx2s6hN
 38P/G+E9qvJbbfiXv4=; b=XHL+yCy162FKoid2UI30foTYeNzbaY5yc4FR2CDOF
 UDMHpodLJAMN0Es1ZgfkvwbnsQ+vK1GZvUHN2a1YxlZtSfc9UXru2nj3OXxvWa/1
 aXzDgz9btX/rDIU9iL2i5MB/IZu+tlEVjT8yggmZXBHjEJQ2lUIwFjCdeXbqfb3c
 r4mrS4LQ+82MR3ciOM60SxV+AmJ/Q14BVNHywBs1pQUzhOQlNV3ANt303PQAHusg
 mjUBcAFpK7G4OFzqV1Ud2PB/3HRn5rjYHFqhFjzXmMSOwd8B+D6MTCBvNaT5ZeBD
 szB4+UDpda+ngdlMCJxR5dEatdqwlekeYYtE7BYPGpRhQ==
Received: from lo0p265cu003.outbound.protection.outlook.com
 (mail-uksouthazlp17012052.outbound.protection.outlook.com [40.93.67.52])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 44ep3c3034-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jan 2025 15:39:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nA32naIZU7vAqS3Fh2XI2NeO/yz67RkvP16iBglsRxHIjrSlqtAx0RQU/p1EeLgW+f61XTpTOwtJWmExSge9WVzfiQFVKeUY6WPQ1e4ubVvD4WsAJSNUnyzLuB0zFF4EOKHUmwozQP6Iuzaq9CosEjfzKi/Rk0orTfJTlWEJaRDuLtoBmHljuUbwk1zK1izo73xWc2II6yCHZa4QmLKh8e7L38jeBn5r5PAbmY3Jr6rcIX9gnBsl8WcHm56gMtBQWSP5P/k1EgvaLykj/4tjCLa9ugII+ABUHRw+YLb471ND7WgCtpPrFHkS+a/dWIijwxlZClXoDmVWUOuF6CXmZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVZDo1DKTcymmHWqBuAx2s6hN38P/G+E9qvJbbfiXv4=;
 b=QrpCy+AK67TMGUgzMfbpuKItG0W2nfLp8xjbeRMM3/P44Qb4KoJSZLf2kUGYyZTeFukzmJcICNz6Wv42Kt2HvXIDDdvOCGvexFCfCpdTcswaubT5smTSH8dQnsINIahh4o4KKwM2mUXNlfh1K0/V63Jv1PYC5kjiNzuQ0IzuV+UaDR4wEs9RVuLcDjAva6tzT7PLNiXe+ZQAsPIaAEtbvRl/YhHhim0Um8QbSFo7oX9N0A2beeHoISfYp2GuGxv4JzWUMeMiGAQG9qo/uilxVhpDS+NVzcZeDrc+BjKMVjvIdBIjG/cdAjUL+Ln+O4yLfjPUimmh+D8TfVcfaUhNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVZDo1DKTcymmHWqBuAx2s6hN38P/G+E9qvJbbfiXv4=;
 b=rAhoNDjNXQ3SrFgyDGJ0yRR8WmFxbCX/H+5WueuoYZGUI6J8hh17uKzcHta5uHaSe5PnhghznAsty+dMtX3u6sM/iDfVWJ7nN36+kmjNQgywpCupaJr89ElUcCV8yLredJuv7u3BFP7au3FaKQy+4WW8yfp9JH4cNw94C2uxyeY=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO0P265MB5503.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:287::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.20; Fri, 31 Jan 2025 15:39:45 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:39:45 +0000
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
Subject: Re: [PATCH v4 13/18] drm/imagination: Add support for IMG BXM-4-64 GPU
Thread-Topic: [PATCH v4 13/18] drm/imagination: Add support for IMG BXM-4-64
 GPU
Thread-Index: AQHbc/Za6SpVrhE35EmN8n3AM+E5cQ==
Date: Fri, 31 Jan 2025 15:39:45 +0000
Message-ID: <8c2f767b-1ace-4c1c-a310-907b53409271@imgtec.com>
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194842eucas1p2aa8df6d985786c17432feca390861918@eucas1p2.samsung.com>
 <20250128194816.2185326-14-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-14-m.wilczynski@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO0P265MB5503:EE_
x-ms-office365-filtering-correlation-id: 7bef6255-2c0b-42f9-032e-08dd420d7d11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?TmxWbXNUS0U3bk1pWXV2eWhTZVdDUzE1TVRGVFVvbnh2RnhzNXNaWGFpM0s3?=
 =?utf-8?B?RmtZMi9GVzNBbm9pZ2cxTjVtWHBJR1luQTloS0FuV2pqazl4MVFiSGVXd0ht?=
 =?utf-8?B?VFp3eXRKUzduUzNTR3JJMEsyVlE3Yk9qZE1DUWZlSXVjTDNVM3NINWQ3U3dL?=
 =?utf-8?B?MGNrWWlib3J2NEg0T1FSOTFocENhT2xZSkE0Z2JjN2UxRUtPNmcyeGtKYnIx?=
 =?utf-8?B?VmlVMkppZDdVK2NuQXFUU1Z0Sk9NaTVSQXhSWFVpZ2pPSS93eTd2bURQR2Zy?=
 =?utf-8?B?NUl5SmZLei9ubEViNjIxaEJWOTJ0WktVYlYzK2paeWFHODhpdFAyYXFQQUdj?=
 =?utf-8?B?UTNVQVI4RXVURkFobm5KdDU1RXY1YlpRR0wyaVU5aGFYKzJhOGxLdWNLUmRo?=
 =?utf-8?B?cm1xVXVqaUttdkovaDJsZFlydHI0aWRrSVdvR3R4dXF2WGtWU3ZxMDFTdDRm?=
 =?utf-8?B?Uk5mYVI5dm1WVmhObTlZNFV3V1BnS05xN01XRmV2bWVxTysyV25VQkJXQXlR?=
 =?utf-8?B?cUdOc2d1VDFDS0pzTEpaUDcrckJRWFFjUUNUcFBFcHVnaDF4TGlIYVFMc0pz?=
 =?utf-8?B?VisrNnZEZC9kZjhINW1HVTNkQTlUOVNZdmh6REVKd3Z5YldrSFphSmh2bkVV?=
 =?utf-8?B?L0g4RUNYcTBXMXZSaDFJZmFIMkdUaHJNcVIwZVBaZDZWbmE4QjV0NDMrbkI3?=
 =?utf-8?B?dGNGWDNHWHBnUTBHTGFUUXFaYWxyd2xqSlZXQU9VcEFZU0VGYlJTSGxFZGR5?=
 =?utf-8?B?R0RrVEZ5a1F4RlVqSUkraDNxeE80cDJjTEEyUHhDcEFHOCtHZmhmMkFENDFi?=
 =?utf-8?B?dzd5ZDRYalB2S0tyMWJPcjh4NE1uNFE3ZjZqVlk2QmZTcCtHV01ySzdMVzVo?=
 =?utf-8?B?K1NIUWIxRlFMWmUvcUExUmZsaElWVURDSGVzNXBqMUYyWDlPd1hEOFBmbG5U?=
 =?utf-8?B?RWFoNUFFcFJZWTJxdnVmMjRZYnRLL0tlYmZsSHJBK0lHVS9NREwxUkFvd1dU?=
 =?utf-8?B?K1RTN0JYcjZFUzgyTDhnZ09HeTRHZ3VYT0NVU2RheVl3bDNyTGZ0cG9vQWFT?=
 =?utf-8?B?R01aMDJnVUU5amVlSzBmVTdYb1pVTkdqQTFVa05OS3JYUlRtWUpPRzJJYUlz?=
 =?utf-8?B?MUl5Q3hDeGU3SGtFRkNsTGx3OUZEWnV6Vk1TTGtibi9XL2JDQzhsenZvSllD?=
 =?utf-8?B?QU9jcU1hMVdNWTdVSmRsaFN0WFBjU053MnhUWGJ6NElQek9obzRTK2VLRGhj?=
 =?utf-8?B?NzlqajhvR041UTNWN1EzdVhBczlxK0ZTT0Z4cnpoQ1lodWVrRTRkbWZmMG1T?=
 =?utf-8?B?MkZNcStqeHdndjJnQ25LV3lpd2htTjFzVzlwRnM5QUZVVGpRRGdYbHZWa1ZJ?=
 =?utf-8?B?aWtXUlBZT0Rkd2MvcWRNUUlHMVNBaGoySE9qVEY1bW9DSFc3d2xjbEhXQmZ0?=
 =?utf-8?B?U09rQXFHNWJRTWF4anhpdnZacFF5U1dDV1pmUUx0UmhGWGdqUEJaRVk4cHkw?=
 =?utf-8?B?WnVWbXJJQ2UvY0xhajZRdGhaMktQMjMxTVgrTzFaODZZRWd1bTJhM0RyRjhI?=
 =?utf-8?B?dkZqOEcyTDdINTRNazV3TXgyZ3Z4a3ZFc0ZCZzJvaDFHckl2T3pOQWdUSi90?=
 =?utf-8?B?eElLSjhKUUdPU3VTSDJ2YW9ac0cvdlJnMWNVS0M5U1phV0xKR3ZoRFlsZS9i?=
 =?utf-8?B?N0FmeU9idXB6MTErek42VlVBTUxxUFZ4MkViNW10dzZVaU13Kysya0x2UDd1?=
 =?utf-8?B?U09tYUg4dWlRWkNjQ0ZUbmUzQ0xVRHdaN3lrT1pVT0JVaWZkYnVBNFNlNHR6?=
 =?utf-8?B?Z2RPSjAzTFcrZlIzVklVT1VSK0pnU256SmJwQ0NONHZsanhaMU9FWFk0R1gz?=
 =?utf-8?B?MWEzZCt1YkZ3OHVxUGJVS210V0tHMGJyZzN6Q1U0Z1BBaVV2N0M1R0ZGWWti?=
 =?utf-8?B?STBlZUhiaGVia0ptNzBaYWNKWUNWU3lBK0hSbE5iK0UyS1VTRzJseSsvUndL?=
 =?utf-8?B?Yk02ZmdPa09RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ui9XQ2RsU1E5NHNxaGZxZGFQRmNOc01tdzU0SUFYUktiNDhtSEZxKy9rbGVx?=
 =?utf-8?B?SGpRVlpHV2xpb0IyaEFYWjFGdlRrTFFSekxYQWg5ODN2ekZqdndmeVpVL3lC?=
 =?utf-8?B?bHpSNXE2SnRZa3FzRFpaNmFXejBDMXNmZmQ5VFdib0dmalFFUnFTY0l3NmN3?=
 =?utf-8?B?WXA4STk2SnB6WFY1QnFkNkVKcU5tN1d1WWc2RTVPV1ZmdTVPZmlFUUZuTVBz?=
 =?utf-8?B?VThjMGpsNXVBM2FMdE9kblRTYUtNbTNSVmFKcjdvaW9Yb0xDY1NQVjdCVVVk?=
 =?utf-8?B?QTJqWEdPM25ZRS94Mi9XOEJ3VXRkN011eGZDQjZISVZrcHNFb3czUzRyandz?=
 =?utf-8?B?TjBhaFc0M0xGc2Q4alRuVk8zS3pxakxuMUpUclJINFRjK1BGNzlsVHlWMVZF?=
 =?utf-8?B?Y000LzNWaVJDRUtPcmRGVFozUzcvQ1RBUU5weUhRYWlwYWVEM0FkMGV4ZlJW?=
 =?utf-8?B?eWkxajVpSTJ6SVZaZjQzVTdUL3oxQ01MWG0rYTdvU000VWdrcDBtL0NQSHZW?=
 =?utf-8?B?Vy8rZElKYm1Mcm80RU8yaitBUTRGcjhua2VubGExUDhaZDRYWFNmZ1hZaE1R?=
 =?utf-8?B?bmNmK1V0Y3ZMb2x1TkRIY1VvcDRWYWRnRjZKcDNMSHdLRStWMWU1NGdobi94?=
 =?utf-8?B?MFk0bnhVUWhmS2kxR0tsdkVvVDRwNnVZbmFwOXhYWUdES3Y0OE5GQzRMSSsv?=
 =?utf-8?B?Q29wU2FvUmhvbWYzQ3dxR1llVU14ekIyWTIwZkJlaVBhL0FERUszeUhVMXd2?=
 =?utf-8?B?ZzlMSTAxcGcvNVRSZ1FEakE4dU1nMEJRN1pFTkdiWURHTGdadFFWU2x4c3Vl?=
 =?utf-8?B?anFFSnNEQWF4WlVWbnhjalpWSDFtWDFvb0NJeWxmMkpVOGZQTXFZMmZBN29p?=
 =?utf-8?B?dU1RQStIb2xuU2pGQTc4YnR4ck02aWtqZks4cERLZ1lOSnVwRFBsVGt0L2l2?=
 =?utf-8?B?Y2NzOGEyNXdNYytWWFRRTkhVdVNjSTNydk9xVGVRdVUxWFRYOVhjNnNYWlBE?=
 =?utf-8?B?elNQbjROZTQzRk56TUVYbHVVZTJ5dUt0UndheXAyYWRNK2hjVFdYbmZNRUdP?=
 =?utf-8?B?WVRMVjBvNll0TW10ejNBa3M2VktMamdGVCtvUHBYdUlTR1doOG8zSkowMDhF?=
 =?utf-8?B?WW1JRzA5UjJKZUtoWjRIOVByS3hxeE9ybEhQaEIxOENRY3pzYTc0SkVZbldH?=
 =?utf-8?B?NnB2RHN5aStUZExSNUMyUGk5VFlrVVJ4NEdCNm41ZDdHU0M5NTJIVFcrM2Nt?=
 =?utf-8?B?NWtaTXNIRlRFbnZZQldRYWl2Wkk5d1diLzVwTy8xUUxTOHVZT09KOHUxUFJw?=
 =?utf-8?B?RkNYaTl3eTVWcU9CTi8yTnNNcy9iN3R5K2l3WHlKODFDT2NaWDJyYnR6Wmc4?=
 =?utf-8?B?UTc5NTBaTUtXVDRWQ2o4NExlL3A5QlZ0blRtZUUwNlA1SnM1SHBQelo1bEdh?=
 =?utf-8?B?M1JQcFBKTjhKVHprWU9LRWg5UUczM3FEb1NBNUJzc3d6dDdOUkdtNVZ3ZVd3?=
 =?utf-8?B?cmViRHlhV1hZd3FrdnBzN28xVzZCd3dIcWt1UkFXWUFiY2lvNDFDaitUeEhh?=
 =?utf-8?B?eVZoQm8wdGxzNW01M2ZqeCs4MENibWZlRzNWbExaQVBMVUVhR0NlVXR2eFN1?=
 =?utf-8?B?cExFOE4zTnVYTFh6aURlaHpMTzBwcmFSUXg1Ri9kemhUOWZTc09SVFdhY3FQ?=
 =?utf-8?B?ZkNtNG1lY3ZjUmJLd2prMjJmK0Ivby9IcGlGVFdJZlpFUHN1VDVmdUdhQklY?=
 =?utf-8?B?czI2K3ZGZ0FUV0xKMVIvb1AwaW5vR1lVdHhrOWNwbXNXQUJLQ0NZS21NTVZZ?=
 =?utf-8?B?eXNybExwYVJQTG1lWnJkTTJBWUN4S3BiblFFN2ZrSytNVDVpZXRPSEF0Ykl6?=
 =?utf-8?B?R3dtYW1UQ3luWUtXTmM2SUR2Q2Z6cHpyT29BRmc0L21DZ3ZkNi84djduZGoz?=
 =?utf-8?B?c3JFZ1NWM3NhVzJKYnN5YXcrb1djSGFYRFpjb3U2R09aLzZaTEZyUlhSRGtN?=
 =?utf-8?B?VGNaRjJOanB1NytRd0xUcDY0enkyQXBxVkxnUW4vQzEwWnhaaDM4dUhQZUZG?=
 =?utf-8?B?TTQ4U2VrNlZwVFptZVZmcDJHZnVYV0ZGaGtlKzhrMUM0ZWM4bE13N1VaaHFI?=
 =?utf-8?B?d0lRUVF1U2VYbFl3OXBGSHlqbDJhanNLOWluWWNPZ1NwQXEzc0M0cHFaWHJy?=
 =?utf-8?B?aWc9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AeVQLB4HgzNs8JDfszC6Pd04"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bef6255-2c0b-42f9-032e-08dd420d7d11
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 15:39:45.6342 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v+KBBYeix/GqUiQcdtaGnj6OstYs451x+//h5x7S2EykiAoraftkFITmOdXPFuE+h6o4kA1iyk2hdAS0R6/fYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5503
X-Proofpoint-GUID: 6FmhLMGt79PNOckfSl1-oUXT2xhUL7a5
X-Authority-Analysis: v=2.4 cv=PoBpbxM3 c=1 sm=1 tr=0 ts=679ceec4 cx=c_pps
 a=+8G7KV7MoNjfk4g9SO/OOg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=hD80L64hAAAA:8 a=r_1tXGB3AAAA:8 a=nz9g_glSy445XqJfhIwA:9 a=QEXdDO2ut3YA:10
 a=MmKou3CmSXE5IVNvgKYA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 6FmhLMGt79PNOckfSl1-oUXT2xhUL7a5
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

--------------AeVQLB4HgzNs8JDfszC6Pd04
Content-Type: multipart/mixed; boundary="------------fnzo5igGtw4qmKlUlHXitYA0";
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
Message-ID: <8c2f767b-1ace-4c1c-a310-907b53409271@imgtec.com>
Subject: Re: [PATCH v4 13/18] drm/imagination: Add support for IMG BXM-4-64
 GPU
References: <20250128194816.2185326-1-m.wilczynski@samsung.com>
 <CGME20250128194842eucas1p2aa8df6d985786c17432feca390861918@eucas1p2.samsung.com>
 <20250128194816.2185326-14-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-14-m.wilczynski@samsung.com>

--------------fnzo5igGtw4qmKlUlHXitYA0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28/01/2025 19:48, Michal Wilczynski wrote:
> The IMG BXM-4-64 GPU is integrated into the T-Head TH1520 SoC. This
> commit adds the compatible string "img,img-bxm" to the device tree matc=
h
> table in the drm/imagination driver, enabling support for this GPU.
>=20
> By including this GPU in the compatible devices list, the driver can
> initialize and manage the BXM-4-64 GPU on the TH1520 SoC, providing
> graphics acceleration capabilities upstream.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/gpu/drm/imagination/pvr_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/im=
agination/pvr_drv.c
> index 0639502137b4..cbd7f5d37cc4 100644
> --- a/drivers/gpu/drm/imagination/pvr_drv.c
> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
> @@ -1474,6 +1474,7 @@ static void pvr_remove(struct platform_device *pl=
at_dev)
> =20
>  static const struct of_device_id dt_match[] =3D {
>  	{ .compatible =3D "img,img-axe", .data =3D NULL },
> +	{ .compatible =3D "img,img-bxm", .data =3D NULL },

This is a more minor conflict with the other B-Series series mentioned
on the cover letter; we'd like to switch to matching against the more
generic "img,img-rogue" so this would be unnecessary.

However, you do need to add a MODULE_FIRMWARE() tag at the bottom of
this file either way.

Cheers,
Matt

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, dt_match);

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------fnzo5igGtw4qmKlUlHXitYA0--

--------------AeVQLB4HgzNs8JDfszC6Pd04
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ5zuwQUDAAAAAAAKCRB5vBnz2d5qsG1U
AP0WSIIrak2A+yQDFYJ8CfSmVwN8zW7yFq0b3xS0NRjY6QD/V5H+FOxQHaogulcfU+fBWo2q6n8F
n5RCbULVhDyIdws=
=abxG
-----END PGP SIGNATURE-----

--------------AeVQLB4HgzNs8JDfszC6Pd04--
