Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5758388D9B8
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 10:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6230B10EA2B;
	Wed, 27 Mar 2024 09:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nRnK6J+p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3FE10E8DF;
 Wed, 27 Mar 2024 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711530067; x=1743066067;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L/G4SIRBWyk3sGW01glxN2jO1XYXRR8mGDiTezokpIA=;
 b=nRnK6J+p6f8i8NAj6SeoA8JZPSe3mj5DQrqIFaMB2PXT3qQVTCt8SSLZ
 kYOp5tTiaQCYhE0vA30yGwNZvbJJpChhBGU5V9cmk2pApFL7nNKhPGAbM
 K2PWNuSkAPs71Ml551Gmn7g/IT841ghbMK1RmUes7G30IRo4rM06iG1Ct
 SrjQmrvFojD83DYXiONr66YVWcpUcDAAf0wYwW2oACr13RE8fbNNJqTTc
 ZNkTyrlZ3sBZYx6vMJ8o3EfJTXCLtBQ/1OsP3RHh8oJQZdJgvarc7qcMR
 Bwv7dWJ/maL588I/Gv27tc5fRbQVLnyXCxz/4iGCMYWZjYf/2HjUYRNcK g==;
X-CSE-ConnectionGUID: tdsfx4tzTOi9U1o1KgsfHg==
X-CSE-MsgGUID: Ht8QDHXGQ0erozjzZQ84fA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="24062853"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="24062853"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 02:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16164036"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 02:01:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 02:01:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 02:01:04 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 02:01:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncsCOuSReul+WjoWp4XewrPH7qQUhy9bJF9DyHFRzu+gAaW82MIzdRkP6FM54fuiG7I11yqu3cYj8vLUg4fYD0ikEVsOxRKxOeGRCj5XHtpN117PPpGw7vo5vhJelgXDQVCsl3EM+S/TzCK0S1Ny099EIXsrqVQVC9qMCQ4nKmTQOaUuoxWacVA+Tba1zBCMHoADHJ7bcYKSH4/LyEavdVCfdKi9qB4zwCdfpToMYTif14VJbqOfeIiKhjPPAWUrQCguvrtV2Gq2kDuYzH5x1ED53Y8geHZcvEfaEGiuZOkVHVdAFjNQbEKd714J2F1ySaBFHe+eA2mNMBYWcbLUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gobU+IW2lfyHGhqW6N3dCbnwYeKmjg29xWeVvahbW9o=;
 b=QtXuuFfF6AuxSKQjwhGKz34CgtKejLod/4WVnl+CaElS3iFnnEFW4hINDEr6uRZ0ivDJDnlk/XsNuBjw5/PQxtCalJ/JHd89B1mWPnFuynG9vibhxvuatH1P30UKAW8lWy6/yaY+PRUpXBOj7VvHapNNkgdiFHRRUcIjPU26jOeDlyQobb+0BsDtNxH5FHFLKFmn3ryfUy5F2vzW9xARDnw5Q6DgMQ3RPL/iMyi1tZDonh0LFHH0u/5zljjH2tQU818Fth3H0/ONfFkZqJubE4UeIXcC2YsRrK75YSuRGP/VjpgzjYi89ouituXBeMPs8KTgRM6SJUGgBNyBry2vmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Wed, 27 Mar
 2024 09:01:00 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 09:00:59 +0000
Message-ID: <ca468470-3b9f-4c06-8faf-ae9063cbe09c@intel.com>
Date: Wed, 27 Mar 2024 14:30:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] drm/dp_mst: Add drm_dp_mst_aux_for_parent()
To: Imre Deak <imre.deak@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: Lyude Paul <lyude@redhat.com>, <dri-devel@lists.freedesktop.org>
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-10-imre.deak@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240320201152.3487892-10-imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::21) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: de65a515-6a22-4d19-b57c-08dc4e3c6bb2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m0k7R+Iglln1MAPxyUHOZHoHtEhVvfnpPZKX0oqMy2lNQZXuGaN24jXjahJKcmc9dOKz+IVSJcsVHrz1iRvzx2Tpb/wLpjQEgqi0Hp4DsSmRhnuh2j2qUCYWfrz7Zu0mIhJyJTy/oz1pvGJeeTU78av81kWGppF3LEzxCudMZiP0uWbbnCs0QC9/XMAsAyY9BsraFyCSEmQN//OW1WxNcX5djGcB7YZuiM1j6ha+2lsW1GC0xtquWfZQQoSS00H7zRnzBGDnA4+4QfGFZKa980wuAb6aVBy2r4yY75/LUc3pMm9ufrk4HFY9I9/QEaJMZ29YXj/HKHVWxb4kGiizy17yxiSwKT2LUhVxY+yxuRGIy87IqzPd3QtsuSqnv0VTVEn46aTSzD6+U8Zpsl/DtQJmRTS8fEOIhPB8z0nPJqXf1Ky+V/2u3Djeh7570xxm97aiR580F7kOTm4aCUO2RAYvb+xCJT+/78tSYN125oIuJn2JaDuNOR0wxW7DgHRa3pw54ngPKeBLuJnDTgVFg4vVUYQOozmx6OuJLW1b6RDBmVzV1wkdj0IJGIshENOi5RI85LoJH7br2nNU74cI2xgLh5fMmM56ZwkPdwo0g7qgR1pHo8eEv1+ksb40nEfDfcpZuK8vE7WrutmW3JVGCkw89AAaDp5DWsSHZk5dpn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTV0UWc4U2dHRWx3THJMbmRMYXh0QitVN1p0YSt4NlJkdFlkTEZiZzFDNXZG?=
 =?utf-8?B?V0RXYVlGcHA0NWxMOWRLdy9WdjE1SnRMNmcwSVhPQzZUM3g5b0xhdzJFNVNh?=
 =?utf-8?B?KzRhbUh4ZkNWckZoaTZ0SzBiN0xrTTJWdHowSTdKejJlV05QQ2NEc3M2aUpU?=
 =?utf-8?B?Z29KSXBLcFoxRXM1SmwrYmFYd0piY0NxR2p5bFpsZEZPQ0J1RkpKaTdpbHQr?=
 =?utf-8?B?ZDFHY3JFTEZ6TEF4Z2tLM1doMmVMZmt1bFBRN1dTTnRWaE5VakM5aFFqZTla?=
 =?utf-8?B?VmtpM1NiRDVkM01OME81VHlUNDRkVWxudUdyc3FhUHFtOC9pN1NVK3FtL0FO?=
 =?utf-8?B?ckhzeUY1blVtR2tjL0ZIMHprcHpTcHVDbDFpb3QvcTMzanhXZ3FxNDVoUit6?=
 =?utf-8?B?Y2ZGek9tWlA5T1ZyNGF3YjBTbVY0cGljdzlUb3JBTDkvRmdNSHVac1M5clBq?=
 =?utf-8?B?cDVobVFRTUlJa2lObThYQ0MxOExGajNiU2ZRUWhMTWRTWXZjRlVDNkJMU1pw?=
 =?utf-8?B?UW1jQkZva25Ybkd1Q0ZJUDBSSUVweDBXV0hiSEEzTDVONEs5VVJ6aW1VL3pj?=
 =?utf-8?B?djA3aTk5Rmt4WjdndHJ2VGt3NndtUkpFT3IzWEx4Y28zeG9jUVMwR1haejVZ?=
 =?utf-8?B?L2twa3dsZjJXSlBJZEh6bUNGaHVRRkxJZThQS3NhUzRyQkhCcDJxb2ordVph?=
 =?utf-8?B?OW81Nmx0cFdzeHltT0ZoVWwzdERteG5ZRFJRcDQwRkhiUlVrTDdSU1RWaTcx?=
 =?utf-8?B?R29aVHVERmVuT21IYUcvNER0d3Raak5KY291b0w4MERlZXFOZmZsUTcvWnRZ?=
 =?utf-8?B?MEhJbnBNcy9WODlqV1c1YTZEWHZsVloxSTVCVFptVDUvVndWdGlyTWdCalZi?=
 =?utf-8?B?ZjVqZVgzNS9Eb3VIaWdDZ1JyZGQwKzhMVjZZRTBJOERkMXpFUVJ3SDc4RHJy?=
 =?utf-8?B?VDQ0SjFNamNCcDJNamIyOEJneTFwVzhFUDFBY1hKRHhuc2ltM3BNY3ljZm95?=
 =?utf-8?B?MFJad3BUV3JYaFZEUHZRREl5ZkdNS1pvMGFMeTFMOVdPUWZ6UXJXWmlZR24v?=
 =?utf-8?B?YWtvMnM4MWsxWTU1SlMrRzZxbmppNi9uT2dWdy9UeWlyTW9VeXhBd0VCU1RQ?=
 =?utf-8?B?Z2MrZGo0L2pnOE5HOXRoM2tYVCt4LzdJS1NqWlAvdXl4b2pXT0pIa2tES3pY?=
 =?utf-8?B?NjZvTnB1cUNqNm5vcE8rTFc1KzVjd3FhV3RvaStGNXp2ZDlUeTl3WDhmWXI0?=
 =?utf-8?B?T2duYlRQeFh1M3pZZDVpVzIySkQwNkcwMVR3cHdyL3BkeTF4K1Y4ZUw3MkVq?=
 =?utf-8?B?dFpYekVzQkJIU0RZYmdxUGVBSHc4M0xYWFhtK3lkL01vaWNCWGRVOStxSEla?=
 =?utf-8?B?UDRtTVFHRjNmZXhkckFJZCtKUm1wOVNyZnlYZ1BmVURJN2hrdnNtUVpTY05W?=
 =?utf-8?B?Zjk5T3Q1ckwwYUdMWlBPWFlEK0lteTVlNVV4NkZ0MURXSXVjVHFqbUkwMXM1?=
 =?utf-8?B?dGFIMjBqYytWTjdWOG5jWmgxdWxKbXdWWWx4MVVGWkN1TDEvbzE0bmhnSWYw?=
 =?utf-8?B?WVBhU3YrR0JmQ21UNEFCQWVsdXZvbkVpYkNGS0RRRmxTK25LNStUMXJwZ1RJ?=
 =?utf-8?B?OEhHV3MzSUpGbnRQU2g2Y1ZNKzRNN3JzaTVDaEc0Qm8vdklsZm5aSmxuaXkv?=
 =?utf-8?B?RzlMbFJwQndaMkY4YkxrRmNEWHQ2WTlYVFY4R09Xd1hiL1NkL3d2cyttTlZU?=
 =?utf-8?B?SmYxY2ZuVmNQVUE3TjF5bm1wekdMVGNPNnZ6RnV2TlU2SzBNZjBSNWliN2dt?=
 =?utf-8?B?bzBGdzJ5ZlVMUWxiNlNtR1VVb3B0R0lPLzBaZllQQTBaa29DNEdKK0JFc0VF?=
 =?utf-8?B?WEFSQko3bmVsdEpha1NaS2s5bmx6emZnYit3clNFNlY4V2IxZnNkL3RlenlK?=
 =?utf-8?B?YkFXc2g2UnlvR0pNTktkSXA0UVNvTzlqZU9JSDRyaGRoT0dVbG11WHlRWnV5?=
 =?utf-8?B?UFllY0FZV0ZjYUJjcVpSZGFZTmxJTmpSMk9OdEloc1VLYWtSZnBDQkFacVF0?=
 =?utf-8?B?c0ZidHVESnlTV3ltUGN1anJLcnFWaVhwb2lBVXRWRVhKVU9Ed3NqZFNzVE9X?=
 =?utf-8?B?T1p4MmFzaEJXdHlrZ09sNnorZlIrK2xuckN6blBYU3VDTm1xRjdicmlhaTkx?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de65a515-6a22-4d19-b57c-08dc4e3c6bb2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 09:00:59.5227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toWmCZmh16y3e7EOn2buTiLFNMyck28oYcBoaN5ni6wHr0uYQ1ZyuMpBmhWKyDn1Oxbax/K8S+g7PmGI3UQ3vrZvWv5N0kPQug8Q3iQbE2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
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


On 3/21/2024 1:41 AM, Imre Deak wrote:
> Add a function to get the AUX device of the parent of an MST port, used
> by a follow-up i915 patch in the patchset.
>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   drivers/gpu/drm/display/drm_dp_mst_topology.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 6bd471a2266ce..d70f7de644371 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -6004,6 +6004,22 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
>   	return false;
>   }
>   
> +/**
> + * drm_dp_mst_aux_for_parent() - Get the AUX device for an MST port's parent
> + * @port: MST port whose parent's AUX device is returned
> + *
> + * Return the AUX device for @port's parent or NULL if port's parent is the
> + * root port.
> + */
> +struct drm_dp_aux *drm_dp_mst_aux_for_parent(struct drm_dp_mst_port *port)
> +{
> +	if (!port->parent || !port->parent->port_parent)
> +		return NULL;
> +
> +	return &port->parent->port_parent->aux;
> +}
> +EXPORT_SYMBOL(drm_dp_mst_aux_for_parent);

As mentioned in previous patch, the declaration of this in the header, 
got included in previous patch.

Regards,

Ankit

> +
>   /**
>    * drm_dp_mst_dsc_aux_for_port() - Find the correct aux for DSC
>    * @port: The port to check. A leaf of the MST tree with an attached display.
