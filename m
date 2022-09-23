Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCFA5E8109
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 19:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3716110E513;
	Fri, 23 Sep 2022 17:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3878710E401;
 Fri, 23 Sep 2022 17:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663955127; x=1695491127;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xGFHigwYkyin1XzFIQ2pyhgAwuAru8tw5HDtETimrjA=;
 b=lxuOim/RCVAUf4JIWVUG7z6W/YbLk4FKopsIsSjC0ifWsEptPME6EEck
 Z6ddiBa57xrpPE5DDi5Qo7a0wpz87kPjbnmXpA6Dt+CKJNnu1L3EFaX3p
 3wb+ZtjjplQxszMAqyrnTTe4VxPVffved4Fz/jn5Yilk5IAQFuS8lg9ix
 yu9H7fZxNc0q4e6D4VRz7CTnqRHqhBaukO+FmRyxMsWiNSLReQqIPiufU
 5DgeYDhbVqjTpXJdifalaqIit3bq+OmUtK8ecxVWHFdU+YdgKL8QA2urA
 3yz8pv/FlALHsfZ2wXpaF67Fi1MK7TWVXewU6lWSrsZuzSdlTY2e+xp8y w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="281011172"
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="281011172"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 10:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,339,1654585200"; d="scan'208";a="709376185"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2022 10:45:14 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 10:45:13 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 10:45:13 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 23 Sep 2022 10:45:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 23 Sep 2022 10:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtbvDCK7WHsaHK7fmlBKD4hXBt1KD6SoG7qkqu0k6DdXHvgO/NO/SaVv511PeJbAawWXlnNgPM2CXoZFYpH5LL18NNOihUJFE9ccbjEthSMED1HHCsLX14kvqtGIZ8o8QkMV7JZRv+3oe6YEnDxIYphc/3AmZFnHAiKXPO4mBfHzgTsNckhbFxHrlufPM0ad7jX5XkIIuzPZxWu5aaJ8qcA61fEx5J1rJ8M//7jWwUiNskcRxUGqtiJOeqcAbI2WGjzdUNIlwmrn2TcpnBYTARwiLpJWGfGQPxTLTe7J6pEouF6ZLM9MPWqpHAiojBV9iRhBNNO2GAvj8V9buAt9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/xYoTiRafqZwWt078NWd/bxDrGwKgfVf5hlfvbdl9E=;
 b=Ri/iVovMT7E3zUz8HS32Ivgrsvx+BGTFqGbcUXyN6LLygCnESP2OHZjyCZgEIPRD3hwlDqveZrZh5VH/kUBCLCNukTHjbXcdURmrwfhlyS5B6Z+61S22QXiLYsdb5KHkRN6FkgHHeXEKXHtkqnGP+rJIU/MVPRiBmg73zZSm272SoeynI91As4hjpzSIDUIeUyvSpynEF9/nPr7+MryhPdaOWxAyDo90b8AZdwAdLFqy6We1LhFMfbaOTfulWCb0pSw2PKd4m0X5+wgS7yqEqYdWC6AI8PfobFeSXSxhBTraJ4Hbh6mCRnFRMzU6KocA/9AKzodnI5FZJeFDlWAIAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4897.namprd11.prod.outlook.com (2603:10b6:303:97::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Fri, 23 Sep
 2022 17:45:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7246:dc8c:c81f:5a10%3]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 17:45:09 +0000
Date: Fri, 23 Sep 2022 10:45:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [PATCH v6 2/3] drm/i915: Parse and set stepping for platforms
 with GMD
Message-ID: <20220923174507.b5vzhxbpjkzhbfeu@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220916014648.1310346-1-radhakrishna.sripada@intel.com>
 <20220916014648.1310346-3-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220916014648.1310346-3-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: SJ0PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4897:EE_
X-MS-Office365-Filtering-Correlation-Id: 963faddc-c7ad-4026-b8f7-08da9d8b5bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9lsJ+M/kvDFqKlVO93zudHSdOCOjsDtp3C5VDYMA33ZWA11RXG8ed5YahiujOlc3m8S4YQ8qXpLONJB2roBCZDcntsQProv/F4isD61mvjFcFhigQpLcWSrIsWWtRThXcR4PX6tQk3R1ErrRyvJjoW1GoNwQKab6vR3hue5LGccgku86KL7FCD0JNlLl1R7XXS3DGZU1nUey+uhV00bdmxgJS2Z4ARNxS+Yr+ezS6E/G8s2YCIgh69Bd1zGH2qv1CqISc+roeNs77G4aJt2nhANrz/OBL3hv1HxlgmdvW3Qy/3S11YhZ2pJOugxXlotOgAw1s8FYzFUcH6JVJQvHPZRbxbZffzg/cvIZfAHv4MljQ20E/KCCHaMJASXwZOM25wqBlGM71gCpv+zoWdnNBAT1FMDASte3acZhpnchFdT31bP0EyfXGTYeGWpWaPYgj5yIc6cKeB48pXy7ecSSaM4rx2z+lUr0BKBmiUBz35yEbxX9ooOBx85lYPEd+KM2LsMzJ7nJYVoe4fO/dKpOWBHQkkQ+/sbzUFm/3M73kNnv22c9IBjmS2F9hUSKyksoZFF+tAZzmTtpOWMqw8RCR2UmDY79zsAlQCW5xNd23RXYcA6GwKIWhUnIUuE7qEnlNeCdduoGH63GPsaMbhOfBbPXSd9S9+56Yby1aQdSVsJoD8C0rBeTJpXeliiMVpjFrzlmudiq7rNOnphA+cwnZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199015)(6636002)(478600001)(316002)(41300700001)(6486002)(8936002)(6862004)(8676002)(2906002)(5660300002)(66946007)(66476007)(450100002)(4326008)(38100700002)(186003)(66556008)(82960400001)(9686003)(26005)(6512007)(36756003)(83380400001)(6506007)(1076003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hJS6BRRfGptzml96IXD0TI/C2Mbgxed+Ib98MiN5C6oqgVmffkoPHuy28C?=
 =?iso-8859-1?Q?EbRmXYNfLIpVMep9epGVpGaZRYUtZTKlSyUauy3YaCvN256KSp1axy8wxt?=
 =?iso-8859-1?Q?9fLg/sfogRgJMp+IGQZsb+0RLNE/lPuFVWtOSGpBKRdbqFxQrZj18cK6VD?=
 =?iso-8859-1?Q?eHwA83EttNh0TVfGh/rvtnDRjHBKYU+5jcSN3QAC9t6cyZdtIhiVFLMWWE?=
 =?iso-8859-1?Q?oZwy9MUKdCPqUmVVW8C4qIDGGfn3INipa6qj4Mw6L+ylEEUog3Hocp+hC5?=
 =?iso-8859-1?Q?wudcDYLXBKZk0DsfpyAlx0aNqsdfPZftjuUi6pB8Jv2ERxF36z5FFNu0cI?=
 =?iso-8859-1?Q?umnoTQOW/uJ78P/62vZm4kriKZPSa1caMED6gP1/7OAQAQPTwxKt9XWpYC?=
 =?iso-8859-1?Q?7j6jsKzFrHtf66d4EEdnKnZNqsSEQjUFrEV/NpTKHo1ZxpSmJ0HyNqA4hW?=
 =?iso-8859-1?Q?cYSPW646lDHgq9qMnA/Exhpvossqy+vGwB3FR7YRl9QHLmxfi6BdJG8/yD?=
 =?iso-8859-1?Q?fjxccuWdkPhlUUxvxO1SmIRjgHOex+lXUTajUXovVhxrbbdHYng8ejfUDw?=
 =?iso-8859-1?Q?v67Lodguu4iAAK66pMxDeOl7eYyC372kJdxGuJRPmUoJrKN8tOfI/zOnD6?=
 =?iso-8859-1?Q?CqX6iMiO9xjsdIuPY8Rb2K0ubhuFrnHAGjDcpyXgdEZCqtE/MilQwgmy5A?=
 =?iso-8859-1?Q?EfOekuu0vor4Pg/5lz/Dt+lInKnX5dUhT2aF0vb5G27tcfwuhq+MGL0W6W?=
 =?iso-8859-1?Q?4WsD1Au9nWw5xuaQjZo5I3OS/Z1U4jP12xlVvX1R7GMDr/URWRVVoaQNH6?=
 =?iso-8859-1?Q?x5CHsTsDjNc4Jc2iE0UAGxgVgczT04i3wGnB+BM0GJtR5TrHCD3pyfmBdP?=
 =?iso-8859-1?Q?uSkT/4s6F+39X4yl1cSZmzv+lfnrYOS8tueRCqoqXlfObzZGxDNJBQ5eJf?=
 =?iso-8859-1?Q?XnSEwieGArpHm0oiB1z+t9CSeTwC1lij3ZHAjmk3H9Gw6ZKKCx8WvEGPiv?=
 =?iso-8859-1?Q?wuDb06FqqOhqzJZpzNBUQH+JNTbvJb7Usk6ztVqTd7pNBMqbMr803vJbk3?=
 =?iso-8859-1?Q?dFBZAlUwhKyE6/RV9n/ONbVGCMRXkAmf1+5cw3S/y7r+Cpp/L2L0LdYez9?=
 =?iso-8859-1?Q?2px1IJav2u3JCuO+pTTU7BBYU92b2yfRcOXag+I7NO7/07cfAxqkUPdXv0?=
 =?iso-8859-1?Q?bi85g+6SRN7sFIFKRQQIvOCEz2DZXRv52/mOI5dpu93+LADGM1GxahA09o?=
 =?iso-8859-1?Q?znSrq3atVvTSBunYB45mGmAzba3XNuOR8vqR1t1WQaBw2dg+zbDvKL/yxY?=
 =?iso-8859-1?Q?Yw2LrX6nPGOwmQbnGprpUJWARuFH0UvNlhyuk8IwxOnQq4T3NAAK4+N656?=
 =?iso-8859-1?Q?RG4jGcCAq5599sXPxLNtjTlCDQrQtXCneJYvWRoqoDEEz5YIMhBSzut7DH?=
 =?iso-8859-1?Q?g/WzQuv8XvcvcyCaYYopmz4DAcLcACRrk0Ub6bs52qQactNuaiTHfO9GD2?=
 =?iso-8859-1?Q?78iqr2KBHOmuaiHOn5ai+l8r1pzO3Rv/lBOH+Rt0SrCfYcw823euakAZEu?=
 =?iso-8859-1?Q?R4WJzTFxxWgujszUyY0eln1I+SLADDjf4IXI/qS5YLlcdkQ6CQArw3IbiR?=
 =?iso-8859-1?Q?rWJaL09kaGit86JUGNcTFlnFLNJwuDl9IEu2A+HWhXfGlM03QibUUlGQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 963faddc-c7ad-4026-b8f7-08da9d8b5bd3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 17:45:09.5306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCoNab1bm+v/AWZw7QHgrpr3PvQAN6oZDWYs070RLM2zfuoOMPKbobgQHvzD7QSIvsJKwNRZkb0SVAMzaO0YTYIu/mdnKv0cz8qFowX/MMo=
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 06:46:47PM -0700, Radhakrishna Sripada wrote:
>From: José Roberto de Souza <jose.souza@intel.com>
>
>Expand the current stepping convention to accommodate the GMD
>stepping info. Typically GMD step maps to letter stepping
>by "A + step %4" and number to "A + step /4" i.e, GMD step
>0 maps to STEP_A0, 1 to _A1, 2 to _A2, 3 to _A3, 4 to STEP_B0...
>
>Future platforms might break this formulae and may require a table
>mapping to decode GMD step compatible with the convention.
>
>v2:
> - Pass the updated ip version structure
>v3:
> - Skip using GMD to step table(MattR)
>
>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> drivers/gpu/drm/i915/intel_step.c | 25 +++++++++++++++++++++++++
> drivers/gpu/drm/i915/intel_step.h | 24 +++++++++++++++++++++++-
> 2 files changed, 48 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
>index 42b3133d8387..91e7c51991b0 100644
>--- a/drivers/gpu/drm/i915/intel_step.c
>+++ b/drivers/gpu/drm/i915/intel_step.c
>@@ -135,6 +135,19 @@ static const struct intel_step_info adlp_n_revids[] = {
> 	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display_step = STEP_D0 },
> };
>
>+static u8 gmd_to_intel_step(struct drm_i915_private *i915,
>+			    struct ip_version *gmd)
>+{
>+	u8 step = gmd->step + STEP_A0;
>+
>+	if (step >= STEP_FUTURE) {
>+		drm_dbg(&i915->drm, "Using future steppings\n");
>+		return STEP_FUTURE;
>+	}
>+
>+	return step;
>+}
>+
> static void pvc_step_init(struct drm_i915_private *i915, int pci_revid);
>
> void intel_step_init(struct drm_i915_private *i915)
>@@ -144,6 +157,18 @@ void intel_step_init(struct drm_i915_private *i915)
> 	int revid = INTEL_REVID(i915);
> 	struct intel_step_info step = {};
>
>+	if (HAS_GMD_ID(i915)) {
>+		step.graphics_step = gmd_to_intel_step(i915,
>+						       &RUNTIME_INFO(i915)->graphics.ip);
>+		step.media_step = gmd_to_intel_step(i915,
>+						    &RUNTIME_INFO(i915)->media.ip);
>+		step.display_step = gmd_to_intel_step(i915,
>+						      &RUNTIME_INFO(i915)->display.ip);
>+		RUNTIME_INFO(i915)->step = step;
>+
>+		return;
>+	}
>+
> 	if (IS_PONTEVECCHIO(i915)) {
> 		pvc_step_init(i915, revid);
> 		return;
>diff --git a/drivers/gpu/drm/i915/intel_step.h b/drivers/gpu/drm/i915/intel_step.h
>index a6b12bfa9744..57b9928ddca6 100644
>--- a/drivers/gpu/drm/i915/intel_step.h
>+++ b/drivers/gpu/drm/i915/intel_step.h
>@@ -23,21 +23,43 @@ struct intel_step_info {

missing comment in this struct that it's expected to have 4 number steps
per letter. I don't want someone to add a stepping B4 in future without
realizing that will render gmd_to_intel_step()  invalid


with that added: Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
