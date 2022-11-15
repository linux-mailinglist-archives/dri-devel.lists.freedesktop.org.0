Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FE462A145
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 19:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFB710E0E0;
	Tue, 15 Nov 2022 18:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFEA10E0C9;
 Tue, 15 Nov 2022 18:22:59 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id x102so7868243ede.0;
 Tue, 15 Nov 2022 10:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TbeEc7tgUbO+RNH4gJ0zEeAfLqkbBq1WScC8tYctFRY=;
 b=nsNlhXlut2VAlFrUr+ZNHYytJkb2Q+To7TVKHr0kGwAI0txcGc4Q0Bm249ge48pykr
 cqLzPnJS478Z33/SM8eWnbD9DeOu69/zg0e0ga7idRNGbWA0Xm1Yr1Amd57+bRHaA+pc
 jtfKWFLPCe6bPgLfHhYGKVlWMws8C264+iZfUviNzMJFqt9uTZ3NyP+Mqw3ZRSiZZSdu
 nGiDPQ57OW9L+HRJyujTZMLSTUnidS7+Vpy4PxbI3iChellQEIAFebQMGzc6CfAsCbs5
 l1uEkvdieE7UN+RzmnOAiaPnNhCZoF35XYY/gFrByUWGru/2U6dazhVQhJjR5NynSen1
 fW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TbeEc7tgUbO+RNH4gJ0zEeAfLqkbBq1WScC8tYctFRY=;
 b=vMn4tgs/PBjyMKPt2EcgZjncv4p8p7JGFZheiRnp8Qp3S7U6OfyktDz+/glIH+GzfU
 r236wZ7rCTujU/HcrLUFam5ECP8lJErwSAk5xnr6lV0UJUysRPXt6RLI8k6MrDKrDzEU
 pLjdxZtpBwMtO/iwrgvS2Lt4sltddC93UKl4m3gKvpijHchbuPN41Y5cYokSm/DdFaZJ
 2OJPx9RkmNbBrKK+5rxIkjA+Zi3SD94sbfdtrad+fXHJFZ/NrdC/R1b+m6BMSjNjO6jv
 aPdw61wGs6lpfBHY+RjRUICfX0A/84goHW3NEK3M+vnQV3gvU6EalYGS+RmZIPC72xbr
 Zevg==
X-Gm-Message-State: ANoB5pkrhAZoRlbQiEd6LgfGoxs5HSj0TUWbjkYw58rnLhyse3y95HWu
 j7gCeQ0IIE2u6rVjThQVRWb1nRaX7y2gfw1z1lE=
X-Google-Smtp-Source: AA0mqf76Ix+TXvlQ4nWw8Pb8P1uTYICxMdANSvauu4I55iDfLYTMQg8sohKZfZzMNGcER9gEWYNfy/6Ob4zHDx4w4bs=
X-Received: by 2002:aa7:df90:0:b0:461:37c2:e85c with SMTP id
 b16-20020aa7df90000000b0046137c2e85cmr15610362edy.74.1668536578133; Tue, 15
 Nov 2022 10:22:58 -0800 (PST)
MIME-Version: 1.0
References: <20221115155535.1615278-1-robdclark@gmail.com>
 <CAD=FV=VJKTHf7qLZkygfnMRSjXEdQ09opCpFM2brUc=uiTGyTw@mail.gmail.com>
In-Reply-To: <CAD=FV=VJKTHf7qLZkygfnMRSjXEdQ09opCpFM2brUc=uiTGyTw@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Tue, 15 Nov 2022 10:22:46 -0800
Message-ID: <CAPaKu7T-NxfmagYfHUzSZw044+Py9Tmm4Oo9zq56v07BJ0ynvA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Enable clamp_to_idle for 7c3
To: Doug Anderson <dianders@chromium.org>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 8:01 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Nov 15, 2022 at 7:55 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > This was overlooked.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
