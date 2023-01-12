Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850F4666E96
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD6E10E8BE;
	Thu, 12 Jan 2023 09:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E5D10E8BC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:47:06 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id cf18so37008104ejb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=bKMn7XaWK3AYbdOybiZ3SBrnxgi4YsmhS+S0m6jKhz4=;
 b=NpSVhI0vZSEA0P97hUfS63DwQktU6AAvy8Jv8karjs6sckNotQk54R7++ucoPEcHx2
 y3IpLwfOi/ftOpH3Z8n+ZMZvDp/IP2C/ocoB/uIMNY8XHrmaZaPj6B6OltyjNx5gt/tM
 08nCmhJKOx9EmPkgVpDSM/9blck6MFypjPBbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKMn7XaWK3AYbdOybiZ3SBrnxgi4YsmhS+S0m6jKhz4=;
 b=a+s5lfhQOYQj8Xqy95O0tp6zQtvxo0pvDDKrC73+gf93sxYXVJGcUSLZkCxacmuMzB
 ZZPPn22U1JxO5OPgweO+4EFgiSu0CnsWBQpZVOK/MFFNc5U/x/XMVdJ3PE1S29lVc8T5
 644XeABe/O1yvDehi+hMoVTBFd6/bFZM7ACdIcmXPR49/jwyV4E45AdeEU/yL2q+7xJs
 cL+irwS4SVp2+HOPlcqmp9Wk1Ca9rgHaOVtognOcywK1RCTxzISLm00puGfIV8cPc8wn
 1+y4bcgsD2OKmWDnPVHZ6XvuawzPM9aRiNWmTegrcBL5RgOZSKXAuppPknXVVnYzvDR3
 1Igg==
X-Gm-Message-State: AFqh2kqZ1AMWD9BjOKdAQcdFRHKOEJT/YsUzmwR9ra4PJknOTn4cCqyG
 VJubsdqN+Cmfb3yaXgDc/U1C9A==
X-Google-Smtp-Source: AMrXdXuRfmRy/8tNVgtLcjzJN3lhYqkFHxUtWZHUA6DGr1Ye0XDmy8UvkId0Auc8duoQV0r5VWUH2A==
X-Received: by 2002:a17:906:8384:b0:838:9aba:6a06 with SMTP id
 p4-20020a170906838400b008389aba6a06mr62867411ejx.39.1673516825324; 
 Thu, 12 Jan 2023 01:47:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 kw17-20020a170907771100b0084c4b87aa18sm7240377ejc.37.2023.01.12.01.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:47:04 -0800 (PST)
Date: Thu, 12 Jan 2023 10:47:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 07/13] drm/vc4: Use the encoders' debugfs infrastructure
Message-ID: <Y7/XFqtPNq923vwn@phenom.ffwll.local>
References: <20230111173748.752659-1-mcanal@igalia.com>
 <20230111173748.752659-8-mcanal@igalia.com>
 <878ri8glee.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878ri8glee.fsf@intel.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 Alain Volmat <alain.volmat@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 11:19:37AM +0200, Jani Nikula wrote:
> On Wed, 11 Jan 2023, Maíra Canal <mcanal@igalia.com> wrote:
> > Replace the use of drm_debugfs_add_files() with the new
> > drm_debugfs_encoder_add_files() function, which centers the debugfs files
> > management on the drm_encoder instead of drm_device. Using this function
> > on late register callbacks is more adequate as the callback passes a
> > drm_encoder as parameter.
> >
> > Signed-off-by: Maíra Canal <mcanal@igalia.com>
> > ---
> >  drivers/gpu/drm/vc4/vc4_debugfs.c | 17 +++++++++++++++++
> >  drivers/gpu/drm/vc4/vc4_dpi.c     |  3 +--
> >  drivers/gpu/drm/vc4/vc4_drv.h     |  8 ++++++++
> >  drivers/gpu/drm/vc4/vc4_dsi.c     |  3 +--
> >  drivers/gpu/drm/vc4/vc4_hdmi.c    |  5 ++---
> >  drivers/gpu/drm/vc4/vc4_vec.c     |  3 +--
> >  6 files changed, 30 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
> > index 80afc69200f0..c71e4d6ec4c4 100644
> > --- a/drivers/gpu/drm/vc4/vc4_debugfs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
> > @@ -57,9 +57,26 @@ static int vc4_debugfs_dev_regset32(struct seq_file *m, void *unused)
> >  	return vc4_debugfs_regset32(drm, regset, &p);
> >  }
> >  
> > +static int vc4_debugfs_encoder_regset32(struct seq_file *m, void *unused)
> > +{
> > +	struct drm_debugfs_encoder_entry *entry = m->private;
> > +	struct drm_device *drm = entry->encoder->dev;
> 
> Feels like struct drm_debugfs_encoder_entry should be an implementation
> detail. Maybe add helpers to get the encoder/connector/etc pointer, and
> keep struct drm_debugfs_encoder_entry internal to the debugfs
> implementation?
> 
> 	struct drm_device *drm = drm_debugfs_something_encoder(m->private)->dev;
> 
> However, even cooler would be if we could have the debugfs code wrap the
> calls, and you could have:
> 
> 	static int vc4_debugfs_encoder_regset32(struct drm_encoder *encoder);
> 
> struct drm_debugfs_encoder_entry could have a function pointer for the
> above, and there'd be a simple wrapper in debugfs code:
> 
> static int encoder_debugfs_show(struct seq_file *m, void *unused)
> {
> 	struct drm_debugfs_encoder_entry *entry = m->private;
> 	struct drm_encoder *encoder = entry->encoder;
> 
> 	return entry->show(encoder);
> }
> 
> drm_debugfs_encoder_add_file() would fill in entry->show, and add that
> as the show function for core debugfs code.
> 
> Ditto for connector/crtc/etc.
> 
> This would make all of the drm debugfs functions so much nicer.

Yeah this is what I mean with "we should pass the right struct pointer
explicitly". I think at this point the drm debugfs wrappers actually start
to really pay for themselves, because you can make nice clean debugfs
show/write functions for various little things.
-Daniel

> 
> BR,
> Jani.
> 
> 
> > +	struct debugfs_regset32 *regset = entry->file.data;
> > +	struct drm_printer p = drm_seq_file_printer(m);
> > +
> > +	return vc4_debugfs_regset32(drm, regset, &p);
> > +}
> > +
> >  void vc4_debugfs_add_regset32(struct drm_device *drm,
> >  			      const char *name,
> >  			      struct debugfs_regset32 *regset)
> >  {
> >  	drm_debugfs_add_file(drm, name, vc4_debugfs_dev_regset32, regset);
> >  }
> > +
> > +void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
> > +				      const char *name,
> > +				      struct debugfs_regset32 *regset)
> > +{
> > +	drm_debugfs_encoder_add_file(encoder, name, vc4_debugfs_encoder_regset32, regset);
> > +}
> > diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
> > index f518d6e59ed6..084f7825dfa4 100644
> > --- a/drivers/gpu/drm/vc4/vc4_dpi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_dpi.c
> > @@ -265,10 +265,9 @@ static const struct drm_encoder_helper_funcs vc4_dpi_encoder_helper_funcs = {
> >  
> >  static int vc4_dpi_late_register(struct drm_encoder *encoder)
> >  {
> > -	struct drm_device *drm = encoder->dev;
> >  	struct vc4_dpi *dpi = to_vc4_dpi(encoder);
> >  
> > -	vc4_debugfs_add_regset32(drm, "dpi_regs", &dpi->regset);
> > +	vc4_debugfs_encoder_add_regset32(encoder, "dpi_regs", &dpi->regset);
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> > index 95069bb16821..8aaa8d00bc45 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.h
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> > @@ -969,12 +969,20 @@ void vc4_debugfs_init(struct drm_minor *minor);
> >  void vc4_debugfs_add_regset32(struct drm_device *drm,
> >  			      const char *filename,
> >  			      struct debugfs_regset32 *regset);
> > +void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
> > +				      const char *name,
> > +				      struct debugfs_regset32 *regset);
> >  #else
> >  
> >  static inline void vc4_debugfs_add_regset32(struct drm_device *drm,
> >  					    const char *filename,
> >  					    struct debugfs_regset32 *regset)
> >  {}
> > +
> > +static inline void vc4_debugfs_encoder_add_regset32(struct drm_encoder *encoder,
> > +						    const char *name,
> > +						    struct debugfs_regset32 *regset)
> > +{}
> >  #endif
> >  
> >  /* vc4_drv.c */
> > diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> > index 2a71321b9222..00751b76bfe0 100644
> > --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> > @@ -1424,10 +1424,9 @@ static const struct drm_bridge_funcs vc4_dsi_bridge_funcs = {
> >  
> >  static int vc4_dsi_late_register(struct drm_encoder *encoder)
> >  {
> > -	struct drm_device *drm = encoder->dev;
> >  	struct vc4_dsi *dsi = to_vc4_dsi(encoder);
> >  
> > -	vc4_debugfs_add_regset32(drm, dsi->variant->debugfs_name, &dsi->regset);
> > +	vc4_debugfs_encoder_add_regset32(encoder, dsi->variant->debugfs_name, &dsi->regset);
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 14628864487a..221cef11d4dd 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -2002,12 +2002,11 @@ static const struct drm_encoder_helper_funcs vc4_hdmi_encoder_helper_funcs = {
> >  
> >  static int vc4_hdmi_late_register(struct drm_encoder *encoder)
> >  {
> > -	struct drm_device *drm = encoder->dev;
> >  	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> >  	const struct vc4_hdmi_variant *variant = vc4_hdmi->variant;
> >  
> > -	drm_debugfs_add_file(drm, variant->debugfs_name,
> > -			     vc4_hdmi_debugfs_regs, vc4_hdmi);
> > +	drm_debugfs_encoder_add_file(encoder, variant->debugfs_name,
> > +				     vc4_hdmi_debugfs_regs, vc4_hdmi);
> >  
> >  	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> > index a3782d05cd66..4c5bd733d524 100644
> > --- a/drivers/gpu/drm/vc4/vc4_vec.c
> > +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> > @@ -716,10 +716,9 @@ static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
> >  
> >  static int vc4_vec_late_register(struct drm_encoder *encoder)
> >  {
> > -	struct drm_device *drm = encoder->dev;
> >  	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
> >  
> > -	vc4_debugfs_add_regset32(drm, "vec_regs", &vec->regset);
> > +	vc4_debugfs_encoder_add_regset32(encoder, "vec_regs", &vec->regset);
> >  
> >  	return 0;
> >  }
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
