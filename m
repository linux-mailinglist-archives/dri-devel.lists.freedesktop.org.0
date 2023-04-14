Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F876E2B6B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Apr 2023 23:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C2B10E22A;
	Fri, 14 Apr 2023 21:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70CDD10EE78
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 21:01:49 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id u13so20381595ybu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Apr 2023 14:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681506108; x=1684098108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bpfMXe/KqbWIelZJe4uoAyC5aNyWUPiACGVGh2qmwy4=;
 b=ESxeOXEPGqrm0OS/iNJo92P5dIcNLtF7YiRD/kjS8BUetUNEyGG7UaUQoJoAoqLqss
 jxVBbTO2w39KwZLpr9YYuLgInyUGx1ZkwhzNueqqlfVLpPqQOJd1b+77d0mR39cxYqQn
 2/lDQzTCSEMjoGhVcVsGyjnRl84ypMIACewEg12ToTddPHqAN99b4nJZIlcgoTRu2yLz
 JEOugPwNuXnJUehwVqNeK+NeAu3vIr2+6x9Dhpru0CxqMYKizlccomIHjSJCjfG9Is6e
 J5ZfnZ2NH/mk4S4tSwgeGm6t5RQeqChr6g+QMSRPjvgdD9QrWCIYfZuaPtWpYPzZkKB3
 RXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681506108; x=1684098108;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bpfMXe/KqbWIelZJe4uoAyC5aNyWUPiACGVGh2qmwy4=;
 b=fPZO8QJ62ueUJ4N5A//+BGykCqSJROAHg5as5Af4y5F1U+Kl+oNDSlIOSIcMXFtSGZ
 iG7o4di78Ndg7XZHfJarA0XTTSQ2p55nj2Z7dRCTcpFCKXwvHfQa8REg1GabEvZBcARl
 iL9TOdTS7bXxdV+NNh9iW5I5X3a3wsduajEQHrZhEESRzrrgv5aOOf1ceBwdkvBmGvYL
 JzvYVz2b04Lds6zdrjuyajdZ+csKLOHlYu28OB9sIcnOZo6JVEcxqUZhw/20eGVaiaIY
 ZzVjCTJThewpVRa3hcI7vOquDT+P8YgGiYWbapVgHQppPo2C4HbwBGNJ5Gez2mo1mFSz
 G0Vw==
X-Gm-Message-State: AAQBX9eY1XimWgY6UQBo6wt9o7ktkU/IWuPefDdLMqZTlkPNY7ghStUi
 9o3aaVatiNA8SepF1SaTlkYoVSaxaZzEuaoas8XiCQ==
X-Google-Smtp-Source: AKy350a6AQhCKOCqsuAPG4WgtTUaUp2Zmf+Z17MMZxfmVFeziyrPpCdMUQwN/3lykz1gOYCumpn4K1dyAr2SD+v3B60=
X-Received: by 2002:a25:748e:0:b0:b6c:2d28:b3e7 with SMTP id
 p136-20020a25748e000000b00b6c2d28b3e7mr4606248ybc.9.1681506108117; Fri, 14
 Apr 2023 14:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <1681490777-15351-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1681490777-15351-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 Apr 2023 00:01:37 +0300
Message-ID: <CAA8EJppy0bGKQsQFoDZtWgtKrZuU5NLVoteXMbqDR30Var92NA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dpu: always program DSC active bits
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Apr 2023 at 19:46, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> In current code, the dsc active bits are set only if the cfg->dsc is set.
> However, for displays which are hot-pluggable, there can be a use-case
> of disconnecting a DSC supported sink and connecting a non-DSC sink.
>
> For those cases we need to clear DSC active bits during teardown.
>
> As discuss at [1], clear DSC active bit will handled at reset_intf_cfg()

nit: discussed

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>
> [1] https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/
> ---

Changelog? This is v3 already, but it has no changes described.

>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index bbdc95c..88e4efe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -541,10 +541,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>         if (cfg->merge_3d)
>                 DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>                               BIT(cfg->merge_3d - MERGE_3D_0));
> -       if (cfg->dsc) {
> -               DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> -               DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> -       }
> +

And the comment got dropped. Please restore it in some form.

> +       DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> +       DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
>  }
>
>  static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
