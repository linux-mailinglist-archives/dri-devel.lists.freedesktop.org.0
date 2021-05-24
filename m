Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3538E19C
	for <lists+dri-devel@lfdr.de>; Mon, 24 May 2021 09:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD176E10D;
	Mon, 24 May 2021 07:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D796E10A;
 Mon, 24 May 2021 07:26:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98B5260E0B;
 Mon, 24 May 2021 07:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621841199;
 bh=NGwm1jJDkT8JccuOTPA1VPiOYYl1wMQVrKM3KE+Lle0=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=O0bc9TnCRB9a5C8Qas5eSkTrPf0c7AZhULO+boeX9JvnAj7gCxTkW7P+IO9xKJsEl
 3WTl7e2di3txH6cG3jNwBq3AJSU1k8VUaNmbD+QqIINCr68Jgq102oGcBJl+TBaYlF
 b/GinEWG/8Vdov0OMBoI5ERXuQ38D7io/mDARFAz5C7jF3Dh6LaYOkbmJWfnGWBi7Y
 EI8u1g6Iikj51NMnSDrXrdvfCB98dnwNq5rRgelzNy1M65CrUBCK9HZcgki2TC8CYr
 G7et06woWEEZyQmiY8CcQpmAnz57EapjBLofP7IjsBb92QB4HP82N1dIWGL+OB3vtX
 Bun56XJXALeYg==
Date: Mon, 24 May 2021 12:56:34 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Jonathan Marek <jonathan@marek.ca>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 01/13] drm/dsc: Add dsc pps header init function
Message-ID: <YKtVKn/R5wF4nkHj@vkoul-mobl.Dlink>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-2-vkoul@kernel.org>
 <YKfR1BGWa/CVYg9w@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKfR1BGWa/CVYg9w@phenom.ffwll.local>
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

On 21-05-21, 17:29, Daniel Vetter wrote:
> On Fri, May 21, 2021 at 06:19:30PM +0530, Vinod Koul wrote:
> > We required a helper to create and set the dsc_dce_header, so add the
> > dsc_dce_header and API drm_dsc_dsi_pps_header_init
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  drivers/gpu/drm/drm_dsc.c | 11 +++++++++++
> >  include/drm/drm_dsc.h     | 16 ++++++++++++++++
> >  2 files changed, 27 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c
> > index ff602f7ec65b..0c1b745090e2 100644
> > --- a/drivers/gpu/drm/drm_dsc.c
> > +++ b/drivers/gpu/drm/drm_dsc.c
> > @@ -49,6 +49,17 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header)
> >  }
> >  EXPORT_SYMBOL(drm_dsc_dp_pps_header_init);
> >  
> > +void drm_dsc_dsi_pps_header_init(struct dsc_dce_header *dsc_header)
> 
> Kerneldoc for anything exported to drivers please, also ideally for all
> the structures.

Sorry missed that, will add

-- 
~Vinod
