Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE62063719E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 05:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0961A10E0C7;
	Thu, 24 Nov 2022 04:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA2A10E0C7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 04:53:41 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id z26so661550pff.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 20:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=R1Wg6FTenY9DFHsl9mPn4muGkPnhlT6iCDc5PSEwMCY=;
 b=ANrMaolJrh7zPSDCADpsNG5QqXz2Kzd7eWFi733lh4w05eMhVrBllnw6LXQVmHbjCe
 BLcCNRRlJke8SqdTjrTzw74831CWlE+rkzmRtfwQV6NBimGG+1QKHf/eJc804AhOgXxA
 00PQchEQqDL7QCdorjFD0n1U6iKbmvfsrl9eQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1Wg6FTenY9DFHsl9mPn4muGkPnhlT6iCDc5PSEwMCY=;
 b=cVYeQEIN3qwX+PzRbDrn4V7/uG4A+54Ovh7xR6Hrm1l8DZfOD/7hOx730bxtdjIHlo
 p6NzJm9bPdCyvALVYruGdEAafthY7YKVDP4Lmtlcl6uXqATPJbpmwnhaTgRM89e00cc2
 YNZI03UkO4OomqSbN+qmX6ZCe3WrOXTuckv12WjiP+3JZkKu18Ma4ym7ddpuO8XZkZdd
 Tlpy4EIgTCoVQxc2ELFoBq7lCTEc7yXgZzwqAZcdvDzcB5X4/jNkOzlrtDsPm601uyNk
 NeIJv9Chn2HlycHGGcgI7tO2Th0EvR5Qa6pIePt0NhkUOnPTP3sDDY2rkHws7zW47NXb
 c1nA==
X-Gm-Message-State: ANoB5pn/DqbSl71a6y66wuPCi2x8/PS7OetF0ZodymniaXB4O17jvRkS
 c1Kw0V5moUq1oml+OLc/eYzLio2dZjbmEf61WFWy1A==
X-Google-Smtp-Source: AA0mqf7CW/gCjn46bMWgQdQpDpW0NEoRga5KPr+WLmnXVq3uDYjYSg7xvl7VicC9BJYo66qrIgm0yzzj1QSAoWtksS0=
X-Received: by 2002:a63:4e57:0:b0:477:ae2f:3cd7 with SMTP id
 o23-20020a634e57000000b00477ae2f3cd7mr8099861pgl.44.1669265620935; Wed, 23
 Nov 2022 20:53:40 -0800 (PST)
MIME-Version: 1.0
References: <20221123100529.3943662-1-hsinyi@chromium.org>
 <20221123100529.3943662-3-hsinyi@chromium.org>
 <Y35/pfy0QqP7l4Ru@art_vandelay>
In-Reply-To: <Y35/pfy0QqP7l4Ru@art_vandelay>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 24 Nov 2022 12:53:14 +0800
Message-ID: <CAJMQK-htF_8xPj6_pv+=3=e1+KcH75Jtr72UYAFSeikfZXXwPA@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm/bridge: it6505: handle HDCP request
To: Sean Paul <sean@poorly.run>
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
Cc: Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 4:16 AM Sean Paul <sean@poorly.run> wrote:
>
> On Wed, Nov 23, 2022 at 10:05:29AM +0000, Hsin-Yi Wang wrote:
> > it6505 supports HDCP 1.3, but current implementation lacks the update of
> > HDCP status through drm_hdcp_update_content_protection().
> >
> > it6505 default enables the HDCP. Remove this and only turn on when user
> > requests it.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: allen chen <allen.chen@ite.com.tw>
> > ---
> > v6->v7: remove enable hdcp by default.
> > ---
> >  drivers/gpu/drm/bridge/ite-it6505.c | 60 +++++++++++++++++++++++++++--
> >  1 file changed, 57 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> > index 21a9b8422bda..93626698c31e 100644
> > --- a/drivers/gpu/drm/bridge/ite-it6505.c
> > +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> > @@ -423,6 +423,7 @@ struct it6505 {
> >       struct extcon_dev *extcon;
> >       struct work_struct extcon_wq;
> >       int extcon_state;
> > +     struct drm_connector *connector;
> >       enum drm_connector_status connector_status;
> >       enum link_train_status link_state;
> >       struct work_struct link_works;
> > @@ -2159,9 +2160,6 @@ static void it6505_link_train_ok(struct it6505 *it6505)
> >               DRM_DEV_DEBUG_DRIVER(dev, "Enable audio!");
> >               it6505_enable_audio(it6505);
> >       }
> > -
> > -     if (it6505->hdcp_desired)
> > -             it6505_start_hdcp(it6505);
> >  }
> >
> >  static void it6505_link_step_train_process(struct it6505 *it6505)
> > @@ -2399,6 +2397,14 @@ static void it6505_irq_hdcp_done(struct it6505 *it6505)
> >
> >       DRM_DEV_DEBUG_DRIVER(dev, "hdcp done interrupt");
> >       it6505->hdcp_status = HDCP_AUTH_DONE;
> > +     if (it6505->connector) {
> > +             struct drm_device *drm_dev = it6505->connector->dev;
> > +
> > +             drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
> > +             drm_hdcp_update_content_protection(it6505->connector,
> > +                                                DRM_MODE_CONTENT_PROTECTION_ENABLED);
> > +             drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
> > +     }
> >       it6505_show_hdcp_info(it6505);
> >  }
> >
> > @@ -2931,6 +2937,7 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
> >       if (WARN_ON(!connector))
> >               return;
> >
> > +     it6505->connector = connector;
> >       conn_state = drm_atomic_get_new_connector_state(state, connector);
> >
> >       if (WARN_ON(!conn_state))
> > @@ -2974,6 +2981,7 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
> >
> >       DRM_DEV_DEBUG_DRIVER(dev, "start");
> >
> > +     it6505->connector = NULL;
> >       if (it6505->powered) {
> >               it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
> >                                            DP_SET_POWER_D3);
> > @@ -3028,6 +3036,50 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
> >       return edid;
> >  }
> >
> > +static int it6505_connector_atomic_check(struct it6505 *it6505,
> > +                                      struct drm_connector_state *state)
> > +{
> > +     struct device *dev = &it6505->client->dev;
> > +     int cp = state->content_protection;
> > +
> > +     DRM_DEV_DEBUG_DRIVER(dev, "hdcp connector state:%d, curr hdcp state:%d",
> > +                          cp, it6505->hdcp_status);
> > +
> > +     if (!it6505->hdcp_desired) {
> > +             DRM_DEV_DEBUG_DRIVER(dev, "sink not support hdcp");
> > +             return 0;
> > +     }
> > +
> > +     if (it6505->hdcp_status == HDCP_AUTH_GOING)
> > +             return -EINVAL;
> > +
> > +     if (cp == DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
> > +             if (it6505->hdcp_status == HDCP_AUTH_DONE)
> > +                     it6505_stop_hdcp(it6505);
>
> You shouldn't touch the hardware in atomic_check, this should be done in the
> commit.
>
Since it6505 is a bridge, do you have suggested callbacks in
drm_bridge_funcs similar to commit?

> > +     } else if (cp == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
> > +             if (it6505->hdcp_status == HDCP_AUTH_IDLE &&
> > +                 it6505->link_state == LINK_OK)
> > +                     it6505_start_hdcp(it6505);
>
> Same here
>
> > +     } else {
> > +             if (it6505->hdcp_status == HDCP_AUTH_IDLE) {
> > +                     DRM_DEV_DEBUG_DRIVER(dev, "invalid to set hdcp enabled");
> > +                     return -EINVAL;
> > +             }
> > +     }
>
> In general, I think there are a number of locking and state issues with this
> approach. I had pulled all of this logic into a set of helpers [1], but the
> patchset has gotten stale on the list. You might consider looking at patches 1-4
> to see how the state and locking should be handled to avoid races.
>

After checking the series, all the hdcp controls are done in dp
controller instead of bridges. Is it proper for the bridge to update
the HDCP state?
- If it's not, then this series might be going in the wrong direction.
- If it is, since the current it6505 enables HDCP in the hardware
(it6505_start_hdcp() is called ) all the time, can we just update the
state without turning it off?


> Sean
>
> [1] - https://lore.kernel.org/all/20220411204741.1074308-1-sean@poorly.run/
>
> > +
> > +     return 0;
> > +}
> > +
> > +static int it6505_bridge_atomic_check(struct drm_bridge *bridge,
> > +                                   struct drm_bridge_state *bridge_state,
> > +                                   struct drm_crtc_state *crtc_state,
> > +                                   struct drm_connector_state *conn_state)
> > +{
> > +     struct it6505 *it6505 = bridge_to_it6505(bridge);
> > +
> > +     return it6505_connector_atomic_check(it6505, conn_state);
> > +}
> > +
> >  static const struct drm_bridge_funcs it6505_bridge_funcs = {
> >       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> >       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> > @@ -3035,6 +3087,7 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
> >       .attach = it6505_bridge_attach,
> >       .detach = it6505_bridge_detach,
> >       .mode_valid = it6505_bridge_mode_valid,
> > +     .atomic_check = it6505_bridge_atomic_check,
> >       .atomic_enable = it6505_bridge_atomic_enable,
> >       .atomic_disable = it6505_bridge_atomic_disable,
> >       .atomic_pre_enable = it6505_bridge_atomic_pre_enable,
> > @@ -3354,6 +3407,7 @@ static int it6505_i2c_probe(struct i2c_client *client,
> >       it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> >       it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
> >                            DRM_BRIDGE_OP_HPD;
> > +     it6505->bridge.support_hdcp = true;
> >       drm_bridge_add(&it6505->bridge);
> >
> >       return 0;
> > --
> > 2.38.1.584.g0f3c55d4c2-goog
> >
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS
