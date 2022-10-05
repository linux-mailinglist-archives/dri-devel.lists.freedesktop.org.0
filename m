Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6B75F504C
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 09:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B99B10E462;
	Wed,  5 Oct 2022 07:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3152B10E462;
 Wed,  5 Oct 2022 07:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664954684; x=1696490684;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h/mhnZSAIbSvZvHuYZPViXFMZYPJyvAtM/+9LeA4ds8=;
 b=bginXsPLtftDHRCMOOX2M2/S3RXOO5yckZQD9s5qoA1ZB6tRtNamUPmg
 jriZ5NTj3SgyVHR0OfbX2xfQcjYz62BpkOa2jZjOQtbhhAuPPGaoOkY4R
 qk4YO24oBLhtFoUuHiZsxsjckc3Au8IXHfbz2GtroJ2loYGwZxkpd4meC
 hbgYvbNm1LpiGgGqpQXakynI3KTk0FcJsLAn7EiKibYLJhDEdTjZACvEZ
 f8jYcm/nQx4xoeQUpgpnokz3nKFhconbWR3Sw9AbxsQOuBPnBV6ZJlH6n
 M2zP8MBZQWnm7CDEUMVuBYMBd/g3AGwnCbJa72vGHFeAJ/2FF4T63Jn1H Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="282814883"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="282814883"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 00:24:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="624230826"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="624230826"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 05 Oct 2022 00:24:41 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 5 Oct 2022 00:24:41 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 5 Oct 2022 00:24:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 5 Oct 2022 00:24:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 5 Oct 2022 00:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve2hnmnKO7I5V4r53KsVVGIvNpc1KLQ7HiGLi0iMilGH8EVF91vNtBVeBbIE6ryME30ecwce8SRdr/ZAxtDr6iJWmNtEDHjS2C5iei9B+2Bats/+ZauK2c4uFg61tfR1R9MxCt91Q+/qPo8seRD/libbQJcwGLBQF2xMMz1HtbhjNwpG6syGvLbDKMS6NqygKbSssyFywhGQmHZeO7jh5ihURnJG2FdVP7LuFHZZBGiCuuTKuNTeI8vb4DpFXErdf+EjpqrZo/ENQcBJLk+NRuagnlhZ2wK8CyQhN1DPgfecd75RRlrtsBpWPrGUcIV8xC5MpwLnM3fVbJtHDu2ZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yS3vt+7V7UIIzFukwAhNEOVbYSAVLx5+gEmjOj5/PVA=;
 b=Tm9rfl4bgzPXitXYdjZIPQExsuAY/U+9H8lWy++c07KwfHidDbHIjc6pIv2fTrsqi7qp4wSkbYr5h5+rO0WFOf4KpB8pqFxZbg/qLUWS4fr3MjHQV+v/h+1/X93w38Kwa88MJ9zYZY46w7clIhm5MOHNAls1bRYkSViQJcwnalGNohAZ3jQ5eMjtHl84t0UGFi0Y2oB7sVMdfa5DEY4Q7Dl5JghMYWuiWBGJs3QX4wmjO23b7XcTYlopq30RHnBLWt/CJnBkoPHbYh5jW3T7yXrUf4daDlHV+Ku5vx3xEuKCAcZ9FzL3tufzqfY9TqQdy1CRSM4eGPEOnwZ2o8oOdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Wed, 5 Oct
 2022 07:24:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%4]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 07:24:38 +0000
Date: Wed, 5 Oct 2022 00:24:36 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: Add MTP ddc pin configuration
Message-ID: <20221005072436.r6esamkhcw22sipd@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221005002534.2966978-1-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221005002534.2966978-1-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 266adc71-86ed-44c6-9d5f-08daa6a2a971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AeSFB67SFzwosOvF5z7d6wiFLzvR3RX8c8Gtljet3AF0dG14zGAELpcIM+eb+8L/p/XKqcCOtqWt8c7FcNnKPcLkByQm2+uQaz4d+8QHWlmzRyDbRjRmoVARU7gfANwToSydAxPikDjPw5qM9/AkVFwFF/e38OUa+qlBPbAx6i7QHoaQytGOeMgWU+GiesMfWDXoap4Vn3JJfrFEaLgKz0/6QVsNJT2BvGhnQLGeQ2gTVXcqGvZF0e5DtJ3CA05IbM2uLisW82yIvK5sDo8m8OJqdIhk0hBRjJNqnhgjT7R3o6Zde42Jgg+YYBlMVARauTRrMoe4ECnPY9GyI5Yx0T9R0v5R3bMOJcy3sZNRdRQ3iBgRF6EDZuLXQhy8PPWfvH8a1M0WnL8QGJd3hAetJvHKYqyziswCDLtLBdHT7eZOVpCbsSkmdzvcZflHNmqRTvrmm5N1x6L1S9qS5B/c9DWLCXlrpvqO4iT7m3qObD01FOKa0ZzJFz8q27SLxvgbCI9mOEjV12tGdu2GG8tDLSWDdjGCU6ZY8WObfCnsNcFUsbO1zgaKMkivtLBD97579L9hubjC6cqJBt7l5rjtmzuLNbc0zTjWCa/VJ7f5rGc8vIG0ZknSkZ2TDqsheNFGrGsvVLW8UnPN3MUlKiWTGmFgTPC1rjaSEZNdOKGcSz84K7moiAP2QDTLZGLA0A3eBcQF8PDwdKfRiuTvJ3hbzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199015)(41300700001)(2906002)(6862004)(5660300002)(8936002)(4326008)(478600001)(66556008)(38100700002)(82960400001)(86362001)(36756003)(66476007)(26005)(66946007)(8676002)(316002)(6512007)(6506007)(9686003)(6636002)(450100002)(6486002)(186003)(83380400001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i0/cVer+XBJ3/F3NsTSQLqegLf11FKR7bLVx2NqL0uCgRsIKj5GYVmLwYX48?=
 =?us-ascii?Q?pcoF8/GXnGI70TTjj3eJQahyjzwN0Lc4TxhHnTtLGkm9l/NeRcArgxf6O6+7?=
 =?us-ascii?Q?0nKxJGBW4TQpNv5N/bZ4ctxIM9/UMzQ/5lEZJi/mXeVXRUJ5nbzfVT+4RwHf?=
 =?us-ascii?Q?0mDYzi5wPJUT5ap1puoMY3mhmlg0t/dlTRAgM/vYqzczi297WdvBIdUT18sG?=
 =?us-ascii?Q?IFy73meWfpx3o2OvNYjoCeqd8nLwWd10ufmhA1MzBzjLIZCYwRyWr3+Nx74s?=
 =?us-ascii?Q?Rvljot1NO/cOE5mmnKXYCO+Xpp/BJlr20D0RMwOpY4fd8gkHObyTZG/0luHl?=
 =?us-ascii?Q?MC/oQSVX5EYyItyK8AtAHE2aXDrykxaeTXz1C6dsu2WwOai8uHmaMwtTGN1+?=
 =?us-ascii?Q?3ZF+CmQKrPkTzuTKembOu+1TtPNwnfOA5RdA6eaK7CAxtAAoce5PlDaNkcGg?=
 =?us-ascii?Q?WplE/GAD/M0rsyx5sRuPorCR7+LFSFPig8iI4R52zartNkY5s92MFKW34toE?=
 =?us-ascii?Q?AHmg0FECzp5jMsjWiMgWz6jl6jXBMQqG0LXsVrDq1XDT/GfluvFHAZrEZOqe?=
 =?us-ascii?Q?vYPatBtX+Vbpae7ycmv7TfeEo/d1B5cAzF+rgHyVS6lUYkmSivaKVEZO/vO0?=
 =?us-ascii?Q?ZnpFdq1HEKt0iNzmsge+aM/VV6VTG229a1SeqD1h/WHfQkH7+HBe/XjSnlUe?=
 =?us-ascii?Q?kGAEMBb3wEYP3AIDBc3wul0q5JDJ0W02m+/vHBIN4PHB6cBu9bfhK1o4/75a?=
 =?us-ascii?Q?qt6vmafbrN7mPrQ1+r5PphAQsgrdPAwr1DGscZRiNX3BCgLH+EaTw+SRPCr9?=
 =?us-ascii?Q?FTs23gqI9gcXdUyv85wauUwIUiUJFiUHIAypGmDLVcoNbh3YM7Cbr4qolMR0?=
 =?us-ascii?Q?A8NhwuzX+QuFtwHfjDvjw8PLOLOuEIbwk5I4iLfte5IYXATW9GxLcfPZV9Hw?=
 =?us-ascii?Q?IcHBH4J9CpCf6XXYWbHkNYm9Q5lM2n+Ii57ghiUZBDlsUZeTlUwE9Hr5buCn?=
 =?us-ascii?Q?U3GctW3WZIef/LuS84e99Ga1o5WtLc6DVjPjGjQ+hmhLQVbDnyNRK5uXKjNN?=
 =?us-ascii?Q?Ib1+1B3Xmecl+YmyNd/WRz3/x3yYhTa1AupD/BETav/umCe5wyGBU49d27ev?=
 =?us-ascii?Q?cp261RF8cgFWbIPUKB1l6DIFFUXD7fhRXLX16EPzMiD8jk6+et+plKlxcne9?=
 =?us-ascii?Q?S9g76vLTO9V6VWlWtO46tUqLj64RTSy6oImJDflzyUrubTlbQbVjVPBiN6SE?=
 =?us-ascii?Q?kDYV4UxUEjsZI6oQys4Z6PY2mBKKSGrpz0wsskjKYf6YX3Ek/iw1K+A0ev4H?=
 =?us-ascii?Q?0DwumuELMy16Of/7aIoRQDVh32OXil8OX0/KShDHJW78e4flXtKDZjuQ0bGu?=
 =?us-ascii?Q?bqJrIkLQO9RL0s/N+/bEnY8vlRZuHfRCMztj9/kdREUt0Ug6m/3MWfY/rWM2?=
 =?us-ascii?Q?YetWGy5FoKQ3yw0w4WneT1jyc3yR6IWZ3JdD/mMTvOsOHBAySaH0P0tTnsNw?=
 =?us-ascii?Q?/rORb8nSddHVUSrsdndLP4L9L9Yt+4IaQUI4HkNEv6VtErg7mWh5MS4O7MrO?=
 =?us-ascii?Q?9B7SpPrRATTkBmjecXd2XC49C7eQFKZOw05su5A0N9J5aY1Swb1frfU75J30?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 266adc71-86ed-44c6-9d5f-08daa6a2a971
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 07:24:38.5460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdjT2D9hG8uIgn8kbiSdiUlTiYPw8rXYpDF2c3+rLmYikxE09L/nsX9ps8dp//TKi5WiE0/kgI7ZJafljHLrXubw0qv5/brKsyvtgJ6NMiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
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

On Tue, Oct 04, 2022 at 05:25:34PM -0700, Radhakrishna Sripada wrote:
>Meteorlake PCH reuses Alderlake ddc pin mapping. Extend
>ADL-P pin mapping for Meteorlake.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

This is actually the vbt -> display engine mapping.

Bspec 20124 - worth noting the absence of MTP in the VBT field, which
leads to the conclusion "should be the same pin mapping", if that holds
true in local tests.

with a reworded  commit messages with some more details like above,
this is  Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
>index 4c543e8205ca..c2987f2c2b2e 100644
>--- a/drivers/gpu/drm/i915/display/intel_bios.c
>+++ b/drivers/gpu/drm/i915/display/intel_bios.c
>@@ -2188,7 +2188,7 @@ static u8 map_ddc_pin(struct drm_i915_private *i915, u8 vbt_pin)
> 	const u8 *ddc_pin_map;
> 	int n_entries;
>
>-	if (IS_ALDERLAKE_P(i915)) {
>+	if (HAS_PCH_MTP(i915) || IS_ALDERLAKE_P(i915)) {
> 		ddc_pin_map = adlp_ddc_pin_map;
> 		n_entries = ARRAY_SIZE(adlp_ddc_pin_map);
> 	} else if (IS_ALDERLAKE_S(i915)) {
>-- 
>2.34.1
>
