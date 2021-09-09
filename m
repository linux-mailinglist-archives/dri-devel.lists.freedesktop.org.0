Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD4405CC2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 20:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9ADB6E8F5;
	Thu,  9 Sep 2021 18:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8ADC6E8F5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 18:15:38 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id a93so5731958ybi.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 11:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DLULdAoTyNVxT3GTeYOIML5OrBg4cI4yg/Mz7NY7nSQ=;
 b=RNm82nkHCcZY9Kkl2/aNxd1ooJTfrtR1tu8EWCRY3yskLsoP+D/DgshisoyB89KVO4
 gdNBnyrbzoAB0xSVejuWXOtvWKx8CWRXLl/Q2r0tzRVNIneFEU9SOXd3dzQ7b5Yg1ct7
 2E4Ttl7K/mcGjNrU9oZa7tTftQQKc4mJBQqWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DLULdAoTyNVxT3GTeYOIML5OrBg4cI4yg/Mz7NY7nSQ=;
 b=usfOcbRUwhyn9DDH7GvOjtzOsmiMQ9UH3FqqF3YnXsQIgidzOq6NxwQpGCKRbdigzD
 WjFqyzNzTJWP8HtHIgio2at3xsHs9P7ASTQEmTeEDoEbjl4ZVW7Gydl9hutCHAmZsrF3
 +KzRnEy0X1rpA2jfKoFuiPI2pMiiJ/IUXNeClAMkJjEb0XpKCRlXt02ZjvovYWBgsVKF
 mxSSRSHrk1oXf8ucqbpktFe9mNPzKOgiSV/vPFKk2uV0dxcSSGFsZ4hClIyfx4Gt8zO9
 5/7LeQ18ceRxJGUK/1L4zBRl2e8l7gbUej2wH+DL7A8kIsIoGmJH/K94bopjuJSSdnp8
 70sA==
X-Gm-Message-State: AOAM530qYxWJofsWG48p7O4jrCaBnstBWp861AwK2nIF/rwt6eL3A+s+
 mIPCeu9uNr9mqSiEKfZ7l/aJ9+rvJu8FQQRpZb4TBA==
X-Google-Smtp-Source: ABdhPJyT4+l6lEe4pNgJ/Z7iaJiRYceSDmbdnzbKl+Noln6iNuOUKovYS6NO15WGhrLlDWLYXOg+VkiGPjMn9BoSqZY=
X-Received: by 2002:a25:b94:: with SMTP id 142mr5432760ybl.508.1631211337634; 
 Thu, 09 Sep 2021 11:15:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
 <20210908111500.2.Iac57921273b27d7f7d65e12ff7be169657f4c1eb@changeid>
 <CAE-0n50mp5F79iJ+zVrbt4ZP7V+UUOcVQe9H3TwEcFFyZWMoNA@mail.gmail.com>
In-Reply-To: <CAE-0n50mp5F79iJ+zVrbt4ZP7V+UUOcVQe9H3TwEcFFyZWMoNA@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Thu, 9 Sep 2021 11:15:27 -0700
Message-ID: <CA+cxXhnPd1Z_HVjgM8b0wskASF-ZGuvYDh0quiVMwKFhKVx-JA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: parade-ps8640: Add support for AUX channel
To: Stephen Boyd <swboyd@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Hi,

On Wed, Sep 8, 2021 at 3:27 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-09-08 11:18:06)
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index a16725dbf912..3f0241a60357 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -93,6 +115,102 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> >         return container_of(e, struct ps8640, bridge);
> >  }
> >
> > +static inline struct ps8640 *aux_to_ps8640(struct drm_dp_aux *aux)
> > +{
> > +       return container_of(aux, struct ps8640, aux);
> > +}
> > +
> > +static ssize_t ps8640_aux_transfer(struct drm_dp_aux *aux,
> > +                                  struct drm_dp_aux_msg *msg)
> > +{
> > +       struct ps8640 *ps_bridge = aux_to_ps8640(aux);
> > +       struct i2c_client *client = ps_bridge->page[PAGE0_DP_CNTL];
> > +       struct regmap *map = ps_bridge->regmap[PAGE0_DP_CNTL];
> > +       unsigned int len = msg->size;
> > +       unsigned int data;
> > +       int ret;
> > +       u8 request = msg->request &
> > +                    ~(DP_AUX_I2C_MOT | DP_AUX_I2C_WRITE_STATUS_UPDATE);
> > +       u8 *buf = msg->buffer;
> > +       bool is_native_aux = false;
> > +
> > +       if (len > DP_AUX_MAX_PAYLOAD_BYTES)
> > +               return -EINVAL;
> > +
> > +       pm_runtime_get_sync(&client->dev);
>
> Is this driver using runtime PM? Probably can't add this until it is
> actually runtime PM enabled.
Thanks - I think this driver doesn't enable runtime PM yet.
I'll remove all of the pm_runtime_* calls for now.
>
> > +
> > +       switch (request) {
> > +       case DP_AUX_NATIVE_WRITE:
> > +       case DP_AUX_NATIVE_READ:
> > +               is_native_aux = true;
> > +       case DP_AUX_I2C_WRITE:
> > +       case DP_AUX_I2C_READ:
> > +               regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
> > +               break;
> > +       default:
> > +               ret = -EINVAL;
> > +               goto exit;
> > +       }
> > +
> > +       /* Assume it's good */
> > +       msg->reply = 0;
> > +
> > +       data = ((request << 4) & AUX_CMD_MASK) |
> > +              ((msg->address >> 16) & AUX_ADDR_19_16_MASK);
> > +       regmap_write(map, PAGE0_AUX_ADDR_23_16, data);
> > +       data = (msg->address >> 8) & 0xff;
> > +       regmap_write(map, PAGE0_AUX_ADDR_15_8, data);
> > +       data = msg->address & 0xff;
> > +       regmap_write(map, PAGE0_AUX_ADDR_7_0, msg->address & 0xff);
>
> Can we pack this into a three byte buffer and write it in one
> regmap_bulk_write()? That would be nice because it looks like the
> addresses are all next to each other in the i2c address space.
Sure, I will address this in the next version.
>
> > +
> > +       data = (len - 1) & AUX_LENGTH_MASK;
> > +       regmap_write(map, PAGE0_AUX_LENGTH, data);
> > +
> > +       if (request == DP_AUX_NATIVE_WRITE || request == DP_AUX_I2C_WRITE) {
> > +               ret = regmap_noinc_write(map, PAGE0_AUX_WDATA, buf, len);
> > +               if (ret < 0) {
> > +                       DRM_ERROR("failed to write PAGE0_AUX_WDATA");
>
> Needs a newline.
Adding an empty line here doesn't look like a common Linux style?
Could you point me to any similar instances in the Linux codebase?
>
> > +                       goto exit;
> > +               }
> > +       }
> > +
> > +       regmap_write(map, PAGE0_AUX_CTRL, AUX_START);
> > +
> > +       regmap_read(map, PAGE0_AUX_STATUS, &data);
> > +       switch (data & AUX_STATUS_MASK) {
> > +       case AUX_STATUS_DEFER:
> > +               if (is_native_aux)
> > +                       msg->reply |= DP_AUX_NATIVE_REPLY_DEFER;
> > +               else
> > +                       msg->reply |= DP_AUX_I2C_REPLY_DEFER;
> > +               goto exit;
> > +       case AUX_STATUS_NACK:
> > +               if (is_native_aux)
> > +                       msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
> > +               else
> > +                       msg->reply |= DP_AUX_I2C_REPLY_NACK;
> > +               goto exit;
> > +       case AUX_STATUS_TIMEOUT:
> > +               ret = -ETIMEDOUT;
> > +               goto exit;
> > +       }
> > +
> > +       if (request == DP_AUX_NATIVE_READ || request == DP_AUX_I2C_READ) {
> > +               ret = regmap_noinc_read(map, PAGE0_AUX_RDATA, buf, len);
> > +               if (ret < 0)
> > +                       DRM_ERROR("failed to read PAGE0_AUX_RDATA");
>
> Needs a newline.
>
> > +       }
> > +
> > +exit:
> > +       pm_runtime_mark_last_busy(&client->dev);
> > +       pm_runtime_put_autosuspend(&client->dev);
> > +
> > +       if (ret)
> > +               return ret;
> > +
> > +       return len;
> > +}
> > +
> >  static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
> >                                      const enum ps8640_vdo_control ctrl)
> >  {
