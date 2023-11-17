Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E367EF7D3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 20:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847A610E769;
	Fri, 17 Nov 2023 19:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEA810E769
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 19:27:59 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2809748bdb0so521172a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 11:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700249279; x=1700854079; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wj6uB37R8tTLmYWQxD3IhJvQztAaDxzKAeZZ9RZKtso=;
 b=JIjkhfzo5t27RuqVINMFQUFvQhXQVkOJFM/Jzb9Z8EBahbNwPDNIm0jvV6LD4F3ob5
 p7eo7qF+pYwhMKdl8wPhO/zHMz8wUuf7U1vveDtgIFy953VNJLuOgTHrCJEGfyb7+R9b
 Qf6zY/QUdzSJmXWIFHMJOXjpa5KfotmFDV76c1+DvyNrtUPBt72sL79aPi3vNyUegG0z
 64cfojIedUQdajo5K6wzW9qwPw4ta7bBzDNlY/71XZvEVmbzQpIus4w/wzycxppZRXtw
 YrTChipJAWWsdkFySaC30WWjcMADW5lHeaB+FvRAMS3slHZkdZZGu2U4K1oP/nGWfHKd
 JeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700249279; x=1700854079;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wj6uB37R8tTLmYWQxD3IhJvQztAaDxzKAeZZ9RZKtso=;
 b=S3+guRyP4U519UFeGco5PLObeL3CXy4tV2GacgQH6AdIvsHsn4QvzkrQHgNSqUt5qR
 TPxCEDghNNF+Ax2GPEg6NumaIAmD1ixWWkM+91hMDVmkjv2g2sVLxm1MFYqO55vDkIwp
 yZHLdISvZZ/GzorzIGuEFJQ9HedAV3s6OxXRQmzr2i/4VTQBIsTPJB7AyP+w0t2XQaB1
 2Bk6SEHB2DUxN8iEhVYjSds3//qvfnZxSyx8077LNW2bR0paeqJ60g6MmyOUX85a4C37
 GlQV5ni6CDO1vAeu5OXnVdp+40+gZfMfI23LgbZQNvl+jOoJz2HHsCKCVsH9TciKxLrB
 uLPQ==
X-Gm-Message-State: AOJu0Yzt25JjgLzyeogUF10XnckHeNnvlkwA/LNjKo5lieJixRtHIZgP
 NlZoS7LxSExUk6NtAnsmil4yZi2VYE3jBhpNPso=
X-Google-Smtp-Source: AGHT+IGpmf5PpZM3wbqS3BAXz4gDlhI3cBaZHfL4/PkNJ2ypLVm6z4fUikgmsPY3cDV7ZVOSxpGfgU2JwamzWwg+ATU=
X-Received: by 2002:a17:90b:2386:b0:274:60c7:e15a with SMTP id
 mr6-20020a17090b238600b0027460c7e15amr469895pjb.4.1700249279423; Fri, 17 Nov
 2023 11:27:59 -0800 (PST)
MIME-Version: 1.0
References: <20231117-rk-lvds-defer-msg-v1-1-1e6894cf9a74@theobroma-systems.com>
In-Reply-To: <20231117-rk-lvds-defer-msg-v1-1-1e6894cf9a74@theobroma-systems.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 17 Nov 2023 16:27:47 -0300
Message-ID: <CAOMZO5BVX3UmZ-45OphM6WDhz_ENkxm+Sr1dXkt4jR+Mmo-1Gg@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: lvds: do not print error message when
 deferring probe
To: Quentin Schulz <foss+kernel@0leil.net>
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Sandy Huang <hjc@rock-chips.com>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Quentin,

On Fri, Nov 17, 2023 at 3:31=E2=80=AFPM Quentin Schulz <foss+kernel@0leil.n=
et> wrote:
>
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>
> This scary message may happen if the panel or bridge is not probed
> before the LVDS controller is, resulting in some head scratching because
> the LVDS panel is actually working, since a later try will eventually
> find the panel or bridge.
>
> Therefore let's demote this error message into a debug message to not
> scare users unnecessarily.
...

> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/r=
ockchip/rockchip_lvds.c
> index f0f47e9abf5a..52e2ce2a61a8 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
> @@ -577,7 +577,7 @@ static int rockchip_lvds_bind(struct device *dev, str=
uct device *master,
>                 ret =3D -EINVAL;
>                 goto err_put_port;
>         } else if (ret) {
> -               DRM_DEV_ERROR(dev, "failed to find panel and bridge node\=
n");
> +               DRM_DEV_DEBUG(dev, "failed to find panel and bridge node\=
n");
>                 ret =3D -EPROBE_DEFER;

What about using dev_err_probe() instead?
