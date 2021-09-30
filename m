Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6E741E33E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 23:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984986EC89;
	Thu, 30 Sep 2021 21:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB756EC88;
 Thu, 30 Sep 2021 21:21:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVlG/urynTinFaey/nOzRMY1Fdlzd9p0FnElUQhuwo5R3XBKi8cX0JpLPlSVLMKK+vVkBpStlnug1m5f5/HJry1HKB1axo2zqgwyjWnTQpejE9NurrY4lQE5GjX6oG5h9WyugPV80uRWpnk8KphTD1VTDVMTfllztDsRYvRb8Tfzyp0rHEELr5GrrEGzyrESewW5K2sVnrDbXfjw7RUZ+b+ZCIYvKKGqyO+k+uIIuaZd/CdLLRTTSQN96H+OwrWLpbYs69jMvg45gR3gAZ7Sc7laBs5vpB5mHelNo1jQboM8MhAErRv98FSVYnHKpzlduWGnoRgFeRqL7jnnZ4cBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DcyhT9ZSgg83mcqrz4kcVLRO9SVivkDP6UpXs8JKxo=;
 b=DulqdZDfEjFr+4XSbs+RefaUQIZWCMRpQAMgpPKj0OLyp4FGJWxdfQGscTd91fP7gWe8tUPs3Dcd4SVZx5ANzNQZO2KDod81c31BrMixrE2d6Wv3d1zVsqcFz9lLMlFXyJuPgmHe7NrwTAImwztPlJt/kGrovs2q6TbUJteaS54c8bADHMCB7Yy1jQ4NKKU1LEElcCL4pd/yTvAhBChIH437aao4R/tgHgQJUNByM2Kg+g1MKdrBVifSD/6LROIP3+T46actJAEXd+xWTH4rFnTHwgPggEz/P4HDm0MsoJDUtCGqkUzdU2DUvDIPAY6GNTvgEognyX0W7zMDcXLzpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DcyhT9ZSgg83mcqrz4kcVLRO9SVivkDP6UpXs8JKxo=;
 b=LBtpAt1gj7lRCXw2IFYmhZ3JXstytR7iv4lIn3A/4cEWA3+qmlx672y4mIHs9ECeQQGBoIG62/l55N4FU3a6RlUD/qdqCpY4Ti77C+xc50t9qVds6g3VPT4HKpjF7oyL8VPJZpNCRi1E/cjRafUWa0PL1quhbo4+jkAJJ5Ej+tQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB5564.namprd12.prod.outlook.com (2603:10b6:610:65::24)
 by CH0PR12MB5235.namprd12.prod.outlook.com (2603:10b6:610:d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 21:21:16 +0000
Received: from CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::7988:8b2a:5575:4510]) by CH2PR12MB5564.namprd12.prod.outlook.com
 ([fe80::7988:8b2a:5575:4510%4]) with mapi id 15.20.4544.021; Thu, 30 Sep 2021
 21:21:16 +0000
Date: Thu, 30 Sep 2021 17:21:13 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@intel.com, Nicholas.Kazlauskas@amd.com, wayne.lin@amd.com
Subject: Re: [PATCH v3] drm/dp: Add Additional DP2 Headers
Message-ID: <20210930212113.rsy5lbg3mhejvsdo@outlook.office365.com>
References: <20210927192324.5428-1-Jerry.Zuo@amd.com>
 <b2ce7b34-23f1-75c8-182e-3e7fe9b845e1@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2ce7b34-23f1-75c8-182e-3e7fe9b845e1@amd.com>
X-ClientProxiedBy: YT1PR01CA0126.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::35) To CH2PR12MB5564.namprd12.prod.outlook.com
 (2603:10b6:610:65::24)
MIME-Version: 1.0
Received: from outlook.office365.com (2607:fea8:56e0:6d60:65bc:e9ef:c548:6ef5)
 by YT1PR01CA0126.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 21:21:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05fc3cef-2731-458b-e37c-08d984583cb3
X-MS-TrafficTypeDiagnostic: CH0PR12MB5235:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR12MB52355E5F15B5EEEDAED853B098AA9@CH0PR12MB5235.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLtGDFrhIzon+nR6kAI4GHThkd/Cqi0oSgUK3v4x+lK9vxb01yPXvjllGpZ3cYLJdkLa+e+lAEaHGsN2sduCr37Gdp8bQr9K4MqYMUuR/zocMQt/XOSWyTchaYQiz791ykdhnzkYNk0JeV8MQp510i/QNaAzwoXKS+5D0myEGn2OoOL30PMCaUomxukZYczT8CHfyQOVXnWVUcPh+keJwlloG7upiSdkJZ2VMpibNleOseR+D/UBDlpyVVdQsUcmCyfYCJ8za5CmIpyzbQpcbTQ4KjKb6U0rfiPfaK8QgJXp1PC8Q0FGU8BxP7VkGO/aGv1x6qugWbi/BQ+OcUd4otJekCLxoQtAmhp3wPjdIbkkgaPCNaNUg16LtFCQb4mMlqxlQD6ox9TUH6uj/6TCcXIZ260cbSvsfgRn/pIgDgoMNNSk7MBif/8/X4W7JUXSOh+A2lJBwq0akwyaY5IJy2dExmHsffwMiIlBhcAkOZSHtfTD7LQePTAtMhxV2ggszQCdYp5M478yh6J6GSmH4u8W8eizN/egXbzatde2ooIFDZE2gI7bQxXzapMDD7J+tWi3Yjjk06vlavuTRL1nL4MiAwYrsj74M6YDopfDHruSFam9wZIzV4ICQqNZAdTl0SE42Ndq3jCJmRyj656QqTqgfdK75eKEi4xeOqYq6of5BgoXVH+DMByrOWnwqCg+opwjs3G7aiJVH7eeQLGNsYvJkAqXlVfz+MGJRTwKsxQpvPH8WBWlZFq4foJSg/PCUWOBRLvV8+sh1NXTL4UfkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB5564.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6636002)(4326008)(6862004)(316002)(38100700002)(508600001)(6506007)(52116002)(9686003)(55016002)(66946007)(66556008)(1076003)(2906002)(66476007)(5660300002)(8936002)(8676002)(83380400001)(966005)(186003)(86362001)(7696005)(53546011)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZwcX1145ouDxlyLvLSDZbQfYqGY3KoNY3x+pZxK1SDHytXnsxCHQD/eYJm+f?=
 =?us-ascii?Q?ZfV4h+tFHcfJn24BTqZ714k+nSc3Q4A4C7OniIrvV9v57MKOSPbk+WGYc35T?=
 =?us-ascii?Q?oHFgmWexD3X4fKtiZbSPPXctdRI3wrUAbZzDQmtc0c9XRbsZKg5tRCCwVUd5?=
 =?us-ascii?Q?dLRYalknneymOwhzMhqhhthH4ounizGxPMXr3aJv3fMhro34krosW1VpbR0W?=
 =?us-ascii?Q?/b8x8mWuZ98/9FuuY23pLGr1DZAQoqHOe9Sl+i/8nR2GdH4+a/NESNAkzlFb?=
 =?us-ascii?Q?ZjIntkrfogHJ6KGXuiItkivvOoawkaFiSFUjaQtcbU1jwa1EcqY34lJx5ibm?=
 =?us-ascii?Q?Ihnj0m45wVKNjNc4jlsIuYMq3w62/58S39e9DGuZxH80Rvt1ZVfMSOrYfrXs?=
 =?us-ascii?Q?4JpufprdS7KmB33fpAFCXjaFpcBb3QeouQRZj/90Jt5+2984sjThBP3tGd/5?=
 =?us-ascii?Q?YybxFuRRgNoA6AissbhRPoxiDjN5vU9M/M1vBnh3dSTwoJi2R6Nvbbf50LEq?=
 =?us-ascii?Q?Jna13or81fJDL49TzYaCVrucKPaV277huqKOZeXe5jpOJTg1wPLa70fGzcRG?=
 =?us-ascii?Q?fmSOtDPl8liQ2stj/SVt5OhHN8JVtrA7Ztbe77LH/LShEkYGBaGo3CdwZwfw?=
 =?us-ascii?Q?U9HD9qmD4mNNXl4EYFje9PLmKtGFKWAcurh+R4zfeTYQxidOtUFdTX9DDSEI?=
 =?us-ascii?Q?sh37fJsDnGEX86kM/1eE09/K5klwvZthXH/9wLJWt66bGx9wC/bCTuJKqpD/?=
 =?us-ascii?Q?YexSE1yRMp/g4LUM9sVdeZVrFwJC921ZjYwxSw9mVY7IjCqyyOmAxjM4DvIW?=
 =?us-ascii?Q?4aZ+E4dXIN4dSK22lhTCYBlHof/JTNqN82bELnMwce4wh0FIYnvyXefn6/TC?=
 =?us-ascii?Q?3s4+FaLxGtK2vXapvCCLQihJvFHNuWiTcNBV8rKS4Ivu+ag9lP3SBiOvmdH0?=
 =?us-ascii?Q?uoc13n11KKeagq6VwAfbSra4Odqyur/dPIoBlDJfp7Ex3iw5fW50ejCiCdsi?=
 =?us-ascii?Q?XdVrJNspPFZ20ATsqTkMq/0N5Y4abGxBYWKDV5cE7n7gvEXbzKOPbrB2hBIY?=
 =?us-ascii?Q?VXLziQ70vveQox6g0jCb2f5tsdpk6UxaR/sDM1CrlMj+v0RzALKQNBTjmmdb?=
 =?us-ascii?Q?AMXNtUguVlDJhGzi/seX4Smulc8n6Oo4SPlZQoUg+DoO/KlJ6z3kMjFoiGUn?=
 =?us-ascii?Q?LgRqXvtK5KsZaNAJq3bbMbsHYtTbem2EjdjgMbeyywqqb08x4ScwUgwmPfca?=
 =?us-ascii?Q?vYe8iEnc2iOxNHvNjrnVcZQGgPPI+HWdUksRPMUStly/9PtA5HvZhext7tMr?=
 =?us-ascii?Q?ctxp6iPRqCAB2O2JBDig0sj0EYiG1MwB2TnhHxziyiW8Mwl90sJEEwdCoNda?=
 =?us-ascii?Q?1TnEFXNt1K0wFfwRM5q/ijI3e2wD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fc3cef-2731-458b-e37c-08d984583cb3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB5564.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 21:21:16.3113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RCi5J6yTyURSwFDdemKA42tbsw2bUmCdGdJe5kzG3D00qttzcrTKFYHv4GIMR/lLHZm5mfHJB6kIPEdlETL7xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5235
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

Applied to drm-misc-next.

Thanks

On 09/28, Harry Wentland wrote:
> On 2021-09-27 15:23, Fangzhi Zuo wrote:
> > Include FEC, DSC, Link Training related headers.
> > 
> > Change since v2
> > - Align with the spec for DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT
> > 
> > Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> 
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> 
> Harry
> 
> > ---
> > This patch is based on top of the other DP2.0 work in
> > "drm/dp: add LTTPR DP 2.0 DPCD addresses"
> > ---
> >  include/drm/drm_dp_helper.h | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
> > index 1d5b3dbb6e56..a1df35aa6e68 100644
> > --- a/include/drm/drm_dp_helper.h
> > +++ b/include/drm/drm_dp_helper.h
> > @@ -453,6 +453,7 @@ struct drm_panel;
> >  # define DP_FEC_UNCORR_BLK_ERROR_COUNT_CAP  (1 << 1)
> >  # define DP_FEC_CORR_BLK_ERROR_COUNT_CAP    (1 << 2)
> >  # define DP_FEC_BIT_ERROR_COUNT_CAP	    (1 << 3)
> > +#define DP_FEC_CAPABILITY_1			0x091   /* 2.0 */
> >  
> >  /* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
> >  #define DP_PCON_DSC_ENCODER_CAP_SIZE        0xC	/* 0x9E - 0x92 */
> > @@ -537,6 +538,9 @@ struct drm_panel;
> >  #define DP_DSC_BRANCH_OVERALL_THROUGHPUT_1  0x0a1
> >  #define DP_DSC_BRANCH_MAX_LINE_WIDTH        0x0a2
> >  
> > +/* DFP Capability Extension */
> > +#define DP_DFP_CAPABILITY_EXTENSION_SUPPORT	0x0a3	/* 2.0 */
> > +
> >  /* Link Configuration */
> >  #define	DP_LINK_BW_SET		            0x100
> >  # define DP_LINK_RATE_TABLE		    0x00    /* eDP 1.4 */
> > @@ -688,6 +692,7 @@ struct drm_panel;
> >  
> >  #define DP_DSC_ENABLE                       0x160   /* DP 1.4 */
> >  # define DP_DECOMPRESSION_EN                (1 << 0)
> > +#define DP_DSC_CONFIGURATION				0x161	/* DP 2.0 */
> >  
> >  #define DP_PSR_EN_CFG				0x170   /* XXX 1.2? */
> >  # define DP_PSR_ENABLE				BIT(0)
> > @@ -743,6 +748,7 @@ struct drm_panel;
> >  # define DP_RECEIVE_PORT_0_STATUS	    (1 << 0)
> >  # define DP_RECEIVE_PORT_1_STATUS	    (1 << 1)
> >  # define DP_STREAM_REGENERATION_STATUS      (1 << 2) /* 2.0 */
> > +# define DP_INTRA_HOP_AUX_REPLY_INDICATION	(1 << 3) /* 2.0 */
> >  
> >  #define DP_ADJUST_REQUEST_LANE0_1	    0x206
> >  #define DP_ADJUST_REQUEST_LANE2_3	    0x207
> > @@ -865,6 +871,8 @@ struct drm_panel;
> >  # define DP_PHY_TEST_PATTERN_80BIT_CUSTOM   0x4
> >  # define DP_PHY_TEST_PATTERN_CP2520         0x5
> >  
> > +#define DP_PHY_SQUARE_PATTERN				0x249
> > +
> >  #define DP_TEST_HBR2_SCRAMBLER_RESET        0x24A
> >  #define DP_TEST_80BIT_CUSTOM_PATTERN_7_0    0x250
> >  #define	DP_TEST_80BIT_CUSTOM_PATTERN_15_8   0x251
> > @@ -1109,6 +1117,18 @@ struct drm_panel;
> >  #define DP_128B132B_TRAINING_AUX_RD_INTERVAL   0x2216 /* 2.0 */
> >  # define DP_128B132B_TRAINING_AUX_RD_INTERVAL_MASK 0x7f
> >  
> > +#define DP_TEST_264BIT_CUSTOM_PATTERN_7_0		0x2230
> > +#define DP_TEST_264BIT_CUSTOM_PATTERN_263_256	0x2250
> > +
> > +/* DSC Extended Capability Branch Total DSC Resources */
> > +#define DP_DSC_SUPPORT_AND_DSC_DECODER_COUNT		0x2260	/* 2.0 */
> > +# define DP_DSC_DECODER_COUNT_MASK			(0b111 << 5)
> > +# define DP_DSC_DECODER_COUNT_SHIFT			5
> > +#define DP_DSC_MAX_SLICE_COUNT_AND_AGGREGATION_0	0x2270	/* 2.0 */
> > +# define DP_DSC_DECODER_0_MAXIMUM_SLICE_COUNT_MASK	(1 << 0)
> > +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_MASK	(0b111 << 1)
> > +# define DP_DSC_DECODER_0_AGGREGATION_SUPPORT_SHIFT	1
> > +
> >  /* Protocol Converter Extension */
> >  /* HDMI CEC tunneling over AUX DP 1.3 section 5.3.3.3.1 DPCD 1.4+ */
> >  #define DP_CEC_TUNNELING_CAPABILITY            0x3000
> > 
> 

-- 
Rodrigo Siqueira
https://siqueira.tech
