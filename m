Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A8F4E996E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AE210EC90;
	Mon, 28 Mar 2022 14:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE29810EC90
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 14:26:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w21so16097801wra.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uFpy1BaNDElGPENkoNelRc37WwyIAqLuxylMjKkOE6M=;
 b=cn5P4zc4OEungJCVM5SAAZwq0z1TyQARhWp2SDJG1+vy2DWU3ZjpkECMZfSihjZlWr
 AbhnJ5g9Vv4SJxMaHeraIvcD17DSP4FuZY3u4fSZZLG074Jd1jeSjy6TAmbcTzRp/h6f
 psfPgYw1vx8MLafej8Vr/zY92VuOEB1ESD7yo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uFpy1BaNDElGPENkoNelRc37WwyIAqLuxylMjKkOE6M=;
 b=i93ZPP+x1RlLgDUsME1TcEgPMB7aktPreyU9vZd6N/IdIIh2SiL0Aq5JqHYcH/YpPz
 +SrFyqpa3fiirrwVpxrzGwn1O5/+BB1KkY7PwojJ/rlDPOk4I3+AG5Lh68eBZ7EpEzc2
 1P5aI6dYyzGkAG3kdd3MZ7QZ7anpCT31tfXXRcAsVu/eP5MT3RKrp7ytGZNfuaDqt7Gv
 icozaaibSrMOBYXQXVnJ3O7HPk0NArwO9QHOZ24FZzs0JCLVOUUOioSbMFXO889mj3I7
 J1rUSj/iqLhuKruwF69nVnDQ81Ih/x8hPci3fAubOQ2ETMFHSGuLTmZigCeC+yBSGxWz
 Au4w==
X-Gm-Message-State: AOAM531YICekz01CzzbYqrHceK5B/KacltsHXEdqNKpSVHFW1xyp8AaW
 Z5bmmxzoEc5m2oxY4WF+hV5Sjg==
X-Google-Smtp-Source: ABdhPJzKSSaNy6x7oybqj+hN6uR14OHVIoRJjHmrbVsuIunJeuBXFHxJPNjxHK1oe5ti8REaSKJtSw==
X-Received: by 2002:a5d:68ce:0:b0:204:1a8c:749a with SMTP id
 p14-20020a5d68ce000000b002041a8c749amr23875772wrw.392.1648477601398; 
 Mon, 28 Mar 2022 07:26:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i31-20020adf90a2000000b00205ad559c87sm7541587wri.21.2022.03.28.07.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 07:26:40 -0700 (PDT)
Date: Mon, 28 Mar 2022 16:26:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH] drm: sti: don't use kernel-doc markers
Message-ID: <YkHFn0UG9FjGeowF@phenom.ffwll.local>
References: <20220326235132.25192-1-rdunlap@infradead.org>
 <20220328102116.GA2406908@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328102116.GA2406908@gnbcxd0016.gnb.st.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Aditya Srivastava <yashsri421@gmail.com>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 28, 2022 at 12:21:16PM +0200, Alain Volmat wrote:
> Hi Randy,
> 
> thanks for the patch.
> 
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Will Philippe apply this one?

Just trying to make sure this wont be lost, just acking isn't enough :-)
-Daniel

> 
> Alain
> 
> On Sat, Mar 26, 2022 at 04:51:32PM -0700, Randy Dunlap wrote:
> > Don't mark static functions as kernel-doc.
> > 
> > Prevents multiple kernel-doc build warnings:
> > 
> > drivers/gpu/drm/sti/sti_hdmi.c:187: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * HDMI interrupt handler threaded
> > drivers/gpu/drm/sti/sti_hdmi.c:219: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * HDMI interrupt handler
> > drivers/gpu/drm/sti/sti_hdmi.c:241: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * Set hdmi active area depending on the drm display mode selected
> > drivers/gpu/drm/sti/sti_hdmi.c:262: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * Overall hdmi configuration
> > drivers/gpu/drm/sti/sti_hdmi.c:340: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * Helper to concatenate infoframe in 32 bits word
> > drivers/gpu/drm/sti/sti_hdmi.c:357: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * Helper to write info frame
> > drivers/gpu/drm/sti/sti_hdmi.c:427: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * Prepare and configure the AVI infoframe
> > drivers/gpu/drm/sti/sti_hdmi.c:470: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * Prepare and configure the AUDIO infoframe
> > drivers/gpu/drm/sti/sti_hdmi.c:555: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
> >  * Software reset of the hdmi subsystem
> > 
> > Fixes: 5402626c83a2 ("drm: sti: add HDMI driver")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Aditya Srivastava <yashsri421@gmail.com>
> > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > Cc: Alain Volmat <alain.volmat@foss.st.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/sti/sti_hdmi.c |   20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> > 
> > --- linux-next-20220325.orig/drivers/gpu/drm/sti/sti_hdmi.c
> > +++ linux-next-20220325/drivers/gpu/drm/sti/sti_hdmi.c
> > @@ -183,7 +183,7 @@ void hdmi_write(struct sti_hdmi *hdmi, u
> >  	writel(val, hdmi->regs + offset);
> >  }
> >  
> > -/**
> > +/*
> >   * HDMI interrupt handler threaded
> >   *
> >   * @irq: irq number
> > @@ -215,7 +215,7 @@ static irqreturn_t hdmi_irq_thread(int i
> >  	return IRQ_HANDLED;
> >  }
> >  
> > -/**
> > +/*
> >   * HDMI interrupt handler
> >   *
> >   * @irq: irq number
> > @@ -237,7 +237,7 @@ static irqreturn_t hdmi_irq(int irq, voi
> >  	return IRQ_WAKE_THREAD;
> >  }
> >  
> > -/**
> > +/*
> >   * Set hdmi active area depending on the drm display mode selected
> >   *
> >   * @hdmi: pointer on the hdmi internal structure
> > @@ -258,7 +258,7 @@ static void hdmi_active_area(struct sti_
> >  	hdmi_write(hdmi, ymax, HDMI_ACTIVE_VID_YMAX);
> >  }
> >  
> > -/**
> > +/*
> >   * Overall hdmi configuration
> >   *
> >   * @hdmi: pointer on the hdmi internal structure
> > @@ -336,7 +336,7 @@ static void hdmi_infoframe_reset(struct
> >  		hdmi_write(hdmi, 0x0, pack_offset + i);
> >  }
> >  
> > -/**
> > +/*
> >   * Helper to concatenate infoframe in 32 bits word
> >   *
> >   * @ptr: pointer on the hdmi internal structure
> > @@ -353,7 +353,7 @@ static inline unsigned int hdmi_infofram
> >  	return value;
> >  }
> >  
> > -/**
> > +/*
> >   * Helper to write info frame
> >   *
> >   * @hdmi: pointer on the hdmi internal structure
> > @@ -423,7 +423,7 @@ static void hdmi_infoframe_write_infopac
> >  	hdmi_write(hdmi, val, HDMI_SW_DI_CFG);
> >  }
> >  
> > -/**
> > +/*
> >   * Prepare and configure the AVI infoframe
> >   *
> >   * AVI infoframe are transmitted at least once per two video field and
> > @@ -466,7 +466,7 @@ static int hdmi_avi_infoframe_config(str
> >  	return 0;
> >  }
> >  
> > -/**
> > +/*
> >   * Prepare and configure the AUDIO infoframe
> >   *
> >   * AUDIO infoframe are transmitted once per frame and
> > @@ -551,7 +551,7 @@ static int hdmi_vendor_infoframe_config(
> >  
> >  #define HDMI_TIMEOUT_SWRESET  100   /*milliseconds */
> >  
> > -/**
> > +/*
> >   * Software reset of the hdmi subsystem
> >   *
> >   * @hdmi: pointer on the hdmi internal structure
> > @@ -785,7 +785,7 @@ static void sti_hdmi_disable(struct drm_
> >  	cec_notifier_set_phys_addr(hdmi->notifier, CEC_PHYS_ADDR_INVALID);
> >  }
> >  
> > -/**
> > +/*
> >   * sti_hdmi_audio_get_non_coherent_n() - get N parameter for non-coherent
> >   * clocks. None-coherent clocks means that audio and TMDS clocks have not the
> >   * same source (drifts between clocks). In this case assumption is that CTS is

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
