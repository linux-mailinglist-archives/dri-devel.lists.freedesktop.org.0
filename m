Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C785C544734
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 11:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817391124C3;
	Thu,  9 Jun 2022 09:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02671124BC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 09:19:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so4575182wmq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 02:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f/iBGt4xN7zzCFQSjNLwi4Ry+Kpyk/3pfrO2M9cm4OQ=;
 b=iuL3C0TadnvQ/K14iUfaUoZbhV2yRA+ewm1TptnZf8FjVkH2jA3YFNACeR+uxyeoc1
 S4b8x3fuYzWpMPSVr5L7V0up1RJ7KDmA0ZjN98Ov+EajgfD4IGrPMe5e0sU6uRY7VMus
 gmG7Fjbj3h13widN8jJRdUhxiRmAFVfblP5iWwQmB3HojvJva8WVnkZ9ALha6vKK8tl6
 Ect8ifuxuthfEzJwXbn1vIVrqFtJPGZQgV6OM5LajtL++cWYdgL4HPymBqscHTifNZPg
 4gtcf2kQ7xL72MjEFi/XZxoR5CznRHUdsDjxP+Gd87CTOE/QTzPSqfCg4BrIyZ7BW1xe
 qCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f/iBGt4xN7zzCFQSjNLwi4Ry+Kpyk/3pfrO2M9cm4OQ=;
 b=symtcpr2xjbGArhH1dG58lt0OqahJ0s28I0MUiIiy+fjCTqGbCE2lnCRxRiBJKTjOG
 CazLrkEjqi8OA9UDVjNMxrddhqffV1/amaUdtzpTSwm/4ZNIdGmxVegQXyS8GVxsnsDF
 EQs2NqYmIONDh6WralU89PboFIkCUlHtSrN1UJpbDXlwbSjGmtAhp4cyw8x7a3c2KlO2
 QHmSKUU7T1G787Pm3QC53SPyWbgGntlFOenlsbeMmWnQdpcc37jaEzmhcR4oI15gfKTn
 Tr8tA9oq1nBHtYm2aU9kys6YLEjKsLICBiic48l6/nngiq0ePq/x04xosX1LUc1+g46O
 VutQ==
X-Gm-Message-State: AOAM531eZ8HI8nj9uI9yOiSZgwNMTmDU2LgSVIb19pBTUs5MGfPVIGWY
 7lZXrL8Kq2NProWavD0pB3si4Q==
X-Google-Smtp-Source: ABdhPJwFZrOR/0oGzmAtsFR27TnfBD5OvFlRRibuQc57qR4bFY2nupml8YcXoSl2/M2wBwLsfNyzCg==
X-Received: by 2002:a1c:cc07:0:b0:397:b2f:ac59 with SMTP id
 h7-20020a1ccc07000000b003970b2fac59mr2303142wmb.157.1654766365179; 
 Thu, 09 Jun 2022 02:19:25 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 u12-20020adfdb8c000000b002119c1a03e4sm22758115wri.31.2022.06.09.02.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:19:24 -0700 (PDT)
Date: Thu, 9 Jun 2022 10:19:22 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [RESEND PATCH v3] drm/cma-helper: Describe what a "contiguous
 chunk" actually means
Message-ID: <20220609091922.6gn2nlysrpndfu4n@maple.lan>
References: <20220608135821.1153346-1-daniel.thompson@linaro.org>
 <YqDCTrlPmDZQei8Q@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqDCTrlPmDZQei8Q@phenom.ffwll.local>
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

On Wed, Jun 08, 2022 at 05:37:50PM +0200, Daniel Vetter wrote:
> On Wed, Jun 08, 2022 at 02:58:21PM +0100, Daniel Thompson wrote:
> > Since it's inception in 2012 it has been understood that the DRM GEM CMA
> > helpers do not depend on CMA as the backend allocator. In fact the first
> > bug fix to ensure the cma-helpers work correctly with an IOMMU backend
> > appeared in 2014. However currently the documentation for
> > drm_gem_cma_create() talks about "a contiguous chunk of memory" without
> > making clear which address space it will be a contiguous part of.
> > Additionally the CMA introduction is actively misleading because it only
> > contemplates the CMA backend.
> > 
> > This matters because when the device accesses the bus through an IOMMU
> > (and don't use the CMA backend) then the allocated memory is contiguous
> > only in the IOVA space. This is a significant difference compared to the
> > CMA backend and the behaviour can be a surprise even to someone who does
> > a reasonable level of code browsing (but doesn't find all the relevant
> > function pointers ;-) ).
> > 
> > Improve the kernel doc comments accordingly.
> > 
> > Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> > 
> > Notes:
> >     Am I Cc:ing the correct reviewers/maintainers with this patch? There
> >     has been no negative feedback but I've been rebasing and re-posting it
> >     for three kernel cycles now. Do I need to queue it somewhere special or
> >     get it in front of someone specific?
> 
> Occasionally stuff falls through a few too many cracks, that's all. We
> have tons of committers for drm-misc (and Lucas is one of them), but
> sometimes they shy away from pushing themselves and others see the r-b and
> assume it's already handled, and then it doesn't move :-/

No worries. Arguably I should have asked this question a little earlier
anyway.


Thanks for pushing it.


Daniel.
