Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6CA765F05
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 00:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0EF10E618;
	Thu, 27 Jul 2023 22:13:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F24410E627
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 22:13:01 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-583b3aa4f41so14981117b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690495980; x=1691100780;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mgs3XoyVKvSXYQJGdno5tMM7wH8/lhpHnXzFG3+f28I=;
 b=k/+0Thgxr5YSZb4Hx0Scbv5fsz0foyW+ghVPq4QJwRqo0AwQodJcZ7LT72n8vuQmfY
 Pg0wxIkowCMCxaL8QOcgt6jXZtzYNR1rphLXCLpiP+pIgFpeLFvz5SpmzMCGoZ9YpBha
 pbwTv8t44a7YF+gbTsbx+d/8VYSKeik3htYipYXqs2Ec2gdwEMQNttqkRH00XciWTIkk
 K+K5iUeKOzaJqxQiYBpIK+bjOl69GTRKz+KQo/C6ik5Y9luIsf7tr/wL8pjW8nODfdB3
 5SB0fV1bxoc+S6IqkKV5h0kNcbTGzx+5bqTlGtmmqoYDTHzCEjXDZo0Dczu2KLmfo0A3
 M4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690495980; x=1691100780;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mgs3XoyVKvSXYQJGdno5tMM7wH8/lhpHnXzFG3+f28I=;
 b=e0/LOQNOYa6189tBt1UcLhzTa1QjZJdIJy6TRqALqUMLQPuIhn9He2gGVRfEbQQWJ1
 KjVXZiwbJjE+wqg2Bp6R5N+k1HKuahiGSZC9HPlURpyUlr7f24Kqenj1Vj+5bEBtNiO1
 xkdQczXWNWr/q5ivNa5DR6lMj1ovIolW6XJsB6mDmePvhTAmFkYE9p4bMDJ3VQcGTfBY
 OQZmtkX82VOmox9wYc6v253e4HCUYCjPh8YsBg+SUAACiYmwRK/2il7f1xDqu9hZ2CXJ
 at1V/pt1CzyCYlfCZYvNxhCPjlvfB+9rUTbdRAZtV/sNwu4/BONGtTn+D6eyYl7SNnr+
 3AoA==
X-Gm-Message-State: ABy/qLb6yX0qvt2MkckED7nDAOBIE2Rqjrsl5w22aq9sxKsVFLQZzjNT
 B6VqsHcREJ3hD2I+4k0F/2M8O7Nk5rAADiFQJ2/S6w==
X-Google-Smtp-Source: APBJJlETuE77rCp86MlShR/Cytch8bHfXHvuB6FjIXw2Ps7T35UKvb3xqfOxLvgy3n+kh/fDi1WBtt0rVJHyRIwj8+o=
X-Received: by 2002:a25:ad9c:0:b0:d12:1094:2036 with SMTP id
 z28-20020a25ad9c000000b00d1210942036mr658573ybi.43.1690495980400; Thu, 27 Jul
 2023 15:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-8-robdclark@gmail.com>
In-Reply-To: <20230727212208.102501-8-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Jul 2023 01:12:49 +0300
Message-ID: <CAA8EJpouv1nAH1HfVBpAXfCK0Ub0-Jb-xpH=XuWa4CBOZ9abxg@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] drm/msm/adreno: Move speedbin mapping to device
 table
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 at 00:23, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> This simplifies the code.
>
> v2: Use a table of structs instead of flat uint32_t[]
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 171 ++-------------------
>  drivers/gpu/drm/msm/adreno/adreno_device.c |  51 ++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  30 ++++
>  3 files changed, 97 insertions(+), 155 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
