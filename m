Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 490CA97EB43
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 14:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60D810E261;
	Mon, 23 Sep 2024 12:05:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Dq3RiJOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B380310E261
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 12:05:49 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53660856a21so4008923e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727093148; x=1727697948; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=EBTgURoGPTyrhgd6NQeAv1e3dBtkib11KOrN0R+DkBw=;
 b=Dq3RiJOhC4bT8RZ9JcEWeLGA1d7yewd3rFnjGNhbm52aqnpUV2t7RcqrLmIRSCgReH
 2fBQtmEOioeMCncoBBUaLHNq27e7oIen0hY3qQbLTC2Tcw2X1uTx7cR5TTsC5UVRbe3T
 +lt52zEpKvcqJx7UzSrFT3i/NzAew5T/VDb3YIZPLoUHmA/buaTq9ysCdB1v+NiNArqb
 vlJchXjNjOz85V/uOEARJ7dVGwm3MxUMXvCYwG/kGEG2InWRt+CI6nwNQw0mEdhR5/ds
 t0abSRDau7b2uCzPy8JoYPJTKr/YTUgfxUmTWHylCBFrImuhNv58L7HP09wAueaB06Bo
 DPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727093148; x=1727697948;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EBTgURoGPTyrhgd6NQeAv1e3dBtkib11KOrN0R+DkBw=;
 b=wniMcA5qu4IhiIHadYLor43ZfZdKcm5whT7VYbLBlVDbE5gVHUcNoXJeSIKzVmY8aB
 xD/5+js2MDv3nd9Wl0ckzF5J2fw1DxeUoBUByfYG6ZcdncwcMp/VYbR+dBE6EuN0iAo3
 1Ewp0rqb3vuhvbFAakz/jPHxbGKYWPM8JWiSeRGmVhzOB0xHajXBCz8s2JNqEBU1+oP8
 F/QKwFTld1Woi6es/CgECImMLFnSpEo6GFHB2FDaKun4NRbv7ydwO6BloSCR3Vf9RZyF
 sSrCiHWj57rWnH5zYaUlENuI92FT1X26z+ghkArcUIqUhmh0Ty99lnGxxuoT/iFrGgTt
 BfGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3AO74JSxwKTPe2IEImnbKRHruNTfVC7GxPCrxCIWCc5D1jKbfSgLv3+GAq2juAxdZXYCxIGwR+KY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9EnoqnCo2JCtqEAh9TNvk9zb0bMHvi0PO24Yl17Pnv5TIDKHs
 tVZeORK9evYPlpHmIFrHHe9rc85iHfk6JSb0PwceTraZJmmoPfkOM7KV7FSxPz4=
X-Google-Smtp-Source: AGHT+IF87RZHyg+xLF+L1KVhytFSTf/2dPJElNXmzxO6NbHWZslgfHpMSp+V+MKtmnMLCF7TRmG8vQ==
X-Received: by 2002:a05:6512:3a8c:b0:536:54df:bff2 with SMTP id
 2adb3069b0e04-536ac341b8dmr6330824e87.54.1727093147752; 
 Mon, 23 Sep 2024 05:05:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5368709687asm3275901e87.147.2024.09.23.05.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 05:05:47 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:05:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: zhaoxiong lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, dianders@chromium.org, hsinyi@google.com, 
 awarnecke002@hotmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] drm/panel: jd9365da: Modify Kingdisplay and
 Melfas panel timing
Message-ID: <zqmpodwfmabxpjtyhbbuiqkkgaggv3sif7iidv4epjswfw7chp@jomwcvififxk>
References: <20240915080830.11318-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240915080830.11318-2-lvzhaoxiong@huaqin.corp-partner.google.com>
 <CAA8EJpp1ZHFFY9M3i47d658Q-m3ggJzhxSRUapX=tckgdAwcNg@mail.gmail.com>
 <CA+6=WdS4i3tWei=zzfS_-OW8hs-tgnifOLbNCirGpTx61xEtCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+6=WdS4i3tWei=zzfS_-OW8hs-tgnifOLbNCirGpTx61xEtCQ@mail.gmail.com>
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

On Mon, Sep 23, 2024 at 05:22:11PM GMT, zhaoxiong lv wrote:
> On Mon, Sep 16, 2024 at 1:11 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Sun, 15 Sept 2024 at 10:10, Zhaoxiong Lv
> > <lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
> > >
> > > In order to meet the timing, remove the delay between "backlight off"
> > > and "display off"
> > >
> > > Removing variables: display_off_to_enter_sleep_delay_ms
> >
> > This is not enough. If this is a fix, then describe why the original
> > commit is incorrect, provide necessary explanation, details, etc.
> > Otherwise it looks as if you are removing the delay that was necessary
> > for other panels
> >
> > Also if this is a fix, it should be properly notated with the Fixes
> > tag, maybe cc:stable, etc.
> >
> > In its current state: NAK.
> 
> hi Dmitry
> 
> Our machine encountered an issue where, after entering S3 in the black
> screen state, there is a probability that the screen remains black
> after waking up. It seems that the DRM runtime resume has not yet
> completed, but the system has already started the suspend process.
> After reducing the delay for disable, this issue no longer occurs,
> Therefore, under the premise of meeting the timing requirements, we
> removed the delay between "backlight off" and "display off".
> 
> Previously,  "backlight_off_to_display_off_delay_ms" was added between
> "backlight off" and "display off"  to prevent "display off" from being
> executed when the backlight is not fully powered off, which may cause
> a white screen. However, we removed this
> "backlight_off_to_display_off_delay_ms" and found that this situation
> did not occur. Therefore, in order to solve the problem mentioned
> above, we removed this delay.

This should go to the commit message, rewritten to use imperative
language, with the appropriate Fixes tags.

> 
> This is the timing specification for the two panels:
> 1.  Kingdisplay panel timing spec:
> https://github.com/KD54183/-JD9365DA_Power-On-Off-Sequence_V0120240923
> 2.  LMFBX101117480 timing spec: https://github.com/chiohsin-lo/TDY-JD_LIB
> 
> thanks
> 
> >
> > >
> > > Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> > > ---
> > >  drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 6 ------
> > >  1 file changed, 6 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > index 44897e5218a6..2f8af86bc2a0 100644
> > > --- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > +++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
> > > @@ -31,7 +31,6 @@ struct jadard_panel_desc {
> > >         bool reset_before_power_off_vcioo;
> > >         unsigned int vcioo_to_lp11_delay_ms;
> > >         unsigned int lp11_to_reset_delay_ms;
> > > -       unsigned int backlight_off_to_display_off_delay_ms;
> > >         unsigned int display_off_to_enter_sleep_delay_ms;
> > >         unsigned int enter_sleep_to_reset_down_delay_ms;
> > >  };
> > > @@ -69,9 +68,6 @@ static int jadard_disable(struct drm_panel *panel)
> > >         struct jadard *jadard = panel_to_jadard(panel);
> > >         struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard->dsi };
> > >
> > > -       if (jadard->desc->backlight_off_to_display_off_delay_ms)
> > > -               mipi_dsi_msleep(&dsi_ctx, jadard->desc->backlight_off_to_display_off_delay_ms);
> > > -
> > >         mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> > >
> > >         if (jadard->desc->display_off_to_enter_sleep_delay_ms)
> > > @@ -858,7 +854,6 @@ static const struct jadard_panel_desc kingdisplay_kd101ne3_40ti_desc = {
> > >         .reset_before_power_off_vcioo = true,
> > >         .vcioo_to_lp11_delay_ms = 5,
> > >         .lp11_to_reset_delay_ms = 10,
> > > -       .backlight_off_to_display_off_delay_ms = 100,
> > >         .display_off_to_enter_sleep_delay_ms = 50,
> > >         .enter_sleep_to_reset_down_delay_ms = 100,
> > >  };
> > > @@ -1109,7 +1104,6 @@ static const struct jadard_panel_desc melfas_lmfbx101117480_desc = {
> > >         .reset_before_power_off_vcioo = true,
> > >         .vcioo_to_lp11_delay_ms = 5,
> > >         .lp11_to_reset_delay_ms = 10,
> > > -       .backlight_off_to_display_off_delay_ms = 100,
> > >         .display_off_to_enter_sleep_delay_ms = 50,
> > >         .enter_sleep_to_reset_down_delay_ms = 100,
> > >  };
> > > --
> > > 2.17.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
