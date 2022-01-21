Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EC44957C6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 02:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6854010E5F8;
	Fri, 21 Jan 2022 01:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F72410E5C3;
 Fri, 21 Jan 2022 01:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642728989; x=1674264989;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GfxpcByVOXaj2w3XfTmwGUTwY+urN85vmyyKhOhWwSg=;
 b=F6vay7ClOTHBFvqtbKMEyr5vumSPVKvpn3+ZHT45eZtQ0biznj6/UOUO
 QZ+yw/tKrV846QZbVw4W03HtdEK37qxjlImHoBB1FPsAkQ6os/7ymKkTm
 YrrDvKJDoQXj+nouT++43dP8hivbJZQYZLjBSUe8sdSdROtGTN/g37z9R
 ZwJE/a2GVCvEdZrGhB0vU0724zg7w6aSKNClMvzQmOT4JYSEdWVeBGks/
 MFsBGH7Z4y9j+qv/TpZlE1u44ChHcD+HeUlztTI9RttZT3eTa1MOKyqAZ
 WRJY3Gb1+j2PI5f/nC3rRQuDj4/NjY5yjJUadyevJ+k5qTciaH2Wql43Y w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="306263211"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="306263211"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 17:36:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="623149079"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2022 17:36:28 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 17:36:27 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 20 Jan 2022 17:36:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 20 Jan 2022 17:36:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 20 Jan 2022 17:36:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZK/m6RGut49dE2IeXl/qS69m83YrcPAChXMCJ7CnPj03TU8bJSkK2SKbZROLsl3XwAIA1xtzehCBnEOnFIrqM0/e6QyE5SmwZFRJRtrDvLzRamWAHfUdIEQSKX56CWCHekpq/9kE4F8maP7LdhdyB/N032KNIx8GHYfvDHVxI0c0bHKjc6LcRv4X6CjxT0qC0SgHtEDikFfF73inedzuwN98j8eKFXd2AXnBqKXdKIZ9uy1hpU/aFWx39ai9SfMEMI3X5h/3SbE/j/gz5KTqFYRIzUwhDFwEJ/gYoVCWKbmr6MrKGHFt/m0HUQAWqY/nR570a0SHqwONJw0Wk9W8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pue/xkR/ju1qKkmLMK1GwCHhqQmmDj/OfQds6ENJHkg=;
 b=i+0ca9dP+Uu7Fs4I1ZQjaQ29EaWNdYpLYfXxzsG2MG44AN/ufflIFJzWqMO9ZzXQKlzn5+dBXjQP7pfDFSpLtBg3Y1NA/OAyl9+sJ58kHpdSrBHKAThDoJ+dOyf4/ntgefn+VbCf0Y8AfO8m3i4LlfSGdP950nCDFp4y5I+OBjkaYFH856YbZdfA87rRi/zZTWcMKFBhwTSG8tAtd/sSkz7P8GZgTgYkDd8Lf3qt9idkL0MjOj5EcwUMrX8L5XfOEnbICoOIxhAGHFsasqhcfP0ia+uP0uKoTLcZDmnzbTxjGplteJo24WsQg5IdFllLLmDN6MkeFfI7GPL+nZpk6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB4897.namprd11.prod.outlook.com (2603:10b6:303:97::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Fri, 21 Jan
 2022 01:36:24 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.010; Fri, 21 Jan 2022
 01:36:24 +0000
Message-ID: <116132f9-b258-975a-6e0d-c6f7efbdd2d5@intel.com>
Date: Thu, 20 Jan 2022 17:36:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] drm/i915/guc: Flush G2H handler during a GT reset
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
References: <20220119212419.23068-1-matthew.brost@intel.com>
 <20220119212419.23068-4-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220119212419.23068-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR11CA0045.namprd11.prod.outlook.com
 (2603:10b6:300:115::31) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de84ae52-19ca-4c00-5a70-08d9dc7e6fab
X-MS-TrafficTypeDiagnostic: CO1PR11MB4897:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CO1PR11MB4897F1586C16ED7E64F0DEA0BD5B9@CO1PR11MB4897.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gibqp3QeZ7NXrNgz1zqLL0VWmPbiE3Iy085XuWUNZediktpogvRbUayahX05N+32cRkndeSDMLHSJHNWB7f9DtkTsyXXgspvuyuxfv+3Vy40KI+qYnIN2DSViFQzb3cVLjGwqihP543LOxzMQpTGr8/eivJX3uyLLcOSgjsc8v5wn/w3pjc8YHCv/1hrHjCMXqTjQFqSPv1BifZOuDgqbV5VmiyamikCD2iaNcnG0qwtgXgVGFYRY43m0KlW8D4AuH2xCKtm5JIinEReLuZ85mO7drOltw/CgQa+JsAn9u9T+AtXVh1KDCNcW49UMzVIz/J0rlrw6HshV18Zte1pRTnKu0Wv2Ywh1nyK/puS58fRAgHK6BQP20YTWdWEz1pm1PAkdHsEOGqQ5pnxUt3lOXNpXeMTjjzDRpcWQXs/cq/zMoy9s/VClaDSCPPK4A+MeuuywiN4gWLmRgxmVNQ+pXS3Vlg91+v4oT45YXFMDpQ8Dyo00dN7Gu7Omd5uVBV6xElNXQ/0jeTvAn2KKltO1rWe2vrT9f77XbnzhzIrJilMBGPFnhXEcUAjC+aCkv6J/HPduAUbeq7Z440yRyUdynp1Byrtat9tzV7MdSlSWdO6EXSdzoBFBFaXmKm32Wqm7g/gJwXWFr8++xrVXK/WJOTiE2SMT80wcWs8wklGQm4wBdYEK1Ytjs0y5apA9kyJdAnrdAtgVDL5pu9ok0uFc2HnxsdO4JnRGR7Ou6PrkwnyeanIe0f7vXEHYYrjv1+3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(508600001)(83380400001)(66476007)(66556008)(31696002)(2616005)(6512007)(86362001)(6486002)(31686004)(82960400001)(450100002)(316002)(53546011)(6506007)(38100700002)(5660300002)(2906002)(26005)(36756003)(8936002)(8676002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG1RSEpSblFURmhGQXJrU2hXT0FkUEoraTNPdjBYRG0zY2dQejdTRnpWUHVO?=
 =?utf-8?B?SW1BMEw4akhQQUU1VVJ1clQ0TzFyQmNrWlhjdHZTakEwYlRQd2NmS1Z1aTN6?=
 =?utf-8?B?RGNDZkx3M3VNbXRBVjJjTmVkRmk5ZmtJTXRvYWVURldHS3c3N1VCWUt3Tjlj?=
 =?utf-8?B?L1JGbTgza1V4N3IrYUFwOGNzTWFYWUQyalJoNHRZQUpJbzFSeVVxemJlei9F?=
 =?utf-8?B?OUR0T3lhNkRFemV1YjRscG5sTDdubVdrbmtkenNGNXl0T3ZlNXJRbXVXeDhQ?=
 =?utf-8?B?eU9pN0x4aXhCSlZSUS9vWGRqYVE4Zy9iVlZ5VUtrcUFCY0JaZys4T01QOU1G?=
 =?utf-8?B?RkZrb3JqQjkzSFNsYWVLMHhOamt0YmhVeXVxTnRUL2hyUmJLNjZ4WjNjVURa?=
 =?utf-8?B?M3ZlU0RhMHp6SWpkTmNlZGliK1lZRW4rZ3FyeDJZaE55SXJPYkgvcE5NbzFR?=
 =?utf-8?B?UzJmSTVkSjV5aFB6UHdqdlRNZHd3NVdpMmxxMnB1NWZPQUJUWnMyODVwb01W?=
 =?utf-8?B?Q29DdHpaUURHRWg4RmtiVHd6NUZpUTl6WDJ4RWNuSzFheUpUdm5NN3VCUXpM?=
 =?utf-8?B?ZThqZVBQSzV6bDROVElNKzQrMFN4V0x2YjhzbUtWeWxHaXh0a245TEFDYTUv?=
 =?utf-8?B?eUlESW9KUksrNHNFcFRMWk5LdXpxalVZUDlJQTNVM3c1T0NNRDZialBPVkli?=
 =?utf-8?B?eTVRTWdCUm5ZUnFLTUs4d3BSNlNlcmlLa1RENzJYckNxcVlqR1cyOGZoR1k2?=
 =?utf-8?B?RGZ3YTZOSmZtSWU4THN2RzdXQWs2OVlGYTM0Wkw4TytwKzNWblAzdENpTHBR?=
 =?utf-8?B?YlBxdHB3L215ZWFBempDcktnSkdKVC9UcEtsZnBEZ0VXZ01xWjhPYU45ZU1U?=
 =?utf-8?B?SS9VT0FudXcxWGlLMVZlN0xyb01nNUVhZDN0UEM1cWxpMklLNHBvMFQzSURZ?=
 =?utf-8?B?Qm5RR1hRUFcvdjZ0M2NvOWVBckRJM2hoL2ZaOWgrbFppOGRWdGltTWRFNWtq?=
 =?utf-8?B?QjhzWTJ3MnU5SnhrR1F0a3p6MXFqcHo5TUpqc2tLK2VMRmErSzdHWVpqY3Nx?=
 =?utf-8?B?RXNzYlZLMndmVlZMUWdaaXBnMjZMRkpCZHNkZHI5Z3Z3MTVobzFwZ29RVlpl?=
 =?utf-8?B?OFVudEI1dG15M0FXQ1U5N3A0am9VOVRJcHV4Rnk1Mkg2OFhWS1hEazk4dGxz?=
 =?utf-8?B?VDNYQ1ZLRXpONWY0ZTY4L3J1N1VhRmRWVzRoaVFxLzhra1RXYXlnTW5sN1dT?=
 =?utf-8?B?dEhDb0VzejMwQ0FvMXR0c1BQU0VpSWY2ckRmUmFySTRWdE1mR0czanNHT1FO?=
 =?utf-8?B?OUdlN3pCQWl1NTJtSDNxUlRBWVc5TTcwZWxXWFV6OG03cGVCVWJSVEd0SHVC?=
 =?utf-8?B?ZjZCM2tSdEFlZTFhNzUxQlc1MmtqeEQ0cjJIWTA0ZFF5bi9rQXVNenpRb3hz?=
 =?utf-8?B?YmpMbGVObDRYU2daWmlOaWpiMUVTQzRaV1hRQjE0QVlOMHJvZjZtZ0xGUjNJ?=
 =?utf-8?B?aUphRXJZbEdjSUczY3huVnQzR0t6SkhZT3lkUzZXSlpDUlhQYkh6NGxqYjlW?=
 =?utf-8?B?MnN5aGMzbU1zVHdIWmsxNTFpMTdOZ2V0QlNQUGZ1bWVVSWVtVHJJWkxPUkd1?=
 =?utf-8?B?dDMzU21RN2NyYjlFUWRld3ZPbHJaazl0NGZpekZFQmcvVlY0dGY1SEFiSXN2?=
 =?utf-8?B?UVRLV3JBTnpmQ3pRcUNycGR2eDBPeUl5d0hzdWRFUXp6TkZEYkxoMjVzdnBv?=
 =?utf-8?B?S0xVQVpveUxDcW9SRk95ZWJ4Ty9leU0vRisrUVp4R1dtNmdQdVVtaGJRVGtk?=
 =?utf-8?B?ZDhUZnJheVdITXptZHNOdUJlNFhQZ0VhTG9XK1libEVVY1lvOXcxbUxtaGdH?=
 =?utf-8?B?YnI0Z1l5MjRMR3JTZE05SmV3Tk53WW1xSDNON3hxaEFMSnl1RStsZFhseExq?=
 =?utf-8?B?TWhDUGM0citRdCs0WDByZTlBSlhjZ1N2SVBPd3JrNjBzQjBjeEdRR2NBVUJD?=
 =?utf-8?B?QVJNNkFCWGNhMnYzQ2Yvc3hmZ0dMckoxM0txTVc5N1lJMGNrb29wakNwZGFx?=
 =?utf-8?B?RW5XMy9LSlRIRTkvcFRjRTg5SHZjdUxMQ21zRThFdVhRd0pzVEI1RW9vNW0z?=
 =?utf-8?B?TXBLc2dyT3AxLzBwWWtWbnYrN0szM1B4Unp1eXp0N1IzWjBVc211UTVSVHhk?=
 =?utf-8?B?SkFuaEVXWGlNV01INmJEZTRNV3lMY3Y5K2xPVFRBdnY2S3BYSi91b1hIWmlF?=
 =?utf-8?Q?XHp6u9eg93x2Jo8PxPMGcgIChhb1bJlqTBl87viOrk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de84ae52-19ca-4c00-5a70-08d9dc7e6fab
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 01:36:24.8376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqMphSfK/MV4w8EoDXsMSZklUNYQZbFrZBsaXiBDRUnozoE2ah9a/CB8fhc0bDGqAfRPPDJZ4lqltt1HYbevMLCTTUrFZwT8t1ou62HV4Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4897
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

On 1/19/2022 13:24, Matthew Brost wrote:
> Now that the error capture is fully decoupled from fence signalling
> (request retirement to free memory, which in turn depends on resets) we
> can safely flush the G2H handler during a GT reset. This is eliminates
This eliminates

John.

> corner cases where GuC generated G2H (e.g. engine resets) race with a GT
> reset.
>
> v2:
>   (John Harrison)
>    - Fix typo in commit message (s/is/in)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 514b3060b141..406dd2e3f5a9 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1396,8 +1396,6 @@ static void guc_flush_destroyed_contexts(struct intel_guc *guc);
>   
>   void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   {
> -	int i;
> -
>   	if (unlikely(!guc_submission_initialized(guc))) {
>   		/* Reset called during driver load? GuC not yet initialised! */
>   		return;
> @@ -1414,21 +1412,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   
>   	guc_flush_submissions(guc);
>   	guc_flush_destroyed_contexts(guc);
> -
> -	/*
> -	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
> -	 * each pass as interrupt have been disabled. We always scrub for
> -	 * outstanding G2H as it is possible for outstanding_submission_g2h to
> -	 * be incremented after the context state update.
> -	 */
> -	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
> -		intel_guc_to_host_event_handler(guc);
> -#define wait_for_reset(guc, wait_var) \
> -		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
> -		do {
> -			wait_for_reset(guc, &guc->outstanding_submission_g2h);
> -		} while (!list_empty(&guc->ct.requests.incoming));
> -	}
> +	flush_work(&guc->ct.requests.worker);
>   
>   	scrub_guc_desc_for_outstanding_g2h(guc);
>   }

