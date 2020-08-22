Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDEA24E68F
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D726E44D;
	Sat, 22 Aug 2020 09:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E94E86E12E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 01:20:45 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s16so2553371qtn.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 18:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=alqsuLjRIbrXdAlbW9c5s4ZuhliUbHIiXWeuZS/UsUs=;
 b=r+YcyHmi3Ads0IkAGbm6Tg7P9IhT1PkYzo3vq5csouLShpbtuxhXK9HpZilSnPjShT
 HBCzedlhq9HehZ+1ohCVUxuoySSAN7sG7EX+3276XxYxNoq1sQ6K2mILIazpXJ6rD54I
 d0WdsaaWUCHtoeYeOzMLONgoeMnuBgau7T2AFLc0QaSihvWaL6df0UKMAp5avYCmUdzj
 znphFfwkX2pKhKn9kt4JI3mRvb/fK0vYZLooarVtDoqd4v9Uw1hqzKokv8ZWCZTyGqCj
 8FfHNinLZ5lkgB1V/7cOejmLMtzUgmOggUlIL3kZFLkrg4p2PwdYuB6DAjUg4X67zMts
 G3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=alqsuLjRIbrXdAlbW9c5s4ZuhliUbHIiXWeuZS/UsUs=;
 b=UvukJ9yXHBrXrLQnO1y9DKnx4ug26BhIeTCb88R0lQylWGJ2+mHw/NnF1cwm5zAt9F
 XbKf/AHuC62O8eg8Y+Kfl2Zo/pEOiR+dybU2YHDwlHWJNZqBEJv+XOeWSrGNP6Grk5g/
 Evj+hMMECQxt16Y0jQ34x/BgmZemontEU3Wfx1cqMKPVeSBNxvfIdyVVLFZmWGI4WjuP
 Bb9Vw0h6iRFlPTfcoTSMfT0QOr4XPeEgyehZqGg3MS+/kwzHx5PiPqCj/sYmrIa/2uq9
 Nk2dWHmWdXQYyrUvhlFD8QrV71mNqsUaf/BjvE68uT06rcZ/QCTWnB0f/ZG2JbfM6rhj
 JNsA==
X-Gm-Message-State: AOAM533Cr2SQ+XEtLs542trnYVYtli3Qot01aOu/Cj10N5U6S6fo/6SM
 MOh/6cXQg/ywaa20xCfS7do1nA==
X-Google-Smtp-Source: ABdhPJxeDssrajw6JuftjZhYmAJqOu1G4f1+FhQrVW3m1ZYoHj7OW72Xb2a+KA1xkh/G9V0FMhugVA==
X-Received: by 2002:ac8:78d:: with SMTP id l13mr5351576qth.188.1598059244689; 
 Fri, 21 Aug 2020 18:20:44 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id w2sm3150752qkf.6.2020.08.21.18.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 18:20:44 -0700 (PDT)
Date: Fri, 21 Aug 2020 21:20:37 -0400
From: Qian Cai <cai@lca.pw>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
Message-ID: <20200822012036.GA26224@lca.pw>
References: <20200608025340.3050-1-cai@lca.pw>
 <20200608031442.GP22208@pendragon.ideasonboard.com>
 <20200608031622.GQ22208@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200608031622.GQ22208@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 08, 2020 at 06:16:22AM +0300, Laurent Pinchart wrote:
> Hi Qian,
> 
> I forgot to mention, I think the subject line should be
> 
> drm/rcar-du: Make DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU
> 
> Could you please let me know if you're OK with these two small changes ?

Laurent, this patch is still not in the latest linux-next. Can you take a look?

> 
> On Mon, Jun 08, 2020 at 06:14:43AM +0300, Laurent Pinchart wrote:
> > On Sun, Jun 07, 2020 at 10:53:40PM -0400, Qian Cai wrote:
> > > There is no need to select DRM_RCAR_WRITEBACK if DRM=n which just make
> > 
> > s/DRM=n/DRM_RCAR_DU=n/ here.
> > 
> > > the generated .config a bit ugly.
> > > 
> > >  # ARM devices
> > >  #
> > >  # end of ARM devices
> > > 
> > >  CONFIG_DRM_RCAR_WRITEBACK=y
> > > 
> > >  #
> > >  # Frame buffer Devices
> > > 
> > > Let DRM_RCAR_WRITEBACK depend on DRM_RCAR_DU instead.
> > > 
> > > Signed-off-by: Qian Cai <cai@lca.pw>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > No need to submit a v3 if you agree with the above change, I'll fix it
> > in my tree.
> > 
> > > ---
> > >  drivers/gpu/drm/rcar-du/Kconfig | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > > index 0919f1f159a4..3304b41f5611 100644
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -48,3 +48,4 @@ config DRM_RCAR_VSP
> > >  config DRM_RCAR_WRITEBACK
> > >  	bool
> > >  	default y if ARM64
> > > +	depends on DRM_RCAR_DU
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
