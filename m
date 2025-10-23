Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA285C03568
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 22:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F0710E149;
	Thu, 23 Oct 2025 20:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+B2SH9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288CE10E143;
 Thu, 23 Oct 2025 20:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761250528; x=1792786528;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hPfbhKEZBIyL1nU496gJ3nHoigG7mm4AcrB3VyyMVcw=;
 b=k+B2SH9w0gCtWM3Ivbj7JzcGKyDTJUaEvGlfnuuwds20pVpkS1A/wRmp
 Rb6pzSi9yn+FzCg2+X0LgPVRW2e42Q7AtnQgX9k6ke7uwfV3lwyTiC65a
 CPQbcoEExExDD7i4Nb806662FzFcr656Jq9RJsT5u1znDOnbUG5f5/BHE
 TgpXx5DgwQh7YBnLCDoKar1y+k8cakDX4QnEwpY5Km92fsenCwudW8DbU
 KrF9XQfLTQkIyYAuTUHtmFarH1E+YbGJLzoUHdxz30xoObsC7e4h5ptVH
 KYSZoXmOlBzGPVkseFv/FUInMBaWlNJSj9bUOOqy8OcaCKoTE4eyknGfT w==;
X-CSE-ConnectionGUID: 0PCgTylQQeeazvhAdqaRTA==
X-CSE-MsgGUID: St0DKCk/T8a5vXQi1k6YlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63526320"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="63526320"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:15:27 -0700
X-CSE-ConnectionGUID: dRmjy88rTK2BJd+L5JnDDQ==
X-CSE-MsgGUID: AbY/zILXTT+LRQFSp8Ws0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184729858"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:15:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:15:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 13:15:27 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 13:15:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pp5BkMeOokINNpeZvm4g49TD6IzsRc9b46qEz9AZ3dT5VJKzxgfW6V+6LiQuRvwRe3HYhR90YCG+tD4a5cZ17SNGupIqmsJXLuS7aXcqXynT4r0oDnWAE+88pb3iVwy9GrU1mmD+nvp2Mjhwfwgeqc4GftMEP7XggnspirUN6d7OFDqO96ZlRQjRfoeMFrXCVjTnygx2XdNQHLVmdd65qApNFSQNFshUrZvJFhlC/LtP47mBYULSzW8dl2pS7y/pTjJ/PXcPbCZcAfaC6hGZgnCpcbZQaN9KkAlDWlmGiO63IO21s8q9vPNO7/jBy6A4QqHrwE6uDm9wFjWXEDxCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGeLMHY60u7lP6alhmA4giZnX5NoIE+isSCvYioAO9Y=;
 b=rZdGNLvIC5SW8lq4D9/poXwWnbIo+f8j1lVZLn087l/whSwGRuaaXT9GROQgsORuKITZ1apYGF4YBsPg+av9QGboaY49lYklU8q6/pMG+Cuzj8l+i5oXaKFl7SzkVJpM3MeV2yI2g+GaVLpmaQ+sJDWdU0gvyeOswowhfiDwFJra8X5WcgHia6JXHhUh8j96NVP65ded88pxoUSTlhBcbPOWg/4+yDy7p/uwrVD/G7VttF+eBwynJD2/aVX0hW8KVynbDPet4L2UjI1IbTvtrN/qV9ttJJRns8ZA0qy+8KrXrrY8zgiPDxrhjF08XGFqhuEQtHuX4S01CEVyLYfiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7847.namprd11.prod.outlook.com (2603:10b6:930:7c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 20:15:17 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 20:15:17 +0000
Message-ID: <37294c22-8f2f-4d14-9fcd-18730cc13564@intel.com>
Date: Thu, 23 Oct 2025 22:15:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] drm/xe/pf: Enable SR-IOV VF migration for PTL
 and BMG
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
 <20251021224133.577765-25-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021224133.577765-25-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0902CA0059.eurprd09.prod.outlook.com
 (2603:10a6:802:1::48) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: b92c07bf-114d-4658-f598-08de1270e1b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3JheFNFa3c4bElmRHdiamRuR2ZSWER5TXpDdlVpcE03Zy9oUmdzYlJCZXND?=
 =?utf-8?B?eXRSZ2RkN2YzRnZEVE52dFFaOTJONTRyUFpPV0Q2R256SmF3WW4wVmV3TjdO?=
 =?utf-8?B?bEhwSTRJcjJnZkZUWlQyekZBUENNQmxCVjJsUDJZaFk5QzhCN2NodHRBTkc3?=
 =?utf-8?B?UEplT0tiZzRLdlVHbDhYWlNPaVdWRUwyRlNBeGRUeFFUcDB2aGVmZGhzUERx?=
 =?utf-8?B?eWpJaGtUTEV3a1ByRy94aHRqSTgxZGd0LzVvZlpXdDdqUzUyU3lubnZMZW85?=
 =?utf-8?B?eWNudFlVN0Z6WnVWMDNTOXovdkh5S0NuZy9BLzNYVkUyQkFtN0JTc0ZmSjF4?=
 =?utf-8?B?K3N6ZFdzd3VIRzltVFRHZWRRamJWNktpWHh3bDA4K1l2Y1hKMGRyY1NmMitp?=
 =?utf-8?B?QWdVTlZKWGM2ZVBqTDI2dHJSNjk4SmNNUDVaM2ZGUEJwVmdMMStrUU90MDFH?=
 =?utf-8?B?YWZhTHB2WVQ4d1BWU05uaW91U0FJT2dtOGtMMW5laDZYVThqRVRueEJNOE9E?=
 =?utf-8?B?U0RYWEFndVk2VGJsMmM4Wk5ndmRhVVBxNUFwdVRVK25Dczk0WGgwS1BNd2xR?=
 =?utf-8?B?YnRFWGtCOGhmUFZSeW5YYTFIUXVKMXBOK3hudzROMlFCOTJlcmVKMUd1WXZr?=
 =?utf-8?B?dUJUQW8wTUFKdkRJb2RPeERMemJnOGFyNDVZbHNJY0pXQXBFRWluOXl2eHpp?=
 =?utf-8?B?ZHQ0eUdJMnBuRU5KMTFkRG05Y1hodEY0WlZ4UHNzeXFOeDQ4VDBPSmg5eTF6?=
 =?utf-8?B?S2o5MXpGNHpxVk5RL00xblN0a01zN1ExQW1PTnRBTzNuNmZ0RGZWVVZpVUwr?=
 =?utf-8?B?USt0QmVWaGZlaTQ1OTVweFhPaThlRUNYYVZBdzlWRzVKajdIMTVidFdidzRR?=
 =?utf-8?B?cGNIUzdDZDh1QVRoTGhJUjlFWm5zWEJMVVhrdXN6ZHBsT2g1QytmVTRiSmNF?=
 =?utf-8?B?MDNCNEpoc1FiZG9wbTFmc1NnRWQxMC9RbUUyL2pHNzVheHgvNWNhcWVUUjhl?=
 =?utf-8?B?Q3M4dlZhLzRoV05tRWdHTFp0eUtaSnArWFdaV0x5R010cythaHhEaysrczhF?=
 =?utf-8?B?NjBHenR6YVNia3o5Y21XU0RPaTAxZVN0bkZWakpmaitXZ3NzQjd0SjB2b25p?=
 =?utf-8?B?R01wSElKWkRQd3JoSHlIS3c2ejQxK2NZdEhuNm54Q1Y3RlhNcDhDazRXUUFT?=
 =?utf-8?B?YXZGN3FNeCtlRm5OSnlHb3dqTWlBcVVpR3lOOTBoNmdUSE1QMUlYN1ZwSzdE?=
 =?utf-8?B?Z1hQanVXNFhkRzU1SFJxYURweWNwN0ZFL1VkeU5rU0ZaWXJmME9xMzlIKzBt?=
 =?utf-8?B?VEVubEJWMlRLYlkzMFZDK1BXYVE0WW1JZFJnNHdsYXR3Y0ZSeGtxaGhLNXcw?=
 =?utf-8?B?SENqdEhYam8zb2d5VExxN0hCc2pmM2hLSlRNUmVPcXZQYXppdEMyN3l5ZFdR?=
 =?utf-8?B?TndOUnd1ZTErRXFHaTBqd1UrWFAyRHVXOVhUWm12U2xXV3NJeXE4RHVBeGdo?=
 =?utf-8?B?bGd6cnVocjB2cTJ3YXYxbmFwTUhsOFAvcCtXVWJYajlKeS8yUURpQythUEFX?=
 =?utf-8?B?NGVyWkFXTFFYbjMxOWpZNEhxQWF5Sm96UTIzT2Z5NDJCVVhSVXBURzJ4cUw4?=
 =?utf-8?B?WTNzRkxDVnZiNVMzQ0VYcHZManV1ZXAzN3UyWC9YRGRudW1tZjZpaE9UdC9D?=
 =?utf-8?B?Q2pCTUEvem0rOTZ1WElHYkJtdE9sV21Gc3hpTzBEOUFGT0FRYTVpYW5VVzAv?=
 =?utf-8?B?eCtCY1g2alZ5TUFUL2kvUnFXMTRweTV2ZHBkU2VieFNRYXV6bHRhai91OFlD?=
 =?utf-8?B?dnovRUxXQ3RINTdXNXN0eUs5MW4vMUVTMFdScDFSVlgzRkEySVN3cmRTanVR?=
 =?utf-8?B?Y2ZEUlJJb0dBYkVoMjZSbjZseW55RXkzV0JQL0hLSVFCTjlEK2h4d2FBRFlF?=
 =?utf-8?B?L2w5cGRvRE1Ga3hzUEFxMnIwWG1Va1JOQWZoRWlZVEd4SFZvb09RNVRYMnVO?=
 =?utf-8?Q?XDyOMc/7n7lNf5vzdSWEUgGIJTbWzg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjMvVDVTWnhCQ3BsKzVJMU4wMG5ZZ05Hb0hDYnF5cnRobUxacEdVTlE5SndM?=
 =?utf-8?B?eEI4N1JaOXhkbndQbU5ha2pGSWRCRHFoOThzTWphZTJtZEM3WkNSenNqZUVM?=
 =?utf-8?B?c2FsQVZ5U1JSN2UxTnNHVllaR3NlcTcxRFhkQndiaVFMVnJBK2tTbHZwNTNS?=
 =?utf-8?B?S3NSamtPb01udllrRXZLMTFmQVdaM2FSUEh1dlFWV2FDR2RndUhpOXNiRngy?=
 =?utf-8?B?K0pka09wVHBHVkx0enpXbDBSUUo3T0hXVEFneVpuQTRCS3dSdzd2bjVJQ3A3?=
 =?utf-8?B?eE9vc3p1dy9HQ3h3eHBhd2xtWlBDeFhiNEZHUWlvZkFWV3pOMTAraGc0Njhq?=
 =?utf-8?B?UGFUN1pXTXB4ZUNtWjVrak9XdVB6TE1sZ1AyVk9OUnpTMmNIUHBhZzdUdFFo?=
 =?utf-8?B?bWFVZVEvMm00VGNKZE9qTGlTY1lLNWxTMm93NVZ4cW5idmpwL2Zza05pMGNI?=
 =?utf-8?B?Q0NWY2tXUHJtZmptTmpjRjZlckF0OFRWc0Z2S0tuSHp2cUNvcy9zcDM2eGZt?=
 =?utf-8?B?WVEvZVJoRDhvMStoVlZ6anJqR1dHcm04WG4xcnNqRXJYemorTFgwdlNld3pr?=
 =?utf-8?B?YXY3b0ZlTEJtaCtRblg5R0hCOENNL0Urd0c2NUNBYktJTXdQaVFvbHZsWjBl?=
 =?utf-8?B?YWZMVUE4cjU2WlZjQ0drb2ZHWGdFVDVnaXNaMFNZR2c2bHRWNjZJWjlQWktj?=
 =?utf-8?B?bVpGc1FIT1FzQ0l5RzRodGptL05jYXB6aE1VNkh4RjY1ekJ0QXpDSVZ2VjFy?=
 =?utf-8?B?azZxZ2kvalNSV1d2aEpWVmFiMERJaHU0YjBsdWpCR1dseUJNNGhuQ2VjQ3VI?=
 =?utf-8?B?MmZUT0hmSEdsQ1RIdU9kcHVESU5mQkZFMXVrS2c0bkVOSlhPbHY4dzdLSlVq?=
 =?utf-8?B?TGphVnhXLzFTQllzN2s1TzdWTGFJVjIzWEVXMmllWEE4UFdKdWNIbFo0QmJU?=
 =?utf-8?B?ZHpXVW1TZkFDSEpHSk5IVXU2QXA1eVRzMjdXazhSYUVYblBhUStOZ20ySkhT?=
 =?utf-8?B?ZzFkUFRPbWw1YW1NUXJ6Mytxd3JPYUdZa3Jsekd6L2Q4eGRJd2xiS2ZMNTl2?=
 =?utf-8?B?ZVBPOWkyY3pVeDdXS1NQVGtVa1dQRUhIb0JsM2FjNzZtSDZMNnBOT0RBbmNC?=
 =?utf-8?B?eTlMOHJXQWJVaXJiU3cvbFllZ3F4RGtSNjZ5cHV1dzBOWFdVMndnS1VhZm1P?=
 =?utf-8?B?UVROSExDampONXYyMmZBM0VvbWJ3bUU3cFNYVms3NjUyWVhtZ2IxYUxKUnpJ?=
 =?utf-8?B?dHgzWEZWU0YvRkpQVVBsZy9ITDU2SXh5TmNrSXc0OVE1RVFNM1ZTa2xMVDUy?=
 =?utf-8?B?WU5LYWFUTzRTWUJyaTdmTW4wY1hqR3dZWGQ0Zk01QVE2K2psZzNLejFwMjBO?=
 =?utf-8?B?Y3h4QmV2UTUxZ1VFY1FIUGdSL3p4dEl0bmlNRGVvc2JCS2c2ZFQwYnl1ZFNx?=
 =?utf-8?B?eU4xUzE5NWNVODJjNC85NlZnWU4xYnBGT2FEK0FVY0YxSVhvdjlzeTBjOXdR?=
 =?utf-8?B?VUovSHoxUmlsaldTNGZLWFR6NjcxYmsyL0F3OS96RVFOZlZOUWplVDBKeUVS?=
 =?utf-8?B?ejdidlgrTmxrckVIS0VzVm8zZ1ZRNGtzOEQzZHBEY0hIV0Z2MjdBbjZsYUFs?=
 =?utf-8?B?OHY5OFZQNytUQ0ZaZkFYMkFyZVJKKy9lTlBNaWhLR2hSd2dEL3FDWmFzZzZ1?=
 =?utf-8?B?Q0VmRHBwTjUrajdJMElESFNwaXRLK2NOVzYxR3A2cVJLOTg3RERXS0JrQlJW?=
 =?utf-8?B?Tms0Yk9JOGFNcHVmcTlWSHd1Vk9FSmtGOVNUdld1czFVdnEyTzFJVzJRamg4?=
 =?utf-8?B?Q0o4ZXU4Qko4L1dQSjZiWW5pWitNcjV2WkFpTW5hNUZMYXo3TTdEZ2FlNll6?=
 =?utf-8?B?M01OM2hSQVZhRTIyZDFraUFEdGdSQ3p3NmVMenhNMExIM1QwYzFIQUVqL0RQ?=
 =?utf-8?B?N1VleVN5UmQ5MVNkUEZDU3liM3V5OUxaNmNaZExtcjMvZ3ZyTGFwTmJiVlJp?=
 =?utf-8?B?ZUZLS04wM2pVTVQzSzhqL2psd28vWmFLWG0wQ3kxOE03WUtNTVRTRTZsRCtC?=
 =?utf-8?B?NU5aSFZ2aFZabEpKWFg1U25wNFNNT2l3TW43MkxSRkRCUldvQjhJM1o1Q1ds?=
 =?utf-8?B?MXlWZTV4bDdybEw4blZ4VHB4VjgrVWlFYWc2REZiak85RU53V3MyNHFHc0xH?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b92c07bf-114d-4658-f598-08de1270e1b8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 20:15:16.9268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZblUMdnp4JSFZQFx3AF0Y7/JaPMNGJoRr31ID6LBLx5Zdh6utGbG3BjK0cCUx4mrFX9lJYFY8NLa4qckBwgUhm+izDdqHuAH7VVw9IxQO74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7847
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
> All of the necessary building blocks are now in place for PTL and BMG to
> support SR-IOV VF migration.
> Enable the feature without the need to pass feature enabling debug flags
> for those platforms.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.h             | 5 +++++
>  drivers/gpu/drm/xe/xe_device_types.h       | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c                | 8 ++++++--
>  drivers/gpu/drm/xe/xe_pci_types.h          | 1 +
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c | 4 +++-
>  5 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 32cc6323b7f64..0c4404c78227c 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -152,6 +152,11 @@ static inline bool xe_device_has_sriov(struct xe_device *xe)
>  	return xe->info.has_sriov;
>  }
>  
> +static inline bool xe_device_has_sriov_vf_migration(struct xe_device *xe)
> +{
> +	return xe->info.has_sriov_vf_migration;
> +}
> +
>  static inline bool xe_device_has_msix(struct xe_device *xe)
>  {
>  	return xe->irq.msix.nvec > 0;
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 02c04ad7296e4..8973e17b9a359 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -311,6 +311,8 @@ struct xe_device {
>  		u8 has_range_tlb_inval:1;
>  		/** @info.has_sriov: Supports SR-IOV */
>  		u8 has_sriov:1;
> +		/** @info.has_sriov_vf_migration: Supports SR-IOV VF migration */
> +		u8 has_sriov_vf_migration:1;
>  		/** @info.has_usm: Device has unified shared memory support */
>  		u8 has_usm:1;
>  		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c3136141a9536..d4f9ee9d020b2 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -362,6 +362,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_heci_cscfi = 1,
>  	.has_late_bind = true,
>  	.has_sriov = true,
> +	.has_sriov_vf_migration = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
>  	.subplatforms = (const struct xe_subplatform_desc[]) {
> @@ -378,6 +379,7 @@ static const struct xe_device_desc ptl_desc = {
>  	.has_display = true,
>  	.has_flat_ccs = 1,
>  	.has_sriov = true,
> +	.has_sriov_vf_migration = true,
>  	.max_gt_per_tile = 2,
>  	.needs_scratch = true,
>  	.needs_shared_vf_gt_wq = true,
> @@ -657,6 +659,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_pxp = desc->has_pxp;
>  	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
>  		desc->has_sriov;
> +	xe->info.has_sriov_vf_migration = desc->has_sriov_vf_migration;
>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;
> @@ -1020,9 +1023,10 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		xe_step_name(xe->info.step.media),
>  		xe_step_name(xe->info.step.basedie));
>  
> -	drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s)\n",
> +	drm_dbg(&xe->drm, "SR-IOV support: %s (mode: %s) (VF migration: %s)\n",
>  		str_yes_no(xe_device_has_sriov(xe)),
> -		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
> +		xe_sriov_mode_to_string(xe_device_sriov_mode(xe)),
> +		str_yes_no(xe_device_has_sriov_vf_migration(xe)));
>  
>  	err = xe_pm_init_early(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index a4451bdc79fb3..40f158b3ac890 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -48,6 +48,7 @@ struct xe_device_desc {
>  	u8 has_mbx_power_limits:1;
>  	u8 has_pxp:1;
>  	u8 has_sriov:1;
> +	u8 has_sriov_vf_migration:1;
>  	u8 needs_scratch:1;
>  	u8 skip_guc_pc:1;
>  	u8 skip_mtcfg:1;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 88babec9c893e..a6cf3b57edba1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -50,7 +50,9 @@ bool xe_sriov_pf_migration_supported(struct xe_device *xe)
>  
>  static bool pf_check_migration_support(struct xe_device *xe)
>  {
> -	/* XXX: for now this is for feature enabling only */
> +	if (xe_device_has_sriov_vf_migration(xe))
> +		return true;

but from the PF POV, are there any differences in migration between platforms which already have .has_sriov flag?

and on the VF side we decided just to rely on the xe_has_memirq() flag, maybe we can do the same her on PF side?

note that all pre-PTL platforms require .force_probe flag anyway,
and that's we also enabled unconditional .has_sriov flag for them


btw, IIRC we also should check for min GuC version on PTL for proper CCS migration,
IMO the PF shall reject VF migration on older GuC

> +
>  	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
>  }
>  

