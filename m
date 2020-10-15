Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F91528FABB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 23:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F8289C9A;
	Thu, 15 Oct 2020 21:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CB089C9A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 21:39:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b8so328183wrn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 14:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VkmG945wFzG5BfT2NTULPP0qWg5gV/q6DoFymEiqOoY=;
 b=cygGspVM6eMrfeBQrTbykOtkdrMODza1BGfnjZKt3Hlfhewv1KqiRHCxd7/dV80lDh
 gfHrBKx02l1fTFd4kefE5hHUmqvtevZE+9DC5RvExje/CJ7kF4uUhzAal5YKJpHcXqZx
 DJ2SbsQPPzBbmn3smx5ncNgPGskdNrhMGnPrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VkmG945wFzG5BfT2NTULPP0qWg5gV/q6DoFymEiqOoY=;
 b=MqMcqijSpK4iB7rbUl6o0YQ2VpnX2giftFDxHvZXYdVRzfTNzulMPdpoe+qhLzFhoy
 vKzYqrHkOAM4l9qpBCadfZ/7Iurkhy9g82URPkQQtEtnq4EBR6ZtJSeHBhzIeiholWsC
 kaI1SGnd5mP0rXdO+zNmsRq2BXaKWm9qqH/LTy3h3bB+kkLrmESAcyE2XK89zT50y1By
 3gRSbfJXehJc9sKO2rVF/kXuLwSuOi+DfvxLQjdqIZpD0rXQpvd9ZEUxHFAJ6aovZGYd
 h+iMkR4rVxaNxX5MYWs8uLzDnzxR4hehcM42XEqOazKgetUSEsGlhlt3Z2nF1hVnGzLU
 41mg==
X-Gm-Message-State: AOAM532bt30Rl7WrGh6bJXFCrHXM4LCgJq3C+OdGSJgcR6/XFJiUVXJy
 ANIPbg8oJBPsNq/fLMahwha/tA==
X-Google-Smtp-Source: ABdhPJzPrO6RkyHXwphh3j6TPS/10ZzEaI84CS0+Gw5CeeQCAHg17C4Vmy/9tYHT/bH8/Rb0mIfFhg==
X-Received: by 2002:adf:8462:: with SMTP id 89mr252640wrf.389.1602797973652;
 Thu, 15 Oct 2020 14:39:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b15sm807134wrm.65.2020.10.15.14.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 14:39:32 -0700 (PDT)
Date: Thu, 15 Oct 2020 23:39:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH 1/3] drm/vkms: Set preferred depth correctly
Message-ID: <20201015213930.GD401619@phenom.ffwll.local>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201012125922.utoehriuovbs66bk@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201012125922.utoehriuovbs66bk@smtp.gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 09:59:22AM -0300, Melissa Wen wrote:
> On 10/10, Daniel Vetter wrote:
> > The only thing we support is xrgb8888.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Melissa Wen <melissa.srw@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> > index 726801ab44d4..eb4007443706 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -124,7 +124,7 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
> >  	dev->mode_config.max_height = YRES_MAX;
> >  	dev->mode_config.cursor_width = 512;
> >  	dev->mode_config.cursor_height = 512;
> > -	dev->mode_config.preferred_depth = 24;
> > +	dev->mode_config.preferred_depth = 32;
> nice catch!
> 
> >  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
> >  
> >  	return vkms_output_init(vkmsdev, 0);
> > -- 
> > 2.28.0
> >
> Thanks, 
> 
> Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

I merged the first 2 patches of this series, but noticed that you didn't
reply with a r-b tag on the 3rd patch. Is that intentional or just
oversight?

Thanks, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
