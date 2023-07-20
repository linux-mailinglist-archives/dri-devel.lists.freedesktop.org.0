Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B6075B9DB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 23:53:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A660810E1A6;
	Thu, 20 Jul 2023 21:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1C810E1A6;
 Thu, 20 Jul 2023 21:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689889980; x=1721425980;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xo6hkOUzPX49ZIOElwYa+UCXLZrFyfihI9d3WqsmFWU=;
 b=VJOtQt8M7LN9PGnPZ9ocPwAkQBFTiS7HB50KnLxCmJtl+oMl4zIM1xUM
 I3PsJzIbezXsgrImCU+Ujgs7opbxsYNr6QBvSPFs0WGuQmQAloSp2uWPy
 cphi/BQbhWYHi3aa1zloZtfGPzFXef+AjtAntCQpfZpiGOUsqQ5m3Zs8B
 FmxaVDu6rp8o3bdra/lujwDOetgRfbv7joJHmzKfmVeiJ59zExgbo4lEP
 tcHzC+ojb6zndktBRgQkqeFlWSl6aL//kWHUTErEV5vUN8X0NGhl9ygWB
 0G1/c2HWN+62zGDnTkhay04iadPBzTqO81fb5hqdl9boXLYT6DG8JpsQa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433094769"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="433094769"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 14:52:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="814697096"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="814697096"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2023 14:53:00 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 14:52:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 14:52:59 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 14:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzfqQXiQ4ALq9XmQURg2sT+aLChMt51SKrXcKFCo64kuT1d0hUTNaG3BEYS3+sDyPuKldfcVaJIFFIXdE5f0H6AhG9AMFKrwahFeqOylL6gFeeqSKl1ukECb5WM0zENNZA5EUKXOJTdwUbNhC25e8L5Rnvptx9sYO630jeMsGZKb0SWt+bHsZhe/B8SndaSRNI83pPl2pzjZMfC7BI7QmnG9uYssGloRO0FbvrnFWkc9g2i7tE3YKDD2rrgpzcQYqRcsgh9GtpLpMobKzfDrTIW8wkvfsx04577Axdosnujpr3KpnraOVYVpCVdjf/IKgDb+gPDgBalVp9oE4wJrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqHbHBKGUO30S4pYQpeRTVG8+Lmcuh5sQu57CD/vD0c=;
 b=B5nnP1vjzbdHpvQeTIJMSrJ4wy5JxUAtPd21nvVw2W960FeQxKyny8TRDSTZnlXD5FUXBix8IW8MQFnqEKpZCIC4AdXIdpML80Nt2KkChu2wK4Z+qFMGiybwG5e5uMSuzdtfm04CYmYcQaHGZaqVC+hS0r1mPdN6lhnVz9S0eqmy2W/QvAvmVQ/XTUx+APHaiUJ6Gw4KaOccXE9ffA2HUoN3VoJbDzvTnge1PMeW/zmo0nbKELcl/7mJhU2dl73NQ1W8atu0LlyYwu7HbChL8H2g0ci5IpQxTis4MQmHlKfnkBn8Em+TDz5Lp9yfskVjj8GX1W5k6ALrXWYfppoZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB6513.namprd11.prod.outlook.com (2603:10b6:208:3a3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.23; Thu, 20 Jul
 2023 21:52:57 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d218:3a45:e9ae:f699%4]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 21:52:57 +0000
Message-ID: <77697fc6-a3d2-d2d4-0406-e534907e2d16@intel.com>
Date: Thu, 20 Jul 2023 14:52:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6] drm/i915/selftest/gsc: Ensure GSC Proxy init completes
 before selftests
Content-Language: en-US
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230720214044.369277-1-alan.previn.teres.alexis@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230720214044.369277-1-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB6513:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec20a1a-4f79-4854-a5b8-08db896bad95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rKwOPaf82PrWDZqOvsg8aLlEQXhlFQvlvD1WFi91a+riWvh0XTecL5JcURTIA8vdvKwlMcLZ7DrwKG7cLHvt5IZkClgitvPmhMN0/i6zdYTl2ujYSUrnwJmyRpYQ+Ua1DN7w6AkcIdMJzsqSFfkGfoNOOpu0wDoLmKP1jVGX/XRifzAzpupzR8Qv6qma+wt7QMhp5njUJPzqVC4ZYja+eY1Ru22Z0wwsB9u/aAlFxTEvDsVaNJWps1iajfksd600C2r3i3MPtAUhJdW/6e2tgKk2T0GCjiLnAKrj0B1OPY54xRBO2EZ3EFalzDBtSJL7ObcBgfyrT4+EiMmOD9znomendryQoqcZ5W08ZZywC7FkE7xvzpSEQONS5wLqrZxzT/5qSu7DiMqrC7Ztq9d3G2Ijavg3G1TQ1AnQBiajfkWo7YHTOddOmFzswK9euZ0ZcKv5dKSo3kBn/WZZDWGuFwDawQksWwxZz/XepqfoiO1I0mPKXlG/ExwJZFgpc4ry197z2AC5gZ7Td8Ms+U2wyjJAFscP+hZIMsTy5u/6yza599jrNW8sDIxfVLaa6/Ja19ECNR9ckZGCrFxKD9vns/tLbCV9aSf7Azx4Xxhx6EA8nXdWpnKYXzg7LCVICR/2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(83380400001)(54906003)(478600001)(966005)(26005)(6506007)(6512007)(31696002)(53546011)(107886003)(36756003)(6486002)(86362001)(186003)(2906002)(2616005)(66476007)(4326008)(66556008)(5660300002)(316002)(66946007)(450100002)(8676002)(31686004)(8936002)(82960400001)(41300700001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2RUaVFROHhOblA4T1FCTkZYMWJpZm85N1FLTndYTE5LUHJwS2hWU3Y1d29a?=
 =?utf-8?B?eE5oS3dWZnEybHEyT1F3U2t3WUJSSTBnSGd1amlTWGdBSlVPNU1CTUxVeGlT?=
 =?utf-8?B?SlAyL2ZZclRVQUs3ZlJaSnhCMHlOaDRjN0M3NFZsUlFJWEJzV3luTHBQVmFL?=
 =?utf-8?B?WTB3WUk3Zk9zZlQ2b3FRSDZQVko3SExHNnF0TGhDa2l6dWhMeXFlUThlNG9q?=
 =?utf-8?B?U3RjNFE5Z1hOT0ppS3I2b3JzekxYZ1NMT09sUlBZWWZ5QXd6OURyZUFWSklt?=
 =?utf-8?B?dSs4UkxqRDdZNFZzcmw3WmI0eFlxTGJvbmZQd1pWM0xPMHkzZDlUT2pSZDIr?=
 =?utf-8?B?eFJNR0d1QWgwUnJFNkdVaDdyT1Rhcm5yWWVKc0s5MjM0M3luaUJlRWhaR09Y?=
 =?utf-8?B?a09sclNycXduT0U4aG1RUFAzcW1OdkpyWXk5ZkFudWZ3R3k1VXNzNWgzdWdx?=
 =?utf-8?B?Z3NUaHBpN0diS3hya2JlR2pKUUdWd0ZYaDA2TzZVZWhxM1JMRXNBVnYvcGh2?=
 =?utf-8?B?ZFNQamE3WXZSWVJqS1RoSTF2MHJVZGFJWGxVa244ZG1Bd2VGNk5LbTU5NWht?=
 =?utf-8?B?cG53eWd6RUg3aDJRS2U0TURYTzhIY1FtcUkremtLOEtrcVZrMkR0SjNFZ2lw?=
 =?utf-8?B?NTY1clV5WTd2UkJURDhMYkNIUWMrZTZNL1B3TFFBOHYwK05ORmxTYmJzMndl?=
 =?utf-8?B?OUdaVENMTERLd0dGMFdnNHpnblVGRFJsSFZqdnZoMVNUTnRqUUNXcUtDNXBh?=
 =?utf-8?B?OHZUT2tndXFlc0dqcVAyeVJSTWhuVUdCSU1nbVl6NVBCNTMvbDJYVHAxUjJ5?=
 =?utf-8?B?dysxOSsrcDFFbFJ6ck1JRmNXNlZRQ0M2NzJGeU9qV0Ezbng3aThYSFFWN1Nn?=
 =?utf-8?B?QjVqNlpqampYcTVJMVBDTHI0ZDZ1VDRwOGRiQ2t0ZzJWWXhnMGpvUWc0aHNW?=
 =?utf-8?B?UFIyNmNNMUthanNKdEpMMGh6OFArTVgzbzFCVG9tUW9FNk9nazlVaUd1UDZ5?=
 =?utf-8?B?NmVhSE4xNlJEdUloRFF3d0o1a1lJTVh6OTd0U2MyZk9UR1hZY2xReE0rSDV1?=
 =?utf-8?B?NG16SzRvZnk4c2J1bmozQlJiVFhvWW56azdaSjZQUnBzU01aZEcxYlZnemxH?=
 =?utf-8?B?RjFiOGVkendaVklwaGFDTjBHZzIvQXpzWWFHejBDQzdKTkEvSG9NSjhpWThk?=
 =?utf-8?B?ang0SFBYZHBnMDhJdXFUNytmckppWngrRDlsMkt6OWhoUExvbWZybldxYUVP?=
 =?utf-8?B?Tm9yaVFPcS9SK0hudk80NkJqaHlWbmRERVdaZGlKc1l3QlUrZ2p5Q29LOVRa?=
 =?utf-8?B?T2pZTC9vMEJjL3NJRWpYc0xtRkZDMk05MExyZ2lmUitJY01LWGMvSEtKd3BK?=
 =?utf-8?B?cmJhQ3kzcnNPT0NkMnBjVHpjTmh4V2lGYVFPTjlpU1RoaVB6TWZ1TnNPRmJx?=
 =?utf-8?B?cDNnbVhCT2ZSZHVxQ2tuV0lwL2VWL2RtekNrQzZqUUZGZHlCZk41QXJFTU8z?=
 =?utf-8?B?eXBTRG9qOC9NMmgvaGlYSERxOGR6NWpSMElwZmhyZVBwQlVUNU56L3NkUm13?=
 =?utf-8?B?MmszSll2R2I4TWk4clIvSnVHVmtUYjZlc2o2RXBtZnJQdTN2cDd2WnRpbDdk?=
 =?utf-8?B?RjIrUjYvNFhDK3FRTmJYdmZpaTN4RE1VbTU5YTl5aUdvYTBFVWtObVpyZnkr?=
 =?utf-8?B?c2dMWGVzU0d5QXBWMEc0bXdIa0VlbHc0OUZqVDhvWTFSeGtxRzBxclVWRk96?=
 =?utf-8?B?cjA0RHczcFpsNDJiVTh4OFJFQTF1UlhvaFBCeUFBbHkrbnNYOVJMZDdDVTFP?=
 =?utf-8?B?SURROE1SZ1lRbGl5QnBha1UrdWp4SDRhSjdVRVV4dCtTSjlWd1Ewd01MQ0cy?=
 =?utf-8?B?czJTRkJseG5IMlpUbEljNVpGUFdKL3hHTDNVT3pyY2hBVCsxcHlCTVJTRmRs?=
 =?utf-8?B?aHExWmdWOHM0eXZOVk9Sb2NmaGY5WGEydGFOYXg3d2E1ejNZaXAvWlQ2WXRk?=
 =?utf-8?B?WG04V1g1VSszVjVHVlBhTjdhT3NGVDg2L3hiWnpNWGdIU0Z6N01tL3Nqb1gx?=
 =?utf-8?B?NGF6cFFkR1J3NFkwMUExV0dkRkl6bkZBbGIxLy9EUlZWQ1MvdktzVzJ0MHFF?=
 =?utf-8?B?OVlySTZCSEZCUDlVRURuLzI0L3pzUWMrRmJNbjBrNUFKYkgra2FYQjU4R1B6?=
 =?utf-8?Q?yACYa49LijdjYBvqaa6gQeo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec20a1a-4f79-4854-a5b8-08db896bad95
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 21:52:57.5805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q3/Ke07C44MlsAS5YlX/GAe8+viMI2xkBfYzWbwgNY/cjSZDxcp+0rdz7yI4vBsSskdgUkgA/y/tGtTpIJdV11V6dkqBE1yZSWrmdpo7vsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6513
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/20/2023 2:40 PM, Alan Previn wrote:
> On MTL, if the GSC Proxy init flows haven't completed, submissions to the
> GSC engine will fail. Those init flows are dependent on the mei's
> gsc_proxy component that is loaded in parallel with i915 and a
> worker that could potentially start after i915 driver init is done.
>
> That said, all subsytems that access the GSC engine today does check
> for such init flow completion before using the GSC engine. However,
> selftests currently don't wait on anything before starting.
>
> To fix this, add a waiter function at the start of __run_selftests
> that waits for gsc-proxy init flows to complete. Selftests shouldn't
> care if the proxy-init failed as that should be flagged elsewhere.
>
> Difference from prior versions:
>     v6: - Add a helper that returns something more than a boolean
>           so we selftest can stop waiting if proxy-init hadn't
>           completed but failed (Daniele).
>     v5: - Move the call to __wait_gsc_proxy_completed from common
>           __run_selftests dispatcher to the group-level selftest
>           function (Trvtko).
>         - change the pr_info to pr_warn if we hit the timeout.
>     v4: - Remove generalized waiters function table framework (Tvrtko).
>         - Remove mention of CI-framework-timeout from comments (Tvrtko).
>     v3: - Rebase to latest drm-tip.
>     v2: - Based on internal testing, increase the timeout for gsc-proxy
>           specific case to 8 seconds.
>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 14 +++++++++
>   drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h     |  1 +
>   .../gpu/drm/i915/selftests/i915_selftest.c    | 31 +++++++++++++++++++
>   3 files changed, 46 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> index ab1a456f833d..163021705210 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
> @@ -45,6 +45,20 @@ bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool needs_wakere
>   	       HECI1_FWSTS1_PROXY_STATE_NORMAL;
>   }
>   
> +int intel_gsc_uc_fw_proxy_get_status(struct intel_gsc_uc *gsc)
> +{
> +	if (!(IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY)))
> +		return -ENODEV;
> +	if (!intel_uc_fw_is_loadable(&gsc->fw))
> +		return -ENODEV;
> +	if (__intel_uc_fw_status(&gsc->fw) == INTEL_UC_FIRMWARE_LOAD_FAIL)

You're missing the change to move the FW status to LOAD_FAIL if the 
proxy fails to initialize. Or are you expecting 
https://patchwork.freedesktop.org/series/118723/, which included that 
change, to be merged first?

Daniele

> +		return -ENOLINK;
> +	if (!intel_gsc_uc_fw_proxy_init_done(gsc, true))
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc)
>   {
>   	return gsc_uc_get_fw_status(gsc_uc_to_gt(gsc)->uncore, false) &
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> index ad2167ce9137..bc9dd0de8aaf 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
> @@ -16,5 +16,6 @@ int intel_gsc_fw_get_binary_info(struct intel_uc_fw *gsc_fw, const void *data, s
>   int intel_gsc_uc_fw_upload(struct intel_gsc_uc *gsc);
>   bool intel_gsc_uc_fw_init_done(struct intel_gsc_uc *gsc);
>   bool intel_gsc_uc_fw_proxy_init_done(struct intel_gsc_uc *gsc, bool needs_wakeref);
> +int intel_gsc_uc_fw_proxy_get_status(struct intel_gsc_uc *gsc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> index 39da0fb0d6d2..ee79e0809a6d 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> @@ -24,6 +24,8 @@
>   #include <linux/random.h>
>   
>   #include "gt/intel_gt_pm.h"
> +#include "gt/uc/intel_gsc_fw.h"
> +
>   #include "i915_driver.h"
>   #include "i915_drv.h"
>   #include "i915_selftest.h"
> @@ -127,6 +129,31 @@ static void set_default_test_all(struct selftest *st, unsigned int count)
>   		st[i].enabled = true;
>   }
>   
> +static bool
> +__gsc_proxy_init_progressing(struct intel_gsc_uc *gsc)
> +{
> +	return intel_gsc_uc_fw_proxy_get_status(gsc) == -EAGAIN;
> +}
> +
> +static void
> +__wait_gsc_proxy_completed(struct drm_i915_private *i915)
> +{
> +	bool need_to_wait = (IS_ENABLED(CONFIG_INTEL_MEI_GSC_PROXY) &&
> +			     i915->media_gt &&
> +			     HAS_ENGINE(i915->media_gt, GSC0) &&
> +			     intel_uc_fw_is_loadable(&i915->media_gt->uc.gsc.fw));
> +	/*
> +	 * The gsc proxy component depends on the kernel component driver load ordering
> +	 * and in corner cases (the first time after an IFWI flash), init-completion
> +	 * firmware flows take longer.
> +	 */
> +	unsigned long timeout_ms = 8000;
> +
> +	if (need_to_wait && wait_for(!__gsc_proxy_init_progressing(&i915->media_gt->uc.gsc),
> +				     timeout_ms))
> +		pr_warn(DRIVER_NAME "Timed out waiting for gsc_proxy_completion!\n");
> +}
> +
>   static int __run_selftests(const char *name,
>   			   struct selftest *st,
>   			   unsigned int count,
> @@ -206,6 +233,8 @@ int i915_live_selftests(struct pci_dev *pdev)
>   	if (!i915_selftest.live)
>   		return 0;
>   
> +	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
> +
>   	err = run_selftests(live, pdev_to_i915(pdev));
>   	if (err) {
>   		i915_selftest.live = err;
> @@ -227,6 +256,8 @@ int i915_perf_selftests(struct pci_dev *pdev)
>   	if (!i915_selftest.perf)
>   		return 0;
>   
> +	__wait_gsc_proxy_completed(pdev_to_i915(pdev));
> +
>   	err = run_selftests(perf, pdev_to_i915(pdev));
>   	if (err) {
>   		i915_selftest.perf = err;
>
> base-commit: cc69df372f21eb3073c062132ee9eb3649605931

