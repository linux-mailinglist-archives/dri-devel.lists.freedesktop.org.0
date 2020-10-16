Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43397290A2C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 19:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916E56EE32;
	Fri, 16 Oct 2020 17:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE8176EE32
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 17:02:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id b127so3686945wmb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4KE1Xv5B1caQsprfPvAbZvXMMD+vjYt993LC726Cp5Y=;
 b=XtooO3sVQ+e6iWel0CvRRTjNAR9pN5WrSoer8xjLmC9ZlVeQyh8lfcByJiulJpUJy5
 BzurtdMvocT+YN3iMykOC27675htdrod7fX5iFSQsseEeFDrsQ5uG1bXC3WUoBLOMfA1
 H9MgzvW0NwJda08bi7dB6+PmcGs1/buiPGRLgXsM09ix6mwW+TcGEv4oaZL/hm8M/Jyj
 Av5TTwF8oZXH6eJHtiacFERqjpIwcWcmnEIQ9p2fWFzQ2M9I9VLcmhzDy5hmMZ5blAqI
 9frkMvIQruhspvQZSfaUIkSAm5cGHQ9zhoOEWaKsjNN2DVumx+R/OBcda26kCzzaJahS
 vOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4KE1Xv5B1caQsprfPvAbZvXMMD+vjYt993LC726Cp5Y=;
 b=pJXN7B54NlUFyDOqiuy2xMCims2IvppVoijMjRFVeZxwJeYy3Cw3o4UX8X1ogn4r79
 kprBUXC+R3+ttIMLyTodohd9qPLfk8Lq8pZ0y9wjuIsqfzwdJRkOjl4DMYhZCF903110
 4Z5geMz1BhyIiTZl0CJq04/QO2bdSdtt3gx2I5B4FEOtXd3P37ZBPBWLy/xMFeMaNSwK
 Z58yMrsumz2UYPTZzGYk9Aj9Gs51sSJy/eU4dxExfBMCAWZ9H2JHToZYqkphghqGvIpm
 fLYdmZX+W0dM6D3cr1flYjXJ964pFSXwnPMNtVza36udEf6G3ABYfJb7Dm9/sM8wA/K4
 IsJw==
X-Gm-Message-State: AOAM5331CX//COvA/V7w8JVoDlSv35eaG0pbXXbcE/8PcYT1QkZ1r4Yj
 fKhLm4KtO5NaPY0emzZL5J8=
X-Google-Smtp-Source: ABdhPJxrBssNYFyabdKYcp/zq8Z1Ts2d8ZDj8w3o9s9HazkO45ADNnzHLOwQ7OqBpfmFXkSTSxUmwg==
X-Received: by 2002:a7b:c394:: with SMTP id s20mr4679040wmj.176.1602867730595; 
 Fri, 16 Oct 2020 10:02:10 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id w11sm4013476wrs.26.2020.10.16.10.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:02:10 -0700 (PDT)
Date: Fri, 16 Oct 2020 14:02:03 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
Message-ID: <20201016170203.53wjzysqh2p7rfry@smtp.gmail.com>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <UQ4Aj6rvEUPvWt1cTYlNRLNoawlAIGTCnzstzNkRjZkv_NH-jIpnL7Xt9kGALYGc1M0RzZS0BcdvTb0V4przOwP8UBG_Xm6q2yRjCi3n-QE=@emersion.fr>
 <CAKMK7uFtesxom12TL4MX2rAb2eW2nEmh5gfeCG-wVAyfNvkGRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFtesxom12TL4MX2rAb2eW2nEmh5gfeCG-wVAyfNvkGRw@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/16, Daniel Vetter wrote:
> On Fri, Oct 16, 2020 at 12:38 PM Simon Ser <contact@emersion.fr> wrote:
> >
> > > The only thing we support is xrgb8888.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > > index 726801ab44d4..eb4007443706 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > > @@ -124,7 +124,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
> > >       dev->mode_config.max_height = YRES_MAX;
> > >       dev->mode_config.cursor_width = 512;
> > >       dev->mode_config.cursor_height = 512;
> > > -     dev->mode_config.preferred_depth = 24;
> > > +     dev->mode_config.preferred_depth = 32;
> >
> > Are you sure xrgb8888's depth is 32 and not 24? Looking at drmdb [1], *all*
> > drivers set it to 24.
> 
> Uh there's a problem I think. Depth should indeed stay at 24, the
> problem is that fb helpers directly take that to be the bpp parameter,
> which is a different thing. And if you look at how most drivers set up
> that, they pick 32.
> 
> I guess I need to revert this here, and unconfuse the fb helpers about
> depth vs bpp.

Hi guys,

Perhaps it deserves to be pointed out: the documentation says
"preferred_depth: preferred RBG(sic) pixel depth, used by fb helpers",
and looking to fb helpers, preferred_depth is only used by
generic_setup, as bits by pixel (if I didn't miss something there).

In fact, the alpha channel is not used for final display (perhaps in the
future); however, I saw another driver with a change similar to this
here and, possibly like me, following the same misunderstanding.

Melissa
> 
> Maybe best would be to just switch over to preferred drm_fourcc format
> code, or maybe just pick this up from the first format the primary
> plane supports.
> 
> This is all getting slightly tricky and a lot more work :-/
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
