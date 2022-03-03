Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78294CBC48
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 12:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF9710EA71;
	Thu,  3 Mar 2022 11:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0EB10EA6D;
 Thu,  3 Mar 2022 11:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646306287; x=1677842287;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bS61DSHCvuRo5NAr7a4W7BXq3HFfmaZgR0pNNwMAuEE=;
 b=N3/Uztvjtrz7wK04qaHVeqmCIc86DtOV4SgdaBXf5prIePuifNKhfRNv
 wbXDjbtgoIBcO9i+61dhJQTMTq4D5G9izBAMSgU4nWl+9koewwVnDPGHY
 S1DIpkn1TN8lWDPps9i7N4SqCzpDCtGlyYqtdHKXjM1+a1dBRFqtezgYx
 tDYw/S63XQEvCzDcF7pIeSe2zt5e1GKWsyUWbvGtiUkL8DmZ5GW1K9UjG
 YihrS+eyxFJk0rx8vhkAEezevNWTgFubbN7qtevFWioehTf7runkRBEVS
 +7maA0fOLq3gROxqqVUAKX3Ji51rJKPtKz1SopWLaD3FatS8wXRtF7zK4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="241066705"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="241066705"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 03:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; d="scan'208";a="535789979"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 03 Mar 2022 03:18:06 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 03:18:06 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 03:18:05 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Thu, 3 Mar 2022 03:18:05 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Thu, 3 Mar 2022 03:18:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehRHzfGntdklNOKSxIWaoQALtlsrLhGrWmdWrnsgAsbU/2ujLs1GVZLXVCwd9g5eOSsgp1mC4bDQNDoTUbWZymShpEH6sHpFzUV0zQiNtOMhR2lhywkhsF4Iyw9D5ag62Ow1PlSREn2dGRQzArkqqWTSKWD1x/wlAYFTfSsPPwG/17jb3xQGp/VmjKx1PiEiICjW4ccvbxJISpYEY56G2OR+dmF+lXrUTZk38Ylv+qhGn8XlUwlgzSw8ayge8Nx0wAGLEN+HNDAD/MWdHefBwAvQK65pSE2nRSeQYwlc/BFTpWmXlJQdPMSO6yNgHojXMm+ca5LATQsxShxS7USeIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKWoJxQOSk/StTtEzukzUH70FwUJHVBtHGfiTZ/MkgU=;
 b=VAT+lq7wwpyzLVZflw4cWAyAYTJDIRx65ddjnBrurKO0OLvSzy9muOkz/0VFrWfB/pfUoYRi15ECeCmesDmzMcKDB0Fe7o+TfmA28IvNiQvep9MEN7XzKErHA/Zkxkpskex+FboNod6f0mzNywy3R+mAzjttwEUoDucoMAPqjSftLAM+cihleX8AN3XraSDVkg0eFS2rBhH4S9llXMEzS1OOZ7sGJk4X++I9BCYdac9RV10GcskM1Ih+w53juGQdB2KiquUrni+lhGPRMtDll2f6VlGrwoOMEyzN1bFM/C3iC/st6CqXDoYqSjU0uCSzWCqtDeylHU9TEuVKWY0fIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB3180.namprd11.prod.outlook.com (2603:10b6:5:9::13) by
 BYAPR11MB3109.namprd11.prod.outlook.com (2603:10b6:a03:8c::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Thu, 3 Mar 2022 11:18:03 +0000
Received: from DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511]) by DM6PR11MB3180.namprd11.prod.outlook.com
 ([fe80::11f6:76fa:fc62:6511%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 11:18:03 +0000
Message-ID: <cc812bce-ce38-19ec-b15b-192f5dd69a20@intel.com>
Date: Thu, 3 Mar 2022 12:17:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.1
Subject: Re: [PATCH v5 7/7] drm/i915/gt: Adding new sysfs frequency attributes
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Intel GFX
 <intel-gfx@lists.freedesktop.org>, DRI Devel
 <dri-devel@lists.freedesktop.org>
References: <20220217144158.21555-1-andi.shyti@linux.intel.com>
 <20220217144158.21555-8-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220217144158.21555-8-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR0202CA0041.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::18) To DM6PR11MB3180.namprd11.prod.outlook.com
 (2603:10b6:5:9::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63f6bb04-42d6-4993-a32e-08d9fd077ba7
X-MS-TrafficTypeDiagnostic: BYAPR11MB3109:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB31099898D0CDA7385F26DD06EB049@BYAPR11MB3109.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/9CHA0XcODWLd6aTyuCj1caiZJDAHp1+v3wN8G0T2UAZLrQAqOlVoZ9uhLQJSLq+fEL+NEWJjWmVhfiGhVWZYJBwRNCYzbgQsFQX37e3bY82P50AB+RGauZQKZPi69ok/SYF0A+f0Tiqx2e3eWK4Ptq0nn9u/UBNeEkWHzmoEkDVa224GBjQRVGrBB+bLuBd19lvWuZ6n9oxKetHttXzlRABliXMnyjtjiTJVg333EKFiSVrjLtsHpI1Q802CkJ+2KnMC9oQ+h1kBBbInDJsfI7GuQpmGx6D3qPEuqEq9leMd7dDPW1ibJxfpLIzv/ZPScnZLl5ItLAYioKMGKOD35zgCnaQHStDqjfUWS+MMyLRfsnYiCO3BdBBoVYFv4GxFin1YD/6zc0a7TCPw6wXpd6wnXI26EbaCXMC6VTaFJvwF5QUSk9qP2SWDYQvk+G6R1PZ0YyazBnwP+obKd7kJd2ol7B+EDvFk0q/IjPkl+BtcPF9XSu9P/rnWmxwl0nfgtovqhQCuM1p8GZsu6F2JQJXp1ReBHmFvFW7tBP5J9qCvBgOuQILfHLyRCfdp5eF7Ga7pM/DhtVTCft8kWkyUheXzPvC6XU8TC6kRGC3oHJOdxU59ckOROF98shie9zp8Wfr2o3K0omDkAgD8LVBQEWJRj+1zuz0M8qfaJEg24Oljd3hSY3OeSw1MRlnTjwqIHUtKR2Gw6/DcOPG5urJmX4Sn1VqkUNtxLTrdHlvSYhpqAbeQaytLucKlR/jtzWdlYj/r4OXM1Lvvohq/yLDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(2616005)(36756003)(86362001)(31696002)(4326008)(31686004)(2906002)(6486002)(30864003)(508600001)(83380400001)(5660300002)(8936002)(26005)(186003)(54906003)(6666004)(8676002)(36916002)(6506007)(316002)(66476007)(44832011)(38100700002)(82960400001)(110136005)(53546011)(66946007)(66556008)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEpzMTlKb1lrek1MMTlDNTk3UEd4RElJdjNFNFRKbjYzLzg2TEV2ZWQzeVlF?=
 =?utf-8?B?TytyZjcvVFpjay9DN2xDNUNHbFVWNHA1OW9pYlNYNXhjUkRubzFyUjNqaVFk?=
 =?utf-8?B?WUdRbFRlaEl0OHk3a2lDTDM2YlFRTVR3eHU5MlU2SjZHQnA4anBHVDQzcWRa?=
 =?utf-8?B?OVR4ZnRRWVh2RUpEMGNrRXZYVjFrSURIa1RCeUtuVDJjMHNKVys4UG1wUWxK?=
 =?utf-8?B?bzdWVzVpemMzMDBnQzRuLzVXUzFhVlNzeHpRcnA0RXQzU3pSM2NZeVV1cW1O?=
 =?utf-8?B?Y2pBTkh4WTRkb2ZKWmJUbnNxdDNFVjdER0x6dlRDRGhPMnErR2lqckhqZUQ4?=
 =?utf-8?B?TzJEZnlQcmtrWjdBZUpwS0lVMTVGVW01clNjSk1UYmwxTzFJSjZlYm8wamxV?=
 =?utf-8?B?MVJKbjNBOGhqbzFnQUNHamkzOUUvVTZESWREUlJvTHk0SzFScHRxbjlpckFB?=
 =?utf-8?B?SlhGRHp5V2w4SVJRckozanhRV1NCUWFScHZURFhxSDROYk93eUJGOGhvalps?=
 =?utf-8?B?V1N5ZjNIYm9tUUNyRW9jZjNMTG15aHRWVHVoTFd4QnpwU1RhS0V6QjhvSUpp?=
 =?utf-8?B?V2NBMjl2cVdvZXkxR25KSUdEUVpVVll6TVN5UTREN2dSZEtXWEZsdGtCUGxV?=
 =?utf-8?B?a3BSUTZHU1dhWldqWjdYakNybHBrNjNnS1VPdnJYTDI0RlFnREpCN2VnZ2Y2?=
 =?utf-8?B?eFdMQ2x6ekFSZUxmRHV5aThaY3UxTGV0RnFuL3Q2UEUvWUVlOENlbTZxazZ1?=
 =?utf-8?B?VTZQQlZNeVlGWXUwcEhwWEtrNDlUVloyUVRMWkFsMFdrekZVV0tSVStRY2R5?=
 =?utf-8?B?Qk1vcjNHWU00UE9HN2pCZXgrRUZLRUFtNHNNNC9EWXhRT1lBWDdOcFRDNk5W?=
 =?utf-8?B?Z0xUK2xlTFI5emZHZHNCdmM4M2FNTXp5R2RMNTcyb0xqMU5vUUtCZVErM0tC?=
 =?utf-8?B?Vng2aWtCcEpDdGpiUHVZUWI0azNqeWdSejFIcmU0SlUzdFNMeHgyaGJKTHVo?=
 =?utf-8?B?UHJuaG53T29ESlJDdmluak5Ic3dVdUIrUGJNdjUvTkVXSW0rTUlVcDVEMS9l?=
 =?utf-8?B?ZzhHMnFFODZNMHdLTHJRaVZPSTBubjI0c1Q1blNtZGdlK2JEekY2ZmxONDJt?=
 =?utf-8?B?akluQ0Y5TjZoRy9hVStyVVJNVE5PVW14c0VnYnp6bElFNHhnRitkbnlPSnE5?=
 =?utf-8?B?Z0gwaWZOK0ZHZldsYkExY3VCTDFZNmpJUnR5TzRvNmxlYkhSaldlZTMzL0NI?=
 =?utf-8?B?Y2J5SUkyc3JBMkNtWDEvMjFZRHY1YnhIOHJWVTZSL280anovcFNKVFBiSDFE?=
 =?utf-8?B?SUZUeDJ3N3A4YVZnZDJ1eXJKWEFQL1BPUVJyaGpia1Nic3o5UnkxeVlPb0tW?=
 =?utf-8?B?eVBOUlh0bWUzTkw0WHVQQWlaS3NlWFRvVVRoZG9ZV3dsYzNweXdPT2J3ZnBH?=
 =?utf-8?B?cFdTNWppQkoxdmpSTjVGQ21mNDJiQm1DRVJJSm0rcVhSOGVJbFlOekNwNmw5?=
 =?utf-8?B?dHZCZEVJUUYrREtBQTM3aUFrS0wwN2dTSXU1Ny9sWEZRZlRMVm02aTRZTm1r?=
 =?utf-8?B?RTFyN1NCYVhnVTN0VCtqaUs5di9TVW9TakFTK0ZvUFlsbHlETDdoUTcrbGEx?=
 =?utf-8?B?UkdqTCtSYWxlZkxNbEwvSzU4elBGZnVmSVNBYSt2SEl3ZnRxNUJhNEY4WnJF?=
 =?utf-8?B?MW9TaWgwdm9mcjdGVXV6dGZ4Y0I1eDZEN213Z1NvUG1yRzVaN0ZYUDVxQnMr?=
 =?utf-8?B?ZldROEhhVVFrTG5rSVJHd0hJQ25YalFMVXB4L1NON0F0QWhOZ3FNbVlGMGlx?=
 =?utf-8?B?WFppRHdxOUhkcUFFV2JnMnZseDhreGx2RTR6d0QvZGdQRVZodEZaR2F2aHRi?=
 =?utf-8?B?UVdBV1VRWm4wWFZyeEVuTy9PTi9Zc3hkRUM0Q1E2UE16ZGswaS9TaHdHVVFR?=
 =?utf-8?B?RkQ1RXpEb2tSYXpFWmpqNFU2NHlrdTkvRWVEVUFTT1JtRFVKTXVIYWMycEh4?=
 =?utf-8?B?OXJhMFRFUGpLMm1GTWVDWEJ5UlZvL2IzUWhVNUtESjBpT1Uza3V4RGNGTk1S?=
 =?utf-8?B?d0Z5SGpTMzBmOTYzNGkwdHFYYjhyQktBUHVXZURibFhLVnFBcWNoNXR3c0Ru?=
 =?utf-8?B?WkI3NkpxaC9MVDBKWEhvVU02UXdkZHlYQkYvMFB1R1FBekJ1Qm9IdFg1ZjZ0?=
 =?utf-8?Q?s1jr2km6JdgtP0sjawuh4Dg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f6bb04-42d6-4993-a32e-08d9fd077ba7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:18:03.2849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btZ6mGT2IWd+ZBH/UoSKtrwZqK37KxqByRJu0JdRdw8BKOTcc+MgZWkoFZzMORRSVM9yesCNxFEt7xrQesPu4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3109
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
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.02.2022 15:41, Andi Shyti wrote:
> From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>
> This patch adds the following new sysfs frequency attributes;
> 	- punit_req_freq_mhz
> 	- throttle_reason_status
> 	- throttle_reason_pl1
> 	- throttle_reason_pl2
> 	- throttle_reason_pl4
> 	- throttle_reason_thermal
> 	- throttle_reason_prochot
> 	- throttle_reason_ratl
> 	- throttle_reason_vr_thermalert
> 	- throttle_reason_vr_tdc
>
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Dale B Stimson <dale.b.stimson@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c | 142 ++++++++++++++++++++
>   drivers/gpu/drm/i915/gt/intel_rps.c         |  83 ++++++++++++
>   drivers/gpu/drm/i915/gt/intel_rps.h         |  10 ++
>   drivers/gpu/drm/i915/i915_reg.h             |  11 ++
>   4 files changed, 246 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index 8e86b8f675f1..8be676cd1607 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -463,6 +463,141 @@ static ssize_t rps_rp_mhz_show(struct device *dev,
>   static const struct attribute * const gen6_rps_attrs[] = GEN6_RPS_ATTR;
>   static const struct attribute * const gen6_gt_attrs[]  = GEN6_GT_ATTR;
>   
> +static ssize_t punit_req_freq_mhz_show(struct device *dev,
> +				       struct device_attribute *attr,
> +				       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	u32 preq = intel_rps_read_punit_req_frequency(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%d\n", preq);
> +}
> +
> +static ssize_t throttle_reason_status_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool status = !!intel_rps_read_throttle_reason_status(rps);

!! is not necessary if you assign to bool variable, here and below.

> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", status);
> +}
> +
> +static ssize_t throttle_reason_pl1_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool pl1 = !!intel_rps_read_throttle_reason_pl1(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", pl1);
> +}
> +
> +static ssize_t throttle_reason_pl2_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool pl2 = !!intel_rps_read_throttle_reason_pl2(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", pl2);
> +}
> +
> +static ssize_t throttle_reason_pl4_show(struct device *dev,
> +					struct device_attribute *attr,
> +					char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool pl4 = !!intel_rps_read_throttle_reason_pl4(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", pl4);
> +}
> +
> +static ssize_t throttle_reason_thermal_show(struct device *dev,
> +					    struct device_attribute *attr,
> +					    char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool thermal = !!intel_rps_read_throttle_reason_thermal(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", thermal);
> +}
> +
> +static ssize_t throttle_reason_prochot_show(struct device *dev,
> +					    struct device_attribute *attr,
> +					    char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool prochot = !!intel_rps_read_throttle_reason_prochot(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", prochot);
> +}
> +
> +static ssize_t throttle_reason_ratl_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool ratl = !!intel_rps_read_throttle_reason_ratl(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", ratl);
> +}
> +
> +static ssize_t throttle_reason_vr_thermalert_show(struct device *dev,
> +						  struct device_attribute *attr,
> +						  char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool thermalert = !!intel_rps_read_throttle_reason_vr_thermalert(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", thermalert);
> +}
> +
> +static ssize_t throttle_reason_vr_tdc_show(struct device *dev,
> +					   struct device_attribute *attr,
> +					   char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(dev, attr->attr.name);
> +	struct intel_rps *rps = &gt->rps;
> +	bool tdc = !!intel_rps_read_throttle_reason_vr_tdc(rps);
> +
> +	return scnprintf(buff, PAGE_SIZE, "%u\n", tdc);
> +}

Nine, almost the same functions are asking for proper abstraction, a'la:
struct intel_rps_bool_attribute {
     struct device_attribute attr;
     u32 (*func)(struct intel_rps *rps);
}
And for example:

static INTEL_RPS_BOOL_ATTR_RO(throttle_reason_status, intel_rps_read_throttle_reason_status);


Or at least some macro magic to hide this code redundancy.

Regards
Andrzej

> +
> +static DEVICE_ATTR_RO(punit_req_freq_mhz);
> +static DEVICE_ATTR_RO(throttle_reason_status);
> +static DEVICE_ATTR_RO(throttle_reason_pl1);
> +static DEVICE_ATTR_RO(throttle_reason_pl2);
> +static DEVICE_ATTR_RO(throttle_reason_pl4);
> +static DEVICE_ATTR_RO(throttle_reason_thermal);
> +static DEVICE_ATTR_RO(throttle_reason_prochot);
> +static DEVICE_ATTR_RO(throttle_reason_ratl);
> +static DEVICE_ATTR_RO(throttle_reason_vr_thermalert);
> +static DEVICE_ATTR_RO(throttle_reason_vr_tdc);
> +
> +static const struct attribute *freq_attrs[] = {
> +	&dev_attr_punit_req_freq_mhz.attr,
> +	&dev_attr_throttle_reason_status.attr,
> +	&dev_attr_throttle_reason_pl1.attr,
> +	&dev_attr_throttle_reason_pl2.attr,
> +	&dev_attr_throttle_reason_pl4.attr,
> +	&dev_attr_throttle_reason_thermal.attr,
> +	&dev_attr_throttle_reason_prochot.attr,
> +	&dev_attr_throttle_reason_ratl.attr,
> +	&dev_attr_throttle_reason_vr_thermalert.attr,
> +	&dev_attr_throttle_reason_vr_tdc.attr,
> +	NULL
> +};
> +
>   static int intel_sysfs_rps_init(struct intel_gt *gt, struct kobject *kobj,
>   				const struct attribute * const *attrs)
>   {
> @@ -493,4 +628,11 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>   	if (ret)
>   		drm_warn(&gt->i915->drm,
>   			 "failed to create gt%u RPS sysfs files", gt->info.id);
> +
> +	ret = sysfs_create_files(kobj, freq_attrs);
> +	if (ret)
> +		drm_warn(&gt->i915->drm,
> +			 "failed to create gt%u throttle sysfs files",
> +			 gt->info.id);
> +
>   }
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fd95449ed46d..94c78cfaf9c9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2286,6 +2286,89 @@ void intel_rps_lower_unslice(struct intel_rps *rps)
>   	mutex_unlock(&rps->lock);
>   }
>   
> +static u32 __rps_read_mmio(struct intel_gt *gt, i915_reg_t reg32)
> +{
> +	intel_wakeref_t wakeref;
> +	u32 val;
> +
> +	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> +		val = intel_uncore_read(gt->uncore, reg32);
> +
> +	return val;
> +}
> +
> +u32 intel_rps_read_throttle_reason_status(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 status = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +u32 intel_rps_read_throttle_reason_pl1(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 pl1 = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +u32 intel_rps_read_throttle_reason_pl2(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 pl2 = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +u32 intel_rps_read_throttle_reason_pl4(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 pl4 = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +u32 intel_rps_read_throttle_reason_thermal(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 thermal = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +u32 intel_rps_read_throttle_reason_prochot(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 prochot = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +u32 intel_rps_read_throttle_reason_ratl(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 ratl = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +u32 intel_rps_read_throttle_reason_vr_thermalert(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 thermalert = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}
> +
> +u32 intel_rps_read_throttle_reason_vr_tdc(struct intel_rps *rps)
> +{
> +	struct intel_gt *gt = rps_to_gt(rps);
> +	u32 tdc = __rps_read_mmio(gt, GT0_PERF_LIMIT_REASONS) & VR_TDC_MASK;
> +
> +	return tdc;
> +}
> +
>   /* External interface for intel_ips.ko */
>   
>   static struct drm_i915_private __rcu *ips_mchdev;
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
> index c6d76a3d1331..b45ab983895c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.h
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.h
> @@ -47,6 +47,16 @@ u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
>   u32 intel_rps_read_state_cap(struct intel_rps *rps);
>   void intel_rps_raise_unslice(struct intel_rps *rps);
>   void intel_rps_lower_unslice(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_status(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_pl1(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_pl2(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_pl4(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_thermal(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_prochot(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_ratl(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_vr_thermalert(struct intel_rps *rps);
> +u32 intel_rps_read_throttle_reason_vr_tdc(struct intel_rps *rps);
>   
>   void gen5_rps_irq_handler(struct intel_rps *rps);
>   void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 2243d9d1d941..c4f53e5404cd 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1836,6 +1836,17 @@
>   #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
>   #define XEHPSDV_RP_STATE_CAP	_MMIO(0x250014)
>   
> +#define GT0_PERF_LIMIT_REASONS		_MMIO(0x1381A8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK	0x00000de3
> +#define   PROCHOT_MASK			BIT(1)
> +#define   THERMAL_LIMIT_MASK		BIT(2)
> +#define   RATL_MASK			BIT(6)
> +#define   VR_THERMALERT_MASK		BIT(7)
> +#define   VR_TDC_MASK			BIT(8)
> +#define   POWER_LIMIT_4_MASK		BIT(9)
> +#define   POWER_LIMIT_1_MASK		BIT(11)
> +#define   POWER_LIMIT_2_MASK		BIT(12)
> +
>   #define CHV_CLK_CTL1			_MMIO(0x101100)
>   #define VLV_CLK_CTL2			_MMIO(0x101104)
>   #define   CLK_CTL2_CZCOUNT_30NS_SHIFT	28

