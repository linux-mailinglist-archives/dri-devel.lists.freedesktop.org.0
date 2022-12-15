Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A7964D9F3
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 12:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A360E10E525;
	Thu, 15 Dec 2022 11:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCB610E525
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 11:00:18 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-1441d7d40c6so20442169fac.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Dec 2022 03:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6pQ9de+Vc2wR7bYvymc7ZHtpYqEL/DcrRHJx1Mh2KsQ=;
 b=bMgSIdc2m2S+3BHH0vvxtn6c3YBRRts62w7RRM8K164kP11hfL33lCFdKMf6QFK1Wi
 Izww7lPRkRuleqOx6OmG/jlKopV3ENZFh5nUYZlwPapi5VIVSw6NIb0EgEm3m1HKn0nh
 5OPh6NkPbi+0jOYrnYhEMaKAu8NKIlZU8xiAS8BxUrOFlG40jdfo07cQZ7SbK9qLClUK
 J6snoDHqoXBRghrlPJ5mrSnMfKTJB8Xrm/8qQc92nlkeTWqTg+RhRVGYmEGhf+PAh3cX
 iADIL99Fau45ZW5+ADUKPEL++yMAcejX9Wa5e4+6pwJhYkcD/He9RXT2+d9BgvcUg3Qz
 oSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6pQ9de+Vc2wR7bYvymc7ZHtpYqEL/DcrRHJx1Mh2KsQ=;
 b=a3/ImScpiVQwjVu5vaCRuIJBtB8X7AEC6LJtE3FSKh9CCoVqSqCVK59rU/lAqUWgzW
 3E/5UwwEm3pWJmD07FtBj16sRzICj9eULMB+4cJFJMjMM6YxxwHRBF8nZCESbVrxSmbM
 M2Ec5ZRZz7qzAJOtm6c9JPjjGR0ns+Z7Ek6cGBOn+m69yDb1s2rREa1K5I/05q8iAEIT
 FA405paLMdXeatzTGZ6b214rMh72o9BECsWHIG3ge0MqpjVi0AsBsIeEWBeQxbLsGyeY
 ubOgdkVE42tF9zTe0KbcBUH/3DN5M0NgXd1zDkBlNpbslyQUMsnZkJzKOi/3azdEwFd8
 NhoA==
X-Gm-Message-State: AFqh2kpJ1t1VgQYwZnblK8ajnlw8W+umlHgj5toMAYoU8jk5Lg2A7UlZ
 +7o5H5iRpy84rFl00FI1gWNirRO4as45mmmjVV47LA==
X-Google-Smtp-Source: AA0mqf5F/5kRIJI2tVYm8OqRlAYZXRqyjtT57M3LL5Z46ZREVwwUH72F0qonNnKrqu9vgBKMSg8xRqpoW9tgmWe8yd0=
X-Received: by 2002:a05:6870:9e4c:b0:13c:33d0:22e2 with SMTP id
 pt12-20020a0568709e4c00b0013c33d022e2mr588342oab.14.1671102017941; Thu, 15
 Dec 2022 03:00:17 -0800 (PST)
MIME-Version: 1.0
References: <20221214125821.12489-1-paul@crapouillou.net>
 <20221214125821.12489-4-paul@crapouillou.net>
In-Reply-To: <20221214125821.12489-4-paul@crapouillou.net>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 15 Dec 2022 12:00:07 +0100
Message-ID: <CAG3jFysiZMVbrwDuuqN+uKEH7ge7q-z0VRtbLfBLxOEYkaC=ww@mail.gmail.com>
Subject: Re: [PATCH 03/10] drm: bridge: it66121: Use regmap_noinc_read()
To: Paul Cercueil <paul@crapouillou.net>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Dec 2022 at 13:58, Paul Cercueil <paul@crapouillou.net> wrote:
>
> Use regmap_noinc_read() instead of reading the data from the DDC FIFO one
> byte at a time.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/ite-it66121.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index a698eec8f250..12222840df30 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -589,13 +589,12 @@ static int it66121_get_edid_block(void *context, u8 *buf,
>                 if (ret)
>                         return ret;
>
> -               do {
> -                       ret = regmap_read(ctx->regmap, IT66121_DDC_RD_FIFO_REG, &val);
> -                       if (ret)
> -                               return ret;
> -                       *(buf++) = val;
> -                       cnt--;
> -               } while (cnt > 0);
> +               ret = regmap_noinc_read(ctx->regmap, IT66121_DDC_RD_FIFO_REG,
> +                                       buf, cnt);
> +               if (ret)
> +                       return ret;
> +
> +               buf += cnt;
>         }
>
>         return 0;
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
