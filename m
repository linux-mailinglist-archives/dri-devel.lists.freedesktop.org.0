Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6669D5A52ED
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 19:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B820210E8AD;
	Mon, 29 Aug 2022 17:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDE010E8AD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 17:15:17 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id e195so1160416iof.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 10:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=b/SalKhfXUzPfFFWGoMQf6KV6Onv2cD5do6b8w0a8NQ=;
 b=LR5kh+0YxGaJkkn1CDlJWUdWIu5w5tYFcx0/Bb0wvCdNzG48kN9JU1e6oI5BVd4d+F
 Q76lcwOgrEqr/r63hDNpODe8Q5xSZa73UdrqfNnbsfyeW85eYunuPjzQ6oMWUy4IekhX
 /9Act2nsQxY9/vReDytXsbgMxkAQLf4gJBkzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=b/SalKhfXUzPfFFWGoMQf6KV6Onv2cD5do6b8w0a8NQ=;
 b=1deRuiYczwsvPRMTsDYPxow94OEQdGEp9fPnA3Rb97IxDPqZEls2YzGFIwatKOVe/1
 u142Uf602sMr5vIbLglFXtJu2eCABMXjNLC4ZJvc6IngcRf1UuIYcsAbow4tC7EDlZUt
 xUwUrXqqwdI5L8m5zF2yDRz5ULdYsJ+xuaumtOmKuhx+Dz2M+yMd1wpaFKZ8vHxBVJec
 EecYtXi6CgRf1D7X3AAQvIVIHsedGGQmlncPVC74pkcb3yxR2E9x1ZJspULSogQBjlWf
 XPm3lp565cnrL+osumc5hN+Da/JhfbERcCeZPLW5+z7qm0FQf+lNOJwoA24Eggxq0Gh4
 Pzxg==
X-Gm-Message-State: ACgBeo1g5nrjyCWwcp+C2QpSVHrE5f1ev7h5m2OGQ6tX891q5Cwkus5P
 L6rw0rA4+8Dt3h1/ABzc1yyCpWN/a14RgQz5
X-Google-Smtp-Source: AA6agR5D55qhbaxy3/YHSQwlUDLoRMCH1ReE/OXGeflNPVKWlHT3hlSgi8uDe+Xa0vo10t3HfFrSIA==
X-Received: by 2002:a05:6638:3e86:b0:349:fe9d:2b83 with SMTP id
 ch6-20020a0566383e8600b00349fe9d2b83mr10411572jab.127.1661793316509; 
 Mon, 29 Aug 2022 10:15:16 -0700 (PDT)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45]) by smtp.gmail.com with ESMTPSA id
 10-20020a056e0211aa00b002eac21bef51sm3490800ilj.33.2022.08.29.10.15.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 10:15:15 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id y187so7127450iof.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 10:15:15 -0700 (PDT)
X-Received: by 2002:a05:6602:2e05:b0:689:4f74:9264 with SMTP id
 o5-20020a0566022e0500b006894f749264mr8872722iow.2.1661793314994; Mon, 29 Aug
 2022 10:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220824130034.196041-1-tomi.valkeinen@ideasonboard.com>
 <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220824130034.196041-2-tomi.valkeinen@ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 29 Aug 2022 10:15:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VD5HugTsQFD-B2goondjR2vD-92mjb9syR2XOD9uBptQ@mail.gmail.com>
Message-ID: <CAD=FV=VD5HugTsQFD-B2goondjR2vD-92mjb9syR2XOD9uBptQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] drm/bridge: ti-sn65dsi86: check AUX errors better
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 24, 2022 at 6:01 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>
> The driver does not check AUX_IRQ_STATUS_NAT_I2C_FAIL bit at all when
> sending AUX transfers,

It doesn't? What about a few lines down from where your patch modifies
that reads:

  else if (val & AUX_IRQ_STATUS_NAT_I2C_FAIL) {

That seems like it's checking that bit?


> which leads to the driver not returning an error.

Right that it doesn't return an error. I guess the question is: should
it? Right now it sets the proper reply (DP_AUX_I2C_REPLY_NACK or
DP_AUX_NATIVE_REPLY_NACK) and returns 0. Is it supposed to be
returning an error code? What problem are you fixing?

In commit 982f589bde7a ("drm/bridge: ti-sn65dsi86: Update reply on aux
failures"), at least, we thought that returning "0" and setting the
"reply" was the correct thing to do (though we didn't have any good
setup to test all the error paths).

...and looking through the code at drm_dp_i2c_do_msg(), I see that it
only ever looks at DP_AUX_I2C_REPLY_NACK if "ret" was 0.

So I guess I would say:

1. Your patch doesn't seem right to me.

2. If your patch is actually fixing a problem, you should at least
modify it so that it doesn't create dead code (the old handling of
AUX_IRQ_STATUS_NAT_I2C_FAIL is no longer reachable after your patch.

Naked-by: Douglas Anderson <dianders@chromium.org>
