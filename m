Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 993C733C588
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 19:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F436E11E;
	Mon, 15 Mar 2021 18:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316A66E154;
 Mon, 15 Mar 2021 18:26:06 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so5609081otr.4; 
 Mon, 15 Mar 2021 11:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YsO66aKCLruG+OQDzYO3UaHdDnPWEUf3gpDAl+0qUto=;
 b=H3h8N00QtJBq6aCINRl2EmY80P2fXpk1NSs4P2th2wZyJLtIUcDiJy4k4Uge7GxCkF
 LFfLkL93r8trVbjfB7e6LOPG8fcNdZmjDc1sPCZBFQqVgED0PAXDYXCsATgJAXhxmlCG
 NM5+kIxQgEBuORUv/GLo/9XjsXP3nri8OdjYdAddjbR+qJLgb3XMsnEXzj/ZFJzKXpPb
 HQL8yEiN+D3YS2eNQwgMJYPF52K2Yp7mmlPfOFgusDiYHpX5ZmrUWGs3PXbWrL+8Q8Yf
 OVNNn6iLRlBKvuSa+my2Tsx0Lq2Byy9Eg6GPKSVipyjlFvGHBafP/Z+qegao1pjcbz8L
 JQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YsO66aKCLruG+OQDzYO3UaHdDnPWEUf3gpDAl+0qUto=;
 b=ePK6knEz0n6JeAOnxnn78v41QPBOjBQvPFP53mddqX/26NS9C79vyL/b+At9Htb/07
 rQc+anxfMCJPyEXvZMKETXB2iOE1VP2t2/G8i+k11ed2bd37t4Of7+iGu2CMvyL//9O9
 RwwZVnXf3xWRk/HUnrZmuKce2GXWDJJ/TjicFyockjOVLYag+gOf9Qhzwyxb9G6BjMCo
 V7pU0iKzK4zK67bGOC5Van0A37y5LOpc0c8Z/h6ha03fRzfx8aZpD4AcGwwnvMZdyX2n
 GyMuzz1xuXAQeWcnvLxxEKyjMTiqSwka1DOI8RK1EC1x5cnbSCfFMDdz39Jd2t445S/9
 VtNQ==
X-Gm-Message-State: AOAM531YqUz7TbGSKHLZe8vaKIeDvQf3jCqQKhIN5wtJA4dP2xpePC5/
 XJMSJbC38CAX89et6zE3hevJq/po5A7GfKsUiOM=
X-Google-Smtp-Source: ABdhPJyUsTSW+BdKCvvTEcH5LcoX2K3PQpaJSRRXDSD8bvVou3k3bo3Hoj1OOOnXWMdVMMVSkGuKYBfmEdyyeBKg/vQ=
X-Received: by 2002:a9d:20c3:: with SMTP id x61mr324341ota.311.1615832765510; 
 Mon, 15 Mar 2021 11:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210315032136.3669883-1-unixbhaskar@gmail.com>
In-Reply-To: <20210315032136.3669883-1-unixbhaskar@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Mar 2021 14:25:54 -0400
Message-ID: <CADnq5_Mu=WrBZURETB_+7R=sStY6-vNN9OQ5B8whDTwsuk2tdQ@mail.gmail.com>
Subject: Re: [PATCH V2] drm: amd: pm: Mundane typo fixes in the file
 amdgpu_pm.c
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Xiaojian Du <Xiaojian.Du@amd.com>,
 Dave Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>,
 Huang Rui <ray.huang@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 14, 2021 at 11:22 PM Bhaskar Chowdhury
<unixbhaskar@gmail.com> wrote:
>
>
> s/"an minimum"/"a minimum"/
> s/"an maxmum"/"a maximum"/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Applied.  Thanks!

Alex

> ---
>  Changes from V1:
>   Randy's suggestion to adjust the subject line text
>   And missed out a spell too,which now included
>
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> index 5fa65f191a37..308249ae1a22 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -3315,9 +3315,9 @@ static ssize_t amdgpu_hwmon_show_mclk_label(struct device *dev,
>   *
>   * - pwm1_max: pulse width modulation fan control maximum level (255)
>   *
> - * - fan1_min: an minimum value Unit: revolution/min (RPM)
> + * - fan1_min: a minimum value Unit: revolution/min (RPM)
>   *
> - * - fan1_max: an maxmum value Unit: revolution/max (RPM)
> + * - fan1_max: a maximum value Unit: revolution/max (RPM)
>   *
>   * - fan1_input: fan speed in RPM
>   *
> --
> 2.30.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
