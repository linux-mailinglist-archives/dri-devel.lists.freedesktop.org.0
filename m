Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BDD65BD8A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 11:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A8210E3C5;
	Tue,  3 Jan 2023 10:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2463610E3D0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 10:00:20 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d4so20896392wrw.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 02:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3QJ5kz00M0Fq2wOuITR0KSlnyxlf4/lYf1ctiAp7D6g=;
 b=aapEzqNHGtg17J51QPb2mSXBdNH6RNr7VcGiJKkOM7l/xnVyY5/lNKED+AzO+AqovC
 8mXicaTOX+5w9LZL40DFYIa5ATWeIySSXIFMbJqezSwvYXuJTwnyjTKGOc+/YyQ2Tbvo
 bVBm7urwzaMLdGxPF/jcDWNWIihcyVXrT2IX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3QJ5kz00M0Fq2wOuITR0KSlnyxlf4/lYf1ctiAp7D6g=;
 b=0KudoqkdQklzl19+EBqLMqavIbkF/BQAF5tRFZC8ihpylHiljBzRwVacvduHl8qwCt
 jVe1SvrKugYArpO1cc9Pz8QeonB8xTTvf66X/adtItm1ZhL7pk2Z2ZtoEpMi4dZZGEaI
 XZmhUwleazLqKz4Yse3FQsOXvHVtiQ4EyblwvcsRkTuullAEdB0OSyCnsdr1j9jxIIi7
 IDQwhYj2gbrjt93uAiYggCvj8OO1IHG6ZV/WXTWvFUV2LhpK3qnFUSKM4bXEpF+meDTC
 2WVl3lNmR0Eqf9q9HshTwxzFAW/4YDA2PKCllVYdHUV5vlcuC+9/EgBm+0RSKT98inJx
 r4yg==
X-Gm-Message-State: AFqh2kpT3JzggH1EGDYqlbexJws8y84cLJRCLhQMsjLdwzQhyPeS/ZlQ
 0IoAK/nNFTnz/IKEZ0NkIUIF/g==
X-Google-Smtp-Source: AMrXdXujadXnoMa7e8fOk5Ugnb2Emh6OLpv9fPr46AUW2G/STKoOXnmu8faYPiplbRzrvDDCn/LD4w==
X-Received: by 2002:a05:6000:806:b0:293:1868:3a14 with SMTP id
 bt6-20020a056000080600b0029318683a14mr6852666wrb.0.1672740018603; 
 Tue, 03 Jan 2023 02:00:18 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 j10-20020adff54a000000b002420d51e581sm31086661wrp.67.2023.01.03.02.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 02:00:17 -0800 (PST)
Date: Tue, 3 Jan 2023 11:00:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vc4: Check for valid formats
Message-ID: <Y7P8rtqLIHPQQxfs@phenom.ffwll.local>
References: <20230102135757.262676-1-mcanal@igalia.com>
 <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
 <3db30278-c106-cb3b-e581-9165446857f1@igalia.com>
 <33e42652-cec2-83eb-5000-5358f3f456e3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33e42652-cec2-83eb-5000-5358f3f456e3@suse.de>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Emma Anholt <emma@anholt.net>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 02, 2023 at 04:21:55PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.01.23 um 15:29 schrieb Maíra Canal:
> > Hi,
> > 
> > On 1/2/23 11:20, Thomas Zimmermann wrote:
> > > Hi
> > > 
> > > Am 02.01.23 um 14:57 schrieb Maíra Canal:
> > > > Currently, vc4 is not checking valid formats before creating a
> > > > framebuffer, which is triggering the IGT test
> > > > igt@kms_addfb_basic@addfb25-bad-modifier to fail, as vc4 accepts
> > > > to create a framebuffer with an invalid modifier. Therefore, check
> > > > for valid formats before creating framebuffers on vc4 and vc5 in
> > > > order to avoid creating framebuffers with invalid formats.
> > > > 
> > > > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > > > ---
> > > >   drivers/gpu/drm/vc4/vc4_kms.c | 23 ++++++++++++++++++++++-
> > > >   1 file changed, 22 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/vc4/vc4_kms.c
> > > > b/drivers/gpu/drm/vc4/vc4_kms.c
> > > > index 53d9f30460cf..5d1afd66fcc1 100644
> > > > --- a/drivers/gpu/drm/vc4/vc4_kms.c
> > > > +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> > > > @@ -500,6 +500,27 @@ static struct drm_framebuffer
> > > > *vc4_fb_create(struct drm_device *dev,
> > > >         mode_cmd = &mode_cmd_local;
> > > >     }
> > > > 
> > > > +    if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> > > > +                      mode_cmd->modifier[0])) {
> > > > +        drm_dbg_kms(dev, "Unsupported pixel format %p4cc /
> > > > modifier 0x%llx\n",
> > > > +                &mode_cmd->pixel_format, mode_cmd->modifier[0]);
> > > > +        return ERR_PTR(-EINVAL);
> > > > +    }
> > > 
> > > This might be a stupid question, but why doesn't
> > > drm_fbgem_fb_create() do this test already? It seems like a
> > > no-brainer and *not* testing for the plane formats should be the
> > > exception.
> > 
> > I thought the same initially, but then I found this mention on the TODO
> > list [1]. So, it
> > is not possible to test it on drm_gem_fb_create() because, for
> > non-atomic, checking
> > drm_any_plane_has_format() is not possible since like the format list
> > for the primary plane
> > is fake and we'd therefor reject valid formats.
> 
> Thanks for the pointer to the docs.
> 
> I see two options:
> 
> 1) Testing for atomic modesetting can be done via
> drm_core_check_feature(dev, DRIVER_ATOMIC).  If true, drm_gem_fb_create()
> can further test for the plane formats. For non-atomic drivers, just skip
> the format test.

^^  this sounds like a good idea. Also note that for these checks the
right check is actually drm_drv_uses_atomic_modesetting, since it's about
the driver interface. DRIVER_ATOMIC is more about whether the driver
interface actually upholds the atomic/tearfree guarantees userspace
expects.
-Daniel

> 
> 2) As an alternative, we could invert the IGT test and explicitly allow any
> format to be allocated. Almost no drivers currently bother with the format
> test anyway. And DRM will already fail if userspace attaches a framebuffer
> to a plane with incompatible formats. [1]  (I'd personally prefer this
> option, but I'm not sure if there's any consensus on that.)
> 
> With either implemented, the TODO item could be remvoed AFAICT.
> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_plane.c#L789
> 
> > 
> > I'm not sure if anything changed since this was written, but that was
> > the reason that I
> > decided to introduce the check in the driver instead of the API.
> > 
> > [1]
> > https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/todo.rst#n279
> > 
> > Best Regards,
> > - Maíra Canal
> > 
> > > 
> > > Best regards
> > > Thomas
> > > 
> > > > +
> > > > +    return drm_gem_fb_create(dev, file_priv, mode_cmd);
> > > > +}
> > > > +
> > > > +static struct drm_framebuffer *vc5_fb_create(struct drm_device *dev,
> > > > +                         struct drm_file *file_priv,
> > > > +                         const struct drm_mode_fb_cmd2 *mode_cmd)
> > > > +{
> > > > +    if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> > > > +                      mode_cmd->modifier[0])) {
> > > > +        drm_dbg_kms(dev, "Unsupported pixel format %p4cc /
> > > > modifier 0x%llx\n",
> > > > +                &mode_cmd->pixel_format, mode_cmd->modifier[0]);
> > > > +        return ERR_PTR(-EINVAL);
> > > > +    }
> > > > +
> > > >     return drm_gem_fb_create(dev, file_priv, mode_cmd);
> > > >   }
> > > > 
> > > > @@ -1033,7 +1054,7 @@ static const struct drm_mode_config_funcs
> > > > vc4_mode_funcs = {
> > > >   static const struct drm_mode_config_funcs vc5_mode_funcs = {
> > > >     .atomic_check = vc4_atomic_check,
> > > >     .atomic_commit = drm_atomic_helper_commit,
> > > > -    .fb_create = drm_gem_fb_create,
> > > > +    .fb_create = vc5_fb_create,
> > > >   };
> > > > 
> > > >   int vc4_kms_load(struct drm_device *dev)
> > > > -- 
> > > > 2.38.1
> > > > 
> > > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
