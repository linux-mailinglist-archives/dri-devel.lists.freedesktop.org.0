Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D1F5A505E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 17:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBCE10F436;
	Mon, 29 Aug 2022 15:43:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2E410F448
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 15:43:23 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lx1so16474801ejb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 08:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=1gC6KAeN4hK+T5/C1xIchUVixxArNMEM0+6b3ZBL0cY=;
 b=AwPrBVOn6PMMyZKXbbKJe8h0cRkqwybYzYA4tZIzMvYcgjbuogWBuNQjn5Pm3Tz12d
 c9uEu9/+gfCvxsB6itXt7CgC9K/dqXGxxi2GXjQRnMccK4SnSHtml8Lu9ZM2IHu92WjJ
 XE3mE8p1LzptYLJtuf6Q5eum/DSRmklYzSlxYguWB6tkFqZqDV9Of2SnEPu5mYSjRHwY
 H6KQGuRHo1IP9teWZc7G+QfiBxVwNB6lhRpUtuGCrR0FCDeUf7xWjNnzIiuW/CEQRSYm
 4ViHVP9SmbpbTk2hglET+pjth+WTd/IbqUtvHxlqu3G8x8cJlzUJbpJN3GXPV9ECDv1x
 MUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=1gC6KAeN4hK+T5/C1xIchUVixxArNMEM0+6b3ZBL0cY=;
 b=q2wQgncZDrfOzczdNwmkCFYenlCHN7oBaUsZnXeHLvLbglUyoLvU2lLAPreY13HTBw
 BqCdYlMC7pT2j8YKycfOKtFnPkMxej957r9j/ulqaJJSd8HMsijfkdyqnPj3QUcaehhZ
 BlU/k1EY4ubLGj11iqvsTNh0c2v3YU5CB0wb9xE0NtzWyjsBllF55aBEqweNQNXRQbNC
 yJE9QgLczvbDm8Kk2CJx9FzKEr7qo6v9mPj2HAXgjc4+ENJCZobfzixUjg4O/98FvlmB
 kqOFtSCn7rJ6RDm61yJLkXQjv1I2KYh0r5zzT4s53OUIuuHuhq6gKq5TfB0LEnLJ2h8B
 poWA==
X-Gm-Message-State: ACgBeo20jkSzyTqi2UDWmDEui6XCKpS+dJTlSkUPdLLUkP5dgARMTkZN
 g6oeJfPrY3+8pSv+DsJiiLV+JU36BZKLa76dPBUwgg==
X-Google-Smtp-Source: AA6agR4AFQm9aPxGG5tCQZ1oVHcA7DESoexd2mzEgm11p/wIEQj9NbIwRPP0DCKgvkeNw4mIe0i5/Q0v+51McsM/h00=
X-Received: by 2002:a17:907:9814:b0:73d:cb9f:c0b8 with SMTP id
 ji20-20020a170907981400b0073dcb9fc0b8mr14228415ejc.648.1661787801645; Mon, 29
 Aug 2022 08:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220826185733.3213248-1-l.stach@pengutronix.de>
In-Reply-To: <20220826185733.3213248-1-l.stach@pengutronix.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 17:43:10 +0200
Message-ID: <CAG3jFysMwWJ-6SfSM_mqFj057E8YXbqLwjSzEFMsaxh=TKJLKg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: bridge: dw_hdmi: only trigger hotplug event on
 link change
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, kernel@pengutronix.de,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Aug 2022 at 20:57, Lucas Stach <l.stach@pengutronix.de> wrote:
>
> There are two events that signal a real change of the link state: HPD going
> high means the sink is newly connected or wants the source to re-read the
> EDID, RX sense going low is a indication that the link has been disconnected.
>
> Ignore the other two events that also trigger interrupts, but don't need
> immediate attention: HPD going low does not necessarily mean the link has
> been lost and should not trigger a immediate read of the status. RX sense
> going high also does not require a detect cycle, as HPD going high is the
> right point in time to read the EDID.
>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> (v1)
> ---
> v2: Take HDMI_PHY_RX_SENSE into account when reporting disconnect
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 25a60eb4d67c..40d8ca37f5bc 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3096,6 +3096,7 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>  {
>         struct dw_hdmi *hdmi = dev_id;
>         u8 intr_stat, phy_int_pol, phy_pol_mask, phy_stat;
> +       enum drm_connector_status status = connector_status_unknown;
>
>         intr_stat = hdmi_readb(hdmi, HDMI_IH_PHY_STAT0);
>         phy_int_pol = hdmi_readb(hdmi, HDMI_PHY_POL0);
> @@ -3134,13 +3135,15 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
>                         cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
>                         mutex_unlock(&hdmi->cec_notifier_mutex);
>                 }
> -       }
>
> -       if (intr_stat & HDMI_IH_PHY_STAT0_HPD) {
> -               enum drm_connector_status status = phy_int_pol & HDMI_PHY_HPD
> -                                                ? connector_status_connected
> -                                                : connector_status_disconnected;
> +               if (phy_stat & HDMI_PHY_HPD)
> +                       status = connector_status_connected;
> +
> +               if (!(phy_stat & (HDMI_PHY_HPD | HDMI_PHY_RX_SENSE)))
> +                       status = connector_status_disconnected;
> +       }
>
> +       if (status != connector_status_unknown) {
>                 dev_dbg(hdmi->dev, "EVENT=%s\n",
>                         status == connector_status_connected ?
>                         "plugin" : "plugout");

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
