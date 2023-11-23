Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957267F679B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 20:36:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735B510E33D;
	Thu, 23 Nov 2023 19:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2070.outbound.protection.outlook.com [40.107.100.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E14010E33D;
 Thu, 23 Nov 2023 19:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwKbPqHsORdDmmBx9d0dJl6Qm8O12asJo7xn2sdf9tJO3NY4UobrThx/sCKg9L4LCCMy7qu1fkSr+SsYP8Cv9awZ+nApuVfUG08RqBvyY6xDPbHCyqQM9cpSMPz7lkDLeoah8OfsWfFAT0jJV06ybAFCZ0g2SEjPTO1EEsMpdGOtqd8EYhs/TwzAhOQvJZFtumWH4Kc++SGx3tnhrGzo1C6oV2liUbQyc82JuDf4c/fkI59CTmmmtcOmDeyS/mAhhSMNKf1nMr1GMpF33kUFf9/6DO3/G4wwvK6BxeglawH9xTSQaNDQ3GiUCf4jscoBnHs2lKrgtbKZGugIgTerzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTaxtUUhGRfDmWGPf9bDP4PRZKbRS91hoOiD7MWEa1M=;
 b=i8fBoVXSvpt3sFN0N25Idfky1GipbHkX3RCBUUfvDIXSAKiPc0i1L0J1cMqxdktBtdTNZhl6xMtzJ/OPwEn2z47DFkOK3gucVdgoogjUrV84WEakhP8dkTkTjxHFBPfFDx1mxuN8LIaPm0NWxCWn8wJF9FEG0Ao2Kle5d3Ja6zPjkGLk8wtYF4FHmS3fo2OLGlHGAKao5fWu1PZynACwyDY5XM4Q62nfCagdE3lYNb5+5rtUVmijJpTxpv3t4gpNU4N/yyDjEXKxbpEvNY+fyno18YnQ8MXtQbFOitqwu6AXR7nAcPFE05CcVhhUmAYfa5ANt1JoEld2r913nIjmqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTaxtUUhGRfDmWGPf9bDP4PRZKbRS91hoOiD7MWEa1M=;
 b=UTe5qPbngiQCKE9FJTu1YYA69+qaq84++JvOjAfm6uYORm31lPVuApZKoPiBEPKC8UkGg6e25EBRVQRombYmibx1sZKaohHMIuboF4MnxVRBRah/D7tccUJ8QDQCrkWJz5Ab55NjJxQ1NVMr5GPh5/tPEhp+ZS1qg/6lm0RgcvA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 19:36:20 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7025.019; Thu, 23 Nov 2023
 19:36:20 +0000
Message-ID: <4293cfca-6775-44bb-b6f6-81c98491941b@amd.com>
Date: Thu, 23 Nov 2023 14:36:18 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Revert "drm/prime: Unexport helpers for fd/handle
 conversion"
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20231117214419.418556-1-Felix.Kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231117214419.418556-1-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:88::6) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: e13c8ac7-1319-4c5f-dbfc-08dbec5b7834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pw0RozD2MWxSFACYbUn3DFhURaJiNdUJfIVrpJJR7HRWqn/t0GsK+Hb9qytynFrzl9MvSGa7dkB7rbf1HuDmFwhqZ4IcK6BhxYC/osL3+WbteshUzuYwNsohUxMNM4C9Zuc4sS0IKPrTPa9+IxVo2oG6YPsWsgl0tY6KncTUa5TyyYEs1qxvKhdqD63V7DhEDGLvhsMRp5VRqtAk0iT5Mi2KBNNzZEj897uMoSQwNod4I8KYM2YqsTWnc5uI6IsMc4X4X75JbsR0ThwS8NqHl0n55fkyd48otSt7yYp3NLk4o5wWg6DUTMB7sCTuL+nD4eRzzEEf44zWoQ3Nbqi8zO2WA4/syds3NY2Q/bimV4SFOeTbi9akhv7M6e/lG/PtjZwySzGUFOg01XQqMI72oSUT8do1iDLPFcD9IpMv/J0LIbz9aijfILBMJ4rqjJN3JTKh/5B088Pz58JuwE6XgBbRXoDCT8hN9XKI5hj+eDumocaNgtPcsnXK3O2DHEJlkpBfbi0SPAlLyO8eWxrlQRfk4TrtvThM5SGSS3ctrANj8eZpD6sP685Yw6fXtJPv+dTVTLvp4D/iKY35lHQlrym4iJuP/prkt/w95Iva7CCbuiyi0iTfNp86Rg1UDeT29TECcOvk7/+2ocYEMQbIQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2616005)(66574015)(26005)(38100700002)(31696002)(36756003)(86362001)(83380400001)(6636002)(8676002)(4326008)(6862004)(8936002)(5660300002)(66946007)(66556008)(66476007)(44832011)(41300700001)(31686004)(4001150100001)(2906002)(316002)(53546011)(6506007)(36916002)(6512007)(37006003)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0hKSnY1ZzVMWURleVBaMkJTaHdRd2NUQjFDcnZtN0doQ2ZITTFVL2MxbFA3?=
 =?utf-8?B?elhVNlB6MzhEREh2L2ZTeFVscC9DOUptYmtjWWgvcTgySDdRVGI4UWRPQ2gz?=
 =?utf-8?B?UU5OcjlhU0dkOWtRQ1V3Yjljb1EzM2lWNHlpWTJ3QVFMa29sNTQxWkVTZVVv?=
 =?utf-8?B?aUlHWDhLYnE3Z1dRWlgwcW1IckwvVlNuLzMxSXZQeDErcFVmemNtZ3ZzVFFv?=
 =?utf-8?B?UldscmlWMlpGalZ4NCtrb2MwazNjbGY3VFVtSVhzK0hCUnBNQ01md1JSQ0h2?=
 =?utf-8?B?a2tTNmVCcFBNbDV4Q2FOckE3NExaandzSlUraXFxbzhtL2ovVUZnWXV0TUxu?=
 =?utf-8?B?T1NnWE5FWWh6d3ZZK0ZMRHN4OTl1a1Z3b0xxazVOM2lxandjdDNqTkI2KzZM?=
 =?utf-8?B?RlJoZ1I1TDNNdjFOSUJ0enpGclo1UTcyTTFqVElVc1ZvekZST3pQR3pmUFhG?=
 =?utf-8?B?MG96SEFWT1YwdXo0VWJYckxZN1J6MU1kMjFUMGoveElXNUtBTmRSdzl0YkdU?=
 =?utf-8?B?QXVrbzlqK0V3Nm9JL05WMWM0aE85NGt1clVIOGV2TlZCUllOM3ZaL1JKV1I5?=
 =?utf-8?B?blNQR2QvTDhrWlNJT2xTVkovREg0VjBGakZEeCtJcVFTa25zakFDcEJSQmlv?=
 =?utf-8?B?Q1R5OU13enYyS05aVHU0OTdvZWFQMWR2Q2t4b1VWU3FockVKM1FwT2UzTHNY?=
 =?utf-8?B?eXVpOUJRVHdPK0E5SHRCMjZXWXRVM0dOd2lJQ3AzZklyWjBMdGtjYml6NVVl?=
 =?utf-8?B?aVdqNS8zdFVPVUg3QUQzbytjS3ROTktVVlVqam13VGR1SUJ4TEI1RmZ2TVhK?=
 =?utf-8?B?VExoUlQ3cStjUTIwcXpnZUhjaTdWWVZTcXNiNjhWZElTdUM4VnlHZmNBOGtL?=
 =?utf-8?B?eWQvdmZhZG4zQkNPMUZGSVpSR3hxeXN2OTZ0WHhZVnNLRmNBcElyZHczQmNH?=
 =?utf-8?B?OGRkQ3ZDOUU0UGZwRTk5Z3RMNVhTR0c0M0lvQWVoVmozckJMK0Z0YXg1TU1x?=
 =?utf-8?B?MW1GeGtvZjNwQ3FRU0Y0ZVhOSytoQlBzZG9qM1NNMTRUUEFRbzBIK0ZmUjh4?=
 =?utf-8?B?aGlacDJscTNnRVNxaktHMGI2c2w4aUpndVVKREhhV1lyNVRmVmRuaUZyR3A1?=
 =?utf-8?B?MDVWK3YySFA3UHlrVW5ZSUhRcGZXd0R6NEhqTGRlMFpIa29EWW9lNHpJMGl0?=
 =?utf-8?B?S1hoUmJmdTVablRMMTExaUlxSllMcUtDbzRqN2E0ZTdHSnV1N1g2NVZiYXI2?=
 =?utf-8?B?SUNHR2kyVmJ0bUh3UGJvZkpIRlNZTnlIRUZ4YlFQYk9qV2V6Rm5ZN29tVE0w?=
 =?utf-8?B?RnJ5M2g2TnIwZ2F2Q0dHMUN3M1hadi8zb0lWM1VYcE5BellTMTMvaDFxK3dk?=
 =?utf-8?B?Q2pGbnNjcFFkTkdVV3h4bUp2Z3hWUHhyVHFkTUJSaTZ3M2lUeU9jTkxkVGxq?=
 =?utf-8?B?ZkpSSHRXL29uL1FzWE5hT2hPK0I0M3FzUTZaV0RSdVpBSzhSd0Rwd0xwblg0?=
 =?utf-8?B?a3VTcTFLdllTRzVXcFRsbEhxZzZ4dnBHS1BLQlV5aDR6WnRYV3QyWGhlSjJa?=
 =?utf-8?B?THVYV3Y2dC84MS9NbkQ1eEVubklNelJlZkl0N1pDQlZ4NVVpRS9YNE1FZHYr?=
 =?utf-8?B?Y3FUektVNldoNFlyQUN3Wnh0Ujh2emlYZnB5S093UHJTZTBFSzJZb2U4TDhB?=
 =?utf-8?B?bUlWb2QvVnM4Yjdhb3p4c1BFVG8xek50UGZDK2NTcndQNHQ0Qm00blhGOVc3?=
 =?utf-8?B?aEZsS2VmSXhsOEF5d2hRdmY1QVViNFYyOC9FcldwZnVoT1dhcVB1R2VsWHJr?=
 =?utf-8?B?aEtpOEpGVHZOeWFqTEE1L1VBRTdCb1dZYVphbmN1dVNQekxqSThwakttZU1q?=
 =?utf-8?B?UTJabDJwSFZtNU9QUkJqT1hUb3RQNDJzY00rL3daaFd6KzFselVleERseUxX?=
 =?utf-8?B?WnI4YVl6Qzh1dlYwYWtsa1M0SWZ4M285c1NiZWd2UFpIUGRmdklzaldyTXJl?=
 =?utf-8?B?VEpvNHlsbkhSTGdHRXM1NG1MR2ZLQ2tWZ25SNkliejhhajFTQmlkMDhpRnAx?=
 =?utf-8?B?MzBJM2Eyb0x6OEpXVUdjb1BUdnpJS2xmVkZmZmZsSUtsekU5bzNSUWlVQ0RK?=
 =?utf-8?Q?paaD5AC4lLAhBmyrPK5C7VWK4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e13c8ac7-1319-4c5f-dbfc-08dbec5b7834
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 19:36:20.7838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QhDXdG0WdNfHYmfbCJfxsXJNOykvYzO2XE4tGwVYwcuKgvL1BTN7pAc1xHbTO1M3GfFRKz2KvHXH7/wbnuv5ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6858
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
Cc: christian.koenig@amd.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+Alex]

On 2023-11-17 16:44, Felix Kuehling wrote:

> This reverts commit 71a7974ac7019afeec105a54447ae1dc7216cbb3.
>
> These helper functions are needed for KFD to export and import DMABufs
> the right way without duplicating the tracking of DMABufs associated with
> GEM objects while ensuring that move notifier callbacks are working as
> intended.
>
> CC: Christian König <christian.koenig@amd.com>
> CC: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>

Re: our discussion about v2 of this patch: If this version is 
acceptable, can I get an R-b or A-b?

I would like to get this patch into drm-next as a prerequisite for 
patches 2 and 3. I cannot submit it to the current amd-staging-drm-next 
because the patch I'm reverting doesn't exist there yet.

Patch 2 and 3 could go into drm-next as well, or go through Alex's 
amd-staging-drm-next branch once patch 1 is in drm-next. Alex, how do 
you prefer to coordinate this?

Regards,
   Felix


> ---
>   drivers/gpu/drm/drm_prime.c | 33 ++++++++++++++++++---------------
>   include/drm/drm_prime.h     |  7 +++++++
>   2 files changed, 25 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 63b709a67471..834a5e28abbe 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -278,7 +278,7 @@ void drm_gem_dmabuf_release(struct dma_buf *dma_buf)
>   }
>   EXPORT_SYMBOL(drm_gem_dmabuf_release);
>   
> -/*
> +/**
>    * drm_gem_prime_fd_to_handle - PRIME import function for GEM drivers
>    * @dev: drm_device to import into
>    * @file_priv: drm file-private structure
> @@ -292,9 +292,9 @@ EXPORT_SYMBOL(drm_gem_dmabuf_release);
>    *
>    * Returns 0 on success or a negative error code on failure.
>    */
> -static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> -				      struct drm_file *file_priv, int prime_fd,
> -				      uint32_t *handle)
> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> +			       struct drm_file *file_priv, int prime_fd,
> +			       uint32_t *handle)
>   {
>   	struct dma_buf *dma_buf;
>   	struct drm_gem_object *obj;
> @@ -360,6 +360,7 @@ static int drm_gem_prime_fd_to_handle(struct drm_device *dev,
>   	dma_buf_put(dma_buf);
>   	return ret;
>   }
> +EXPORT_SYMBOL(drm_gem_prime_fd_to_handle);
>   
>   int drm_prime_fd_to_handle_ioctl(struct drm_device *dev, void *data,
>   				 struct drm_file *file_priv)
> @@ -408,7 +409,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>   	return dmabuf;
>   }
>   
> -/*
> +/**
>    * drm_gem_prime_handle_to_fd - PRIME export function for GEM drivers
>    * @dev: dev to export the buffer from
>    * @file_priv: drm file-private structure
> @@ -421,10 +422,10 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>    * The actual exporting from GEM object to a dma-buf is done through the
>    * &drm_gem_object_funcs.export callback.
>    */
> -static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
> -				      struct drm_file *file_priv, uint32_t handle,
> -				      uint32_t flags,
> -				      int *prime_fd)
> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
> +			       struct drm_file *file_priv, uint32_t handle,
> +			       uint32_t flags,
> +			       int *prime_fd)
>   {
>   	struct drm_gem_object *obj;
>   	int ret = 0;
> @@ -506,6 +507,7 @@ static int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>   
>   	return ret;
>   }
> +EXPORT_SYMBOL(drm_gem_prime_handle_to_fd);
>   
>   int drm_prime_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>   				 struct drm_file *file_priv)
> @@ -864,9 +866,9 @@ EXPORT_SYMBOL(drm_prime_get_contiguous_size);
>    * @obj: GEM object to export
>    * @flags: flags like DRM_CLOEXEC and DRM_RDWR
>    *
> - * This is the implementation of the &drm_gem_object_funcs.export functions
> - * for GEM drivers using the PRIME helpers. It is used as the default for
> - * drivers that do not set their own.
> + * This is the implementation of the &drm_gem_object_funcs.export functions for GEM drivers
> + * using the PRIME helpers. It is used as the default in
> + * drm_gem_prime_handle_to_fd().
>    */
>   struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>   				     int flags)
> @@ -962,9 +964,10 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>    * @dev: drm_device to import into
>    * @dma_buf: dma-buf object to import
>    *
> - * This is the implementation of the gem_prime_import functions for GEM
> - * drivers using the PRIME helpers. It is the default for drivers that do
> - * not set their own &drm_driver.gem_prime_import.
> + * This is the implementation of the gem_prime_import functions for GEM drivers
> + * using the PRIME helpers. Drivers can use this as their
> + * &drm_driver.gem_prime_import implementation. It is used as the default
> + * implementation in drm_gem_prime_fd_to_handle().
>    *
>    * Drivers must arrange to call drm_prime_gem_destroy() from their
>    * &drm_gem_object_funcs.free hook when using this function.
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index a7abf9f3e697..2a1d01e5b56b 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -60,12 +60,19 @@ enum dma_data_direction;
>   
>   struct drm_device;
>   struct drm_gem_object;
> +struct drm_file;
>   
>   /* core prime functions */
>   struct dma_buf *drm_gem_dmabuf_export(struct drm_device *dev,
>   				      struct dma_buf_export_info *exp_info);
>   void drm_gem_dmabuf_release(struct dma_buf *dma_buf);
>   
> +int drm_gem_prime_fd_to_handle(struct drm_device *dev,
> +			       struct drm_file *file_priv, int prime_fd, uint32_t *handle);
> +int drm_gem_prime_handle_to_fd(struct drm_device *dev,
> +			       struct drm_file *file_priv, uint32_t handle, uint32_t flags,
> +			       int *prime_fd);
> +
>   /* helper functions for exporting */
>   int drm_gem_map_attach(struct dma_buf *dma_buf,
>   		       struct dma_buf_attachment *attach);
