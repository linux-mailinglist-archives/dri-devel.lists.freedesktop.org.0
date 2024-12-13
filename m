Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B3D9F09FC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 11:46:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D62510EFB8;
	Fri, 13 Dec 2024 10:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DCJI7pBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC5610EFB8
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 10:46:48 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53df19bf6a9so2133543e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 02:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734086806; x=1734691606; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+riqgFIVH/DYP7alTtDkk3IJ4T8e5i4UAZc0dBAEl5E=;
 b=DCJI7pBGfaQihgmChwy9+/stmay7wR6vBXD6rb4XNFvI0qzCy1jkkDg/4ppnG/TLkg
 +aIlg3J2Livv2XL0KCK9ME7LMCx7ewxINR7u6KBRbObmwrObnlkPcEof83HeeqL0FHFU
 A5/YlS91qOrTkvNT2CbMvC7s/sQ2s74H3CZ0RCDSXQD0Wm62THCKt/qBkxajHQCbJAcB
 87Dx8/T8aWCUAKaLiQy/4cTpu2eFBerHttrTeXWHBjY2cC6OZ2pc7FSONsg3FA0fECkK
 LVljhG0N2rXHl8kPTTO3abGU75SSE19XAVOXKniFurPwVRYd82Um16HBfVEifVco/jyi
 KqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734086806; x=1734691606;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+riqgFIVH/DYP7alTtDkk3IJ4T8e5i4UAZc0dBAEl5E=;
 b=PMzNgXfxLpC3tziSnBx+JwJBr8EMJdkP9CTrdb+98S+ITAQc3dPSWsx/RcNpiO5sC3
 53d6K0gwSFSS/GCT7nna95SItzaf/dtlwwqAfdaLWXERAJTpuHEUFf+xKc+hqWvjqHck
 rOOhJAaM1IGcAuhpa3kQI4nf9fVZ0XBjyvGWx8aHEM86qRvm7A7+oDoen2Z1JVe3YLge
 pERzMHhEOxbKfRMyCydR/b6dnhRtuvhrf4v3MGJbCcp3lzf5kIVkukdtD5karW/uF+Gx
 TRrguSkXM1k+SCfxYKxZQK56+Fvi86wErtkWZ1sVsGfY/faGc6i3FQkTjeyfsyIkTdF8
 Y4SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPktA2UIGQ3S04rKPEph0kWdP/mL+5BkfEfPeTdOBozlicBszGtxM8Wu9EkkOKwUMWJReO3MHsF14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzwKk2xtuktbWDwKrgvjj31kSHZVzFepRBIazp0qpdX+YrAR49F
 d47n6m23tjnfevyxTbO7gR9JLy9n/e1s7hbuc8zxqPR41bMMdzDlAoVE6y37Pgs=
X-Gm-Gg: ASbGncuyQXCTjoD+pK+/Y3Xpu6sTf2P3Q1g99PtIoz+2bywdU5/Y/KKMqETv+buFbrv
 eTnBOXdjaofhgC3ywcyemXOnrsT6gwueHeHHpsp6wQ+uNWuSXlVNXeNIKZgYymZYQjMQQVwiTrd
 zAXtDWpE/MrmH9QbQyAysjgDiONbQwOadiul0hXq6DybJVjDw15mJ7+rUdqlgVRjINtYAiIAumo
 DnXt0eRsw8ipKk/ghKMxaIXH9Jbfg9KKBiQHQdnruKrTPwUTgvP7vHwAzueTEuPsw9tikTW8qIj
 lort/fqjV1HOcrcQ/MIpPF3GC4T+aO+7mVXg
X-Google-Smtp-Source: AGHT+IEm2vjvZgyAC46ioS4Iv92mUkMOa1/KLmQj2/Q0eiaT5naaA+czP9WRIBuvwOukMwZlXd0o4w==
X-Received: by 2002:a05:6512:3189:b0:540:2fe6:6a3a with SMTP id
 2adb3069b0e04-54099b72e3emr649543e87.57.1734086806386; 
 Fri, 13 Dec 2024 02:46:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e369298bbsm2226481e87.13.2024.12.13.02.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 02:46:45 -0800 (PST)
Date: Fri, 13 Dec 2024 12:46:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>, 
 "treapking@google.com" <treapking@google.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
 atomic_enable()
Message-ID: <4q2jncpnmeu7ytuyuv5pjzurh3ai5663jmu2we6cebuad2r3r5@tfb6hf6unioc>
References: <20241212055110.1862487-1-xji@analogixsemi.com>
 <vkrl7om7hepboovp2uivcnernia3ygqwrj3y3kkjydeclwvrk5@7tkdc4etkcjs>
 <BY5PR04MB673977C1DB1E774CB261C119C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY5PR04MB673977C1DB1E774CB261C119C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
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

On Fri, Dec 13, 2024 at 10:06:36AM +0000, Xin Ji wrote:
> Hi Dmitry, thanks for the review, I made some changes which change ENABLE to DESIRE
> in .atomic_disable(), I'll upstream it after testing. Thanks!

- Please don't top-post.

- You still didn't explain, why do you want to do this change of HDCP
  status. Could you please provide an explanation before sending the
  next iteration?

> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Thursday, December 12, 2024 5:18 PM
> > To: Xin Ji <xji@analogixsemi.com>
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart
> > <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>;
> > Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>;
> > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie
> > <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Bernie Liang
> > <bliang@analogixsemi.com>; Qilin Wen <qwen@analogixsemi.com>;
> > treapking@google.com; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
> > atomic_enable()
> > 
> > CAUTION: This email originated from outside of the organization. Please do not
> > click links or open attachments unless you recognize the sender, and know the
> > content is safe.
> > 
> > 
> > On Thu, Dec 12, 2024 at 01:51:10PM +0800, Xin Ji wrote:
> > > When user enabled HDCP feature, userspace will set HDCP content to
> > > DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will update
> > HDCP
> > > content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down stream
> > support
> > > HDCP feature.
> > >
> > > However once HDCP content turn to
> > DRM_MODE_CONTENT_PROTECTION_ENABLED
> > > userspace will not update the HDCP content to
> > > DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor disconnect.
> > 
> > It seems you've ingored a part of the previous review comment. It's the
> > userspace who triggers the ENABLED -> UNDESIRED transition, not the kernel
> > side. The change to move HDCP handling to atomic_enable() looks fine, the
> > change to disable HDCP is not (unless I misunderstand something).
> > 
> > >
> > > So, anx7625 driver move hdcp content value checking from bridge
> > > interface .atomic_check() to .atomic_enable(), then update hdcp
> > > content according from currently HDCP status. And also disabled HDCP
> > > in bridge interface .atomic_disable().
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 74
> > > ++++++++++++++---------
> > >  1 file changed, 46 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index a2675b121fe4..f96ce5665e8d 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct anx7625_data
> > *ctx)
> > >                                TX_HDCP_CTRL0, ~HARD_AUTH_EN & 0xFF);
> > > }
> > >
> > > +static void anx7625_hdcp_disable_and_update_cp(struct anx7625_data
> > > +*ctx) {
> > > +     struct device *dev = ctx->dev;
> > > +
> > > +     if (!ctx->connector)
> > > +             return;
> > > +
> > > +     anx7625_hdcp_disable(ctx);
> > > +
> > > +     ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > +     drm_hdcp_update_content_protection(ctx->connector,
> > > +                                        ctx->hdcp_cp);
> > > +
> > > +     dev_dbg(dev, "update CP to UNDESIRE\n"); }
> > > +
> > >  static int anx7625_hdcp_enable(struct anx7625_data *ctx)  {
> > >       u8 bcap;
> > > @@ -2149,34 +2165,6 @@ static int anx7625_connector_atomic_check(struct
> > anx7625_data *ctx,
> > >       if (cp == ctx->hdcp_cp)
> > >               return 0;
> > >
> > > -     if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > > -             if (ctx->dp_en) {
> > > -                     dev_dbg(dev, "enable HDCP\n");
> > > -                     anx7625_hdcp_enable(ctx);
> > > -
> > > -                     queue_delayed_work(ctx->hdcp_workqueue,
> > > -                                        &ctx->hdcp_work,
> > > -                                        msecs_to_jiffies(2000));
> > > -             }
> > > -     }
> > > -
> > > -     if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> > > -             if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > -                     dev_err(dev, "current CP is not ENABLED\n");
> > > -                     return -EINVAL;
> > > -             }
> > > -             anx7625_hdcp_disable(ctx);
> > > -             ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > -             drm_hdcp_update_content_protection(ctx->connector,
> > > -                                                ctx->hdcp_cp);
> > > -             dev_dbg(dev, "update CP to UNDESIRE\n");
> > > -     }
> > > -
> > > -     if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > -             dev_err(dev, "Userspace illegal set to PROTECTION ENABLE\n");
> > > -             return -EINVAL;
> > > -     }
> > > -
> > >       return 0;
> > >  }
> > >
> > > @@ -2425,6 +2413,8 @@ static void anx7625_bridge_atomic_enable(struct
> > drm_bridge *bridge,
> > >       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > >       struct device *dev = ctx->dev;
> > >       struct drm_connector *connector;
> > > +     struct drm_connector_state *conn_state;
> > > +     int cp;
> > >
> > >       dev_dbg(dev, "drm atomic enable\n");
> > >
> > > @@ -2439,6 +2429,32 @@ static void anx7625_bridge_atomic_enable(struct
> > drm_bridge *bridge,
> > >       _anx7625_hpd_polling(ctx, 5000 * 100);
> > >
> > >       anx7625_dp_start(ctx);
> > > +
> > > +     conn_state =
> > > + drm_atomic_get_new_connector_state(state->base.state, connector);
> > > +
> > > +     if (WARN_ON(!conn_state))
> > > +             return;
> > > +
> > > +     cp = conn_state->content_protection;
> > > +     if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > > +             if (ctx->dp_en) {
> > > +                     dev_dbg(dev, "enable HDCP\n");
> > > +                     anx7625_hdcp_enable(ctx);
> > > +
> > > +                     queue_delayed_work(ctx->hdcp_workqueue,
> > > +                                        &ctx->hdcp_work,
> > > +                                        msecs_to_jiffies(2000));
> > > +             }
> > > +     }
> > > +
> > > +     if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> > > +             if (ctx->hdcp_cp != DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > +                     dev_err(dev, "current CP is not ENABLED\n");
> > > +                     return;
> > > +             }
> > > +
> > > +             anx7625_hdcp_disable_and_update_cp(ctx);
> > > +     }
> > >  }
> > >
> > >  static void anx7625_bridge_atomic_disable(struct drm_bridge *bridge,
> > > @@ -2449,6 +2465,8 @@ static void anx7625_bridge_atomic_disable(struct
> > > drm_bridge *bridge,
> > >
> > >       dev_dbg(dev, "drm atomic disable\n");
> > >
> > > +     anx7625_hdcp_disable_and_update_cp(ctx);
> > > +
> > >       ctx->connector = NULL;
> > >       anx7625_dp_stop(ctx);
> > >
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
