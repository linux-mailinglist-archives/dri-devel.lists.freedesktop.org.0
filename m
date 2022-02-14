Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5514B57DA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 18:04:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D96B10E18D;
	Mon, 14 Feb 2022 17:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770D810E18D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 17:04:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 74CFA1F43C01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644858262;
 bh=NlFXDH8kQ9ySp/ZkYTmafpS6muY77CAzntMho3HND+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jzwv3Gw4X97fyF+f2hAckZL2F8qWYjF1SexnFnFj39pOD3CAO9j5EFNcSnjQpM5fP
 SwGMd+RZHcGuEVBkIGXsT8MEj1FxVJ/apFROrT1JV2fDatKFemPWxft5yJJPfXiZmg
 quNOr+j2vkadhCteMDI5IJJmdoTTv9SfiON2PU6DAgVuxjnh8UwaKzRHJGvaAUbmFP
 CB8GHBeVmg11cCuoaCnqX4LpqNCb1f0PobM7HJmA6feTEEPvBlhMhGxF/LEqdrxAHe
 lvqUwcAbfAuR5kuElFcbALRrlTtN24GNge0UObBRHk0uiY4C01q4/cR7yQYYZovbb5
 k71p5LNy2GGfw==
Date: Mon, 14 Feb 2022 12:04:14 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 8/9] drm/panfrost: Add Mali-G57 "Natt" support
Message-ID: <YgqLjmBHNFrg+7Lp@maud>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
 <20220211202728.6146-9-alyssa.rosenzweig@collabora.com>
 <e9d3425f-2e26-1bc1-da98-a7836da68d76@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9d3425f-2e26-1bc1-da98-a7836da68d76@arm.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > index b8865fc9efce..1a0dc7f7f857 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_issues.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
> > @@ -258,6 +258,11 @@ enum panfrost_hw_issue {
> >  
> >  #define hw_issues_g76 0
> >  
> > +#define hw_issues_g57 (\
> > +	BIT_ULL(HW_ISSUE_TTRX_2968_TTRX_3162) | \
> > +	BIT_ULL(HW_ISSUE_TTRX_3076) | \
> > +	BIT_ULL(HW_ISSUE_TTRX_3485))
> 
> Do you know whether you have an r0p0 or an r0p1 Natt? Only the r0p0 has
> the 3485 issue, and we might be lucky and it's the r0p1 that's "in the
> wild".

Sadly, I believe I have an r0p0. I don't know if future spins of the
same SoC would be bumped up, but I'm skeptical.

> It would be good to annotate these lists with the hardware revisions
> when there is a difference.

Sure.
