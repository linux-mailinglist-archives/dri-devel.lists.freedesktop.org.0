Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F878103F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 18:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E8710E57B;
	Fri, 18 Aug 2023 16:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C98F10E0A7;
 Fri, 18 Aug 2023 16:24:37 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-56d6879dcaaso764278eaf.3; 
 Fri, 18 Aug 2023 09:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692375876; x=1692980676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UuxLysHfHgXmaDjRCG7hoacYwkksDqmzeaddr2U9INA=;
 b=lrePtNV7NLyPrHBpD4fWVttiNKAIATqGaL5X/CGR7SFpUwHQhUrfKzbaLq6KRKTUbb
 4bEAEF1WcNyrbZBRMEa8xDRi7H7L/bsqQ6sEvWSBaTlRdOkmF20JReRym7Izg8qCZrr8
 n2rwOeVrZ1tZJkJJtoHn2gpvgm4VyMLt/Tfztygr46aBBE1DeKdKkmLoXiGj3uxzyzR0
 XAi5M3QIZzmDMbIdZi5hiSZFXqLxGlORRu23u2U3sbp78Cw9jNBLoXYtLGN+06bbm26g
 nDL2Dq/CDmDaYV7gcejPrrjbX4KPHyMBY5b/bTIluD/x0CinBqCPQZy2Gw6jcdcl4TF9
 NtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692375876; x=1692980676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UuxLysHfHgXmaDjRCG7hoacYwkksDqmzeaddr2U9INA=;
 b=cWB42E47mJCtZttZNash+G8U7bXESVdsif1wrEWXsKm63GNW7Of9sxLWWUftaKD9Qe
 OiOUVj6GMG+05bISLXcdrUx2CQa9ehI84Z7/A7RsU0mZ8sYsLVxqon+GfUR9gKmV1XfA
 7hMGlBviKdDvGiUFcv/YLitDisTw5BxAjvnJoE7S4GYD7J/NWbmZCC5cod3rVSMkT+DS
 t7eJp55KEbwg0Sz69wDmp+ctU/rOJhZtIKM9UOJ2Pn7X58nCbkY/y7j0lYxeB11W13rm
 SM0Z4nvoZYqzDPlbGChqthvatJ1Je3dQ+lo0C5GBQ5U06I3CeSI3uKiOBlVBDPH1VZgK
 dPQA==
X-Gm-Message-State: AOJu0YyxbsFwwH31ATz4wl17JY18NFTr15PCbc7u7rZlgHklAPINOjyM
 VFY3U2jOjwkgsoVwZlJi0NquQufaevsCKwd/sWQ=
X-Google-Smtp-Source: AGHT+IGU3ZMCRKh3cD8gBFcZeVD7oHu4Bo5GVPRQfX1ji83LYaRHXjfxTp3CmR2dfr+bkxt0kySQ7Q1jLe7MhrvlYFg=
X-Received: by 2002:a05:6870:e88d:b0:1c4:d735:38e9 with SMTP id
 q13-20020a056870e88d00b001c4d73538e9mr2868146oan.57.1692375876474; Fri, 18
 Aug 2023 09:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230817060644.74477-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230817060644.74477-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Aug 2023 12:24:25 -0400
Message-ID: <CADnq5_OOHM4CcWUps4gput7Jh4m1r=8Z+VK79PG2vF6a3Vgkdg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Fix unsigned expression compared with zero
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, linux@roeck-us.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 17, 2023 at 2:07=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The val is defined as unsigned int type, if(val<0) is invalid, modify
> to int type.
>
> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:2813 amdgpu_hwmon_show_power=
_input() warn: unsigned 'val' is never less than zero.
> drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_pm.c:2800 amdgpu_hwmon_show_power=
_avg() warn: unsigned 'val' is never less than zero.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D6181
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Thanks.  The function signatures for amdgpu_hwmon_get_power() and
amdgpu_hwmon_get_sensor_generic() should be fixed up as well.  I'll
send out a fix.

Alex

> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/=
amdgpu_pm.c
> index 5b1d73b00ef7..fe490e5860d2 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -2794,7 +2794,7 @@ static ssize_t amdgpu_hwmon_show_power_avg(struct d=
evice *dev,
>                                            struct device_attribute *attr,
>                                            char *buf)
>  {
> -       unsigned int val;
> +       int val;
>
>         val =3D amdgpu_hwmon_get_power(dev, AMDGPU_PP_SENSOR_GPU_AVG_POWE=
R);
>         if (val < 0)
> @@ -2807,7 +2807,7 @@ static ssize_t amdgpu_hwmon_show_power_input(struct=
 device *dev,
>                                              struct device_attribute *att=
r,
>                                              char *buf)
>  {
> -       unsigned int val;
> +       int val;
>
>         val =3D amdgpu_hwmon_get_power(dev, AMDGPU_PP_SENSOR_GPU_INPUT_PO=
WER);
>         if (val < 0)
> --
> 2.20.1.7.g153144c
>
