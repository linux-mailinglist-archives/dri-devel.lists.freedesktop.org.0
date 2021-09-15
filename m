Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F385A40BCCA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 02:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CC96E881;
	Wed, 15 Sep 2021 00:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5F6E881
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 00:57:19 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso1252607ots.5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 17:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=A+8E2Y0vn6pdEtI3eg1yYcrgDg6slBoozFfrvzmkDcg=;
 b=FDTRV2auKoz4uUsAoyif0Q11y2E562FCDY7HCF7DFrPkkI6Kfce2CyG8oB/DMgR+0q
 LGmgXs3MLsFmNga+bucZQniDLmW5O9s6p5QExDDHdx0QpYQHBkx3epWlMnq/D3AGc6lp
 pFaf8Ctzrx53uDIsf1X7WHwfjRPnMAELSSL1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=A+8E2Y0vn6pdEtI3eg1yYcrgDg6slBoozFfrvzmkDcg=;
 b=A0YAlq4ZwzZpil7UtRXFQ192jcxiexGunDqc6EXPhP3hIaIwAKOPxmAlnR0Vq5vGe/
 GUnQRX6bljnbAikWjuVYZf8MgIqFMbdXJgVq2o/sk58EOIGyGCYEiFUb9MNQRSxdJxIN
 y3iKBHJ0NTl9EgiFk1LMX3ibSh+NAL15ZX3X8PaVhJjn4KNJFIpP8UiD3d+d2xu2tulL
 b2H9VI6QEn+d3wj8fTReCFAxWLSKIGUM5YMuXEKVGJfwn9IySB7KPSzHDoVgvG5iKcI+
 pMh5rDzkcq2eNEvlFCwrR4XtOKecbkHJJA7N1e/5tVhWrSu73B9zydfD+E/dl+qVXMGF
 bNtw==
X-Gm-Message-State: AOAM531QlY4AMn0Mlu1gZIvWmvl2jDgfJDZBT3dIA1VS4kjD6mY00Oxq
 7LfGc/yow84tjhhzsh1H1nFPTHEfa6pEIDDgCOWPHQ==
X-Google-Smtp-Source: ABdhPJwhCQ4YlSpqKn4QcawGKsoKnUPsrOU6EgMd9jfkqCyoLjwLS+kyW1x+b1hMSt3cYBytE10AaSLnR4fGJxqsgWY=
X-Received: by 2002:a05:6830:18c7:: with SMTP id
 v7mr17202302ote.126.1631667438319; 
 Tue, 14 Sep 2021 17:57:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Sep 2021 17:57:17 -0700
MIME-Version: 1.0
In-Reply-To: <20210914162825.v3.3.Ibf9b125434e3806b35f9079f6d8125578d76f138@changeid>
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.3.Ibf9b125434e3806b35f9079f6d8125578d76f138@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 14 Sep 2021 17:57:17 -0700
Message-ID: <CAE-0n51JFM_yYdOsCQyvdMw5xXJ7REcbOJC6qi=6nfiNcdvnWw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>
Cc: dianders@chromium.org, Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org
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

Quoting Philip Chen (2021-09-14 16:28:45)
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index 8d3e7a147170..dc349d729f5a 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -117,6 +144,129 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
[...]
> +       case DP_AUX_I2C_WRITE:
> +       case DP_AUX_I2C_READ:
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       ret = regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
> +       if (ret) {
> +               dev_err(dev, "failed to write PAGE0_AUXCH_CFG3: %d\n", ret);

Can we use DRM_DEV_ERROR()?

> +               return ret;
> +       }
> +
> +       /* Assume it's good */
> +       msg->reply = 0;
> +
> +       addr_len[0] = msg->address & 0xff;
> +       addr_len[1] = (msg->address >> 8) & 0xff;
> +       addr_len[2] = ((msg->request << 4) & SWAUX_CMD_MASK) |
> +               ((msg->address >> 16) & SWAUX_ADDR_19_16_MASK);

It really feels like this out to be possible with some sort of
cpu_to_le32() API. We're shoving msg->address into 3 bytes and then
adding in the request and some length. So we could do something like:

	u32 addr_len;

	addr_len = FIELD_PREP(SWAUX_ADDR_MASK, msg->address);
	addr_len |= FIELD_PREP(SWAUX_CMD_MASK, msg->request);
	if (len)
		addr_len |= FIELD_PREP(LEN_MASK, len - 1);
	else
		addr_len |= FIELD_PREP(LEN_MASK, SWAUX_NO_PAYLOAD );
	
	cpu_to_le32s(&addr_len);

	regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, &addr_len, sizeof(addr_len));

> +       addr_len[3] = (len == 0) ? SWAUX_NO_PAYLOAD :
> +                       ((len - 1) & SWAUX_LENGTH_MASK);
> +
> +       regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, addr_len,
> +                         ARRAY_SIZE(addr_len));
> +
> +       if (len && (request == DP_AUX_NATIVE_WRITE ||
> +                   request == DP_AUX_I2C_WRITE)) {
> +               /* Write to the internal FIFO buffer */
> +               for (i = 0; i < len; i++) {
> +                       ret = regmap_write(map, PAGE0_SWAUX_WDATA, buf[i]);
> +                       if (ret) {
> +                               dev_err(dev, "failed to write WDATA: %d\n",

DRM_DEV_ERROR?

> +                                       ret);
> +                               return ret;
> +                       }
> +               }
> +       }
> +
> +       regmap_write(map, PAGE0_SWAUX_CTRL, SWAUX_SEND);
> +
> +       /* Zero delay loop because i2c transactions are slow already */
> +       regmap_read_poll_timeout(map, PAGE0_SWAUX_CTRL, data,
> +                                !(data & SWAUX_SEND), 0, 50 * 1000);
> +
> +       regmap_read(map, PAGE0_SWAUX_STATUS, &data);
> +       if (ret) {
> +               dev_err(dev, "failed to read PAGE0_SWAUX_STATUS: %d\n", ret);

DRM_DEV_ERROR?

> +               return ret;
> +       }
> +
> +       switch (data & SWAUX_STATUS_MASK) {
> +       /* Ignore the DEFER cases as they are already handled in hardware */
> +       case SWAUX_STATUS_NACK:
> +       case SWAUX_STATUS_I2C_NACK:
> +               /*
> +                * The programming guide is not clear about whether a I2C NACK
> +                * would trigger SWAUX_STATUS_NACK or SWAUX_STATUS_I2C_NACK. So
> +                * we handle both cases together.
> +                */
> +               if (is_native_aux)
> +                       msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
> +               else
> +                       msg->reply |= DP_AUX_I2C_REPLY_NACK;
> +
> +               len = data & SWAUX_M_MASK;
> +               return len;

Why no 'return data & SWAUX_M_MASK;' and skip the assignment?

> +       case SWAUX_STATUS_ACKM:

Move this up and add fallthrough?

> +               len = data & SWAUX_M_MASK;
> +               return len;
> +       case SWAUX_STATUS_INVALID:
> +               return -EOPNOTSUPP;
> +       case SWAUX_STATUS_TIMEOUT:
> +               return -ETIMEDOUT;
> +       }
> +
> +       if (len && (request == DP_AUX_NATIVE_READ ||
> +                   request == DP_AUX_I2C_READ)) {
> +               /* Read from the internal FIFO buffer */
> +               for (i = 0; i < len; i++) {
> +                       ret = regmap_read(map, PAGE0_SWAUX_RDATA, &data);
> +                       buf[i] = data;

Can drop a line

		ret = regmap_read(map, PAGE0_SWAUX_RDATA, buf + i);

> +                       if (ret) {
> +                               dev_err(dev, "failed to read RDATA: %d\n",
> +                                       ret);
> +                               return ret;
> +                       }
> +               }
> +       }
> +
> +       return len;
> +}
