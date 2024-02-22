Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88D860480
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 22:12:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6155110EA82;
	Thu, 22 Feb 2024 21:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zDjSHMPd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0859E10EA8C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 21:12:31 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-dc745927098so117043276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 13:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708636350; x=1709241150; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fenjTlVOLcRdKZFsqaTFAV94+jNqh66pMdN4WeCK6m8=;
 b=zDjSHMPdxA7yrwt+cVhc+5l60GRIcyzcNxEB8Ju3c9j82onQGf8z+a+BVYnm754f5g
 gZWpD8+8j5uVLcawNujwm6OY6B8TZhpWeFJbTgkA9eszkzOvqEHi/ECM8ighbDWdB7lM
 YmItGZMY2f3YS8LYMMIHXkJ5RM6lDZkqVMZldHaDyuwc4r1FM9OJ6fhlCcXovFPk4HcX
 ury34oS8BV4bOdBDEVwF+rga46OhIUsU/rDOWdVtt9NjlpGV9atQFdmK085x7qucPeXj
 uJJYRYBQNJTJAtZJBxASKt5lbWgfG1VWZ9Fg+6aTkXgFT6FAnPPfSTKSQQw1EfgOu8Y3
 R5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708636350; x=1709241150;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fenjTlVOLcRdKZFsqaTFAV94+jNqh66pMdN4WeCK6m8=;
 b=uBUyOTr7/wIk7C8xw4XtqUUr4ZzIIIc9QSYRavQHvzprI6BgDrK7VXeEjsI1/LE+t7
 VgPTxo0IdIoyymeD59F5ffMO44uEQ19BOyz8sinVNu4F0EY9FljcVPRLvL6yeCiykMNH
 l175C1x+BIfVrKABq87ytpYqmezhO7VO8DE1jvjccxWmEQo8pphm4gB8iThLK6aWVvR1
 Xuw/2Gz7qeHNWgrmzQiJJUn2vd9auI5q/Pk0zLG7U57hvyQV2fTRM4xnNyHpyAiLutIy
 b9zOPvA+367kak1xjJgnnIVbGkPN4OzJzFkuDLUgJwI7FWkyDGUJKcxCMQaW7/zmGWHE
 4wzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5GzZkbGV8NSzTDuGdM/ELuk1MNjpfM2GDi5AS6BC9HKuxaCl9/9bPjq4ojMx12IYvkCrpk+l65T9+cqA1REgoMbilwqg8O4+okXUC9Nm5
X-Gm-Message-State: AOJu0Yw+DdavYZA+uaC0LgAIrEYnCNaobXSiOxTp9g/XsYb1La0jDsLz
 4GTOwGTm5554Bp+IEMMBn7rRI+xUL6sFwvkKMtiQKUw+FtmlNC3bQgWIKTsNdAZ1tEXNbutiHcU
 a5mRplMZaU3GICHF6UmLP56uIunOv+dQ8mBUZ1g==
X-Google-Smtp-Source: AGHT+IFh2TAl89Hutu4vqCYOc5+0AJ9qQayg9ScjNq2n3H/zD5V2O2sGDJBBs2zipfHmjaQpRtAUdHsgH00u4T387Jo=
X-Received: by 2002:a25:2747:0:b0:dcd:3338:a3c5 with SMTP id
 n68-20020a252747000000b00dcd3338a3c5mr382880ybn.33.1708636349969; Thu, 22 Feb
 2024 13:12:29 -0800 (PST)
MIME-Version: 1.0
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-7-johan+linaro@kernel.org>
In-Reply-To: <20240217150228.5788-7-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:12:18 +0200
Message-ID: <CAA8EJppPg7b-DsPJ4W=2G-_rRq+xTux9kJ3oJhD2ws+FoJvkKQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] phy: qcom-qmp-combo: fix type-c switch registration
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, stable@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
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

On Sat, 17 Feb 2024 at 17:03, Johan Hovold <johan+linaro@kernel.org> wrote:
>
> Due to a long-standing issue in driver core, drivers may not probe defer
> after having registered child devices to avoid triggering a probe
> deferral loop (see fbc35b45f9f6 ("Add documentation on meaning of
> -EPROBE_DEFER")).
>
> Move registration of the typec switch to after looking up clocks and
> other resources.
>
> Note that PHY creation can in theory also trigger a probe deferral when
> a 'phy' supply is used. This does not seem to affect the QMP PHY driver
> but the PHY subsystem should be reworked to address this (i.e. by
> separating initialisation and registration of the PHY).
>
> Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
> Cc: stable@vger.kernel.org      # 6.5
> Cc: Bjorn Andersson <quic_bjorande@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Note to myself (or to anybody else, who has spare hands), we should
probably implement the same changes for phy-qcom-qmp-usbc.c

>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index e19d6a084f10..17c4ad7553a5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3562,10 +3562,6 @@ static int qmp_combo_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> -       ret = qmp_combo_typec_switch_register(qmp);
> -       if (ret)
> -               return ret;
> -
>         /* Check for legacy binding with child nodes. */
>         usb_np = of_get_child_by_name(dev->of_node, "usb3-phy");
>         if (usb_np) {
> @@ -3585,6 +3581,10 @@ static int qmp_combo_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_node_put;
>
> +       ret = qmp_combo_typec_switch_register(qmp);
> +       if (ret)
> +               goto err_node_put;
> +
>         ret = drm_aux_bridge_register(dev);
>         if (ret)
>                 goto err_node_put;
> --
> 2.43.0
>


-- 
With best wishes
Dmitry
