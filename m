Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02165BCAB3
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 13:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E7010E600;
	Mon, 19 Sep 2022 11:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C3A10E600
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663586819; x=1695122819;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=JyPCRYvgmMfnN2Lq0Uq6Vyynty0vkNRyYp7K7s+7F30=;
 b=kxZQbWyPKu+hPjThE0+ldnfV/HueC1Yi6JpEQr3Bh9tbFr9Hk7Zq5YMt
 AY3zHIhPJyS8rsYnV55x5TyEjQ8dbxM+jgH3DaquruOCXSju0R998Nxui
 ju7/iR4CL+eX6kkRYtDWkUFIjYxj9WW87qeBAPnex2TZ9Mr2NO2zMx4Nj
 pRMme1JT/I3y20VXoyZ5P46yzivcBN4Deir0CsQYThY3l0edEEfFcZQFT
 XbD/iwlyonEkJrPDe8MEyYl0Uts9vHLv0LAtC12E/aXL3LinWN8vCvil1
 Z1XIeg+V89EPCtE1ivuh+3yX5IoCiS7vUgUtaV6DTL2UpRpeaxvFDpX3X A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="298103243"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="298103243"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 04:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="618454967"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 19 Sep 2022 04:26:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 19 Sep 2022 14:26:44 +0300
Date: Mon, 19 Sep 2022 14:26:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v4 0/6] dma-buf: Check status of
 enable-signaling bit on debug
Message-ID: <YyhR9OGjWVwm31Rp@intel.com>
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <d2d81ffd-2269-bdc6-0daa-8f3a99306e46@amd.com>
 <33a16b15-3d3c-7485-d021-ee2a727e5391@amd.com>
 <691c421f-1297-cd08-ea70-6750099275b1@amd.com>
 <YyVmYXGCfTuYUsNb@intel.com>
 <c958d871-9a89-3490-f5e3-3a2441926074@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c958d871-9a89-3490-f5e3-3a2441926074@gmail.com>
X-Patchwork-Hint: comment
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
Cc: shashank.sharma@amd.com, airlied@linux.ie, gustavo@padovan.org,
 Arunpravin.PaneerSelvam@amd.com, amaranath.somalapuram@amd.com,
 linux-kernel@vger.kernel.org, Arvind Yadav <Arvind.Yadav@amd.com>,
 sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, "Yadav, Arvind" <arvyadav@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 17, 2022 at 05:18:40PM +0200, Christian König wrote:
> Am 17.09.22 um 08:17 schrieb Ville Syrjälä:
> > On Thu, Sep 15, 2022 at 06:05:30PM +0200, Christian König wrote:
> >> Am 15.09.22 um 15:02 schrieb Yadav, Arvind:
> >>> On 9/15/2022 5:37 PM, Christian König wrote:
> >>>> Is that sufficient to allow running a desktop on amdgpu with the
> >>>> extra check enabled? If yes that would be quite a milestone.
> >>>>
> >>> Yes, It is running on amdgpu with extra config enabled.
> >> In this case I will start pushing the patches to drm-misc-next. I'm just
> >> going to leave out the last one until the IGT tests are working as well.
> > ffs Christian. intel CI blew up yet again:
> > https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html
> >
> > The last time (some ttm thing) was just a week or two ago,
> > so it's really getting tiresome watching you push entirely
> > untested stuff all the time. Would be really helpful if you
> > finally started to do/require premerge testing.
> 
> Well first of all sorry for causing trouble, but as I wrote above I 
> intentionally left out the last one to *not* break the IGT tests.
> 
> The patches pushed so far where just updating a bunch of corner cases 
> and fixing the selftests.
> 
> Do you have any more insight why that should affect the IGT tests?

I have no idea. You have the oopses from pstore right there.
Did you even look at them?

-- 
Ville Syrjälä
Intel
