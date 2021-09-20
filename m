Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF284128FC
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 00:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AB66E4D7;
	Mon, 20 Sep 2021 22:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142666E4D7;
 Mon, 20 Sep 2021 22:44:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="245658994"
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; 
 d="scan'208,217";a="245658994"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 15:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,309,1624345200"; 
 d="scan'208,217";a="612718008"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2021 15:44:24 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 20 Sep 2021 15:44:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 20 Sep 2021 15:44:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 20 Sep 2021 15:44:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuPQ//wbd0Og7OklWWQVej44EZFTT84HxAtYJRyUPrh24TJoQd7OiCF1mg+LAHTeWLHVBpcO2A7bmJFaOTtnNYvRSUa0BtGHTW2CNzECuwZryJ4lciuEycqBHXTN8B7/t0ooHbN0b7xvXYRhuVAZABKFSLSVXsBJoXELHFLplGQ/VCHTzNlVx5xnLcwyeDwaiUkcQgZjDUv2y6FmrIfHJ+EByP2CKYBJqRMqlXJeHS+Av8n3NU91YpFGtnxhvDs+XLBwj0OBUBq4Q4QqyS1hqBeDxi1yTP+ohCW553leiMzPchkemWkpfOC0FSn6vBDcuJ0Ge1u6wrodg+xviEEdpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Ap76754nrJ87xUHtTtt1O/FLM6xQqs1bv96ycKbIado=;
 b=UZ0L+xEXLTztuDkFPRB2JI60H8EUwgwsgIn7hJCnkduZmA5voleEjpN1I0hK4wWzVz3rvquPXlsQXHWPh7grGK714WZ7lSAnL2XwoXesyhSutp4Nmls5h+ded1IOsKhj+O4SvPAFvYqp8GA0aRp0HD9rZMfd+rXVBUmAONlfPDZRH+/Xd8FR/6ot3l9NTVHwlU8krI6Jo4sZyyr4OaI76zsTlEAy9sgS6HwqNvzFI94omTA/OM4derfk1RJOehq9lcwy7bxLl5X3QoaMNpNVbWrmYJtFR2KO4Yfh9+CuEbbro3S6ZHaloMLhtdY+qBZnu68zuoavvY4L6hB2E5jV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ap76754nrJ87xUHtTtt1O/FLM6xQqs1bv96ycKbIado=;
 b=GgXc/dw6NnDKF4Ixlfsf9XkNuzkOlSFSCEnLNbU9CHHHp77hZ2yO5ahrPWFL0o2tS8q6zIsKIxheli7DcolwSjp5t2PEGMA9UMMx26x093ACm631td1q++fW1qJ4ZEir6bbKE2EL10v2dFplLCV3bhrkuxG7jYLid2V/dpdihPk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5676.namprd11.prod.outlook.com (2603:10b6:510:ea::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Mon, 20 Sep
 2021 22:44:22 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%7]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 22:44:22 +0000
Subject: Re: [Intel-gfx] [PATCH 17/27] drm/i915/guc: Implement multi-lrc reset
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-18-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <174cb140-6d0c-5862-1cdb-79aa17c3a8e3@intel.com>
Date: Mon, 20 Sep 2021 15:44:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20210820224446.30620-18-matthew.brost@intel.com>
Content-Type: multipart/alternative;
 boundary="------------D6FD3B98836C46062740A9F1"
Content-Language: en-GB
X-ClientProxiedBy: CO1PR15CA0046.namprd15.prod.outlook.com
 (2603:10b6:101:1f::14) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 CO1PR15CA0046.namprd15.prod.outlook.com (2603:10b6:101:1f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Mon, 20 Sep 2021 22:44:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de0ef726-0922-4b0e-0096-08d97c8830b9
X-MS-TrafficTypeDiagnostic: PH0PR11MB5676:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB5676565FC6C43ACCFB88EA9EBDA09@PH0PR11MB5676.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sieBefGTudZH3uYCrHoWfJlyY+KjS3ejl70ULeJIpPkZX8y0cE4sRQpa14kG/rX7vM9lFuMHwak6zyYT1EK8QtEak6FCXlSLZuVoCtHshFjHahgSQlJ3D7Wyp0dcUhejCPWVsmo6yp3RrkWQTFzTDv6g4l5w/Jdem8IgOXTGZa4Q9FpWKM9T4MijWf8gdX9Lqw2rUfEHprUhPJ3vYt8ufvk4Kntywhe1a4alpYy0EfVXiirHp2Gc3V5Cibz0XQOlXRFdqM3owuw9OWjo6ner+f5ReYdXBnMIHeuWBDQb9SrHGYsG1gGRCEFfN2kncdD7DWc/Kz1oqvDIz/p28FB0dkfz5WwH92FLp156v2Pk14mRiIEogSJHpsiDX2rSD+iz0KWOnRZuOPLyFXAPBa3jasSW1fnmYoub4zIGXSxkkY0Iib50lnUsSk4OvUiQ1igZ3Q1t3S9izscVAV34F6h5qeZg8H++8bPEzoL/bKKLt5hpnY5iTuMvV/Kmuiwtm6AOjrsvThU7tfIfjv4MldBAZefozXiHVzAXCbr2g+910uHLYeGiV0enVBsGTDoCsgj2jhv+b0Vq70cgtQVKKjpxMgyosaRnscFzMj+oHJhVGDLr5z9qcI0wnwBaPW1xnxOngFdOxsUoIzLjvW9oFuC7khxair42iw9Q03rCE9bumcQSYLLpISwBD/WZ8oRSY9M+9Ji+0nLGBJV+myJ4QEqNuxavzKJwaWbwsQC7BBegmSA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(2616005)(956004)(107886003)(31696002)(2906002)(8676002)(33964004)(36756003)(316002)(66946007)(508600001)(8936002)(53546011)(38100700002)(86362001)(6486002)(186003)(5660300002)(66556008)(26005)(31686004)(6666004)(30864003)(4326008)(83380400001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZwK2l6TXpSU1FqeGk2SU9oUkF6R2t5Y052Z3dQSGM1YjdzVWUrMGN2UUV6?=
 =?utf-8?B?QzdPRGUvQk16cERnZnpDZ1drdTQvc3BFTVJacFJlRE0vN1A3Q3dINE13VFB4?=
 =?utf-8?B?bVluM1NJM1Z0ZWlOTVBhdVUwM1lHdCtWN3Yxc2ZTQ0EvcUo3aXZ3SXZSYzA4?=
 =?utf-8?B?SnV5SXY1cG9QU0djVHJ1K0FFRURIQ0c0Y1h2Skp6MFkyaElIUGZWZ0lRdS9W?=
 =?utf-8?B?Nis3enphc0hyaWF1dHVseEpaL1BsN2pQMW8vWkZxdm0yclFZYzRLVjdoNlpw?=
 =?utf-8?B?dUJVc3lmS3U1NitaakFOU2JlMkhxS2NZcTUxYTA5a2x6RUxtdXR4M05iRCtw?=
 =?utf-8?B?Q2k2OThrUHY0SVhzWGZWTDBzUlZISitIQjJheWcxRUV2WGlUeVNrUU16U2RW?=
 =?utf-8?B?MUFVeFFQNzNJeUw5UHVyS2JmUW5sN3RKMFFMSTk3VDd3RVd4aXlwdUV6dGJQ?=
 =?utf-8?B?azUzdkhNL2xwQzRQM1NTSUxLU3duSTQ5bXRZdUlpTDVSYkp2YW5LME9MNGFs?=
 =?utf-8?B?TFhkejN6NStYVlRscXhDcmthNjIwdnZjMTJYbmZQdXA4NlpTQTVNcHBFaGUr?=
 =?utf-8?B?anArQ1lkUi9xOGtHamtCUkJYMGlkTU9FeEw0QWo4Zkd1TlpmcDRHRHAvblJk?=
 =?utf-8?B?VkVyZDduUXRHdGtKZmlXL3ZWdmNUM1Z1OUxJV0xzRUZ2L0NTMVg5dWtGdVo4?=
 =?utf-8?B?VnhCUzVEL2JWWDFWZkdYTHVqdzZxNXdHaEdhczNJWGE1QzdreTJmQTI1UkNv?=
 =?utf-8?B?R3dNRUxtbVU2R1hZU2F5eGh2SEtDR2M5ZGRhdUlHWE1QL3I3bDhKMXpEbDhF?=
 =?utf-8?B?R0xOT09MSkxwbGRGaTlyRCtCUTdFbEhZcXZ3UmwyaFAweGtjcmxwRDlleVdS?=
 =?utf-8?B?emFsL0lrUUc1blRqWEZNL3czV1dNR3A1V0FRdHVINm5sclU5a2QwUjFId2la?=
 =?utf-8?B?YnRNODU0OGdaeU82QWp0NFR3WFdCSStEYU13LzZvNWVQSWEzVVVlM3V0REYz?=
 =?utf-8?B?WWNxNnhlek9ZVFhmVHphbllCMXhkbHhpcDlLN0lCbFE3bWVtcFpvQVE1Mjk4?=
 =?utf-8?B?ZVUvMis3V0JTeHVjMjhldEh2WENLY05OK25IcEpZM25qRW13eFhCdlZVU000?=
 =?utf-8?B?ZGQ0N1U1Qk5KNEI2VzBMeE5qSnFhUE9GaXZkMlQxNklGTmFUMjdTamQ4UUpI?=
 =?utf-8?B?dVAyN043d005NG1CUzdtemRlY3dhNW5kS0c4cG5mZSswcWpDNG5JbEU3TFlX?=
 =?utf-8?B?VGVDZGhDK2NiTWZaRncvZHFqbzhhaE9UY2l2NHdhUW85dGdPV1oyK0sxNXZk?=
 =?utf-8?B?bVZmWHBXQ0c1aVJ0dFBhNlcrY2pzb2hicDAvbFp4UmJDcmZRSnZqZXYzS0hj?=
 =?utf-8?B?NW9qVC9PNWhDczUrSFRrV215Z1BpZ2FJQ0Jpdk9EdXlKUGVaajF0dzROZTh0?=
 =?utf-8?B?c05YUmhUZmF1STFKdVFYMFphWmJSOHZPKzJRQzl4dWVnSUNVRzZMUWYxRVZ0?=
 =?utf-8?B?WXp2UVo0cklwUk1MQzFFU2pORU1GVDBUL0dVcWhyWGlXVTFubVpNSUk5VURz?=
 =?utf-8?B?Tm81NzVCVEd1UVJTOEx6ZC94QVJ0Mnc4cHVTa3piWnZuaVhLVS9kQk9Sd1B1?=
 =?utf-8?B?OE1kTFhVR0p2UEVmY0JoUUkySC9pMXY0d2xMRUpDYjdGVTVHb0pLRmJnUEtt?=
 =?utf-8?B?d0cwMFhVS2IrT1Rwemh3RUxnYkVsRzBQZkdVQ1pwZmRWS1QzckpBbmQ0aTYy?=
 =?utf-8?Q?E97sCLMys4zRMZCejXPXh1ScE896pB8of52AVgz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de0ef726-0922-4b0e-0096-08d97c8830b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2021 22:44:22.6329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ohK4QhxmDDskvVhOqwsq2dsZx6/rmKlwoWwl6J6XCcDwxgs3XDgvi2BR0NJe5V7wa4mc2rSulzYuzWgKQyA3QtEh8WEbfacbgQNM1f1oPnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5676
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

--------------D6FD3B98836C46062740A9F1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/2021 15:44, Matthew Brost wrote:
> Update context and full GPU reset to work with multi-lrc. The idea is
> parent context tracks all the active requests inflight for itself and
> its' children. The parent context owns the reset replaying / canceling
its' -> its

> requests as needed.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       | 11 ++--
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 63 +++++++++++++------
>   2 files changed, 51 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 00d1aee6d199..5615be32879c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -528,20 +528,21 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
>   
>   struct i915_request *intel_context_find_active_request(struct intel_context *ce)
>   {
> +	struct intel_context *parent = intel_context_to_parent(ce);
>   	struct i915_request *rq, *active = NULL;
>   	unsigned long flags;
>   
>   	GEM_BUG_ON(!intel_engine_uses_guc(ce->engine));
Should this not check the parent as well/instead?

And to be clear, this can be called on regular contexts (where ce == 
parent) and on both the parent or child contexts of multi-LRC contexts 
(where ce may or may not match parent)?


>   
> -	spin_lock_irqsave(&ce->guc_state.lock, flags);
> -	list_for_each_entry_reverse(rq, &ce->guc_state.requests,
> +	spin_lock_irqsave(&parent->guc_state.lock, flags);
> +	list_for_each_entry_reverse(rq, &parent->guc_state.requests,
>   				    sched.link) {
> -		if (i915_request_completed(rq))
> +		if (i915_request_completed(rq) && rq->context == ce)
'rq->context == ce' means:

 1. single-LRC context, rq is owned by ce
 2. multi-LRC context, ce is child, rq really belongs to ce but is being
    tracked by parent
 3. multi-LRC context, ce is parent, rq really is owned by ce

So when 'rq->ce != ce', it means that the request is owned by a 
different child to 'ce' but within the same multi-LRC group. So we want 
to ignore that request and keep searching until we find one that is 
really owned by the target ce?

>   			break;
>   
> -		active = rq;
> +		active = (rq->context == ce) ? rq : active;
Would be clearer to say 'if(rq->ce != ce) continue;' and leave 'active = 
rq;' alone?

And again, the intention is to ignore requests that are owned by other 
members of the same multi-LRC group?

Would be good to add some documentation to this function to explain the 
above (assuming my description is correct?).

>   	}
> -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	spin_unlock_irqrestore(&parent->guc_state.lock, flags);
>   
>   	return active;
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index f0b60fecf253..e34e0ea9136a 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -670,6 +670,11 @@ static int rq_prio(const struct i915_request *rq)
>   	return rq->sched.attr.priority;
>   }
>   
> +static inline bool is_multi_lrc(struct intel_context *ce)
> +{
> +	return intel_context_is_parallel(ce);
> +}
> +
>   static bool is_multi_lrc_rq(struct i915_request *rq)
>   {
>   	return intel_context_is_parallel(rq->context);
> @@ -1179,10 +1184,13 @@ __unwind_incomplete_requests(struct intel_context *ce)
>   
>   static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   {
> +	bool local_stalled;
>   	struct i915_request *rq;
>   	unsigned long flags;
>   	u32 head;
> +	int i, number_children = ce->guc_number_children;
If this is a child context, does it not need to pull the child count 
from the parent? Likewise the list/link pointers below? Or does each 
child context have a full list of its siblings + parent?

>   	bool skip = false;
> +	struct intel_context *parent = ce;
>   
>   	intel_context_get(ce);
>   
> @@ -1209,25 +1217,34 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
>   	if (unlikely(skip))
>   		goto out_put;
>   
> -	rq = intel_context_find_active_request(ce);
> -	if (!rq) {
> -		head = ce->ring->tail;
> -		stalled = false;
> -		goto out_replay;
> -	}
> +	for (i = 0; i < number_children + 1; ++i) {
> +		if (!intel_context_is_pinned(ce))
> +			goto next_context;
> +
> +		local_stalled = false;
> +		rq = intel_context_find_active_request(ce);
> +		if (!rq) {
> +			head = ce->ring->tail;
> +			goto out_replay;
> +		}
>   
> -	if (!i915_request_started(rq))
> -		stalled = false;
> +		GEM_BUG_ON(i915_active_is_idle(&ce->active));
> +		head = intel_ring_wrap(ce->ring, rq->head);
>   
> -	GEM_BUG_ON(i915_active_is_idle(&ce->active));
> -	head = intel_ring_wrap(ce->ring, rq->head);
> -	__i915_request_reset(rq, stalled);
> +		if (i915_request_started(rq))
Why change the ordering of the started test versus the wrap/reset call? 
Is it significant? Why is it now important to be reversed?

> +			local_stalled = true;
>   
> +		__i915_request_reset(rq, local_stalled && stalled);
>   out_replay:
> -	guc_reset_state(ce, head, stalled);
> -	__unwind_incomplete_requests(ce);
> +		guc_reset_state(ce, head, local_stalled && stalled);
> +next_context:
> +		if (i != number_children)
> +			ce = list_next_entry(ce, guc_child_link);
Can this not be put in to the step clause of the for statement?

> +	}
> +
> +	__unwind_incomplete_requests(parent);
>   out_put:
> -	intel_context_put(ce);
> +	intel_context_put(parent);
As above, I think this function would benefit from some comments to 
explain exactly what is being done and why.

John.

>   }
>   
>   void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
> @@ -1248,7 +1265,8 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
>   
>   		xa_unlock(&guc->context_lookup);
>   
> -		if (intel_context_is_pinned(ce))
> +		if (intel_context_is_pinned(ce) &&
> +		    !intel_context_is_child(ce))
>   			__guc_reset_context(ce, stalled);
>   
>   		intel_context_put(ce);
> @@ -1340,7 +1358,8 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
>   
>   		xa_unlock(&guc->context_lookup);
>   
> -		if (intel_context_is_pinned(ce))
> +		if (intel_context_is_pinned(ce) &&
> +		    !intel_context_is_child(ce))
>   			guc_cancel_context_requests(ce);
>   
>   		intel_context_put(ce);
> @@ -2031,6 +2050,8 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
>   	u16 guc_id;
>   	bool enabled;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
>   	incr_context_blocked(ce);
> @@ -2068,6 +2089,7 @@ static void guc_context_unblock(struct intel_context *ce)
>   	bool enable;
>   
>   	GEM_BUG_ON(context_enabled(ce));
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   
> @@ -2099,11 +2121,14 @@ static void guc_context_unblock(struct intel_context *ce)
>   static void guc_context_cancel_request(struct intel_context *ce,
>   				       struct i915_request *rq)
>   {
> +	struct intel_context *block_context =
> +		request_to_scheduling_context(rq);
> +
>   	if (i915_sw_fence_signaled(&rq->submit)) {
>   		struct i915_sw_fence *fence;
>   
>   		intel_context_get(ce);
> -		fence = guc_context_block(ce);
> +		fence = guc_context_block(block_context);
>   		i915_sw_fence_wait(fence);
>   		if (!i915_request_completed(rq)) {
>   			__i915_request_skip(rq);
> @@ -2117,7 +2142,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
>   		 */
>   		flush_work(&ce_to_guc(ce)->ct.requests.worker);
>   
> -		guc_context_unblock(ce);
> +		guc_context_unblock(block_context);
>   		intel_context_put(ce);
>   	}
>   }
> @@ -2143,6 +2168,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
>   	intel_wakeref_t wakeref;
>   	unsigned long flags;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	guc_flush_submissions(guc);
>   
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);


--------------D6FD3B98836C46062740A9F1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 8/20/2021 15:44, Matthew Brost wrote:<br>
    <blockquote type="cite" cite="mid:20210820224446.30620-18-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">Update context and full GPU reset to work with multi-lrc. The idea is
parent context tracks all the active requests inflight for itself and
its' children. The parent context owns the reset replaying / canceling</pre>
    </blockquote>
    its' -&gt; its<br>
    <br>
    <blockquote type="cite" cite="mid:20210820224446.30620-18-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
requests as needed.

Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/i915/gt/intel_context.c       | 11 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 63 +++++++++++++------
 2 files changed, 51 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
index 00d1aee6d199..5615be32879c 100644
--- a/drivers/gpu/drm/i915/gt/intel_context.c
+++ b/drivers/gpu/drm/i915/gt/intel_context.c
@@ -528,20 +528,21 @@ struct i915_request *intel_context_create_request(struct intel_context *ce)
 
 struct i915_request *intel_context_find_active_request(struct intel_context *ce)
 {
+	struct intel_context *parent = intel_context_to_parent(ce);
 	struct i915_request *rq, *active = NULL;
 	unsigned long flags;
 
 	GEM_BUG_ON(!intel_engine_uses_guc(ce-&gt;engine));</pre>
    </blockquote>
    Should this not check the parent as well/instead?<br>
    <br>
    And to be clear, this can be called on regular contexts (where ce ==
    parent) and on both the parent or child contexts of multi-LRC
    contexts (where ce may or may not match parent)?<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20210820224446.30620-18-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
-	spin_lock_irqsave(&amp;ce-&gt;guc_state.lock, flags);
-	list_for_each_entry_reverse(rq, &amp;ce-&gt;guc_state.requests,
+	spin_lock_irqsave(&amp;parent-&gt;guc_state.lock, flags);
+	list_for_each_entry_reverse(rq, &amp;parent-&gt;guc_state.requests,
 				    sched.link) {
-		if (i915_request_completed(rq))
+		if (i915_request_completed(rq) &amp;&amp; rq-&gt;context == ce)</pre>
    </blockquote>
    'rq-&gt;context == ce' means:<br>
    <ol>
      <li>single-LRC context, rq is owned by ce<br>
      </li>
      <li>multi-LRC context, ce is child, rq really belongs to ce but is
        being tracked by parent</li>
      <li>multi-LRC context, ce is parent, rq really is owned by ce<br>
      </li>
    </ol>
    So when 'rq-&gt;ce != ce', it means that the request is owned by a
    different child to 'ce' but within the same multi-LRC group. So we
    want to ignore that request and keep searching until we find one
    that is really owned by the target ce?<br>
    <br>
    <blockquote type="cite" cite="mid:20210820224446.30620-18-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
 			break;
 
-		active = rq;
+		active = (rq-&gt;context == ce) ? rq : active;</pre>
    </blockquote>
    Would be clearer to say 'if(rq-&gt;ce != ce) continue;' and leave
    'active = rq;' alone?<br>
    <br>
    And again, the intention is to ignore requests that are owned by
    other members of the same multi-LRC group?<br>
    <br>
    Would be good to add some documentation to this function to explain
    the above (assuming my description is correct?).<br>
    <br>
    <blockquote type="cite" cite="mid:20210820224446.30620-18-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	}
-	spin_unlock_irqrestore(&amp;ce-&gt;guc_state.lock, flags);
+	spin_unlock_irqrestore(&amp;parent-&gt;guc_state.lock, flags);
 
 	return active;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index f0b60fecf253..e34e0ea9136a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -670,6 +670,11 @@ static int rq_prio(const struct i915_request *rq)
 	return rq-&gt;sched.attr.priority;
 }
 
+static inline bool is_multi_lrc(struct intel_context *ce)
+{
+	return intel_context_is_parallel(ce);
+}
+
 static bool is_multi_lrc_rq(struct i915_request *rq)
 {
 	return intel_context_is_parallel(rq-&gt;context);
@@ -1179,10 +1184,13 @@ __unwind_incomplete_requests(struct intel_context *ce)
 
 static void __guc_reset_context(struct intel_context *ce, bool stalled)
 {
+	bool local_stalled;
 	struct i915_request *rq;
 	unsigned long flags;
 	u32 head;
+	int i, number_children = ce-&gt;guc_number_children;</pre>
    </blockquote>
    If this is a child context, does it not need to pull the child count
    from the parent? Likewise the list/link pointers below? Or does each
    child context have a full list of its siblings + parent?<br>
    <br>
    <blockquote type="cite" cite="mid:20210820224446.30620-18-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	bool skip = false;
+	struct intel_context *parent = ce;
 
 	intel_context_get(ce);
 
@@ -1209,25 +1217,34 @@ static void __guc_reset_context(struct intel_context *ce, bool stalled)
 	if (unlikely(skip))
 		goto out_put;
 
-	rq = intel_context_find_active_request(ce);
-	if (!rq) {
-		head = ce-&gt;ring-&gt;tail;
-		stalled = false;
-		goto out_replay;
-	}
+	for (i = 0; i &lt; number_children + 1; ++i) {
+		if (!intel_context_is_pinned(ce))
+			goto next_context;
+
+		local_stalled = false;
+		rq = intel_context_find_active_request(ce);
+		if (!rq) {
+			head = ce-&gt;ring-&gt;tail;
+			goto out_replay;
+		}
 
-	if (!i915_request_started(rq))
-		stalled = false;
+		GEM_BUG_ON(i915_active_is_idle(&amp;ce-&gt;active));
+		head = intel_ring_wrap(ce-&gt;ring, rq-&gt;head);
 
-	GEM_BUG_ON(i915_active_is_idle(&amp;ce-&gt;active));
-	head = intel_ring_wrap(ce-&gt;ring, rq-&gt;head);
-	__i915_request_reset(rq, stalled);
+		if (i915_request_started(rq))</pre>
    </blockquote>
    Why change the ordering of the started test versus the wrap/reset
    call? Is it significant? Why is it now important to be reversed?<br>
    <br>
    <blockquote type="cite" cite="mid:20210820224446.30620-18-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
+			local_stalled = true;
 
+		__i915_request_reset(rq, local_stalled &amp;&amp; stalled);
 out_replay:
-	guc_reset_state(ce, head, stalled);
-	__unwind_incomplete_requests(ce);
+		guc_reset_state(ce, head, local_stalled &amp;&amp; stalled);
+next_context:
+		if (i != number_children)
+			ce = list_next_entry(ce, guc_child_link);</pre>
    </blockquote>
    Can this not be put in to the step clause of the for statement?<br>
    <br>
    <blockquote type="cite" cite="mid:20210820224446.30620-18-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
+	}
+
+	__unwind_incomplete_requests(parent);
 out_put:
-	intel_context_put(ce);
+	intel_context_put(parent);</pre>
    </blockquote>
    As above, I think this function would benefit from some comments to
    explain exactly what is being done and why.<br>
    <br>
    John.<br>
    <br>
    <blockquote type="cite" cite="mid:20210820224446.30620-18-matthew.brost@intel.com">
      <pre class="moz-quote-pre" wrap="">
 }
 
 void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
@@ -1248,7 +1265,8 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
 
 		xa_unlock(&amp;guc-&gt;context_lookup);
 
-		if (intel_context_is_pinned(ce))
+		if (intel_context_is_pinned(ce) &amp;&amp;
+		    !intel_context_is_child(ce))
 			__guc_reset_context(ce, stalled);
 
 		intel_context_put(ce);
@@ -1340,7 +1358,8 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
 
 		xa_unlock(&amp;guc-&gt;context_lookup);
 
-		if (intel_context_is_pinned(ce))
+		if (intel_context_is_pinned(ce) &amp;&amp;
+		    !intel_context_is_child(ce))
 			guc_cancel_context_requests(ce);
 
 		intel_context_put(ce);
@@ -2031,6 +2050,8 @@ static struct i915_sw_fence *guc_context_block(struct intel_context *ce)
 	u16 guc_id;
 	bool enabled;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	spin_lock_irqsave(&amp;ce-&gt;guc_state.lock, flags);
 
 	incr_context_blocked(ce);
@@ -2068,6 +2089,7 @@ static void guc_context_unblock(struct intel_context *ce)
 	bool enable;
 
 	GEM_BUG_ON(context_enabled(ce));
+	GEM_BUG_ON(intel_context_is_child(ce));
 
 	spin_lock_irqsave(&amp;ce-&gt;guc_state.lock, flags);
 
@@ -2099,11 +2121,14 @@ static void guc_context_unblock(struct intel_context *ce)
 static void guc_context_cancel_request(struct intel_context *ce,
 				       struct i915_request *rq)
 {
+	struct intel_context *block_context =
+		request_to_scheduling_context(rq);
+
 	if (i915_sw_fence_signaled(&amp;rq-&gt;submit)) {
 		struct i915_sw_fence *fence;
 
 		intel_context_get(ce);
-		fence = guc_context_block(ce);
+		fence = guc_context_block(block_context);
 		i915_sw_fence_wait(fence);
 		if (!i915_request_completed(rq)) {
 			__i915_request_skip(rq);
@@ -2117,7 +2142,7 @@ static void guc_context_cancel_request(struct intel_context *ce,
 		 */
 		flush_work(&amp;ce_to_guc(ce)-&gt;ct.requests.worker);
 
-		guc_context_unblock(ce);
+		guc_context_unblock(block_context);
 		intel_context_put(ce);
 	}
 }
@@ -2143,6 +2168,8 @@ static void guc_context_ban(struct intel_context *ce, struct i915_request *rq)
 	intel_wakeref_t wakeref;
 	unsigned long flags;
 
+	GEM_BUG_ON(intel_context_is_child(ce));
+
 	guc_flush_submissions(guc);
 
 	spin_lock_irqsave(&amp;ce-&gt;guc_state.lock, flags);
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------D6FD3B98836C46062740A9F1--
