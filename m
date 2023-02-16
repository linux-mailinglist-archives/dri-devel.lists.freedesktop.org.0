Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11091698AB9
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 03:58:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5E310E2B2;
	Thu, 16 Feb 2023 02:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63B0C10E2D5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 02:58:08 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id 81so670663ybp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 18:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YyMZCQmaOL1xm4zqLG+BHh0sREN8jgVyVG/p8ktPj+c=;
 b=mBTcMWPuiflyd2oc/5m7tNXF9fuV2y8N6d1q0h1Qj8DIsihq+Rx5Zu3ZxARHaYmuHh
 TyHa1FOKITLUVKOuB4LkvJux8vM8KYSjlSMBMfL3fUwUO4/TxidApfDlRXmyKRYoNp3+
 HKpJIthTDoyScFvmhFvfHnwdn0UcnY7NvkNQVo4vahQFg8AnociLC+3ysCCwm9mvYF+L
 m5Rr4uFetZBqVNS28SPcAR/GLaVUY0eeylDf7gjpVYajIEAYe0a0JeodButx/u7eTcY2
 hZXhgUOMJtBJDE8GCUPktK/RabH20AFq/8/5F0b1OydzjVIye8RX+8T/24MPQ3wjn6IR
 HeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YyMZCQmaOL1xm4zqLG+BHh0sREN8jgVyVG/p8ktPj+c=;
 b=GgI1AyA3eC6RGtIRTGSrGihDtQeIPBp8J+PRR4RouGYywCsLQoDsGuEneACV/O81Xd
 IpDfmhD11Zy/nkUQk/rbm6UrhF1PZo1zQOWfyPxwCWXXxUdbeD4tWe2s+H7MqbW5ilLo
 yEYDFyoeLOGLPjbNGahqaHECSfS9A51QQIBEtf5EMP2QbK7xyf0yKP70D83disc0Jnam
 seqKmkMuKnUH2Csrji96vIESlZB1dXOuxhqaifR3KnvcEqogux1Uv/Q/wNo+u0UExDzt
 DVhkJHJiBTCole6Jmt3Ru2Ce9hnD3dBiRXfbaJ+GvMs73T2W6fCcfohwM3UJh52wVk9+
 nfvg==
X-Gm-Message-State: AO0yUKWJ4u75nzMNKAcmF4Rr3yPmTYtmfzcx4rbeRQyn944HyAMsap21
 9gGuUa3WEKYAccSnCC07yRwkKSAVtQsJGIuEY2Jt1Q==
X-Google-Smtp-Source: AK7set+nmSebDjAkALV0PNZZFrn4v5zED6xwiCkXHS5ZJibfE5G7fjdWSQOZ3GW6NWl5csCf9dRiUjSqbi/Ly8p7fAo=
X-Received: by 2002:a25:9a49:0:b0:86a:e417:b66e with SMTP id
 r9-20020a259a49000000b0086ae417b66emr531070ybo.382.1676516287570; Wed, 15 Feb
 2023 18:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
 <20230215-sspp-scaler-version-v1-3-416b1500b85b@somainline.org>
In-Reply-To: <20230215-sspp-scaler-version-v1-3-416b1500b85b@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Feb 2023 04:57:56 +0200
Message-ID: <CAA8EJpqeVkYyk-RxkODt2wyXy0fhvTgjs-5Ay8R3TV7ddU4zOw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/dpu: Drop unused qseed_type from catalog
 dpu_caps
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: freedreno@lists.freedesktop.org, Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, Chandan Uddaraju <chandanu@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023 at 01:02, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> The SSPP scaler subblk is responsible for reporting its version (via the
> .id field, feature bits on the parent SSPP block, and since recently
> also from reading a register to supersede a read-but-unset version field
> in the catalog), leaving this global qseed_type field logically unused.
> Remove this dead code to lighten the catalog and bringup-overhead.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 --
>  2 files changed, 14 deletions(-)

-- 
With best wishes
Dmitry
