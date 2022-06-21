Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2456C552C51
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E831112800;
	Tue, 21 Jun 2022 07:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E3E112800;
 Tue, 21 Jun 2022 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655797701; x=1687333701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1o3EYbTpbgd5QipYqiu/4GXWQ1ks5o+4O3O/+SFVrXk=;
 b=JTZSBUCJ7aDV/kh3bGgG7/gE7AbsHcPvUhpE5Lpc3auCQ4S884p21/Nd
 DUma+WphhS56GQ2YNuk4EpzTGDP3JDAIsz9LvcpdSr6eIdfICJCrRiPRK
 EXuHgGDmuAuvFW53ta+m0ki4qI6TOPEGphjps47F0R/YtwkST5lFsdA2Q
 lAKOzeiez1OCsPCcc6EKoUKFGYXy3/uTSHOmV6RnKb98zrQmcaeOma+TF
 C6o0dxndD5fzHdcAqumJEKVEw+jKKLHBQVTJr5HDjbUrJjrkuis3eiaHK
 HNxCEvPpWEyGFsA/R9Gs9XQjHhFvY+3BV72knEtH2r7g933TBsl7A42vT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="278825074"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="278825074"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 00:48:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="729727279"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by fmsmga001.fm.intel.com with SMTP; 21 Jun 2022 00:48:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Jun 2022 10:48:17 +0300
Date: Tue, 21 Jun 2022 10:48:17 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <YrF3wfumVi3q3bFj@intel.com>
References: <20220621123656.7a479ad9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220621123656.7a479ad9@canb.auug.org.au>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 21, 2022 at 12:36:56PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/gpu/drm/xlnx/zynqmp_disp.c: In function 'zynqmp_disp_create_planes':
> drivers/gpu/drm/xlnx/zynqmp_disp.c:1260:17: error: implicit declaration of function 'drm_plane_create_zpos_immutable_property'; did you mean 'drm_plane_create_scaling_filter_property'? [-Werror=implicit-function-declaration]
>  1260 |                 drm_plane_create_zpos_immutable_property(&layer->plane, i);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                 drm_plane_create_scaling_filter_property
> drivers/gpu/drm/xlnx/zynqmp_disp.c:1262:25: error: implicit declaration of function 'drm_plane_create_alpha_property'; did you mean 'drm_plane_create_color_properties'? [-Werror=implicit-function-declaration]
>  1262 |                         drm_plane_create_alpha_property(&layer->plane);
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                         drm_plane_create_color_properties
> cc1: all warnings being treated as errors
> 
> Presumably caused by one of the commits that dropped includes from
> drm-ctrc.h.
> 
> I have used the drm-misc tree from next-20220620 for today.

Sorry about that. Looks like my .config was missing some
dependencies of the zynqmp driver so it wasn't getting built.
I'll cook up a fix.

-- 
Ville Syrjälä
Intel
