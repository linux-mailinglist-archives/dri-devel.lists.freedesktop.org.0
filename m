Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A171C9DE815
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 14:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F5B10E2AA;
	Fri, 29 Nov 2024 13:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NHS6hjRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D318010E2AA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 13:53:46 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5d0bdeb0374so371383a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732888425; x=1733493225; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n/Ur8aJlkZb2O0WBY+Ja+CLRvhD2wQCX6NK6ury26eQ=;
 b=NHS6hjRRuB2E8FsDUz2XSjEEe+NY7pmLjgNkyJ18CaixKth8XsWssX0wy5xL4GmLXw
 F86bDQNdvYx+GqcDBdEDWpyxlSeHM9pPi/WiIkJsKjW9N9kJBsCYhHXfbU4jhhQ363Ed
 4dcNPzyVGEQmo//wBCBPOoklC9HXEQADoaxccQbVLLXL6BroQCc4NHgN43MnO2tVQq7s
 w+OeL2kSXcSC6mHLyHt+tJBvN5LDeTYODOon5ukulCrZZ2TxRIYjOyOtKDdpjViNI8aR
 nGCISCUtkQKfVk5qkifbAypJew18W2yz9FmTKe8LcGDBR0QLFxF/8P9zKvsO5Vk7RReS
 21PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732888425; x=1733493225;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n/Ur8aJlkZb2O0WBY+Ja+CLRvhD2wQCX6NK6ury26eQ=;
 b=LjQB8U4ssdNeacxRhsOn4I3nOTVh8czdwzeNJpV/JrkZBl7NEmq8V+ywpdHuBxnrUu
 mWeZRf8dxpMNdJeV5/2drs5THDl2i06+MtCbghIlPINWrNyyS6sqz7ADit1eQ+gYIQzt
 jXShL6NFosRZIpr6/+l7CEIHTgw/4sbcmXDOOo11HDSB9BIq8Dmb8Why8vZco0ZTq9Jx
 ATbOJclMOf4Ddd5u9e8XtKTBKiz5PMuinvdSa4XV76xhjFn7zN7JW6qHtEe703ItemOT
 uYBtXpQd/T9EZJYVGR2OsVfpV/DXGDzHaQXRCIseTjLTEpxtdn0pKIn+qTj3JToIPhyW
 Vxzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGy9iheimE5ire6l7RwUbY4YKvBr44QNSiBk/kL1vj2OkfslIPO8z3BmrxUS8IM58xC15Iv2hnCI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIS6LZ3IN0ZEdn75RDAGoZ2aOErXT0FnTKE9DkvEBz5E6Kj1tX
 7xIueoBPaVM4T9DblSoScflRlZwUrZA9F/cUYAy3z1sxvIB+g3Wx/2ZBBy8iSe2Cg2jaHHIf8GP
 bXdYZPfPIIj+Ey+xewLwhSR9ybXW6JZ61041HEA==
X-Gm-Gg: ASbGncvm07mYwCcIUB1xPjoJH+bOYiLfuvhWYnKu/YZ2NzwuNFHkEVZ2AVqHYw0JxQI
 83zIwyGPbNEEe7uCGF09tW/i8SAuxmqM=
X-Google-Smtp-Source: AGHT+IGCwqeDEnJNo83WNtmzKMJUwft+OKQaPAZ33baZKMDUQiMMr0XiZGEiUd02VQ36AikNgL9bZwlAshMXxuPC8CM=
X-Received: by 2002:a05:6402:5194:b0:5cf:f319:4525 with SMTP id
 4fb4d7f45d1cf-5d080c4d37fmr10845661a12.22.1732888425147; Fri, 29 Nov 2024
 05:53:45 -0800 (PST)
MIME-Version: 1.0
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
In-Reply-To: <20241129-add-displayport-support-for-qcs615-platform-v1-7-09a4338d93ef@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Nov 2024 15:53:37 +0200
Message-ID: <CAA8EJpoN1qBHyZrQJT_=e_26+tcaKRnSrhtxrK6zBP4BwpL=Hg@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/msm/dp: Retry Link Training 2 with lower pattern
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com,
 quic_fangez@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-gpio@vger.kernel.org
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

On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
>
> Add a mechanism to retry Link Training 2 by lowering the pattern level
> when the link training #2 first attempt fails. This approach enhances
> compatibility, particularly addressing issues caused by certain hub
> configurations.

Please reference corresponding part of the standard, describing this lowering.

>
> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 49c8ce9b2d0e57a613e50865be3fe98e814d425a..b1862294cb98c9f756b0108b7670cb42de37bae4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1220,7 +1220,7 @@ static void msm_dp_ctrl_clear_training_pattern(struct msm_dp_ctrl_private *ctrl)
>  }
>
>  static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
> -                       int *training_step)
> +                       int *training_step, bool downgrade)
>  {
>         int tries = 0, ret = 0;
>         u8 pattern;
> @@ -1243,6 +1243,28 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
>                 state_ctrl_bit = 2;
>         }
>
> +       /*
> +        * DP link training uses the highest allowed pattern by default.
> +        * If it fails, the pattern is downgraded to improve cable and monitor compatibility.
> +        */
> +       if (downgrade) {
> +               switch (pattern) {
> +               case DP_TRAINING_PATTERN_4:
> +                       pattern = DP_TRAINING_PATTERN_3;
> +                       state_ctrl_bit = 3;
> +                       break;
> +               case DP_TRAINING_PATTERN_3:
> +                       pattern = DP_TRAINING_PATTERN_2;
> +                       state_ctrl_bit = 2;
> +                       break;
> +               default:
> +                       break;
> +               }
> +       }
> +
> +       drm_dbg_dp(ctrl->drm_dev, "pattern(%d) state_ctrl_bit(%d) downgrade(%d)\n",
> +               pattern, state_ctrl_bit, downgrade);
> +
>         ret = msm_dp_catalog_ctrl_set_pattern_state_bit(ctrl->catalog, state_ctrl_bit);
>         if (ret)
>                 return ret;
> @@ -1311,10 +1333,14 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>         /* print success info as this is a result of user initiated action */
>         drm_dbg_dp(ctrl->drm_dev, "link training #1 successful\n");
>
> -       ret = msm_dp_ctrl_link_train_2(ctrl, training_step);
> +       ret = msm_dp_ctrl_link_train_2(ctrl, training_step, false);
>         if (ret) {
> -               DRM_ERROR("link training #2 failed. ret=%d\n", ret);
> -               goto end;
> +               drm_dbg_dp(ctrl->drm_dev, "link training #2 failed, retry downgrade.\n");
> +               ret = msm_dp_ctrl_link_train_2(ctrl, training_step, true);
> +               if (ret) {
> +                       DRM_ERROR("link training #2 failed. ret=%d\n", ret);
> +                       goto end;
> +               }
>         }
>
>         /* print success info as this is a result of user initiated action */
>
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
