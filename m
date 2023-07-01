Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3AB744A5C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 17:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAF810E0D0;
	Sat,  1 Jul 2023 15:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8620710E0D0;
 Sat,  1 Jul 2023 15:50:05 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-55e1a9ff9d4so1800686eaf.1; 
 Sat, 01 Jul 2023 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688226604; x=1690818604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AWux/IF/aECwza6GtENWenn3smgX2WPjU/KjFJmhyNc=;
 b=l9wb+bOH/n1H8L5N4d9tmf6kooHd3qjzenIY3zLrw0SuFKjc3azDJMYM/nFuXtPALu
 fwfbHUh51ekSOCL0alqQpF3e466+djZhphZEUWSITdvB9evWLVWX3S1vayFR1fHc0Mtj
 n7ZX2GfQe/QBd/TwwXrWkReGea1vgdFTgof4jKIefEcFhEjqTqd+zrrL/o1LQbT+9Dm5
 1xHsTtQpLYq5NU02jWZYFM3rSVBROZyKfM4GbiF2MmL52G7plaPLkKKb94bkg5vip0pw
 uhuOLwcqa0/voIsYdbUoYe4XmH0WUWkrykf4nrE5GHvaPQ8XSl25Mw/i8qE8oaDRYIuB
 7Etg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688226604; x=1690818604;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWux/IF/aECwza6GtENWenn3smgX2WPjU/KjFJmhyNc=;
 b=R/R4NUPumUrmakkVK0yPBuZmhD/8bdgE1PQJBTav5ai1kmV9KrO//kOnHz6yws+qT0
 9ah5KuOzXPEDxWG+CcImgHinYaCC79IAjojPQ3RWBRaJLeWvYho3JPfCjDM9dCmUEx4m
 FltkrWywSgq5LIKOICrRYBCwbShgpcEVMat7B+xnsnDpl3YqBn6KSUnGZkAtVa9E44RC
 TJxGx8Yx2oMVt/Ty8ER+jVDmdBFNu/maQzZtharnzcLNmeLs6mZSOOCzMbp6r8jb8s2I
 EVCjXdck8cxU9BvzahsOXorwc5r/KrVCI1la9ovfFLhJ0DM0X5UIEshzWBhwYkAIDNVv
 ImMg==
X-Gm-Message-State: AC+VfDy+dGlxU5O3g8n+Bv0I3mFYsWvhAzaueoLNTdOHWkpEoLHI8Ndm
 yFHJfbAlwtBtns4OajMf48mdbxfybcsFGStCFU0=
X-Google-Smtp-Source: ACHHUZ5p3Qamj32aSw4TXw6zcYs7G/XAByy351uI6wBsUAb95PSUxyzPUUUpESCbgaw4X1aoUbKIgnqr0SYz7yzOjiQ=
X-Received: by 2002:a05:6820:447:b0:560:c558:b6f9 with SMTP id
 p7-20020a056820044700b00560c558b6f9mr6089123oou.2.1688226604145; Sat, 01 Jul
 2023 08:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
In-Reply-To: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 1 Jul 2023 08:49:52 -0700
Message-ID: <CAF6AEGsH0BZd_yyn7UtJ3cLbbw2A5qdg8gQ6SORzQKjsMsnvHA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Assign revn to A635
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023 at 4:12=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> Recently, a WARN_ON() was introduced to ensure that revn is filled before
> adreno_is_aXYZ is called. This however doesn't work very well when revn i=
s
> 0 by design (such as for A635). Fill it in as a stopgap solution for
> -fixes.
>
> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified befor=
e being set")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> Changes in v2:
> - add fixes
> - Link to v1: https://lore.kernel.org/r/20230628-topic-a635-v1-1-5056e09c=
08fb@linaro.org
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index cb94cfd137a8..8ea7eae9fc52 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] =3D {
>                 .address_space_size =3D SZ_16G,
>         }, {
>                 .rev =3D ADRENO_REV(6, 3, 5, ANY_ID),
> +               .revn =3D 635,
>                 .fw =3D {
>                         [ADRENO_FW_SQE] =3D "a660_sqe.fw",
>                         [ADRENO_FW_GMU] =3D "a660_gmu.bin",
>

hmm, I realized a problem with this, it would change what
MSM_PARAM_GPU_ID and more importantly MSM_PARAM_CHIP_ID return..  The
former should be "harmless", although it isn't a good idea for uabi
changes to be a side effect of a fix.  The latter is more problematic.

I think I'm leaning more towards reverting commit cc943f43ece7
("drm/msm/adreno: warn if chip revn is verified before being set") for
-fixes.  I'm still thinking about options for a longer term fix.

BR,
-R


> ---
> base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> change-id: 20230628-topic-a635-1b3c2c987417
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@linaro.org>
>
