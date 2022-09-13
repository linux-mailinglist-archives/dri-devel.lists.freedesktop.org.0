Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382875B7B86
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 21:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C0110E305;
	Tue, 13 Sep 2022 19:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B9410E305;
 Tue, 13 Sep 2022 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663098137; x=1694634137;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Nel2LD0E002cDptKCYj28yyvLEY1PTSH2TtqykRDs+o=;
 b=DskNroGTfotyzWOCaQbyOrmzhKq0LpobkfCM2zB/P5g1q6V5F5ZgYJRl
 xJ87NoL88iKJQSpfhwJcz56my40QzJzEUWKheH3gmF/q2xCl9d5XGXsif
 sGw/o1xOsR4Emaw75uN3Qz2/aXYl84cU8g6ss2vI+IBWOiNC7bjjke/Wt
 bQvdapgagUQK/qMF+C+Vt7Fqa+ZiauA9Yrbi6gPN9eoXL9TvfRa0imudX
 tEbeFS6/o082MoQofegJ1opmRdd4p/1eEAqBdpo+V1gGj38FCltGAPVi1
 PUk6msimN45gFmr4uvaD/iOAwD1yYXfHs8Kc7jR+Mwss4IN3kUnKM1w4j g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="285260268"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="285260268"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 12:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="594080699"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 13 Sep 2022 12:42:16 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 12:42:15 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 13 Sep 2022 12:42:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 13 Sep 2022 12:42:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AW4Dc8MDtkrwI9rieNDa4VDTCkCL5d7ygdZwuKpbtoYRzmtOOQpZxw+3Jewov5SZafX+T9jdKh5D40379Ty7vvVHG+JLwwGjwl4kc/zUweE2k9Ns0ClWzfHZIN7cbmknJ93JJ5bU4sR/yo0PaTwxXLx+tKIgREzY9gGl/KOFv8DI4V60OXt04yizCBuie/3dw4ZFm8npwCp72B83nptsuspGFzBqbvZijGMnYi8HxSQXg8IMNMJ1CE5Np2EJ3Qe9OUyWcCyUiAELOk+CkVo1K3L6/kZ5wiMAZKvLeJpSRdrvlrYOTQVLP26wLXLvshm6pDwc0z1qzCFh8Gz1RCukoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4Vhdhw7zOevlwNCbsrfijeC8U9dCxHKdrFmPvdLbwo=;
 b=DouR2gsCbj/e9/kaLZFsqxGzK/3cbGq3Dq34SulCXg/eZlamRZXm0gNRI9T9arYbFuFcWNTieLYB/9qM221+CuL8cFN30vIWjnwr9XSGbiGAGxCzqrEFbmX7uNg/BAlZl59N18anRhxfSZV/dWMLhUYpM5Jg8n1AXrbBqHG5vNPT6x4qfMxSymPjG7t+09xRAmxf7dPHTb/1iVnaYS0R8YNhpiVZnmRcPSoJwoPiLR27TcQ8tRKS/5sCb89+BLN3xXiFW9XXQbOQdBiuACOSybmMcvyVbCoakymV/37s+Sgp61nz/Vr6Ezh+Pk9zxNlNyLH6uTeEr8lLIBzTTndxew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by MW3PR11MB4731.namprd11.prod.outlook.com (2603:10b6:303:2f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Tue, 13 Sep
 2022 19:42:14 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5612.022; Tue, 13 Sep
 2022 19:42:14 +0000
Date: Tue, 13 Sep 2022 12:42:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v5 2/5] drm/i915: Parse and set stepping for platforms
 with GMD
Message-ID: <YyDdE8qXYhrbjdDq@mdroper-desk1.amr.corp.intel.com>
References: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
 <20220913183341.908028-3-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220913183341.908028-3-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|MW3PR11MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: c125b618-c8eb-4e66-06c0-08da95c00ed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Mws8XGzbfB6gFKtgIZfCWshMCobRLPM1522Dm9X2lRSypJsAoZ5en8KSTJQ5Li/YbUv4S8q6NAj0UyZtDCRS8kOqSaz02cyEQRY4/XL9dHLw2ev0Wl+bh6Ekoy7lcfGP5+oYGoSk9qkG+c0mBGUJ89Dt1iYhmuhcychMUAjrPom1eu8wRBsSKaX7pV/FxyQ/hAsNjXcf4GFk9Sfds58EtD+FjVBddaO/fiHBG3CJDGfh1Lg9lmQ+UVUo0+KTYf/PQjDlVeHffbNmoy5e9/Uipm1gFqv8IV6A0LwXZHLApfrF/OgJLqHwOb6PZVwhsbU6pPxrkBrx9rA3nyuT3fqzjPPGPfbJKzhqV0tvAgitKoTvI4ph0sVaolmopFB7bn8Jr0P59b/KGjkmaIH8cd5y4WtZb/xxVWhThErVDkgPqAZoZ9b6j1XYiljcttpzs6k1LHVyRd7/StdncBGHO3Y7ecwBgQr7pX8TRJfpVhmeyMVNs0eodpVv6zvNt15wF5AH6L2VNeDSLjnkvta4u/uScqN+tA7mB97o6kScTCZ3at+QnZ5KO1VbX3ZOrKA0zgKen0wpuKDIq3n+hGWoG1rgyE7EyaIPP22XvlH3ywgBN4qh7JmDDlB4+f/WA0RStpUtX4qYypZejtyaIJZuP5+668Dkva7xY+M1CL2nJecJIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(396003)(39860400002)(366004)(451199015)(6512007)(41300700001)(6486002)(4326008)(66946007)(66476007)(450100002)(26005)(8936002)(6666004)(478600001)(966005)(316002)(66556008)(86362001)(8676002)(6506007)(6636002)(6862004)(186003)(2906002)(82960400001)(5660300002)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eYnPfGhXFEEPGnZFvzv1ffHlbZu1aNEGKYGBycg/bp5ZvxE+4YKwM2nyMA?=
 =?iso-8859-1?Q?h/58PR7OEuX+zIyCvOboth1VyERkZ/GVGLz8nNc2a9oQT/ca+zAAopNss6?=
 =?iso-8859-1?Q?lfDNCA4anQcprLhoTH86FcsAZkQ0AhAQcdJv3ayiUROCUaM+DyN4q7Wuxb?=
 =?iso-8859-1?Q?y8mg+D0ovEr8KHMg0GVvBEZmkTi0rDmpTaY19GZhDCSQYlEyqLsDX8rCaA?=
 =?iso-8859-1?Q?aygn+wD4eX11r0VYIJU/S6SjqF1/4qEoIymOF4i6K3JL8Mo4gz2eWBbI1a?=
 =?iso-8859-1?Q?IT05k3oALeLRzlOimbtQ/YLdMmfitPAXlHlF3FW1MIqRSfyoCkE6lf0M31?=
 =?iso-8859-1?Q?uaoj+6pVHjVKW1OhjrLKmwyZp9X4qYIOgxB/ph6XeBJHSO74vKsxhEgQNz?=
 =?iso-8859-1?Q?GHOgFH1H4Dx9sg+H2J7p9sJE30NF4LZPYnhcnhOAxxwn3VOZ1qm+OONFHv?=
 =?iso-8859-1?Q?uh38P31t9p8TYKk7ULOu60Bw9YmUaMn3g6YXFO8IvP07dqCc0VlACfJt7K?=
 =?iso-8859-1?Q?y9R5QnSzL8vRIB2evuW4HQSfQkZOHbZIDzKOApcailfmDdEBnwT04VA30I?=
 =?iso-8859-1?Q?wkessEPCUhZ+8wbOWKdb/6rQZg0RLID30HnpgJIPWa5VXX+qJG6U6YJunP?=
 =?iso-8859-1?Q?0+jRfsa07D+U3KJsjkhagADSzYiH92+NYQm3vRfk56fS21pdjANgeTExpT?=
 =?iso-8859-1?Q?o2KKSeTSqLaVnYAoqEOCHZdRhKSeNV7skiEuDa44TDj0ydFPLlu+Z4xqqq?=
 =?iso-8859-1?Q?vVvxKpB/A5AefRecIEPce09wEtfiJeg9SpFesA83vSy+jz5BqGVZZ7nZwV?=
 =?iso-8859-1?Q?1Z4D+lrNMUH6nCP6/zEDA5QYKJ6hxvHENtbX7iilRMlZmFMWYTHLQgWLZQ?=
 =?iso-8859-1?Q?/WVhqzMY5PiLEZvQYuKiGV0a7E7VOeylQ0YXRkFQmnelWcrfLcHUCvzaSl?=
 =?iso-8859-1?Q?6DmTQSG5uOjbYp7xPLevXBdeKIvDkjWS4kkC9DE9TrY9F4+vn+Omvc+Ys/?=
 =?iso-8859-1?Q?bup0O+vc8M0Jy1FQh4tkQkI9gNT1/8YgoyTyE7502rnQDHHqDD2XBJxR37?=
 =?iso-8859-1?Q?c0fBoHt0mVybxoVAdt3iTtaaqXamQKjBVec8Yj5R43JPggBLt5qUf0TTM1?=
 =?iso-8859-1?Q?aGrMwyGYVR4dDjdvHnMSOhqCygmqNJMWyrM4M6KxFsJE5IiNOlKyY7ehPR?=
 =?iso-8859-1?Q?g/96kpvOLzgEY1wCkyp4nni/b2w4FnCBkAljiPYA2eUOX3P7OHdQLbe1co?=
 =?iso-8859-1?Q?1Pkj6agpsjpIJubKD686TUF+yWyHj8O8MDA/LQUA/mcX6sN+sr3+xLp0tj?=
 =?iso-8859-1?Q?KLvW46G1BK4XCg0snUi5hHZdHi+jnq5PSqPLFGzljqEeN9mEN4R2mLlwHk?=
 =?iso-8859-1?Q?jiFqMPEcRAJcu+pla+8hu5mtTCyzxoqE26d+V49GCTBjC3tKtzktQybg01?=
 =?iso-8859-1?Q?VhWPwRS9b2FNNBvs0qEmCZCLIHp0wqLhTbE4OFhawaT/L/SIozql5RqbI/?=
 =?iso-8859-1?Q?1SjGI+B3oGPhmDxHCAdJfd62A/YCPv9Y/fOtQRKgps3541gif6o8G7200U?=
 =?iso-8859-1?Q?RkL0uAwehTRsaWiz9NTd+BNrx9XNNuu3GRLilUmC0vfmOz9ACjUXN//myW?=
 =?iso-8859-1?Q?m0XJ9pEI1sXlGXILoJwVetPnV5cMKO/R+qw/nmHQ7nAV6s4CnnoK6Y+w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c125b618-c8eb-4e66-06c0-08da95c00ed0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 19:42:14.2370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSaX/nSEb/A0uZ+Ej0E+pDExp11C2/QmdZJVtTUTJH7/yfV4NC2Y1wMervcqtqx8iQzNVjuXRyyuqvXWx0j5BQSk5hcMsC6plzY1X3R1BYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4731
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 13, 2022 at 11:33:38AM -0700, Radhakrishna Sripada wrote:
> From: José Roberto de Souza <jose.souza@intel.com>
> 
> The GMD step field do not properly match the current stepping convention
> that we use(STEP_A0, STEP_A1, STEP_B0...).
> 
> One platform could have { arch = 12, rel = 70, step = 1 } and the
> actual stepping is STEP_B0 but without the translation of the step
> field would mean STEP_A1.
> That is why we will need to have gmd_to_intel_step tables for each IP.

I think you might have missed my feedback on v4:

        https://patchwork.freedesktop.org/patch/500850/?series=106786&rev=8#comment_904487

Can we just handle this in a standard way, at least until we come across
a future platform that breaks from the current standard and needs a
special exception?


Matt

> 
> v2:
>  - Pass the updated ip version structure
> 
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_step.c | 60 +++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
> index 42b3133d8387..bc966478f0f8 100644
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
> +						       &RUNTIME_INFO(i915)->graphics.ip,
> +						       gmd_graphics_table,
> +						       ARRAY_SIZE(gmd_graphics_table));
> +		step.media_step = gmd_to_intel_step(i915,
> +						    &RUNTIME_INFO(i915)->media.ip,
> +						    gmd_media_table,
> +						    ARRAY_SIZE(gmd_media_table));
> +		step.display_step = gmd_to_intel_step(i915,
> +						      &RUNTIME_INFO(i915)->display.ip,
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
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
