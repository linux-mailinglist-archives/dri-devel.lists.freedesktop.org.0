Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AB45BB6A0
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 08:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D15C10E07E;
	Sat, 17 Sep 2022 06:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3CF10E07E
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 06:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663395433; x=1694931433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=upEne6jANUUW2HNKG46U6wKVg+lb5Ctnz/1MJFQVakw=;
 b=UebjorplePbEZdRJV1aS6L7tLEp8JPWSMHpfEmRaOaJ2SK2Ma6YFvhEH
 zPTW5FGPrR5YhCg1tTAkn0ADoQEWLwI+JDfhdaVNGCtw5bCaiJag//qy0
 fEmIoRTeTO/GKWwT6gRjilLEYaJrqZaHaxGVz2Mu2VddPMMaSCIsli/DO
 4MnAiwfQayPZ2oIxKGtiwxFPaSPO9CIqd/fqXI/aJqEt8bsnQZ4lNTdhF
 uEXbt8CmoOF+xFXjpybryP/esXrrXEGbnUkNx4XPIknvbsma8+bfFi1FJ
 7+boDeTcXPfnLyTE0hWH07QsJiIWTZiA2iDdWY8QtWzl3z0nuexrG02zq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="282156574"
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; d="scan'208";a="282156574"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 23:17:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,322,1654585200"; d="scan'208";a="617926963"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by orsmga002.jf.intel.com with SMTP; 16 Sep 2022 23:17:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 17 Sep 2022 09:17:05 +0300
Date: Sat, 17 Sep 2022 09:17:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4 0/6] dma-buf: Check status of enable-signaling bit on
 debug
Message-ID: <YyVmYXGCfTuYUsNb@intel.com>
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <d2d81ffd-2269-bdc6-0daa-8f3a99306e46@amd.com>
 <33a16b15-3d3c-7485-d021-ee2a727e5391@amd.com>
 <691c421f-1297-cd08-ea70-6750099275b1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <691c421f-1297-cd08-ea70-6750099275b1@amd.com>
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
Cc: Arunpravin.PaneerSelvam@amd.com, airlied@linux.ie, gustavo@padovan.org,
 amaranath.somalapuram@amd.com, linux-kernel@vger.kernel.org,
 Arvind Yadav <Arvind.Yadav@amd.com>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, "Yadav, Arvind" <arvyadav@amd.com>,
 shashank.sharma@amd.com, sumit.semwal@linaro.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 15, 2022 at 06:05:30PM +0200, Christian König wrote:
> Am 15.09.22 um 15:02 schrieb Yadav, Arvind:
> >
> > On 9/15/2022 5:37 PM, Christian König wrote:
> >> Is that sufficient to allow running a desktop on amdgpu with the 
> >> extra check enabled? If yes that would be quite a milestone.
> >>
> > Yes, It is running on amdgpu with extra config enabled.
> 
> In this case I will start pushing the patches to drm-misc-next. I'm just 
> going to leave out the last one until the IGT tests are working as well.

ffs Christian. intel CI blew up yet again:
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12146/shard-glk7/igt@kms_plane_lowres@tiling-y@pipe-c-hdmi-a-2.html

The last time (some ttm thing) was just a week or two ago,
so it's really getting tiresome watching you push entirely
untested stuff all the time. Would be really helpful if you
finally started to do/require premerge testing.

-- 
Ville Syrjälä
Intel
