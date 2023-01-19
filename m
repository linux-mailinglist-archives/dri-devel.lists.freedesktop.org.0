Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D55967427D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5726710E233;
	Thu, 19 Jan 2023 19:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7793510E009;
 Thu, 19 Jan 2023 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674155656; x=1705691656;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q12A2/U6ZUUx7zDZVjoC5FJp7O3ygih5QtHV8mQGBIs=;
 b=EuHYyLp9fq0rvcAccvhE4dNMmXwTFvJftXktQHeAJb9vwmRA108DQLyz
 NWl+f2I2Ib11Atuh5RZLltmFo90Lpt28cW9+MzpVtRyA/weMWE6S8Bd+9
 rgfxmaMbcCYRpXJg35kTw4rk4EAqx4rlBWXLImoDiqt2WrZ8KfzbHxyR6
 SSKvOYxIU4RMMkPSwect1fwfKJ+aziV3n7lmfQ+Ue2dGYIWTSv06E2/B/
 UXPuLUlhYWr2w/024GtXCouOfSPtkSkEe8Fr2tCdOXkGoGauOck81t32g
 VmzsAuSo0ljuN7S5gnpCi7e9IeHe+n0niolIpdlSs8r9okb7VyMREOvH4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305064323"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="305064323"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 11:10:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="637818572"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="637818572"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 19 Jan 2023 11:10:27 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:10:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 11:10:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 11:10:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 11:10:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qm3+pZ6msWAreMH1yTPwf7Iv+V5zUKmF8W7vYN8WWtO7wgCICUTDMZMr7ReuNs14HC1LCoj3wn3v0wy0GPTba14oCejq37ww+DLGr4CCawWDTcEGMpcs8Ry7SK/2KRw58WX+BRa9iGV6Ofjchnp5323eUsZlEU/XjCJPDv+6YE+kghsjMoEYc2vaR8mGX65ep+z4oQoC/SYGoyfqNrPheReKrKVc/UQryRZKwq3AgPiuLqziI5e9UpV/B1lfaBcHYExmLHxKa4nhs/4/+A+wC5KqHi2JtvxlQrHvA2VHfBJLRDIMDiE9fB4RKmVZOSt8JsnQBXz9jhVn21ND6lJj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCqzgcxjdlN1eGx9dtcikWEi+p6OPvlcGChifICXBkg=;
 b=XYiskyXLQ6wIqI/lJhJMNJqulu/4e2p0c6R/Pf07qL2CRb2SfmDIfpiEN2dDYBnbJ36ljPTDYbi06Y0yM4BSQ8fHRhGOJoLf8UQAp0DnFGxfzGQQanIm47UV8bXVIj+9YHer5L0EbYJQS+8k9BtmeN0tEu9c/wPKt6OHvOenVnkmRvbeqcgs4U2lTDbzbVJ5LTpkHW4cB7i+0STIaihoWrjL/u9kpcrKUU2a9pzbzf75yG3RgoT/Fxfcg7I4lTFEHyv+mERl1rSKwOH32wfHpjyQh1RaJQGxL+vvClDoEau4s7in95WIL3tyMMwhyU5bSceR879hqfhZw/BOeRFvAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 19:10:24 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::62c1:155c:1857:167a%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 19:10:24 +0000
Message-ID: <79550dc0-2901-96a4-d6dd-c96926012ec3@intel.com>
Date: Thu, 19 Jan 2023 11:10:21 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 6/6] drm/i915/pxp: Pxp hw init should be in
 resume_complete
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230113011850.1463965-1-alan.previn.teres.alexis@intel.com>
 <20230113011850.1463965-7-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230113011850.1463965-7-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::11) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5488:EE_|SA1PR11MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b97f306-4edf-45ff-797d-08dafa50d113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lfYFjAXGO7ynMT9qIYQbWG2HKkCtqU7zwpvGbRPVzkBW48WsSl+O7gqw/YSyu0VuV5eVjPxlt8fjnFd9gzD1NniDH8BlT5rjfWlbnOqK5+5ICIOq9m5dpz/7NPC0DKKtEurtdPI+5WUV9D4usVMv0QSH2i5gMkY0I3olhcapTyKJmqT05D7xETLShhI3GgOaxmqn1daag2/HbKTdpGR6MwNU1LWWg5kfSy5Q7vIFPpo/j956AfcdWJbTnReKJafHCglKnWAN4uXfSQArPfXypfSq+Iz81UXWVXV9Gk6RPNtcoCIGmUOEhZSCBPnWXzNs8sQ1jKUxb1MR1O73OTuRkIe6d5x/Hqne8wn493/bOXf0zvNcjCPztCTCXWwyRJysTXohcu56SfJGX9OdjNVjDQLnRo8PilwewujuPfbkcAKj1DsAsoTLEiWFglMZAHiRSz+1ZNwQP4J7SSoW3MtAERSyPlxaK6+aojtnN5SZlu9bGhoXnoWBucHiSEhTrQykfpHbgW7CELK1qc+msJ99iORjzBekHmii7/++UmPTiW7/6G+5udIKmnJmnj7mLba5Y8HlypJubcU3/kHc0+1ZyJb1fErC4x1fBYKAzv0xGybHJy+N+09PND/3qDNX/XKf0Mix7jmmAzvn4R7f8aWqikdoYCNd/oO7ltSZxEtOvJRua2fLel2KPxjSSYt0CRnFORD0h5N3Jte1Xb+HEAvXI5jbVTLevU5reNhNcVOjNp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199015)(31686004)(8936002)(5660300002)(316002)(107886003)(86362001)(6486002)(478600001)(36756003)(6666004)(31696002)(53546011)(6506007)(2906002)(83380400001)(54906003)(2616005)(66556008)(66476007)(4326008)(8676002)(38100700002)(82960400001)(66946007)(6512007)(186003)(41300700001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW9JTVdnOWhSNFlYeThwNlF2UzR6WWR5aUpPL2dobnREbUZXMG9BUzBxeW10?=
 =?utf-8?B?aEZ2TDVJSWlpOXozQkd6cEFHcWdueUVUQUM3d1JaUDVIbVE0Rkg3WS9MdmlG?=
 =?utf-8?B?NE5xMVpTUXFVRUpMZ04xeDZaQlErUjNlcytHMGg4UlZUL21WNTNlb0FtL0l0?=
 =?utf-8?B?UDFZMFNEQmtJSGpOQU02WW1KTlRZekhSV2ppVWpZTElhZFlEZmtaaW03VHhh?=
 =?utf-8?B?VzZoMzhFOTFNNFg0Z3dteCtIRG1tWTJRa05McEdwVnVnL2VzT0tzNGxkeEdT?=
 =?utf-8?B?V0hzYWcveGUwaUdjRHg3UURQTWN3Y0VPK3RZT1lCdE5yZTdoU0gyRmpRQjNs?=
 =?utf-8?B?S01WR3YyQ2sxYWVhUmdNdlJrQkZyR0E3MHcvLzIyUXIzYXJoZE5yY0ZIQWox?=
 =?utf-8?B?VVhZdE9nV2RYSzlKOU51OWtUa3hkOXpiNzhlZVl2VFZwYWNLMS9CSUF5L09r?=
 =?utf-8?B?UnhSdVl5bVEyeU1FN1RFdXNnMG5XcGRjMTNhYlk4YnNvbUtaYnZTRXJtbWJp?=
 =?utf-8?B?Y3ZSNmwzTFlsTUdOeFhqWUgrUFJwMFV0S0FPc0o2TG9XeDdLc0piU0VXTEw3?=
 =?utf-8?B?cUZjcEhJd0RsU21mRmdBQ3U1QTNUZ3lzS3docWFkZGdrUUI3bjJkcmlGemxF?=
 =?utf-8?B?eEFiZkhtM3d0b0xxRlJxVlFvbzlHZVRqSkpWOXVKMXUwM2FDZmNFeDhvbHRy?=
 =?utf-8?B?Q1FXTERFTzhoVGpma090N3BKVFJQcDVOaDdkejdJVmF0YTFkY2dhbjNJaW9M?=
 =?utf-8?B?TlZjd3lXOUxQYVIxYlZEQjJJdC9DY2plU25UMkk5aW5ySEcvZFdsVWdDdE9W?=
 =?utf-8?B?UXZtVzduaTlOUWJPZzF0eGNTRU40N05haFQ5TmRMc2lpYkdHMTRkWUV5ejlk?=
 =?utf-8?B?R3gwWHgranJpdjdkODlsdkFyQmoxWjJNalhxM2hJWmtGenNkM2hJTlAwc2F0?=
 =?utf-8?B?NGxsUHplMlZNK0dNam9EaGUrMTJMQlNlalI0eE1CTmcwaWlNUVVPUTVyRWVN?=
 =?utf-8?B?dVovci9MS29yUHAzS3RuVGVYU0lydXZzZkt2bkRWZUF3RVlOMTlhSFdOck9s?=
 =?utf-8?B?Q2YycmlneHl3QnBTbnUxVWpvTkdTbTZDRmZISW5icWdxYzZra294Vlc2V2Va?=
 =?utf-8?B?MUhNT0ZDTFZnaWFGNCsrU2tnYlVLUnM0dUNrTGQvakI2a29TU0NISGlYVnlx?=
 =?utf-8?B?cWpWZmd1dHIxY3UweG9zSjdUWElLVTJSTE4xb0paUVFKdmhwVktUS1FCWng5?=
 =?utf-8?B?RGhRT1lkNXlHVUdVOTQzWExuOUxNN3p6bDdSTVdaWVdzYjNQZEVZSm95aFpw?=
 =?utf-8?B?NE5EaUc3NFJwaEZ6Q2doZ0N1N014UFJDTDhSYTBtbmtNRVgvNDNmOWFqMkNr?=
 =?utf-8?B?WEFxL0Z4dWpHVUpVZFdmcWV6WGlBSUNlNkFnZ2lleXFEOXdENWpONkN6YVh2?=
 =?utf-8?B?VmxlY29qOTlXRGdXdngxNDhvUnhDSmt3aHZNV0pEbnB3V2l0aFVFODcvcW10?=
 =?utf-8?B?enBTMjM0WmNKbWI0cnZ2a2cyR2N3cm84ODRYTlNtaHdTU2RKUlEwRFRGYzRh?=
 =?utf-8?B?d2tMVi9YZ2hnUmxkQ3FjOVFuY01aU1Vwd0ZPbEsxdlZiaGVFek1NcFRXcnVC?=
 =?utf-8?B?ekxPVEs2NTFXQjFYTWlVeVMwdFR4WlgrUG9sRHl4L0NMQktXcHZnYy9UMkww?=
 =?utf-8?B?ay9lVU9lOVpqSUF2S1FUWFM4R01nSEZOdGxGRTEwdGFocTR2eTB3V3FWMmhl?=
 =?utf-8?B?UDByRXo5Y01mQ202UXlGMXFZZHdLR0RMYk5qd2NreVU4d3Juc3A5b0JmZ1BP?=
 =?utf-8?B?Rkk4L1hlRmlzMzZDYk54RXArbXhwbDBsOXFXUy9EQ1h0eVkxSXFVOTRMQmx6?=
 =?utf-8?B?dmZaS08wLzQ1REZ4dTV1WndwOENDUy91a2pFWWo4aFU5diswYml2WnRreVhz?=
 =?utf-8?B?TnRja3Izdm9XMytpUXRITlBnRXVMcUxIMnE4T0JEZTRrSmxCZUpNV0oxNklu?=
 =?utf-8?B?VVN3RmpTQXVmU2doR1NQakd5VU9ieVY4OGRUck15eXlaeTI3TkZ4Y3RDeVRB?=
 =?utf-8?B?MzFGTkxpWFluY01MOTk0M25hT3d0UEIvV2E1aEwvdVdhSlc2Q2kwcysxdHZR?=
 =?utf-8?B?WlhDMTVWdWxLYU9lMUIrZDNGTW02elpGZ3ZsQmRLalFKUUdwODRmQi9uVC92?=
 =?utf-8?Q?WaetIMbTaF1GuYz9ZyjPo/k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b97f306-4edf-45ff-797d-08dafa50d113
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:10:24.2919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L4T3dijtyArLJ+K1wKt8GRCW82lKCi/dA44qS6QEZw4+2udF8DkIdh5AtFFySGguLZEaNSX4A5Tcib0w/JHBCg3h1e03uhZOYfuu7jqyLS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo <rodrigo.vivi@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Juston Li <justonli@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/12/2023 5:18 PM, Alan Previn wrote:
> During suspend flow, i915 currently achors' on the pm_suspend_prepare
> callback as the location where we quiesce the entire GPU and perform
> all necessary cleanup in order to go into suspend. PXP is also called
> during this time to perform the arbitration session teardown (with
> the assurance no additional GEM IOCTLs will come after that could
> restart the session).
>
> However, if other devices or drivers fail their suspend_prepare, the
> system will not go into suspend and i915 will be expected to resume
> operation. In this case, we need to re-initialize the PXP hardware
> and this really should be done within the pm_resume_complete callback
> which is the correct opposing function in the resume sequence to
> match pm_suspend_prepare of the suspend sequence.
>
> Because this callback is the last thing at the end of resuming
> we expect little to no impact to the rest of the i915 resume sequence
> with this change.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h   |  1 +
>   drivers/gpu/drm/i915/i915_driver.c      | 20 ++++++++++++++++++--
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.c |  2 +-
>   drivers/gpu/drm/i915/pxp/intel_pxp_pm.h |  6 +++---
>   4 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index 6c9a46452364..fd1a23621222 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -77,6 +77,7 @@ void intel_gt_pm_fini(struct intel_gt *gt);
>   
>   void intel_gt_suspend_prepare(struct intel_gt *gt);
>   void intel_gt_suspend_late(struct intel_gt *gt);
> +

Stray newline. With this removed:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   int intel_gt_resume(struct intel_gt *gt);
>   
>   void intel_gt_runtime_suspend(struct intel_gt *gt);
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c1e427ba57ae..4c68a3f26e96 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -1170,6 +1170,13 @@ static bool suspend_to_idle(struct drm_i915_private *dev_priv)
>   	return false;
>   }
>   
> +static void i915_drm_complete(struct drm_device *dev)
> +{
> +	struct drm_i915_private *i915 = to_i915(dev);
> +
> +	intel_pxp_resume_complete(i915->pxp);
> +}
> +
>   static int i915_drm_prepare(struct drm_device *dev)
>   {
>   	struct drm_i915_private *i915 = to_i915(dev);
> @@ -1370,8 +1377,6 @@ static int i915_drm_resume(struct drm_device *dev)
>   
>   	i915_gem_resume(dev_priv);
>   
> -	intel_pxp_resume(dev_priv->pxp);
> -
>   	intel_modeset_init_hw(dev_priv);
>   	intel_init_clock_gating(dev_priv);
>   	intel_hpd_init(dev_priv);
> @@ -1563,6 +1568,16 @@ static int i915_pm_resume(struct device *kdev)
>   	return i915_drm_resume(&i915->drm);
>   }
>   
> +static void i915_pm_complete(struct device *kdev)
> +{
> +	struct drm_i915_private *i915 = kdev_to_i915(kdev);
> +
> +	if (i915->drm.switch_power_state == DRM_SWITCH_POWER_OFF)
> +		return;
> +
> +	i915_drm_complete(&i915->drm);
> +}
> +
>   /* freeze: before creating the hibernation_image */
>   static int i915_pm_freeze(struct device *kdev)
>   {
> @@ -1783,6 +1798,7 @@ const struct dev_pm_ops i915_pm_ops = {
>   	.suspend_late = i915_pm_suspend_late,
>   	.resume_early = i915_pm_resume_early,
>   	.resume = i915_pm_resume,
> +	.complete = i915_pm_complete,
>   
>   	/*
>   	 * S4 event handlers
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> index e427464aa131..4f836b317424 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.c
> @@ -34,7 +34,7 @@ void intel_pxp_suspend(struct intel_pxp *pxp)
>   	}
>   }
>   
> -void intel_pxp_resume(struct intel_pxp *pxp)
> +void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   {
>   	if (!intel_pxp_is_enabled(pxp))
>   		return;
> diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> index 586be769104f..06b46f535b42 100644
> --- a/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> +++ b/drivers/gpu/drm/i915/pxp/intel_pxp_pm.h
> @@ -11,7 +11,7 @@ struct intel_pxp;
>   #ifdef CONFIG_DRM_I915_PXP
>   void intel_pxp_suspend_prepare(struct intel_pxp *pxp);
>   void intel_pxp_suspend(struct intel_pxp *pxp);
> -void intel_pxp_resume(struct intel_pxp *pxp);
> +void intel_pxp_resume_complete(struct intel_pxp *pxp);
>   void intel_pxp_runtime_suspend(struct intel_pxp *pxp);
>   #else
>   static inline void intel_pxp_suspend_prepare(struct intel_pxp *pxp)
> @@ -22,7 +22,7 @@ static inline void intel_pxp_suspend(struct intel_pxp *pxp)
>   {
>   }
>   
> -static inline void intel_pxp_resume(struct intel_pxp *pxp)
> +static inline void intel_pxp_resume_complete(struct intel_pxp *pxp)
>   {
>   }
>   
> @@ -32,6 +32,6 @@ static inline void intel_pxp_runtime_suspend(struct intel_pxp *pxp)
>   #endif
>   static inline void intel_pxp_runtime_resume(struct intel_pxp *pxp)
>   {
> -	intel_pxp_resume(pxp);
> +	intel_pxp_resume_complete(pxp);
>   }
>   #endif /* __INTEL_PXP_PM_H__ */

