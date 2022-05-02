Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BA516BAE
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 10:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B6E10EB34;
	Mon,  2 May 2022 08:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AD210EB36
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 08:06:16 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id v59so24715099ybi.12
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 01:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9eaNjP1Hc5RWxu4zMYHv8damjahal2K/XyzOk50wqY=;
 b=JWbLjTAzjww6Ku0NGdngxLti8xtbrCjaNcdHNGTch7Yv62Fx/M83ANC7iI7dIwQ+U2
 LgVJHIVbGQ+C52cdBr/tYPXPik6LH1Xv1OXwUoRfE3idZbHFrJDOMFJ3u9aA+U9grcW/
 PEHxktD6JeYOb5K7zxpvLA1w6kKiGaBZkYM+AD5RQ2CtDgX6X1F5EALyQv23TZbxK224
 cTk32JLSYWZLQ66caAG5rjuaf1lIGUw9C2vmxaNdSM5+1M0M8DKhTZPHiuS3DxvTAE/v
 WFoFCS9h4LPiozYzvNFZtJMD1WfjYWfruY3CIX2eIdE43MXqZzN3B0Tfp9MytDTmU82S
 rgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9eaNjP1Hc5RWxu4zMYHv8damjahal2K/XyzOk50wqY=;
 b=lCvq8ocKRRsUtB35YeR3PR05dIh+xt0tX6Bqn3C/7PL9FMVDijmnuye3Hvn733Fcnn
 bm0v9Gq7V96C2PLfh+2HZ1y3IMripm1Nmhw846BfQ4Hzd2G2qszMAY8ItSJUQGkIOQQJ
 9T1/O6RZWvvf6yDtQwZVA1ssG0FF8mkQahkpZQLl268bqsDts+03qmkgetxdWDumJwXU
 S/rVdWERRhS8jBcb0WQs4RY0WLjTVtU2vpb0xD/gKRqWVujHOqczAaaMSoTAygplr/lf
 5CRQVCXtZH+qw1AjFoTJzB31CbuBKCVErMITH0U+J4G0XjLaWfwfRSz627m35YXDi9nl
 8Tug==
X-Gm-Message-State: AOAM530dyK6O3QH+tIIgmMRe513lxNUlp/rEzom5WIsarffIXckLjUgv
 g1whjCEKHMm6BZ4ouEkO1kIQgTsaZrPo/YJMGENfGw==
X-Google-Smtp-Source: ABdhPJwbPF8Gx37GDzvQ03IPIWQaP5P5hDDTyNhHcE4+LwmFbAnY1PS/IxdIRxHIDTmiGY0RBzjefqNdCFycdR/9Ox4=
X-Received: by 2002:a25:84c1:0:b0:63e:7733:f95a with SMTP id
 x1-20020a2584c1000000b0063e7733f95amr8845089ybm.234.1651478775351; Mon, 02
 May 2022 01:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <1651469981-21469-1-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1651469981-21469-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 2 May 2022 11:06:04 +0300
Message-ID: <CAA8EJpr1YigPrMqd64HXN+2NKZQHyXF_ZGZETv8FFBn2yW2kOQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add missing break statement for
 update_pending_flush_wb()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2 May 2022 at 08:39, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Add missing break statement for dpu_hw_ctl_update_pending_flush_wb().
> Otherwise this leads to below build warning.
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
> warning: unannotated fall-through between switch labels
>            default:
>            ^
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:273:2:
> note: insert 'break;' to avoid fall-through
>            default:
>            ^
>            break;
> 1 warning generated.
>
> Fixes: 2e0086d8c61d ("drm/msm/dpu: add changes to support writeback in hw_ctl")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 254fdf06bb42..c33e7ef611a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -270,6 +270,7 @@ static void dpu_hw_ctl_update_pending_flush_wb(struct dpu_hw_ctl *ctx,
>         case WB_1:
>         case WB_2:
>                 ctx->pending_flush_mask |= BIT(WB_IDX);
> +               break;
>         default:
>                 break;
>         }
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
