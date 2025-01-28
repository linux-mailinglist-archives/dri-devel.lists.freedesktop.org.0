Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12A6A21546
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 00:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3214310E714;
	Tue, 28 Jan 2025 23:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dWqBg7NP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F59D10E714
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 23:46:01 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-543d8badc30so3079968e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738107960; x=1738712760; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nFuHb/P6nPbu1zZspDQ3/ljZpmz0fvUEKrzsUNOliXY=;
 b=dWqBg7NP5IMJysPzBEkV+b0L8ppiCS1MdXR5MEk0K7Y6o170YTMHA3GJrw8du6TwJ6
 PiufAZwmgDRgPylIl7jOaUNqtFzbZDlRMv68uEcS/e/rj6W+y0Bhrf0En9GM1v9DNc0r
 /FT9yJnKQDvRyD2XWk1WAG1/4pHwewXJhzvU3HGVP8H+KDi8UH2Xeh4AKd/ZSylA/pul
 CLjClojB+CwwBvIZsqDxtrQmkgDPQPxg9D7Hrnm0e39pAM6uYZBDT80qyaeXQwN8Fzpq
 O6qJUi3vcm86ZZfHj2qTsemqU7wDD+JmtQcbCfwlYAWz0jNtC/+opD2k7A5hz0OMl0ZY
 /S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738107960; x=1738712760;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFuHb/P6nPbu1zZspDQ3/ljZpmz0fvUEKrzsUNOliXY=;
 b=bdT6yNhwf4HD/x/XymowxhcQPaJKkBF4co+ZfPkML7wd/HKmm6+EZOaica2JSiKPz5
 yjmN0yk294SAUZRyV7+BB8ZEtiN8Amp9UJJOZJenL6NoexmNUoHf4uGov4sOPPEy45kJ
 maFV5ZoV3XWBM9Jh75P425DNjKisL/rzpP7AmAhoIgafKDwCBD8f7295CfR+HkdM76b4
 zzRjjVzoBC+4O1lpfq+ztHogaBBJH3RFA3ZvdbmlS5QvN5dsKBVbRCuT/EpalXTlyL0G
 fEfRzzmmHDJWirG7471b45+eX5dpnREpl/nro4HoeiJ3mMhtOCLay5JSqCN8isTiWTv8
 wkgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmLV93clLzj3ZncVfRIuwdMVjv8HOIOQnVO4h+YIFAv1srm+fW6O/DSFKNQRu0NnNOkLa/1dGxA9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlRXg96zqvw3ktX02lwAkEEXQ3OoOz0mZSh5t+yAC60ePuNIMg
 QtAsOTgo1ap+IZmyjr7hyx14peaLimTixX5NdizXGXjfbk/+LIDHQ8DabafH6lY=
X-Gm-Gg: ASbGnctG4KeXJV8do8sT2LGAmHgsJXk+EA+qfdKf9JtV86EJGE6h+WG57kHgtAzIsyb
 EULm9fNmo8Wurb9vwCJT8IIK0+Zfk4yne1EASQUi4PBDPrstHAtbgAuUbfXHrVrVcqosj/XdEA1
 /AD191N/ahuKd3FZIGR9NETNEZcnNYAgfi3SEzpYmMlMS5ZkfCrR5MZQfpUqpiaegpK7BSaWzae
 0HnhLxQTDILY61U2O4K4eU8EyAxrpcF2UueYrgnrrJprUQg8D99hrEqYY6iE1DMSrz3HSdkgomI
 y3Q+u+kLuRshqJkTUYH/ZXoO/gPAYQ2n5UkuvOX8jWEIBfDTNRv5NpO1Un24K3JnXfdL/2Y=
X-Google-Smtp-Source: AGHT+IFQljYE+nSqiPfZjnDHImYIKqGCYT54cl7R256wJ17qnKat3BDRLHkO05Zja5bsXtecQoanaQ==
X-Received: by 2002:a05:6512:118b:b0:542:28b4:2732 with SMTP id
 2adb3069b0e04-543e4be947emr283432e87.19.1738107959894; 
 Tue, 28 Jan 2025 15:45:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c8229297sm1779568e87.48.2025.01.28.15.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 15:45:58 -0800 (PST)
Date: Wed, 29 Jan 2025 01:45:56 +0200
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
Subject: Re: [PATCH v3 09/10] drm/bridge: allow limiting I2S formats
Message-ID: <7nawswhaddasa4a2sytwspq62s4a2di3ukemfqsc3ueh2lftzl@kjq42eoq3ram>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-9-5b5b2d4956da@linaro.org>
 <bd2eou4qqxwqn3bypvpvkcrw56m555jwlnlni277phds7vfklh@aacywioenkkq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd2eou4qqxwqn3bypvpvkcrw56m555jwlnlni277phds7vfklh@aacywioenkkq>
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

On Tue, Jan 28, 2025 at 05:11:16PM +0100, Maxime Ripard wrote:
> On Sun, Jan 26, 2025 at 03:29:14PM +0200, Dmitry Baryshkov wrote:
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index b55e80a57758e8b652eac0cd01cb245a04e221f5..d16af5fe90cb48f6671e798d9dee61a359c9233f 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -920,6 +920,11 @@ struct drm_bridge {
> >  	 */
> >  	int hdmi_audio_max_i2s_playback_channels;
> >  
> > +	/**
> > +	 * @hdmi_audio_i2s_formats: supported I2S formats, optional
> > +	 */
> > +	u64 hdmi_audio_i2s_formats;
> > +
> 
> We should document what the default value is if it's optional.

"The default is to allow all formats supported by the corresponding
I2S bus driver." Does that sound fine from your POV?

> 
> Once fixed:
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime



-- 
With best wishes
Dmitry
