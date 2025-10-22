Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F6BFE5EC
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 00:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBD310E1A2;
	Wed, 22 Oct 2025 22:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhLeXozc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B8810E1A2;
 Wed, 22 Oct 2025 22:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761170775; x=1792706775;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=88ugJs06B+JjmClOMoOoy+b0v2CHR7JHR3bBtuPj77g=;
 b=ZhLeXozcNXq8/7Yt/4y3cGDboYjimNwAXx2sJR6gq03Y3wcvclatHijS
 cFJUtAvEE1WL7KxQDvRw343wWMVxtdsSXmtcIAw6tYooIudYNfpljqU0i
 un9KmYLvplptfxScoTDkJ7cSQAqZl5HzOteLVrChLEBusYVzpRBY6av/R
 nm+wxngtGWRizz94MISm0QQkWhsovXpKuzefN0u8Bm36G9scqu7hPvajT
 9/J3gSCCLWGpX9sb3SnX0MuJjNMUtoQPdDKoQ8o7aqJdFYNOawykzHIdW
 x8AeQXti38dmZuSTryF0rzmjGM+mAP/vkir8LMssaQ1Da7aqoYWOXqt2s g==;
X-CSE-ConnectionGUID: +MpNuzhPS0OL8jJ6ZQnLNw==
X-CSE-MsgGUID: q5v7C56kScG38yZ5kteK4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63034468"
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="63034468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:06:14 -0700
X-CSE-ConnectionGUID: sjeAd74pRBWOl8XdhC2nBA==
X-CSE-MsgGUID: bW2D6aGvRhSpFn4g14fRug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183922946"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 15:06:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:06:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 15:06:13 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 15:06:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNe4Q5QdohW0MpA4uFBCJRoXXXfaQwwmViycoFLrJM+PS+W4+USoGECflw+Q1/GiMRGyBgolwz4XIOG6bI54wVdGgEIpibugIQJucUqL7FOK18oTcN3W4puelLBEv5sOn2QEnaTMxunUSzYUekzcbNTyNXvtbGF/4MgZ5SYw/Zs4/dZa91WLcHn6XjzAAa8y7YQBIhcSn6pbYdqZmcGB7Tni19tb0jXdf61ydvM9QLz9Za3/jDdQtXKRCFZx2Km3E3yMyB8mfHJ0lI2OaNLArao2KEfa81fwMulBEPA5qDFJuEsiXQgHBZipee071jYDfWXGTNFoqd45vyFDpW1QGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOhjeuwR67zYLlx+VPj77+WFfn5Pz/b21dsJpvOBvik=;
 b=QOXlRy4TW1mZR4ia5J9bdzFSu9UH7C9y/yjOlKPaKJ9oQujYMLuVr1zRZBoGhhueMI5a73/7TC5hUq81QmYzehDzuZC5gNTW1+dA//Enwk3TQkFk62I5+TXsRREah+25TOuKPhVwLv2NwiPhM8iuz3c3IRDkFlxwy9k7fdcRES2UR6s5i+KrKBYnIGRUcR5F/9z4Ih1ELkIIIL2fXgvJV2wItP5M5Kczt6GRzjUxIyFh2qXf+pjxIZzMYQYzxWl3kTTpSTZtsejQhpACkhc7Xk0bQdDBTjZDizJK/Yj8Ei/X7gPJMHsSOFV8bPGMoO1IR3KII1rh+XMstOlSQTbDiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA4PR11MB9153.namprd11.prod.outlook.com (2603:10b6:208:56c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 22:06:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 22:06:11 +0000
Message-ID: <34891f4c-07bd-4c18-b049-5b499695b6b2@intel.com>
Date: Thu, 23 Oct 2025 00:06:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/26] drm/xe/pf: Add data structures and handlers for
 migration rings
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-5-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-5-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA4PR11MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 111b9ff5-15ac-440a-1e52-08de11b7357a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGRVQU5IekpGN2FuUDhBRWdOeTIxeGNqNWFJZ0tpRmpCc0ViMkU4OEl1VnJu?=
 =?utf-8?B?Y3NhUzNlY29ObVlLcE1SUEw3bll2bnpEVGJMYmtGZU5kZWFYUlQ3akcyK0Zo?=
 =?utf-8?B?UDlkajI1SE9QMkllaFZqcit5QWEwYWxnMG8xbktpUXdONTJGSlRlbEN1L3N3?=
 =?utf-8?B?d0lLb1RFTWx3Q2ZCWDFwenRoRytzdVpNeXQvRTNJcFNvR2R6eXlNR1lGTWVt?=
 =?utf-8?B?UzhGRW04K0lHNVlVMkRoeS9iQ3Q3a1BrL1Nzb1Y0ejB1STZWWk5hY0xiMW10?=
 =?utf-8?B?dTlkVmpnV0VvRTM4QnBBa3ZlMDdaQWg4dXV2WHc2bE9tYjJCaGVQZHc3ektF?=
 =?utf-8?B?Mk0zcVNQRmdPeWpValZYSG9tN25XbEVSckl6MFBJRTdkVGxQaUw2SkxuNm1W?=
 =?utf-8?B?ald1Ynl3dnpwd3Z6eXNFNDNWbFYrcjdqMlZSd0loRDdqT3lBdldVVW92WVpu?=
 =?utf-8?B?SmhSbVJIMEVhYldYR0h3UEpOQ0FJMU0veERZYzhNbHY0RWxSN1ZOa3lvbDEy?=
 =?utf-8?B?K2g5Q2hOclhZQ3BoTUJDU0ZlcFVBZW1ybUtBNGpCZEt3eThNNmQya3BGNUVV?=
 =?utf-8?B?blFxZ3ZwVDJvejBtYWV4cXJaVElPRkFHeHRYNk85bkR5Z0hhUTFTQmRxeUMx?=
 =?utf-8?B?c2xjcHpjTVBVZUQvTDlIVHBLNFBSdlBiRHdnOHFDUkVXS3BTYlRiWGpRQVp2?=
 =?utf-8?B?b1hZTVRjanVHWXpueWRzMTZ5eUkySEtFam9vVFE3NmxkQkwwd3E3STkyRVBK?=
 =?utf-8?B?ZDlqRFc2bVpmZDc0SmZRaWtISEpmQVlpVThPMnludFZBdkxTK0dWbGRIS0E2?=
 =?utf-8?B?dGRyTm5hVnhrZEc0cDVTMWI4YW55SXBUSWJsY2NjOEpDSjMxd2RxZ2JwVWVx?=
 =?utf-8?B?T3pRR0F4M1NYWXR3bElhQ2Vxc2Z1ZFRnNm1JV3p3S3A4YmRZVENTUXRHeVQ4?=
 =?utf-8?B?K0tLZ2VBSEpNZnVzZmxiTDhranZFWVhFMVNtdG4rZWlrWHpvdm5helJpNndp?=
 =?utf-8?B?UXFzZmo5bEFKOFdISCs4dUFGenRoUlA4VjJjQ2gwQnlvMzZhR2IzRnVVbHE1?=
 =?utf-8?B?SnJUNjVIcEU1SThNa21STlcvK28xS0RyK3BEcEZud3RTNHVPc2RGNmVKNzRT?=
 =?utf-8?B?WENVMVljMERaV0RpMitmOGEwQ3JXMXBXdDdoNVhGM0pCR3ZiYVl0QjVhODUw?=
 =?utf-8?B?TlN1UVlBd3RtWktuVmFOUFpTaDdwM1p2QUN0emRnU3M0U3JXeWZ4S284WXNx?=
 =?utf-8?B?WFBMQWgrUU9MY1JCQ0ZwSWR2MG9oTy9xOWtPTWNYdElvcjVCWFoxNnFMQ21Y?=
 =?utf-8?B?QmlZclVMb3VYczFFVWRWdVJrTk9WRkh3MUVCRjcrcTBLOFR4bEx1WktyRzh1?=
 =?utf-8?B?OHVlRDBkNnlsdmhGK1JuUGFxRDlkOEJPTFF1QTd4Q2VtUm9OZ0Q0azY0bVZO?=
 =?utf-8?B?ZVhxUjZYdXlxT1VMQTBIdEUveVFveHlYaTM2N0JsdEVES1hnWm1oOEJLTVVo?=
 =?utf-8?B?VHlTVk53aWlFR3VMQVN0Qk5XMThmcVd0SUxTOXNsZjZwdVdWTW5BYllmT1VC?=
 =?utf-8?B?aG1ORTNaNW5Gc3JtVE1WaUYwV1YxV0pOc1BDZTJiNVNDVCtBTW8vTTN4d3NL?=
 =?utf-8?B?NThxSW9CdDlHNmdZa0VKU0locnRDVThQU05CK2Q0aU9HbUFuRllQM1FxaWVI?=
 =?utf-8?B?cHVMNjZCQzhXT3I5SytpeU1tUDdXWk5yN21JajJNNUg1ek1oenFHb1d5bHBp?=
 =?utf-8?B?WlVxMkdXcDA3ZjVnTDFoRE9UR2FxTitWNThSSXVDMGpyeWoxd2dZS054QjhS?=
 =?utf-8?B?SE01eXFqcmd6d3NvV2hRMGRtamVQUStrR3BZL1pOTWlVR0VXdTlMVkVqTFRG?=
 =?utf-8?B?N3NVMjZEb2VXa0wvRXhxbzlMb1JVMk5QbG9PTDRZOGNuWDY5ZzIwV3NpcE5u?=
 =?utf-8?B?bkNORzVKOW9DN0lUU1l1QkU5bzJXbVdaMFk0R09UeVdoSzdOdi9hZE81S09t?=
 =?utf-8?Q?wIs6wOABysRx9t4bRyLtO9PLGmdUx0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXdkQlhKRHFLMGJ0S3U2MS83elMzN0lmMFVoRmdiTDhZM2JQVFByeXRJN3Js?=
 =?utf-8?B?eXE5SEJiWnBQbjV5STR3cVVudEtCUmI1RStNZlkvOEIzeTlGSUZwR0xqRzcv?=
 =?utf-8?B?S1FpMVRvYzVIdUV4M2RaNWlDckRrUW8wci81ellVNmVTZGZ1anVhWEJoM3hB?=
 =?utf-8?B?OU9wN1VmblVWMXZyWFNjeWMrKzUyVkhTdjFyTWNLNEdIZzEyUU05MEhIa3Bp?=
 =?utf-8?B?by9pbTFEMUVIWlE0OHlrSjJuQ2pSeGhtVmNrWFBWRVl2Smh5dHhCTUhySDNN?=
 =?utf-8?B?Y0x0OXpaQ2RmeXhMMmhYbWlETXRpczVKKzRKRE02bmNKUDhZMFZjUStUL1dV?=
 =?utf-8?B?OXJub1N1Q1o0eDhoK1VLUVhoamhyeFNZSlpJaGF3SjR5U3luVDVhOXlGSHdv?=
 =?utf-8?B?Y2c5cXFReFFIWGJtTDRYeU84TjlXdXFVcXg0SDByRDVvZ29rdmFOZHlvN3o3?=
 =?utf-8?B?aS9KTGs0ZlRnMVY0R3NKUEozS2NRQXlrYXh5RzdmSjkvSFFRY0NSZEdOV2Fw?=
 =?utf-8?B?M2lsMWY4RSt3dG8yVCtOcDVCNU1JVU9XMjdNbitCOXY2VGg4RHpSN21pbkpp?=
 =?utf-8?B?NEIxbThSUzk3aGdXcDc2SWRiUUlxYitaZDhVV1NydHlUVCs2UnN3b0VKVDlW?=
 =?utf-8?B?K2VsRFRCNDQwdUl6RFREVEhUNjB5RVBFYzRidUZZRWZiRkQ5R2VXNnJBZlRr?=
 =?utf-8?B?RWt4MHRQRUNJV290YjE3cldycXR3d0p1MnhWVHRwQXV0UWlZeVRONmZycUtw?=
 =?utf-8?B?VnkwY1U3eXpNbWY3RFlhWlN0MHd3MEVucy8xRVBqS0RqTUJUR2x1dlp6M1Q0?=
 =?utf-8?B?cTFCUk95Mjg3cWVPYXk5RUtrRUhRRkFXOUhkQVg3ME5mZTAyZTJvYTBnWVpY?=
 =?utf-8?B?YkdOU2tia2F1cEZPa0NwcjlOaWkrcVJscXJlREdzY21yTW0vM1d3VEh1Tm9M?=
 =?utf-8?B?ZzJBSkpkaUdxcHVqOEFsWko2V2lXMVN5TlJJVjJvTFVZWkVnLzZzcVNzY3BO?=
 =?utf-8?B?WjVuZEkrZXo3M0N2Y2ZLNXNQQk1SUkhzRVVKdkpoQXovWDkyVTdUdGhvV00y?=
 =?utf-8?B?UHBvZXZXNTdzdStLT2VtcXVUTUpCOFFPUlo0WFlTQnRYSDdRcEhnZWZ0VUU2?=
 =?utf-8?B?TmNjRldJNWJtYXpqdjlXeVJCbjNkSEl3UXZRZVZYV0hLZzU0YmZDb2FOZzUr?=
 =?utf-8?B?VVo3KzdObVBDN3dwallxNmZhbndkUmx2RjQzSFNodDV1aERKY0QremRzQlZV?=
 =?utf-8?B?YVhNMHFlQkFTVmxYaTNuNEF5dHJVRkJrMWdKVjBwN3dzUFM3WkVpcktMTElU?=
 =?utf-8?B?WU80QXRJcTJ1ZVBJZG1rYTNMdEMxbEtrK0ptOXZ2bGhSb0lOT01wWWYyNSs2?=
 =?utf-8?B?OC9oWEFaazJwQmtaSEsxd3gwWDE4bG1ndE9FK0FMdnpIODYvTkUzNFlMUDA0?=
 =?utf-8?B?NmFRenFwMGZwclVqTTFlS2lud0EyTCt1WXNjUVNXUkJQMnMxZWkwMVRmRm5y?=
 =?utf-8?B?eng5U21vc0dJNUY5b2FJVjBMY0dKRVRldi83TmhJeWVRWDJIRDV4MWpFRDRB?=
 =?utf-8?B?OEViZVYyc1AyQzQycE40MEVRNGZEWnQyYXM0STJEL1dVekVvRE1MUFZLVTFa?=
 =?utf-8?B?Nkd5bnZCckM1SWZBbGxlKytNUDhtSTRzR2RQbWZ2bFlTRnRjVUxyMFpwYWZF?=
 =?utf-8?B?dkRBTmZ3SGN2bTdaS0lqaWJpaHRwWmNMTXlsZG9rd0l2UkVLd2JHdTA4ZSts?=
 =?utf-8?B?ZUt1QXgrSDgwV2lxVCs4QkZmNlp1RlI5R1hNNzVrRGRoVFR0YWwxRXJBbkQ1?=
 =?utf-8?B?NkdXeXJvenVYWFpNNU5UTHB6QUtVck9OcHNDbzY5UDluK0dIRk5tYzBGbHFt?=
 =?utf-8?B?c3ZCWDFGdGlnUFZlUXRhVUZEK0Iwc1duTitYYzVQSU9WOXQ2OGlqRE40NFJU?=
 =?utf-8?B?SXpTM0JMaGhHZncwZnl5R2dVcXFDa01ReTc1M0lHaDBBeHUyUTJFSm84cGI0?=
 =?utf-8?B?Q1o4emhwbjJSMjJqakVjdkswd1BuYmNqOWtjZEI5V3puY3dCc0hWNHJ1VUgw?=
 =?utf-8?B?cERWV0o3VGJNZk9tL1RkamxrMlpqZ3Z5YUFrdTBKZWZPVmdzSkp0bmVFcjRs?=
 =?utf-8?B?dHVnOG9BQXh6REI5bkZIL1ROU2ZKZVhBd09qaC9EcGdiQ3cvYlIrRFlBZVdG?=
 =?utf-8?B?Wmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 111b9ff5-15ac-440a-1e52-08de11b7357a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 22:06:10.9880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SpSibXvEOWMw7h8bpEfmnKONFxmNuU6QYuR/UdyP9rYBrPrtbVOlLFWFDFput6LrDOcpXaw+W1uM4PstYgaWi/uu/lJOQkeVWP75hukZyuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9153
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



On 10/22/2025 12:41 AM, Michał Winiarski wrote:
> Migration data is queued in a per-GT ptr_ring to decouple the worker
> responsible for handling the data transfer from the .read() and .write()
> syscalls.
> Add the data structures and handlers that will be used in future
> commits.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 259 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +-
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 183 +++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 143 ++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  58 ++++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   3 +
>  11 files changed, 684 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index b770916e88e53..cad73fdaee93c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -19,6 +19,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_tile.h"
>  
> @@ -185,9 +186,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(PAUSE_FAILED);
>  	CASE2STR(PAUSED);
>  	CASE2STR(SAVE_WIP);
> +	CASE2STR(SAVE_PROCESS_DATA);
> +	CASE2STR(SAVE_WAIT_DATA);
> +	CASE2STR(SAVE_DATA_DONE);
>  	CASE2STR(SAVE_FAILED);
>  	CASE2STR(SAVED);
>  	CASE2STR(RESTORE_WIP);
> +	CASE2STR(RESTORE_PROCESS_DATA);
> +	CASE2STR(RESTORE_WAIT_DATA);
> +	CASE2STR(RESTORE_DATA_DONE);
>  	CASE2STR(RESTORE_FAILED);
>  	CASE2STR(RESTORED);
>  	CASE2STR(RESUME_WIP);
> @@ -804,9 +811,50 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  	return -ECANCELED;
>  }
>  
> +/**
> + * DOC: The VF SAVE state machine
> + *
> + * SAVE extends the PAUSED state.
> + *
> + * The VF SAVE state machine looks like::
> + *
> + * ....PAUSED....................................................
> + * :                                                            :
> + * :     (O)<---------o                                         :
> + * :      |            \                                        :
> + * :    save          (SAVED)    (SAVE_FAILED)                  :
> + * :      |               ^           ^                         :
> + * :      |               |           |                         :
> + * :  ....V...............o...........o......SAVE_WIP.........  :
> + * :  :   |               |           |                      :  :
> + * :  :   |             empty         |                      :  :
> + * :  :   |               |           |                      :  :
> + * :  :   |               |           |                      :  :
> + * :  :   |           DATA_DONE       |                      :  :
> + * :  :   |               ^           |                      :  :
> + * :  :   |               |        error                     :  :
> + * :  :   |            no_data       /                       :  :
> + * :  :   |              /          /                        :  :
> + * :  :   |             /          /                         :  :
> + * :  :   |            /          /                          :  :
> + * :  :   o---------->PROCESS_DATA<----consume               :  :
> + * :  :                \                      \              :  :
> + * :  :                 \                      \             :  :
> + * :  :                  \                      \            :  :
> + * :  :                   ring_full----->WAIT_DATA           :  :
> + * :  :                                                      :  :
> + * :  :......................................................:  :
> + * :............................................................:

this will not render correctly (missing extra indent, RESTORE_WIP below is fine)

> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
>  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +	}
>  }
>  
>  static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> @@ -821,12 +869,39 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
>  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
>  }
>  
> +static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return 0;
> +}
> +
>  static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> +	int ret;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
>  		return false;
>  
> -	pf_enter_vf_saved(gt, vfid);
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);

this seems to be done too early

> +	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {

you should enter(WAIT_DATA) here

> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);

and don't re-enter(PROCESS_DATA) as we shouldn't be in both sub-states at the same time

transition from WAIT to PROCESS shall be done in

	pf_exit_vf_wait(gt, vf)
	{
		if (exit(WAIT))
			enter(PROCESS_DATA)
			queue
	}

called from xe_gt_sriov_pf_control_process_save_data()

> +
> +		return true;
> +	}
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> +
> +	ret = pf_handle_vf_save_data(gt, vfid);
> +	if (ret == -EAGAIN)
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +	else if (ret)
> +		pf_enter_vf_save_failed(gt, vfid);
> +	else
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
>  
>  	return true;
>  }
> @@ -834,6 +909,7 @@ static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
>  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
>  		pf_enter_vf_wip(gt, vfid);
>  		pf_queue_vf(gt, vfid);
>  		return true;
> @@ -842,6 +918,36 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + */
> +void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> +		return;
> +
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
> +		pf_queue_vf(gt, vfid);

this should wrapped into:

	exit_vf_wait_data()

where actual transition to PROCESS will happen

> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
>   * @gt: the &xe_gt
> @@ -887,19 +993,62 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
> -		pf_enter_vf_mismatch(gt, vfid);
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
> +		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
>  		return -EIO;
>  	}
>  
>  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +	pf_enter_vf_saved(gt, vfid);
>  
>  	return 0;
>  }
>  
> +/**
> + * DOC: The VF RESTORE state machine
> + *
> + * RESTORE extends the PAUSED state.
> + *
> + * The VF RESTORE state machine looks like::
> + *
> + *  ....PAUSED....................................................
> + *  :                                                            :
> + *  :     (O)<---------o                                         :
> + *  :      |            \                                        :
> + *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
> + *  :      |               ^           ^                         :
> + *  :      |               |           |                         :
> + *  :  ....V...............o...........o......RESTORE_WIP......  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |             empty         |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |           DATA_DONE       |                      :  :
> + *  :  :   |               ^           |                      :  :
> + *  :  :   |               |        error                     :  :
> + *  :  :   |           trailer        /                       :  :
> + *  :  :   |              /          /                        :  :
> + *  :  :   |             /          /                         :  :
> + *  :  :   |            /          /                          :  :
> + *  :  :   o---------->PROCESS_DATA<----produce               :  :
> + *  :  :                \                      \              :  :
> + *  :  :                 \                      \             :  :
> + *  :  :                  \                      \            :  :
> + *  :  :                   ring_empty---->WAIT_DATA           :  :
> + *  :  :                                                      :  :
> + *  :  :......................................................:  :
> + *  :............................................................:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */
>  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> +	}
>  }
>  
>  static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> @@ -914,12 +1063,50 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
>  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
>  }
>  
> +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int

no need to split the line

> +pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> +
> +	xe_gt_assert(gt, data);
> +
> +	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> +
> +	return 0;
> +}
> +
>  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> +	int ret;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
>  		return false;
>  
> -	pf_enter_vf_restored(gt, vfid);
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);

maybe you shouldn't enter(WAIT_DATA) here

> +	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {

but here

> +		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {

hmm, there should be no direct transition from WAIT_DATA to DONE

> +			pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> +			pf_enter_vf_restored(gt, vfid);
> +
> +			return true;
> +		}

or just here

> +
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);

and transition back to PROCESS only on exit(WAIT) called below

> +		return true;
> +	}
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> +
> +	ret = pf_handle_vf_restore_data(gt, vfid);
> +	if (ret)
> +		pf_enter_vf_restore_failed(gt, vfid);
> +	else
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  
>  	return true;
>  }
> @@ -927,6 +1114,7 @@ static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
>  static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  		pf_enter_vf_wip(gt, vfid);
>  		pf_queue_vf(gt, vfid);
>  		return true;
> @@ -935,6 +1123,41 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
> +{

shouldn't we have additional state checks here?

	expect(RESTORE_WIP)
	expect(RESTORE_PROCESS_DATA) ?

this one below just looks for one-time entry, but can we really enter anytime ?

> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + */
> +void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
> +		pf_queue_vf(gt, vfid);

IMO the transition to PROCESS shall be also done as part of exit(WAIT_DATA)

> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
>   * @gt: the &xe_gt
> @@ -1000,11 +1223,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
>  {
>  	int ret;
>  
> -	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> -		ret = pf_wait_vf_restore_done(gt, vfid);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = pf_wait_vf_restore_done(gt, vfid);
> +	if (ret)
> +		return ret;
>  
>  	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
>  		pf_enter_vf_mismatch(gt, vfid);
> @@ -1703,9 +1924,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
>  	if (pf_exit_vf_pause_save_guc(gt, vfid))
>  		return true;
>  
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
> +		return false;
> +	}
> +
>  	if (pf_handle_vf_save(gt, vfid))
>  		return true;
>  
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
> +		return false;
> +	}
> +
>  	if (pf_handle_vf_restore(gt, vfid))
>  		return true;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index abc233f6302ed..6b1ab339e3b73 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -14,12 +14,14 @@ struct xe_gt;
>  int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
>  
> -bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
> -
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
> +void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
> +void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index e113dc98b33ce..6e19a8ea88f0b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -32,9 +32,15 @@
>   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
>   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
>   * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> + * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
> + * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
> + * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
>   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
>   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
>   * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
> + * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
> + * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
> + * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
>   * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
>   * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
>   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> @@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_PAUSED,
>  
>  	XE_GT_SRIOV_STATE_SAVE_WIP,
> +	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
> +	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
> +	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_SAVE_FAILED,
>  	XE_GT_SRIOV_STATE_SAVED,
>  
>  	XE_GT_SRIOV_STATE_RESTORE_WIP,
> +	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
> +	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
> +	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_RESTORE_FAILED,
>  	XE_GT_SRIOV_STATE_RESTORED,
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index ca28f45aaf481..b6ffd982d6007 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -7,6 +7,7 @@
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "xe_bo.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> @@ -15,6 +16,17 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
>  
> +#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> +
> +static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return &gt->sriov.pf.vfs[vfid].migration;
> +}
> +
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
>  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
>  				      u64 addr, u32 ndwords)
> @@ -382,6 +394,162 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +/**
> + * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Return: true if the ring is empty, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Return: true if the ring is full, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @data: &xe_sriov_migration_data packet
> + *
> + * Called by the save migration data producer (PF SR-IOV Control worker) when
> + * processing migration data.
> + * Wakes up the save migration data consumer (userspace), that is potentially
> + * waiting for data when the ring is empty.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data)
> +{
> +	int ret;
> +
> +	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> +	if (ret)
> +		return ret;
> +
> +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Called by the restore migration data consumer (PF SR-IOV Control worker) when
> + * processing migration data.
> + * Wakes up the restore migration data producer (userspace), that is
> + * potentially waiting to add more data when the ring is full.
> + *
> + * Return: Pointer to &struct xe_sriov_migration_data on success,
> + *	   NULL if ring is empty.
> + */
> +struct xe_sriov_migration_data *
> +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +	struct xe_sriov_migration_data *data;
> +
> +	data = ptr_ring_consume(&migration->ring);
> +	if (data)
> +		wake_up_all(wq);
> +
> +	return data;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @data: &xe_sriov_migration_data packet
> + *
> + * Called by the restore migration data producer (userspace) when processing
> + * migration data.
> + * If the ring is full, waits until there is space.
> + * Queues the restore migration data consumer (PF SR-IOV Control worker), that
> + * is potentially waiting for data when the ring is empty.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> +					     struct xe_sriov_migration_data *data)
> +{
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	int ret;
> +
> +	xe_gt_assert(gt, data->tile == gt->tile->id);
> +	xe_gt_assert(gt, data->gt == gt->info.id);
> +
> +	while (1) {

or for (;;)

> +		ret = ptr_ring_produce(&migration->ring, data);
> +		if (!ret)
> +			break;
> +
> +		ret = wait_event_interruptible(*wq, !ptr_ring_full(&migration->ring));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Called by the save migration data consumer (userspace) when
> + * processing migration data.
> + * Queues the save migration data producer (PF SR-IOV Control worker), that is
> + * potentially waiting to add more data when the ring is full.
> + *
> + * Return: Pointer to &struct xe_sriov_migration_data on success,
> + *	   NULL if ring is empty and there's no more data available,
> + *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
> + */
> +struct xe_sriov_migration_data *
> +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct xe_sriov_migration_data *data;
> +
> +	data = ptr_ring_consume(&migration->ring);
> +	if (data) {
> +		xe_gt_sriov_pf_control_process_save_data(gt, vfid);
> +		return data;
> +	}
> +
> +	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> +		return NULL;
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +static void action_ring_cleanup(struct drm_device *dev, void *arg)
> +{
> +	struct ptr_ring *r = arg;
> +
> +	ptr_ring_cleanup(r, NULL);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
>   * @gt: the &xe_gt
> @@ -393,6 +561,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, totalvfs;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> @@ -404,5 +573,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++) {
> +		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
> +
> +		err = ptr_ring_init(&migration->ring,
> +				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
> +		if (err)
> +			return err;
> +
> +		err = drmm_add_action_or_reset(&xe->drm, action_ring_cleanup, &migration->ring);

should we wait until drmm cleanup or devm cleanup ?


> +		if (err)
> +			return err;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 09faeae00ddbb..9e67f18ded205 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -9,11 +9,25 @@
>  #include <linux/types.h>
>  
>  struct xe_gt;
> +struct xe_sriov_migration_data;
>  
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>  
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> +
> +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data);
> +struct xe_sriov_migration_data *
> +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
> +
> +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> +					     struct xe_sriov_migration_data *data);
> +struct xe_sriov_migration_data *
> +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
> +
>  #ifdef CONFIG_DEBUG_FS
>  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
>  						char __user *buf, size_t count, loff_t *pos);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 9d672feac5f04..84be6fac16c8b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/mutex.h>
> +#include <linux/ptr_ring.h>
>  #include <linux/types.h>
>  
>  /**
> @@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
>  	} guc;
>  };
>  
> +/**
> + * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
> + *
> + * Used by the PF driver to maintain per-VF migration data.
> + */
> +struct xe_gt_sriov_migration_data {
> +	/** @ring: queue containing VF save / restore migration data */
> +	struct ptr_ring ring;
> +};
> +
>  /**
>   * struct xe_gt_sriov_pf_migration - GT-level data.
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index a64a6835ad656..812e74d3f8f80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
>  
>  	/** @snapshot: snapshot of the VF state data */
>  	struct xe_gt_sriov_state_snapshot snapshot;
> +
> +	/** @migration: per-VF migration data. */
> +	struct xe_gt_sriov_migration_data migration;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 8c523c392f98b..eaf581317bdef 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -3,8 +3,36 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_pf_migration.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_printk.h"
> +
> +static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Return: pointer to the migration waitqueue.
> + */
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> +{
> +	return &pf_pick_migration(xe, vfid)->wq;
> +}
>  
>  /**
>   * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> @@ -33,9 +61,124 @@ static bool pf_check_migration_support(struct xe_device *xe)
>   */
>  int xe_sriov_pf_migration_init(struct xe_device *xe)
>  {
> +	unsigned int n, totalvfs;
> +
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
>  	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> +	if (!xe_sriov_pf_migration_supported(xe))
> +		return 0;
> +
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++) {
> +		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
> +
> +		init_waitqueue_head(&migration->wq);
> +	}
>  
>  	return 0;
>  }
> +
> +static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		if (!xe_gt_sriov_pf_migration_ring_empty(gt, vfid) ||
> +		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static struct xe_sriov_migration_data *
> +pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data *data;
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +	bool more_data = false;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
> +		if (data && PTR_ERR(data) != EAGAIN)
> +			return data;
> +		if (PTR_ERR(data) == -EAGAIN)
> +			more_data = true;
> +	}
> +
> +	if (!more_data)
> +		return NULL;
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +/**
> + * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Called by the save migration data consumer (userspace) when
> + * processing migration data.
> + * If there is no migration data to process, wait until more data is available.
> + *
> + * Return: Pointer to &xe_sriov_migration_data on success,
> + *	   NULL if ring is empty and no more migration data is expected,
> + *	   ERR_PTR value in case of error.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +struct xe_sriov_migration_data *
> +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, vfid);
> +	struct xe_sriov_migration_data *data;
> +	int ret;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	while (1) {
> +		data = pf_migration_consume(xe, vfid);
> +		if (PTR_ERR(data) != -EAGAIN)
> +			goto out;

just
			break; ?

> +
> +		ret = wait_event_interruptible(migration->wq,
> +					       pf_migration_data_ready(xe, vfid));
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +out:
> +	return data;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @data: Pointer to &xe_sriov_migration_data
> + *
> + * Called by the restore migration data producer (userspace) when processing
> + * migration data.
> + * If the underlying data structure is full, wait until there is space.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data)
> +{
> +	struct xe_gt *gt;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	gt = xe_device_get_gt(xe, data->gt);
> +	if (!gt || data->tile != gt->tile->id) {
> +		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> +					 vfid, data->tile, data->gt);
> +		return -EINVAL;
> +	}
> +
> +	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index d2b4a24165438..df81a540c246a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -7,10 +7,17 @@
>  #define _XE_SRIOV_PF_MIGRATION_H_
>  
>  #include <linux/types.h>
> +#include <linux/wait.h>
>  
>  struct xe_device;
> +struct xe_sriov_migration_data;
>  
>  int xe_sriov_pf_migration_init(struct xe_device *xe);
>  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data);
> +struct xe_sriov_migration_data *
> +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index e69de29bb2d1d..2a45ee4e3ece8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
> +#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
> +
> +#include <linux/types.h>
> +#include <linux/wait.h>
> +
> +/**
> + * struct xe_sriov_migration_data - Xe SR-IOV VF migration data packet
> + */
> +struct xe_sriov_migration_data {
> +	/** @xe: Xe device */
> +	struct xe_device *xe;
> +	/** @vaddr: CPU pointer to payload data */
> +	void *vaddr;
> +	/** @remaining: payload data remaining */
> +	size_t remaining;
> +	/** @hdr_remaining: header data remaining */
> +	size_t hdr_remaining;
> +	union {
> +		/** @bo: Buffer object with migration data */
> +		struct xe_bo *bo;
> +		/** @buff: Buffer with migration data */
> +		void *buff;
> +	};
> +	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
> +		/** @hdr.version: migration data protocol version */
> +		u8 version;
> +		/** @hdr.type: migration data type */
> +		u8 type;
> +		/** @hdr.tile: migration data tile id */
> +		u8 tile;
> +		/** @hdr.gt: migration data gt id */
> +		u8 gt;
> +		/** @hdr.flags: migration data flags */
> +		u32 flags;
> +		/** @hdr.offset: offset into the resource;
> +		 * used when multiple packets of given type are used for migration
> +		 */
> +		u64 offset;
> +		/** @hdr.size: migration data size  */
> +		u64 size;
> +	);
> +};
> +
> +/**
> + * struct xe_sriov_pf_migration - Per VF device-level migration related data
> + */
> +struct xe_sriov_pf_migration {
> +	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> +	wait_queue_head_t wq;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index 24d22afeececa..c92baaa1694ca 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> +#include "xe_sriov_pf_migration_types.h"
>  #include "xe_sriov_pf_provision_types.h"
>  #include "xe_sriov_pf_service_types.h"
>  
> @@ -18,6 +19,8 @@
>  struct xe_sriov_metadata {
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_sriov_pf_service_version version;
> +	/** @migration: migration data */
> +	struct xe_sriov_pf_migration migration;
>  };
>  
>  /**

