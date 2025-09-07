Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 604F9B47AEB
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 13:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379C510E1AD;
	Sun,  7 Sep 2025 11:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="gTHys59t";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="ljtiOSqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05DC10E1AD
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Sep 2025 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757244185; bh=HigEj1cXFEUCAKS6b1IzogY9piyG2OdqelU9X709n7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gTHys59taCZyg7omUl4ZHsFebUuKDaN2zPpJrtChsc5wEaI5UrRD7/vXef5h3hxD2
 GBW6pHGsbLHws7hF5k71R3XvKAhkLaLIGgeByGP7G1mpSsHaA8/cZ7uEHI/hf+e+KW
 z4RaTdj6Tn9ztSk58LPGtjPXdU6LFAXyoHQQEdX63OnHzKqgWfXzdJ8Tpj2zjgK4Te
 XW1PYI/aWe7NEvS036upRY3jgY1R9xVoAo3PJhcf3MR/uvLCWjQqhxbHEDIEJCZ3Ur
 /hYPeMEVxMvqHnJWGOlV4OvV4tFPeJCA92l+TLMB2jGvkvogedfTEnBICOStCXXbli
 Y673alkYSN86Q==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 57932FB04;
 Sun,  7 Sep 2025 13:23:05 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dJfWR9cpiJyv; Sun,  7 Sep 2025 13:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1757244183; bh=HigEj1cXFEUCAKS6b1IzogY9piyG2OdqelU9X709n7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ljtiOSqfHUULLDkVc0ByzsACZCM9Zm4ajIY1JgU/gmytkFQce6+ZU8hJQyepPgxSx
 Ie895IGzPJ1yl5+z6DT7of0XxwDAXpDO9L7niW1yxWU36vXnKrwr3fLylKiO+Et4xX
 0zA3zUV3rTjC0H1ltNr8OyXF/szlgAjQfvxG1guQr6CjzsY+WLdO5nYvNEbgA+X4wq
 NJRM1v62vIqjUeNIiPtrTDrOOtJaQIExWmR8y8lxLh0qdU9JLRRmVVzwLMzyB/Junf
 bZs8QLaMQF5rRjwl20QJRm+Q1i1YSv7ZmNPqr2CPpBL0eQjn2evjLPIEZqvwhAJI8c
 WtlXXLc7f+BLQ==
Date: Sun, 7 Sep 2025 13:23:01 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/panel: visionox-rm69299: Fix clock frequency
 for SHIFT6mq
Message-ID: <aL1rFVaVCxIVaLWm@quark2.heme.sigxcpu.org>
References: <20250906-shift6mq-panel-v2-0-aa5e585d8717@sigxcpu.org>
 <20250906-shift6mq-panel-v2-1-aa5e585d8717@sigxcpu.org>
 <ba7y3qcuzkx7hinxraimuem6xnrrfxbj3giz56nq5qbmg76uno@kr6dezsumy2s>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba7y3qcuzkx7hinxraimuem6xnrrfxbj3giz56nq5qbmg76uno@kr6dezsumy2s>
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

Hi Dmitry,
On Sat, Sep 06, 2025 at 10:08:35PM +0300, Dmitry Baryshkov wrote:
> On Sat, Sep 06, 2025 at 05:17:25PM +0200, Guido Günther wrote:
> > Make the clock frequency match what the sdm845 downstream kernel
> > uses. Otherwise the panel stays black.
> > 
> > Fixes: 783334f366b18 ("drm/panel: visionox-rm69299: support the variant found in the SHIFT6mq")
> > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/panel-visionox-rm69299.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> > index 909c280eab1fb408a713d84051a1afbb252c45e8..e65697ce6f51c7d64b786da18cf44b16de5d6919 100644
> > --- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> > +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> > @@ -247,7 +247,7 @@ static const struct drm_display_mode visionox_rm69299_1080x2248_60hz = {
> >  };
> >  
> >  static const struct drm_display_mode visionox_rm69299_1080x2160_60hz = {
> > -	.clock = 158695,
> > +	.clock = 149360,
> 
> clock = (2160 + 8 + 4 + 4) * (1080 + 26 + 2 + 36) * 60 / 1000 ?

IIRC I was asked to use the resulting clock rather then the clock
formula in another driver a while back but I like that variant better
too, will change in v3.

Thanks,
 -- Guido

> 
> >  	.hdisplay = 1080,
> >  	.hsync_start = 1080 + 26,
> >  	.hsync_end = 1080 + 26 + 2,
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> With best wishes
> Dmitry
> 
