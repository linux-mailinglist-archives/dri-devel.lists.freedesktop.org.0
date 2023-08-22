Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C1C7849BE
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 20:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D04710E3D0;
	Tue, 22 Aug 2023 18:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE4410E1CE;
 Tue, 22 Aug 2023 18:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692730412; x=1724266412;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=yCpJdD17ynwRFvbObMtEKzKdQGVYmjCRL0G5B8+9Fgw=;
 b=Tnt5cZc9BtugQ3YLpCAHwApDHRBKl+ykkuchKpdtix86VBbRneL6Sji2
 OTeKG4GU/sGtjJL8y1M3OXX3DhPIfVGmaWEReyzdw7DwxmkHAeOQC3jsI
 CP61cM5Hpo8ja//DASzpLBXFpFMDzYA5NHUttR1OTMGKFdfvYdwOsvsZL
 Mi1MG5oP/AkIxMVx0qUN4Za3qfYYgMoPqdg7H6GVC0oGc6/uqu/WwAHxP
 /vfDsfLJ3H1svfnwvVNYUJtXcolnVUwk0NS/XKZtxddL2mINomeZgC64l
 zfREJD/yckRkm+sRrwG7LuoR72RZyytL4R+FbZFhcCBdUgND8rAq5bdQ4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440333656"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
 d="scan'208,217";a="440333656"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 11:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729907015"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
 d="scan'208,217";a="729907015"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 22 Aug 2023 11:53:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 11:53:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 11:53:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 11:53:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVi+4+x7HvyJLO+6ZkqI+QzRfUA83QZHEH5E73ildCeykp0j+tbJ/jhEsHTWrmPUM+s03JrbuIxPQQuwYWVmJsjtxLCXFQCz3ZGMBiOgfBi6HMfZ47xKY4jY45GJithD2w1HGMEHdhI5WaUBvN6Ui33aFDoNAEdQN+z/N2iTY9AHlx8xxNqNdoZaLuCsBe6F1Thls7YB+YVb6Xy40yftk1w7syBls5sJM89MR5qJ6OTS+PfXy51j12y9vo6Tspzc42Hf6CZ5BDe6x5tcq/7Q/oqZpXl70Bnp/LFIVmtbsJ/5RTbHWDlHRcNLyMeYijj5LxN8I5oOgqt5onPpiyBS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LspMSopP/nQvxbqn+6cswiMdEAQscLQZlDVVvOQePBI=;
 b=FZNX3rKrCv1JL93bfJLvgADDKu55BFFe6wVOvtma9wiNCHktyfe0fNtr/13b4WqB30Dz0Z2mVpoOO5xN8TdXsgOfDpF/YIL5MhVVUuLxPts1Fll+PgoTvn9oNdfcl3bJYklh/b615NRzHbX3wulDSuRx6wrqxO+nA6310K9bGLdPTQ/Oa1KEklAO0oxFY90t7QmMlNfFztObGrEyznk0+nbbuvVLwVCu64lU98jJJww40isnfUHh4/aKzZFHcUakiIHhuYZuy2hG4+hZLVbHMXa7clJYmbIYdYWyP3xM3a72ApudBsDz6LO9mDTQMZd5fIXQ2hYjw9hDogP1fY9YDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY5PR11MB6509.namprd11.prod.outlook.com (2603:10b6:930:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 18:53:28 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 18:53:28 +0000
Content-Type: multipart/alternative;
 boundary="------------fLc76Oi0TlUSCPgYpIOonid6"
Message-ID: <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
Date: Tue, 22 Aug 2023 11:53:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Subject: Re: [PATCH v5] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
Content-Language: en-GB
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-gfx@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230811182011.546026-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW4PR03CA0122.namprd03.prod.outlook.com
 (2603:10b6:303:8c::7) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CY5PR11MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 761a7781-a6e1-410f-e813-08dba341124e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v8qyyy/0RRXxxoZWqtd7955RLElT6ohPGaf+tgIIa/ebT0wHJf6kgV7bRSeuaKIdOii4clDoRCtGUCqh0SXMhpLaSdgExQOZS5CtJ4nElotNbsfYP1JQpPpx+sxB5hbBSGXQyFvaPbupOIc9qpDTo9tZArCx3oXPhcf8MO/HkJ1obQjpNwCrNRtbUWHhO3bV7CPA5OqGFdl9m0FCDlItZ8x9olBwcT+4NjQ8MgGu7rdqxVwtSW9pz+2J++bumxWEo0sqYTKiR18XWTxyrAMwMlc3K1uUmSDkbeW+B3u+0JMyY/SKyNWWVfuamZhG01qo3ADG0mttXth6m59yfr+cVEDEXjXvnf6i09z20T+JKiwAoHdCuRhKMMB5FOUfAiWf9+ePCY0fDi0GCArnh15So2IL/zTY6S4R/eCMVROI2PK8hC3nIADH19BGOFkXDYc33pQZFSEuRxolz0VmkvrPDilQEkfcDi2lbKZWkWuJ/MyVCxaDx6vZUomiipjiTon1pIwm125uB9Q+XhwAjGKsrDFs0u2E07SU8DLrpa6zu3Te7o5vAW7KFfbKddD0sITrQEIYOYf49nyUIyzVraVdItgLLIrBXKK77KjbUaAqWONn8qa0vDDodmi1jK6r9kOmkaKMD4doPgfzKAlX+y1/Iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199024)(186009)(1800799009)(2906002)(38100700002)(6506007)(53546011)(6486002)(83380400001)(5660300002)(33964004)(26005)(31696002)(31686004)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(54906003)(66556008)(66476007)(82960400001)(478600001)(6666004)(36756003)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTNOZDN1ZkF4M3VlTEkzWkgvRDZTSVVmdTlDbWtYakxTMjREMlo0VnMreERM?=
 =?utf-8?B?c1N6enpnbTFCNHkyUThpa1hTc2pxNWVucHUvZ1RjR1YyYU5ZTVFGV0F6bDNi?=
 =?utf-8?B?eGZsSDJsVWVjSksrbmVzUFVsTXJ3cWxDVkdTSlg4a2FIWG5yMHQ0dU5kQTMy?=
 =?utf-8?B?aGlUdTd4c0RhWEt3QXVyNEplbkNmZ2p3bnd0bUhiN1VaUWNTWnJPN3diVVhp?=
 =?utf-8?B?QmJGUnNPL2ZmM1Z5RjMxN20xR0dPeEVKeE5hVFdpSVRzeXlma20yY2doSTVr?=
 =?utf-8?B?bmU3VXlHV2VBVjUrZjFNUnVWYTYyVmdlb1BqWWcrb1NCVEZXcDF4NkNPSG1C?=
 =?utf-8?B?d3pibHIvVWtIMDU1ck14VGNUQmUzODg4MGdMSkFIZ2haazRUcE85aDhBYnNV?=
 =?utf-8?B?VkxsYk0vUzRoNXJLcjBYdGtHZExmdWdLWG1nZGtlRFRiZU04d25xRk9vUmov?=
 =?utf-8?B?azl6cysvZ0VCKzFwSmRZb2FwRCt3VzcwV0Z3OHR6U0ozQzJGMUZyRGpXL1M2?=
 =?utf-8?B?cyt5citoT0dIUXk3SmRPNTZ1WklLcCtkaXJWK1p2UzFMOWJLQnpUM2lOQ1FC?=
 =?utf-8?B?c1A1NGFEMEEwKzlLODhyUG44M0tsRXEwUGplTC9LcWtqVlN5YmcwcnJRQXZF?=
 =?utf-8?B?TnpNREVWZlZiOXNXb2M5UnFESUczVkxSejJYR0ExdFRXaFBvWTNTa3gxQ25Z?=
 =?utf-8?B?K2ZJVU5abjZaclo4ZFR0UzFJZ1BrRWc5QnZ1K01vdFYzazg0ZWJEVGFlM1JL?=
 =?utf-8?B?SzFLcWtMRm5WcHhJcTNYT0t2cW55Rm9DWXN5YThHSEdVdXZGelJRUGRqeEF3?=
 =?utf-8?B?MEl5VUtReTNOem1URHZqMFcvblg5b2pRWUk0YzgwVjM4VGpCcEJmeGdLeGdu?=
 =?utf-8?B?V3Y0RDRKT1RMc0tnZHZIZ3h3V2JEY1dua1hiVUVLMUdOVENZMGp1VmZPOHhr?=
 =?utf-8?B?RTUwWmllaFJCZ2VaZk9DVWowbGJmZVQreG0yd2V2VW8zZzQreWJVQXQ2QzNT?=
 =?utf-8?B?VTZPUXhqMmZmNXJKT3hKd2k0T0hYR2U0S05FT0o5ckNBUzBIM1ZJZ3dId3dv?=
 =?utf-8?B?M0JlT3AyQ2NhRmpmR0E1SjAzbW9Na1dWVkU3L3RqV1lsQjkvR2xiM3VabTVC?=
 =?utf-8?B?SmZweWFIV0tXbHkrUE52V3N4dURSWGxQVmtSZmdtZUthc2hnTS9NTDVKRG1k?=
 =?utf-8?B?VEFNc05jVXV4WEF5eFZkV0dycHNXZXF2TVFLUE1KM1ovQjBhcmYyeXhPUmFY?=
 =?utf-8?B?L2FmdW03RjFTVTI1THlUS0YwaW94bGJHWUd6RDhjSWs4VkpKamQ1WkJmZlFi?=
 =?utf-8?B?b3dKejFPYUtmWWVQNXZFcEx6bG1HYTRLYWpwQmgvUW5NdHpLRSt0Zy9HVGVJ?=
 =?utf-8?B?VkVpWUN0WTFHYndvbVcwdDlyd25aM085UVcreEhlWGZXSFd6UGdLZkZtWnNz?=
 =?utf-8?B?bjR5ZU5oOVpJWUpYOU1BdkY5eXQvZldkeU9keUlyc0xHSEwrQzcrRFJWdGdS?=
 =?utf-8?B?ZmFwdUNodkRkdlpFQVd5dXNnTng1K0tnVWRsaE1NcFpBeEc2ZnZsNUNFS2lw?=
 =?utf-8?B?UUdVMjNWcGU5T01lMkRZYnYzRnVyTXB3VFovSEVpbGdwS0UxN2g2bmRhL2NK?=
 =?utf-8?B?L04yb2tNS0FPUlRxUG0yaGp4aisvUVF4dnljVWhuNWlDWVlHaGU4T0FneXVP?=
 =?utf-8?B?QXpLVWo5RThwbDFOYXhxOHhweVZRemhZZHJKejNKNnprQk1XYkEvZFFSNmN3?=
 =?utf-8?B?dlZyZWFDU0JxNGluRUVpMFVINDNNMG1wVTRPcEI5MEZXbFc2dmpYZTFqakFL?=
 =?utf-8?B?MFlIUVQ1TWlZN1ovZnZpTTgvOWd2ZmdBSjlJRDJSUzFqSXJOZ09LbXpqME9L?=
 =?utf-8?B?d0Z1WkRiS2M0aGptSFc1bVQ3Y3FLNDdHd2JidGQyaVhBcFNUanhEcjFod05B?=
 =?utf-8?B?dG8vbzZhQWhNT1ZnU0ZrT25obXlmK1ZKZ3FzYW1vWEIvajJvSGN5M0JOa2RZ?=
 =?utf-8?B?bW9od1pLUFRTV0NCNER2Nkk2b2NnRno0aWJmTytxWE93TG52NWZNcG1TR3pv?=
 =?utf-8?B?ZDA3Mk9OZThtWktNZDc3VXRQRk9KOHI5MndVWXZlaUV3ajVUZ2J4RUFsbWhV?=
 =?utf-8?B?V0l1WjdYdnpZOXlLb2RZOEU4T3RJeitZY1JQNkJkby94WGRUd0NVSStQb2dl?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 761a7781-a6e1-410f-e813-08dba341124e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 18:53:27.9904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqE8oMO+axA9ERm96tSUbBTxbn4m1gwZPzvXuje47rk580RqBto/v96FyaTG8dMKsh1jUu79CbNHMmd5nHx60ZfmkV9UiBNYiQRlgnVoYgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6509
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------fLc76Oi0TlUSCPgYpIOonid6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/11/2023 11:20, Zhanjun Dong wrote:
> This attempts to avoid circular locking dependency between flush delayed
> work and intel_gt_reset.
> When intel_gt_reset was called, task will hold a lock.
> To cacel delayed work here, the _sync version will also acquire a lock,
> which might trigger the possible cirular locking dependency warning.
> When intel_gt_reset called, reset_in_progress flag will be set, add code
> to check the flag, call async verion if reset is in progress.
>
> Signed-off-by: Zhanjun Dong<zhanjun.dong@intel.com>
> Cc: John Harrison<John.C.Harrison@Intel.com>
> Cc: Andi Shyti<andi.shyti@linux.intel.com>
> Cc: Daniel Vetter<daniel@ffwll.ch>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index a0e3ef1c65d2..600388c849f7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1359,7 +1359,16 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
>   
>   static void guc_cancel_busyness_worker(struct intel_guc *guc)
>   {
> -	cancel_delayed_work_sync(&guc->timestamp.work);
> +	/*
> +	 * When intel_gt_reset was called, task will hold a lock.
> +	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
> +	 * trigger the possible cirular locking dependency warning.
> +	 * Check the reset_in_progress flag, call async verion if reset is in progress.
> +	 */
This needs to explain in much more detail what is going on and why it is 
not a problem. E.g.:

    The busyness worker needs to be cancelled. In general that means
    using the synchronous cancel version to ensure that an in-progress
    worker will not keep executing beyond whatever is happening that
    needs the cancel. E.g. suspend, driver unload, etc. However, in the
    case of a reset, the synchronous version is not required and can
    trigger a false deadlock detection warning.

    The business worker takes the reset mutex to protect against resets
    interfering with it. However, it does a trylock and bails out if the
    reset lock is already acquired. Thus there is no actual deadlock or
    other concern with the worker running concurrently with a reset. So
    an asynchronous cancel is safe in the case of a reset rather than a
    driver unload or suspend type operation. On the other hand, if the
    cancel_sync version is used when a reset is in progress then the
    mutex deadlock detection sees the mutex being acquired through
    multiple paths and complains.

    So just don't bother. That keeps the detection code happy and is
    safe because of the trylock code described above.


John.


> +	if (guc_to_gt(guc)->uc.reset_in_progress)
> +		cancel_delayed_work(&guc->timestamp.work);
> +	else
> +		cancel_delayed_work_sync(&guc->timestamp.work);
>   }
>   
>   static void __reset_guc_busyness_stats(struct intel_guc *guc)

--------------fLc76Oi0TlUSCPgYpIOonid6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    On 8/11/2023 11:20, Zhanjun Dong wrote:<br>
    <blockquote type="cite" cite="mid:20230811182011.546026-1-zhanjun.dong@intel.com">
      <pre class="moz-quote-pre" wrap="">This attempts to avoid circular locking dependency between flush delayed
work and intel_gt_reset.
When intel_gt_reset was called, task will hold a lock.
To cacel delayed work here, the _sync version will also acquire a lock,
which might trigger the possible cirular locking dependency warning.
When intel_gt_reset called, reset_in_progress flag will be set, add code
to check the flag, call async verion if reset is in progress.

Signed-off-by: Zhanjun Dong <a class="moz-txt-link-rfc2396E" href="mailto:zhanjun.dong@intel.com">&lt;zhanjun.dong@intel.com&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
Cc: Andi Shyti <a class="moz-txt-link-rfc2396E" href="mailto:andi.shyti@linux.intel.com">&lt;andi.shyti@linux.intel.com&gt;</a>
Cc: Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index a0e3ef1c65d2..600388c849f7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1359,7 +1359,16 @@ static void guc_enable_busyness_worker(struct intel_guc *guc)
 
 static void guc_cancel_busyness_worker(struct intel_guc *guc)
 {
-	cancel_delayed_work_sync(&amp;guc-&gt;timestamp.work);
+	/*
+	 * When intel_gt_reset was called, task will hold a lock.
+	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
+	 * trigger the possible cirular locking dependency warning.
+	 * Check the reset_in_progress flag, call async verion if reset is in progress.
+	 */</pre>
    </blockquote>
    This needs to explain in much more detail what is going on and why
    it is not a problem. E.g.:<br>
    <blockquote>The busyness worker needs to be cancelled. In general
      that means using the synchronous cancel version to ensure that an
      in-progress worker will not keep executing beyond whatever is
      happening that needs the cancel. E.g. suspend, driver unload, etc.
      However, in the case of a reset, the synchronous version is not
      required and can trigger a false deadlock detection warning.<br>
      <br>
      The business worker takes the reset mutex to protect against
      resets interfering with it. However, it does a trylock and bails
      out if the reset lock is already acquired. Thus there is no actual
      deadlock or other concern with the worker running concurrently
      with a reset. So an asynchronous cancel is safe in the case of a
      reset rather than a driver unload or suspend type operation. On
      the other hand, if the cancel_sync version is used when a reset is
      in progress then the mutex deadlock detection sees the mutex being
      acquired through multiple paths and complains.<br>
      <br>
      So just don't bother. That keeps the detection code happy and is
      safe because of the trylock code described above.<br>
    </blockquote>
    <br>
    John.<br>
    <br>
    <br>
    <blockquote type="cite" cite="mid:20230811182011.546026-1-zhanjun.dong@intel.com">
      <pre class="moz-quote-pre" wrap="">
+	if (guc_to_gt(guc)-&gt;uc.reset_in_progress)
+		cancel_delayed_work(&amp;guc-&gt;timestamp.work);
+	else
+		cancel_delayed_work_sync(&amp;guc-&gt;timestamp.work);
 }
 
 static void __reset_guc_busyness_stats(struct intel_guc *guc)
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------fLc76Oi0TlUSCPgYpIOonid6--
