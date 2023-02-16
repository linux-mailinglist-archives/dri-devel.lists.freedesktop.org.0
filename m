Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 834BC698A7E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 03:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53FD10E2BD;
	Thu, 16 Feb 2023 02:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FEE10E2BD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 02:23:50 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id e75so561992ybh.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 18:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NT9uNCMBWl794fkp+SMakMeJNNkxNGDXw7tBHf8Uvgo=;
 b=wlNPmA17KOY6pK6YSw5++8aMVTR+4h8QzLMUDAs/l/GgEN8eLFJjblVBAL4l+8UMVo
 VTNvpLOPQe0tCs8ZSBaPmCUh9VK2S35jr9LXhVu57g0MVbUxlVvoBO80fVRTxB/I/RIx
 +akHOGbDrVDLObPLO141W2tYDUHhJog0ukTM/eLTBFppp3LXIP16krE2YUTVKv6nVvB5
 DD3wYChintddtUpp8K+Y/2dZp6OviOiV3/Z2H0iulxFADBwcqMao8Um8A8dyZonyUOaN
 VjBCHyPX3eNae7TtWuiXWoU1BLix/mjHbA701x837guejw8xRKnxIaw7zAdnQbzpzTlX
 e+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NT9uNCMBWl794fkp+SMakMeJNNkxNGDXw7tBHf8Uvgo=;
 b=sDuNls9o7H411oF3Xr7pgitxI9ZlpHinUxlY9c3IsJzG76YYYDbCqM6JFL315eafi/
 qKFJYA0G162ddI+ZC/sPAmisbsQ4wrxfh01lD7WIgyM1QOMI8B84B9PZiFgjU1+UXh5B
 TE3lxZSTrpQ/j85snC5AWA8FmxR1+EUfNNrYM8QPF++9Inyp7js63xB+bxv262D0DAHw
 MzX5PBO/15r96dO56mEHqMBgndKx4VfOTBC1RLBYeOrj6G858irvZk0qs7UJN7HnBySA
 +DXS4IFZUO4VGKJQmFrv6km0d7qjD+JSKoBUfF1FPVICmRLtdWG9kUg3V5Cm7DBjlZfK
 CEYg==
X-Gm-Message-State: AO0yUKWetNe0CNCaDR1nWEZYfJrfA+y+YFJve0q2nWZTg0NeckFQ0Do0
 IcSg3aA+Hmhd0FNQhUcDjzt0RsonU2eJtSKLFl4f/g==
X-Google-Smtp-Source: AK7set+g5Iz6F+qTqpXxLN+bqfm0nIW/gdEpwcM8ofiNU5qAy9sZmhZSKBYet6qwAIKNsRoqh0H5TZPmCHA79wcHMxk=
X-Received: by 2002:a25:9a49:0:b0:86a:e417:b66e with SMTP id
 r9-20020a259a49000000b0086ae417b66emr520370ybo.382.1676514229770; Wed, 15 Feb
 2023 18:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org>
 <20230215-sspp-scaler-version-v1-2-416b1500b85b@somainline.org>
In-Reply-To: <20230215-sspp-scaler-version-v1-2-416b1500b85b@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Feb 2023 04:23:38 +0200
Message-ID: <CAA8EJpr7v4waXaaahuMq3Ti18Gd-sg4HGSSof=yEX5kC7+CKnA@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dpu: Drop unused get_scaler_ver callback from
 SSPP
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
> This pointer callback is never used and should be removed.  The helper
> _dpu_hw_sspp_get_scaler3_ver function is retained as it is being used by
> dpu_hw_sspp_init which didn't itself compute _sspp_subblk_offset yet.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 4 +---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 6 ------
>  2 files changed, 1 insertion(+), 9 deletions(-)


-- 
With best wishes
Dmitry
