Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C3A43D20E
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231326E81E;
	Wed, 27 Oct 2021 20:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E546E5D1;
 Wed, 27 Oct 2021 20:04:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="217429662"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="217429662"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 13:04:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800"; d="scan'208";a="635865973"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2021 13:04:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Oct 2021 13:04:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 27 Oct 2021 13:04:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 27 Oct 2021 13:04:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ERDTu4fogc3KhukLBiwntvGiv8S+DYiuZal6b+S0u6XJ+U+GhW7XdmpvY4tvTNECFstmaybrAU3TvD6DI/s+hvdvhLAN+O523y+lIpvzaV/Hr7wm8aSxND/5vDVkDIuG1BX6Jxzo04ikbCIidnf8KvBHdcaaGyOFTupp+sVvGUvw30ZXNG3OWnhap+enxIEJI5sX8pcTP3+EzxA38ebNAeUpHCD16GHsTS0KWR/BwWgzIHSrvY1eHd9ywJHb48C46Az6lWtBpn6gtSkxWQLKpdWa6BA2CwViQD9w/5T+op2xMJbYip2JLglPATIOKnPvzUN9mLP17nFwz9iAoM6fBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOXPJ6FoDyPZ6gQc3NBDE3UpJ/N1yEgcmigbQp/fWvc=;
 b=Q5pDFEnXZxUD5g3+IHRrwKra6yCh+i4uBw0mik6mdNLC6qO8VKKmCeIKLlmTu8HqpJMMEBky55ZOFx6zVez85abayVhwCCL06eaRjZ1fIsEvkZzH7cooyArzGgCj21AMT/C9tcZ4SfA7s11q3g0A09UIdqnzYiP9/tBPKwqi4FsUA2ycyniExTkoWshxjJdhKfjwO/pl/WMnvjciL5TwVLIh04quUP65oaruca5uOYITzsMQOlGpDKsGcmtwurXmzkmiHX1xcrfOnfhQ83dCVxs+DmymbRxefXO3Y683yE+T24E4OGQvx774efRcrX4IVYCKUZpysSS3F0fa0P5kIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOXPJ6FoDyPZ6gQc3NBDE3UpJ/N1yEgcmigbQp/fWvc=;
 b=I6sdSk6rqxbfaxt6ZwpoyAumRH2y+NBn16okOiD6VWN2nO2EOQGfonAxSkYbODkO+WjaBENedACYq8cLOjvXVTYMeJ/LjA2W65rnv7GH0o9kY6bGhOIohWAQ5M3y107LF9MN2HH9qtyn2BvZ27hm+wptYc7dRv3b4kwn9DMOjvw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5580.namprd11.prod.outlook.com (2603:10b6:510:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 20:04:52 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%9]) with mapi id 15.20.4628.018; Wed, 27 Oct 2021
 20:04:52 +0000
Message-ID: <af017ae0-e826-7b6a-03d7-0e422030da02@intel.com>
Date: Wed, 27 Oct 2021 13:04:49 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/i915/execlists: Weak parallel submission support for
 execlists
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <tvrtko.ursulin@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20211020214751.34602-1-matthew.brost@intel.com>
 <c9a1cd3e-dc3a-2b2b-ee37-73c0c50f3f60@intel.com>
 <20211027191732.GA16188@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20211027191732.GA16188@jons-linux-dev-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CO1PR15CA0114.namprd15.prod.outlook.com
 (2603:10b6:101:21::34) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 CO1PR15CA0114.namprd15.prod.outlook.com (2603:10b6:101:21::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.13 via Frontend Transport; Wed, 27 Oct 2021 20:04:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5019ac42-192b-4e0c-65b7-08d9998509d8
X-MS-TrafficTypeDiagnostic: PH0PR11MB5580:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5580F2DD977C31E861FBCF17BD859@PH0PR11MB5580.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bT71/d77TvzNR1UpbTU38kZHDAt2cWaFyVNgdFJGJQPzAdRxdqgJkNl1KtngQUH73MM8KfvHTYBHYrjZvAi6woxSg8unxbGgLrkG7op4wShRri11HRdLLX93gzgHco0jxTA6vulY5ay8IAAaqTzY2n2mP4NAZvffAzwZkJbZxQ2aLiinvjd2X3m6XzbtaVqKSUfjpqCiDQZN6uD3pW9EvU75qYONB80O1CXQfuo5RgkY8Jz4zSCZl4nGogKyjgOJ/jDo25aJywm4eaKwfoOH1jIlIUV48nHf8QyVNRKz9M7rYAHvu2XWFjwFuGlFu2mm5W2BBHvZtQAJMvNBO8LNLcWMLfpSEC5vOVpNhHF9ZoxCRGpsEm4nnCzgNXDQ1PsWCc8K1cI7xJuF/Dmgcz6DhGiaNcOTvhzPw818qRiev6A1i4x7ydRMGYpDZYlFPi/RrZpeUzpEQNlYkV0gK1N35F3ex4DVGhM2zQj7cYAhnZZgx/UkEjne9qOb5QCdvVhd7Klmeln1is0Uqz3k40Yxvc9lh47BU8QAMOCl+Ai8s+DyX1cyjOZQC5YATNvo5DeJMnwkSlFm95RLoSw0djgf6XpoeG34ZgVNZI1w+jU1qMOoO2fZVAGPP1t+p402FKqil87XPPZroetiQ5MPc4NlZDH4iUbgVEU3PZZPf/nlikXOl0imDLsoRkjgVxOpMIZmpgA7zY9c7J2/OTC78KWv2lOQxy6RKDIJqylUCdArPIYUp6kkk8BHR5JwpGGWg/Nu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(66476007)(6486002)(186003)(6636002)(26005)(82960400001)(66556008)(508600001)(107886003)(450100002)(6862004)(956004)(86362001)(8676002)(2616005)(83380400001)(8936002)(66946007)(37006003)(16576012)(36756003)(31686004)(31696002)(38100700002)(2906002)(4326008)(5660300002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjhLbFM5dTFna3J6U3FwVm10T2RkMmxFbEdHQUJpeXEwNU5JWlBwcnYxNlRy?=
 =?utf-8?B?aEJ0TGpYb0NIdys1NFl2cHVyU3JKR1BzSXVKaG5NSTlYQmI0a1BpRHZxVDBU?=
 =?utf-8?B?dVF4d1VTQlNaSWlMcXo5NUtYNDV2SFlnb3hQb203OFlsNlRWMllkUmpPQVJr?=
 =?utf-8?B?NWtwM2ViVHRxZlhYcEdzRHFVT0hLSEhtZDY1TE9EcTJjVVBVWkJJdDVCMFdX?=
 =?utf-8?B?ZythbGszcHBTbU1PUXBPUDdHKzYxNitVWEFKTDE3U2RSKzlaV2s2V2lBNFZk?=
 =?utf-8?B?Y09xSUo1cFE0VUFoVlI1aEZ3NThXQWtUMmRQdUsrb01XSHZzTHNRT2Nsek0x?=
 =?utf-8?B?YUREVWRTT2ZMM0l6Vi9zK2hVd1F4RHhXRDRUTS9SbzVSRzBVcVI1eTNzYXV3?=
 =?utf-8?B?WkswR0t5SUE1TFBPRnJWY0lpZUsyUG0zRUFNNitXRjV1bW15RDQ0WnMxVTR0?=
 =?utf-8?B?eU1UZ3R3ditDV3JqOE5kWWI1cTBYelJGVTk2d1VsRkRoVkxteVNYZ3R3eUF5?=
 =?utf-8?B?MDArN0laVDN4WDFMTDN3ZWhZR2JOc1YzRXN5WHR6SnJoVDU4VHBxVGN0VG9m?=
 =?utf-8?B?UThMZ1BMUUlDKzMxT0M4NkJSaHFTTkt2SC85bzJNVm04UTNvbjlQTURNNWxC?=
 =?utf-8?B?VTE3UDczSTFKWjZnS1dLbm5NaE9wZ2dFZjBRdDkrQkx5WGM1cU4rVkozaVE1?=
 =?utf-8?B?L0RqQkx2YXdNMEpQRXdEcmFCSURKdGhBSnowd3F1djBSa0pTdVVwSUFiNllP?=
 =?utf-8?B?Tzd4SzFBMmR1ZkJocSt6azd3emlGaDd1Sm5wMFhURzNHckMzZ3VDV05oelhZ?=
 =?utf-8?B?TWVVQm5pUUk4R1RIeUpLQ1dyOC8ya1pxQ1J4OUh6MEtKdkVZZDRTQjZxOERx?=
 =?utf-8?B?THRTL2x3N3lLWGhkV2hVNlhyVzZ5eEpBbWszK2VhOUxKMUJnSVJuZDI4b2FE?=
 =?utf-8?B?V2pkby9waWMwOFpqL0tRV24waGM2bjBmbjRKUEdDUDU3ZTVkWHpNSTBoVHJt?=
 =?utf-8?B?eGhaamJlT1RUYkFVWUhZeUU2V0tpZXJOYUphcUE5dXFKaHNSUFVvdjRHY0VS?=
 =?utf-8?B?T0I4VUhVbU4zYnlpOFNYZFVQZ0FRWHBHU2JPM2JPVm9nMGVtSTdITmQwZFpl?=
 =?utf-8?B?V2hDclRPdndhTWlXTjNCSW8wTG00bUR6QUhVMGZJSjA1aG8yUDBjV2k3WlBN?=
 =?utf-8?B?Z2JCaTNORkVNYmszYnpqZXNUbGtaaC9uZHNoZkVDL0twbGZwTEw3SCtnTlpY?=
 =?utf-8?B?U2NlTk8zTUR6Y20rUTJmTFRBMmRIOElDTW9NKzQ1NytHYW9jKzJTL2wvcWZT?=
 =?utf-8?B?emsyRFNqUUMwVHMzbElOSXVPWHdVMVhmek5OZHRCRmIzL28vYXVhTHBhZU8w?=
 =?utf-8?B?VFByR3BESnV0RU5ubTh0TVZnWlFyb0RtOUtaTzFHdEl6REVNOHpoakNNOU5L?=
 =?utf-8?B?NnZyRUFOcGhwaHFJQXlySktFWG1uVG13MGN5aTB3ZHRRNkR5VkVhcFFyWUF1?=
 =?utf-8?B?Uk1tamhSTElOaFcxd29QVCt0VWtpaWVZRVF3L3paUzR6YzRMc2o5R201VWh3?=
 =?utf-8?B?ekhiUGRlNmF3VFh0a1lwM0NZMVl0MDhXQzdGOWxsRFZZOTZIc0pWcDRLMVo3?=
 =?utf-8?B?bU0vcVN2QVl3TWNVQW1oQUUvV0VjSnZHcHJKVWJ6RWF0VS9KSGx3Vm42QVlt?=
 =?utf-8?B?YUJ4NFhlUzFDd2orMUVLVUpHa3ZFRGpjdE0zSVErdXlHMFBFWVF0OW5keTdN?=
 =?utf-8?B?emRVczdGSnVlUDg4T3pPTDVQV1JHeTJjU0JMSnJjYTRiSkdTdXE1T0xuMlB0?=
 =?utf-8?B?ZTdXODVHNTdOa0lJVXRXS3A2VkRXeHVJWGVCbUlkcFBOS0JIR0Qwb1czVFRL?=
 =?utf-8?B?S0EzUnN5SHI5Q1ovRDJGOHVHZE55U1E4dlFJWWNRc21wNno3WklMVU8ranY5?=
 =?utf-8?B?Q2xNWDlkbnRkRkF6QzVESzRNaW5RMmJQaGYyQjdJMWxqQnVnbm5tM0FrSkow?=
 =?utf-8?B?RUxDV09qRFRFMDE2Q2o4bUQ5SzhZU0ZINTN2bUVyL3ptb3RoZThzUjhPUkVq?=
 =?utf-8?B?TlBIaFFEQkJEeDFlWTJOTU1ITnA3R0YwMk43WDA1L2xCTm5sM1RJcm8yQ1Fl?=
 =?utf-8?B?TGhWYUNBTzN3bFBKZ1MraWFVNzVNQ1h6ci8rdFIzY1EzTmRKZ1Z0Nk1FSEUz?=
 =?utf-8?B?Q3d3azdaYUxvQjd2OFJBVURJTHJ4OGtBMEZLd0RYc2hGODJRRUUvWXUwWnk3?=
 =?utf-8?Q?i5tZHt0SO39i3g+sTqcs1YC2PhhUSkl5hBUOdXYxDw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5019ac42-192b-4e0c-65b7-08d9998509d8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 20:04:52.7489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgEwbFnCjmN6Iq8sg41FBg/IebYhZBm03qCmlNGf6oIx78XyNt2ZD8Pzt11ZyM03TLmPoluyLm7leJc/ZzwYcfT5SbdKQ+PzC8A14iD1W+U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5580
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

On 10/27/2021 12:17, Matthew Brost wrote:
> On Tue, Oct 26, 2021 at 02:58:00PM -0700, John Harrison wrote:
>> On 10/20/2021 14:47, Matthew Brost wrote:
>>> A weak implementation of parallel submission (multi-bb execbuf IOCTL) for
>>> execlists. Doing as little as possible to support this interface for
>>> execlists - basically just passing submit fences between each request
>>> generated and virtual engines are not allowed. This is on par with what
>>> is there for the existing (hopefully soon deprecated) bonding interface.
>>>
>>> We perma-pin these execlists contexts to align with GuC implementation.
>>>
>>> v2:
>>>    (John Harrison)
>>>     - Drop siblings array as num_siblings must be 1
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_context.c   | 10 +++--
>>>    drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
>>>    .../drm/i915/gt/intel_execlists_submission.c  | 44 ++++++++++++++++++-
>>>    drivers/gpu/drm/i915/gt/intel_lrc.c           |  2 +
>>>    .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 -
>>>    5 files changed, 52 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> index fb33d0322960..35e87a7d0ea9 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>> @@ -570,10 +570,6 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>>>    	struct intel_engine_cs **siblings = NULL;
>>>    	intel_engine_mask_t prev_mask;
>>> -	/* FIXME: This is NIY for execlists */
>>> -	if (!(intel_uc_uses_guc_submission(&i915->gt.uc)))
>>> -		return -ENODEV;
>>> -
>>>    	if (get_user(slot, &ext->engine_index))
>>>    		return -EFAULT;
>>> @@ -583,6 +579,12 @@ set_proto_ctx_engines_parallel_submit(struct i915_user_extension __user *base,
>>>    	if (get_user(num_siblings, &ext->num_siblings))
>>>    		return -EFAULT;
>>> +	if (!intel_uc_uses_guc_submission(&i915->gt.uc) && num_siblings != 1) {
>>> +		drm_dbg(&i915->drm, "Only 1 sibling (%d) supported in non-GuC mode\n",
>>> +			num_siblings);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>>    	if (slot >= set->num_engines) {
>>>    		drm_dbg(&i915->drm, "Invalid placement value, %d >= %d\n",
>>>    			slot, set->num_engines);
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
>>> index 5634d14052bc..1bec92e1d8e6 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_context.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
>>> @@ -79,7 +79,8 @@ static int intel_context_active_acquire(struct intel_context *ce)
>>>    	__i915_active_acquire(&ce->active);
>>> -	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine))
>>> +	if (intel_context_is_barrier(ce) || intel_engine_uses_guc(ce->engine) ||
>>> +	    intel_context_is_parallel(ce))
>>>    		return 0;
>>>    	/* Preallocate tracking nodes */
>>> @@ -563,7 +564,6 @@ void intel_context_bind_parent_child(struct intel_context *parent,
>>>    	 * Callers responsibility to validate that this function is used
>>>    	 * correctly but we use GEM_BUG_ON here ensure that they do.
>>>    	 */
>>> -	GEM_BUG_ON(!intel_engine_uses_guc(parent->engine));
>>>    	GEM_BUG_ON(intel_context_is_pinned(parent));
>>>    	GEM_BUG_ON(intel_context_is_child(parent));
>>>    	GEM_BUG_ON(intel_context_is_pinned(child));
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> index bedb80057046..2865b422300d 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
>>> @@ -927,8 +927,7 @@ static void execlists_submit_ports(struct intel_engine_cs *engine)
>>>    static bool ctx_single_port_submission(const struct intel_context *ce)
>>>    {
>>> -	return (IS_ENABLED(CONFIG_DRM_I915_GVT) &&
>>> -		intel_context_force_single_submission(ce));
>>> +	return intel_context_force_single_submission(ce);
>> I think this is actually going to break GVT.
>>
>> Not so much this change here but the whole use of single submission outside
>> of GVT. It looks like the GVT driver overloads the single submission flag to
>> tag requests that it owns. If we start using that flag elsewhere when GVT is
>> active, I think that will cause much confusion within the GVT code.
>>
>> The correct fix would be to create a new flag just for GVT usage alongside
>> the single submission one. GVT would then set both but only check for its
>> own private flag. The parallel code would obviously only set the existing
>> single submission flag.
>>
> Ok, see below.
>
>>>    }
>>>    static bool can_merge_ctx(const struct intel_context *prev,
>>> @@ -2598,6 +2597,46 @@ static void execlists_context_cancel_request(struct intel_context *ce,
>>>    				      current->comm);
>>>    }
>>> +static struct intel_context *
>>> +execlists_create_parallel(struct intel_engine_cs **engines,
>>> +			  unsigned int num_siblings,
>>> +			  unsigned int width)
>>> +{
>>> +	struct intel_context *parent = NULL, *ce, *err;
>>> +	int i;
>>> +
>>> +	GEM_BUG_ON(num_siblings != 1);
>>> +
>>> +	for (i = 0; i < width; ++i) {
>>> +		ce = intel_context_create(engines[i]);
>>> +		if (!ce) {
>>> +			err = ERR_PTR(-ENOMEM);
>>> +			goto unwind;
>>> +		}
>>> +
>>> +		if (i == 0)
>>> +			parent = ce;
>>> +		else
>>> +			intel_context_bind_parent_child(parent, ce);
>>> +	}
>>> +
>>> +	parent->parallel.fence_context = dma_fence_context_alloc(1);
>>> +
>>> +	intel_context_set_nopreempt(parent);
>>> +	intel_context_set_single_submission(parent);
>> Can you explain the need for setting single submission?
>>
> I think I can actually pull this out. This was needed when I tried to
> truely implement a guarante that all the parallel requests would be
> running simultaneously. Couldn't ever to get that working because of the
> mess that is the execlists scheduler - a simple wait at the head of
> queue until everyone joined just blew up for whatever reason. I don't
> believe this servers a purpose anymore, so I'll just drop it.
>
> Matt
Is that not going to be a problem? I thought concurrent execution was a 
fundamental requirement?

John.

>
>> John.
>>
>>> +	for_each_child(parent, ce) {
>>> +		intel_context_set_nopreempt(ce);
>>> +		intel_context_set_single_submission(ce);
>>> +	}
>>> +
>>> +	return parent;
>>> +
>>> +unwind:
>>> +	if (parent)
>>> +		intel_context_put(parent);
>>> +	return err;
>>> +}
>>> +
>>>    static const struct intel_context_ops execlists_context_ops = {
>>>    	.flags = COPS_HAS_INFLIGHT,
>>> @@ -2616,6 +2655,7 @@ static const struct intel_context_ops execlists_context_ops = {
>>>    	.reset = lrc_reset,
>>>    	.destroy = lrc_destroy,
>>> +	.create_parallel = execlists_create_parallel,
>>>    	.create_virtual = execlists_create_virtual,
>>>    };
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> index 56156cf18c41..70f4b309522d 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
>>> @@ -1065,6 +1065,8 @@ lrc_pin(struct intel_context *ce,
>>>    void lrc_unpin(struct intel_context *ce)
>>>    {
>>> +	if (unlikely(ce->parallel.last_rq))
>>> +		i915_request_put(ce->parallel.last_rq);
>>>    	check_redzone((void *)ce->lrc_reg_state - LRC_STATE_OFFSET,
>>>    		      ce->engine);
>>>    }
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 1341752dc70e..ddc9a97fcc8f 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -2961,8 +2961,6 @@ static void guc_parent_context_unpin(struct intel_context *ce)
>>>    	GEM_BUG_ON(!intel_context_is_parent(ce));
>>>    	GEM_BUG_ON(!intel_engine_is_virtual(ce->engine));
>>> -	if (ce->parallel.last_rq)
>>> -		i915_request_put(ce->parallel.last_rq);
>>>    	unpin_guc_id(guc, ce);
>>>    	lrc_unpin(ce);
>>>    }

