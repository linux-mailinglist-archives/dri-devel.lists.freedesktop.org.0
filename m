Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9527B72F0
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 22:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECC010E31C;
	Tue,  3 Oct 2023 20:58:14 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275A510E318;
 Tue,  3 Oct 2023 20:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696366691; x=1727902691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LVqt21cLzp7wHch+9/YUXowga+1smo8kij71NSmaAYU=;
 b=OL4h6MyiN7TmIqcmeSOro8gaumgnF3xZK43z9gtY+bHkO3hfV+IgAZRQ
 vHZyw6ancmdEP/KNK+cePjtswdg+LhBMnVkSX7QYijmnYumzYdAuFpTlw
 SI6Ge639rjZYJIHtQcrEG1XXNv4IXQrlc85UCq7M08dNn9dYJWqqQm7Jp
 A9ZHBEM3yURcXB+tmXZQd0ObgE2xmjIka8b6s2T8Z1YF4xsFM/Ks7AHwI
 pumO93HbAmu3uBcDD7TAOwt0f453UFXwVlJcx59SmF0anhrKor2sB48mP
 E9humhNJq2jPyZkLA6E+De+5IZSO0RvENUS6WgcGFnFlzyC4GemWmnG7P A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="449469142"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="449469142"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 13:58:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="700855968"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="700855968"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 13:58:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 13:58:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 13:58:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 13:58:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 13:58:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7oxdcBeWzz7Qn5+tDyBzE0CrHVYOWSYIycaKZNe35Z6en7MtmBnry6Mz1ZgmSnctTZWw2gJujq7lyqmS2EgV28Gf78+3ozi/yaWe1UZvMmT45j/+wtPHoMdCiczLpdikOAruS5XSl+YtJlpxovnatIQtkzXSu7Q4FRXAxr6qlasincEzOEE7L3z2FKWGSkda7FRQTHWOsEYxSDEKAGCWAl4GIqqBMz+wIQzPJFlj6O0IBcVQnnIGy5jiwuEet1dwv14cUU4+fYfV4Fxk6QMRHqLhmAMr6T/wfvNWZ4Ni+trIQobwyiLrmvw/6wWkqR6Jt1lV5R0swG/s1ETgK00hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJa62azHWLbuwN3Y5QVPPBE/QdJmgqUMXH/pCXqXYZs=;
 b=bnqFOPCq5nGJouJjMGu9wBAKeDw4dvyP7ldiArYVOSr4p4TgBDftEFzgHUxZ1CLl/7E7BfHpI+Y3sngkZ0vnx2IRlTFkyMO66MO6eLsri4uAI+cX/wx1vozKnmqEaGe8H/be2c9nBBChbzxFk6pakXZSC6F3RQOGf3JYQ1zp1FHd7WxjnALWEd6KSKxjz9pZdqpzgbBbpwkvUXneCQ1S4Myv5m+OemeU5l1gutvCg394Saj7HfFmDHN9Lrr3Hy0/PuOV3SjpswgihW4duAMVNtJxk2SK78UJv8B8bn744IJQvCAb/MH4WD0HvBgFA0n4XI/ZJv1U8Ds8OUVEVWJ4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SN7PR11MB7540.namprd11.prod.outlook.com (2603:10b6:806:340::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.28; Tue, 3 Oct 2023 20:58:07 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::8d1:d53c:a9f7:852b%3]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 20:58:06 +0000
Date: Tue, 3 Oct 2023 13:58:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <John.C.Harrison@intel.com>
Subject: Re: [PATCH 1/3] drm/i915/guc: Support new and improved engine busyness
Message-ID: <ZRyAW3ugNnUA1ETR@unerlige-ril>
References: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
 <20230922222510.2235213-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230922222510.2235213-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW4PR04CA0224.namprd04.prod.outlook.com
 (2603:10b6:303:87::19) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SN7PR11MB7540:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4823e1-bac1-4f3a-8f90-08dbc453712a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nBgq7nD1dCigb3zxf9F3dwiQ3eddz9Ufv+Kkp97fEDTuQfRYeyNcmdlXSngkAIJ6s9Hr0zLWc2a0lv0Xvo3dBUJ50BqpJyGdhZmq9vakGVToOgXssy7ig9Wlyw18iduv0srYzppWjm+Y+HEhKOBesCUDuqw69++8oI9Hi5KJITPgZs61mBTpf0Jgbgr5xqODsw9pj4u8eJL+B+YDSXY8HgjrZrqtAtu8mJgtBhHhsKjUdUyjvQO7dxBMGxZ4ud2+1dAOElBFmC/lHB862GthNx4y2Tjo6B8jNkyH1DZz0VMiIMAdwH1wiFpbmmsT98XEKfy4Qty84XZeXegpmA6U5v6BzLJ8CmBA38o9yLkwRvyKsddMpe10TpMVdJVXXGK+7+J8+g8pUhQOiXy/2TVRrkca8hnhUyyFpVX5tiwq3ddG5cQ1A5n0z34ne8ZOCnJR4HZp6zfYG5Ne1XcnNbHHcrmKFamyUMIhRMlyPEfTe3RAAgM0nGkjHzWIJCyBcBD4kMISY5kXhF5lARTPouSYy500pe27MsMAnwJY25pKjEBFPaPR6l3HaqrILz/+DODE6/FZQUQn+p98XaX/ETBvcDp7iBQyM706F29nFD6aV84=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(396003)(39860400002)(366004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(9686003)(6506007)(6512007)(6486002)(86362001)(38100700002)(82960400001)(26005)(30864003)(2906002)(478600001)(83380400001)(6666004)(6636002)(316002)(8936002)(8676002)(66946007)(34206002)(4326008)(41300700001)(450100002)(5660300002)(33716001)(66556008)(66476007)(1883002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXhVZVdMOUV4dzFzdk1zODA1T0FJTE1XU0FSMEc5V0kvS1J2Y2xiUnBPaFB2?=
 =?utf-8?B?MTRwb3FaQkdEclRPVE95OEFtL2FzeUpZY1JFc0FyTGVBVDNNUnFocEtkYWcw?=
 =?utf-8?B?QW5qa01LRzl3UlNHR3ZjVDFLaHhQdmJ0SlBKNTZnRkFFMy9qRlYzZDBtTWRS?=
 =?utf-8?B?R2k2d3MwMGZrVms2RU5HdnNqVUFTSUtiZzNNZkZnUE9HOUZHVXJtdEM3UGRr?=
 =?utf-8?B?WUx3Slg0SlRHZVZ5MXZyekQwM1RFWWV4anV4Vjc5TTNIWjNENUg0bk5vTkdG?=
 =?utf-8?B?bDQ0N2tzSHRTcmNjVlJXNzBzZjI0R2dMenUza0Rka2JNcFE2WWVLNE5XYXNL?=
 =?utf-8?B?MUIrb0loYXZJbmNOL1hVbjRDVWtOS0U4VlErMUpNckJiV3BTc1VkMVdKSmVo?=
 =?utf-8?B?MGRqUTJhL3BwbjRoS1NEUWV2eWlwU0ZxTnB2bm5tMjZDRGFuT3dad0FGZGJC?=
 =?utf-8?B?WS9ZRnVvV2hkLzRiZTh6WVRTK3pGTjZGSkZiM2U3UGZVZ0haL1dtVGo0Kzli?=
 =?utf-8?B?TEtnNWZkdTVNanlIdVlqcXFzUkg3OEZFVHZDVk8rYUZONG1QdlQrRVdWOUFv?=
 =?utf-8?B?Tko1SXExV083NDNLV2ZtVFVmSUZtNnBDZWlyVStWTXFObEVFejJhdEdnaTlU?=
 =?utf-8?B?dllRbUNQenJsRW91RVBDVlNlejRDS3o5NDN4ZmNVcEptWllpVUNpNy9TanJC?=
 =?utf-8?B?dXJ5UUtIMWpUcjNjc0tUYzZJTEVsWWZDV0NZalFOVEtXNnR2a2Jod0RaMEZC?=
 =?utf-8?B?U2RTQnYyNWl6OFBiQ1B2ekV4RE93SzdjRlFSQkhWUFI4RnhlOXhxTVpKYlFj?=
 =?utf-8?B?R015L05QOEdCY2JMeTFzblk4RFpBTXp2SmV3elhSMEpCOWZpT2VXaThDMHgz?=
 =?utf-8?B?Qm5VSGhpNGVtRjI3LzN1T3lkSVNvdnBxTTVGK3B3YUkvaEtGeEZYdk5wZjR0?=
 =?utf-8?B?ZFFTSkVocWErdGt1VjgzeG13S3M5amgvUEQ2OXBTWHVpcGgyYkdrWVlNOTRM?=
 =?utf-8?B?S3llcHlUSWhkemlLb1NuTVhNTDNBK1BGaVNzRUpRaGdMK25wbE16WG5zbkJs?=
 =?utf-8?B?SW1ka0cvSEpPZVlsdk9JWHQvNS9EdUFZWjBNd09IUGpscFR6YVAxVndEcDN0?=
 =?utf-8?B?Q28zR1JZNFZScDZ4dG80Rk5Gek14b0U0clpXTkFTZzgvR0NHdEx1YzdHck5z?=
 =?utf-8?B?RDBKUFUwOG9MRER6K1lNVFU5VTJNME8rSWxMYlUvdHZUMGNYY1pSMFJGa25D?=
 =?utf-8?B?amwrSWtPK2hzOUFuaG53SjQ2L3lyQy8xRXZJUDlNY3ZVRHpnbzVCaWo5dnV0?=
 =?utf-8?B?SmpHSHdSSDN2bGxMWDBXTDQ5UFZ6Qyt2d29uTnRjRHR2QitJZ2R5bUlOK2hO?=
 =?utf-8?B?eVhyZE1DNlhMT3dLeE1CeFFZOTNkdDhPVitmMnZsZlU2M25LZ083TGIrRHB4?=
 =?utf-8?B?RDJPeU5IMTJoaFJuU1lxRHU0aGpGTENkN1B1d3lsbThKdkc3RGhad0RQVWhN?=
 =?utf-8?B?K1grZWVVa1BndEllem9pUnd3N09lSG1rUUJiQTFsNDdoc21VdzU1dDBYT0ZG?=
 =?utf-8?B?cWtsUXBUclFBMTByYnBkTVFieXhlMnBmMStFWm5oL1JsenFyckxwTXZBNDB3?=
 =?utf-8?B?aGIwcG9PSy9vblh4MlUzdjBnWjdkMm9NTG41VzRIUUt1bGZ5L3F4VHdKZkxr?=
 =?utf-8?B?QzJTYTRIdGg3bXRnaFpqM3lKbjlXUDRzVi8yemdEUTVuTkpwQmI4MnA0NURo?=
 =?utf-8?B?V3RXYmQ5cnB5T1lQNExEZkdBbXNlRTA5K2tpMnJTSlNoT0ZJVXA3M0Q1NDFk?=
 =?utf-8?B?ZEtNdDFWeFZiTWUyNDUxREY1ekQ0TEsvTDZ1QVo0ZGk4WGxwL1VJOTV3dU9K?=
 =?utf-8?B?ZTJkNXJLMUo0YmNhckZvZkFGZHVuOGt1bjh3V3hWYUNkdVdjWFpzMURPYVlO?=
 =?utf-8?B?S1JhRTRHV1JRN1o0YW1pUW9aN01Pb2t0dTlWTlZNZTZjVENyRS9Ub1FWQjUr?=
 =?utf-8?B?MDVtY2hzSmNHU3ZBbGttd3orMWFoSlEwMzZPb0JVWUY0bnBUM1diZXZBMmdV?=
 =?utf-8?B?TWZGTm5DbWVOOEY3amNpS3pXTWJEZERjSE1uRXVyUXlYMFB1QldhcnhUVTdU?=
 =?utf-8?B?dUFvWFh0ZHlQVFl5QWNqa3NPTzloTTZkUjdqbkJvUDkrOW9SN3A3NHN6OWY0?=
 =?utf-8?Q?F3OcDZ9ZI9ff9p11nFecEcA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4823e1-bac1-4f3a-8f90-08dbc453712a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 20:58:06.5908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lzhf+n9XRTp9CQjGxS/hFQORZrP+ey0Zk57XZbyoAre56z+JMIomBSqG8zAPLSCp/s6wilgAwfh+na2Z7xFJ3r74ZFqS6ai5UB34LqswuU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7540
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 03:25:08PM -0700, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>The GuC has been extended to support a much more friendly engine
>busyness interface. So partition the old interface into a 'busy_v1'
>space and add 'busy_v2' support alongside. And if v2 is available, use
>that in preference to v1. Note that v2 provides extra features over
>and above v1 which will be exposed via PMU in subsequent patches.

Since we are thinking of using the existing busyness counter to expose 
the v2 values, we can drop the last sentence from above.

>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_engine_types.h  |   4 +-
> .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   4 +-
> drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  82 ++--
> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  55 ++-
> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |   9 +-
> drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  23 +-
> .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 381 ++++++++++++++----
> 7 files changed, 427 insertions(+), 131 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>index a7e6775980043..40fd8f984d64b 100644
>--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
>+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
>@@ -323,7 +323,7 @@ struct intel_engine_execlists_stats {
> 	ktime_t start;
> };
>
>-struct intel_engine_guc_stats {
>+struct intel_engine_guc_stats_v1 {
> 	/**
> 	 * @running: Active state of the engine when busyness was last sampled.
> 	 */
>@@ -603,7 +603,7 @@ struct intel_engine_cs {
> 	struct {
> 		union {
> 			struct intel_engine_execlists_stats execlists;
>-			struct intel_engine_guc_stats guc;
>+			struct intel_engine_guc_stats_v1 guc_v1;
> 		};

Overall, I would suggest having the renames as a separate patch. Would 
make the review easier.

>
> 		/**
>diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>index f359bef046e0b..c190a99a36c38 100644
>--- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>+++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
>@@ -137,7 +137,9 @@ enum intel_guc_action {
> 	INTEL_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
> 	INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> 	INTEL_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>-	INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>+	INTEL_GUC_ACTION_SET_ENG_UTIL_BUFF_V1 = 0x550A,
>+	INTEL_GUC_ACTION_SET_DEVICE_ENGINE_UTILIZATION_V2 = 0x550C,
>+	INTEL_GUC_ACTION_SET_FUNCTION_ENGINE_UTILIZATION_V2 = 0x550D,
> 	INTEL_GUC_ACTION_STATE_CAPTURE_NOTIFICATION = 0x8002,
> 	INTEL_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE = 0x8003,
> 	INTEL_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED = 0x8004,
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>index 6c392bad29c19..e6502ab5f049f 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>@@ -226,45 +226,61 @@ struct intel_guc {
> 	struct mutex send_mutex;
>
> 	/**
>-	 * @timestamp: GT timestamp object that stores a copy of the timestamp
>-	 * and adjusts it for overflow using a worker.
>+	 * @busy: Data used by the different versions of engine busyness implementations.
> 	 */
>-	struct {
>-		/**
>-		 * @lock: Lock protecting the below fields and the engine stats.
>-		 */
>-		spinlock_t lock;
>-
>-		/**
>-		 * @gt_stamp: 64 bit extended value of the GT timestamp.
>-		 */
>-		u64 gt_stamp;
>-
>-		/**
>-		 * @ping_delay: Period for polling the GT timestamp for
>-		 * overflow.
>-		 */
>-		unsigned long ping_delay;
>-
>-		/**
>-		 * @work: Periodic work to adjust GT timestamp, engine and
>-		 * context usage for overflows.
>-		 */
>-		struct delayed_work work;
>-
>+	union {
> 		/**
>-		 * @shift: Right shift value for the gpm timestamp
>+		 * @v1: Data used by v1 engine busyness implementation. Mostly a copy
>+		 * of the GT timestamp extended to 64 bits and the worker for maintaining it.
> 		 */
>-		u32 shift;
>+		struct {
>+			/**
>+			 * @lock: Lock protecting the below fields and the engine stats.
>+			 */
>+			spinlock_t lock;
>+
>+			/**
>+			 * @gt_stamp: 64 bit extended value of the GT timestamp.
>+			 */
>+			u64 gt_stamp;
>+
>+			/**
>+			 * @ping_delay: Period for polling the GT timestamp for
>+			 * overflow.
>+			 */
>+			unsigned long ping_delay;
>+
>+			/**
>+			 * @work: Periodic work to adjust GT timestamp, engine and
>+			 * context usage for overflows.
>+			 */
>+			struct delayed_work work;
>+
>+			/**
>+			 * @shift: Right shift value for the gpm timestamp
>+			 */
>+			u32 shift;
>+
>+			/**
>+			 * @last_stat_jiffies: jiffies at last actual stats collection time
>+			 * We use this timestamp to ensure we don't oversample the
>+			 * stats because runtime power management events can trigger
>+			 * stats collection at much higher rates than required.
>+			 */
>+			unsigned long last_stat_jiffies;
>+		} v1;
>
> 		/**
>-		 * @last_stat_jiffies: jiffies at last actual stats collection time
>-		 * We use this timestamp to ensure we don't oversample the
>-		 * stats because runtime power management events can trigger
>-		 * stats collection at much higher rates than required.
>+		 * @v2: Data used by v2 engine busyness implementation - a memory object
>+		 * that is filled in by the GuC and read by the driver.
> 		 */
>-		unsigned long last_stat_jiffies;
>-	} timestamp;
>+		struct {
>+			/** @device_vma: object allocated to hold the device level busyness data */
>+			struct i915_vma *device_vma;
>+			/** @device_map: access object for @device_vma */
>+			struct iosys_map device_map;
>+		} v2;
>+	} busy;
>
> 	/**
> 	 * @dead_guc_worker: Asynchronous worker thread for forcing a GuC reset.
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>index 63724e17829a7..1ce595d6816f7 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
>@@ -59,7 +59,10 @@ struct __guc_ads_blob {
> 	struct guc_ads ads;
> 	struct guc_policies policies;
> 	struct guc_gt_system_info system_info;
>-	struct guc_engine_usage engine_usage;
>+	union {
>+		struct guc_engine_usage v1;
>+		struct guc_function_observation_data v2;
>+	} engine_usage;
> 	/* From here on, location is dynamic! Refer to above diagram. */
> 	struct guc_mmio_reg regset[];
> } __packed;
>@@ -948,18 +951,62 @@ void intel_guc_ads_reset(struct intel_guc *guc)
> 	guc_ads_private_data_reset(guc);
> }
>
>-u32 intel_guc_engine_usage_offset(struct intel_guc *guc)
>+u32 intel_guc_engine_usage_offset_pf(struct intel_guc *guc)
> {
> 	return intel_guc_ggtt_offset(guc, guc->ads_vma) +
> 		offsetof(struct __guc_ads_blob, engine_usage);
> }
>
>-struct iosys_map intel_guc_engine_usage_record_map(struct intel_engine_cs *engine)
>+struct iosys_map intel_guc_engine_usage_record_map_v1(struct intel_engine_cs *engine)
> {
> 	struct intel_guc *guc = &engine->gt->uc.guc;
> 	u8 guc_class = engine_class_to_guc_class(engine->class);
> 	size_t offset = offsetof(struct __guc_ads_blob,
>-				 engine_usage.engines[guc_class][ilog2(engine->logical_mask)]);
>+				 engine_usage.v1.engines[guc_class][ilog2(engine->logical_mask)]);
>
> 	return IOSYS_MAP_INIT_OFFSET(&guc->ads_map, offset);
> }
>+
>+int intel_guc_engine_usage_record_map_v2(struct intel_guc *guc,
>+					 struct intel_engine_cs *engine,
>+					 u32 guc_vf,
>+					 struct iosys_map *engine_map,
>+					 struct iosys_map *global_map)
>+{
>+	size_t offset_global, offset_engine;
>+	struct iosys_map *map;
>+	u32 instance;
>+	u8 guc_class;
>+
>+	if (engine) {

engine is not being passed as NULL in this patch, so we can drop the 
checks in this function.

>+		guc_class = engine_class_to_guc_class(engine->class);
>+		instance = ilog2(engine->logical_mask);
>+	}
>+
>+	if (guc_vf >= GUC_MAX_VF_COUNT) {

Is it possible to split the code in if/else blocks into seperate 
functions and do away with using guc_vf == ~0U to switch between the 2 logics.

>+		if (guc_vf != ~0U) {
>+			guc_err(guc, "Out of range VF in busyness query: 0x%X\n", guc_vf);
>+			return -EINVAL;
>+		}
>+
>+		map = &guc->busy.v2.device_map;
>+		offset_global = 0;
>+
>+		if (engine)
>+			offset_engine = offsetof(struct guc_engine_observation_data,
>+						 engine_data[guc_class][instance]);
>+	} else {
>+		map = &guc->ads_map;
>+		offset_global = offsetof(struct __guc_ads_blob,
>+					 engine_usage.v2.function_data[guc_vf]);
>+		if (engine)
>+			offset_engine = offsetof(struct __guc_ads_blob,
>+						 engine_usage.v2.function_data[guc_vf].engine_data[guc_class][instance]);

Recommending splitting the vf id based counter support to a future patch.

>+	}
>+
>+	*global_map = IOSYS_MAP_INIT_OFFSET(map, offset_global);
>+	if (engine)
>+		*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset_engine);
>+
>+	return 0;
>+}

<snip>

>+static void __busy_v2_get_engine_usage_record(struct intel_guc *guc,
>+					      struct intel_engine_cs *engine,
>+					      u64 *_ticks_engine, u64 *_ticks_function,
>+					      u64 *_ticks_gt)
>+{
>+	struct iosys_map rec_map_engine, rec_map_global;
>+	u64 ticks_engine, ticks_function, ticks_gt;
>+	int i = 0, ret;
>+
>+	ret = intel_guc_engine_usage_record_map_v2(guc, engine, ~0U,
>+						   &rec_map_engine, &rec_map_global);
>+	if (ret) {
>+		ticks_engine = 0;
>+		ticks_function = 0;
>+		ticks_gt = 0;
>+		goto done;
>+	}
>+
>+#define record_read_engine(map_, field_) \
>+	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
>+#define record_read_global(map_, field_) \
>+	iosys_map_rd_field(map_, 0, struct guc_engine_observation_data, field_)
>+
>+	do {
>+		if (engine)
>+			ticks_engine = record_read_engine(&rec_map_engine, total_execution_ticks);
>+		ticks_function = record_read_global(&rec_map_global, total_active_ticks);
>+		ticks_gt = record_read_global(&rec_map_global, gt_timestamp);
>+
>+		if (engine && (record_read_engine(&rec_map_engine, total_execution_ticks) !=
>+			       ticks_engine))
>+			continue;
>+

engine record and global record could use separate functions, maybe like
__busy_v2_get_engine_usage_record
__busy_v2_get_global_usage_record

Regards,
Umesh


>+		if (record_read_global(&rec_map_global, total_active_ticks) == ticks_function &&
>+		    record_read_global(&rec_map_global, gt_timestamp) == ticks_gt)
>+			break;
>+	} while (++i < 6);
>+
>+#undef record_read_engine
>+#undef record_read_global
>+
>+done:
>+	if (_ticks_engine)
>+		*_ticks_engine = ticks_engine;
>+	if (_ticks_function)
>+		*_ticks_function = ticks_function;
>+	if (_ticks_gt)
>+		*_ticks_gt = ticks_gt;
>+}
>+

<snip>
