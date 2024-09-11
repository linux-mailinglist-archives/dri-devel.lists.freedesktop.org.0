Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8A1975766
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 17:43:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FCC10E1A8;
	Wed, 11 Sep 2024 15:43:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="cksUcuux";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="Mh9w2275";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9599910E1A8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 15:43:29 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B5vdIB026099;
 Wed, 11 Sep 2024 16:43:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=Fof4O4ujJ9SP6Bf+NZe0VyWf6
 plDVydYFKJvJWcnXpY=; b=cksUcuux7hKiWQz1/omShjpe1gvQOwR0fO1PKyzKl
 fn0OuCVdZBNLAx0ndF5lHpKAhAkJ0bRSl3u3qcNtvTIt1gL2cnSFf9RWQortAEF+
 Ea9tNRR05V3deK/9zORZodah++p4QjrSHNgAml2KIvgeDjMKfb3XDX7bVgnWHMin
 KDKYQ7bnGoxy+NvH1syJfCywWgMWduOOXkhmXeKJVbuhZGIUAsTxZZAGYlVIkIU3
 zvt58O9vNP51JXyiU3RNL1Q33euwiTF7SNkMigmLyAM80vGmC9SPVRsBdnr2h2il
 jF67V5oO2jKIt5n2zkg3nLP5K5dHvkTzzMFNcgarRT6+g==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 41gewwbcbt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Sep 2024 16:43:19 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 11 Sep 2024 16:43:18 +0100
Received: from CWXP265CU008.outbound.protection.outlook.com (40.93.68.7) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37 via Frontend
 Transport; Wed, 11 Sep 2024 16:43:18 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUX5MVQE8Rx6SQG3TgPABFitJc5hvtADv/6ox5nBdomu9KoSTZmDYN6EfpMMwpz+BKr5ZnB6sg8Cldi/DL1l72yZ6MyGdDpOnoDg7su6CXHHhYjHMGp/EmjxhhBCeRLV0gfPngE2sewH3rSc2N3fPfNXLoc5VLAjBVwWn8xwvVwh1Ql53vQdGXi24z+Vkw7MHYvaM1EQQz27HEv/DQ/vUxduG79EVZAU59ltpGqRLI0P+bWG60ALuurwHGRzsfV3Neqnza9iKlFugZo0h68/9NzTycFxECVkjJyb77NJIOpl88sZ15tXAwGD0bnXB5s43PFb9Fy3PpBb0qHrLXR2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fof4O4ujJ9SP6Bf+NZe0VyWf6plDVydYFKJvJWcnXpY=;
 b=cmEUUXrQo1gwfP/Ibfhfni/b63dpEf5tz4/kXb6JvRXEpu9TMdgB/o60cC8n3FgrVwYrqME4amHeGS3PsYb+PIYD/j9BbozwGa1OMRzv5WqzfK+knXzEtCUV/w0vzsfxbzdJP7L3FeQ9HzxjH7mtn5IYSD4ys1UHVNsJClheuo3A9hcoMwcDybEsbm+zjeH6M10VK6hrnSVEngI79qFnkU+ugyx1baSYsiFB5/nrcQA3ErAMEnTyXHvCu7jH5Yoj8SC+FUaQfjQqERj3uu9xltBy8s89YavpNt/Ype2I1AYpGM3rttBYpuQnkRsuOeVsgkzBi+p3kut/fP/+cXuCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fof4O4ujJ9SP6Bf+NZe0VyWf6plDVydYFKJvJWcnXpY=;
 b=Mh9w2275SBDIMbdPYy7/4xzdK4ONRXwwwQoJDzninT2dsttW+AxBR4yw2G4B1+Vbh/TvdM9G8B1ctuLjUiKY6wRiRTcjxd2QVDKjFloV4aGpdRYCv6BH+ChKzd091cnVzjX9jTvvhH6YxIXmrQFagvuNWziQNDFJYZlazYZEqGo=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB6740.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1ee::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.17; Wed, 11 Sep 2024 15:43:16 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%3]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 15:43:15 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Brendan King <Brendan.King@imgtec.com>, Frank Binns
 <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] drm/imagination: Break an object reference loop
Thread-Topic: [PATCH 2/2] drm/imagination: Break an object reference loop
Thread-Index: AQHbBGFRZTaZEBXqvEqglnFzLz8enQ==
Date: Wed, 11 Sep 2024 15:43:15 +0000
Message-ID: <6c283532-e39f-4bb0-b0a1-d654632478a0@imgtec.com>
References: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>
In-Reply-To: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB6740:EE_
x-ms-office365-filtering-correlation-id: c50d992f-e5c9-4087-d0a3-08dcd27873bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WHBQQjVpUHAzc0ZJelJtS3QxdGJNdmh3VW1SSTBGQmlsUWFhWnlDWjdKMDRJ?=
 =?utf-8?B?a2FnRXNWbUhoY0dyVW5RaUd4Ym5CWjVEbGt4TTdGNk9reStubzFGN0QrMTJG?=
 =?utf-8?B?YVlSbnpqb2NnZ25KM0hTSFA2eCtPcHlTMHRvS0pQSDk0eXVyRFp4QlFreUJk?=
 =?utf-8?B?cllpbng0R1I1RGVSTWNhQXd2YTEwWkJOSHR0K05yaW85OFE1alI2MnRNZjdQ?=
 =?utf-8?B?ZVpTMVhUcXNyejdaTzRiTWl0NXBNaTdhcGdpelJlSlJXWW12SU9STXFJaHo5?=
 =?utf-8?B?WWRKUG1yaHM0Z3NxdlZ0eWlxaUlJYTNXZlZaZG5Ec2JnMytKM09hUTc1bWRv?=
 =?utf-8?B?TFV3cDJyb0JwSW5vRGY2ZTlBdjdqOUxBc2dNVldQM3hydjB3K2hMWlZQa2pG?=
 =?utf-8?B?SERGU3RLK3l4Y3NaOExlL1p3K2FvZlJBaW1Cb3JNWFplVEJoWktoZWRqbjFP?=
 =?utf-8?B?SmdqdGRCemhPYWVITTl3ekpXMDM1Y2Z6WlRUWmdzbGxpR3psQzh0N0hUWFBK?=
 =?utf-8?B?NVpyOG9aRGM4ZW1udmlBMXRHc3NDV2x1aDlXUDFDbnF4R1JsSzdvZnYyT21K?=
 =?utf-8?B?RktpTExxUEJ2OGNhbmR6WTlyVHBuK212d1BLVWwvYTAxTDBvVzdOQitvN3JU?=
 =?utf-8?B?WFdKRktnV2pXaEFUV2NkOEk2NGlnZ2Rkc1d1cWJEZ2ZHZ1l0YW1WMkFMQlRQ?=
 =?utf-8?B?SW8zT21FZUx4WHVWUzFSbFJwV1NsUEVRZmdCWUsyS3FTWUd1OHRubmZzcklB?=
 =?utf-8?B?Y1dUb281UDkyZmpzQ2NOY3RnMWpOQkRVM1dJU2VEeXhXTk1zejRRMGgvN256?=
 =?utf-8?B?VGEzL0lpeUU0TTMyRXJvSUJMano2NTFXQUQvRjNNZVVTTkl1TnhjOG1KWmlL?=
 =?utf-8?B?ZFFyNTFhRFRNVTQwc1BZbGxBR09RTzliVGFyRXBISUZGNnVXSktVNFpPd1RX?=
 =?utf-8?B?RUpZWS9JbFAyTkdhU2phd0VzYzBhdnN5VDQzb0JNMUsxcUlueWl0amdwMWpB?=
 =?utf-8?B?ZWc3NXdpdWtlZFp4QkEzTzk2aDZpWjZMVndTeGo3VnZTaTVhZi9GNFJRc0Fn?=
 =?utf-8?B?bEFiSlhCSWE0WVpRNEhmaW1ONVo3a3ZSTmNKM09nSnRUZkJ0c3prenovQVhl?=
 =?utf-8?B?ZEF3ZlJnTVFPVENmQU5tK0MrZ0NWSzF5Q1h4bEkxdzZ5WHhBSEZBS3hiaFhR?=
 =?utf-8?B?VFlaakZMdkFUek5zVmc3U1dFd3lmQ1dESmVybkliS0JHNDR5dC9rNGZZWml4?=
 =?utf-8?B?Nlo4RE1US1E1YXpTcFR2aFAvcHZNY2doOGlacHdJTXRYSmtDMjgyejFwU3Qr?=
 =?utf-8?B?aDlUaEFJejVuTzI5RVpUWTZGYm1BR08yWkFBb3NvbjNKeVhPR1FRREp0Qmth?=
 =?utf-8?B?eFRnbDNNYmRXZjArak5pRXd0cUc4OUhTQzhlaGJzMGR4RkxjanhGdVQ4UEw3?=
 =?utf-8?B?YU1aQko3NjRtaEw1Y2M0QVgwdjZqNEszWUZJdGQ4TFJ5cjFzdnR5WEdVejZw?=
 =?utf-8?B?MXZ3dDh2aUM3T1VCcU9FOGFTMEg5YlpEY0ZxOEEvZXlOamFaTWJINVRuMVM3?=
 =?utf-8?B?MWhLOUlDa1I5bzdQQ0o5YTZ2NGN1QjNURmRzUXIveEM4NlVSZmN5cy9zR0s4?=
 =?utf-8?B?T1kyNzFtOG1GTFJQeW90VkVoOVc5Y3hZamdpSVVCeFJqUTNjdWFMbE5YYTFB?=
 =?utf-8?B?WHlveHlZTzcwSlphVGsvUm1sSkFRN1E0bTdaYUtzWisxdzNkMlJJQ0VrWW03?=
 =?utf-8?B?Q3N0bGJROFJET3FJSVdmZzAzNHRzM3REc0xwMm91VDQxZDZ1R1F6MWxhYzlY?=
 =?utf-8?B?UWRoRFJQYUV2ZVZEaENpbVVEVlVnMnBRQXk0K05zRHRwZ1JiYWpERUJTUUlV?=
 =?utf-8?B?Z0Q2SWd1VW1aNUp2UEVsTENPOXJ1MmFCaFh4cjZmT0RDSEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGIzRjdvejMxcUhIOTV1eGV2M3pIU0pmMXd6TnF5dW1yeGlnN2NDZGJZMmFK?=
 =?utf-8?B?Qmg3U3J2bnc5aU1sOTE5c2kwRTdUYXArUFRxaFhnOXY3aEdvWnh0SE9wcGpY?=
 =?utf-8?B?UjVVU1Y4YTF6Yy9LRDBHLzd5bmZKcUw5ZDg2Q0NJQW9aNVc4ekxCbUI0eUxh?=
 =?utf-8?B?UlV4cUNjVlkvRkdaOEhxbzhYanJEWmNWclJMM090MjlnOFlYakZ2U01nY0pz?=
 =?utf-8?B?Unh3QlBWQzV1eCtQZzNWeG1SZlJTejgxbUluL21WdURzaXp2ZXl6c1NMdWs5?=
 =?utf-8?B?UERmRDFJTHdMYi9Dc1FoRmtPV0ZLaGNaaDFsZzB1ZmJsV3Z4OENrcnZOZVRq?=
 =?utf-8?B?YkFmc3B4OXhwZkQ5ZmF5K20rbWJlY3ZiS0dlR1FxbWptN1pTdktSUC9GbGI5?=
 =?utf-8?B?dmRYWlFLRThYV2swUXBFNE45VWZmaDk4T29BMzNlUGhicG5Gb1FQeEJJN0xJ?=
 =?utf-8?B?WGJSZVVLUWtZZm53NUdwWFBmNWd5QW52U2NDOUplZ2pkWkt1QjVOZ2wzQ2pq?=
 =?utf-8?B?dnh4eHBNMmtvbTdHd0wvbGNUU0IwTVBHay9WdlN4UGtPK3hmcVNUOHVtR1hT?=
 =?utf-8?B?dGtaaUFoazJSU3NqazNPOXlJWUFGMm04NDc0NG0yRm5KZFo5Q3lIMis1c215?=
 =?utf-8?B?bVFwQnB5M1c0Q285UllENVBkMG91UWdKcTVWU0l5dnZTdVA1YjVXdGpIU242?=
 =?utf-8?B?R1B6UUw0ck1aTjNDUUpUNFFUYVhlVXNPZytOTUNPaGlzMmlFMjFTNjVhS3Bq?=
 =?utf-8?B?RlBWek0rUFNFdEVhc29UZVZSeGkrdmZJNVhnNGxNM01Wd1FDNGo3cTdqRWgr?=
 =?utf-8?B?aFZPZVVkd2t5MUNTR2ZzdHZtRkovaXlnQnFxSnZoUmZ3eUZqRXlhTGR4akJp?=
 =?utf-8?B?SmhPUHR2cVVqeGRXWDM1akJRNzZQTjI2Y0M1S1JqTkFHVXBlKzBGSjR2eFhH?=
 =?utf-8?B?NHZtVWtZVjRpOE5Nak1CalhGSERraHNrZjhnVUVKRmd6MzBRSUNyeFBOOTRN?=
 =?utf-8?B?eStTTDdTc0xtL2tzTDJsUkFWRmVLREgxVUYrVVpQYUFkbUFFdVFYZzFtN0VB?=
 =?utf-8?B?eGpMbVNjQXdIUnF2cFJqbzhxS3BCY1c3cjQ3TkFXa3VmZWx3U2gyclU3RWEr?=
 =?utf-8?B?NWJXcTEzMm16OFNkTi9HVWtncStPYk5vZVVacXZURVpkV1N4T0JhaFJ0SkZS?=
 =?utf-8?B?Qm5GRlZ6MlpnaXZ0Zy81TXA0OFkvSFhTOW9lZjVQL0tQRW9ORWtLS2htVVY2?=
 =?utf-8?B?N0lIQUhSUTZJeUZuNzBBdzNYTGN0Z2pUc0hyS0JpVnVDL3hnQ2J6dkluWDA2?=
 =?utf-8?B?R2YyWExYaEM1MlRSTXlJbnBlMDQxUWZ5aHhxNVVVRC9DMkJsN0VRaThJM3pw?=
 =?utf-8?B?bk1jZFVvNjR5Ui9XZnF5a1ZGS2JpTnNucTZMUXNYZXU4clJjQU1GS0hMWi9p?=
 =?utf-8?B?NFBNZHRQd09iUDQyYy9UQjRpLy9WbUNYeitGeXFTTkNTZDdNazdta0Nnb3lS?=
 =?utf-8?B?cUs5czdsM2pBR0FWeFp5TVM5Ukl4WlJ0YmhQUEcrczgxWEtORGpQWnhtZzVi?=
 =?utf-8?B?ZWxtZHRneExkY21zVzV5TXNWUnNIM0o3MEtwZGk1cFloV1JSb3JRK29KNFo2?=
 =?utf-8?B?eWhVb1ZMeDdsckF3NmxpVU4vR09VUnFzdG52V0dLQmJYVitwVXVKQ2ptRHdD?=
 =?utf-8?B?NjlPSEF2NE9BVDBjM0Y5S0Fyb2ZBYlp4WVU0Vk1UekRWNmUxdnhmVk5NMHV6?=
 =?utf-8?B?WUc2NmpvSHJXNlZiQi9mZlFiM0pMZ3VZRVlNNHBmR0djWFlKN3ZLREJqemUv?=
 =?utf-8?B?WXAyNjFNRUhpY0R1RW5JS3JiLzNxbEtaYm5uV3doWXhBcWJwZ3FXUGZNWFVm?=
 =?utf-8?B?b1I2cGc1MlUzZkE5RmJOYjZ5dFR2YXFaeGFkbGxMcmNRK3k2QlBaV21wMTNa?=
 =?utf-8?B?dmRnSlloK0t4Vm9uS1RWZml4VXRzRk1pbFM1RjFIQm5KQW5wMUlQQVIvbGlh?=
 =?utf-8?B?b1dsMzhTaFpiODljZS91TDU2MWhwaERnNHV1UXV5V1VPaEV6dXRHMlc1NEkz?=
 =?utf-8?B?ck5jNGQ4cklnNEgyZGRFU1pjQXBsMExKMGJERFowQ3Z2TkpuN3lra1FSb0Q4?=
 =?utf-8?B?ak5yejZLZ0dyV0kvcklITDJ4aDhrMHRmSFNiQ2xHVGtUYUhacW1lbzZ6MXBk?=
 =?utf-8?B?REE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k4wZ0Kx0LxDtnsd97o6FBScW"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c50d992f-e5c9-4087-d0a3-08dcd27873bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 15:43:15.8953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BjUrKJrciI2ZluLLVCQiyVWBWEuB369016XhxpBGSn5Z/JqeYO0v3HeMUtjgrnipHcwQC3zCKPtOjq1VX13TqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6740
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Authority-Analysis: v=2.4 cv=V7Ev0vni c=1 sm=1 tr=0 ts=66e1ba98 cx=c_pps
 a=6IdplsTJodF3+aqeaEJcqA==:117 a=6IdplsTJodF3+aqeaEJcqA==:17
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8 a=wHEVHdBimyBemZvaBQYA:9 a=QEXdDO2ut3YA:10
 a=Krd9fsHnkUVr2O1wAC8A:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: YNDsddm2Jg_kOglUUDXjTEZkTmUZjFzJ
X-Proofpoint-GUID: YNDsddm2Jg_kOglUUDXjTEZkTmUZjFzJ
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

--------------k4wZ0Kx0LxDtnsd97o6FBScW
Content-Type: multipart/mixed; boundary="------------fSvHNm480sdgOn2mGoBg5h40";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: dri-devel@lists.freedesktop.org
Cc: Brendan King <brendan.king@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Message-ID: <6c283532-e39f-4bb0-b0a1-d654632478a0@imgtec.com>
Subject: [PATCH 2/2] drm/imagination: Break an object reference loop
References: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>
In-Reply-To: <dbfff3b2-84c7-400d-b305-64735193a948@imgtec.com>

--------------fSvHNm480sdgOn2mGoBg5h40
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Brendan King <brendan.king@imgtec.com>

When remaining resources are being cleaned up on driver close,
outstanding VM mappings may result in resources being leaked, due
to an object reference loop, as shown below, with each object (or
set of objects) referencing the object below it:

    PVR GEM Object
    GPU scheduler "finished" fence
    GPU scheduler =E2=80=9Cscheduled=E2=80=9D fence
    PVR driver =E2=80=9Cdone=E2=80=9D fence
    PVR Context
    PVR VM Context
    PVR VM Mappings
    PVR GEM Object

The reference that the PVR VM Context has on the VM mappings is a
soft one, in the sense that the freeing of outstanding VM mappings
is done as part of VM context destruction; no reference counts are
involved, as is the case for all the other references in the loop.

To break the reference loop during cleanup, free the outstanding
VM mappings before destroying the PVR Context associated with the
VM context.

Signed-off-by: Brendan King <brendan.king@imgtec.com>
Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/imagination/pvr_context.c | 19 +++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h | 18 ++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_vm.c      | 22 ++++++++++++++++++----
 drivers/gpu/drm/imagination/pvr_vm.h      |  1 +
 4 files changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_context.c b/drivers/gpu/drm/=
imagination/pvr_context.c
index 255c93582734..4cb3494c0bb2 100644
--- a/drivers/gpu/drm/imagination/pvr_context.c
+++ b/drivers/gpu/drm/imagination/pvr_context.c
@@ -450,11 +450,30 @@ pvr_context_destroy(struct pvr_file *pvr_file, u32 =
handle)
  */
 void pvr_destroy_contexts_for_file(struct pvr_file *pvr_file)
 {
+	struct pvr_device *pvr_dev =3D pvr_file->pvr_dev;
 	struct pvr_context *ctx;
 	unsigned long handle;
=20
 	xa_for_each(&pvr_file->ctx_handles, handle, ctx)
 		pvr_context_destroy(pvr_file, handle);
+
+	spin_lock(&pvr_dev->ctx_list_lock);
+	ctx =3D list_first_entry(&pvr_file->contexts, struct pvr_context, file_=
link);
+
+	while (!list_entry_is_head(ctx, &pvr_file->contexts, file_link)) {
+		list_del_init(&ctx->file_link);
+
+		if (pvr_context_get_if_referenced(ctx)) {
+			spin_unlock(&pvr_dev->ctx_list_lock);
+
+			pvr_vm_unmap_all(ctx->vm_ctx);
+
+			pvr_context_put(ctx);
+			spin_lock(&pvr_dev->ctx_list_lock);
+		}
+		ctx =3D list_first_entry(&pvr_file->contexts, struct pvr_context, file=
_link);
+	}
+	spin_unlock(&pvr_dev->ctx_list_lock);
 }
=20
 /**
diff --git a/drivers/gpu/drm/imagination/pvr_context.h b/drivers/gpu/drm/=
imagination/pvr_context.h
index a5b0a82a54a1..07afa179cdf4 100644
--- a/drivers/gpu/drm/imagination/pvr_context.h
+++ b/drivers/gpu/drm/imagination/pvr_context.h
@@ -126,6 +126,24 @@ pvr_context_get(struct pvr_context *ctx)
 	return ctx;
 }
=20
+/**
+ * pvr_context_get_if_referenced() - Take an additional reference on a s=
till
+ * referenced context.
+ * @ctx: Context pointer.
+ *
+ * Call pvr_context_put() to release.
+ *
+ * Returns:
+ *  * True on success, or
+ *  * false if no context pointer passed, or the context wasn't still
+ *  * referenced.
+ */
+static __always_inline bool
+pvr_context_get_if_referenced(struct pvr_context *ctx)
+{
+	return ctx !=3D NULL && kref_get_unless_zero(&ctx->ref_count) !=3D 0;
+}
+
 /**
  * pvr_context_lookup() - Lookup context pointer from handle and file.
  * @pvr_file: Pointer to pvr_file structure.
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagi=
nation/pvr_vm.c
index 97c0f772ed65..7bd6ba4c6e8a 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gpuvm.h>
=20
+#include <linux/bug.h>
 #include <linux/container_of.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -597,12 +598,26 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, b=
ool is_userspace_context)
 }
=20
 /**
- * pvr_vm_context_release() - Teardown a VM context.
- * @ref_count: Pointer to reference counter of the VM context.
+ * pvr_vm_unmap_all() - Unmap all mappings associated with a VM context.=

+ * @vm_ctx: Target VM context.
  *
  * This function ensures that no mappings are left dangling by unmapping=
 them
  * all in order of ascending device-virtual address.
  */
+void
+pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
+{
+	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
+			     vm_ctx->gpuvm_mgr.mm_range));
+}
+
+/**
+ * pvr_vm_context_release() - Teardown a VM context.
+ * @ref_count: Pointer to reference counter of the VM context.
+ *
+ * This function also ensures that no mappings are left dangling by call=
ing
+ * pvr_vm_unmap_all.
+ */
 static void
 pvr_vm_context_release(struct kref *ref_count)
 {
@@ -612,8 +627,7 @@ pvr_vm_context_release(struct kref *ref_count)
 	if (vm_ctx->fw_mem_ctx_obj)
 		pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
=20
-	WARN_ON(pvr_vm_unmap(vm_ctx, vm_ctx->gpuvm_mgr.mm_start,
-			     vm_ctx->gpuvm_mgr.mm_range));
+	pvr_vm_unmap_all(vm_ctx);
=20
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 	drm_gem_private_object_fini(&vm_ctx->dummy_gem);
diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/imagi=
nation/pvr_vm.h
index f2a6463f2b05..79406243617c 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.h
+++ b/drivers/gpu/drm/imagination/pvr_vm.h
@@ -39,6 +39,7 @@ int pvr_vm_map(struct pvr_vm_context *vm_ctx,
 	       struct pvr_gem_object *pvr_obj, u64 pvr_obj_offset,
 	       u64 device_addr, u64 size);
 int pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 siz=
e);
+void pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx);
=20
 dma_addr_t pvr_vm_get_page_table_root_addr(struct pvr_vm_context *vm_ctx=
);
 struct dma_resv *pvr_vm_get_dma_resv(struct pvr_vm_context *vm_ctx);
--=20
2.46.0




--------------fSvHNm480sdgOn2mGoBg5h40--

--------------k4wZ0Kx0LxDtnsd97o6FBScW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZuG6kwUDAAAAAAAKCRB5vBnz2d5qsGBJ
AP9Ub8FpKkL8ChGZxReJpgMtfl89Cy/+6+UWxgNBiSfrVgEAobV8xBviJ3BkVXiwWvqhlhNITe51
iL8O8w2vjwMUmwo=
=sgRe
-----END PGP SIGNATURE-----

--------------k4wZ0Kx0LxDtnsd97o6FBScW--
