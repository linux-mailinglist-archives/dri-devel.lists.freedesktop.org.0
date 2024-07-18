Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4123993517A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 20:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B54610EA9B;
	Thu, 18 Jul 2024 18:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="hEluMvje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1090 seconds by postgrey-1.36 at gabe;
 Thu, 18 Jul 2024 18:07:39 UTC
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B32210EA9B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 18:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=APE8v24CDfDeTKUllDKgnHGGXJJZJeBkAsUOI8cc6ss=; b=hEluMvjecZ4OxKIQ
 mBoFy9o0g6IOs2BN0jRywV4uZ/P1cijkwXGaAHDzbASbGMQ7dx2v8VdFuoNLdVzoz9VsZO3MhwDar
 e9izJ+SLrswXFaSefq1uDq8q932MNF2Pnab69kMEZJV68C4PBiRQIwTZFoPmNDzdssIXCgn6J+4kw
 NsVBg65EygRefNAO513ekoOPLC9tEQgcvkeRagUog74alI8EiarkQKgcdiccJ4PZeGo/w/bxwb1dy
 U++mWSimunqOHI9LzZehyXgkKOnnHY/BOoALKZvpXnWqWRQTyD1TTsbc4pihLHlwkA/kxHXRYvbeg
 LJeJoj5qN5YDbCt69A==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1sUVFq-00CLPp-0U;
 Thu, 18 Jul 2024 17:49:22 +0000
Date: Thu, 18 Jul 2024 17:49:22 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <ZplVoj6xAAaMnisJ@gallifrey>
References: <20240520125551.11534-1-linux@treblig.org>
 <g4nwb5cgcg2wff4qogzayhdrj3omneeusfjqmdupghy6zlji5m@kp55dmkbj6k3>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <g4nwb5cgcg2wff4qogzayhdrj3omneeusfjqmdupghy6zlji5m@kp55dmkbj6k3>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:48:31 up 71 days, 5:02, 1 user, load average: 0.06, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> On Mon, May 20, 2024 at 01:55:51PM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> > has dropped all the users of the struct bridge_init from the
> > exynos_dp_core, while retaining unused structure definition.
> > Later on the driver was reworked and the definition migrated
> > to the analogix_dp driver. Remove unused struct bridge_init definition.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,
  Do you know who is likely to pick this one up?  I think all
my other drm patches have found their way into -next.

Thanks,

Dave

> 
> -- 
> With best wishes
> Dmitry
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
