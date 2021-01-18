Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE592FA074
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 13:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BC889E06;
	Mon, 18 Jan 2021 12:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83BD89E06
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 12:52:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c5so16349802wrp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 04:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=D1pyQppAA+wvHZoSq97i6wx6SxOqkfmcx7zBXfJmsUE=;
 b=ccLPRV7H6TPy5FaDHa6HRufGAmVTtUcPP0aNjYLtg7BXTDqPoAL1KqRBVJ8YssQe/q
 SkJeenWJs9M0OHU4D60tMaVsxRqbR/TpwkR+twarnfpbxmrItmT+5oZs954YiaGq4t7K
 mo2P5xg0rwUDd3yTU/qU14hKBc4MKtJOwKmPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=D1pyQppAA+wvHZoSq97i6wx6SxOqkfmcx7zBXfJmsUE=;
 b=JQE13dQGEFATLrVxUWZ3LvLdPHgvEAK5Jsg+f4eTNCSf1uorMWvgpWx2CywVV7+aLN
 vyduZjmdF6UKTMUr9SDZM9GUlxQI3Uml9y3pmxsIbmg9amcOi/YdRLP8RwgcFI3XR+UG
 Cj4u/dAKBPWVsLPWp2uMjxlLb+tEE3/b1QXIDzbrvfgvMij74uBDP3spi86GQt1jjcu1
 SHuwXIf3GUUOxBf7gJb8Uc/ZlNVYhjg3IUgphBn+YgMNibgR2wKt6RUbndcA43Wgmzuc
 QfS6pbJa4CPwMstaqlhc1Typgf/YQcswTWtIFBJBhiiuxXy0wQgzk/qMko6eH5ONtX3y
 5lFw==
X-Gm-Message-State: AOAM533ZRQr8lHSO4T0oHfor2RRY8RjCroo4hWwxdDn4i1zzMPJe6MhV
 xMKLrUg7IJsBpHWpisMAIVXCOQ==
X-Google-Smtp-Source: ABdhPJzxIHaZac3kc6pq7MGlzbkyFJIIStSfDrlGhD0mywUk57483NkSG1rJNT2xYmJt1OLnql1nDQ==
X-Received: by 2002:adf:f4d0:: with SMTP id h16mr26228451wrp.30.1610974377438; 
 Mon, 18 Jan 2021 04:52:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i18sm30793367wrp.74.2021.01.18.04.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:52:56 -0800 (PST)
Date: Mon, 18 Jan 2021 13:52:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/3] drm/ingenic: Register devm action to cleanup encoders
Message-ID: <YAWEpjU6BmeK8deo@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
References: <20210117112646.98353-1-paul@crapouillou.net>
 <20210117112646.98353-3-paul@crapouillou.net>
 <YAVYUzR9+ic5lEjE@pendragon.ideasonboard.com>
 <1BO4NQ.1RZAXLMVC01T@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1BO4NQ.1RZAXLMVC01T@crapouillou.net>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, od@zcrc.me,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 11:37:49AM +0000, Paul Cercueil wrote:
> Hi Laurent,
> =

> Le lun. 18 janv. 2021 =E0 11:43, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> a =E9crit :
> > Hi Paul,
> > =

> > Thank you for the patch.
> > =

> > On Sun, Jan 17, 2021 at 11:26:45AM +0000, Paul Cercueil wrote:
> > >  Since the encoders have been devm-allocated, they will be freed way
> > >  before drm_mode_config_cleanup() is called. To avoid use-after-free
> > >  conditions, we then must ensure that drm_encoder_cleanup() is called
> > >  before the encoders are freed.
> > =

> > How about allocating the encoder with drmm_encoder_alloc() instead ?
> =

> That would work, but it is not yet in drm-misc-fixes :(

Well I think then we should only fix this in drm-misc-next. Adding more
broken usage of devm_ isn't really a good idea.

If you want this in -fixes, then I think hand-roll it. But devm_ for drm
objects really is the wrong fix.
-Daniel

> =

> -Paul
> =

> > >  Fixes: c369cb27c267 ("drm/ingenic: Support multiple panels/bridges")
> > >  Cc: <stable@vger.kernel.org> # 5.8+
> > >  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > >  ---
> > >   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > =

> > >  diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > > b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  index 368bfef8b340..d23a3292a0e0 100644
> > >  --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> > >  @@ -803,6 +803,11 @@ static void __maybe_unused
> > > ingenic_drm_release_rmem(void *d)
> > >   	of_reserved_mem_device_release(d);
> > >   }
> > > =

> > >  +static void ingenic_drm_encoder_cleanup(void *encoder)
> > >  +{
> > >  +	drm_encoder_cleanup(encoder);
> > >  +}
> > >  +
> > >   static int ingenic_drm_bind(struct device *dev, bool
> > > has_components)
> > >   {
> > >   	struct platform_device *pdev =3D to_platform_device(dev);
> > >  @@ -1011,6 +1016,11 @@ static int ingenic_drm_bind(struct device
> > > *dev, bool has_components)
> > >   			return ret;
> > >   		}
> > > =

> > >  +		ret =3D devm_add_action_or_reset(dev, ingenic_drm_encoder_cleanup,
> > >  +					       encoder);
> > >  +		if (ret)
> > >  +			return ret;
> > >  +
> > >   		ret =3D drm_bridge_attach(encoder, bridge, NULL, 0);
> > >   		if (ret) {
> > >   			dev_err(dev, "Unable to attach bridge\n");
> > =

> > --
> > Regards,
> > =

> > Laurent Pinchart
> =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
