Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC173F7F6D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 02:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31A16E43C;
	Thu, 26 Aug 2021 00:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48106E43C;
 Thu, 26 Aug 2021 00:48:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="215793661"
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="215793661"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2021 17:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,352,1620716400"; d="scan'208";a="575545571"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 25 Aug 2021 17:48:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 25 Aug 2021 17:48:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 25 Aug 2021 17:48:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 25 Aug 2021 17:48:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc95yIavbUNBBpEA/psCA6wq5421JkpIpU+3TSAklgLDoMipoWlKNVMDh/XZpEOSdQ0s7j9/GPeRIEIkx4s/0x0REat/IQ6DAUM31yEhwQ75taky//y3Q6E5CyKF7WHGzPcalGY8BH6hJoWCBg6UQHMWTXzINoMhmw4k9LZUtWHKqj1bwvpOec/e76yb5rXumq5+SygOJziWC6a+GYDQdSrzzplVCcu3g8j5xXR4BUTKZw2pBLS96LpTaIl9pPdt1A+mKO48IPEXK+ufCEvBUjuaKdqM69NVkFsYsjrajXb5p3xX414DUXlEP0eanlAJmn4dA9WnOc6D1aT7WBz9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPhGNr1YXe+VGkKxYvFbQjPddYV+OwyI2qx3V+7iiHI=;
 b=J3HmsqUsQ0Q8lcm8TNiPyojeps/COjzz4d0xNltZF+xKbIZ+I3Hxn0BUiwhBaSZTIgneToBZiFCEJwipZyKGZlT6dpyqKh1XDAdsYXidJh/nnm8Hbz5QGQXzOI9ukfjn4Odf9b8l5N87NHMgO7XaD+q0sTUjVZ0n37yc5y3L/+N3eZutSOAZFIcoePV5Z3fqlAKMGFrz8mSfru2C4Kgg7s37tsPOvc4e1hQgou2X2Tk9rZb+A7iWvq6Ug5+NhgyeitqRPajJVCJHsM2B6jlNgFAAr3kKztAybXQNFpGjJfx81ooxn9aUOkZoYz+bIncBno9s7+nuY0Or+r+Baw/2Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LPhGNr1YXe+VGkKxYvFbQjPddYV+OwyI2qx3V+7iiHI=;
 b=KafqpQBAPhGmPmlwmUlb8kwWH7GluNnBy1OrelZGGAC9v/JmfcfVtLF3+rsydFBP79EHOAOLFHrBwm40AHvr6WMyccebDlUR5quOrljsYWK57hYBVN6iJU+L+0h85d3gyDVigoP/l7m3+DuR4OwpXwUiRp8CIHoNFjyRGU5dFbk=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM5PR11MB1419.namprd11.prod.outlook.com (2603:10b6:3:c::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Thu, 26 Aug 2021 00:48:18 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::450:6ab1:b0a:a165%7]) with mapi id 15.20.4457.019; Thu, 26 Aug 2021
 00:48:18 +0000
Subject: Re: [Intel-gfx] [PATCH 21/27] drm/i915/guc: Proper xarray usage for
 contexts_lookup
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <daniel.vetter@ffwll.ch>
References: <20210819061639.21051-1-matthew.brost@intel.com>
 <20210819061639.21051-22-matthew.brost@intel.com>
 <b0a58b7b-25bc-c76c-8b6c-41ae81c3e629@intel.com>
 <20210826004136.GA7677@jons-linux-dev-box>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <7d488358-3eee-908d-3c9a-f01acdcf933d@intel.com>
Date: Wed, 25 Aug 2021 17:48:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210826004136.GA7677@jons-linux-dev-box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: BYAPR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::44) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.65] (99.72.232.53) by
 BYAPR07CA0103.namprd07.prod.outlook.com (2603:10b6:a03:12b::44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 00:48:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad008608-bbe5-4542-50d1-08d9682b31d6
X-MS-TrafficTypeDiagnostic: DM5PR11MB1419:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR11MB14193ABA60B4E9C90E1D7B24F4C79@DM5PR11MB1419.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xinIL/jnPdz0bu1CRSgWFAWkp0Hmm8rlYDx2GAWSo8eTlI7ynNAcUJAGiqnYMkiXttaFfY8Ri0sjo4XbPg7h056JigDlWvCr8SS9Bxuf/rLj21/15e5eD9O4pPdnDS5y7dX+n73x5WwGyEaFAL5ngFUVIFG4lw/Yghc4GjKnBIR6SOz58PnPVv1VQrqKbgIqhfaKPL8kzUTv0nie37ZBi9Y79NTDx0ep4G8BItBMQzONlfH4J58PGUcUuHeHEteHF24zK7S0wuNEWcPKVkRauEp0iuxBNtxhd4o98qfNLghs92REn3/uerMBLScp8xrTv8nwDGGzZkLBNQTddShewyfNOvVxb5SuYHT3e/8J8hAx0gROaM4UAc3Bxy2U0KhH2dap4JlW4HZA56LPQYjJnC1SBNc6N13xTORBWt4QKF7Z40Fz25egxMEtfPrqEnmx0l8vrLZsyvalMiXhlv4pC2hekrevJBCmm1TWsXQA4DcRbOdLqBGJ+Z7m5HS9xjVYBKmQuaA2UaQGp9SeldABzkRZ/dB/wzs0EYsbc9UROjxl0/9kXfabLsIvE3Iva2mQohQmHRDMvg/He14pvhptvssCuV5W7tUFMsZp/U7xssb/KDNKROJlpLEiqlyNOhzvBFrm4KViSTUF9Xdplqg5Maxbj3GRpe9mycPi8ALfh/cZrk8VNpVeOwCdkFCBfG7OBxiZ7PMyVD5PzEB8rsPheKBDA/Np96oRdew4eWtIB2Xw1BVz0xLYy4fOOLqNlk+C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(8936002)(31696002)(53546011)(6862004)(478600001)(6636002)(6486002)(66946007)(66476007)(66556008)(4326008)(38100700002)(2906002)(26005)(956004)(2616005)(36756003)(186003)(31686004)(16576012)(37006003)(8676002)(5660300002)(316002)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHZXTndpQ2ZYOGY2T3JRRk1ZRW10K3RBOFdFVjlJZ0NySCtmQXp6RExKK1lP?=
 =?utf-8?B?ODVaQ2NjRURwUVRxY3NadDBqbzhON1IreDBRTlpmYzM1WmJ0bHFIRUd0cjNz?=
 =?utf-8?B?cXRtbmlnU1FacVByVnV2aVk4SW5NVHJWTXJMcTJmNklhcVJUU2FSZWhlQTBG?=
 =?utf-8?B?aG9UVUpYbXRWUU9EMU5oL1hGenN3SCt3a01DRlFWUERUOFVESld1TURheDNt?=
 =?utf-8?B?OURqRDAxNzdiYW5UWk4zV2QzcVNqRUVOMHlCVmpzM2lEZStQa05YU1FvTFd4?=
 =?utf-8?B?eE5TNlNqL3dJMGNVb3RMQnZpOVFuMkdXaXhuSklTVkgvKzl6U1lrbWlGeGIy?=
 =?utf-8?B?a1ZVSU9xN0ZNRFY0NDdpRWUvaUNiellnOEJQUjlrRHNDYnd2WWMwUGE5bFQr?=
 =?utf-8?B?VmJaTVVXSjFibzlKaDNkOFAvQnFMTWsrbmYxMzlZci9HVmVKbXNLTER1SHNs?=
 =?utf-8?B?bUdEdSszQUtrcHZQOTMwZ1F6a3E5K3lTQkp6Y2tpUE1SbUdDbHFsaDJFY3FL?=
 =?utf-8?B?amJJdVp6dERXK25WeXNGMkZ1VG1udXllVHlaRy9LS0RudmJja2ExZERpNWgz?=
 =?utf-8?B?dUhUK014WEpxMzh4amkxMjZQVjdGNnZlS0lHclpsb0Ivd3RXWW5MUXdiWnMz?=
 =?utf-8?B?S1EzSXhxd2dlR1BRdHBPZnNkdEtoMUdhYjJEN2tYOE8rOWZITTNxSUpweDFT?=
 =?utf-8?B?RTIyWU9jUzBxaXY2Y0pzTHQxRCtQekpCeFpIL3lkZ3BWamIvaVFwL090YUZK?=
 =?utf-8?B?YkEwcy9ZUnZlSmFBeGdmdHQraVJRcVZkbXJjNU1tZWlqY1pzUk82SEpGaHg4?=
 =?utf-8?B?SlMwRUlKU3BqdGNJaExheE1GeXIyMFRmbGVFNCtFeFN3SGhSOG9nUXk0cUh0?=
 =?utf-8?B?QzRWMktNL0lIRjZXVHFrVi8rRlprN1BIOGpWbGNTSGE2eFZzL21mN1RvVnFp?=
 =?utf-8?B?Y1dCRXRHN09FQjdyZlhGemZUcUVPSmpvRVU1RHA0NmRDYStsbFltdEJubGNN?=
 =?utf-8?B?Z0RxdHBPdUlhWHFyREtZaVF1T1N5bnh5RDFUd21TZ1ZIL0MzeERoUEM4UXYv?=
 =?utf-8?B?RnBGdWExTGJxY3BNbE5FK21Ud1dDSkFjcGdTMEI1YkNIVXZnRk56WmZIM2U4?=
 =?utf-8?B?d08zR3VxQ0pmaUIwR3lGOHBDSzByQklDVU83bFZuZXErRkRySEtEdkZ5MDMr?=
 =?utf-8?B?elpQNndSVVU0azg0c044M1dqeE5lWWluTmtibUxJYnZkZElJVTd4WE1TUXhO?=
 =?utf-8?B?R0RXenl0YURZQ1REUGh1ZmlwaVJZaFZLMzA0OHc3TlQwZkJ5YXFSWFRGQ3Fh?=
 =?utf-8?B?QkI3Y2c5MjdxRzNCV0FXaGxMYmZYb0R4SWd6YTlDUm1aT1o0RGlHdGE3YWtk?=
 =?utf-8?B?WHNMMEMyNnh6TVAwbWh0dTdoeHRQL29ITkZocUllamJmME51aXdKbW5UeFBN?=
 =?utf-8?B?c0tqb3dBTnNqUVlxZlg0ZFZ0RU1HK1orQlRlRTREWm01bnJzZ01MaVlyWVJD?=
 =?utf-8?B?VTlHS0I3S2tqZHhVa3FYV1M2aUNVZW5COUZRTHdteXRybGN1NjEwQ1BTcUd0?=
 =?utf-8?B?empIU0lYbzYxQzN2cmdlcHdPbzFaRE11Y0N0ZnRib3h5OVRBcGtrZkc4RVVU?=
 =?utf-8?B?VXluWDRHcTBtdlAvYUpnMS9kRGdmdzJSZ1dyV0pUd0NDZ2JLSGVWblgrdmhy?=
 =?utf-8?B?YkdDK2RhYStKOXpLSEtWNzNIbHZTd2hyWXgxTVBlMnpCcFBuUENqbys0QWdy?=
 =?utf-8?Q?gjcJ40+VX2WxGMKpoyUIlgnPIA0jksIFGPvbEmK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad008608-bbe5-4542-50d1-08d9682b31d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 00:48:17.9642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SL248Df3nko9GjlAu9mdJnmpgh1p65wCtqp3JC5Uglh0V5QocqrDusaW/cJYaPchK8sTcF7fEJdH8yD9nvT2J8ecM9IBNzJ8TwbVNqq82tE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1419
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



On 8/25/2021 5:41 PM, Matthew Brost wrote:
> On Wed, Aug 25, 2021 at 05:44:11PM -0700, Daniele Ceraolo Spurio wrote:
>>
>> On 8/18/2021 11:16 PM, Matthew Brost wrote:
>>> Lock the xarray and take ref to the context if needed.
>>>
>>> v2:
>>>    (Checkpatch)
>>>     - Add new line after declaration
>>>    (Daniel Vetter)
>>>     - Correct put / get accounting in xa_for_loops
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 103 +++++++++++++++---
>>>    1 file changed, 88 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 509b298e7cf3..5f77f25322ca 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -606,8 +606,18 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>>>    	unsigned long index, flags;
>>>    	bool pending_disable, pending_enable, deregister, destroyed, banned;
>>> +	xa_lock_irqsave(&guc->context_lookup, flags);
>>>    	xa_for_each(&guc->context_lookup, index, ce) {
>>> -		spin_lock_irqsave(&ce->guc_state.lock, flags);
>>> +		/*
>>> +		 * Corner case where the ref count on the object is zero but and
>>> +		 * deregister G2H was lost. In this case we don't touch the ref
>>> +		 * count and finish the destroy of the context.
>>> +		 */
>>> +		bool do_put = kref_get_unless_zero(&ce->ref);
>>> +
>>> +		xa_unlock(&guc->context_lookup);
>>> +
>>> +		spin_lock(&ce->guc_state.lock);
>>>    		/*
>>>    		 * Once we are at this point submission_disabled() is guaranteed
>>> @@ -623,7 +633,9 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>>>    		banned = context_banned(ce);
>>>    		init_sched_state(ce);
>>> -		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>> +		spin_unlock(&ce->guc_state.lock);
>>> +
>>> +		GEM_BUG_ON(!do_put && !destroyed);
>>>    		if (pending_enable || destroyed || deregister) {
>>>    			decr_outstanding_submission_g2h(guc);
>>> @@ -646,13 +658,19 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>>>    			}
>>>    			intel_context_sched_disable_unpin(ce);
>>>    			decr_outstanding_submission_g2h(guc);
>>> -			spin_lock_irqsave(&ce->guc_state.lock, flags);
>>> +
>>> +			spin_lock(&ce->guc_state.lock);
>>>    			guc_blocked_fence_complete(ce);
>>> -			spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>>> +			spin_unlock(&ce->guc_state.lock);
>>>    			intel_context_put(ce);
>>>    		}
>>> +
>>> +		if (do_put)
>>> +			intel_context_put(ce);
>> is it safe to do the put outside the xa_lock, in case the refcount goes to
>> zero with this? I know it is unlikely because the refcount was > 0 if do_put
>> is true, but it might've gone down between us checking earlier and now.
>>
> It is safe as xa_for_each indicates it is safe to destroy / delete
> objects from the array while traversing it.

ok.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>>> +		xa_lock(&guc->context_lookup);
>>>    	}
>>> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>>>    }
>>>    static inline bool
>>> @@ -873,16 +891,29 @@ void intel_guc_submission_reset(struct intel_guc *guc, bool stalled)
>>>    {
>>>    	struct intel_context *ce;
>>>    	unsigned long index;
>>> +	unsigned long flags;
>>>    	if (unlikely(!guc_submission_initialized(guc))) {
>>>    		/* Reset called during driver load? GuC not yet initialised! */
>>>    		return;
>>>    	}
>>> -	xa_for_each(&guc->context_lookup, index, ce)
>>> +	xa_lock_irqsave(&guc->context_lookup, flags);
>>> +	xa_for_each(&guc->context_lookup, index, ce) {
>>> +		if (!kref_get_unless_zero(&ce->ref))
>>> +			continue;
>>> +
>>> +		xa_unlock(&guc->context_lookup);
>>> +
>>>    		if (intel_context_is_pinned(ce))
>>>    			__guc_reset_context(ce, stalled);
>>> +		intel_context_put(ce);
>>> +
>>> +		xa_lock(&guc->context_lookup);
>>> +	}
>>> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>>> +
>>>    	/* GuC is blown away, drop all references to contexts */
>>>    	xa_destroy(&guc->context_lookup);
>>>    }
>>> @@ -957,11 +988,24 @@ void intel_guc_submission_cancel_requests(struct intel_guc *guc)
>>>    {
>>>    	struct intel_context *ce;
>>>    	unsigned long index;
>>> +	unsigned long flags;
>>> +
>>> +	xa_lock_irqsave(&guc->context_lookup, flags);
>>> +	xa_for_each(&guc->context_lookup, index, ce) {
>>> +		if (!kref_get_unless_zero(&ce->ref))
>>> +			continue;
>>> +
>>> +		xa_unlock(&guc->context_lookup);
>>> -	xa_for_each(&guc->context_lookup, index, ce)
>>>    		if (intel_context_is_pinned(ce))
>>>    			guc_cancel_context_requests(ce);
>>> +		intel_context_put(ce);
>>> +
>>> +		xa_lock(&guc->context_lookup);
>>> +	}
>>> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>>> +
>>>    	guc_cancel_sched_engine_requests(guc->sched_engine);
>>>    	/* GuC is blown away, drop all references to contexts */
>>> @@ -2850,21 +2894,28 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>>>    	struct intel_context *ce;
>>>    	struct i915_request *rq;
>>>    	unsigned long index;
>>> +	unsigned long flags;
>>>    	/* Reset called during driver load? GuC not yet initialised! */
>>>    	if (unlikely(!guc_submission_initialized(guc)))
>>>    		return;
>>> +	xa_lock_irqsave(&guc->context_lookup, flags);
>>>    	xa_for_each(&guc->context_lookup, index, ce) {
>>> -		if (!intel_context_is_pinned(ce))
>>> +		if (!kref_get_unless_zero(&ce->ref))
>>>    			continue;
>>> +		xa_unlock(&guc->context_lookup);
>>> +
>>> +		if (!intel_context_is_pinned(ce))
>>> +			goto next;
>>> +
>>>    		if (intel_engine_is_virtual(ce->engine)) {
>>>    			if (!(ce->engine->mask & engine->mask))
>>> -				continue;
>>> +				goto next;
>>>    		} else {
>>>    			if (ce->engine != engine)
>>> -				continue;
>>> +				goto next;
>>>    		}
>>>    		list_for_each_entry(rq, &ce->guc_active.requests, sched.link) {
>>> @@ -2874,9 +2925,17 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
>>>    			intel_engine_set_hung_context(engine, ce);
>>>    			/* Can only cope with one hang at a time... */
>>> -			return;
>>> +			intel_context_put(ce);
>>> +			xa_lock(&guc->context_lookup);
>>> +			goto done;
>>>    		}
>>> +next:
>>> +		intel_context_put(ce);
>>> +		xa_lock(&guc->context_lookup);
>>> +
>> nit: extra newline
>>
> Checkpatch got that one too. Already fixed.
>
> Matt
>
>> Daniele
>>
>>>    	}
>>> +done:
>>> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>>>    }
>>>    void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
>>> @@ -2892,23 +2951,34 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
>>>    	if (unlikely(!guc_submission_initialized(guc)))
>>>    		return;
>>> +	xa_lock_irqsave(&guc->context_lookup, flags);
>>>    	xa_for_each(&guc->context_lookup, index, ce) {
>>> -		if (!intel_context_is_pinned(ce))
>>> +		if (!kref_get_unless_zero(&ce->ref))
>>>    			continue;
>>> +		xa_unlock(&guc->context_lookup);
>>> +
>>> +		if (!intel_context_is_pinned(ce))
>>> +			goto next;
>>> +
>>>    		if (intel_engine_is_virtual(ce->engine)) {
>>>    			if (!(ce->engine->mask & engine->mask))
>>> -				continue;
>>> +				goto next;
>>>    		} else {
>>>    			if (ce->engine != engine)
>>> -				continue;
>>> +				goto next;
>>>    		}
>>> -		spin_lock_irqsave(&ce->guc_active.lock, flags);
>>> +		spin_lock(&ce->guc_active.lock);
>>>    		intel_engine_dump_active_requests(&ce->guc_active.requests,
>>>    						  hung_rq, m);
>>> -		spin_unlock_irqrestore(&ce->guc_active.lock, flags);
>>> +		spin_unlock(&ce->guc_active.lock);
>>> +
>>> +next:
>>> +		intel_context_put(ce);
>>> +		xa_lock(&guc->context_lookup);
>>>    	}
>>> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>>>    }
>>>    void intel_guc_submission_print_info(struct intel_guc *guc,
>>> @@ -2962,7 +3032,9 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>>>    {
>>>    	struct intel_context *ce;
>>>    	unsigned long index;
>>> +	unsigned long flags;
>>> +	xa_lock_irqsave(&guc->context_lookup, flags);
>>>    	xa_for_each(&guc->context_lookup, index, ce) {
>>>    		drm_printf(p, "GuC lrc descriptor %u:\n", ce->guc_id);
>>>    		drm_printf(p, "\tHW Context Desc: 0x%08x\n", ce->lrc.lrca);
>>> @@ -2981,6 +3053,7 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>>>    		guc_log_context_priority(p, ce);
>>>    	}
>>> +	xa_unlock_irqrestore(&guc->context_lookup, flags);
>>>    }
>>>    static struct intel_context *

