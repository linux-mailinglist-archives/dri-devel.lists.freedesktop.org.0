Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064CD5A02ED
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 22:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A2D3C84B0;
	Wed, 24 Aug 2022 20:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A906010E176;
 Wed, 24 Aug 2022 08:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661328719; x=1692864719;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HpYuy370zfxnnFOqjptSs/ICRW0HK/tiM2BMC6LcB3Y=;
 b=MoGIoUeUt0gbIgPPA/JMed/UzY8JDhwMedNOnHkuxn2LtfWzyymOuNGm
 CVJ9qEjugBaApj1Ox6SBB1IY9jpHWk7jj/xeC/OiGaIAWQ2d/jpXoyZh8
 BS7Vg2Nz/HTosnBH+2EjQ02kCIaGdASQcp5REpL8hecilWOTzR7W5gWuB
 gL7wX04WohQ5llrcjJSejUG2cKguKiyHGddT7Th9VwCfjWbcpeP205eAD
 s1ffLLQYvLC1s5cxtZ2oGIFpTACRaq6q0M/W9gKB1d2R6844mOL9SWw5a
 9aiBWHa0wpvQbZaofmZG+1av2VG4Ss3LOJA0C5tU0leRuZnUNzzyKqwpL A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="355629256"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="355629256"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 01:11:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="751994896"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2022 01:11:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 24 Aug 2022 01:11:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 24 Aug 2022 01:11:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 24 Aug 2022 01:11:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 24 Aug 2022 01:11:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KTPz0YcpIVVLbnxlsH8f1d8TBPtBgKVnpGSLCJ6v/3nglZDnsxszWr26rGPQsOVhRc3gk7zhMf8AUoaFxGPwrs7Us4ftBaNoOz4AFdMO5xgDjhwT5O8nu5c48R1fnQWKR3W3L6B+7eCZl8mViiU4MchV0xG2F4gQk9V1tNgQ1FanEmR9X5SFVxC4G+qv0His6vyA70L1RmvAbK7OxuF9wH29rPUmhWdj7R+gQiR3yshHJgngrk79Y1wDXKjb7va2xgiSay3DM77jExuXQhfCd4yeJR50Pbzg2QWYCGCFpM0KRPPgHzhV4WHMgyGuRAgV3YBVxuLfWxthOBOAverG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipOCl6YEzAkIdYrBHiI1vc1qxv2uQELxi+vtTLorDWo=;
 b=J4/23CUxg2znMeXQkMUp3W0j97YamdGRcX1zSbbibPq4I82RCZfvBdasi9K39M8btPB2+qc1nMCpT8qhe2q0Gzi+UszN5srH50TkPZfJt5GWNOMWmkOVCpikgZGwJzHfAS02fGlBPTdNF3TCKASJv9E84dLZOMjDLrYbBTSCCKA7ma7H/4wsW7Ce8pHPCdpTmSx4jnQfJCOfjJvdCll3C5ktWF/0/M+L7BtsHdJpg10PHA19KMyMnGnEwwyDr1Qdp3H53Xw99Vgs2ge/aP0MUd6oT0Wky8VgHOcInQXRgG5n7mj5gM/EnjB2ca9ThrRaDBDHluef3KUk9rYwGrt2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.18; Wed, 24 Aug 2022 08:11:55 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::46f:6936:6441:5a7a]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::46f:6936:6441:5a7a%8]) with mapi id 15.20.5546.023; Wed, 24 Aug 2022
 08:11:55 +0000
Date: Wed, 24 Aug 2022 13:41:44 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2 02/21] drm/i915: Parse and set stepping
 for platforms with GMD
Message-ID: <YwXdQCeQxgqzLQcO@bala-ubuntu>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-3-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220818234202.451742-3-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: PN2PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::19) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1157ad0b-0273-4d42-7731-08da85a84eaa
X-MS-TrafficTypeDiagnostic: DM6PR11MB4689:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h4IBuDlIqZmaqIlvtVaUqqBhXb4Zs/egyXk4tE4nBE/CrhZ2nd1YFi+aSo5zdz0cepK1FkOjBx5wWNCevW13/syifLhy6FYzE6PFExy8V+vOnrsdfoxH4y52PXMiuFOyTCdMtppiBviHlDkGqVRFYiOssZD0hcO4URGkwbZX9iQFOa+caTEHMDedfW9Vq2OWVeRj34a0/m+lGWwTmfZSH3G/yG552a7BhrXNmnZwMhEC7yLO/F4e39890iMmLQmaPtnkyhzz+5tADktQWGgYyFcEph51c0Q21gzw2aDXO7mlyvEFtB2SRXuA8Q3p7vDGJ4hWwpNACUoZOeS/Gqw3WazZpaCcBWUuM78oYtlhr9MUYeDP0DsHRrjIXHug9bvKvYkH5POK6HymQCpm8lDbgWlP7W6cZX7b+8wRKtDu2mlLjV3P2U3hcO+tgOXapBkO8ZTMmZHP7dLsc9FJr6KbmsJFy2mmpfcksLP4lDqHd3wZiuxG/5bm8aQphEElzXBWC133jPCO4cMkEG0jEAzoNDrN31iNBH/aEEo1LE0h8JaUzVau7hOOigLNjaG67oEQOFZ5MoQ7apeUfslvXHE7Y18pe3AY+5kcBLSE7AA9uL0gV1uysyLxNbu4ITPxAmRgtcSDwV08kz1ehd1DHFu/hRU3wvAhGkhBiKnsEjNqYQKN+bO2f/T86l4eAeiB7y/6nhC28wg5kNKVqPOnjKNNHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(376002)(346002)(136003)(39860400002)(396003)(8936002)(41300700001)(44832011)(8676002)(5660300002)(450100002)(4326008)(6486002)(316002)(6666004)(66476007)(478600001)(66556008)(66946007)(53546011)(82960400001)(6512007)(9686003)(186003)(26005)(6506007)(86362001)(2906002)(33716001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXJjQlUxTldpeTV3MUU1L1lzbnBHUU00eEpSNVRrZU5kKy92QkZkdUlVcEQw?=
 =?utf-8?B?RDZZQmZ0a1JPUUZ5MlJIYVRUZFo2Y05RTVVSSmtieFBkMzJCRFlDQ016VGNF?=
 =?utf-8?B?WEt3bGtsRUtTUFVxdnduZXVMYkdDM2JYRzRCVktKb3Z4UHI0NnpRcnJDQnB3?=
 =?utf-8?B?Yjdtd05VVER4RFlEZEpWOGQwUlF0dzJ6TUlFd3NMY3ZFMmlwNGViWWNUbmJw?=
 =?utf-8?B?WVJ5M0NvcWhDMUNIOXVydWlNcVc0T3VuSGRzWlhmelJSTDMzU0plby9CbEF4?=
 =?utf-8?B?b0NIdnZ4S2tCRW9md1kyQlV3UTVrSm5xWkRqMXgyNHR2alA1WnZ2dTRyZ2Vu?=
 =?utf-8?B?bXlBWWFIZ1JNaXpHa1FGWWhYRVl5S1FDVlh6Rko2NEsvSUNkMHAyUjliWkhN?=
 =?utf-8?B?ZDhPamJpb0JnbEVRZHQ3YmR6OVZVWElZeFZrdVNuME1CeGJVeERDYUhCYS9O?=
 =?utf-8?B?OVdqcTV3Z3Zvc1FwYlppemdVUFkzemU0cVU4djA0ZEtVakQwYTc1R2gwRmF6?=
 =?utf-8?B?T25kWVBLUWZxbFpSaWJHT0d0UTMrZFRkV2pINm9IZjFFclZZeGgvZTRRVWVT?=
 =?utf-8?B?am1mWGp0ZWI2aEw1T0JHeURxeHJjM2FZbXZ1NlA0NmllNEkzWHBvUmpOR3ox?=
 =?utf-8?B?RTQxVTRtUG1CNHpHM2dyeHpVQjR0b3NxOWdFem9VaktjMTBWQ1MrZ3YvOS9F?=
 =?utf-8?B?NUo2M1VXeUZsOUFCWGhJMVVXakRxWHh4ckM2RjdCUGh6TEVpUHNKbXZWWEc5?=
 =?utf-8?B?OE9DWlgzMk90cnhab1NyZUM0bW5zckh5Q1dCOW1taWNIWmFQNU1ueCtvVWR2?=
 =?utf-8?B?czM1WS91bG1TRjdLUm5FYmFyMmlENFd1eFEyRVFNVU1mdWxZc1k3c25NTWIx?=
 =?utf-8?B?QjM2ODdPRk5DaHMrM2RPZko4aXdJTDZ0amcwRFk0c3AwMFZRQlMyTDk2N0x1?=
 =?utf-8?B?TnNNeXN3eTEzdzF6dFlCU0hwMmtuMHJnem8zMlNVL0YrUC9VQ1NFVmlnTnlM?=
 =?utf-8?B?cEs1b2labUtCS2txVDZieTU2SUpqMURRT01pMjRtL0N5czJWQ2diN1hDeFZm?=
 =?utf-8?B?UGNoa3krMWlaaG5PeHdRT1pRSy9yZWdyaThyTGtrMnc5RUJnWDdNSVdmTmp0?=
 =?utf-8?B?U2VkNjIrTzY4YjlZaHJsemVGWVoyWVJIZVZOQlNUSGZxRWk3TDkyT3BpdVJa?=
 =?utf-8?B?SXNuR05IQStkZjJJQ2kwT0JGRGR5SGVkejh6WmYwckh0bnNYcUNFUlIxUCtL?=
 =?utf-8?B?L2VsVUJTTkZGL1dMditPc09nemN3ay9BdGtRZjFsSjhvZVpnQXFHOTFoMUVL?=
 =?utf-8?B?ZWdhaytkbit2ZFFVb09MaEtrakw3RS9SenU5MEJKOGVSRmhQbHhxU3VmSFBW?=
 =?utf-8?B?YS9BcnBwY0QwRHV2d2NpY1NaeGNKb29CM2tHcW1pVFR0bGtGaHVEM3Q4TnBz?=
 =?utf-8?B?bUs0K1NwSzU5Z3NsaGtqRTErV1BobHR1VzhIejlrSlJuMGFXQ09ReFVjZU4v?=
 =?utf-8?B?Y0l5STFyMnBOUjk5MDc4QTdFNlFoOHhibmxwY0thRlJTYmxwZ2VZNFlraXdB?=
 =?utf-8?B?bXpYajJwK0FPdFNJQk9sSThMcWhmQjdCT2NxZVNJT1BaelRVZ05RdG9OSzBB?=
 =?utf-8?B?emhIU1I2VjlpOUduWHJLdzVMbWVuOWNTMUowN1BGY1MySEVydUxBMzQyNW9L?=
 =?utf-8?B?b3VwZkZCY3dmNWpEbzZEVnZVN2EyS0ZONEo3TDFnK0JqeHkzMVk1V29DWFV2?=
 =?utf-8?B?Zzk5ZjV4TENxK3JpcDcxSmppa0dGU0sxdlEzengzbFlsc0JoeFNwQXl5RFlL?=
 =?utf-8?B?RHgxVzJobXp1Qm9XUHJaeWkvSTY5aXBxaGhNS0xyQUFBcVplZFcwZHVPVm1z?=
 =?utf-8?B?N2hzend5Nzc0NHNBSU96bUpVbHA1Mkl6SXM0R1MvNTRuRWhoNy90dUMzOUZ5?=
 =?utf-8?B?T2luVzY5TTQ5WGhkcUxqUmxHYnYzL01xeUJkbnNuZHhiUDM5aVkvNHJNcm9i?=
 =?utf-8?B?bFZwSllmRzN2YnozSGNtaTRkZmM2OTZxVEZSMEpMVnZRcTE0RmpzNkd5cHg3?=
 =?utf-8?B?MmJBbHBTbUJDU09hODZRYUR0R053Nks1RVJYSUpmeEtFRS90d1NNWnVCdTR1?=
 =?utf-8?B?WW56L1pmbkU2RS8vNlNmSU56ZDZkVEhSSnVCNjhHMHFacUxKekxvbHZpZWZO?=
 =?utf-8?Q?yd8G0A7hifSCGrXO/LdRLGo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1157ad0b-0273-4d42-7731-08da85a84eaa
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 08:11:55.1046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPy4OeLI0Gkk4Qgc2C1Z3QF4NAmzsMCWC4us5wXqMp8yhD/hqiZrt5LwiMD78QAhQU9KcNLEPKNpVrf5aUh+T5oYoBk3EAiVDt9VDG1zxcodWt21Ydf5cF1MXsdArl71
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.08.2022 16:41, Radhakrishna Sripada wrote:
> From: José Roberto de Souza <jose.souza@intel.com>
> 
> The GMD step field do not properly match the current stepping convention
> that we use(STEP_A0, STEP_A1, STEP_B0...).
> 
> One platform could have { arch = 12, rel = 70, step = 1 } and the
> actual stepping is STEP_B0 but without the translation of the step
> field would mean STEP_A1.
> That is why we will need to have gmd_to_intel_step tables for each IP.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_step.c | 60 +++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
> index 42b3133d8387..0fa7147c7d0f 100644
> --- a/drivers/gpu/drm/i915/intel_step.c
> +++ b/drivers/gpu/drm/i915/intel_step.c
> @@ -135,6 +135,48 @@ static const struct intel_step_info adlp_n_revids[] = {
>  	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display_step = STEP_D0 },
>  };
>  
> +struct gmd_to_intel_step {
> +	struct ip_version gmd;
> +	enum intel_step step;
> +};
> +
> +static const struct gmd_to_intel_step gmd_graphics_table[] = {
> +	{ .gmd.ver = 12, .gmd.rel = 70, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 12, .gmd.rel = 70, .gmd.step = 4, .step = STEP_B0 },
> +	{ .gmd.ver = 12, .gmd.rel = 71, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 12, .gmd.rel = 71, .gmd.step = 4, .step = STEP_B0 },
> +	{ .gmd.ver = 12, .gmd.rel = 73, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 12, .gmd.rel = 73, .gmd.step = 4, .step = STEP_B0 },
> +};
> +
> +static const struct gmd_to_intel_step gmd_media_table[] = {
> +	{ .gmd.ver = 13, .gmd.rel = 70, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 13, .gmd.rel = 70, .gmd.step = 4, .step = STEP_B0 },
> +};
> +
> +static const struct gmd_to_intel_step gmd_display_table[] = {
> +	{ .gmd.ver = 14, .gmd.rel = 0, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 14, .gmd.rel = 0, .gmd.step = 4, .step = STEP_B0 },
> +};
> +
> +static u8 gmd_to_intel_step(struct drm_i915_private *i915,
> +			    struct ip_version *gmd,
> +			    const struct gmd_to_intel_step *table,
> +			    int len)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++) {
> +		if (table[i].gmd.ver == gmd->ver &&
> +		    table[i].gmd.rel == gmd->rel &&
> +		    table[i].gmd.step == gmd->step)
> +			return table[i].step;
> +	}
> +
> +	drm_dbg(&i915->drm, "Using future steppings\n");
> +	return STEP_FUTURE;
> +}
> +
>  static void pvc_step_init(struct drm_i915_private *i915, int pci_revid);
>  
>  void intel_step_init(struct drm_i915_private *i915)
> @@ -144,6 +186,24 @@ void intel_step_init(struct drm_i915_private *i915)
>  	int revid = INTEL_REVID(i915);
>  	struct intel_step_info step = {};
>  
> +	if (HAS_GMD_ID(i915)) {
> +		step.graphics_step = gmd_to_intel_step(i915,
> +						       &RUNTIME_INFO(i915)->graphics,
> +						       gmd_graphics_table,
> +						       ARRAY_SIZE(gmd_graphics_table));
> +		step.media_step = gmd_to_intel_step(i915,
> +						    &RUNTIME_INFO(i915)->media,
> +						    gmd_media_table,
> +						    ARRAY_SIZE(gmd_media_table));
> +		step.display_step = gmd_to_intel_step(i915,
> +						      &RUNTIME_INFO(i915)->display,
> +						      gmd_display_table,
> +						      ARRAY_SIZE(gmd_display_table));
> +		RUNTIME_INFO(i915)->step = step;
> +
> +		return;
> +	}
> +
>  	if (IS_PONTEVECCHIO(i915)) {
>  		pvc_step_init(i915, revid);
>  		return;
> -- 
> 2.25.1
> 
