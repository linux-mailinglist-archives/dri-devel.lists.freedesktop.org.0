Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE89F0D24
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 14:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB19110E26E;
	Fri, 13 Dec 2024 13:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PD1Sggo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD0410E26E
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 13:16:58 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-e3a26de697fso1247755276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 05:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734095817; x=1734700617; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RVcPpLOsWmE+ba7pF6UhID0o+wua7JbONLDV04eLt58=;
 b=PD1Sggo9+imBeYv6DD5uzBfYtNiIbqaX58Fb1W9pgGhPHXd3o2DMoDG7yV4BdtiTpp
 LTlqno3onwK1KRDgvuEEruWp6O0Kr2mkjZKO4Qsc4rslcxb0/JpGUxUKZ0PF3fzGnjWd
 72xmW43TVjtqz95aq6p7A8ENX7VD8oRiNpRNEDag6DeypvdvCbfzqRVToTVteQ7dD6JH
 w2BC8jr6ycPBWeo4MjQ/CBOf/I+cK7uQqRyIueZarEO29Ea6NrLjnhU1eyj+UGN1TVU8
 L3CLeGra9Wn2Tj3Q55u7W3MkFB70ZHEtQWcfXCQiCigr/d+ayON0G1NKcjqJHSiNaUX1
 8R1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734095817; x=1734700617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RVcPpLOsWmE+ba7pF6UhID0o+wua7JbONLDV04eLt58=;
 b=clvykvI9GCLZ0LNR5syMDwGal5JPlK8McJHYv0lATZkLrqS5vO9IdXcF5ziVx6MoVg
 hlreI65Cpv2MOoI2Of03Nr9oZ1O+m9H1BxR3HRZoV0tRMPhijGN3mA0sX2QziaaplNZQ
 QNo3fjDQAyigMiBwyHEqvqjbigpkRMi3KOSUFqemikGVZEaFRXfo97fSmPY/xDL+tPcS
 w6AqkgkyzKyfxy5lVq+VFXFQL8KC05gC/YlnamPt+R75Vq5nsN8siVnuxa8dqXmZXSjv
 4sivCtxqtOfAL647+hP9apt0RHcQdh076uXQAKWXImOBRsbcAMgCRmk+8/5PeB8C3e0R
 MtBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEQM0SraNv9VY8ZZjGVTyf3woMz3c9DVz+KduR5LGSrGOxaegCIGzlD5R/afUu9xVazkxeURkBQb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6a7QEv2utz7y577+x4l3wHt2lwtDAzh6+jDrQ7/DtBmH8BBPK
 A7zcRrHZITtAkZ4L3kHDEpZpyprJSRQYzTS/fIdkrxzqYOmHN2nZL+aYbeAVzhF3LNStYAzaF8L
 fGY61F0ROlEo494QWP3jBNUD3T6ZzV5CZdAwPyQ==
X-Gm-Gg: ASbGncsZTye1hOjJiasJiw0YFf+F4zJ1LSWumdc+nxFg2vDbUh872OgVbxeaWieJgaZ
 ohKtpH4jn0/a7OT0GuvDMV+Ce3CO0xFi1Ym1H
X-Google-Smtp-Source: AGHT+IGAl2LYP8iV2Q3Sc2IL4UxpP1EGC86H9SzT6Tzp3ChldYwdh60ZW5iAxqwg8uWrnFB2To757YfeZZkWJFcOoO8=
X-Received: by 2002:a05:6902:2213:b0:e3d:22a7:b969 with SMTP id
 3f1490d57ef6-e434d199da4mr2201350276.5.1734095815817; Fri, 13 Dec 2024
 05:16:55 -0800 (PST)
MIME-Version: 1.0
References: <20241212055110.1862487-1-xji@analogixsemi.com>
 <vkrl7om7hepboovp2uivcnernia3ygqwrj3y3kkjydeclwvrk5@7tkdc4etkcjs>
 <BY5PR04MB673977C1DB1E774CB261C119C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
 <4q2jncpnmeu7ytuyuv5pjzurh3ai5663jmu2we6cebuad2r3r5@tfb6hf6unioc>
 <BY5PR04MB673902E047FF8ADAFD8B94B3C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
In-Reply-To: <BY5PR04MB673902E047FF8ADAFD8B94B3C7382@BY5PR04MB6739.namprd04.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 15:16:44 +0200
Message-ID: <CAA8EJprGjuGFjZnXUxiMZMV=FO9O9CYt06H_nSL82fEOvPytyA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
 atomic_enable()
To: Xin Ji <xji@analogixsemi.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Bernie Liang <bliang@analogixsemi.com>, Qilin Wen <qwen@analogixsemi.com>, 
 "treapking@google.com" <treapking@google.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 13 Dec 2024 at 13:00, Xin Ji <xji@analogixsemi.com> wrote:
>
> Hi Dmitry, sorry, I didn't clear describe the reason.

Please. Do not top-post. Please paste your answer under the question,
not somewhere at the top of the email. This allows us to have a more
constructive dialog. Additional bonus if you can fix your email client
to insert sensible quoting information instead of dumping the headers
of the original email.

>
> Anx7625 implement DSI to DP convert behind USB Type-C port, when user plug into USB Type-C
> Dongle with DP monitor, the user space will enable HDCP feature, then kernel do HDCP and
> output display and set HDCP content to ENABLE, but the issue happened if user manually
> change the monitor's resolution later.
>
> Each time user change the resolution, kernel will call bridge interface .atomic_disable() and
> .atomic_enable(), the old driver will keep HDCP state to ENABLE, this is a BUG, when user
> change the resolution, kernel must change HDCP content too (mustn't keep to ENABLE),

Why? Could you please point me to the corresponding documentation or a
code path in the other driver? Preferably i915, AMD or Nouveau.

> as DRM doc said, kernel cannot change from ENABLE to UNDESIRE, so next patch,
> I'll change it to DESIRE in .atomic_disable().
>
> Thanks!
> Xin
>
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Sent: Friday, December 13, 2024 6:47 PM
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
> > On Fri, Dec 13, 2024 at 10:06:36AM +0000, Xin Ji wrote:
> > > Hi Dmitry, thanks for the review, I made some changes which change
> > > ENABLE to DESIRE in .atomic_disable(), I'll upstream it after testing. Thanks!
> >
> > - Please don't top-post.
> >
> > - You still didn't explain, why do you want to do this change of HDCP
> >   status. Could you please provide an explanation before sending the
> >   next iteration?
> >
> > >
> > > > -----Original Message-----
> > > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > Sent: Thursday, December 12, 2024 5:18 PM
> > > > To: Xin Ji <xji@analogixsemi.com>
> > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong
> > > > <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent
> > > > Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman
> > > > <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>;
> > > > Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard
> > > > <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
> > David
> > > > Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Bernie
> > > > Liang <bliang@analogixsemi.com>; Qilin Wen <qwen@analogixsemi.com>;
> > > > treapking@google.com; dri-devel@lists.freedesktop.org; linux-
> > > > kernel@vger.kernel.org
> > > > Subject: Re: [PATCH v3] drm/bridge:anx7625: Update HDCP status at
> > > > atomic_enable()
> > > >
> > > > CAUTION: This email originated from outside of the organization.
> > > > Please do not click links or open attachments unless you recognize
> > > > the sender, and know the content is safe.
> > > >
> > > >
> > > > On Thu, Dec 12, 2024 at 01:51:10PM +0800, Xin Ji wrote:
> > > > > When user enabled HDCP feature, userspace will set HDCP content to
> > > > > DRM_MODE_CONTENT_PROTECTION_DESIRED. Next, anx7625 will
> > update
> > > > HDCP
> > > > > content to DRM_MODE_CONTENT_PROTECTION_ENABLED if down
> > stream
> > > > support
> > > > > HDCP feature.
> > > > >
> > > > > However once HDCP content turn to
> > > > DRM_MODE_CONTENT_PROTECTION_ENABLED
> > > > > userspace will not update the HDCP content to
> > > > > DRM_MODE_CONTENT_PROTECTION_UNDESIRED until monitor
> > disconnect.
> > > >
> > > > It seems you've ingored a part of the previous review comment. It's
> > > > the userspace who triggers the ENABLED -> UNDESIRED transition, not
> > > > the kernel side. The change to move HDCP handling to atomic_enable()
> > > > looks fine, the change to disable HDCP is not (unless I misunderstand
> > something).
> > > >
> > > > >
> > > > > So, anx7625 driver move hdcp content value checking from bridge
> > > > > interface .atomic_check() to .atomic_enable(), then update hdcp
> > > > > content according from currently HDCP status. And also disabled
> > > > > HDCP in bridge interface .atomic_disable().
> > > > >
> > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 74
> > > > > ++++++++++++++---------
> > > > >  1 file changed, 46 insertions(+), 28 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > index a2675b121fe4..f96ce5665e8d 100644
> > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > @@ -861,6 +861,22 @@ static int anx7625_hdcp_disable(struct
> > > > > anx7625_data
> > > > *ctx)
> > > > >                                TX_HDCP_CTRL0, ~HARD_AUTH_EN &
> > > > > 0xFF); }
> > > > >
> > > > > +static void anx7625_hdcp_disable_and_update_cp(struct
> > > > > +anx7625_data
> > > > > +*ctx) {
> > > > > +     struct device *dev = ctx->dev;
> > > > > +
> > > > > +     if (!ctx->connector)
> > > > > +             return;
> > > > > +
> > > > > +     anx7625_hdcp_disable(ctx);
> > > > > +
> > > > > +     ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > > > +     drm_hdcp_update_content_protection(ctx->connector,
> > > > > +                                        ctx->hdcp_cp);
> > > > > +
> > > > > +     dev_dbg(dev, "update CP to UNDESIRE\n"); }
> > > > > +
> > > > >  static int anx7625_hdcp_enable(struct anx7625_data *ctx)  {
> > > > >       u8 bcap;
> > > > > @@ -2149,34 +2165,6 @@ static int
> > > > > anx7625_connector_atomic_check(struct
> > > > anx7625_data *ctx,
> > > > >       if (cp == ctx->hdcp_cp)
> > > > >               return 0;
> > > > >
> > > > > -     if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > > > > -             if (ctx->dp_en) {
> > > > > -                     dev_dbg(dev, "enable HDCP\n");
> > > > > -                     anx7625_hdcp_enable(ctx);
> > > > > -
> > > > > -                     queue_delayed_work(ctx->hdcp_workqueue,
> > > > > -                                        &ctx->hdcp_work,
> > > > > -                                        msecs_to_jiffies(2000));
> > > > > -             }
> > > > > -     }
> > > > > -
> > > > > -     if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> > > > > -             if (ctx->hdcp_cp !=
> > DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > > > -                     dev_err(dev, "current CP is not ENABLED\n");
> > > > > -                     return -EINVAL;
> > > > > -             }
> > > > > -             anx7625_hdcp_disable(ctx);
> > > > > -             ctx->hdcp_cp = DRM_MODE_CONTENT_PROTECTION_UNDESIRED;
> > > > > -             drm_hdcp_update_content_protection(ctx->connector,
> > > > > -                                                ctx->hdcp_cp);
> > > > > -             dev_dbg(dev, "update CP to UNDESIRE\n");
> > > > > -     }
> > > > > -
> > > > > -     if (cp == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > > > -             dev_err(dev, "Userspace illegal set to PROTECTION ENABLE\n");
> > > > > -             return -EINVAL;
> > > > > -     }
> > > > > -
> > > > >       return 0;
> > > > >  }
> > > > >
> > > > > @@ -2425,6 +2413,8 @@ static void
> > > > > anx7625_bridge_atomic_enable(struct
> > > > drm_bridge *bridge,
> > > > >       struct anx7625_data *ctx = bridge_to_anx7625(bridge);
> > > > >       struct device *dev = ctx->dev;
> > > > >       struct drm_connector *connector;
> > > > > +     struct drm_connector_state *conn_state;
> > > > > +     int cp;
> > > > >
> > > > >       dev_dbg(dev, "drm atomic enable\n");
> > > > >
> > > > > @@ -2439,6 +2429,32 @@ static void
> > > > > anx7625_bridge_atomic_enable(struct
> > > > drm_bridge *bridge,
> > > > >       _anx7625_hpd_polling(ctx, 5000 * 100);
> > > > >
> > > > >       anx7625_dp_start(ctx);
> > > > > +
> > > > > +     conn_state =
> > > > > + drm_atomic_get_new_connector_state(state->base.state,
> > > > > + connector);
> > > > > +
> > > > > +     if (WARN_ON(!conn_state))
> > > > > +             return;
> > > > > +
> > > > > +     cp = conn_state->content_protection;
> > > > > +     if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > > > > +             if (ctx->dp_en) {
> > > > > +                     dev_dbg(dev, "enable HDCP\n");
> > > > > +                     anx7625_hdcp_enable(ctx);
> > > > > +
> > > > > +                     queue_delayed_work(ctx->hdcp_workqueue,
> > > > > +                                        &ctx->hdcp_work,
> > > > > +                                        msecs_to_jiffies(2000));
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> > > > > +             if (ctx->hdcp_cp !=
> > DRM_MODE_CONTENT_PROTECTION_ENABLED) {
> > > > > +                     dev_err(dev, "current CP is not ENABLED\n");
> > > > > +                     return;
> > > > > +             }
> > > > > +
> > > > > +             anx7625_hdcp_disable_and_update_cp(ctx);
> > > > > +     }
> > > > >  }
> > > > >
> > > > >  static void anx7625_bridge_atomic_disable(struct drm_bridge
> > > > > *bridge, @@ -2449,6 +2465,8 @@ static void
> > > > > anx7625_bridge_atomic_disable(struct
> > > > > drm_bridge *bridge,
> > > > >
> > > > >       dev_dbg(dev, "drm atomic disable\n");
> > > > >
> > > > > +     anx7625_hdcp_disable_and_update_cp(ctx);
> > > > > +
> > > > >       ctx->connector = NULL;
> > > > >       anx7625_dp_stop(ctx);
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >
> > > >
> > > > --
> > > > With best wishes
> > > > Dmitry
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
