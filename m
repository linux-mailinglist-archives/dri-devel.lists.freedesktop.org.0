Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C8993131E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 13:32:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C2110E21A;
	Mon, 15 Jul 2024 11:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gN+RZVhq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1203910E21A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 11:32:40 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-e03a63ec15eso3958565276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 04:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721043159; x=1721647959; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jogpdw07nqWdBOTLr4+aPckD0RPbKM+NzNUz/Z1iCeg=;
 b=gN+RZVhqsnoTVIVQZL0vuhJ6gpLnP0U5kpKYt+nZCz/U/zXtkPL4E4rGk0y4vrJbDg
 OUNhudlCCAdS4m1Ytwf5LbKuJsCKSLqRjtiCaLlCictCPx8fPaoTLwhkwISsr9TBrXxX
 R8DNna5SGtsCZ+c/ft7AXxH4ixByAS3GjJSvbOS1IlwPi98apTAKBCG007ld0oU80JMq
 dxaKTr+mr0a4giSrvryvsOFSA0OwxngwDBfJcNLfFg9kXCHc4fX3B79oVVQc5rZkWtws
 JFwjCFaSsRKV3OJrrdIHv/7dlLApFwQQC5JUoE7PAKh7ToD2SUMyROEW6cHXhIjy1ykN
 aDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721043159; x=1721647959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jogpdw07nqWdBOTLr4+aPckD0RPbKM+NzNUz/Z1iCeg=;
 b=PRbSyEWib+599QTYjvt5RsgBjayysVmHUjV+MvrHuTHORb83+hEgmPDnnYBngxJAB6
 w9hJVxCDoHEPJezOOxjbCCLoNVj0uZsp7o5JTI0qdmInJpK2RfBsCS/+UQu2IHYbpwXk
 CgBCYIljIiwKyuCqXpXpY8q0tSvks6plQUWo+DVtgy6o6ruvpLPFTa+msubTDhaHbKql
 NRG3t4x1LPHevSp8JkdLgkAlVIA5z29roLGvKOtmtfFwUjRtoOmdnL7mr8vUq/zMzitR
 W6ZyzQHQWwarMKH4BRAv5ClDQnVZBEBABNqngcIDcAT8syAfSY4oKXaxjgs4RXUg1llJ
 bWvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvit2eq+GWWsmon+gskARq0FzWMSCJOMgUaezr2nP6T4gyveke8oLJke3k7L8S6lIG1U8n4FIzNut0DM9z47id/jq+cNcSd/nXuluSNb7p
X-Gm-Message-State: AOJu0Yx3wft1ScRX8ANJfq6Z0i3r0zkSDtv4MdILkdoxIZigqv/XuHzq
 usEj+7wx4mxDAilVkYDPFjseEmitkdbJwuxY9dyhdde7EVfOcRC3Hw7U534zRZhAmK063H2pKiS
 EfDwVVutIsrLBOQ253MG6ZuKRRVSlFiPf9moWkA==
X-Google-Smtp-Source: AGHT+IF9lmgFAw7fB03mWJ+kiazuSLnjkXpBjqshoqF+XqRzDmcbRiL7gcCzcPqwVVHx94WtpgGBV68SYHs6dWv1J/U=
X-Received: by 2002:a25:2704:0:b0:e03:5f7f:1215 with SMTP id
 3f1490d57ef6-e041b095eb0mr21171574276.38.1721043158913; Mon, 15 Jul 2024
 04:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240715031845.6687-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240715031845.6687-2-lvzhaoxiong@huaqin.corp-partner.google.com>
In-Reply-To: <20240715031845.6687-2-lvzhaoxiong@huaqin.corp-partner.google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Jul 2024 14:32:26 +0300
Message-ID: <CAA8EJpp8LvzKdHR2y-f-qtfx-fLSOwxG_CXTCrtV6JWnzX_YmQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] drm/panel: boe-th101mb31ig002 : Fix the way to get
 porch parameters
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com, 
 mripard@kernel.org, dianders@google.com, hsinyi@google.com, 
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Mon, 15 Jul 2024 at 06:19, Zhaoxiong Lv
<lvzhaoxiong@huaqin.corp-partner.google.com> wrote:
>
> The current driver can only obtain the porch parameters
> of boe-th101mb31ig002. Modify it to obtain the porch
> parameters of the panel currently being used.
>
> Fixes: 24179ff9a2e4524 ("drm/panel: boe-th101mb31ig002 : Make it compatible with other panel.")
>
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

No empty line between Fixed and Sign-off-by


> ---
>  drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> index b55cf80c5522..d4e4abd103bb 100644
> --- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> +++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
> @@ -312,15 +312,14 @@ static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
>         struct boe_th101mb31ig002 *ctx = container_of(panel,
>                                                       struct boe_th101mb31ig002,
>                                                       panel);
> +       const struct drm_display_mode *desc_mode = ctx->desc->modes;
>         struct drm_display_mode *mode;
>
> -       mode = drm_mode_duplicate(connector->dev,
> -                                 &boe_th101mb31ig002_default_mode);
> +       mode = drm_mode_duplicate(connector->dev, desc_mode);
>         if (!mode) {
>                 dev_err(panel->dev, "Failed to add mode %ux%u@%u\n",
> -                       boe_th101mb31ig002_default_mode.hdisplay,
> -                       boe_th101mb31ig002_default_mode.vdisplay,
> -                       drm_mode_vrefresh(&boe_th101mb31ig002_default_mode));
> +                       desc_mode->hdisplay, desc_mode->vdisplay,
> +                       drm_mode_vrefresh(desc_mode));
>                 return -ENOMEM;

Please add a followup switching to drm_connector_helper_get_modes_fixed()

>         }
>
> --
> 2.17.1
>


-- 
With best wishes
Dmitry
