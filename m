Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C612135FCF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9446E941;
	Thu,  9 Jan 2020 17:51:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C01489DEA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 19:04:52 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id bd4so1488159plb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2020 11:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WuNXLxL+1sMtBQwv2K4eumVoHhxOxma8tmqoVufR3Bo=;
 b=DXG1ZtsIcjDxidZu/VinHygy2TnOOMWJCkW68fgKSoLzbNQuosPVTfeFICr2WeZO/o
 jEz4NM8gdLtyyjADFqAgi02ttsRMWhyxHSbz5o4LuO+7Qy+BKExbX7qFidFEVzrX+vZK
 KCmZzBTJoCG6A7mi/a10GpnVfSa38TbwRFAE5dP+gHSQ8rrsUTznxoim7ZKKbcFH5jgf
 EpOSKff4YTs5tRjobJ+zZoXvlf/3o0g9v6X+GCj1MkzoIb8HMcjcLlj7XGqVNh8GXcsC
 LANolYpfTQ6cB62xGw/ttyTOV93kTgQ0xpDe0xCWHoFl4YEWonrWZ0wIMwCzLzJBXHUe
 FtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WuNXLxL+1sMtBQwv2K4eumVoHhxOxma8tmqoVufR3Bo=;
 b=hl/x2s3GNFIXcXyo4tqzCS0bAKjLtUVDT89LJpuDsGWxNExXjq76F4Y81D2T4iO+vx
 L6KNrv21XUIf3hLJsHEZ2pvvmT/iykynxssKPeO9tPHMU+eMaslzhIoCT7P1IVeTwXM5
 hZH5FSz4zpHlxC7YeJgdgxetSvXtQxmNEF01INFeeE7va3cy/viNylSOUDWsm3B6siYb
 xQybxrgKGRmE09IUiDOLVX1PmFFvxW9/6ICMRmjhzmOXVYESsI7K0cYmpq9wfRjyw3IY
 xlYBYNTmRmOzh5JqVA/km2kzebeUu2sb7bLeUT0DrADi0xXZi+dce6krf7d4P6aIXC6U
 GA2g==
X-Gm-Message-State: APjAAAVbGRnCtdIFqkD6tZ9lAUATVpgMyhHAYwGV0W4bhctTTy3BH5mC
 WVir7oeZDGqOrwtmQu2qnhww2A==
X-Google-Smtp-Source: APXvYqzdDG6/dcVOe88U3YPEnVAhW9Km4txL2BJeQX8JE8h8UKIkAzsn0ducTYHl8ZhNVbgcVE0nwg==
X-Received: by 2002:a17:902:b701:: with SMTP id
 d1mr5876172pls.280.1578510291991; 
 Wed, 08 Jan 2020 11:04:51 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id u127sm4731367pfc.95.2020.01.08.11.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 11:04:51 -0800 (PST)
Date: Wed, 8 Jan 2020 11:04:48 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Brian Masney <masneyb@onstation.org>, Fabio Estevam <festevam@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/msm: support firmware-name for zap fw
Message-ID: <20200108190448.GI1214176@minitux>
References: <20200108013847.899170-1-robdclark@gmail.com>
 <20200108013847.899170-2-robdclark@gmail.com>
 <20200108184850.GA13260@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108184850.GA13260@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Thu, 09 Jan 2020 17:51:28 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 08 Jan 10:48 PST 2020, Jordan Crouse wrote:

> On Tue, Jan 07, 2020 at 05:38:42PM -0800, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > Since zap firmware can be device specific, allow for a firmware-name
> > property in the zap node to specify which firmware to load, similarly to
> > the scheme used for dsp/wifi/etc.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 32 ++++++++++++++++++++++---
> >  1 file changed, 29 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 112e8b8a261e..aa8737bd58db 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -26,6 +26,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >  {
> >  	struct device *dev = &gpu->pdev->dev;
> >  	const struct firmware *fw;
> > +	const char *signed_fwname = NULL;
> >  	struct device_node *np, *mem_np;
> >  	struct resource r;
> >  	phys_addr_t mem_phys;
> > @@ -58,8 +59,33 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> >  
> >  	mem_phys = r.start;
> >  
> > -	/* Request the MDT file for the firmware */
> > -	fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> > +	/*
> > +	 * Check for a firmware-name property.  This is the new scheme
> > +	 * to handle firmware that may be signed with device specific
> > +	 * keys, allowing us to have a different zap fw path for different
> > +	 * devices.
> > +	 *
> > +	 * If the firmware-name property is found, we bypass the
> > +	 * adreno_request_fw() mechanism, because we don't need to handle
> > +	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
> > +	 *
> > +	 * If the firmware-name property is not found, for backwards
> > +	 * compatibility we fall back to the fwname from the gpulist
> > +	 * table.
> > +	 */
> > +	of_property_read_string_index(np, "firmware-name", 0, &signed_fwname);
> > +	if (signed_fwname) {
> > +		fwname = signed_fwname;
> > +		ret = request_firmware_direct(&fw, signed_fwname, gpu->dev->dev);
> > +		if (ret) {
> > +			DRM_DEV_ERROR(dev, "could not load signed zap firmware: %d\n", ret);
> > +			fw = ERR_PTR(ret);
> > +		}
> > +	} else {
> > +		/* Request the MDT file for the firmware */
> > +		fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> > +	}
> > +
> 
> Since DT seems to be the trend for target specific firmware names I think we
> should plan to quickly deprecate the legacy name and not require new targets to
> set it. If a zap node is going to be opt in then it isn't onerous to ask
> the developer to set the additional property for each target platform.
> 

For the zap specifically I agree that it would be nice to require this
property, but for non-zap firmware it seems reasonable to continue with
the existing scheme.

Regards,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
