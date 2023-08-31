Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678678F563
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 00:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031B110E6F6;
	Thu, 31 Aug 2023 22:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E3E10E6F6;
 Thu, 31 Aug 2023 22:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693520869; x=1725056869;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yeyGZLRFD4uSczpm4cuv0sYq5nIymYke8USPZLOj/+U=;
 b=NP/nZ5xSfOgkCjB8CnPkwUQp+QeCFkFp6zbN8WF3kW9V7at1+GGhVFQa
 sPe4m53p2CsCyUdzaAvuLPvv3RELltYlCNNRJPzhSKmZVfRbo68Zr5F1C
 VGnKovA3B7a6VTVtBM/k/nlmR2/7HV/Dq/oKtdrr9yTQOSIZ7aaFEF9Xg
 rnQEQW4yLR5+mq0DJS+k/Y2r2FZ1axSZoiTjft/ouXkW8hubnygTRNPA8
 x/vND8cxS4BllKQVaPXIgOmk3ayQC4yY6tLCM7CNs+hkwKcTRBY7A/DfG
 YHBU09/cC+pexnnEu0nTUHxzRwqUbB0h1mbr+E4iO4k/MAmpYT0KEW/cX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462444489"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="462444489"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 15:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070495174"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; d="scan'208";a="1070495174"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 15:27:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 15:27:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 15:27:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 15:27:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 15:27:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KE1s8G9w3oo9F+7igRDu5NJ/N7PlNit+vAac+jviWiRZZ5p9R4JdqtcYCxFEnmRb0eCOkcUlQ+Qk/FNuGA5E1p0zlHIslpzGn+Zgmsy3EQTfhhuiMJA00TT4r8XXh1mwvjjCOb4u0K5oiOK5KfdZgtoHw1+jQzVjPolVY/59c+4vOSNjEP6M0owc2c07mWJDx8dQ0JzdyHWcGwhe1f9+dmtssYQYYYdp0tukaTwpaN04/LM2308u7J9n2pAiX6HAWG/y2taaVCw0X2RwAJT9Br90EYxBJFSMzHwyPvuqxDowcIizHL1cb1YpDbGasg3YzGi9DFdvrytpYMWj9GagQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAQAsL19N5jD4o+e7cb8+WFCK+6eNnRnmRUYx2yKs/8=;
 b=ELc8hgEvGs7qR+pgd0AMXdgHLUUOB0IvF9HUK1BTkHofImpfoAjGJgm0pAjauBeAQQouvI8JuqUoQAOtlgi0q9aBwcfDZy2+wotaWNdIMbsnVZ6FZAkKLMuyhJKmUhAYMiWFqvXO4FbgpWiBVFWIzgS/Bp490hK/kW3G/jCEhnAw7mYkUVgQpslSCuQpxG43srBwIdePLZqkg8BUcp9TxzhbnLb2t4YJcww0i8wKQpuKeaEBs6YRGM5AB3QSTqF2Q4ON1G6GpWaq/zdjnp9dT9zRAUgRQvkR2wXDlI7s51CVLZMmT44aYQY6eJhFvUJiBl+MHRT9huxuW6sSCxf9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by PH7PR11MB6500.namprd11.prod.outlook.com (2603:10b6:510:213::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Thu, 31 Aug
 2023 22:27:31 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 22:27:31 +0000
Message-ID: <983eb186-5b6a-8df3-1e67-eb7da6a8dbcd@intel.com>
Date: Thu, 31 Aug 2023 15:27:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH v5] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
 <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
 <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
 <ZPCc4CU+S6Gv6GzQ@ashyti-mobl2.lan>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZPCc4CU+S6Gv6GzQ@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:303:b9::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|PH7PR11MB6500:EE_
X-MS-Office365-Filtering-Correlation-Id: f00f7bfb-f640-493a-541c-08dbaa717753
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ctg8xy7YC6bNLYRpX782EutSH/DnPzGAhQqvEM61jq+xfaHXpgm5U0YvRgAqTi5mVTyZGJVYcbCNfvlaI1ixstMFOcHNccrA183EkwNa4QUzIH7wqmuONHz+ntixS256avwecgDNfR1n97iQPR9VLEzhAtQ6eMBMhpfVHeOHAWUy9xDbpLC3/QNBFxGdRWTVadP4Df7N3drHaSLKJ0GZ1wJscSGB6bA6yJLpIP81+jr1DbDhrGlBMnQVXIe8AyTu2cuw4eShK2VKikQCz0pKso/2kRUQSe8GU6R+n0DFtXqRUuYgFV4cvEC3TFtgBsEcaOY5T1AXd3nYUfKG8aGg/dvxNksHNzp7q13ZbkR85MJq8iC4baEWS9hQvujCOKjZmwyD12pttrBpAjFbBWWaxYW7FqXR7zsESukT+uj7yoUEfzsOe/ad61HLvVR7HHsRkuVr4dBF33+3P/o3vpKxyJoV0F8sHONHnv7AqZ15p3iB+cYAV7T0OZFEVDLoK9Ntid/2dRv2Cd5HzhdlldSTN/8K8cnJ5+5ofNmsKnhXwFJ0gnlrcONDMToAG5gden59KpAh8aamdVhK6LGKnDRhG7M6RC3eNUrgRzJtC8IrpL1245uHKh+UFFaEOxdsxbg9Pqy6BgMMblByrKK6KuDnhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(1800799009)(451199024)(186009)(6666004)(2906002)(86362001)(53546011)(316002)(82960400001)(6916009)(478600001)(5660300002)(2616005)(4326008)(8676002)(31686004)(6486002)(6506007)(6512007)(31696002)(8936002)(26005)(38100700002)(41300700001)(36756003)(66946007)(54906003)(66556008)(66476007)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkZaWm84UnJIY2UwNnpBZWV6SVZGZmdkUHBaR2tWRnJnTDU4UGxKT2NkemhS?=
 =?utf-8?B?YkpGb3VhbTEwVVBKcFUxL0lQNDdueVlNV2YyazJsbi83Q2FGSkFNbmtqVmky?=
 =?utf-8?B?RXY1dERacDlxSUZmRXhoWU9oTlozaVltU0k0R1haV1p1b3FUMVJpeXNuZENy?=
 =?utf-8?B?UDdsQ0QvakdOaGc1TEg1aXpwRHh3Z0NPdkExdmNrZFI1Ly9TejJZY2UvanlE?=
 =?utf-8?B?eUE2azlxYkJjTzRNM25GNDRlRlBxNjNMYTBiUjJqdGZzUUVaUG0vY2poTVla?=
 =?utf-8?B?TkMwRDd1WlNEMXk5cUFYWXhsekJseHFzQTNDeDRxSGU3MTRGUi9ENGtINDEy?=
 =?utf-8?B?eW1OWlNvUzI1NHljOVVvSFVaVHdlSWVmanVRUEN6VDl1M3lOYnA4Z3FEN0x0?=
 =?utf-8?B?UHFML09KOEhPdSthOXMwaWpEUlFXMTlCYnVGZmxjL0FxOHBXUXVDc1RGYXJq?=
 =?utf-8?B?cjc0cDlBc29DcURwdGNHT21kZG5JTTJaWW01L243ZEhacU5iQTRGNXQybk42?=
 =?utf-8?B?YVFKUGJtcVR6Nm9FZ2lNOFRremxEaEl4ZWc4bUJSK001QnhPbUNMWkpTSi9o?=
 =?utf-8?B?NThpU2k0ZjJMS1pxRUZUcUJGejN2OEtwenVncGNoVTRVWUY5TTNsR0tzZHRH?=
 =?utf-8?B?N2NNaFJEelhCeHNCUEVncHV6ckszQWhYY21wTXhSQTRnZkY1TVArOE0zWHdr?=
 =?utf-8?B?K29tTmFRZE1sdHphdlFlY2NyemUvTHlxaUh6Umh0RWNtNmwySmtHVjFnRWV6?=
 =?utf-8?B?cXlFelE3MUE5V2l2SU16UjF4MkZUZ2pDaTN5c0VoOXIxaGt5VHRRMU4xNHEw?=
 =?utf-8?B?UFBoOEMwZG50VUx5cmxFVHFwN2U2OWE3d05FdFdSWmRqSGtYSy94U2RNWWNU?=
 =?utf-8?B?dmtrYXJiN2NYTkx5OXVtcitIQXFldXkzQWV6TXROeXAzWnpSbmJWeXI5dkFP?=
 =?utf-8?B?K1ptL2VBSldVU1FXS0NQNU5kOVpQRmdXbVlkeWMwNVpPNWRJS2txTFJSOUYz?=
 =?utf-8?B?M3J1M29BYnczQ0luTFR0VDZGWWJsTFQ5bGorZmNTcjFET3NmbTlmclJQYXUz?=
 =?utf-8?B?Q0tEdm9FSXh0NzYrdk9RNE1QcVkzQ0lDc3J5WG9CZGpuMXlMOFNiNFUyeGEx?=
 =?utf-8?B?Z1ArcTFRbTlJdGpKcUZBbTdEYWVUelFKY05kYWNqeWY1VDI5RnFENk5XN0Qr?=
 =?utf-8?B?OWovV1g3RUd0SVQ5NklzUkNjMG9JUVZrcTlmSXluL2RmNktWZjN1ZHo2eWxS?=
 =?utf-8?B?NDdJcEJ1MlJ0UXZpQTZ6dlV3YUlGbVpHazF3VEwyVFNqWGhZSWw3eVFXM0pN?=
 =?utf-8?B?VHV0SWNPWnNPc3hqUXpDVmxHVko5SkNBWFVXc21TblhrL1hqZHlvY0E5OHJa?=
 =?utf-8?B?OHhpTWFWNTBtNmxieXlLcGNQb3JsTm9UNGVEaWtUZzdtSHFiR21TRzBWbkQ4?=
 =?utf-8?B?YW1xRi91N1U2ZWtMa3JWVFNvTEpYVllNUjM0SUkrOU1qdmVLOWp1bXpQWTNV?=
 =?utf-8?B?ZXphcTFPSWgvd0dWYjRQbFh3OCsydDRzTm1lR3owZHBla1FvS0NSa2JVUzdG?=
 =?utf-8?B?RTNhck8wMTdUREhoSUZqRmNkRUgxV1RwU2hhSlpUNzhRMkczakZLZGJQMnZZ?=
 =?utf-8?B?UCs5cVl3ZU5ZamR3dnUvWGF1dzMxN2lKSyttWGxzMGRJM0NHdm5lMHhDK2pw?=
 =?utf-8?B?YzFGN2hIUUphbUVWNi9LMUQ2TUpwMXI3N0k2QVVEa2Z1WUpPbmR4cGFYWmRh?=
 =?utf-8?B?QlFFczVNM3JGNVJvKzRnRThLL3V1cC9sWmxSRjRyQWNaV1crQzlzZmpGM3la?=
 =?utf-8?B?U3REcm5iZ0w2NTlxaHM5eCt3aEdsRlozakJTY1dWeW9CQ0tra2w0SFRYUURP?=
 =?utf-8?B?M2FpUzl3VEdVWFFMMndTbEJHV3pGVlZMZk9xTXZ6Szl2cDhhbnRGbWZvREdO?=
 =?utf-8?B?K0wwc1FnZ0IxeTdBT1JzVmlsRms2NGFLVUEvd01PeWVUY1R4YlBWR29kNGtv?=
 =?utf-8?B?ZmNUaUhMQ2Z3OVF2Y3JDNS9MMTR5dzRDWi9sZnhFai9KbDFJc0FrVnBCSkpy?=
 =?utf-8?B?LzBzZjFSNlhwK25KdkhXOGpTeE96dzY5b1ZlN0J2S1Y5R3Fhd09CR0UrT1J6?=
 =?utf-8?B?dkdKVWl5WjZ5Ny9ERWxwb3d5dXJxODZXTFRKVjFCazRjMk40Y1cvMVowTUl5?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f00f7bfb-f640-493a-541c-08dbaa717753
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 22:27:31.4671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSrcQpycv4C5XrdNgAqzsG4dJmx8K8i+ayUeOSJPYEKQpQe+F9XNiU8YuLYxDjX4EqwqGnGxYVYDRb1ReR+UwtkqssMD4RaDcDP/3eckH88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6500
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/31/2023 07:00, Andi Shyti wrote:
> Hi,
>
>>>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> index a0e3ef1c65d2..600388c849f7 100644
>>>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>>>> @@ -1359,7 +1359,16 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>>>>>     static void guc_cancel_busyness_worker(struct intel_guc *guc)
>>>>>     {
>>>>> -	cancel_delayed_work_sync(&guc->timestamp.work);
>>>>> +	/*
>>>>> +	 * When intel_gt_reset was called, task will hold a lock.
>>>>> +	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
>>>>> +	 * trigger the possible cirular locking dependency warning.
>>>>> +	 * Check the reset_in_progress flag, call async verion if reset is in progress.
>>>>> +	 */
>>>> This needs to explain in much more detail what is going on and why it is not
>>>> a problem. E.g.:
>>>>
>>>>      The busyness worker needs to be cancelled. In general that means
>>>>      using the synchronous cancel version to ensure that an in-progress
>>>>      worker will not keep executing beyond whatever is happening that
>>>>      needs the cancel. E.g. suspend, driver unload, etc. However, in the
>>>>      case of a reset, the synchronous version is not required and can
>>>>      trigger a false deadlock detection warning.
>>>>
>>>>      The business worker takes the reset mutex to protect against resets
>>>>      interfering with it. However, it does a trylock and bails out if the
>>>>      reset lock is already acquired. Thus there is no actual deadlock or
>>>>      other concern with the worker running concurrently with a reset. So
>>>>      an asynchronous cancel is safe in the case of a reset rather than a
>>>>      driver unload or suspend type operation. On the other hand, if the
>>>>      cancel_sync version is used when a reset is in progress then the
>>>>      mutex deadlock detection sees the mutex being acquired through
>>>>      multiple paths and complains.
>>>>
>>>>      So just don't bother. That keeps the detection code happy and is
>>>>      safe because of the trylock code described above.
>>> So why do we even need to cancel anything if it doesn't do anything while
>>> the reset is in progress?
>> It still needs to be cancelled. The worker only aborts if it is actively
>> executing concurrently with the reset. It might not start to execute until
>> after the reset has completed. And there is presumably a reason why the
>> cancel is being called, a reason not necessarily related to resets at all.
>> Leaving the worker to run arbitrarily after the driver is expecting it to be
>> stopped will lead to much worse things than a fake lockdep splat, e.g. a use
>> after free pointer deref.
> I was actually thinking why not leave things as they are and just
> disable lockdep from CI. This doesn't look like a relevant report
> to me.
>
> Andi
Disable lockdep? The whole of lockdep? We absolutely do not want to 
disable an extremely important deadlock testing infrastructure in our 
test framework. That would be defeating the whole point of CI.

Potentially we could annotate this one particular scenario to suppress 
this one particular error.  But it seems simpler and safer to just 
update the code to not hit that scenario in the first place.

John.

