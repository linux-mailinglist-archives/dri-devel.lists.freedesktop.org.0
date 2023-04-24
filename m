Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E956ECFA3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 15:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527F310E1B2;
	Mon, 24 Apr 2023 13:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8766410E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 13:51:00 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-44089f95265so1430846e0c.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1682344259; x=1684936259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=stIu8ClgUckLBUEBsGl276jISixWZ1mw4pn+EsJ7JZw=;
 b=KSCkfZE/+9pcGuTPdYh0YG+OpxdgMPNE/MyoU8GLGzVZLaVDkcOOOiVlAkC51CgDls
 k/fWTgHeT+w7yuZ4vQea57YQu81DVgO+cZ1jGkJL1yWt2ZQSix1MMWb0ZK5Jlzqwihy+
 5/xgbRsi9P5AdCAmMoCyARaTi4gw8eRM7kCZtqBuS0EW/nWMhNJdXeSS3ag6HHdbNlXP
 HY1yO6yFVPCiSpzU2GmnQRHtsIdW1Yjx7wnD7BQ5BDYeOxGMS4FRqKc15UnJwRrYI8T4
 vj5jRXWmFN++FWw9ShT9iNFoiJTjP7ObUyZ05BWIZfrgRp+xuoM2C1D6V0Tyk3MCjsLM
 0QvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682344259; x=1684936259;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=stIu8ClgUckLBUEBsGl276jISixWZ1mw4pn+EsJ7JZw=;
 b=Rs/1BQn4Aj17n98lxk7gqdpLt6bRQKvW9iXV9bXdbqUKhB4FaACmIgS5C58Oq0xo0r
 e2MR/uiMLtHSQnr29ZAkqfV5qrCHttNWB6Qk+hY2Ww5yR9MqQalfgmqRXDbE2ddlS35M
 LYfCwirDeIu+YJjhnf96txXmIsYBapXrwv3TRo/lsGcI1ki5GYVM/xnXYP1hgdSOTIg+
 +UR9PmhT67wb4PvJMup4jQDUOdFjtDpdi4fGxOosJp5skIejy10xndWpGDvyc6XDCusM
 E5+Zvwqnycue0H8BwXvNt1oPt+KQ3ELdqO+mbInHwdBizGgEPeUPYMa4LoKJ5/ugmpQS
 MJRg==
X-Gm-Message-State: AAQBX9clAjjhRh1B3aoDeEeojypHhMEXOE8gr8Os19JMvtDXUDWI7s69
 oEhwHePz8abydKl/KhNEJP/DPgaCf6pPxEwpqFvF5A==
X-Google-Smtp-Source: AKy350a4qyB83sh/fBMONyQnHylHjTS1iRVanU7zyJs8OKiEqNzAR2eSAuuca+2K3dXjc7hTvSAfIxsd08BHQGYCe/Y=
X-Received: by 2002:a1f:d544:0:b0:443:675e:3096 with SMTP id
 m65-20020a1fd544000000b00443675e3096mr3107100vkg.16.1682344259023; Mon, 24
 Apr 2023 06:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230421162749.360777-1-markyacoub@google.com>
 <20230421162749.360777-3-markyacoub@google.com>
 <bc723ffd-73cd-0339-c2aa-42b3db5a3560@linaro.org>
In-Reply-To: <bc723ffd-73cd-0339-c2aa-42b3db5a3560@linaro.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 24 Apr 2023 14:50:43 +0100
Message-ID: <CAPY8ntBH_AHp85Ak5YA4wkHxSHOf_3O7vKbLDVY2NVB_q=tpUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] DRM: Create new Content Protection connector
 property
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Mark Yacoub <markyacoub@chromium.org>, dianders@chromium.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark (and Dmitry)

On Fri, 21 Apr 2023 at 18:07, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 21/04/2023 19:27, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@chromium.org>
>
> Nit: is there a reason for this header? My first impression is that it
> matches your outgoing name & email address and as such is not necessary.
>
> Nit#2: subject should mention 'Key', as you are creating a property for
> the key.
>
> >
> > [Why]
> > To enable Protected Content, some drivers require a key to be injected
> > from user space to enable HDCP on the connector.
> >
> > [How]
> > Create new "Content Protection Property" of type "Blob"
>
> Generic observation is that the ability to inject HDCP keys manually
> seems to be quite unique to your hardware. As such, I think the debugfs
> or sysfs suits better in comparison to the DRM property.

I was about to reply to v1 with a very similar comment over the
requirement to keep HDCP keys secret.

v2 has added WRITE_ONLY blobs so at least another process can't just
read the blob back out again, but it feels like there are still
numerous ways to grab those keys. For an unsecured userspace to have
the keys in the first place seems like a bad move, and IMHO they
should only be held in either a secure environment, or only held in
hardware (passed direct from OTP to HDCP block).


There's also the DRM uAPI requirement for having reviewed patches for
an open source project to go alongside any uAPI change. Do such
patches exist? https://docs.kernel.org/gpu/drm-uapi.html#open-source-userspace-requirements

  Dave

> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >   drivers/gpu/drm/drm_atomic_uapi.c | 9 +++++++++
> >   include/drm/drm_connector.h       | 6 ++++++
> >   include/drm/drm_mode_config.h     | 6 ++++++
> >   3 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> > index d867e7f9f2cd5..e20bc57cdb05c 100644
> > --- a/drivers/gpu/drm/drm_atomic_uapi.c
> > +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> > @@ -749,6 +749,11 @@ static int drm_atomic_connector_set_property(struct drm_connector *connector,
> >               state->content_protection = val;
> >       } else if (property == config->hdcp_content_type_property) {
> >               state->hdcp_content_type = val;
> > +     } else if (property == config->content_protection_key_property) {
> > +             ret = drm_atomic_replace_property_blob_from_id(
> > +                     dev, &state->content_protection_key, val, -1, -1,
> > +                     &replaced);
> > +             return ret;
> >       } else if (property == connector->colorspace_property) {
> >               state->colorspace = val;
> >       } else if (property == config->writeback_fb_id_property) {
> > @@ -843,6 +848,10 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
> >               *val = state->content_protection;
> >       } else if (property == config->hdcp_content_type_property) {
> >               *val = state->hdcp_content_type;
> > +     } else if (property == config->content_protection_key_property) {
> > +             *val = state->content_protection_key ?
> > +                            state->content_protection_key->base.id :
> > +                            0;
> >       } else if (property == config->writeback_fb_id_property) {
> >               /* Writeback framebuffer is one-shot, write and forget */
> >               *val = 0;
> > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > index 7b5048516185c..2fbe51272bfeb 100644
> > --- a/include/drm/drm_connector.h
> > +++ b/include/drm/drm_connector.h
> > @@ -896,6 +896,12 @@ struct drm_connector_state {
> >        */
> >       unsigned int content_protection;
> >
> > +     /**
> > +      * @content_protection_key: DRM blob property for holding the Content
> > +      * Protection Key injected from user space.
> > +      */
> > +     struct drm_property_blob *content_protection_key;
> > +
> >       /**
> >        * @colorspace: State variable for Connector property to request
> >        * colorspace change on Sink. This is most commonly used to switch
> > diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> > index e5b053001d22e..615d1e5f57562 100644
> > --- a/include/drm/drm_mode_config.h
> > +++ b/include/drm/drm_mode_config.h
> > @@ -887,6 +887,12 @@ struct drm_mode_config {
> >        */
> >       struct drm_property *hdcp_content_type_property;
> >
> > +     /**
> > +      * @content_protection_key_property: DRM blob property that receives the
> > +      * content protection key from user space to be injected into the kernel.
> > +      */
> > +     struct drm_property *content_protection_key_property;
> > +
> >       /* dumb ioctl parameters */
> >       uint32_t preferred_depth, prefer_shadow;
> >
>
> --
> With best wishes
> Dmitry
>
