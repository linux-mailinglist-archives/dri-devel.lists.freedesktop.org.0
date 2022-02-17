Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAC44BABF5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 22:44:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED93D10E842;
	Thu, 17 Feb 2022 21:44:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B74310E849
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 21:44:08 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id d3so10954990qvb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 13:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6R8qn+rbL8OvPipxuVgINO0b1lTKNrdKLs//Tzx1/Vg=;
 b=OUIGVb3AgkfYqWJ/jpUcEbfG8cQNrWOf8W2dm9Aqt3J2zie173GvWoJ6AE1eFBXLC+
 BSrfwVz9fk/DeGoOPMaaLOco12vCxmYrdThUp0Oa9hS/3sFO6UnQIqVcOO4F2xKxh+PS
 KxCRQL7yuVFQ8uZvzWDrWsR0S/qmvs3ZYwPY2d2PLEzOwj61ELQhYX+B1P1CQWUgQ3AI
 ZxF2302qHhiCMNBL+mmWhLle2wsG0oQerm4BN3OG3PPiqrNpxvWA/AyXeef6nJeL8ksP
 FrqLcsYjKGcHLtKtfpcvyAxnuIyMEMepLLNdQ1yYlz2Ado2t2Fueu8AP/0v5WbaBpg5o
 +kWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6R8qn+rbL8OvPipxuVgINO0b1lTKNrdKLs//Tzx1/Vg=;
 b=ZcVbL4JZY1tkml0ZjW85ULZ+pFsYkwRyRTZJsuWKr7gwnrxfMm1lWO161mD1LmZP4h
 bNt5YTbGVxG4AT8ZgepWU9ByqR0IIIOTEfIH7GJgxWnClJTWFl/Ba1TN2lsEtqNrOePg
 r+qepO5VH540r2eUWuYQ31iSlRp03L8NJ/+cYBXGIbOreHBBX+1X3BJ3HAVZQS+TmaIM
 FwR1alvokPkFtpAZy8G90ZLIeO+e0VXPJXiXtg7rOKolm8MtE1U63dpKyjFNnTy/97Y0
 1oiAYPMRaL6looUk8ndBS4DRGawv2hP4MO+BVNbj7+I67Zo7sZ37460lbMGIATkQ55z0
 h13w==
X-Gm-Message-State: AOAM532jkCHVLdVgerJqe6JKGS5zVpvsrC1vWElOGPtW6Dg6VEdwBBwK
 audbMZDkvrvk+Ma9FmMI2bpGGYo/c8TTzejn9waUXg==
X-Google-Smtp-Source: ABdhPJy1qvJVD1rgLNeWV3GUhnlxwMyxzExFz2q3A1g24QsHgiswLGR3hNBpdmvyvE2dyuEWTwWn6PzdWBJHOiiKd4Y=
X-Received: by 2002:ac8:584c:0:b0:2dd:89dc:8000 with SMTP id
 h12-20020ac8584c000000b002dd89dc8000mr1907274qth.370.1645134247505; Thu, 17
 Feb 2022 13:44:07 -0800 (PST)
MIME-Version: 1.0
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
 <1645133788-5057-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1645133788-5057-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Feb 2022 00:43:56 +0300
Message-ID: <CAA8EJpqu2VsYkACe+FL+Z0J=j7Pp-w69_YNyBWn_7Ah1GoW23Q@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] drm/msm/dpu: adjust display_v_end for eDP and DP
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: quic_sbillaka@quicinc.com, Jonathan Marek <jonathan@marek.ca>,
 quic_abhinavk@quicinc.com, airlied@linux.ie, freedreno@lists.freedesktop.org,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com,
 bjorn.andersson@linaro.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Feb 2022 at 00:36, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> The =E2=80=9CDP timing=E2=80=9D requires the active region to be defined =
in the
> bottom-right corner of the frame dimensions which is different
> with DSI. Therefore both display_h_end and display_v_end need
> to be adjusted accordingly. However current implementation has
> only display_h_end adjusted.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Fixes: fc3a69ec68d3 ("drm/msm/dpu: intf timing path for displayport")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_hw_intf.c
> index 116e2b5..284f561 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -148,6 +148,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dp=
u_hw_intf *ctx,
>                 active_v_end =3D active_v_start + (p->yres * hsync_period=
) - 1;
>
>                 display_v_start +=3D p->hsync_pulse_width + p->h_back_por=
ch;
> +               display_v_end   -=3D p->h_front_porch;
>
>                 active_hctl =3D (active_h_end << 16) | active_h_start;
>                 display_hctl =3D active_hctl;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum=
,
> a Linux Foundation Collaborative Project
>


--=20
With best wishes
Dmitry
