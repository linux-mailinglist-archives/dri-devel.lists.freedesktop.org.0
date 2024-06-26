Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4420917ECA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 12:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4CC10E838;
	Wed, 26 Jun 2024 10:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pd3kJpQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A6C10E838
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 10:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckgoK8x4Uk0p3KMoMKuaWlXVSFceb4YiHG0SrFSetdH+6SdcsSfdZftm5apElulX7Uu2NktikTxlITNsADHw2/hx/GnR7v4Aduier0RxwciwBF5QEB1ad9/oULxGbBs3RvFdRkcz0wtbTWIk926ia0yxJ9bJ43aXw0e+woOwWE9rw2UEm4kJJKucjL2gptu/LLLKf8x+3k99Ja/cAhVWziaEKhadEgDh43S0TA6FOleDVx+YraAeNNJ5ib915+VpXVJw4LZRA7l7csA7KqqAohF9/LecXRDlZU44uZWwl5lYpF7ewWVJTJ9Yu25hkcW9+R+i3ROzZXivvWqszslO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjFcdV+CA0itX6RMZNcRmKj9JNz6M8riDPQ/4wMEE0o=;
 b=YSKTh0mfnyryUMu+FZt7lhMdAXmucGWQ49O+psN58MhW3j4Sc9cZAWA0FoZ6YE7DvwIE5ZKGd5nMa3NLoRqUK1f0dIUXmZ+pZMVqQhqSYV96ahJbM8m6sgC3NOTdXqPBtBvGFkCXkxl2x25OAPl0EkXhMnmqHJApsG/M4/nk8GXpOoL1SOMkHAdR5TbHV3sUismw571LTNktuZNQQ0sosuT3B4BIO0RaLuKPnr6oWMf+UxVNc6lHFf9b2l65Q46vwXke2HoJBoljxFrTAbFss0akbgYfRQHx6ipyyxhADeXDdqT1jG8nqLHWskpBmxw+q/lKWYVvejyCxRlZ1UuR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjFcdV+CA0itX6RMZNcRmKj9JNz6M8riDPQ/4wMEE0o=;
 b=pd3kJpQ42GIqkBJD43Jfy24nqY8DXSPXBVKW7qEirvBdAAzlCNvJ20LVVcCj13Kr5ypkr96DzP+33cbYKi1no6qy1iJXa8sMvhMmPIm+YOTM/IJFGuQnbvL8qP874ouQczB3UbYU4yu0GikCYoTOsOsuCsymSc7VG+f/PI+HieU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.33; Wed, 26 Jun
 2024 10:49:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 10:49:12 +0000
Content-Type: multipart/alternative;
 boundary="------------O062ruAOP9iIJyF4FS9Hdk6s"
Message-ID: <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
Date: Wed, 26 Jun 2024 12:49:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
X-ClientProxiedBy: FR4P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4297:EE_
X-MS-Office365-Filtering-Correlation-Id: 948ca6b4-9116-4902-ec36-08dc95cd9db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|7416012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFZ5Nis5R09WdkN4c092UUVxK3ZNYkdveEFHeDVSRUtHcWpacFErb0VXb0Uz?=
 =?utf-8?B?SEVsSTJONGorUHpUeSsyYzRMZDBhK2ZmcnpvNVc0S1lxZU11Sm9GT3BJYXd5?=
 =?utf-8?B?YTlsbHExSGtjdS9vaDl4SXY1QndyQVdaRld3aUlnOHdpR000R0lqcVFaZi9l?=
 =?utf-8?B?emxNbHYvYWZCMWZCY3dqL0R3VVN2M2ZPamExTUZMYnNwcFQ0U0htWDB4WHdS?=
 =?utf-8?B?b1QxSGFkYkluWmpRNUR3d293eWJKQU4rMDlMQ1ErOURaRXY3NGVLakRnUWtT?=
 =?utf-8?B?enBhTDkwaG1kY2xhT0tVRWZhVWpWSGpIYk9HckxkSWNQeTVZSzZPM2VTMWxx?=
 =?utf-8?B?VFFCZmxwam1nSmZ3akdjejZFb1VESXh1bGMvbjNoZlJ2VVNLNmRjNXVCcWc4?=
 =?utf-8?B?ZmcyQmg2VWVqNWM4TWQyNTA2SW1DcnFwRG5mcTlNTHNrMzNaem1sSXk0elJJ?=
 =?utf-8?B?RVI5THVCZTZPKzE3ZkNWbUZCdEFFVVRKRnhDVTNZUGIzbUt6MWdteDZic1A4?=
 =?utf-8?B?WkxQSHY5MHRybnB5b2FPWjBzNnY3TG9RSnpuMll6NzRaNWxGSFBUc2IxS3BH?=
 =?utf-8?B?OFFqK29TRTEvenFFczhDdm1ISWs2Y0h2ZUpkZDJJSDBkMG9Fd2NiNEYzKzN1?=
 =?utf-8?B?VXo4NWl1UGhGVWwrTFZsWU55NFd6dkI1SkY2QTJOaFBObGpyUTdISVZDd2Iv?=
 =?utf-8?B?UFYybTRwUGp6S0dDRGRHL1A2UEVBd2xDSnR2S2hETVRHY29ReW9Kc3BOR2FW?=
 =?utf-8?B?OXJHRTFleEdLYVgzLzA2eHpySTNvakZBSEw4S3NwRW1tNW41Q3Z4K25LbXZj?=
 =?utf-8?B?VU16OXVlbi9COFpYT0gxcGVOMlA3a2xSNzZrdXNLNmFsczNzWUtrTytPUXBj?=
 =?utf-8?B?N1JGRjVWSi9nOXdSMUhPNVFXWFZUSythTEhIVEFqWE5NSFlJUFRYQU9MVkt4?=
 =?utf-8?B?MkpQK0xJVXJVWXdYZXdubWRHWGk4czdYa3lYWEd4bEQ3UmpKQnlOY2piTnFR?=
 =?utf-8?B?ZjUxUGdzaGxEak5zd2ViKy9FSTdPYnpOaDJBdk51VTAxOUlmYmNVSTN2U2xp?=
 =?utf-8?B?by91czlWWkhsazBvbzBDL2taQjAzbS96eEhHcllJQVlzYkZMM1dldStOYXBX?=
 =?utf-8?B?dHdRdkFFOG5HMjQvYlpLNy95V1dobGJacWtOY2JhNVNHb1NXNmYzcjhuQU51?=
 =?utf-8?B?aWJiWWNZVVBRSm9IVmprTVJQQkRhdkw5WjJZdkFwc2ltbTd0S3YyaWhvSWZ6?=
 =?utf-8?B?TWtmSWhJdmd4WTR1ZjkweENJeFlKOEROV21pOTE5YUJMbXE2L2dSTnVQaXhr?=
 =?utf-8?B?c004MGtlN2M1U3hZdlNJbDVpR1RXcjBCb0t1Ry9Kc3VWZ3NaVG1TM1dZZ2lS?=
 =?utf-8?B?bzZKUlIxSFJCUVgxWlJicDJIU2tWTmZyUnY5TURtTzdVOW9sa3FncWR4cVM2?=
 =?utf-8?B?Q3dVckNtK1NtZm42a2JkeDh0NUd5VUNGbm9OYVF4dXdRYmVta2Mydm9IUFBT?=
 =?utf-8?B?SkN3dWdheEhZL0NLc2x3dHpJeVFOd1hXcjlNQmpUd3NyRHBRWVFCb0NwcC82?=
 =?utf-8?B?Sk9JMTg1c3ZOcGp3aUxpbkJnWW1QVXN4WGQ5ZVpFeFp6Njl3ZTFJSUtlSkVm?=
 =?utf-8?B?UCtYL3I0YmtHQW84ZmE0RURVODhCTXNSenYyMi92S3MzZURPelN5S25QbDBl?=
 =?utf-8?B?VFY2em80TUFEZXJubmNUaVJ0NFVqM1dBOWF4NmNxdG45WlREdS9LdmVjRzY2?=
 =?utf-8?Q?jpLUqHbCWzKF6ZbaIQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(7416012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTJlejlZaC95WkxYb1NsWDU0NU11czgrTjZXc3ZDUkc2UU5IWjdaRGdVdEZU?=
 =?utf-8?B?RExVWjF1b0x0bnFldnNEMHowYUY3NlVUVER5YzlNTnRobGNtTEQwSWcvanFG?=
 =?utf-8?B?Mno0Zmd4ZlJCMlJqcnZvNnVvdVR2S0Y4RTBjNU15cGx3VEhuTVpybmk3RC9B?=
 =?utf-8?B?dDZlbGEzbEk0NjFMOFBJbzM0RGNDNy9zeW9qS0J4MGpwYzE4MHordlJFM1Ft?=
 =?utf-8?B?L25FOVdGbkEvdXhOdXdacENMMDBVS2tnRTdRN2svV1Ira002bXVYYzg5RHJr?=
 =?utf-8?B?MjFsZFhpQnNSU0o0clBqZ0V2YU9UYlhsMm5yckVYd09QRDZIWVU1Q1RTcGZj?=
 =?utf-8?B?aW9qbWt1VWE1WlBEWDF5UGNlc3N4RE9uT3JjMklaQXdhUEJZaHZ6b09ick5X?=
 =?utf-8?B?azZXRDg2dkpJSXBFSVFsaUtRazBkWFZjWGpQVnRCbzVXRmJOVGpHcldGN28v?=
 =?utf-8?B?RVBiZTVqSGtuRDJ0NFdWZ0VNdi8yaGNVeGxIaUx6em5rbEd0WXYvYVYwdG9s?=
 =?utf-8?B?aFZMWFdTMm81R3g4TEl0MlVyNXd1UjBOOWQ0aUdYUUxGc3RrOUNyN1J4cnJn?=
 =?utf-8?B?RldFWThCd2RlMGJETkVocHlBYlUvcG5IcG1HaWlySy9FSWUzMGQzOGtjcmtW?=
 =?utf-8?B?UURrclJKSXRhRWVPWTZjbmN6L2hnNzZmVGVOTTNuYkowdWFyT0N3VmczZno4?=
 =?utf-8?B?WHFsckgyTGpjbDRaSk1lcjJxc2hLUDFubkZIT2FFbC9MQm5kNXJKcVo2dWV4?=
 =?utf-8?B?TzJ4cEwzQkNrc3M5VVVVeDkwNnlWeDJEQTFlK2RrbUw1aE5pbjhiZGx3T3A5?=
 =?utf-8?B?eWJYTmU3M0YwQlJ4bENSSXJwb1NVSU1LQjFtZExBaGZJVFNIM1RYVnkxNURx?=
 =?utf-8?B?TXdUZHJ0QXBWUEN2bTUyOFBBeEFaT29aSXFBeHhKUHRLVk42ZGVTdmwvVmFx?=
 =?utf-8?B?bG42YWgyc1AzSDg0dDRsTkFoQ1kyK0JUOGV6bWxNSUhTb25Fbm1YSjNJcm05?=
 =?utf-8?B?RXBkVVNsYnIrTVpZdXM2cjBIcGg2R2REVFFrdlpnTzdsSlFsNnR1Snl0YjlR?=
 =?utf-8?B?d1JtWS9hYzBZUFBIeGlkeExLblRiYnNqU05pb2tvSmZwM2QvcXpEZU1CSWZH?=
 =?utf-8?B?Z0Y0L2ROQnd2RmtwL0RFcVVobTNQRHVDOXk5WHdKSWI0WnRIWGtoNGxtcVlK?=
 =?utf-8?B?R3E3c2dDSzI0MjJtZVJCUmZZT3JRcUs2SEhYSTY3cWpLaGdGQUxtbXN4bGIz?=
 =?utf-8?B?UXJEYXFaZ1ZCb2ZFTUJBdGU5alRzM3BCK3ZwMWJjV3hmWUhKVEVKZHF2Wllv?=
 =?utf-8?B?d2NsYm1BMENxL3lidjR6Tjlza3l3Rk1FSk1zOUhua0lLekdUYnZ3RVN2U1NJ?=
 =?utf-8?B?NWxwNWx5R1ltKytXUlZNcStuM3A2MUpqZlNYVzVBTC9BdGdYMlp6bU1IdDdX?=
 =?utf-8?B?QnhLSHRiYTVITWpoN0V3WWlqZUhTQ0k5M0JCYi9CbnZ0SzlTMUZjTWZKUklp?=
 =?utf-8?B?NVpMb1hVU1BwbGNCbEQvTW9naUllVFR1NjZ6dVNaVGRLdUR6eWJlRFczR2dF?=
 =?utf-8?B?djY3THVMTGk4RXBpbmRwRFkzSjJ0T1pLdkIyM25sRnlFMExEUllrenJtMXFo?=
 =?utf-8?B?amZ4VUlrWkpxN1ZLU3NraFJaYndzc0IxNVNwNGlZYWVqVGdaZXIrKzN3Y2pG?=
 =?utf-8?B?QmJZenFZbVBvVDZISGgrV2kyYjFTdEQ2dVpLOUNYTDNOb25MQmhFT2hzWUVH?=
 =?utf-8?B?amlaRG01U3lON2R2YVRzSnQwemxRNDhvS2s3bGJlUGROdDF0YjdkOUwwZHdN?=
 =?utf-8?B?NVYrWkZtTjZ5MlArbnlBNmJYRGpoYlBtSTVZRUEvK3BnWStyWEZNVjNlNVQ5?=
 =?utf-8?B?Wmtkd1FJd2dQQUJ5aE8xMUxwT0xKZHdPUEZFdXJZL0J3MWYrQ2ZRMVh6a1Vj?=
 =?utf-8?B?Y0JHWGg4Y3AvQVF1RlUybmhtOEZDdlNHUEFPMTBuajlTSktOZ2t0OEpyaG5z?=
 =?utf-8?B?eFMrczExL3BzTWFXRlEyeU52VnpabUEwUXNRL3lFaVdJVkRUOTZXVW50T2pU?=
 =?utf-8?B?amRjN2QybE1Bdy9qSUw0b0cxZkR6ekNNLzkzNm5TVGVTVzJnVStxa1A2c3Y2?=
 =?utf-8?Q?fj5E=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948ca6b4-9116-4902-ec36-08dc95cd9db5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 10:49:12.9111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqGLt2KiBoeZ9wtiZJEPvc0gjubH1sLY09rCCNHnjnRn47C3DMOL0+OKSU0/JgWq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4297
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

--------------O062ruAOP9iIJyF4FS9Hdk6s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 26.06.24 um 10:05 schrieb Jason-JH Lin (林睿祥):
>
> > 
> > > In the step 3), we need to verify the dma-buf is allocated from
> > > "restricted_mtk_cma", but there is no way to pass the secure flag
> > >  or
> > > private data from userspace to the import interface in DRM driver.
> >  
> > Why do you need to verify that?
>
> I need to know the imported buffer is allocated from restricted cma and
> mark it as a secure buffer in mediatek-drm driver. Then, I will add
> some configuration to the hardware if the buffer is secure buffer, so
> that it can get the permission to access the secure buffer.

Yeah so far that makes sense. This is basically what other drivers do 
with secure buffers as well.

But why do you want the kernel to transport that information? Usually 
drivers get the information from userspace what to do with a buffer.

In other words the format, stride, tilling and also if it's a secure 
buffer or not comes from userspace.

What the hardware usually handles internally is things like encryption 
keys, but you eventually get the information where to look for the key 
from userspace as well.

Handling inside the kernel would only be necessary if userspace could 
for example crash the system with invalid parameters. But for encryption 
that is usually not the case.

> > 
> > > So I can only verify it like this now:
> > > struct drm_gem_object *mtk_gem_prime_import_sg_table(struct
> > > drm_device
> > > *dev, struct dma_buf_attachment *attach, struct sg_table *sg)
> > > {
> > >     struct mtk_gem_obj *mtk_gem;
> > > 
> > >     /* check if the entries in the sg_table are contiguous */
> > >     if (drm_prime_get_contiguous_size(sg) < attach->dmabuf->size) {
> > >         DRM_ERROR("sg_table is not contiguous");
> > >         return ERR_PTR(-EINVAL);
> > >     }
> > >     mtk_gem = mtk_gem_init(dev, attach->dmabuf->size);
> > >     if (IS_ERR(mtk_gem))
> > >         return ERR_CAST(mtk_gem);
> > > 
> > > +   mtk_gem->secure = (!strncmp(attach->dmabuf->exp_name,
> > >  "restricted",
> > > 10));
> > >     mtk_gem->dma_addr = sg_dma_address(sg->sgl);
> > >     mtk_gem->size = attach->dmabuf->size;
> > >     mtk_gem->sg = sg;
> > > 
> > >     return &mtk_gem->base;
> > > }
> >  
> > Complete NAK from my side to that approach. Importing of a DMA-buf
> > should be independent of the exporter.
> > 
> > What you could do is to provide the secure buffer from a device and
> > not a device heap.
> > 
>
> You mean I should allocate buffer in mediate-drm driver not userspace?

Well that depends. The question is if you have multiple drivers which 
needs to work with this secure buffer?

If yes then you should have a general allocation heap for it. If no then 
the buffers could as well be allocated from the driver interface directly.

> I just have modified this to userspace by the comment here:
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240403102701.369-3-shawn.sung@mediatek.com/#25806766
>
> > > I think I have the same problem as the ECC_FLAG mention in:
> > > 
> > > 
> https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/
> > > 
> > > I think it would be better to have the user configurable private
> > > information in dma-buf, so all the drivers who have the same
> > > requirement can get their private information from dma-buf directly
> > > and
> > > no need to change or add the interface.
> > > 
> > > What's your opinion in this point?
> >  
> > Well of hand I don't see the need for that.
> > 
> > What happens if you get a non-secure buffer imported in your secure
> > device?
>
> We use the same mediatek-drm driver for secure and non-secure buffer.
> If non-secure buffer imported to mediatek-drm driver, it's go to the
> normal flow with normal hardware settings.
>
> We use different configurations to make hardware have different
> permission to access the buffer it should access.
>
> So if we can't get the information of "the buffer is allocated from
> restricted_mtk_cma" when importing the buffer into the driver, we won't
> be able to configure the hardware correctly.

Why can't you get this information from userspace?

Regards,
Christian.

>
> Regards,
> Jason-JH.Lin
>
> > 
> > Regards,
> > Christian.
> > 
> > > Regards,
> > > Jason-JH.Lin
> > > 
> > > > Regards,
> > > > Christian.
> > > 
> > > ************* MEDIATEK Confidentiality Notice
> > >  ********************
> > > The information contained in this e-mail message (including any 
> > > attachments) may be confidential, proprietary, privileged, or
> > > otherwise
> > > exempt from disclosure under applicable laws. It is intended to be 
> > > conveyed only to the designated recipient(s). Any use,
> > > dissemination, 
> > > distribution, printing, retaining or copying of this e-mail
> > > (including its 
> > > attachments) by unintended recipient(s) is strictly prohibited and
> > > may 
> > > be unlawful. If you are not an intended recipient of this e-mail,
> > > or believe
> > >  
> > > that you have received this e-mail in error, please notify the
> > > sender 
> > > immediately (by replying to this e-mail), delete any and all copies
> > > of 
> > > this e-mail (including any attachments) from your system, and do
> > > not
> > > disclose the content of this e-mail to any other person. Thank you!
> >  
>
> ************* MEDIATEK Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

--------------O062ruAOP9iIJyF4FS9Hdk6s
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 26.06.24 um 10:05 schrieb Jason-JH Lin (林睿祥):<br>
    <blockquote type="cite" cite="mid:98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com">
      
      <p>
      </p>
      <pre>&gt; 
&gt; &gt; In the step 3), we need to verify the dma-buf is allocated from
&gt; &gt; &quot;restricted_mtk_cma&quot;, but there is no way to pass the secure flag
&gt; &gt;  or
&gt; &gt; private data from userspace to the import interface in DRM driver.
&gt;  
&gt; Why do you need to verify that?

I need to know the imported buffer is allocated from restricted cma and
mark it as a secure buffer in mediatek-drm driver. Then, I will add
some configuration to the hardware if the buffer is secure buffer, so
that it can get the permission to access the secure buffer.</pre>
    </blockquote>
    <br>
    Yeah so far that makes sense. This is basically what other drivers
    do with secure buffers as well.<br>
    <br>
    But why do you want the kernel to transport that information?
    Usually drivers get the information from userspace what to do with a
    buffer.<br>
    <br>
    In other words the format, stride, tilling and also if it's a secure
    buffer or not comes from userspace.<br>
    <br>
    What the hardware usually handles internally is things like
    encryption keys, but you eventually get the information where to
    look for the key from userspace as well.<br>
    <br>
    Handling inside the kernel would only be necessary if userspace
    could for example crash the system with invalid parameters. But for
    encryption that is usually not the case.<br>
    <br>
    <blockquote type="cite" cite="mid:98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com">
      <pre>&gt; 
&gt; &gt; So I can only verify it like this now:
&gt; &gt; struct drm_gem_object *mtk_gem_prime_import_sg_table(struct
&gt; &gt; drm_device
&gt; &gt; *dev, struct dma_buf_attachment *attach, struct sg_table *sg)
&gt; &gt; {
&gt; &gt;     struct mtk_gem_obj *mtk_gem;
&gt; &gt; 
&gt; &gt;     /* check if the entries in the sg_table are contiguous */
&gt; &gt;     if (drm_prime_get_contiguous_size(sg) &lt; attach-&gt;dmabuf-&gt;size) {
&gt; &gt;         DRM_ERROR(&quot;sg_table is not contiguous&quot;);
&gt; &gt;         return ERR_PTR(-EINVAL);
&gt; &gt;     }
&gt; &gt;     mtk_gem = mtk_gem_init(dev, attach-&gt;dmabuf-&gt;size);
&gt; &gt;     if (IS_ERR(mtk_gem))
&gt; &gt;         return ERR_CAST(mtk_gem);
&gt; &gt; 
&gt; &gt; +   mtk_gem-&gt;secure = (!strncmp(attach-&gt;dmabuf-&gt;exp_name,
&gt; &gt;  &quot;restricted&quot;,
&gt; &gt; 10));
&gt; &gt;     mtk_gem-&gt;dma_addr = sg_dma_address(sg-&gt;sgl);
&gt; &gt;     mtk_gem-&gt;size = attach-&gt;dmabuf-&gt;size;
&gt; &gt;     mtk_gem-&gt;sg = sg;
&gt; &gt; 
&gt; &gt;     return &amp;mtk_gem-&gt;base;
&gt; &gt; }
&gt;  
&gt; Complete NAK from my side to that approach. Importing of a DMA-buf
&gt; should be independent of the exporter.
&gt; 
&gt; What you could do is to provide the secure buffer from a device and
&gt; not a device heap.
&gt; 

You mean I should allocate buffer in mediate-drm driver not userspace?</pre>
    </blockquote>
    <br>
    Well that depends. The question is if you have multiple drivers
    which needs to work with this secure buffer?<br>
    <br>
    If yes then you should have a general allocation heap for it. If no
    then the buffers could as well be allocated from the driver
    interface directly.<br>
    <br>
    <blockquote type="cite" cite="mid:98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com">
      <pre>I just have modified this to userspace by the comment here:

<a class="moz-txt-link-freetext" href="https://patchwork.kernel.org/project/linux-mediatek/patch/20240403102701.369-3-shawn.sung@mediatek.com/#25806766">https://patchwork.kernel.org/project/linux-mediatek/patch/20240403102701.369-3-shawn.sung@mediatek.com/#25806766</a>

&gt; &gt; I think I have the same problem as the ECC_FLAG mention in:
&gt; &gt; 
&gt; &gt; 
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/">https://lore.kernel.org/linux-media/20240515-dma-buf-ecc-heap-v1-0-54cbbd049511@kernel.org/</a>
&gt; &gt; 
&gt; &gt; I think it would be better to have the user configurable private
&gt; &gt; information in dma-buf, so all the drivers who have the same
&gt; &gt; requirement can get their private information from dma-buf directly
&gt; &gt; and
&gt; &gt; no need to change or add the interface.
&gt; &gt; 
&gt; &gt; What's your opinion in this point?
&gt;  
&gt; Well of hand I don't see the need for that.
&gt; 
&gt; What happens if you get a non-secure buffer imported in your secure
&gt; device?

We use the same mediatek-drm driver for secure and non-secure buffer.
If non-secure buffer imported to mediatek-drm driver, it's go to the
normal flow with normal hardware settings.

We use different configurations to make hardware have different
permission to access the buffer it should access.

So if we can't get the information of &quot;the buffer is allocated from
restricted_mtk_cma&quot; when importing the buffer into the driver, we won't
be able to configure the hardware correctly.</pre>
    </blockquote>
    <br>
    Why can't you get this information from userspace?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com">
      <pre>

Regards,
Jason-JH.Lin

&gt; 
&gt; Regards,
&gt; Christian.
&gt; 
&gt; &gt; Regards,
&gt; &gt; Jason-JH.Lin
&gt; &gt; 
&gt; &gt; &gt; Regards,
&gt; &gt; &gt; Christian.
&gt; &gt; 
&gt; &gt; ************* MEDIATEK Confidentiality Notice
&gt; &gt;  ********************
&gt; &gt; The information contained in this e-mail message (including any 
&gt; &gt; attachments) may be confidential, proprietary, privileged, or
&gt; &gt; otherwise
&gt; &gt; exempt from disclosure under applicable laws. It is intended to be 
&gt; &gt; conveyed only to the designated recipient(s). Any use,
&gt; &gt; dissemination, 
&gt; &gt; distribution, printing, retaining or copying of this e-mail
&gt; &gt; (including its 
&gt; &gt; attachments) by unintended recipient(s) is strictly prohibited and
&gt; &gt; may 
&gt; &gt; be unlawful. If you are not an intended recipient of this e-mail,
&gt; &gt; or believe
&gt; &gt;  
&gt; &gt; that you have received this e-mail in error, please notify the
&gt; &gt; sender 
&gt; &gt; immediately (by replying to this e-mail), delete any and all copies
&gt; &gt; of 
&gt; &gt; this e-mail (including any attachments) from your system, and do
&gt; &gt; not
&gt; &gt; disclose the content of this e-mail to any other person. Thank you!
&gt;  

</pre>
      <pre>************* MEDIATEK Confidentiality Notice
 ********************
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

--------------O062ruAOP9iIJyF4FS9Hdk6s--
