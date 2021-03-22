Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBFA343CEF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 10:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B6A889D5C;
	Mon, 22 Mar 2021 09:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196AB89D58
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:37:08 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id o2so6239380plg.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 02:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NwUM0uQxUqhm1YVIReKtCkfGLNGPmzKidaPgCqb8BBE=;
 b=gXbh9UMfvUZZiaSKPj0kATlaIUUP7yHi/S4AuIprB1LM1sL3NBD2ibBMw5jhAHgzf9
 Ql66huAzH35AmvpUP3mfQgwNfNL4TYfMotCgXSF/Uk6vSmPfRCWofSCmilHmrg/ie2nw
 GmoBoItlOUdNUdEPYcCY1V1z+lYshyYviRoX6H21LLNR/KFNbds2/uFFKQHdWSrZiRD2
 X78CC9qcZ03bvcUXRclDKKICbYzm4Ey36b7kzC4uf8qqmpmec0/sd3I1yWCrQlmQ47LU
 ca/0OgJgC1owGu3qKZtNtgf1p+Dss+gCs0PkDbm1m6gfFT3auF4SjXPv3rJy6Za2Xgbv
 wQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NwUM0uQxUqhm1YVIReKtCkfGLNGPmzKidaPgCqb8BBE=;
 b=Q1oQGKKoLTxW8HFvFb+0RgzRUGjDHz8NdNGgSVxWc5au8xz3d9hmNVEfUBs85eZ54M
 JOnFdCWmQHIRRhhD7MMpQN0Opt1QGE0Fopf1xJ6R/Xn0gob2gd86eP+BjSW6JmxIMzms
 46m9DJALPGEpXIu3SJuMKj/A/Cltpq5rXm+FA2Ex9vp62l+bvY6+ojnxHpEZR56LQtGf
 DcsBSkrpEQzb5WhITGWo3p2On8ivBWI9aPAk8YofKjK6kTWLvT0KfHDp92cuWx43Wj9b
 8OVRHJEY09jbB9kCt4B5gGcOs5sBrjr8nzkXyLweH6B5QwwctVSywl6EEE4cxvTdexRB
 ptcw==
X-Gm-Message-State: AOAM533ansg8O73dDOl5QZQ1AaVBGqEWuojjJZZD78pwNLvxtGVtUWCk
 amS0eLypQo75XqftD2nBSbe6ES44WcR9hiNeQ9YAhw==
X-Google-Smtp-Source: ABdhPJwsG4deEbsCFps8vjx+pZ/Q1xmfX79FHPiSz5iek499vlHWh/Zc0A69Qb6RKbutmQfpNMo+NtJTRMLS0jJut+k=
X-Received: by 2002:a17:902:7d8d:b029:e6:4061:b767 with SMTP id
 a13-20020a1709027d8db02900e64061b767mr26216108plm.32.1616405827745; Mon, 22
 Mar 2021 02:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616135353.git.xji@analogixsemi.com>
 <ff689dae07ba1440b96f4804468d9c4203d22d68.1616135353.git.xji@analogixsemi.com>
In-Reply-To: <ff689dae07ba1440b96f4804468d9c4203d22d68.1616135353.git.xji@analogixsemi.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 22 Mar 2021 10:36:56 +0100
Message-ID: <CAG3jFysRwmx5mN5kHh-L0N2Az_csitr0ckovxJvCAFsfo96ZXA@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] drm/bridge: anx7625: fix not correct return value
To: Xin Ji <xji@analogixsemi.com>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Xin,

This patch looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Mar 2021 at 07:33, Xin Ji <xji@analogixsemi.com> wrote:
>
> At some time, the original code may return non zero value, force return 0
> if operation finished.
>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 65cc05982f82..04536cc7afe7 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -189,10 +189,10 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
>                                AP_AUX_CTRL_STATUS);
>         if (val < 0 || (val & 0x0F)) {
>                 DRM_DEV_ERROR(dev, "aux status %02x\n", val);
> -               val = -EIO;
> +               return -EIO;
>         }
>
> -       return val;
> +       return 0;
>  }
>
>  static int anx7625_video_mute_control(struct anx7625_data *ctx,
> --
> 2.25.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
