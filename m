Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3853A04814
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 18:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D33C10E750;
	Tue,  7 Jan 2025 17:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="unLjMMsd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0767510E750
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 17:23:58 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5401e6efffcso18321674e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 09:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736270577; x=1736875377; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zboR9jxXWmS9nIKBK9iPIhlKaknh9eCFtmUHqCsTTvc=;
 b=unLjMMsd+FAigEQ1pkBuTFJMDgSZR1ik/9efM1FRAv7lF77hcR7iCHZJyXkijO8xea
 QjmL3qPCjemegilWEYXWtKgQdjxPLJC6Rkw7UWgXq/OdojegNhUuh38nLivB4Ih/eb4R
 LovCjEGsAUv6jQdhMQehBveaRlvnX8+dqW7K2xlfYw0uvG/3NMp7snQw01pkM7mbL7te
 4JuJiT33WKMgi33jbe6EJNWbuegfqNUg7eSbkJWIH7OW1ITMVC8V8I2wSOGLCD8YxxAU
 57Kpk7c6kn69EsdvPX6EIBMgIjiHeGO29DOzqG4b5ml6vkLxd12yVE27Y/debrf+b+jt
 R7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736270577; x=1736875377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zboR9jxXWmS9nIKBK9iPIhlKaknh9eCFtmUHqCsTTvc=;
 b=ByQzorEFekylLQDzHjV7a5TlU6qOsft4qm/zABUnkZNmPYE8sIrAVbkVesYqRZqG0x
 UmyCMzlJugaGoshSKqE6tc8pO+245R/WnneJMj1GjYkTCG3/hStd4nflMBHsW+u2l9GF
 BvBcgqJYaRY9o+MMgJpHSBBq1CsVFHUh36CARsZRIU2V3tijLyKvki2PLQZAozLO+N02
 /TVDV0288UbQxCIY+1HWIHUBR4z/3s5NBGniqGjtymMwvebooRgjxniMGONzqO4l8ENu
 A9ebaTIISS/BaYDS3jZVOJkXsjH5Eix5/fYSOjpejjLTqc/FW2hwhok+jtco3rVDPYnY
 UOcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXskq6ZDKNZMjOfqO9BjoiBS251u0Y0oSIzxMCkNDPiTNyQA9lGgdcHV+7rIVHzuBan3EBdta3J/QQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydzBTyir2/QbsZbptRDv4hltCSTkW9aYJm2XDe2haPoxwRDx58
 bo73e4eYzbbbyRKUpZFPwYEbTmkYQyJTFpkXpo9nxxc0LPl/xVG4d+ighsFi4dAxDCFFKO8uewS
 n
X-Gm-Gg: ASbGnctSCG7oLKmzZtSYZpUKsRl1QscEZMDaaYGJ5Rf0DezOvzOmG0ixjxdas+/ky3c
 ck/RND+7f9apQ6Vb8XTCs2lNhw0Tu50sAGl0WX8jHlRqeL9fQZUZeDVlmI9j6L9w70UFgvRmoQd
 lBIF+VvCha2i4yeDb+x+0hprUyGOFaRFCB2c0a6aguDVzraMUaYV59hTaijZcX7T2+c/cC75Cst
 O+csE5/1uN0lPbNh2spDAf2skATJrCda9MkxUDQhlr5biVW0aPUZ2+us4ZfkE0g5hvo5hTM+WIJ
 NizDBmoLDWvXJuBbFGBSNf1ipl7FbeZacq7z
X-Google-Smtp-Source: AGHT+IGvLYSubVs2fChWFVU/Wkf9NhM8/TX2JdTfshGGANZuYXroF2EFVu51KDZSl6fKLPh2OpNGug==
X-Received: by 2002:a05:651c:a0b:b0:302:2c61:a1d3 with SMTP id
 38308e7fff4ca-304685e6bbfmr183658241fa.36.1736269158266; 
 Tue, 07 Jan 2025 08:59:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045b082e47sm58790381fa.111.2025.01.07.08.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:59:17 -0800 (PST)
Date: Tue, 7 Jan 2025 18:59:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC/RFT 4/9] drm/vc4: hdmi: switch to generic CEC helpers
Message-ID: <hh64mzfrzdxpeyce4fcj6lnd5axpvrv2t7qfi46uvpcp7erwi7@s5sr5vp5s7ot>
References: <20241225-drm-hdmi-connector-cec-v1-0-b80380c67221@linaro.org>
 <20241225-drm-hdmi-connector-cec-v1-4-b80380c67221@linaro.org>
 <20250107-intrepid-tuna-of-growth-5f53c5@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-intrepid-tuna-of-growth-5f53c5@houat>
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

On Tue, Jan 07, 2025 at 03:34:35PM +0100, Maxime Ripard wrote:
> On Wed, Dec 25, 2024 at 01:10:12AM +0200, Dmitry Baryshkov wrote:
> > Switch VC4 driver to using CEC helpers code, simplifying hotplug and
> > registration / cleanup. The existing vc4_hdmi_cec_release() is kept for
> > now.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/vc4/Kconfig    |  1 +
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 92 ++++++++++++++++++++----------------------
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
> >  3 files changed, 44 insertions(+), 50 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
> > index 6cc7b7e6294a1bfa54137ca65296cd47e46b1e1e..360fbe755951cc40fecb4f9d643a096a6cf92b8e 100644
> > --- a/drivers/gpu/drm/vc4/Kconfig
> > +++ b/drivers/gpu/drm/vc4/Kconfig
> > @@ -34,6 +34,7 @@ config DRM_VC4_HDMI_CEC
> >  	bool "Broadcom VC4 HDMI CEC Support"
> >  	depends on DRM_VC4
> >  	select CEC_CORE
> > +	select DRM_DISPLAY_HDMI_CEC_HELPER
> >  	help
> >  	  Choose this option if you have a Broadcom VC4 GPU
> >  	  and want to use CEC.
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..3086c2ad3bb2e8fafdc1f37ba985aa5785d49f9a 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -32,6 +32,7 @@
> >   */
> >  
> >  #include <drm/display/drm_hdmi_audio_helper.h>
> > +#include <drm/display/drm_hdmi_cec_helper.h>
> >  #include <drm/display/drm_hdmi_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> >  #include <drm/display/drm_scdc_helper.h>
> > @@ -400,16 +401,8 @@ static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
> >  	 * the lock for now.
> >  	 */
> >  
> > -	if (status == connector_status_disconnected) {
> > -		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> > -		return;
> > -	}
> > -
> >  	drm_atomic_helper_connector_hdmi_hotplug(connector, status);
> >  
> > -	cec_s_phys_addr(vc4_hdmi->cec_adap,
> > -			connector->display_info.source_physical_address, false);
> > -
> >  	if (status != connector_status_connected)
> >  		return;
> >  
> > @@ -2388,7 +2381,7 @@ static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
> >  	struct vc4_hdmi *vc4_hdmi = priv;
> >  
> >  	if (vc4_hdmi->cec_rx_msg.len)
> > -		cec_received_msg(vc4_hdmi->cec_adap,
> > +		cec_received_msg(vc4_hdmi->connector.cec.adapter,
> >  				 &vc4_hdmi->cec_rx_msg);
> >  
> >  	return IRQ_HANDLED;
> > @@ -2399,14 +2392,14 @@ static irqreturn_t vc4_cec_irq_handler_tx_thread(int irq, void *priv)
> >  	struct vc4_hdmi *vc4_hdmi = priv;
> >  
> >  	if (vc4_hdmi->cec_tx_ok) {
> > -		cec_transmit_done(vc4_hdmi->cec_adap, CEC_TX_STATUS_OK,
> > +		cec_transmit_done(vc4_hdmi->connector.cec.adapter, CEC_TX_STATUS_OK,
> >  				  0, 0, 0, 0);
> 
> Shouldn't we create helpers for those just like we did to deal with phys_addr?

For phys_addr it was required as we were wrapping locking, adapter and
notifier calls. I can add wrappers for these calls too, of course.

-- 
With best wishes
Dmitry
