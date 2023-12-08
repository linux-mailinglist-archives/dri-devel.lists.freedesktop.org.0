Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1D809843
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 02:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5787B10E23F;
	Fri,  8 Dec 2023 01:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDDB10E23F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 00:59:59 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-5c08c47c055so14651307b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 16:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701997198; x=1702601998; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GY6ah2v1DJ22OZgJksNyLoYl664i2yPmbTCon8lG/jA=;
 b=hh0ksrQB8w6fQWkx+7nw+qzGFwcZNdBM4oRwUEzAqVQnyw8jvbuL3WpJGgYzNywC2A
 IqLsadL3ZIw/iNVOmNGn18QtxPwyGVnJvXT+nholeB9k7744Qg64YzYFCtaGKzI/qaqY
 hI9Miq6X52r4lMMPFBirtBXZdpLThvOr0ptoqF47FBZv8l631B4qO8I+urHp8xp045Wc
 y2DUkPSuIiqpeiY0SM2FyLvMEwtXvaneUly+B+kRldvywrn4HpLDeqkanCHhLq6CVQ+s
 RhLHFc+870TcrOgZ2pRXA3WG+Snjsowd2O3eoTkNVlFhYUtnctQBSaBK1yaQyZgtrE+Q
 Ln+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701997198; x=1702601998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GY6ah2v1DJ22OZgJksNyLoYl664i2yPmbTCon8lG/jA=;
 b=hW1XSto4Ab/NGYnY3lQM7VAO3j9eD1XI3CZ3brYUytBALGm+aanVOHr1AyY07j8mi3
 d4ZRNa4R58/EJ33o9oWKL6Pk8ilhEuoECDExZ+LUmM+3IhdCDBzHbaW0g9iq33aar0T2
 E8hRyNp9wDsEhRTPpnRFKkg33z6rRyaO6c5otTymFCP3W7bC0t4oOMrQSoX0anTa1gav
 XLqVWWCGB2vxx7Hd3vnNjzzVBxvTrlhrv7KIpv9EYHaCZ4u5MukSnzb+wzEWuhTE+q41
 NcZjOpOw0qD8tGdfT4m4DmBveUf9NNsfZ+/xC2MkAMzHffSHFonH+R75Dtzxg7smcREo
 Hhbw==
X-Gm-Message-State: AOJu0YyaVI7OsK84aRc0p6ZpCGgtWyn7K/3vGXHZrYdDpqHsLaNqY0tP
 UDt76B/tq2rLkJyKGkEsIzgVxjlcc6/66bWFMXpERw==
X-Google-Smtp-Source: AGHT+IESqChu1z5Tm6wG16ng1t0Z+gfrx2xuUkUNXdPgQVHwtv0dc2fNKBnWNl4kuzrJVphB3WSStInSVE3A+GRSdI4=
X-Received: by 2002:a81:ae12:0:b0:5d7:2185:b310 with SMTP id
 m18-20020a81ae12000000b005d72185b310mr3040747ywh.10.1701997198559; Thu, 07
 Dec 2023 16:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20231206101455.1664463-1-dmitry.baryshkov@linaro.org>
 <20231206101455.1664463-2-dmitry.baryshkov@linaro.org>
 <ohka6xa4xf5zo2txpqlyipsjuafcmmvnvnlfci2hvuhvwagr4k@jqx3do2q3ug3>
In-Reply-To: <ohka6xa4xf5zo2txpqlyipsjuafcmmvnvnlfci2hvuhvwagr4k@jqx3do2q3ug3>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 8 Dec 2023 02:59:47 +0200
Message-ID: <CAA8EJpoCdFOK0xF=xFaTWKQWgBQWTW6v3-CdiW2Ovdd-5HbVpw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/atomic-helper: rename
 drm_atomic_helper_check_wb_encoder_state
To: Maxime Ripard <mripard@kernel.org>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 7 Dec 2023 at 12:10, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Wed, Dec 06, 2023 at 01:14:54PM +0300, Dmitry Baryshkov wrote:
> > The drm_atomic_helper_check_wb_encoder_state() function doesn't use
> > encoder for anything other than getting the drm_device instance. The
> > function's description talks about checking the writeback connector
> > state, not the encoder state. Moreover, there is no such thing as an
> > encoder state, encoders generally do not have a state on their own.
> >
> > Rename the function to drm_atomic_helper_check_wb_connector_state()
> > and change arguments to drm_writeback_connector and drm_atomic_state.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c   | 16 +++++++++-------
> >  drivers/gpu/drm/vkms/vkms_writeback.c |  5 ++++-
> >  include/drm/drm_atomic_helper.h       |  5 ++---
> >  3 files changed, 15 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index c3f677130def..c98a766ca3bd 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -795,9 +795,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> >
> >  /**
> > - * drm_atomic_helper_check_wb_encoder_state() - Check writeback encoder state
> > - * @encoder: encoder state to check
> > - * @conn_state: connector state to check
> > + * drm_atomic_helper_check_wb_connector_state() - Check writeback connector state
> > + * @connector: corresponding connector
> > + * @state: the driver state object
> >   *
> >   * Checks if the writeback connector state is valid, and returns an error if it
> >   * isn't.
> > @@ -806,9 +806,11 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
> >   * Zero for success or -errno
> >   */
> >  int
> > -drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> > -                                      struct drm_connector_state *conn_state)
> > +drm_atomic_helper_check_wb_connector_state(struct drm_connector *connector,
> > +                                        struct drm_atomic_state *state)
> >  {
> > +     struct drm_connector_state *conn_state =
> > +             drm_atomic_get_new_connector_state(state, connector);
> >       struct drm_writeback_job *wb_job = conn_state->writeback_job;
> >       struct drm_property_blob *pixel_format_blob;
> >       struct drm_framebuffer *fb;
> > @@ -827,11 +829,11 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
> >               if (fb->format->format == formats[i])
> >                       return 0;
> >
> > -     drm_dbg_kms(encoder->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
> > +     drm_dbg_kms(connector->dev, "Invalid pixel format %p4cc\n", &fb->format->format);
> >
> >       return -EINVAL;
> >  }
> > -EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
> > +EXPORT_SYMBOL(drm_atomic_helper_check_wb_connector_state);
>
> Thanks for updating the prototype ...
>
> >  /**
> >   * drm_atomic_helper_check_plane_state() - Check plane state for validity
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index d7e63aa14663..23c4f7b61cb6 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -34,6 +34,9 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
> >                                       struct drm_crtc_state *crtc_state,
> >                                       struct drm_connector_state *conn_state)
> >  {
> > +     struct drm_connector *connector = conn_state->connector;
> > +     struct drm_writeback_connector *wb_conn =
> > +             drm_connector_to_writeback(connector);
> >       struct drm_framebuffer *fb;
> >       const struct drm_display_mode *mode = &crtc_state->mode;
> >       int ret;
> > @@ -48,7 +51,7 @@ static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
> >               return -EINVAL;
> >       }
> >
> > -     ret = drm_atomic_helper_check_wb_encoder_state(encoder, conn_state);
> > +     ret = drm_atomic_helper_check_wb_connector_state(wb_conn, conn_state->state);
>
> ... but it looks like you forgot to update it here

Indeed, I fixed it in the second patch, but forgot to update the first one.

>
> Maxime



-- 
With best wishes
Dmitry
