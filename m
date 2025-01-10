Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CC3A097AA
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 17:39:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9A410F12E;
	Fri, 10 Jan 2025 16:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ye4qTQn3";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="p43DiXCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FB410F12E
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 16:39:33 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ADHf9q023350;
 Fri, 10 Jan 2025 16:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Gfeiuly8HXk5qfOcCTpYUgCP9
 iLoY9IVZtcVtiiiLqA=; b=ye4qTQn3ymtJ/VzGHlatmQLFI9te5kMpQoY7YWgSB
 h42+Sxi70Z22AJf1dpBVGDvflRjBN7E5hvHltzGOrvuqjVoIK8ijpzlDOFoO22mk
 7/hwKDiYbQljHYzOqiId+S+izDasZnHrHfBYo8WmJHjCkFBfsnb8ElY5aFNmFbXf
 gZhmA9ItvmSobyPV1NjDVHSY9ILIfIhjhFApXfSqtZ/vAdSVkXtg29VQ5FPQ75W+
 4AdQyBH8chBcmIDVzx9eaEKjDj2jsL0CKdl6AHrOfgn3iIekqNzlYtszBlsbBLk4
 Gx7JzYdLD4cYsLjhYM3S0kAK54uba+UhSjPEJI/djCzFQ==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazlp17011030.outbound.protection.outlook.com [40.93.68.30])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 441fna1upy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jan 2025 16:39:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFe5HpelOERJqlTi6eGItpS8I9CJtSGXeExajyhI39CWvvZ380mqegXlNM7DZ0sy9F4ylCGzi4X+qWVo7R5+N7GwBjVUkI40Hpci6G8vl1/Jl3l44v3OMbpD7WoblkUQNlD3cWXDd224w60KcaM69flmUf1dOM6h4U++nNdLzHAVB+LmivBWeriIxZpF3oyDiHQ/z1IIbsHUlXB0lo5id+QeH2RxW++++b2VmbbF5xJtDtfS1goJWnXoDtkN/YkvevWO0OLbuj0BygpRLjVyY3iPxOJSeFnTGPey2JLlDt+KqGZRWMzLAjxN8fXq48pxnxi9iC+46NH1GW7yyE2/5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gfeiuly8HXk5qfOcCTpYUgCP9iLoY9IVZtcVtiiiLqA=;
 b=U/g+RC7Ql95SNPB+1mwTRWQMNw572sqe+WtbuTC0CTWpReyBFErwgxLiY4MKDspBEho7LPo6k3+0EebzeCmhu2+KACdbeibhy/Wua6QhCgnCFE2YikD9csdENtAY97mqGymcddIIaaiWyLgOKIIvFb1/oHpIQeKGaqxuHoYoHH1EHz6zMdH/rv9zOZCMs/K/UaYWbsHn2piXsLHAJSiD9ErOfMcnxHbFiU7w1GKIjK+8ipJT8RmL7bOuDSlp53PJ0J/zE6JGM6ZT/pOe4E9Es3LCuupS3vhmnG+JBKzuOjep66DWdYQApg3NS0lwhaDCPaPwea5XODj/OEYXjfYPRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gfeiuly8HXk5qfOcCTpYUgCP9iLoY9IVZtcVtiiiLqA=;
 b=p43DiXCBYYw+dyxO2J6TOf72BRWtEts+q7JQsKQ5QvOssqU6IBClYn4YQgCKN5IzUMRpRrLH5ieQiZNlXSi5Ex2ZPS45wG2Y79qezPRQu6bHzO4oETmY4n9Up6fkLRsq8gaYMVKXgFu2SyH3rbG8U1r54zNCkx3dEMX+C1vKHY4=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LOYP265MB2351.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:113::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.12; Fri, 10 Jan 2025 16:39:13 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%6]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 16:39:13 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Frank Binns <Frank.Binns@imgtec.com>
Subject: Re: [RFC 07/18] drm/imagination: Use the drm_sched_job_has_dependency
 helper
Thread-Topic: [RFC 07/18] drm/imagination: Use the
 drm_sched_job_has_dependency helper
Thread-Index: AQHbYfwj7VXTYrAAgk+pioZv7F/jjLMQOGSA
Date: Fri, 10 Jan 2025 16:39:13 +0000
Message-ID: <97165dc2-2693-4bd1-86fc-9f29913d3969@imgtec.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-8-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250108183528.41007-8-tvrtko.ursulin@igalia.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LOYP265MB2351:EE_
x-ms-office365-filtering-correlation-id: a1111d73-136e-45df-aacc-08dd31955123
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y21MemtPa1MveTdHZm4wZmNlcHRWZ0d6UFYzTW1INW5oT2M2VDRVNFZieFR5?=
 =?utf-8?B?VENObUg2ZTgxUDIwdnN4UlNGL3V4eS9hYlBobmFWVE40L1JtTkxZamIzUnF1?=
 =?utf-8?B?NkliQlJpM01hWk9uOHIreFRuZm1VOWI0K0xPNTZVbGdUa3JCQk9YZE95VnpY?=
 =?utf-8?B?bU4xalhBcWo5TC8vTjBUUTQrQU5CU1ZWVDRDY2Y1M1NCNitHRnpOaUxhdnRs?=
 =?utf-8?B?Vk9GT2JmTFp1ZVVCSDFHUmh0bTZsZ3E4bm1NaklJcldlcXhjUUh5RTlFOE50?=
 =?utf-8?B?NSs2V1V3d1lYM1NPZDVCVTNZVXJGcXFvUDNSaDVSSkZhd2p3QkxZM1dtZ1pm?=
 =?utf-8?B?LzlKcFRyM3VPbU1xVWpxVlExRE1SdHgxN2hIR1ZXRGJ2QlFrSzkrRS82NG1X?=
 =?utf-8?B?Mk4wVmswSHpzaWtPVlJaYkZMdEhHZnVIOEZsS3BLTDNGQXJPQkJpbTZ5K1Z4?=
 =?utf-8?B?NlRVME8zaklqTlNwSEl1ajFzU2hKTWgwWkF3SU53TTArTG9aNEdoWGJFeEpH?=
 =?utf-8?B?ZXViWnhvUWdpMi96MmpXb1BUSlhvSTd0T3lCS3RPSWVtOTFKcHQ2QnExelZx?=
 =?utf-8?B?bE9XVzFhS1NpdkxrT1FHTkUvMlpxUDd3dmFTMmsvcDR4REdka1JPOW0rUWxs?=
 =?utf-8?B?SW4vZWYzdTNVc2VEUUNITCtsWit2dHRzRys0T3JFdHNlUktmTDJMUWZhaW1q?=
 =?utf-8?B?aU1MSW1RY1NaMi92QjZiSzd4QngzNzArQVRIYjljOW8zb2Ewa1Y4bjhqbDFx?=
 =?utf-8?B?ZEMvTzFJak1LeHFpWnhiMndZWlpKb1RySDEwVGE0TU1kaUNvQndOekNKLzB1?=
 =?utf-8?B?T1Iwd3RXUnF6d0Fya1V0enlDYzY1MmMzbmVUVG9iazRmY3FZYS9ScmZKZ0dF?=
 =?utf-8?B?c3NweGEyaUl1akFvTTU2VXY5RFhTRm1OMnB1V0pSWUhnbXA3OFBVZGU1Z2Vo?=
 =?utf-8?B?M2U5azRIbG1vZGVYTnEyclg0S2MvNFpIQm44WUQxRDhKNnJleE5aT2hNK3I4?=
 =?utf-8?B?akhXK2JGZXBTSUFybFdFOXRudVZZbjRwVERNUlNSTWRqdCthaWQvRXpMT202?=
 =?utf-8?B?MU9qeHFxaFJJZ1plUVF4czV0bFBGZktEZ3BIMHhRbDRSSGxyTEEzd2pxSVBI?=
 =?utf-8?B?aXJrUFM5dzlXQkZlRmNNSkNKdVZaSS9ldmN3UFBseDZFeGlxR1p6cC93UzFz?=
 =?utf-8?B?MkVHK0lWMjNqdWlBYTNlcWVqcUNBWjhXaGhsdkpSYXZldzZGM0VLQlpsVzND?=
 =?utf-8?B?ZHhQWWtaNUpsVjRqUDN2d2tiWmZrQlZhZFl3YnFJWm5sRExFSTZUdUQ3YU11?=
 =?utf-8?B?eUxkRXdYRVUzL3hBNmNZZ1NVakR6V2JDOTUwLzdIVHFXQWlTRlFmbkdVZGdZ?=
 =?utf-8?B?TjJQeVFXWkxzb2p4L1UxcU5nNFBLWWhZNk4yK1ZJRGlJbmxXOVpMbVBXS0p5?=
 =?utf-8?B?NWdKaFFHYWxVUW9WKzB4WHZhY0QvWlZTcHl6VzIycTBVYXlySWtzWHoxOTQv?=
 =?utf-8?B?VXVhTEtOSFlkOVhDVUQraVREZmNQU1dMN0diL0ZKNlVnMUFkRC9WaExLOHJa?=
 =?utf-8?B?SlhSZWNReHlLK3F6VE1YOTJ0Mm5PSmlQVm5nRkZseERGeGdQbXF1RnVYMWVG?=
 =?utf-8?B?SEJnR2FOWVgweUhhTTVqb2dVbmRsaTY1OFdnYzdKb29xNk1GSkJ2T1RvSGVL?=
 =?utf-8?B?NjZka0hlRUNGa1RuOU1HU251VmpwblM3WXlnRkhDb3BieTFoTDAzL1QzQjRG?=
 =?utf-8?B?M3RQZjZuSEFDWUpWbXBPNW9XUFJHckZpMmVtVWRrYTNqUnZBYVZ0Wk9YVDlR?=
 =?utf-8?B?VVF5STNGTGI4ODRXQ1NVNTVHdmxYV2xaVFlFTU5teDFZc2lac0RJV01IdkRq?=
 =?utf-8?B?TEpMZGNMZDk3TDdlczRhdXdOQ09WWUFZRVViOGcwb0hTc2tBRlVIMlpNaFFZ?=
 =?utf-8?Q?D9EkLvwFxNdDn+o4D5MzuiCYzeru0e3b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3hhc1hwYXEwekQ4Wm5yMlFrdlhBM1FtdWx4MGpUUmNwRkdwQzB0Mm1tR1pG?=
 =?utf-8?B?ZWVCVVhMb0tTV2xNVXAzd0NtMVBLbktWSytnVUh6TERiR0hMR2pxSFFuYUtU?=
 =?utf-8?B?eER5ZDdyWGc3T0gyUVA3RE5lQkJNenVjbWVWbWY1azRaZitHaXMyNzRrS3pC?=
 =?utf-8?B?NjNHS29iUGtWVjZlK25zYWxLNExVUVZNejdObmVqTkpWRlowR2ZWSUNaMDB0?=
 =?utf-8?B?MEsxc0NJclgvaG1ZM2tLcWJSeUpHSjB2dDZkUXdMcDRKSFNEbUxKMUJiMk5j?=
 =?utf-8?B?SjdTdUlwcmR5c1FiamNRWHRwamM3QmpuMkVEaCtYNWhRWUNpUndWdVpMQjI4?=
 =?utf-8?B?YkZWZXZRa0twNjZIcXBQMExBc0xhS1AyOHFBSlkvcEVVTitxQ1N6Ti9JNjRD?=
 =?utf-8?B?aUVLRVpEQTEzNjVEd0hnY0NqM3V1QVdKTHJnVE9oM1h5MGF6N0hycHBJV21v?=
 =?utf-8?B?ZitTemdxR09KVmI5UkUzLzBuamR6UFN6RktyYk1kTVdZU3hmSVhONDlxRlJU?=
 =?utf-8?B?Y0pzcE80d2k2L2lsWHBtYVViOHJ0aUhZWlRVQndBSWhqVHBiNC9nUWZBemt5?=
 =?utf-8?B?RVVJbUMrQmY5NGFWSlFWWHdLcjhxdVh3aE56Vkw2eVlxTUhkcWR1UUtJK3g1?=
 =?utf-8?B?bEVMNVd0eXhJSWl1TE1DN0JwN2R6c1ZDazdpRTBZVkVUTjlvOG9vcTdTZDg1?=
 =?utf-8?B?dk1ZeWJ2d2xPMlk1TEtnYmxpaE8xa1FZQmk3QWdESlZ3d0ZNZWhSaElUTkRx?=
 =?utf-8?B?VHVJdmxVOVM2Vzg0UzJvSDYzVzVRRkN0RVZ6dzN0cWRKY2xHU0lvaFJGN3da?=
 =?utf-8?B?WHJ2YWVYUmZ5cWxHU2IwWjJ5TzhVL0F5VFBDZE91VG1zWFc4aEFiTkJrRXJK?=
 =?utf-8?B?WU4xbitkV3Joa09CZ0QyWmRWUC9MSm5kR21WU25neU5PZ3Jmc2JyaWR4UVMw?=
 =?utf-8?B?Q1oyMm5OY0xQSTBKci9ibE9sRFFPRU9EaXVpdnNveW9LOEh3MEM2akNYY3NO?=
 =?utf-8?B?ZDc0MWdweWdsenFwRFRQalo4WFNGMm1TNmNiajVLdy93c29hMzhBalRCM3No?=
 =?utf-8?B?cFlyemtOS3lQZTVtWUZjeE1sRUhST2pidVBvZGU1RGJiVlZheVExWnZXS05a?=
 =?utf-8?B?MlBTMlRaWUo1V0hoQXBEaWdyU2VFdnlreStIMmVWS2pKVjVyR0w4d0l5OUow?=
 =?utf-8?B?WDRPQWtSVXhqVkI3VnMyK2c4YUdiMmdhSVAyTStORytvU3QzTUFYZDV0Mk1I?=
 =?utf-8?B?b0RNYUFVTm1DRFVCVHRZTnorS1QwWnZsNWZZV0F2bGo0Z0VjR0R1RWdDeGV5?=
 =?utf-8?B?bnVjU25RQkR1ZmtzOFREYWh2QVhWN3RBNjBUNlJNbmEwWCtZbE16Z1d5cGdl?=
 =?utf-8?B?UFNhcHdKVThMRkl5ZlNOTDU3MVE4T0RtdzVpQWZ1R3FDNWZBSXE2ejBpTTV4?=
 =?utf-8?B?aXVCbkMwNllSZE9iQVBhb3ZHR25oV2I2aFI0MGxwYU1NeXNHWHhXVUFLSWpn?=
 =?utf-8?B?TkNkZEZvNnNuT2xISzJwMmpjNHd6Z0plaDlWR2NjZW5pdG0rNTM5cFZkSVBs?=
 =?utf-8?B?RXRpOXFRNXphMGJGZEpqMmhESjl6QjZBUTdZeHN2eXRvTmRJY1NidFFtUmIy?=
 =?utf-8?B?ZmVlKzM3TDUxMkVLQ2lWWG84aGdPdUZwdW95WktkTkRCYjRya2UzMU0wMTB1?=
 =?utf-8?B?NHo4SEMyaDN4UCtLVitub0p4Vkp5VEJ1U0pBcTZBUEd6TWdzb0FmemZsY2dX?=
 =?utf-8?B?azE4c3dVbHVqbzFrdUFYdUZEZUl5S1o4aUpTc2FTVzY1MS9oaTRCMGFOMStQ?=
 =?utf-8?B?b05kS2NrOGYwUTYwMjcxQjVVQkpRWXg3SjZ1b0dPYnNLWUE4SjVrdlRHdFNh?=
 =?utf-8?B?eVFad0RYakFUVTBsbFNtNVFWd2ZyRUpMQ25yQ0krdW1wMFpXSDYwU2E3cjIv?=
 =?utf-8?B?UTBEcmxGTng0MmFTZHhvdFcrZ3AwQjJKd1dlOWNEc2dvS3V6empRYlZkSWty?=
 =?utf-8?B?Q1lZWmthL0NIbUk1OXlFWHZDMXpPc2EwdStweFIyWHdyK09jY0xleHo1K0ZP?=
 =?utf-8?B?MVEvSHQwaDVzSms2RUcyY2h0YWEwR243Tjl6MndycW9SSGVJTSs1VE43UWpx?=
 =?utf-8?B?UGwrRVUxUWg0Q2U3N3BZUngwWVcvU1ZUenNJRjFTZm45azBqOUF5dFdsS1Jm?=
 =?utf-8?B?ZUE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yTBKUXTbiN9XM9XPaP1x4IxQ"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a1111d73-136e-45df-aacc-08dd31955123
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 16:39:13.7077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCyD7hgpM9e3jrYF4aXTEt6DIT4DwDdjIfZbvYykoLoWQlM6dVHLL4B72g1BFfypQ2vcovyiQ9KGONJ41qfehQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2351
X-Proofpoint-GUID: BOapF8-s20XhQ3gmxtVPqUJYTsqr0kCc
X-Proofpoint-ORIG-GUID: BOapF8-s20XhQ3gmxtVPqUJYTsqr0kCc
X-Authority-Analysis: v=2.4 cv=QIKSRhLL c=1 sm=1 tr=0 ts=67814d34 cx=c_pps
 a=h72tj/vcfevIRsfYUpnJeg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=V2sgnzSHAAAA:8 a=zd2uoN0lAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8
 a=r_1tXGB3AAAA:8 a=jume-SYDoq--y6Ac0JoA:9 a=QEXdDO2ut3YA:10
 a=9SSyAona7CNYGsK4dk0A:9 a=FfaGCDsud1wA:10 a=Z31ocT7rh6aUJxSkT1EX:22
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

--------------yTBKUXTbiN9XM9XPaP1x4IxQ
Content-Type: multipart/mixed; boundary="------------b2klTTYuira0oeHfUE999hJ9";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Frank Binns <frank.binns@imgtec.com>
Message-ID: <97165dc2-2693-4bd1-86fc-9f29913d3969@imgtec.com>
Subject: Re: [RFC 07/18] drm/imagination: Use the drm_sched_job_has_dependency
 helper
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-8-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250108183528.41007-8-tvrtko.ursulin@igalia.com>

--------------b2klTTYuira0oeHfUE999hJ9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 08/01/2025 18:35, Tvrtko Ursulin wrote:
> Instead of manually peeking into the DRM scheduler implementation detai=
ls
> lets use the previously added helper.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

--=20
Matt Coster
E: matt.coster@imgtec.com

> ---
>  drivers/gpu/drm/imagination/pvr_job.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/im=
agination/pvr_job.c
> index 618503a212a7..1cdb3cfd058d 100644
> --- a/drivers/gpu/drm/imagination/pvr_job.c
> +++ b/drivers/gpu/drm/imagination/pvr_job.c
> @@ -597,8 +597,6 @@ update_job_resvs_for_each(struct pvr_job_data *job_=
data, u32 job_count)
>  static bool can_combine_jobs(struct pvr_job *a, struct pvr_job *b)
>  {
>  	struct pvr_job *geom_job =3D a, *frag_job =3D b;
> -	struct dma_fence *fence;
> -	unsigned long index;
> =20
>  	/* Geometry and fragment jobs can be combined if they are queued to t=
he
>  	 * same context and targeting the same HWRT.
> @@ -609,13 +607,9 @@ static bool can_combine_jobs(struct pvr_job *a, st=
ruct pvr_job *b)
>  	    a->hwrt !=3D b->hwrt)
>  		return false;
> =20
> -	xa_for_each(&frag_job->base.dependencies, index, fence) {
> -		/* We combine when we see an explicit geom -> frag dep. */
> -		if (&geom_job->base.s_fence->scheduled =3D=3D fence)
> -			return true;
> -	}
> -
> -	return false;
> +	/* We combine when we see an explicit geom -> frag dep. */
> +	return drm_sched_job_has_dependency(&frag_job->base,
> +					    &geom_job->base.s_fence->scheduled);
>  }
> =20
>  static struct dma_fence *


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------b2klTTYuira0oeHfUE999hJ9--

--------------yTBKUXTbiN9XM9XPaP1x4IxQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ4FNMQUDAAAAAAAKCRB5vBnz2d5qsBRp
AP9jdJ/ljRGKP/7Jz6qlH+2eGZ9dI9+b6dti42N10IskcAEAmDqTSQOSCkuCA2c3zrudLUBW9ssL
YLU65TRJ2K530QY=
=kyOc
-----END PGP SIGNATURE-----

--------------yTBKUXTbiN9XM9XPaP1x4IxQ--
