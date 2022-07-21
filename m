Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35457C9C9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 13:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B7C8FD2E;
	Thu, 21 Jul 2022 11:36:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD1B8FD1B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 11:36:44 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id mz20so961738qvb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 04:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BEc2q0Ntqmu+9tKVZvoMBHZ3yF5u0x+IBXq0oc1TSOo=;
 b=bqXzpQi/ikfdMfe3U+F+lyzJgtkWHvoBhK2GpVED6KlSzicYAfUihqBkMNaUt++7pD
 iIGwWlFUBRr56LbK5NBlUT9jcUbXcX9DmE/S7Luef/y5myQ+qM4JPUDsuieDqD+2ral3
 ZKgWZa62NI/lFWKO9wBbMMi20Dm1B6JuzaxcxVPFeEBwiQ2iqN3/iYqICw4D5FhI7DCa
 Fj1j/ao8BFpO6t09cZdD/wCJYU5SttVXgbIjMb6q7H4HLSXWmKLdq0UbOzq4GGxdL+xw
 KuGoDgO40vkMERpb09aENa5UWGw4qP4LivOYMOg1RXibADF1AwIDknFpIa0iGcO+M+Y1
 R33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BEc2q0Ntqmu+9tKVZvoMBHZ3yF5u0x+IBXq0oc1TSOo=;
 b=SUQQE7CT2+3GlRMVJH20KhfJAe5Vw3jPKSryYHPxflr8YHZ5Y7nLUBCcW8L3x8dU5z
 g61GpIoFaDL5wbJuG9qwfNA4p/gfXQEEF5PyzB+cC3xXe7Afnn3z1Aoium6T+gNRIgLe
 /jOAYRHHzmzPSJIa0i+0twUw5rPTaYBULEKYngYts2oQt0TGp4KjKqPo3r/qK2WMYhR5
 zaUaPMSvVwLuzo3ShWnjxlDhqKuNCx+qZEC9m1W/RVy8hh7YVrwIG5crM2mwH/wHMRyW
 9vWxdTVH7MAn4EEzQHyNqShInXr/DBH1Pijp0jG0Ethbjdt3IWcWp1CEOPj6KQ1mJW7X
 teLA==
X-Gm-Message-State: AJIora8D9PyulIt/zYdBFklhNqNBns1DVrbEtdlMLnNWLjuvAPtVnMWt
 V+dUwlwGMyS7dVWaDOZNvCTf0CB5gThRR532SkUrqw==
X-Google-Smtp-Source: AGRyM1taaRRQqbb0thbIJjG2DjVe/FwkH8G89JhUW39J+IlppORh67jMBG6VtyWefuqqEq5lu2z7724SADMqpHkIFWw=
X-Received: by 2002:a05:6214:2a84:b0:473:2958:2b02 with SMTP id
 jr4-20020a0562142a8400b0047329582b02mr33742565qvb.122.1658403404031; Thu, 21
 Jul 2022 04:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220720155445.RFC.1.I2999ac2d08643f0c2f3fe916cca86f8c832c8142@changeid>
In-Reply-To: <20220720155445.RFC.1.I2999ac2d08643f0c2f3fe916cca86f8c832c8142@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Jul 2022 14:36:32 +0300
Message-ID: <CAA8EJpombZYHKXKd=rLte0pUaXjep0t7+H-uz_sFTuJwjH3y9A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/panel-edp: Allow overriding the eDP EDID
To: Douglas Anderson <dianders@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 thierry.reding@gmail.com, Sean Paul <seanpaul@chromium.org>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Jul 2022 at 01:55, Douglas Anderson <dianders@chromium.org> wrote:
>
> I found that writing to `/sys/kernel/debug/dri/*/eDP*/edid_override`
> wasn't working for me. I could see the new EDID take effect in
> `/sys/class/drm/card*-eDP*/edid` but userspace wasn't seeing it..
>
> The problem was that panel-edp was caching the EDID that it read and
> using that over and over again.
>
> Let's change panel-edp to look at the EDID that's stored in the
> connector. This is still a cache, which is important since this
> function is called multiple times and readin the EDID is slow, but
> this property is automatically updated by drm_get_edid() (which reads
> the EDID) and also updated when writing the edid_override in debugfs.
>
> Fixes: 63358e24ee79 ("drm/panel: panel-simple: Cache the EDID as long as we retain power")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

A different proposal for you to consider:
Change drm_get_edid/drm_do_get_edid to return int rather than struct
edid, while caching the EDID in the connector. Or maybe add a new API
drm_read_edid() and make drm_get_edid() deprecated in favour of it.
The goal should be to let all drivers use connector-cached EDID rather
than getting  the EDID, parsing it and kfree()ing it immediately
afterwards.
Most probably we should be able to move
drm_connector_update_edid_property() into drm_do_get_edid() and drop
it from the rest of the code. This might require additional thought
about locking, to ensure that nobody pulls the cached edid out from
under our feet.

Extra "bonus" points to consider:
- Maybe it's time to add get_edid() to the drm_panel interface, teach
panel_bridge about it and let drm_bridge_connector handle all the
details?

So, while this looks like a longer path, I think it's worth checking
that we can refactor this piece of code.

> ---
>
>  drivers/gpu/drm/panel/panel-edp.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 3626469c4cc2..12241c1e32f7 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -226,8 +226,6 @@ struct panel_edp {
>
>         const struct edp_panel_entry *detected_panel;
>
> -       struct edid *edid;
> -
>         struct drm_display_mode override_mode;
>
>         enum drm_panel_orientation orientation;
> @@ -580,11 +578,19 @@ static int panel_edp_get_modes(struct drm_panel *panel,
>         if (p->ddc) {
>                 pm_runtime_get_sync(panel->dev);
>
> -               if (!p->edid)
> -                       p->edid = drm_get_edid(connector, p->ddc);
> +               if (!connector->edid_blob_ptr) {
> +                       /*
> +                        * We read the EDID and then immediately free it,
> +                        * relying on the side effect of drm_get_edid() to store
> +                        * a copy in connector->edid_blob_ptr. We always use
> +                        * the copy cached in the connector since that allows
> +                        * the edid_override to work.
> +                        */
> +                       kfree(drm_get_edid(connector, p->ddc));
> +               }
>
> -               if (p->edid)
> -                       num += drm_add_edid_modes(connector, p->edid);
> +               if (connector->edid_blob_ptr)
> +                       num += drm_add_edid_modes(connector, connector->edid_blob_ptr->data);
>
>                 pm_runtime_mark_last_busy(panel->dev);
>                 pm_runtime_put_autosuspend(panel->dev);
> @@ -926,9 +932,6 @@ static int panel_edp_remove(struct device *dev)
>         if (panel->ddc && (!panel->aux || panel->ddc != &panel->aux->ddc))
>                 put_device(&panel->ddc->dev);
>
> -       kfree(panel->edid);
> -       panel->edid = NULL;
> -
>         return 0;
>  }
>
> --
> 2.37.0.170.g444d1eabd0-goog
>


--
With best wishes
Dmitry
