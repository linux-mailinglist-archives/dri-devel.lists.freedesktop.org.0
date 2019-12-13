Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4832211E1FA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 11:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00816E311;
	Fri, 13 Dec 2019 10:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7226E402
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 10:33:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p17so6008374wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 02:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=MdKxwQDcuoKFAYSDAZC6hOUSSoOEIrC/rzo9IYPs5ZA=;
 b=a9dooKrDvDWJgClCu4Qk5M7FiSe0OMGrXNEZ7q/vuHHibAhRhpHla2U5nnByA1tN8p
 iEwIyQjXNYAnqsUWR06ofG2IkbyOVuaI9Zc6lxd2GFkV0COQUzmn4iMf/8eOSWQDC7Fs
 x+gbLRUtKRbhAQNR5tQahI6IJpyKBkzkVwnVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MdKxwQDcuoKFAYSDAZC6hOUSSoOEIrC/rzo9IYPs5ZA=;
 b=OVryTottTPCMOglURVfS9pkneWiaUzbU31HbKpFW6WAYKgIMmjRgz65gZGp6eJJV5p
 MUu61A8pgYMPBtlUhjiA+cvl4HgLrErbP/9G5cn+eKw0/drral34t63iqpT1vcw39Vlv
 6ik2juh3ZLMTzh1bs61ANmrSKqdcfavp3KpYk3KyvOfy0US66wchubXgRrLXm5sScvbU
 aYZSrPFX2goyB5kElYcv0dFM183biX6udkzGM27t3UG6MWMTqiJ3pGb+7nqej8pIUhSw
 pDCL1iD7BAwBA/ROJJef3a8P5d0E4L8/HZ6K3l32DTSCTnXvyaf9+vkPaAiJP+NVatdc
 1ifA==
X-Gm-Message-State: APjAAAWjNhbca/NIub3GfOjv2XbO0VmTqqgQnx4oCwjxe5tmjiEAMmzC
 R4eck0Dgz3mPgttukE5mk9BO8w==
X-Google-Smtp-Source: APXvYqyLTBtL8vXG1M8AUqCoEZ/ZzJFjgff7n4st+ggM1RY+BArCNnG1FhTgZxcGN3mZ5lX58sWmbQ==
X-Received: by 2002:a1c:964f:: with SMTP id y76mr12369866wmd.62.1576233189211; 
 Fri, 13 Dec 2019 02:33:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id m3sm9442319wrs.53.2019.12.13.02.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 02:33:08 -0800 (PST)
Date: Fri, 13 Dec 2019 11:33:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/gma500: globle no more!
Message-ID: <20191213103306.GI624164@phenom.ffwll.local>
References: <20191211120001.1167980-1-daniel.vetter@ffwll.ch>
 <87r21b2cl7.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r21b2cl7.fsf@intel.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 11, 2019 at 03:53:08PM +0200, Jani Nikula wrote:
> On Wed, 11 Dec 2019, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > globle, goblin, moblin?
> >
> > It's dead code, we lucked out.
> =

> Oh, sad to see it go. The oldest reference to globle_dev I could find
> was from 2011.
> =

> Acked-by: Jani Nikula <jani.nikula@intel.com>

Thanks for taking a look, applied.
-Daniel

> =

> >
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/gma500/mdfld_intel_display.c | 23 --------------------
> >  1 file changed, 23 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/mdfld_intel_display.c b/drivers/gpu=
/drm/gma500/mdfld_intel_display.c
> > index b8bfb96008b8..4fff110c4921 100644
> > --- a/drivers/gpu/drm/gma500/mdfld_intel_display.c
> > +++ b/drivers/gpu/drm/gma500/mdfld_intel_display.c
> > @@ -113,27 +113,6 @@ static int psb_intel_panel_fitter_pipe(struct drm_=
device *dev)
> >  	return (pfit_control >> 29) & 0x3;
> >  }
> >  =

> > -static struct drm_device globle_dev;
> > -
> > -void mdfld__intel_plane_set_alpha(int enable)
> > -{
> > -	struct drm_device *dev =3D &globle_dev;
> > -	int dspcntr_reg =3D DSPACNTR;
> > -	u32 dspcntr;
> > -
> > -	dspcntr =3D REG_READ(dspcntr_reg);
> > -
> > -	if (enable) {
> > -		dspcntr &=3D ~DISPPLANE_32BPP_NO_ALPHA;
> > -		dspcntr |=3D DISPPLANE_32BPP;
> > -	} else {
> > -		dspcntr &=3D ~DISPPLANE_32BPP;
> > -		dspcntr |=3D DISPPLANE_32BPP_NO_ALPHA;
> > -	}
> > -
> > -	REG_WRITE(dspcntr_reg, dspcntr);
> > -}
> > -
> >  static int check_fb(struct drm_framebuffer *fb)
> >  {
> >  	if (!fb)
> > @@ -164,8 +143,6 @@ static int mdfld__intel_pipe_set_base(struct drm_cr=
tc *crtc, int x, int y,
> >  	u32 dspcntr;
> >  	int ret;
> >  =

> > -	memcpy(&globle_dev, dev, sizeof(struct drm_device));
> > -
> >  	dev_dbg(dev->dev, "pipe =3D 0x%x.\n", pipe);
> >  =

> >  	/* no fb bound */
> =

> -- =

> Jani Nikula, Intel Open Source Graphics Center

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
