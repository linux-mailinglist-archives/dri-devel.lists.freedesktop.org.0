Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EA25F490B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 20:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE1510E06C;
	Tue,  4 Oct 2022 18:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC1B10E06C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 18:08:27 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id u21so15744330edi.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 11:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=jC2Z0Rq8KzrIn2M14f40auMdiALakB9uhtAKJ2D30WE=;
 b=tVgrkfwyu0EwTYsWPicPCzkorD/9APy3xtpCQYIw/QOWdVBhahk7rfEQ2aTFISj3UD
 gkJZG81ELQao7jA37nRONh0PXZGy2MHjB7fGTNGM10K0k6eOCprhVe4IKVKnbdbbBroF
 5ap0b5028rD7C4Eki3DF7XI+SZMSD6gRXUiw0LLY6yvQFMeYobYt7ny8ZA3zj60p/Fmn
 fHIEdGNv6+AkApsibdvpx++5hhuVuXQ4I/Rau1/HutSbaGBXsSz9uKVtraKF+fzB0bwG
 0wRzvr4XpYK8JPO1u+/M473l5BZaXIrkcTfM3A6GgZlNAuS5iGyqLsEKYAw94Ks6MY/F
 l5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=jC2Z0Rq8KzrIn2M14f40auMdiALakB9uhtAKJ2D30WE=;
 b=47vRhWP5ICuz3FjaMa+Cy+pCjyKspOga1oxrrNDo4Pp7ohr3wXE0b2Vcfht0lLOYKo
 cAL4bCuhqa6L0VSm5lI0fSPiM8RMFBFtBLSxJppd5zGB6fIC51UgFUx9PugJDBn+wLOr
 DgfNuXdaVWjZoXDTxTKdXAwnmm/U3uVTRDv3i8Ot0l65vAStWzoeALje/PCmnvHC+vcc
 0CDMrWFk+fsscpWnbYvdgiiEH4DNsIJuvOyiAmfkO/hlp0SeohfKQ3Iukz3mJe7wp9ul
 jL5+7l6enKj5XEdHKzLQBXn8i3yPO4ZVfz7BTijEB+LvkbaiPE4G+GmUGwBz+gA4MDuB
 nMZQ==
X-Gm-Message-State: ACrzQf2+rG1AbnAzMte7Vqnp3f17LmqwoHiU10dw1C7ScNgBXdkLp9tS
 Uf/L5lvL7tsi//w1lQYX8WYPV2OaM41XvGo/D3KZMA==
X-Google-Smtp-Source: AMsMyM4Clf1EbZYHxUrXWxi/uVCDnoz13jp94XPwLfvQnfm0/PLrIaetYzp1vDoVe4N5tM1qzqPodDBjH34t2ylj5y0=
X-Received: by 2002:a05:6402:901:b0:454:2b6d:c39 with SMTP id
 g1-20020a056402090100b004542b6d0c39mr24491555edz.50.1664906905897; Tue, 04
 Oct 2022 11:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220901131951.1116512-1-t.remmet@phytec.de>
In-Reply-To: <20220901131951.1116512-1-t.remmet@phytec.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 4 Oct 2022 20:08:14 +0200
Message-ID: <CAG3jFyu_c5=rM2o_jDJriAKMtroHupGgx0ZZADMYM9jkmv-eeg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: tc358775: Do not soft reset i2c-slave
 controller
To: Teresa Remmet <t.remmet@phytec.de>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, upstream@phytec.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 1 Sept 2022 at 15:20, Teresa Remmet <t.remmet@phytec.de> wrote:
>
> Soft reset during tc_bridge_enable() is triggered by setting all available
> reset control bits in the SYSRST register.
> But as noted in the data sheet resetting the i2c-slave controller should
> be only done over DSI and is only useful for chip debugging.
> So do not set RSTI2CS (bit0).
>
> Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
> ---
>  drivers/gpu/drm/bridge/tc358775.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> index f1c6e62b0e1d..a5f5eae1e80f 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -408,7 +408,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
>                  (val >> 8) & 0xFF, val & 0xFF);
>
>         d2l_write(tc->i2c, SYSRST, SYS_RST_REG | SYS_RST_DSIRX | SYS_RST_BM |
> -                 SYS_RST_LCD | SYS_RST_I2CM | SYS_RST_I2CS);
> +                 SYS_RST_LCD | SYS_RST_I2CM);
>         usleep_range(30000, 40000);
>
>         d2l_write(tc->i2c, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> --
> 2.25.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>

Waiting a few days before applying this patch.
