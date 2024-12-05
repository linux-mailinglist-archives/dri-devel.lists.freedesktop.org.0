Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576949E5B84
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 17:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3428610EF05;
	Thu,  5 Dec 2024 16:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0p198D6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F5F10E3C2;
 Thu,  5 Dec 2024 16:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733416431; x=1764952431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BPTao1ytIocOVB8NPd0qcRabkyFc9hZQfZAIRWMWn+I=;
 b=a0p198D6p+NsBj6OiNy6VTloWPhZhEk0eyRduolZLjd7yq3ji8aVl9JN
 jcxTqdt0MwKB9JtWQCeowKX8a+4E0NGB1/0KoXG8vI4gOsICi4/hA6Wh0
 hLoC7lr3zDtL9Z0M28PasC77nRJ2enUEZfjfLZW307AE+ENsBM/FQQOQw
 72rzeljYCKIv2A/7/THrvU0MemZ5bv1Hdh8vrpFbpQBVMDVPs1JEWGY8A
 HNvexkUMH4hzp0B1HoI9ZEe83RrclUio4Pk7FdOAbv5s9ime2zIOv/Ksa
 Huxg0FmxvfKEMOwfF+dkyVVffQDnw0iA07gdxHl9B0DeAQsZw2nGhEgQ4 A==;
X-CSE-ConnectionGUID: Sq9TeJxxRcuPo+yM3Ot6vQ==
X-CSE-MsgGUID: V1U4k2c0RYOkWoYG7plH8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37406298"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="37406298"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 08:30:01 -0800
X-CSE-ConnectionGUID: v18qrzQZSay1AWkQ59kD5Q==
X-CSE-MsgGUID: p/ryfo6iT+2RrAEcgmSeEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="117382951"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 08:30:01 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 08:29:59 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 08:29:59 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 08:29:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eLxZ4YUtVY8MkBmq0xdAKVK+d+zhc7aR2Amtuk5tNpXiL2U8xnFFN4sEGEPa5dEIwAz7FOzbbU8WBDkx9KR/aCkuhCUjLz6Jq5e/VuQh152fNORiXJSG5ursTrTHrInmmNojRgnXLJLzZtM/S43q+d1dD5TCBnfdwXJ9QqxI5T7BHwbXHqo+EDN5Ax54YoDCFlsTh0gBigH87SG11CCr5EBTJGSqeNkE445Bn4z0uNjFrGosK2SRtbsAaHZNK1SwhZmvW2qDlx2IBOIcvk2B8LmCwwb0ea0+AvIbVA80zffIGNoK+bVYC96MQi/+rj4SX1tx+JBkj+X6Q35HWxtuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPTao1ytIocOVB8NPd0qcRabkyFc9hZQfZAIRWMWn+I=;
 b=OzLc3dKUKGFKD0nyhbsS+qTTw5P0qC3P4YGl0vBzuSlDvhd5qHVFHTH5e1VLQGvv9+vy0lG/TZEqudUdhbuXoKTlKjoD8/xDeQquEEkyteDSuDE7wn9L54w7j4ujePfSNS6Bk9t6xp6MJjHhMm++FfpBOiM9gH489ybzDuSd1TVJzHtK+7Sfqoly4mWuz1gnKdSGPozB4s3/B6DtzQ2YG7a5X+J4Z3DOQ/fJV9wi9Z0p2sfVmrjgDjlbfy3bH5F54IuEw6Xn7OZ5t6dypLG9kMZNkSKpuJLOmQpLLTxsADeet5mKt0RcEI0E6fj2kvB+WYDwQq+FvZF20yZB2050rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22)
 by SA0PR11MB4543.namprd11.prod.outlook.com (2603:10b6:806:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 16:29:56 +0000
Received: from DM4PR11MB7302.namprd11.prod.outlook.com
 ([fe80::9d0d:9a7a:4bef:94e9]) by DM4PR11MB7302.namprd11.prod.outlook.com
 ([fe80::9d0d:9a7a:4bef:94e9%3]) with mapi id 15.20.8093.023; Thu, 5 Dec 2024
 16:29:56 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv2 01/10] drm/crtc: Add histogram properties
Thread-Topic: [PATCHv2 01/10] drm/crtc: Add histogram properties
Thread-Index: AQHbRi5j+Y4IG5jE+0yUaPGdRX/PhrLV+CQAgAFQi/CAAEJHgIAATPcQ
Date: Thu, 5 Dec 2024 16:29:55 +0000
Message-ID: <DM4PR11MB7302BD8409DEC33EF2F1B0BFBA302@DM4PR11MB7302.namprd11.prod.outlook.com>
References: <20241204091456.1785858-1-arun.r.murthy@intel.com>
 <s3gkb36ga2pxmxocrhcjp5pcgbewx4x3joiyrpld3th4r4fvyi@rkpgbu4ekst3>
 <IA0PR11MB7307F22883ACF3AD873C3697BA302@IA0PR11MB7307.namprd11.prod.outlook.com>
 <CAA8EJpp4HjyEL9XSLzXr6tG7+8M2FmZO1S2WrLXmP64J_aKs-w@mail.gmail.com>
In-Reply-To: <CAA8EJpp4HjyEL9XSLzXr6tG7+8M2FmZO1S2WrLXmP64J_aKs-w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7302:EE_|SA0PR11MB4543:EE_
x-ms-office365-filtering-correlation-id: 81f2d33b-0112-4721-74f1-08dd154a0dd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NC9oTkxMOTdUeW44eVgvN0JrZmxyNjFTUjJ0OC96RUpBakttUW1icWVadkUr?=
 =?utf-8?B?QTdoejFYQ2tiVDc1T0Z1MU8yZUJtdVF4K25ZVW5leWxGSnltMkJpeURtTldY?=
 =?utf-8?B?UU5wQUd2cU1qcWtscmxJUWNPTWtCOWcvRGRXYmFvL24vM0wxY0pnU05URUVL?=
 =?utf-8?B?RjhudzBuWThkTnprZitWS3NERFJBREJMMC91dTdyaHdmUkk4dnp6ZHF3d2F1?=
 =?utf-8?B?WFh3VC84UWdFdFo4MG9Ld1BUenVIaUZMd2JuZlNDV0tsd251T29NWCtrOUNS?=
 =?utf-8?B?bER3bWFWTDRNWFRSakVoMDVlQkIyN3U3WEhJM2VCWGRHOGk5WFBNWnczS2ZQ?=
 =?utf-8?B?aGQvd1RDalNSZ1h0L0dZaWdvb3VhcFZCVzlZb0JSUXg2MTJaNWMzd2FkckFE?=
 =?utf-8?B?Z1NTcUdCTjMzbjE3MmR4K1luc1hFSmVaNUdVWkh4SjFOT002L0xmcFVTTGtr?=
 =?utf-8?B?MVhZOHFuWjdFWHQyZVEyWXpoS0Y5eFdyVXoxRFM1b2xwRVRNbUt0dTROOTAx?=
 =?utf-8?B?NlRxOGxMMllOelhySkl0RmxIOXZTNzJqRk5VTktRVE5VMEhtSUpkL1FxQmkv?=
 =?utf-8?B?bHZiVHVTQkpUMzUrelFuMi9uT0daZWUwRnA2TVlyWlY5ZDF4Y0VkbmxSek1h?=
 =?utf-8?B?Ynk0YngxMzFvNExrUFZRQXowb1BRK0VoMi9sUUdLV2NNMWsvMVM1Yjhucldm?=
 =?utf-8?B?RGI0d1o1MW5wNmE1SWV2czFwK3VjRDRxVEJoZzd3blJWSjUzeWVoYmFzSmZV?=
 =?utf-8?B?VnF5VENxSjVxQXN5eDlyM3F5Mkg4NE1VRmhQMnV2NFlwT2k2LzVZemxpQVBR?=
 =?utf-8?B?emhtT3FYTTRNRVNZck1BNE5JSkJqcFk4MkM1SHZRMnhpaWUybG44TXdDTGhu?=
 =?utf-8?B?eTEwMTlzVFArbjVvMXZWZ0pjYmFNQ0RmbGkwakhUOUtrY2lFNFZMWFBsSlYv?=
 =?utf-8?B?Z3BIak5yaUxPNEpmU0E3TVJJL3p5dlZaQVFZbWF5YlBTUTZvVFphaTRoWFB5?=
 =?utf-8?B?VXJGdHc2N3YwcUxnSzZxS1ZuYmhZSi9MTDZaSTlaWURRL25lbnFJaUR0ZDVT?=
 =?utf-8?B?K1J4ek8zYlB5UC9YSUswNFRKZ3pjd0g3NFdYd0E5MDcyekRFd28ybXVWTEtV?=
 =?utf-8?B?dXltLzRIOXdPemlmTUVJVVpUNWR4bGtWdTdzWHVUNnMwTUwwakZ2THdCcmQ0?=
 =?utf-8?B?bzlocFp2d004UEZMMXlNbnY2bUJjVWNaa2VycGFLN0NwaVZoZGZTQWxhRVEr?=
 =?utf-8?B?ZC9Dc0Z4RDhESGdPOCtLdmNDajlRZHpIN1gvZkRMUmdjQXF5ZkVMWTNtUDE3?=
 =?utf-8?B?bndQRlJNS1JVNGdwY0tEZmd5a2JyaVp2ZzVhbE5vUW5kUS83dnBWZmlqd3lF?=
 =?utf-8?B?MEhxTEtoTHFiVXZWVkNvMDNqdmxVTURSbk9LMlRIYmpVZVpFaDVjNndYYTRh?=
 =?utf-8?B?ckJqYnBOZktUOXhrYjB2dU11b0RIL1lXYWg4L1FnSi9TTTBzamtndW56eC9B?=
 =?utf-8?B?UkI4anNRbW0wck83dEZiTWNDUE4wMG1nZkpCbGVwVHdvdC9Rd2RGMDRldEpV?=
 =?utf-8?B?cmU3eXVXYWpscTdFRkJ0Vy9Fa0NGTUNNRDlDc3JHU3Q3ekFDcHdhZGNvbnNs?=
 =?utf-8?B?QVpJWUE4WW1vUjQyQ1Bsd0lsRVRydEVKZ1ZsRmlUVTZIdmUvTXQyRU9KakFD?=
 =?utf-8?B?aWhHanRQalRyczgyRFZTcHdxMnY4L3c0cTk0NXhlOTQ0Nkh2NkxxZFFaZ01G?=
 =?utf-8?B?ZzBWdTM0ZmRGMDc1aFR5b0pEelNQOFVmbU5BY2lkMzBDYWc0aUxEVkVlU203?=
 =?utf-8?Q?ezyiak3YNgSYb6zFoQp2iyeCll25MXmjUxzoU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7302.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TlhlUmJBUWRKTW1KZVA0aFN3RzQ1WDB5aXZYYldVN3ZUUzdOUDgrdVR6dnJE?=
 =?utf-8?B?LzROOHlrQXY5SVN1ZXhEQVBOWC9RbFZvTmE0ZGZnM0Qrb2VZVVdXbEl3R2l4?=
 =?utf-8?B?dzMwVW5hak5rOTJwL2NXVGVodWdEY3JMS3hVZUhqYWdFUDdoQ0I3Qm9ZWHFs?=
 =?utf-8?B?YTRkMGVxazVySHU1Zk5ZcXJwMi9INXczUUFhY2w0aFVyUy8wSmc3cmtpR3pR?=
 =?utf-8?B?RHo3WEVFcTdlTXF4bGgydFBvZzJlRTNxdEcvKy93U2ZuTmRIcjR1dXpDUlRu?=
 =?utf-8?B?Y3VvTlNIRkVMV1pJaDdiRUcraXBtcU5JOWdEbzJ5YlBhYkc3d21tRFdLVU1V?=
 =?utf-8?B?QzRNMFdaMjVHK29EdHg4VDk0NEI2dU9kUEh3ZFVNT0xtQXhVZGRlaVhvOVlG?=
 =?utf-8?B?eGVROHhkY0NtMi9lNkNtMStwMHc2KzViU2ZWSlRtYVRYNHFqblVpVVdONGlV?=
 =?utf-8?B?ek1pV2ZaSHZYYUluNnd5N3Jnc1lobkQ4VUhZdDhVWXdSZ1htb3QzbUtEVWtp?=
 =?utf-8?B?WWlnRTFRWmwzUkp5bTFESEJTZ3Q2WjQ5NFpZeHd2RlRtMStsbWlWMVIyRzRI?=
 =?utf-8?B?RWxQdTBjYTBmTWpmMlM1WHNUSWNsZFlwMnRhc0JhSmdwY2RkRURRamVKeEZO?=
 =?utf-8?B?dG9QQzFLOVlJN1lCVlFieUxSWUE1U3ZONndsK1RjeFZvV2UwN2pWVUhXd3I0?=
 =?utf-8?B?TW1id1F2UmRLU1JCTlUvRWxzVUxRcHVicHpuZzdLVElUOHlFSEtxSU8xelg1?=
 =?utf-8?B?TldWMEQvcEFUblg2cUhjNWdaMWdBVXltRksrNzJQMFo4dFRJMkJtWCt6dVY4?=
 =?utf-8?B?dDNxL3R3Qnpsa1dYV08yZ292TkxVTkdMY29FSjJKRFRBUGQ2RzJ1THpTWlg3?=
 =?utf-8?B?eTN2REtQV0czOXdnaTBJc0xhRU9KTkpkQWF3NzB2VUV1RGI4RUNTUlFLbXhK?=
 =?utf-8?B?c0V3LzMySy9mWG5RSHNOZWUrN3JyZjNsT0ZpdFFzWEQySityZHBYbnFPR1or?=
 =?utf-8?B?MGxYMlJjRTIzQ09SWGMyMDVOKzBPZSt0aGFZOU8yM3JYNlRpVmFnOGFRSUlW?=
 =?utf-8?B?Q250eVViR3dmdE5md2FJaFdoNlh6NXdzSVdyUEptVksxdFhjcVZhMnJhVTdx?=
 =?utf-8?B?aU0xTTQ1Z1RZbU1MWnhYTGdhMXlCMzYreGdiQ0c1MGhxK0hrb0lhK29OSVV1?=
 =?utf-8?B?eEtXVUJ5SkZSMHVBSnBJTGd3SDRtbkZ4MzlJM1hhdC8xUEp3ZFo2cGJLSjRN?=
 =?utf-8?B?WGF6NUhQS0swSklSdXpTRG5BODI3alpMMzlJYmhBeGhNVVg5dkxUR3BQWDFs?=
 =?utf-8?B?bllKQzRSRjcyYTdJU0I2NnVYektyZEhYajVlL1Q3OXFCcktCSzcwK0pmTjhk?=
 =?utf-8?B?N1dSOE43RHl4RW0wRzJ5b2FxL0p1SnNQYjVnMnFqbHJISExtQVJiMmgvaEwv?=
 =?utf-8?B?enF6RnpDM1dQT2tlSFoxWFE0SEx2ZVE2d1NYTWpoVmppVml1SkJDNzdXL2hM?=
 =?utf-8?B?Zzl3VTFaa01xeGZpQXIrK0VqZ3BxZzRMZ1oyUWFGMUR6T2dUYWRyMW1mRC9O?=
 =?utf-8?B?Q0pVdXpIaTZKSDFzUlc1Qi9kZGkyV01FdVRVZXhvUnY2c2lEcWpuRFU4ckJ1?=
 =?utf-8?B?QTk0aThVNkV4VDZEdnROa2lGMUZmWVdWRWFGUWtOd2E3c21IYUUyM0R5NWpB?=
 =?utf-8?B?WXR2WjRaR1ZwSFhjd2VmLy9hUzJiSjh6cktGNndxMCtkeEV1SVpZbGdrLy96?=
 =?utf-8?B?SkV6YUVxeUlwdGF3ZTJwS1VidkowNDRRSlppWjZzQnhiRXZQRnp6Zk1xZ3I1?=
 =?utf-8?B?RUthU093NHdCVk90ZWkrUHJ0K1J4aDJUa1o3TFZ0SVY2N3NoNUtIbUNqMFRo?=
 =?utf-8?B?ZngrSWtiSkR4ZHFOeE9vSG1CamFySm5rNGJvd2RlQXVKS0pXdVB1OU9yN0t2?=
 =?utf-8?B?QlBIYlNrNS9BMU41QVV0b1lWbURjeGlHQ1BaYThyY3pleG5YTHRaM0tyVjJy?=
 =?utf-8?B?b215YTRaOVJnTitNSmozQUlvbm0wQ1ppWEJ3UU40b3RXTGVWMXFXNm5Oa2E3?=
 =?utf-8?B?TVExSkVnYUFmY01ZT0ZleGdteXZiNDhFajVkYkluQlZVbFlVSFl6ZStpQmdh?=
 =?utf-8?Q?iwLkPAvUZcC2fx1xcjB5Sh1OC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7302.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f2d33b-0112-4721-74f1-08dd154a0dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 16:29:55.9945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gC/nGkoNFMQB07VMaxigzmGru+NGGnwg7ooQUkl1aceRx4T5hEczkH8K0VKU1/UVn3dRUe0ntEnDyJjuaDN8GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4543
X-OriginatorOrg: intel.com
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

PiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IERtaXRyeSBCYXJ5
c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gPiA+IFNlbnQ6IFdlZG5lc2Rh
eSwgRGVjZW1iZXIgNCwgMjAyNCA1OjE3IFBNDQo+ID4gPiBUbzogTXVydGh5LCBBcnVuIFIgPGFy
dW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+ID4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gPiA+IGRyaS0gZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIdjIgMDEv
MTBdIGRybS9jcnRjOiBBZGQgaGlzdG9ncmFtIHByb3BlcnRpZXMNCj4gPiA+DQo+ID4gPiBPbiBX
ZWQsIERlYyAwNCwgMjAyNCBhdCAwMjo0NDo1NlBNICswNTMwLCBBcnVuIFIgTXVydGh5IHdyb3Rl
Og0KPiA+ID4gPiBBZGQgdmFyaWFibGVzIGZvciBoaXN0b2dyYW0gZHJtX3Byb3BlcnR5LCBpdHMg
Y29ycnNwb25kaW5nDQo+ID4gPiA+IGNydGNfc3RhdGUgdmFyaWFibGVzIGFuZCBkZWZpbmUgdGhl
IHN0cnVjdHVyZSBwb2ludGVkIGJ5IHRoZSBibG9iIHByb3BlcnR5Lg0KPiA+ID4gPiBzdHJ1Y3Qg
ZHJtX2hpc3RvZ3JhbSBkZWZpbmVkIGluIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCBUaGUN
Cj4gPiA+ID4gYmxvYiBkYXRhIHBvaW50ZXIgd2lsbCBiZSB0aGUgYWRkcmVzcyBvZiB0aGUgc3Ry
dWN0IGRybV9oaXN0b2dyYW0uDQo+ID4gPiA+IFRoZSBzdHJ1Y3QgZHJtX2hpc3RvZ3JhbSB3aWxs
IGJlIHVzZWQgZm9yIGJvdGggcmVhZGluZyB0aGUNCj4gPiA+ID4gaGlzdG9ncmFtIGFuZCB3cml0
aW5nIHRoZSBpbWFnZSBlbmhhbmNlZCBkYXRhLg0KPiA+ID4gPiBzdHJ1Y3QgZHJtX2hpc3RvZ3Jh
bSB7DQo+ID4gPiA+ICAgICB1NjQgZGF0YV9wdHI7DQo+ID4gPiA+ICAgICB1MzIgbnJfZWxlbWVu
dHM7DQo+ID4gPiA+IH0NCj4gPiA+ID4gVGhlIGVsZW1lbnQgZGF0YV9wdHIgaG9sZHMgdGhlIGFk
ZHJlc3Mgb2YgdGhlIGhpc3RvZ3JhbSBzdGF0aXN0aWNzDQo+ID4gPiA+IGRhdGEgYW5kICducl9l
bGVtZW50cycgcmVwcmVzZW50cyB0aGUgbnVtYmVyIG9mIGVsZW1lbnRzIHBvaW50ZWQNCj4gPiA+
ID4gYnkgdGhlIHBvaW50ZXIgaGVsZCBpbiBkYXRhX3B0ci4NCj4gPiA+ID4gVGhlIHNhbWUgZWxl
bWVudCBkYXRhX3B0ciBpbiB0ZWggc3RydWN0IGRybV9oaXN0b2dyYW0gd2hlbiB3cml0aW5nDQo+
ID4gPiA+IHRoZSBpbWFnZSBlbmFobmNlZCBkYXRhIGZyb20gdXNlciB0byBLTUQgaG9sZHMgdGhl
IGFkZHJlc3MgdG8gcGl4ZWwNCj4gZmFjdG9yLg0KPiA+ID4gPg0KPiA+ID4gPiB2MjogQWRkZWQg
YmxvYiBkZXNjcmlwdGlvbiBpbiBjb21taXQgbWVzc2FnZSAoRG1pdHJ5KQ0KPiA+ID4NCj4gPiA+
IE5vLCBpdCBpcyBub3QgYSBwcm9wZXIgZGVzY3JpcHRpb24uIFdoYXQgaXMgdGhlIGFjdHVhbCBk
YXRhIGZvcm1hdA0KPiA+ID4gaW5zaWRlIHRoZSBibG9iPyBJZiBJIHdlcmUgdG8gaW1wbGVtZW50
IGRybV9oaXN0b2dyYW0gc3VwcG9ydCBmb3IgZS5nLg0KPiA+ID4gVktNUywgd2hhdCBraW5kIG9m
IGRhdGEgc2hvdWxkIHRoZSBkcml2ZXIgZ2VuZXJhdGU/IFdoYXQgaXMgdGhlDQo+ID4gPiBmb3Jt
YXQgb2YgdGhlIHJlc3BvbnNlIGRhdGEgZnJvbSB0aGUgdXNlcnNwYWNlIGFwcD8gVGhlIEFCSQ0K
PiA+ID4gZGVzY3JpcHRpb24gc2hvdWxkIGFsbG93IGFuIGluZGVwZW5kZW50IGJ1dCBjb21wbGV0
ZWx5IGNvbXBhdGlibGUNCj4gPiA+IGltcGxlbWVudGF0aW9uIHRvIGJlIHdyaXR0ZW4gZnJvbSBz
Y3JhdGNoLg0KPiA+ID4NCj4gPiBUaGUgaGlzdG9ncmFtIGlzIGdlbmVyYXRlZCBieSB0aGUgaGFy
ZHdhcmUuDQo+ID4gSGlzdG9ncmFtIHJlcHJlc2VudHMgaW50ZWdlciB3aGljaCBpcyB0aGUgcGl4
ZWwgY291bnQgYW5kIHdoZW4gaXQNCj4gPiBjb21lcyB0byB0aGUgSUVUKEltYWdlIEVuaGFuY2Vt
ZW50KSB0byBiZSB3cml0dGVuIGJhY2sgdG8gaGFyZHdhcmUgaXRzDQo+ID4gYWdhaW4gYW4gaW50
ZWdlciwgcGl4ZWwgZmFjdG9yLg0KPiA+IElzIHRoaXMgdGhlIGluZm9ybWF0aW9uIHRoYXQgeW91
IGV4cGVjdGVkIHRvIGJlIGFkZGVkIG9yIHNvbWV0aGluZyBlbHNlPw0KPiANCj4gWW91IGFyZSBk
ZWZpbmluZyB0aGUgaW50ZXJmYWNlIGJldHdlZW4gdGhlIGtlcm5lbCBhbmQgdXNlcnNwYWNlLiBU
aGUgaW50ZXJmYWNlDQo+IHNob3VsZCBiZSBkZWZpbmVkIGluIGEgd2F5IHRoYXQgYWxsb3dzIHVz
IChkZXZlbG9wZXJzKSB0byB1bmRlcnN0YW5kIHRoZSBkYXRhLA0KPiBtYWtlIGEgZGVjaXNpb24g
d2hldGhlciBpdCBmaXRzIGEgZ2VuZXJpYyBuYW1lc3BhY2UgKHdoaWNoIG1lYW5zIHRoYXQgb3Ro
ZXINCj4gZHJpdmVycyBtdXN0IGJlIGFibGUgdG8gaW1wbGVtZW50IHRoZSBzYW1lIGludGVyZmFj
ZSksIGl0IGZpdHMgbmFtZXNwYWNlDQo+IHNwZWNpZmljIHRvIGk5MTUgLyBYZSAodGhlbiB3ZSB3
aWxsIGhhdmUgcGxhdGZvcm0tc3BlY2lmaWMgcHJvcGVydGllcyBmb3IgdGhlDQo+IGZlYXR1cmUg
dGhhdCBtaWdodCBiZSBpbXBsZW1lbnRlZCBieSBvdGhlciBwbGF0Zm9ybXMpIG9yIGl0IGRvZXNu
J3QgZml0DQo+IGFueXRoaW5nIGF0IGFsbC4NCj4gDQpTdXJlIHdpbGwgYWRkIHRoZSBhYm92ZSBp
bmZvcm1hdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIGFsc28gaW4gdGhlIGtlcm5lbCBk
b2MuDQpJZiB0aGVyZSBhcmUgbm8gb3RoZXIgcmV2aWV3IGNvbW1lbnRzLCB0aGVuIEkgd2lsbCBw
dXNoIHRoZSBuZXh0IHZlcnNpb24gb2YgcGF0Y2ggaW1wbGVtZW50aW5nIHlvdXIgY29tbWVudHMu
DQoNCj4gU28gdGhlIGRvY3VtZW50YXRpb24gbXVzdCBjb250YWluIHRoZSBzcGVjaWZpY2F0aW9u
IG9mIHRoZSBiaW5hcnkgZGF0YSBpbnNpZGUNCj4gdGhlIGJsb2JzLiBBbiBJR1QsIG1vZGV0ZXN0
IG9yIHNvbWUgb3RoZXIgY29tcG9zaXRvciBtdXN0IGJlIGFibGUgdG8gcGFyc2UNCj4gdGhlIGRh
dGEgYW5kIGdlbmVyYXRlIChzb21lKSByZXNwb25zZSB3aXRob3V0IHVzaW5nIHlvdXIgbGlicmFy
eS4NCj4gDQpJR1QgcGF0Y2ggY2FuIGJlIGxvY2F0ZWQgYXQgaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3Nlcmllcy8xMzU3ODkvIFRoaXMgaW5jbHVkZSB0ZXN0IHdpdGggYW5kIHdp
dGhvdXQgbGlicmFyeS4NClRoZSBjb3JyZXNwb25kaW5nIGNvbXBvc2l0b3IgY2hhbmdlcyBjYW4g
YmUgbG9jYXRlZCBhdCBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvbXV0dGVyLy0vbWVy
Z2VfcmVxdWVzdHMvMzg3My9kaWZmcz9jb21taXRfaWQ9MjcwODA4Y2E3YzhiZTQ4NTEzNTUzZDk1
YjRhNDc1NDFmNWQ0MDIwNg0KDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpBcnVuIFIgTXVydGh5DQot
LS0tLS0tLS0tLS0tLS0tLS0tLQ0K
