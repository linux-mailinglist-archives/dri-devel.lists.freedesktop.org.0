Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9969B5A5357
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E543610E9FF;
	Mon, 29 Aug 2022 17:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F01410E9FF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 17:38:32 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id h14so2941365ilh.10
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 10:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=0+dkz4XT6BC4woJUmIQjGs5an3772GdVi3+4JHxH154=;
 b=jbD2DuLHNNYoihk4LzL8I7Rt2XeDGhNOfaP5FSWQL18m6CJvxeqsk6NGNJc3pKMtCB
 qtyQY3mOVVMX/c7sISFt7WI40F5epfGh8PWqzimVQOsAGYrV/Z79EW/tCKw8qiEV134+
 BKJdoB3L3nm4raYojrDfvbo+x4qqgeo9DxO6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0+dkz4XT6BC4woJUmIQjGs5an3772GdVi3+4JHxH154=;
 b=q2kwKSkmGqFftiGnsGnK9CcIICa7VfuqFq2Bb+jARkJcOZ4jNgEsSRcTMMXOjqOWNJ
 mlZvV9tuYjZ12kSBJXRC4aRA1KhGxcPbsVlHW+kiJJdDnTAR+QL58eWHfUGwwxdaA+vu
 eGZvGKFScszAHn8q5YqkdIbB7KujCHPY4WXGqjowP1x9ZlPL9piWJd5GXjVv6npov8Xd
 oPe1excZSS74R60t3DKikt+r4h2ycd10vu64S8D+eOfRLO6FYw6SbuHgDQSnNPMmfPyS
 4BHAulxuJBD9yagC4jrkx8OXFedQ4CUc9ZPGZ2MUUE28CKPNXShUBbOYemdTwMqdn1kl
 hutw==
X-Gm-Message-State: ACgBeo2/G3ygo/lKL/s6SSL6Ux87ur+nI7dPajbfle0PfVK4s65UfUzZ
 SUliay3yUAMPXuMJOAwd0/rXCruozhtQKyCb
X-Google-Smtp-Source: AA6agR4RT+tFFCAHW187cvPCZn5QfcTmC+PajFFa7oRESHpahapg6UzlNADCbXMQJa/yWhznergyIA==
X-Received: by 2002:a05:6e02:1347:b0:2ea:e939:fef1 with SMTP id
 k7-20020a056e02134700b002eae939fef1mr4690614ilr.114.1661794711272; 
 Mon, 29 Aug 2022 10:38:31 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41]) by smtp.gmail.com with ESMTPSA id
 p8-20020a92c108000000b002ea9d1b0102sm4551424ile.39.2022.08.29.10.38.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 10:38:29 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id n202so7167386iod.6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 10:38:29 -0700 (PDT)
X-Received: by 2002:a05:6638:14d0:b0:349:d176:d376 with SMTP id
 l16-20020a05663814d000b00349d176d376mr9909135jak.58.1661794709288; Mon, 29
 Aug 2022 10:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220824130034.196041-5-tomi.valkeinen@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Aug 2022 10:38:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzcmDx+yZ5YQ3gqA_8Bc36YvtK8EH3MGTKtdmekjs5ew@mail.gmail.com>
Message-ID: <CAD=FV=UzcmDx+yZ5YQ3gqA_8Bc36YvtK8EH3MGTKtdmekjs5ew@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 24, 2022 at 6:00 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> Implement the bridge connector-related .get_edid() and .detect()
> operations, and report the related bridge capabilities and type.
>
> These ops are only added for DP mode. They should also be used for eDP
> mode, but the driver seems to be mostly used for eDP and, according to
> the comments, they've had issues with eDP panels and HPD. So better be
> safe and only enable them for DP for now.

Just to be clear: the "They should also be used for eDP" is not correct.

* The detect() function should be returning whether the display is
physically there. For eDP it is _always_ physically there. Thus for
eDP the _correct_ implementation for detect is to always return true.
Yes, there is a line called HPD for eDP and yes that line is used for
full DisplayPort for detecting a display. For eDP, though, HPD does
not detect the presence of a display. A display is always there.

* For eDP implementing get_edid() is done in the panel so that power
sequencing can be done properly. While it could have been designed
other ways, that's how we ended up in the end. Thus eDP controllers
don't implement get_edid().


> @@ -1163,10 +1165,33 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>         pm_runtime_put_sync(pdata->dev);
>  }
>
> +static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
> +{
> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +       int val = 0;
> +
> +       pm_runtime_get_sync(pdata->dev);
> +       regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
> +       pm_runtime_put_autosuspend(pdata->dev);
> +
> +       return val & HPD_DEBOUNCED_STATE ? connector_status_connected
> +                                        : connector_status_disconnected;
> +}

I thought in the end we decided that you _could_ get a hot plug detect
interrupt if you just did a pm_runtime_get_sync() sometime earlier in
the case of DP. Basically you're just saying that if you're DP that
you always powered up. Doing some searches makes me find some
discussion at:

https://lore.kernel.org/r/20220310152227.2122960-4-kieran.bingham+renesas@ideasonboard.com

Specifically, the right answer is: "In general the pm_runtime_get
reference need to go with the IRQ enabling"

In any case, if we want to start with just implementing "detect"
that's OK with me...

Thus with the commit message clarified, feel free to add my Reviewed-by.
