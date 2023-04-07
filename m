Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BC06DA6A3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 02:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8CB88697;
	Fri,  7 Apr 2023 00:38:16 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1BA10E108;
 Fri,  7 Apr 2023 00:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680827894; x=1712363894;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fwMWIq+z8eLIRMWoOUFylcwTmqQNK9dm25l9RZJ7xwQ=;
 b=niz7y+iZf1sWdsLlqVyF9fFlK6d6LemyyoS1XUNDTy+grClG5v6Ze1KS
 1tqvoVFfpEbjNz1mUacn/0nW7XhXX6XB2jRbwKTi+67wd1+QU6PXhu9ml
 qTOtXg6yyydcvgmPfGl7+ieO6f/bUHQ/wms5G4W7DcuRYvYBNa1HxQkZ8
 nNjh9fvyXILWERGmRCrlybqsyiaHcXeLSsb3JPwdvHvxTIz6BB5yLLlJx
 dkWJZyfRI2o6YfMQp2S6Fm07wCBy3ymK4yRtHS4D4j4D4K1x+wsK9ODXc
 BxUCl4SzYQJUvJKM0JWDEY7Y97Ooy4POUChTkHszrCsxWI/PtUc5Uxh/g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="342884743"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="342884743"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 17:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="717641313"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; d="scan'208";a="717641313"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP; 06 Apr 2023 17:38:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 6 Apr 2023 17:38:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 6 Apr 2023 17:38:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 6 Apr 2023 17:38:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzxSgjZTDLrqpI0H82E/IN/vgt1NP1CqBQYOQqaCnVCZ+tfrA7lFkXr0ytSHElghIVUWADX2hQSBBNtElUZ4rJ63Gh95Ow30ZMMiDDFT05vvJ38/EsslW8lu8vp/Ntzo4kmofx+obKzHKjv2DQL3whInYfOeKRd+ViEXdZ18a3KySR4cN9udmTcXlc89Ejfgj+szQqW9KMW5bk0wOxBLH2wCTfBja/cT9/JLgoFRqXwSivWUx+2fdSow7w8kSUUJzkKB0sb+dFiGSV9r8COwjRbizElQiWOSaMwxk8Tj0FrxIcjuiP23B2C67cXj1nNIs5typbakPUHA3yyM+UYtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+uWnoBeUuY0t9rVyTRaIjb2yEPyvR4ITIypvpwxdkk=;
 b=RzHviKLHU4xkleruwtzm5vcrkKPlOyLJcGLLtbR3GTbAaAfHjaHLHvfntyLguAL+9HsZiUDVCq/qOhKl8E5oHOL9DzudbFS2aG/84yO1g08cKg0yLT+BLIR1G3gvpsj6jy9a0BaayI6PXCtX8GE3caKyj6BIyGkRnTXYFu5kZvYmNmtywUrD/r1Yn029asbRxBb1Uy4xDQWcQmxBN5YwxhVL4UtHzgdECqwKHjIR8fByxp2/oAMXvwfypqiMSFmjZCj5TF7BITG24vOx2fLpU2DypoasLaj0os6btMdX/4An2sPWZXH2ccZdfiaHiV9lhgWje97vdjPzRvYB9n7+iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.31; Fri, 7 Apr
 2023 00:38:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.030; Fri, 7 Apr 2023
 00:38:01 +0000
Date: Thu, 6 Apr 2023 17:37:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [CI] drm/i915/mtl: Define GuC firmware version for MTL
Message-ID: <20230407003758.lbpvzisom3rw5erx@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230331225216.4188274-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230331225216.4188274-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ab366a-0166-45ac-464e-08db3700573d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7I5vr/0JVCQI0fjnE1iSGHFTPoqyTwsQOPxDHOROXWa1dh6rvCf81+X8p5fdzBqNMLtcSEFpoofik9uv5FaX0eqf6O6Dji2ezV3sDc0iiykwwUclikR/M+uItFUT2pbYwAOre80PQoxuv4xDphTudG16y9jfQ7dxRhcBAA0DPBI257KHXMZhDlz1wR1aYH8Wo0NJwX1XWBjZZW/TSwLf7QR21r+tlsPC8nqMcZuv2u08GRGVM7MGbw21yt6jpsue6LrQSq5OHNoIGYJq4IfOmtWNBQjkwJgOYwjdX7JtWeUbZFMkzp8LKtQZ+hUzvR3qfGRE+BGA5CxAS7P/qHX7Bmg2ZJq1UdLg/+iVimVv+LLkhHJUGutWpaCPXLjTGycleVgHwhhvxALn8qu3JpF3gHKoIY4aTeZwD2t/XZTa00/bITOsj9A0HlGJnbjSEqWVE1OkPe1/7kQeGV0tq8/Yw0ocTIUh1s1fkxDeE+RXU6usX9UpypaMz0Tz37GnHdMIHi9e++0eKixCv+C+ms4Y8EDqTD7lyTfadtylc+1DcH5SjlWcloZwwyqZanxjQn/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(966005)(66946007)(6486002)(66556008)(4326008)(66476007)(8676002)(54906003)(6636002)(478600001)(41300700001)(316002)(36756003)(86362001)(6512007)(26005)(1076003)(9686003)(6506007)(6666004)(83380400001)(2906002)(34206002)(8936002)(5660300002)(38100700002)(186003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EJU5YUT7ajfZCw69myo+5/VZBOwEkRuHe+3RO1xLOoh6jcwv48YcJCFJ+lh/?=
 =?us-ascii?Q?VrDybTdx7hXGnDIfzQDsT1S/6ysnTOiYbpLjmyixSehp7JRRCHhNf1bHOosx?=
 =?us-ascii?Q?rtTfrYr1QvuCyozSr5weN6sLIqk3qdqJsO/b/UfTf7vC9zqVSoWy1lshhQyC?=
 =?us-ascii?Q?Psw5Ft3q19+OKJTvFvPIObvds1fk05ehunlhzFPv4e5Vn3RB8kMAClEIOYIe?=
 =?us-ascii?Q?5Yz8fumnZ576N8T6bQIyMqdvZPh5DouosKEv4EaGeLq+svx3xRzpr5R0KVcV?=
 =?us-ascii?Q?qVMW+UD8HDPE2Mc+uOznHIRPLvzfc8UCPFCM2vb+VNMnyEk73snnMD8MOO69?=
 =?us-ascii?Q?X/rhFieEeq44sLvy2bUu98T8pSjY+mi9RVCcO1qr9ECTtwMAEfwGcISDGyJ6?=
 =?us-ascii?Q?8bpOTeeiU7AtGfhR4LFMl4kCpmUYuzSw2u96E9PDr1MYqt5011Bnc3IYQjsL?=
 =?us-ascii?Q?CL37WMrOcISKNc/+FrI+aiWsW34LCzqm3iapGxNnSB19GvDm4o4cr/YzgDlM?=
 =?us-ascii?Q?O4S7Fr9/FJjBpzVW9BqtuJsxUw4r34nLaBeuybHfdLMjZMYIShm74jD7q9cn?=
 =?us-ascii?Q?1FTxgepGrt78ktYGAO0JFt/eXKrVH7E2RsMGGhVCs0w/Q804urp5PUkGBU72?=
 =?us-ascii?Q?u1P+BLT3UztlGL9gtusw2VPJoqKMVp4csTav65LhG5Qhz9u+7/mrYpJg0zz+?=
 =?us-ascii?Q?+2ePSGT88rDufpBarC9M+0rz8ekW2gvXL37XrtFQBHANxr/ACSjixByNTys1?=
 =?us-ascii?Q?h59vU6lIW70rL/pV8GQrzJBZ2JSvkQYtdR2z1deCdlXb1u5nlAp2y89kI33g?=
 =?us-ascii?Q?F2QIyeJMjlRcOxOF6p9Z0vh9aI5MKxTurczVqq1Ze9+6vnA8C6C17K3litCu?=
 =?us-ascii?Q?EQ/k/cOlRegVVhlB5zlqMQksz65mm3TBt9YjrxD+MfSMRJbOdSbIqFBNRovJ?=
 =?us-ascii?Q?CRfzJ6kp7HIfOA6hh8efLVaaa4jXvR7DGtDwxNudeyfQngIhNHmwJF9xXDoY?=
 =?us-ascii?Q?088fQyd3o0niMIoLzY/+JgAQQukRotyoXtcV3yK40UqSvU47259x3VETSC8E?=
 =?us-ascii?Q?3RakcAS6d3PMkZVPPmTJ36bWZzSy5lly3vcsy82eERUwnz5b8k5jHG/Y7Zb1?=
 =?us-ascii?Q?ZadQjDCIuduarPgCDVTNmM1pkU9OCvKE9Y5fX/ZQ3wCPpWGEO3VsU48U/eJC?=
 =?us-ascii?Q?3YHtYGvhEmCY6327b1CraPTfVuN0W1ZjtNobK2WigRrUpU6/F4TIxb3VdmGu?=
 =?us-ascii?Q?9vURatlBpvpHkmwo558LRn7BqXR+O4cf0qTS63zTrNJoT2sZ1XQT87VjmSiw?=
 =?us-ascii?Q?ZSF5cfFld1cEoECu4Ci9LBLrbCzBINiPawLKUgcyYMT1T4qcGP2mE6WcbwQj?=
 =?us-ascii?Q?JXXMosEs4wGq/Xn3H3/butsfsmfmwNM7Poi598tbnQH02nAqTDVhRfalHwTK?=
 =?us-ascii?Q?bVnFsCGrkVPGsYp77Hha3n56xsNPxcjIB346icjoWqqk8BoWVZh6RdSQSWE7?=
 =?us-ascii?Q?eNvkrFxJspi2fSJm3ZafXpkX5OKAD3gvuiNDFOUOVclTWXhoDyyvLruoUvt+?=
 =?us-ascii?Q?ltWnMCQxLKGvIQa25RwSn3QNUyBQUqpHK7TVCptummZ0DiRmOg0bQ0WLeQld?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ab366a-0166-45ac-464e-08db3700573d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 00:38:00.8533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2D3B8g/vbSbm2KIaqMoXM3Y3/4sO/KVDruM6btL/Le5FDSeYwK/G18ZuxIkkSC+benbPtGqBCH5B+4SkDgyYlgyEeELkC+3sUlC4mKee/mQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 03:52:16PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>First release of GuC for Meteorlake.
>
>NB: As this is still pre-release and likely to change, use explicit
>versioning for now. The official, full release will use reduced
>version naming.
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Applied to topic/core-for-CI with acks by Rodrigo and Tvrtko.
Reference issue: https://gitlab.freedesktop.org/drm/intel/-/issues/8343

Going forward we should plan to have these kind of patches in
drm-intel-gt-next itself rather than using the CI branch. The CI branch
is not the proper place.

To be clear, since MTL is under force probe and not normally enabled,
it's ok to bump the major version without retaining compabibility with
the previous version, as per
https://docs.kernel.org/driver-api/firmware/firmware-usage-guidelines.html


I think the main blocker right now to use drm-intel-gt-next would be
because MODULE_FIRMWARE() is unaware of force_probe. Then distros
would start getting a warning when creating their initrd that they may
have missed a firmware. But that firmware itself is not present in the
upstream linux-firmware repo.  We can think about a way to hide the fw
def for *new* firmware (not the legacy ones) that are using the mmp
version.

For now, let's keep this as is and use the CI branch to assess the
driver health with GuC.


thanks
Lucas De Marchi

>---
> drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>index 264c952f777bb..1ac6f9f340e31 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
>@@ -79,6 +79,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>  * security fixes, etc. to be enabled.
>  */
> #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
>+	fw_def(METEORLAKE,   0, guc_mmp(mtl,  70, 6, 5)) \
> 	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \
> 	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
> 	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>-- 
>2.39.1
>
