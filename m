Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC9A5F4D41
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 03:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DE410E419;
	Wed,  5 Oct 2022 01:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC04010E078;
 Wed,  5 Oct 2022 01:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664931681; x=1696467681;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UW9jf1Gm08c8CDblVv8+inx7aoLNzzTwpbYbSLfvvgU=;
 b=OcBRjLyfv9Kl8+2kTOQTbq7SKGX0xlVRbjGfBlzU1hEsNP10E/SYuJC5
 xsmFGMv7swZkamRAZoyfUlenqt19HVqXEYLFRMYsPR6kRWmXvoPJLCGJV
 1rmUrUO18DNTg/ub9aHMib/aWVYgfuBbZA4aML5Z3CyU4SZvAOJdLCkDP
 tx1m2dY/39Huf1cTuJTjCQ3Qzmhv8332CDvV1WAVdY11Rj/TT0aTWmZYx
 GyxIv3+ZS/ddZey9gXWap1EDzeLUlWmPCRMWhY9Q3aBsPaEe/Wi1Ed9/v
 XQg5YE86GRPGuY7YPAtGvFmjibsiF6UzAgq4aZvx85dG+B1D9EG+TemkH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="283430735"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="283430735"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 18:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="953010011"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="953010011"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 04 Oct 2022 18:01:20 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 4 Oct 2022 18:01:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 4 Oct 2022 18:01:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 4 Oct 2022 18:01:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 4 Oct 2022 18:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwtxFeDrlXPOuZkJ6Kqsl3u/DcLm24wFFZeXYFEvVWUOjwBTKgjeqoeRTxWqNl3XmvO0S3lcsT6JNis3wNUFd7uzMB1GCzAxE9VtWX1RN1fKIKDGFuEanxzPbwqZvSwqnO3RcqM7bM09uWq9xHxkgGORioGI5u2IC+KSuKKqPE9zqyNzXA98y/MLlRqBr2EQ4ykbb+qG5cNVp4FveA3KSGlAVQ8vFhpy2wAa1OGOAid3ED+0utp1cVBtChVF2EhjAHo2+0+GQWTRuYrz6gHad0dlbL4yyk+Vwt1YE3VsbmY5joOe22hLXl9pF99DLg/gN5zqOXS/uxrB7XqnMXE6mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ng0mlrOY7ZLo6j6OTGTjOfkYy9VX2bVdyXr4QuPUf04=;
 b=S7tS8Avvk9iV9iDHGhhuar9/QUHd7CIiNE3SKsylkTZLCfJ6rHUX01NXT26iHUlvfnefycxR0xaWSHfBWss0JmX+edaP+S6ngAEYY/G2V10qgbzq9NUUMmAzZ99XRC7nsgK6tSJ4F6ie+norflyhRc52NamOYPSCVyULTu11W4zYTfwaPD39u+v5+JhIqNXfrr5aNkorJR76KNSZFDnlTomCj4HbeLBjc5ID6Woi/wBVb5zgoUfLCo9dI/ASPyigoWui9o0617blsDQtB2fJeFHJyCeHvdYtJkvz3pRupDp7bMUcvzsauadCST4cB+5tkyYqQHHnCFJhnZNazwDyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by PH7PR11MB6674.namprd11.prod.outlook.com (2603:10b6:510:1ac::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Wed, 5 Oct
 2022 01:01:17 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::29f8:1b74:685c:6198%8]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 01:01:17 +0000
Date: Tue, 4 Oct 2022 18:01:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v2 12/14] drm/i915: Define multicast registers as a new
 type
Message-ID: <YzzXW8Cy6jzW+jUP@mdroper-desk1.amr.corp.intel.com>
References: <20221001004550.3031431-1-matthew.d.roper@intel.com>
 <20221001004550.3031431-13-matthew.d.roper@intel.com>
 <87czb7u4qc.fsf@intel.com> <87a66bu4ja.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87a66bu4ja.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1632:EE_|PH7PR11MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: ce017f92-a82b-478f-6b09-08daa66d1bbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q61ZPSXiEC9FUI1FK0Q3kBez+MdY+PfNxORCQNfId1sBB1bS1dqrP5VvDtKG/etrB/T8D9nX6IRWN6Pl5tBWySh1RNiUYl2sKtUXA8utGyvzgynN6QeomuDHHq5HnnAJvTNt6NIP0zna4ml7s60AkM72HWaHPBByfWi1XI9ZIfagYPJ0yWDxUHMQoCM/248RcRrjUv3bLYR4WMG1fYYYhgO9bdYXbEzqvX+OEz1AudLEKaoW4J1S18ykz2EWQOm746kX7On+o4gVwivz3fNFnMJ0F4NMCz5l1P3d7Fpybpdh7xRAj+oVz3EqSD6xFm9He+jtdC5OE1nRJQN9LVI36Ln7ChlwzGwvsmfAu1dKRmikJIxLe5ICIajF6i3FC9eRO1g6qk1iSPFofCSiQ0gZ9QeBisjfxG3G8tUn8tp1GO7Wk9Y6QwXIkHo+BApSjhEjGDKQfwpS0iKYHyTu6N3VQ7jeDiSv3qq1fvoUoWHqidksFkkBIS/KYfll4A58oTfBAUEgneoYdA43oPoOrZob2LaN9QraMENtnFPh+pJXNtMY9JgDmBZh+jRSeLgyiJVDKZhTpY8D1I5BM10fo4fjxNLDf/sXhERQnU69/93zzQP8NFH5YTiyuHlSmGmRmhXhUXOk5EvGkfTVSqBHaEJPgzZCq/YjszzPUvBn8htANLDLms+ePRvWGTvX9Rx94vU96PMa+WsHT6nnwyKoJPtaWGStZv7YXFQcCElo8HB8YOQ+7JMNnOnyGz0hQrTurEjhU41PUw09OJwTYde/zkGBCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199015)(66946007)(66556008)(41300700001)(83380400001)(66476007)(8676002)(316002)(478600001)(6916009)(8936002)(4326008)(86362001)(6506007)(26005)(6512007)(5660300002)(186003)(82960400001)(2906002)(38100700002)(6486002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+H6pfx14/ksCn2fIbgSQCAAvyfeZc61cZ/Xl86/50287sUUzO8gvuybGlSyK?=
 =?us-ascii?Q?sE2il1AKqd4y75MG2a4P/bAf3jOhKaHcKglzo13568SdPGIsQWTyU+0rbV2k?=
 =?us-ascii?Q?ViOyBW8ByhRQRNQh7BDkZeQn535RaCBx56/+6gKeX72j1OuV0gGpnc3GGB3w?=
 =?us-ascii?Q?XW63gAbcp5Eg2eXH0ZsOSUFNVeMu4piF7l5Q3cbXxUAZZZNHSt6t8t8FIQuk?=
 =?us-ascii?Q?eB5S9wOGDMAnuVCZ1BzmS0WZ6drBRRLFQJd/K/swNFDpinftX2PKjc8t3lw2?=
 =?us-ascii?Q?2WTJ2+J2+BWNnoIeydmHvSELly2kCG/VIDXcfblEdckAcUe0n343ttO8znI/?=
 =?us-ascii?Q?0E42XLDcN0dYSmf6lPQqpMPt4jxG0HDZzHNpYKOWflsrjG9azDisybN74QWt?=
 =?us-ascii?Q?QnLmNZJlLMaV1p7nbKvyszaDzA/XmiuNa6MTk8uSEZVXLPK7xFVzFeYRm3t4?=
 =?us-ascii?Q?epEPHkrx+m3k3kmqtGkYwhikDWY/4gm0TSYC3izBOyhiuGR2/PH6VxVx/iVx?=
 =?us-ascii?Q?4RphqlfG+L+A5xJgWLwIE2A54bfn7jDZdCiDsuD4SoIds622E5qGrgZgAfAl?=
 =?us-ascii?Q?RpXcmo/ybp093r0ySZ/IhmNiLodqGWXJ6q+6gSeP8DcaU8MYSeopA7Q9rI7U?=
 =?us-ascii?Q?W7tj5D3fftBUfOXiDJjPcPTXVkL2Z/9z1VolWwDOk3FMuRJYN0xXlIHpLjRJ?=
 =?us-ascii?Q?rVcbZSSpbtY9aYk9P6JzjUCw2gA8t9twhat7GVwBBaNdUMSgAvjAoxOzrA0L?=
 =?us-ascii?Q?c1rZvdmwW64DTclUku4GbjxAiwqXxsol7ukx4eh2KZdxMeoKyT88xC1yDzJ4?=
 =?us-ascii?Q?A3F1NjJYdHnb5OHgo/Yj36sHC5jCgsZstTztAqw8eM0NG52/EtMlM2V1Dzvi?=
 =?us-ascii?Q?Vx3XaJnodSF4+gZKIMdvUeMIgG6Go4RlIyjtR1ZeSukXEbnduUU4GWswSl58?=
 =?us-ascii?Q?9ei5paTWl8XI9MJcjvN55P+mS20WQ9pIidJ6HvV3yFRPjxsygMKLPDVaaItF?=
 =?us-ascii?Q?JyoR3b2oO1qiFKNWf6FDPoJncfzji1Eu04guFbXhJg3RSAny/clbbwAs01EY?=
 =?us-ascii?Q?M+d/h1h63Vx06DT1Tn2IVaVKfNKt/iFJGqiydlKOCFtdey3/5NmFUFSN2nBR?=
 =?us-ascii?Q?bW7E3ZFbwX1gNraV1HToFmLd4Qjk9FKBt/f3TnNNCR3OOHwuD2gWCHkGxLqG?=
 =?us-ascii?Q?NKWlvpufI3c2uRixkD8f0IUfooaYb8nTNMuuqhtIKH6pVKSlO4rrnYxOnGKV?=
 =?us-ascii?Q?A/Wf+ei5ks/UnN1mgLIdJMHp4El2mOgt8c736XNRYtKqdP9M9YZcub85nwEC?=
 =?us-ascii?Q?rQQx7+N7SHucwwE0x5FJThallSuUvAFXFyD+mYNdEhGzPvFXFlGRHo/yV9sd?=
 =?us-ascii?Q?nGI+VqOuqY0ZXSgnAPDDe2cTwhF8PVdNVb/70n//rJLivW51wX8XvXt8/KLJ?=
 =?us-ascii?Q?JDB0xBo19w9n7G4BqYLUDU9UcaMIOVHQLCylav+o8QGfHUNNQBTLaiZJJ/rH?=
 =?us-ascii?Q?DlGMJMekRZ49TtgSQBtdSQsQF1yksxLWGlq0VVDpjVho111/k5msMstVHXO8?=
 =?us-ascii?Q?WeYiqgqszMysnf6Q7KIvHp3osSwdCAdY1b7lubP+wRRsDTvj+SIPG+2AHIEv?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce017f92-a82b-478f-6b09-08daa66d1bbd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 01:01:17.6203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RD+qhSLAClC4irXKtaK7kXB7kj1m/FIVoJPav3p9Zn/gX/a9d7zGwWVjN2BMMnSOr8bEOJqvGsHvcECYuCbS6HhFFAWkwkGxdItWJviweDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6674
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
Cc: ravi.kumar.vodapalli@intel.com, intel-gfx@lists.freedesktop.org,
 balasubramani.vivekanandan@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 04, 2022 at 04:00:57PM +0300, Jani Nikula wrote:
> On Tue, 04 Oct 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Fri, 30 Sep 2022, Matt Roper <matthew.d.roper@intel.com> wrote:
> >> diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
> >> index 8f486f77609f..e823869b9afd 100644
> >> --- a/drivers/gpu/drm/i915/i915_reg_defs.h
> >> +++ b/drivers/gpu/drm/i915/i915_reg_defs.h
> >> @@ -104,22 +104,16 @@ typedef struct {
> >>  
> >>  #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
> >>  
> >> -#define INVALID_MMIO_REG _MMIO(0)
> >> -
> >> -static __always_inline u32 i915_mmio_reg_offset(i915_reg_t reg)
> >> -{
> >> -	return reg.reg;
> >> -}
> >> +typedef struct {
> >> +	u32 reg;
> >> +} i915_mcr_reg_t;
> >>  
> >> -static inline bool i915_mmio_reg_equal(i915_reg_t a, i915_reg_t b)
> >> -{
> >> -	return i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b);
> >> -}
> >> +#define INVALID_MMIO_REG _MMIO(0)
> >>  
> >> -static inline bool i915_mmio_reg_valid(i915_reg_t reg)
> >> -{
> >> -	return !i915_mmio_reg_equal(reg, INVALID_MMIO_REG);
> >> -}
> >> +/* These macros can be used on either i915_reg_t or i915_mcr_reg_t */
> >> +#define i915_mmio_reg_offset(r) (r.reg)
> >> +#define i915_mmio_reg_equal(a, b) (i915_mmio_reg_offset(a) == i915_mmio_reg_offset(b))
> >> +#define i915_mmio_reg_valid(r) (!i915_mmio_reg_equal(r, INVALID_MMIO_REG))
> >>  
> >
> > I don't really like losing the type safety here. The whole and only
> > purpose of typedeffing i915_reg_t as a struct instead of just u32 was
> > the strict type safety.
> 
> PS. Changes like this should really be highlighted better, in the commit
> subject and title. Now it feels like it's hidden within a big commit
> within a big series, without even mentioning it in the commit message.

This patch adds the type safety we've been missing until now.  The only
thing that's slightly less safe is the i915_mmio_reg_offset() macro
itself since it allows either of the two split register types to be
passed to the same macro for simplicity.  In theory if you had some
other structure that also had a 'reg' member it could sneak through
here, but most type mistakes (e.g., passing an integer) would still
cause a build failure.

If we want to make this specific macro more bullet-proof, while still
minimizing thrash elsewhere, we could re-write this as

    #define i915_mmio_reg_offset(r) \
         _Generic((r), i915_reg_t: (r).reg, i915_mcr_reg_t: (r).reg)

which I believe should result in a build failure if anything other than
an i915_reg_t or i915_mcr_reg_t is passed in.

We could also just split this out into separate MCR vs non-MCR offset
lookup functions as we've done with other things in this series.  But if
I recall correctly that leads to annoying thrash in stuff like
cmdparser, gvt, perf, etc. that never actually wanted registers to begin
with, but rather lists/ranges of MMIO offsets without a care for the
type of register that lives at the offset.


Matt

> 
> 
> BR,
> Jani.
> 
> 
> >
> > BR,
> > Jani.
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
