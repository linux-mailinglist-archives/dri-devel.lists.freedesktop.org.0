Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB24988F5E7
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 04:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0402E10F2AA;
	Thu, 28 Mar 2024 03:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RMvey6TN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD3A810EF9C;
 Thu, 28 Mar 2024 03:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711596487; x=1743132487;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D78I0wrmGiDlz69+Rg0gAfqwgVy0wbr1I3ejk2gNGgw=;
 b=RMvey6TNqTMqst8KujYUAYyrxnKVboFBqLR/J27Vk0af+J/qQR+vTfQQ
 KQQBeKEe2+JKLZ0EqGK00j36L9ain9IeS/GkvlZrMw/RVMmR44JFZ93Oe
 tob1jRu9VeGa6MLf5ouJlEsDxs7pWDvkYjQmPiibAtY8wvTh2vjVPrpeX
 X1YOB7RIrZyYUl7ni3RjCBc1Is2dxQ8xk//cWqYPkwvQuI+MSVr1/LaOU
 EKhBeqvT4dRv9B6uIYidmUOqTPN6acqXHT01lglY5zrkEexcVhqZg4Jtp
 o4mWPtuxQEOGC8f8kQ+t5Bf3qsMV9Cs17opFchaMjhlpx/nindxL5E+IO g==;
X-CSE-ConnectionGUID: iIyap8UQRqSlTOGjY8JHmg==
X-CSE-MsgGUID: 8ucju6XDSmaoUkJx4G4DLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="32130761"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="32130761"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 20:28:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; d="scan'208";a="16533535"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 20:28:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 20:28:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 20:28:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 20:28:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF/HKxpJMcnLvJoBfQatUu0jcukqRQtgyCqUYnGxBu2tVL2InBHXnlnFH/x66F0NKa/Ouqjn9z4Lvo/d4sREV2FFHI3ci/umctBNBPwQCzpWpyE6DDkZe9LijrQ7zSkSH41m7DFciS10DjaBymzbwNbEG1dbVOUxoSgfm3T47wEzuifbFsSj1BBfPlp8lTqd1QX0gPpVSK8oaF6iLJFWKh6crBKHvrHIQa+Qp5giFp9n8QaMpdEk49Pezm0vwba44CTQxGUUgSFSpEVu3XYPRH1rFqGcrbPps//zBqNb40L3VII6iFjojz5q842fAiY7qAZYdwszd3+v4wY6Jr4bBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHoOIDVrSybP7KgJPCrwJmQJxmKD5zEVg1O5twRck/U=;
 b=GQMI5zDHIQy73gnnFXXOJfzD5soY0wNJjrEdYe0UO+T+8br2Ci3ZrCSTAL0/zF5EyqhyfB8Ipl5p2BsNFcrvGXZc6L1lRTqY9fD++ThqeO2PHYK6A4n4Z9EqiByIJlFEY84MWUstkXkTLEc8iLRmKlH6+LCSBUFzPZ9y5lKOEFcTVn+aHE5tAdKsXnNDEyUHpqFJh2dSSgr8kt73k2cUkY0XeLPl84apYpyD8dgSGK3Bgs6mfHkuIFOxaqCG1eKxIVg35MV4gEA6mbUnL9We9UpAGpkSsr2xVPdwYApvmbnvSX1YdrLOo8L7fNNmUALg/eDyS/n19XaB+t5wrSRnLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 03:27:57 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 03:27:57 +0000
Message-ID: <bcb30af2-87bb-4b39-aaac-71800f8f271a@intel.com>
Date: Thu, 28 Mar 2024 08:57:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] drm/dp_mst: Add drm_dp_mst_aux_for_parent()
To: <imre.deak@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, Lyude Paul <lyude@redhat.com>,
 <dri-devel@lists.freedesktop.org>
References: <20240320201152.3487892-1-imre.deak@intel.com>
 <20240320201152.3487892-10-imre.deak@intel.com>
 <ca468470-3b9f-4c06-8faf-ae9063cbe09c@intel.com>
 <ZgQsUy15GWxvz/Gh@ideak-desk.fi.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <ZgQsUy15GWxvz/Gh@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0133.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3020fa-2ebf-40f1-b37a-08dc4ed70f90
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZO8rqOY1KyNUrgHy8rh4XcaHJTeKbMGSPfAhASgjm3yARWIf3NainMmOv8lVeUEGLMVaby8ERqJwnkCHWaJ90yJcqEWhCH7ljR6PX8L/S5O5xw0MX+0CPfbuQLKs8PfdNDI0yIAFV1xdDhW6H/SHivm5FkrhBe1b99nwak1u9RG1j/NYCh5IgodXVwmRa4LAP+dpmCheIoblGNv+WupHCF1LoWeSJNm3BS5dBTx0z2R6i7qXjzu3n4LMeyqPTt47XUdfPc/MUMqbpyM8p85spUT7lwAkPyPjQm8yJtkCHUEPD0a5OT29EWWo+G8jK6/OaTVms73/2VTc56riyPxCj/Z2sXsdG9rYYO0tOZBoignuq4+OG+iTnpL56OmpTnO0OnT+8bvTJvn+Z31UiC3JK8+0oBPF0e13FgIshx4HWXVpDGL9rJvYkFpHFNRG5+SReC/NEkCdOVP540zOB2J4cQ0YeEkgmyZDWtuazeWHAfhdObT1AH0bxP8tMJ1cCD0+ExsFazoXPKZfyduN9JPAV9rHPgxVKpLuWPgJI45RnmuGt/69GfU9fLWQP8jBWMhZP6StsObdhEHKCcX4wNpB9uihkVt+44IgytFnihWv37XmymPIisul2gSIOo8MexUFaUQw7ccsKbNafDVtTi1G6YvwVUMcaqUue3n+WS0PEc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2RrcURmanNIRjdTOTNtVVdPT3ZTWC9NbFlmU1QwNjVnTVdaVnZ4aURXODJP?=
 =?utf-8?B?dTZCUjlqZ3VSajIwa3ozbG1lSTlBenFPVEpFMHFESm9YZWlDV00yd2hMOERn?=
 =?utf-8?B?WFJoN09SZzBBVGt0am9IaXgwdEJicFlBaitsTjBiZTkwWkRXNXF6U0Q3T28v?=
 =?utf-8?B?VGUxU2RmT0g5QnhDd0JXSGsrdTQ2dGRGQWFEVlJ3ZjRsYUdSQ0M1OE9QQUhv?=
 =?utf-8?B?S09aQnFVdWloQ1VZMTBLQjN0NXhDQmRucGxsaGNRWXhoWTRMK0VMWXczcUIv?=
 =?utf-8?B?M2ZoeldaaFVqWjF1N2lyVHhVOFlhOGFieHB0cGJuaEMrTFVJZ0E0UUd1NWMy?=
 =?utf-8?B?d2dURjM1QVZyUWFkK0tmR2VKVU4zM0pVL2UvL3dHK1lFcU9wQk1Bc1BvT2dh?=
 =?utf-8?B?R1FOSTM2MHN2ODhyRmV1UnNiOCtoQ2JYL1AxR3ZCUW5McjFlMHJpZXBieXJ4?=
 =?utf-8?B?c0kwUHY0WktRWE1qUEpUZHVtQ1BLQTJZQTFyY0hOcUxMSGpQblpwZ254cVJV?=
 =?utf-8?B?ZUFqSThaZGxMMk1LbUxSei9DWFUvZVN1QUdpWmcwd1M3SzlEKzcvZ1p1VnNi?=
 =?utf-8?B?R2tOYXBvemNuRmgyMG43Vi9kUCsyYnlIRk1XQWNxZXMyc0JNSm1PaCs1c1hP?=
 =?utf-8?B?RnRrTmk2YUFXSUo1dGtlY0JQL0wzUzlzQnZrelZNbnRyakh0cHF2UERIQUE1?=
 =?utf-8?B?UlhwTkxzKytURnlVcGE3aWlsUFdmYzA1TWRFdExoVkJrTVNyVUI2REJKV3hz?=
 =?utf-8?B?SEpJa0FUY3dHcVJNc2V0bTgyN2RqaGRvV2o3Qm52bExQLy9WZEdwTVQxTTJR?=
 =?utf-8?B?TGRwOFlvSThzWG9Cd2IxZE1lNDZyc1p3NFBsWml3dzk0eVhxbFAxRVRNU0VN?=
 =?utf-8?B?Tm4zd2xSR2Vta1l1cFhaVS95b1pCemhsVVo0RDJmQWppWmtGdm4zWVhIckJu?=
 =?utf-8?B?Z0FMelZhK0VnQ21wQ2FDSW56Rzg1dW5kTVBjZDN1bmNWYlVwb0FEWm1TVGw1?=
 =?utf-8?B?aEM0VnU0dllObDBGc1ZmYUZCMjBIWWFoVlJ6dU5MekFJVldQZDlUd2kvelJI?=
 =?utf-8?B?NHNvSTVXakdFdGV0cTNqanNyRHAwak41ak5SWFk5VGU5Y09Ub3h2SGxKdDF6?=
 =?utf-8?B?R1lxZlNxbit2MXNVVUNqM3czZ051bk13YmllTEVZdk0rNk85cXk1SVc5dGI2?=
 =?utf-8?B?VFFzQkswbGwwR1c2SFNiM04vWFhRa1ZOdUwrbU0rZCs4WlZQcG5UZVQ4TVFW?=
 =?utf-8?B?VWVMZlliQkZyZzNrZnY0dVVCZmY1dndhNitic2JOZ0doQ1F3ZS9pc1hRS0FU?=
 =?utf-8?B?RmVzVjZFeTlXWTJjWldTODNPbU90cG1MckNXNHFFY2NqSE1qTm5Ia2FQZ0NW?=
 =?utf-8?B?WFBpQ1BzNnRJU1ZwZXBDaWcvTHhIdzZyeWVqdUxjREwyVEh5b3lUZXR4ODZS?=
 =?utf-8?B?VFlhUDkzTFR5RUdVZzVjYUdWRHhQQkJCdFd0NEdvZGV1aHZKdGNDa3ZCNXJO?=
 =?utf-8?B?TXJQT2Q0dnNFSmFYaUQvZXpaTzA4d0x6ZThpWW1jd3pkc0RVRUtpOTdyQmF1?=
 =?utf-8?B?Q0FPQ0VRbUdOZWR3cUQ0T2Z0WVhRUS9TWFg3ajFlV0ZvLzhnbVExMi9GaTd5?=
 =?utf-8?B?bzlXQVNVR0swTEJYZ1hCRE1oU3RnRm1SU2FpL0JrWXVSNW9TOW1lZU5LSWl3?=
 =?utf-8?B?TU9McnlndHlDcE5CcHUvU2VTckdmN0R2ZGJiQ2g3OGV0M0ZSd0YrUjNvWE5V?=
 =?utf-8?B?U0VFd3ZMTnFySFhCRk5Nbi9XViszSHh2TGpYRnBKQ004R2FZRGRBTnNiUDAy?=
 =?utf-8?B?QVpPVkRCWEVPanZrNjZZckZHOUEvQmRyWlVoZFJFZ2I3dUMyQkZ5NDduMnkx?=
 =?utf-8?B?U3RneXZNOWVPaFlvS1lnam5LNVV0TGoyYXJMMFVkclZSMWdtLzJ3aWtiRElp?=
 =?utf-8?B?N0QvU1BYTjRwNWJIK1dsNzZFYXpLYlRDUXVaWWcwQVRnODZRVW1UMjFxbmZv?=
 =?utf-8?B?ZVMxQlVma3QwTEx6dWZwSmJpWE5RRWZiTzNJb3ZxWmw2R3VTcm1oUCtQaXpm?=
 =?utf-8?B?VXlESGpFd0wxZjRwL2ExdWFnSkpYWUlNVFpCSTJrS1lNeE5yZ3gwTGpMRlgx?=
 =?utf-8?B?TFdDMHRlREtLVWdIbDdka3VDdTZSSGc2RmhDemZVWjNJSUpaWkNzSFlqTnNE?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3020fa-2ebf-40f1-b37a-08dc4ed70f90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 03:27:56.9779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4UZLInLtNwgbFRCABq2YjbGry03U1O836ChRb6FEe60MOlpdJlWeOU+1JmUeGm0BzBKvAXqyqVsXWztUDYKZOD/8S45oL0pmoxpYMMwtmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
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


On 3/27/2024 7:55 PM, Imre Deak wrote:
> On Wed, Mar 27, 2024 at 02:30:53PM +0530, Nautiyal, Ankit K wrote:
>> On 3/21/2024 1:41 AM, Imre Deak wrote:
>>> Add a function to get the AUX device of the parent of an MST port, used
>>> by a follow-up i915 patch in the patchset.
>>>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Imre Deak <imre.deak@intel.com>
>>> ---
>>>    drivers/gpu/drm/display/drm_dp_mst_topology.c | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> index 6bd471a2266ce..d70f7de644371 100644
>>> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
>>> @@ -6004,6 +6004,22 @@ static bool drm_dp_mst_is_virtual_dpcd(struct drm_dp_mst_port *port)
>>>    	return false;
>>>    }
>>> +/**
>>> + * drm_dp_mst_aux_for_parent() - Get the AUX device for an MST port's parent
>>> + * @port: MST port whose parent's AUX device is returned
>>> + *
>>> + * Return the AUX device for @port's parent or NULL if port's parent is the
>>> + * root port.
>>> + */
>>> +struct drm_dp_aux *drm_dp_mst_aux_for_parent(struct drm_dp_mst_port *port)
>>> +{
>>> +	if (!port->parent || !port->parent->port_parent)
>>> +		return NULL;
>>> +
>>> +	return &port->parent->port_parent->aux;
>>> +}
>>> +EXPORT_SYMBOL(drm_dp_mst_aux_for_parent);
>> As mentioned in previous patch, the declaration of this in the header,
>> got included in previous patch.
> Yes thanks, the header change should've been in this patch, will move it here
> (while applying the patches if nothing else comes up).

With the above fixed, this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>> Regards,
>>
>> Ankit
>>
>>> +
>>>    /**
>>>     * drm_dp_mst_dsc_aux_for_port() - Find the correct aux for DSC
>>>     * @port: The port to check. A leaf of the MST tree with an attached display.
