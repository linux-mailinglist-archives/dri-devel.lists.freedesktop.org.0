Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCA24255E4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 16:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69536F877;
	Thu,  7 Oct 2021 14:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF8D6F4B1;
 Thu,  7 Oct 2021 14:57:20 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 5-20020a9d0685000000b0054706d7b8e5so7833899otx.3; 
 Thu, 07 Oct 2021 07:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mzk6WiudmT/TF8wQB8x0MzCt8I6DeHYCrar6L1Vp+E8=;
 b=abS/ykrfupEbY9NiEA21C5OeHy8TNemYFC3T0zrw2wkqlMenZpjF18n3J3C22sLOx7
 HMGCh80ulxbT7baxlfll4P6OouOevL5ot6551wCMeQiOgGclDPnnCvXPO4WexpXAOEcU
 rY6Qghhbt6y6JE0UNAA2RBnlH0SyFjGcJJeDoy5K+M4lDP9lbIZlIoDYLFV8PDxQ/0Su
 k4Ekg0kXi/iZ234kzqe1/kkhjjl43GrcNZvUWKolxk/If719lgs7pKaE9fkK6886xs5R
 W4Oz81FeVwAJ5N9IpEQ386aaaAzmTHeKcu7ehCHoi69QaATDGr7Pr+L5aUtYguvg4gqG
 b05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mzk6WiudmT/TF8wQB8x0MzCt8I6DeHYCrar6L1Vp+E8=;
 b=em9GsuYOgViL0PCS4+p6i1X6eBjcJcapM+m/pg42titk7tYdeWoKRDDIPZsWtj9AJq
 2tMAFXjzRudKxd+jrY7JGPe+UhUgm7wtliszBpyR+ZtMSIH7yIcvJVIi4vY1imKRYdAk
 7TQqqqygXQxWK9JmLLYmDMOk3I6hdJyJtjz3FbY6D0BDHD9aeYPrJYaR44r/2ynmgSUh
 OLfBF7m73J3AEuwlAGtqtV8Cg3PXqWnUHfHbtUD85fvaIGRMYn3rA4MRYW8hb37uNBlr
 r/h9S+PfQfCSodXXABa9aEODRQLFf8j41emeakRBDhcAsYvEz8S0VtDDKEYr8Vbn1pK6
 z0+g==
X-Gm-Message-State: AOAM533YbqB/mkyHd/texWjc7TGcwiv3J9DLCxL4khjxdthQS2upQxWc
 co3YD8j2c6jR05dMu5uJnTflq2PLrweIOzhGnoo=
X-Google-Smtp-Source: ABdhPJzJXe7uLLkzQpqyL7kAhRlGbhklkOm+sxdr0Gx13wru39dPV7tQEXD4JLgDuONXErGATWx3r1UjvAc4cqxkBkQ=
X-Received: by 2002:a05:6830:1bc6:: with SMTP id
 v6mr3927342ota.299.1633618639323; 
 Thu, 07 Oct 2021 07:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211007091332.22099-1-christian.koenig@amd.com>
In-Reply-To: <20211007091332.22099-1-christian.koenig@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Oct 2021 10:57:08 -0400
Message-ID: <CADnq5_P0G31TM=mWBGZv8c39sziBmMFOsRBUZLe7hHtp9ja78w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix compilation when COMMON_CLK is disabled
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 7, 2021 at 5:13 AM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> We can't even compile test without this
>
> Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/msm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 5879f67bc88c..d9879b011fb0 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -5,7 +5,7 @@ config DRM_MSM
>         depends on DRM
>         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
>         depends on IOMMU_SUPPORT
> -       depends on (OF && COMMON_CLK) || COMPILE_TEST
> +       depends on (OF || COMPILE_TEST) && COMMON_CLK
>         depends on QCOM_OCMEM || QCOM_OCMEM=3Dn
>         depends on QCOM_LLCC || QCOM_LLCC=3Dn
>         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=3Dn
> --
> 2.25.1
>
