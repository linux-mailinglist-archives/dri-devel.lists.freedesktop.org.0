Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED3F42CF54
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 01:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F806E10D;
	Wed, 13 Oct 2021 23:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7D6E10D;
 Wed, 13 Oct 2021 23:56:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227524533"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227524533"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:56:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="524838563"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 13 Oct 2021 16:56:41 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 16:56:40 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 16:56:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 16:56:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 16:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvjtZZARGH1S8KaC5YNzO16QGZEsySw3YAkNfYiAMqn05hnU/pqTnWdWQVtmwfxSyehOLPnWYO+Bl4ma2LcTr4H2ZJ+eiyaLISlPnaJbFLH2leKZaiTaMLrkDsFWGolWoW985Ubg2Mnc94u0sIuJ/AGYjtIELNJdl/WFRLyTAGx2frPxu7EzSYXxZTjXvWU/VxtqRbOLgTPmKq4uY4Zuh/pzngJODn/4Qj0jrl3iL3dPubAHA6SYbizYe1EzUkHl5QrU/d77ZKLdkiIRydK66S0ArnOTgQhpzej5TtYj2LQ2UvxHSQ7ctdxR0IitAthWCqpNsIeHaXh/qBsobHXsSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckyV6dss6e0Y0WQpwj3mms8mECq8jrp64nVnvxwDguc=;
 b=c7Y6phhcBhL4r/Qmj/Fhzj1bveuJ/waUYyZdmWJ0JQkTB1ys2no9JoBv9V0mdrj8qpblo6LytFleB0C4Oo9ysG8AZe6ptmOqJAgOOMz6ldIiTTlu64+F9rYQV6q0JH/Ae5mAvSWYcB3jA5qtNJBBniWvplmvS+CkjyygstqsIoo9zB1LLQ2jPI3cV4CRWTKVN1/hLhVRyxTbHdO9XWoBAOh8//hB8u45+4dlqSFRBLQ9jNBfYMg2HlgC6VCIIeyvbzY1QfQv8hI4m4dmVSYKd4ZAmYhCI/x03eHcsnIqypL+H8Ozu1FsgUvuPp1X+VHHIqX/5KQtmYUElxDWA2yqGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckyV6dss6e0Y0WQpwj3mms8mECq8jrp64nVnvxwDguc=;
 b=FGlGws2v2RCfCABiatChU4PYN5RIr4BXl3ws8IQijjvpsD0cptXLb7PAKe8Xql8ek3aR26ilxy8gxwx6T7/QY+PDXtTBLnrB8cULs/No+fvR1Dl3au3EI6ooaTGRDZp2YtzJcEpWDgSzyQywrvxH4Uky3ygHhYLoJg0OLHy80Ew=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5610.namprd11.prod.outlook.com (2603:10b6:510:e9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Wed, 13 Oct
 2021 23:56:38 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 23:56:38 +0000
Subject: Re: [PATCH 01/25] drm/i915/guc: Move GuC guc_id allocation under
 submission state sub-struct
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-2-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <47710db9-235c-5cee-2924-6854b5cd1b11@intel.com>
Date: Wed, 13 Oct 2021 16:56:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MW4PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:303:b5::31) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MW4PR03CA0296.namprd03.prod.outlook.com (2603:10b6:303:b5::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 23:56:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcc4223f-b34a-489e-42f0-08d98ea51898
X-MS-TrafficTypeDiagnostic: PH0PR11MB5610:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5610BE773771B91AEFDCD310BDB79@PH0PR11MB5610.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c/3WeeTrfKH3DZHITbz2Ky8UQOv2FGPmb3VlIP8p0bzo42DLPfK+R373yxBrh0QpVb3QqKkkEogVQ2wOwWfQBnHBLMEXrG4fyIbTrZoROpHsQXCzm9AaaDLN3bxqZVPifsg6hl40zzPqlrJFD4rnvpkunKnw6Qs5t17p9wbTzEY2/0Wmyfuy2nmuugui4/LzogjOnctpgtzB0gabuDz4ZCR61HLyckWXjlnx/PBp+d0+nJDi4dYtv3WDdzzgjGTYotBMnLl0ix/kcKuay9/HqoCoa30o3dSwsUkIyUyMs76PZW216FVSO22zIiWH0f5IwAv+/vymfeP0Wyt9KtcA6MwWqU+U5FPBMfnOhigl+GR5yYrBH87OY3NtvhPWuSExi6/qSa1rb55ioRbLQOaUTCQIc6GVwanVCW75TOEBNBljVqYVYm6npIDGzQXxzcDIhNMronZY2GC3u96Q0Of5uYW2YELodFULVuOw7VurJ0qgrVghF+s6p/TXmaB3n/ykjZunjEF1q19OyCmQGxG96U3607/zVLgPk2qGiX1gLeWsyA7Ybp5vaV194jeYxYZgh+cWMmc0zdhwwxnEgL+kkndf8TUq6O36/Ov/vbeqk+Fz093/oOde2LBOHt/JPi8RnpSEnBNrGT34ASDT/Ormc0i5p02BapzbkmxQmBC3zRIHfQ62nM3h8CAiMjW3ecuzu8yA2vyLTTP1aA/88FqlVncnz5lRwrvuRwrAb30zV8P/wSOM3jKHcPDkbMp76172
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(26005)(31696002)(2906002)(36756003)(8676002)(38100700002)(8936002)(53546011)(6486002)(186003)(16576012)(66476007)(66946007)(66556008)(5660300002)(31686004)(316002)(450100002)(86362001)(83380400001)(82960400001)(2616005)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmwxY3A4cHhrZ0ZBMWVSTDVIUUIwUTh2RGtRdnVwQ1ppYzFBSkhnb1ZWdERM?=
 =?utf-8?B?cndIWDlpTlJNdTlHZU13dUhJRncwY1hQWS9HZDU3WlFQNFFLbWUrUElkSnhy?=
 =?utf-8?B?WllsaXJ6Nlo2Sk1weHV5M2VieUdTNHAxbmlpT0FrK3JPQTEwYmN4cXpiQWc3?=
 =?utf-8?B?cm41ZGJmMGpnZDRLZTJWWWxsMVNDVDJxeVRWVldlTUhjNCtMU0NiTk5peWpB?=
 =?utf-8?B?ckdVbHdObUhEbnQzdS9oTkptMWRCOHpNdENjUTVxbG0zMGVWQWl3Y0RNdU5V?=
 =?utf-8?B?V1VrTzhTZEdjcEFWbXlrMUY0aEpqeE9nc1N6ZWdYK1pGVHlwTjQ1dzNma2F0?=
 =?utf-8?B?WTJKUWNRZ0NiRlBRaklvM0FKUGVRNFVoSDRrMGlISjdDQzFBK3NZZ284dHpU?=
 =?utf-8?B?NTZUOVZRL0dodUtleXo2SGNKU1pJdDdNVU9iNklmOFNoUGxRQ1dsWVdHQURO?=
 =?utf-8?B?R3J1blRaVHFSa1pTMk0yZDhyL1g5MlZZNHJDQmtrblFkR1BvbGQxbFh1WnMw?=
 =?utf-8?B?Z1lnWDd2V1hBM3JaaElSbzh4eTY5U3ZKSVc0MEo3cnZzdHp0dkJkSkVQdU5w?=
 =?utf-8?B?YXMwU2tuMVpTMVZyUmZ5TnA1eGhnWmpDdkRTOG13emh1TzhFdHkyaTlCTC85?=
 =?utf-8?B?RTRhQnpZbnhOSzJPRUFWVXZOZjRydFIyWXIvNTM2S05PZzJ3cFd3VkNwQmJV?=
 =?utf-8?B?cXFsYWZMSHdZV0pta2NweDA5dWdqNW11M3BSSC9ZME9yM2dhYno3bVh6bzJR?=
 =?utf-8?B?V2xvWTNRYldUcWxFWFAvTGpVS3NoeWJTZ0kra09ySS9PTHVMdlNpTEF1Ymlu?=
 =?utf-8?B?ZElHOEhiNm1kWC9iNW9LVklPTkF6NmdzRm5rS1JFSG1PcHJKOGtaMi9yYzI3?=
 =?utf-8?B?SWkwbGpGSzlmQW4vZy9oK0tTTXZjMzdiTU5FR2RiS3pVTm1CRnVGWS92eSti?=
 =?utf-8?B?dU1kRnJ6QVlNNFk2SGRlVHR0aWs2ZjZXVjVIay9USUY5dlgyWEsvUHhyS0lK?=
 =?utf-8?B?ZGs3Z0h6NWM2aDhYdU9ZSjJlSnRLK2VnMXR1S3RaUTRwM1FvZTAycTFpcWZp?=
 =?utf-8?B?eEdIeWxXSnF0N1pPZzVveWFPTlg3TXAvbEoxdlB6WEwrVnFtaC9RRnBpb1Vm?=
 =?utf-8?B?cUhSOUMzL0lHV05TQXd0WHR5U1lnbVl5TFB2MitlcW85b2ZUMklFV1FYQ2JF?=
 =?utf-8?B?S2Jxc29hQlJqbFRHSjVFWTc1aDVZZWI5WEw0UzhGVEVQT0V2dCtHbHVuSS9G?=
 =?utf-8?B?SExaMHF4bzRqa2dUYTZZVkJUZll6VEdaaS9OMmIxUmsycFFBc3I4T1IyNXR0?=
 =?utf-8?B?QnNrUXBiQVo4OUh6OVdwNjBURDF0ZXdlUndqS1RqVWVrdVZmM2FnVUk1bmcr?=
 =?utf-8?B?eVBuZ0NJODZ1bERocmFPb2hTcGpROXpJSXRha00zZ3pLSUxHME9LT2RUbDJY?=
 =?utf-8?B?QjZsekJvd0JvT1YxUTN2RnYyY0hHMURwNjB6dlR2Z0lSSjVPcCtkSHN5OFov?=
 =?utf-8?B?R1c4VVVYZ0daMHV1UzJnRjA3dTdhL0owQmxDbzZmOG9jMS9hWVp6UmxIVUha?=
 =?utf-8?B?SmRNTWVmZzFqbWRyRjVYY1JGSXpPZUlONTF2Si9NUFlrQWJVZ1QyTTdoZXph?=
 =?utf-8?B?MTFTSUZOaHBEMlNnZjAxQVUxbG9vaTI5RDV5NjZTdExvMVdieFBhOTdPOGlN?=
 =?utf-8?B?QXhKNEwrNFp3bEVkbUdKVUdlblRFblYrbUJzYzRtQk1ueEd6U0RoYjREa1E5?=
 =?utf-8?Q?JazR/TTMaTbm9dU6gujng1o+SDDjnib8zOT0mAv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcc4223f-b34a-489e-42f0-08d98ea51898
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 23:56:38.4389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KB/+IblDf7i6xLtyyLz8sFceRs6j2Zs4YS1sPeyAkLLuFkrvovjFfL1bgqosNjC8gmUFfpPWN+fP+eUMB3MAR7peZsqmOKjct9paqCzfuQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5610
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

On 10/13/2021 13:42, Matthew Brost wrote:
> Move guc_id allocation under submission state sub-struct as a future
> patch will reuse the spin lock as a global submission state lock. Moving
> this into sub-struct makes ownership of fields / lock clear.
>
> v2:
>   (Docs)
>    - Add comment for submission_state sub-structure
> v3:
>   (John Harrison)
>    - Fixup a few comments
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context_types.h |  6 +--
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        | 28 +++++++----
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 48 ++++++++++---------
>   3 files changed, 47 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 12252c411159..e7e3984aab78 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -197,18 +197,18 @@ struct intel_context {
>   	struct {
>   		/**
>   		 * @id: handle which is used to uniquely identify this context
> -		 * with the GuC, protected by guc->contexts_lock
> +		 * with the GuC, protected by guc->submission_state.lock
>   		 */
>   		u16 id;
>   		/**
>   		 * @ref: the number of references to the guc_id, when
>   		 * transitioning in and out of zero protected by
> -		 * guc->contexts_lock
> +		 * guc->submission_state.lock
>   		 */
>   		atomic_t ref;
>   		/**
>   		 * @link: in guc->guc_id_list when the guc_id has no refs but is
> -		 * still valid, protected by guc->contexts_lock
> +		 * still valid, protected by guc->submission_state.lock
>   		 */
>   		struct list_head link;
>   	} guc_id;
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 5dd174babf7a..82e248c2290c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -71,16 +71,26 @@ struct intel_guc {
>   	} interrupts;
>   
>   	/**
> -	 * @contexts_lock: protects guc_ids, guc_id_list, ce->guc_id.id, and
> -	 * ce->guc_id.ref when transitioning in and out of zero
> +	 * @submission_state: sub-structure for submission state protected by
> +	 * single lock
>   	 */
> -	spinlock_t contexts_lock;
> -	/** @guc_ids: used to allocate unique ce->guc_id.id values */
> -	struct ida guc_ids;
> -	/**
> -	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
> -	 */
> -	struct list_head guc_id_list;
> +	struct {
> +		/**
> +		 * @lock: protects everything in submission_state,
> +		 * ce->guc_id.id, and ce->guc_id.ref when transitioning in and
> +		 * out of zero
> +		 */
> +		spinlock_t lock;
> +		/**
> +		 * @guc_ids: used to allocate new guc_ids
> +		 */
> +		struct ida guc_ids;
> +		/**
> +		 * @guc_id_list: list of intel_context with valid guc_ids but no
> +		 * refs
> +		 */
> +		struct list_head guc_id_list;
> +	} submission_state;
>   
>   	/**
>   	 * @submission_supported: tracks whether we support GuC submission on
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index ba0de35f6323..b2646b088c7f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -68,14 +68,14 @@
>    * fence is used to stall all requests associated with this guc_id until the
>    * corresponding G2H returns indicating the guc_id has been deregistered.
>    *
> - * guc_ids:
> + * submission_state.guc_ids:
>    * Unique number associated with private GuC context data passed in during
>    * context registration / submission / deregistration. 64k available. Simple ida
>    * is used for allocation.
>    *
>    * Stealing guc_ids:
>    * If no guc_ids are available they can be stolen from another context at
> - * request creation time if that context is unpinned. If a guc_id can't be found
> + * request creation time if that context is unpinned. If a guc_id an't be found
Oops?

John.


>    * we punt this problem to the user as we believe this is near impossible to hit
>    * during normal use cases.
>    *
> @@ -89,7 +89,7 @@
>    * sched_engine can be submitting at a time. Currently only one sched_engine is
>    * used for all of GuC submission but that could change in the future.
>    *
> - * guc->contexts_lock
> + * guc->submission_state.lock
>    * Protects guc_id allocation for the given GuC, i.e. only one context can be
>    * doing guc_id allocation operations at a time for each GuC in the system.
>    *
> @@ -103,7 +103,7 @@
>    *
>    * Lock ordering rules:
>    * sched_engine->lock -> ce->guc_state.lock
> - * guc->contexts_lock -> ce->guc_state.lock
> + * guc->submission_state.lock -> ce->guc_state.lock
>    *
>    * Reset races:
>    * When a full GT reset is triggered it is assumed that some G2H responses to
> @@ -1148,9 +1148,9 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   
>   	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
>   
> -	spin_lock_init(&guc->contexts_lock);
> -	INIT_LIST_HEAD(&guc->guc_id_list);
> -	ida_init(&guc->guc_ids);
> +	spin_lock_init(&guc->submission_state.lock);
> +	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
> +	ida_init(&guc->submission_state.guc_ids);
>   
>   	return 0;
>   }
> @@ -1215,7 +1215,7 @@ static void guc_submit_request(struct i915_request *rq)
>   
>   static int new_guc_id(struct intel_guc *guc)
>   {
> -	return ida_simple_get(&guc->guc_ids, 0,
> +	return ida_simple_get(&guc->submission_state.guc_ids, 0,
>   			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
>   			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>   }
> @@ -1223,7 +1223,8 @@ static int new_guc_id(struct intel_guc *guc)
>   static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	if (!context_guc_id_invalid(ce)) {
> -		ida_simple_remove(&guc->guc_ids, ce->guc_id.id);
> +		ida_simple_remove(&guc->submission_state.guc_ids,
> +				  ce->guc_id.id);
>   		reset_lrc_desc(guc, ce->guc_id.id);
>   		set_context_guc_id_invalid(ce);
>   	}
> @@ -1235,9 +1236,9 @@ static void release_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   {
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   	__release_guc_id(guc, ce);
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
>   static int steal_guc_id(struct intel_guc *guc)
> @@ -1245,10 +1246,10 @@ static int steal_guc_id(struct intel_guc *guc)
>   	struct intel_context *ce;
>   	int guc_id;
>   
> -	lockdep_assert_held(&guc->contexts_lock);
> +	lockdep_assert_held(&guc->submission_state.lock);
>   
> -	if (!list_empty(&guc->guc_id_list)) {
> -		ce = list_first_entry(&guc->guc_id_list,
> +	if (!list_empty(&guc->submission_state.guc_id_list)) {
> +		ce = list_first_entry(&guc->submission_state.guc_id_list,
>   				      struct intel_context,
>   				      guc_id.link);
>   
> @@ -1273,7 +1274,7 @@ static int assign_guc_id(struct intel_guc *guc, u16 *out)
>   {
>   	int ret;
>   
> -	lockdep_assert_held(&guc->contexts_lock);
> +	lockdep_assert_held(&guc->submission_state.lock);
>   
>   	ret = new_guc_id(guc);
>   	if (unlikely(ret < 0)) {
> @@ -1295,7 +1296,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	GEM_BUG_ON(atomic_read(&ce->guc_id.ref));
>   
>   try_again:
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   
>   	might_lock(&ce->guc_state.lock);
>   
> @@ -1310,7 +1311,7 @@ static int pin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	atomic_inc(&ce->guc_id.ref);
>   
>   out_unlock:
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   
>   	/*
>   	 * -EAGAIN indicates no guc_id are available, let's retire any
> @@ -1346,11 +1347,12 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
>   	if (unlikely(context_guc_id_invalid(ce)))
>   		return;
>   
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   	if (!context_guc_id_invalid(ce) && list_empty(&ce->guc_id.link) &&
>   	    !atomic_read(&ce->guc_id.ref))
> -		list_add_tail(&ce->guc_id.link, &guc->guc_id_list);
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +		list_add_tail(&ce->guc_id.link,
> +			      &guc->submission_state.guc_id_list);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   }
>   
>   static int __guc_action_register_context(struct intel_guc *guc,
> @@ -1921,16 +1923,16 @@ static void guc_context_destroy(struct kref *kref)
>   	 * returns indicating this context has been deregistered the guc_id is
>   	 * returned to the pool of available guc_id.
>   	 */
> -	spin_lock_irqsave(&guc->contexts_lock, flags);
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
>   	if (context_guc_id_invalid(ce)) {
> -		spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   		__guc_context_destroy(ce);
>   		return;
>   	}
>   
>   	if (!list_empty(&ce->guc_id.link))
>   		list_del_init(&ce->guc_id.link);
> -	spin_unlock_irqrestore(&guc->contexts_lock, flags);
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
>   
>   	/* Seal race with Reset */
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);

