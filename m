Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC98A82A6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 13:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3675F112F82;
	Wed, 17 Apr 2024 11:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qMWzFe7O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939D8112133
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 11:59:46 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dd02fb9a31cso4802875276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 04:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713355185; x=1713959985; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ka4Traa7ftszXUlTUn8V8lFxKGAbUY9Jgg8OQaEdzk0=;
 b=qMWzFe7OUcuWyhqiu8ld06ia6zSeDXjogP3nGONfGo6UoIN3mOYcbL/eSzS28FpXKv
 Y88WiKMuHbVbe5ajCi7Jz23exN1wK/azTpEZXAURQNQ15JmT+yBZRL4Jn9ONjX6hD64Y
 fPcYk+wZp5Cy1TZjEWuSerTfzPI1f8fUiKUsO8YCZlGJ1l1M3rTGivWrfYHNr24Hva0C
 G6akXLa/+Yp4csbUD4qkHm0EYmoXeZwsKiYQs3ajf9tZ+oMlMNl9aXyNoiXtpba2STXC
 Ward/yaw637BXN7MW3vyjxi51G3H+blAVvwfwM47Hz09e76QygBsA0S4EDvUGZz9xM44
 tlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713355185; x=1713959985;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ka4Traa7ftszXUlTUn8V8lFxKGAbUY9Jgg8OQaEdzk0=;
 b=cql9iWu3haMniK+zYCYxKQzoATHP45fvwOdq9xwL8OmwY1Ciq6DOyiE10Ccw3vMGPc
 xRiqH95u/9KRV1Uk9yCEKj8eJHz3kNMJuwKQ8pGmqJDcbqABttRKxJjSBga//T7QsE1o
 AllxzFwFioCm0QUMYShkvjPCJTY7+jfReJtjkreFlhWrT/qXsWsSU9n/vQbDdVBDQN5v
 gpfrkr+yxdso9zz+/4XvnIHxLdoHAC1HCgPwpfC1eyGmU6jYLsyWt5nLCxY7V633ZC7k
 rSy4nZ/FKrcbfzu7hKqWREyF3LMfBfA9cCUulhFec3uJm8AFweYPXy0SQGlF+fVk0M9J
 bx1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4ald7XF8zdWGsIAqEZHzk7ymPN3zx+ZINg82hbi6tNdNqM+NV7ciMxezlckinCZ/yNhHqzOpk3pkpLpB6qGb1Ee2JaqfMfgyuGvtmYhuc
X-Gm-Message-State: AOJu0Yyjq1px7KYdHlkSyz0SJAVhvo8qcZ+XAV0MzRRut9BsgZlK/aOy
 ZmI4CHam6eQlNpYCtJqmUb7aqxdn/qLtI27Xk15hYS6Q3f3GVugRi9CnwAStfh1jSENPlTKl6dM
 /mD+5ryENPdhgCflHwPeNMx+1ki6bljoM9/inJQ==
X-Google-Smtp-Source: AGHT+IFIYioWeJvin6gmStJ8KBQcUCJDKaGylQGDoJsTxsTjK1zWYmQIPOgobokhDNprh6Xmzq0t0x4PNZ8rgZDheDE=
X-Received: by 2002:a25:aca0:0:b0:dd1:2f58:292b with SMTP id
 x32-20020a25aca0000000b00dd12f58292bmr16998050ybi.9.1713355185554; Wed, 17
 Apr 2024 04:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-4-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-4-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:59:34 +0300
Message-ID: <CAA8EJprJ2zY=MoHt6YnFV7qU3H=who+YPAzXG+bUZHHmFLzyxg@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/msm/dpu: Allow configuring multiple active DSC
 blocks
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>
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

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Just like the active interface and writeback block in ctl_intf_cfg_v1(),
> and later the rest of the blocks in followup active-CTL fixes or
> reworks, multiple calls to this function should enable additional DSC
> blocks instead of overwriting the blocks that are enabled.
>
> This pattern is observed in an active-CTL scenario since DPU 5.0.0 where
> for example bonded-DSI uses a single CTL to drive multiple INTFs, and
> each encoder calls this function individually with the INTF (hence the
> pre-existing update instead of overwrite of this bitmask) and DSC blocks
> it wishes to be enabled, and expects them to be OR'd into the bitmask.
>
> The reverse already exists in reset_intf_cfg_v1() where only specified
> DSC blocks are removed out of the CTL_DSC_ACTIVE bitmask (same for all
> other blocks and ACTIVE bitmasks), leaving the rest enabled.
>
> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
