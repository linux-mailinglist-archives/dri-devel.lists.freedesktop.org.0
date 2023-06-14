Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF07730B1A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 01:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543F710E47E;
	Wed, 14 Jun 2023 23:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DEC10E47E;
 Wed, 14 Jun 2023 23:01:03 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-558cf3e9963so1037548eaf.1; 
 Wed, 14 Jun 2023 16:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686783661; x=1689375661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSH2hR39R1Nu5nYNmwG59rST+IPCeWv6B5EE3Mhl5OY=;
 b=Do/rnoOZm8KDvaqEeuPKDPWhinfOkHT4967FvL6stWl4f2aWuVw1RoQtdmgbCLprwu
 Qay+1kaHFf4r0eZSd6cXzTP3xUfRmLWBpPdrEW/Ud6QlbopV58yn7LEPn4SSC8jD00pe
 Zn77Tk6OjEDBQODXDmftu+yLVIhILKdBVon1Kbspwj1Ct8S+qSE9OCOq1jeG0YmQveSR
 qmYOYNHFYvnF1UMlqZTg7T2vR46EnoMP3JudhhH23KfCzwMdheNjM4u+F8TYJgGG//8+
 /A4BQL6CedjOgS5OWH7ZWQBgH/vYKvnWts1ZmPGvcDIYFw6Rucxo5s3n2IywCkhL02qq
 kd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686783661; x=1689375661;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSH2hR39R1Nu5nYNmwG59rST+IPCeWv6B5EE3Mhl5OY=;
 b=an17EZIayge8HmOabKq57hw1xm4IpKN9ppT58UTWWd291PwuWJaqovSdrvpijyIQ4a
 aw+Px1RW5DCZ6fi9gXcgkxWkwL+X+JZzv+u6gjdXQGCMge4XX2Il7U3sd7CesXBAn7LI
 fD2mR/A2e+a2z5pvT/DJ3cxxicubLjfv3NguqHpeJOUFPXTXVj/kFciQ8ZAp6l8Qihpa
 rJqPYwQ9NBCl3BM6VcijlUF+CKiFkN43RCUfWnjYKP7TU226uihdb29sjTZStHhfppUQ
 fwHsiF8StLe1VjCQyazkQY7tfLWShEzTd8OLvHgV+dHIK45X/qV4PzeqTLFzBxK3cIts
 Ebkg==
X-Gm-Message-State: AC+VfDzWBCtXWDCbublK625eqLsa23WVHuzZsHxjTwXzSCuZxrRv6aFK
 MoB7GypW1NdTgNpQ6PCjUMyK0MzIzcK3BBNFLRo=
X-Google-Smtp-Source: ACHHUZ46yEBe1FcunlF58VnQxu8cvZA4PXvar+FFbc8FSJYjMNbi0r+gSceDdOluLVGBpOQSW/Mt5H5Q5U21bdq5deA=
X-Received: by 2002:a4a:d9d5:0:b0:55b:2f80:39e4 with SMTP id
 l21-20020a4ad9d5000000b0055b2f8039e4mr11211428oou.4.1686783661535; Wed, 14
 Jun 2023 16:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230612182527.3345786-1-dmitry.baryshkov@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 14 Jun 2023 16:00:50 -0700
Message-ID: <CAF6AEGv6ZYSN343AMF5JEaL-04ciRjMWxSdd21TgQDoUXpSzyg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: make adreno_is_a690()'s argument const
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 12, 2023 at 11:25=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Change adreno_is_a690() prototype to accept the const struct adreno_gpu
> pointer instead of a non-const one. This fixes the following warning:
>
> In file included from drivers/gpu/drm/msm/msm_drv.c:33:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h: In function =E2=80=98adreno_is_a=
660_family=E2=80=99:
> drivers/gpu/drm/msm/adreno/adreno_gpu.h:303:54: warning: passing argument=
 1 of =E2=80=98adreno_is_a690=E2=80=99 discards =E2=80=98const=E2=80=99 qua=
lifier from pointer target type [-Wdiscarded-qualifiers]
>   303 |         return adreno_is_a660(gpu) || adreno_is_a690(gpu) || adre=
no_is_7c3(gpu);
>
> Fixes: 1b90e8f8879c ("drm/msm/adreno: change adreno_is_* functions to acc=
ept const argument")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.h
> index 1283e5fe22d2..9a7626c7ac4d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -284,7 +284,7 @@ static inline int adreno_is_a660(const struct adreno_=
gpu *gpu)
>         return adreno_is_revn(gpu, 660);
>  }
>
> -static inline int adreno_is_a690(struct adreno_gpu *gpu)
> +static inline int adreno_is_a690(const struct adreno_gpu *gpu)
>  {
>         return gpu->revn =3D=3D 690;
>  };
> --
> 2.39.2
>
