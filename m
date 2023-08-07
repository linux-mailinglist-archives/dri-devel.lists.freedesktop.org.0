Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95F3772C12
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6B610E31A;
	Mon,  7 Aug 2023 17:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3CD210E31A;
 Mon,  7 Aug 2023 17:08:27 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso3612243fac.2; 
 Mon, 07 Aug 2023 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428107; x=1692032907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xdH85ugcEgXLHyGrQRpZvP78lrIUwr56Sl8IQ0GRO88=;
 b=Ka+wLc1EWmyXGz8qPF+rmM2i6oBNtNMsELdKHf7S1L7UP7AalgAReU0XQ57ZWdIXH5
 BoLdcfAdYMK8kw06KcnIPL4zPRCTRDmH6zyBgc6hu7uTD0eUv2ZbWsldY9HZnEhN4x2z
 i0ESleSHM/LUMFGIf1/qiV6vQJk3amS+RKT3qh2yOHtLM8uONwYxMIJoDJ606Q3gsAAr
 wneVxQvL+u1Uh2fOCN2aajnaPXOsVTG6Na0BnGPvORO3nX+au8nPVuUC3LMc09DP6cbz
 4NfLjrD7DYeTn0LKmgtT+SBCKn9+L9+0KChOfEfCPin8XngNTE+s0LqXTjOvi5DVxRLi
 6zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428107; x=1692032907;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xdH85ugcEgXLHyGrQRpZvP78lrIUwr56Sl8IQ0GRO88=;
 b=CYFjgSMRvUKlAtRtunMM6C9hHl+EsMdDX2qHsCwD6+QsPXzbHvQ6OTt5v70Q4x7Fur
 y7nYkhrguN1VWf/tM+jORG87nBmBCpH3KHdtFUyQ4f7miTNsTda5p+5OT7SWTvnM6jFR
 JYETbMArkSe3w2fHvV+aKSPwVDDPE+wmWgl157G9iu52n7ALi34ePLFTNtdtaaN7JQx8
 mK0PQainMuKMJgzJWLM+VZir3L5K3cRl6pAAinvQiJbVRThvdWuJ9N1SgEAe9JR8EpNq
 3yTvTvHTTlYFTd+clTG4BL150DwBHEsmTIGzrzct+vigZ3LDm9W26XzDUbW5bl2dfjpO
 XiQQ==
X-Gm-Message-State: AOJu0YwAl0/s1wtkYNw7K4FbylTS6xde0xDnAIg940d8ua+O18wKWj2u
 2BoAPIEDb/m+W4NQxsPchu0PYkoCZIWO6XR467g=
X-Google-Smtp-Source: AGHT+IFg0f4fC0DsVOgW1GBDh+CWQNIFu6A8Is4zKYRgHi2S1GQnxQZp2dxCuhh5Uh404vG5UVZ0XtmAnHoqib//q4E=
X-Received: by 2002:a05:6870:c0c9:b0:1be:f7d8:e7af with SMTP id
 e9-20020a056870c0c900b001bef7d8e7afmr11024744oad.39.1691428106950; Mon, 07
 Aug 2023 10:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230802024725.10192-1-sunran001@208suo.com>
In-Reply-To: <20230802024725.10192-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:08:15 -0400
Message-ID: <CADnq5_Pb9yEKSTaA1hTM1G5yLjCa5QeDKmB7BdbJykVyK9XTdg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/dc: Clean up errors in hpd_regs.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 10:47=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space required after that ',' (ctx:VxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h b/drivers/gpu=
/drm/amd/display/dc/gpio/hpd_regs.h
> index dcfdd71b2304..debb363cfcf4 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/hpd_regs.h
> @@ -36,17 +36,17 @@
>  #define ONE_MORE_5 6
>
>
> -#define HPD_GPIO_REG_LIST_ENTRY(type,cd,id) \
> +#define HPD_GPIO_REG_LIST_ENTRY(type, cd, id) \
>         .type ## _reg =3D  REG(DC_GPIO_HPD_## type),\
>         .type ## _mask =3D  DC_GPIO_HPD_ ## type ## __DC_GPIO_HPD ## id #=
# _ ## type ## _MASK,\
>         .type ## _shift =3D DC_GPIO_HPD_ ## type ## __DC_GPIO_HPD ## id #=
# _ ## type ## __SHIFT
>
>  #define HPD_GPIO_REG_LIST(id) \
>         {\
> -       HPD_GPIO_REG_LIST_ENTRY(MASK,cd,id),\
> -       HPD_GPIO_REG_LIST_ENTRY(A,cd,id),\
> -       HPD_GPIO_REG_LIST_ENTRY(EN,cd,id),\
> -       HPD_GPIO_REG_LIST_ENTRY(Y,cd,id)\
> +       HPD_GPIO_REG_LIST_ENTRY(MASK, cd, id),\
> +       HPD_GPIO_REG_LIST_ENTRY(A, cd, id),\
> +       HPD_GPIO_REG_LIST_ENTRY(EN, cd, id),\
> +       HPD_GPIO_REG_LIST_ENTRY(Y, cd, id)\
>         }
>
>  #define HPD_REG_LIST(id) \
> --
> 2.17.1
>
