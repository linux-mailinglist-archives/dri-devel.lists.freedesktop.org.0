Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E29578101B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 18:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EC110E54C;
	Fri, 18 Aug 2023 16:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1867B10E554;
 Fri, 18 Aug 2023 16:17:11 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1a28de15c8aso591157fac.2; 
 Fri, 18 Aug 2023 09:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692375430; x=1692980230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rmsKotSwYF+kPiIcHWALWBh/ukbgHTS/mEBTjEjcav8=;
 b=FVHqGr/fOb1UCdX8GGM2iLUJry3Lc6ptJ2VUTEjTzpbcQazo6xUUcGNEad3RuB5Zd9
 oOdFrcLy/jLQsE7aE/nqTL9JtuG723yC0Qw9iUGydscO5Ki6V0uHEZpONbBZPhu/9ibq
 rurS4nBFXKjZabvp4wzzZ+pw/T5bxFai6KXPwyYtNY+EA5gLnIcUzI9PlWSt2pGhBAOd
 JYSvHjpNRPHy/7hV6vXSAGjQVnKraN9Hyv768ITx9G+4g7/Au8bs8tko9onUNMn+n4sh
 mtfnWIvw3ILHcPHY17wxqI0UfHmtoKnfFPV1nLYVWcI3aqOwy5QXhWRcWdr2Y0IF/vKA
 iyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692375430; x=1692980230;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rmsKotSwYF+kPiIcHWALWBh/ukbgHTS/mEBTjEjcav8=;
 b=bRJqqOCSxifCvGItI4p5wFhYg55Y/kWT5svNYWl+hTkYCti+MyrMNv7u9qqjblmJIn
 h7xUfnOvT58ozwQkatfwFCvwN3f7c4ryUNuEtoni7FNKoyEO+t1OYvSujOArvV00yt5/
 4rgQDmXYVijfSWdZ4fQk8UMuevaEDS9n0UjonR5xbh+xuW1kXduR13GP5WczKObPCdsI
 AmvFI4h6jJ6JZZb6++bIvUDih2BoEhdijosuKTfgXzghf8gKfVTmTuEh2Qm0jRy00R1W
 oPJjPsaxCA9ZXYHhb30U80U31VqEy8Pa4c+qX9M5IVDzDwd8gVOSFV/uxf9QoV002q04
 nxcQ==
X-Gm-Message-State: AOJu0Yzte//tLDrfFL8K3vVphbtWQuvr4xv+EnjAkYY3I9zPW029eKNy
 d1+AlGiFVfEYkXj1OqHkwH9Wd89vvIHoWZg+X864XwMT
X-Google-Smtp-Source: AGHT+IEbBMyiu2ye/T762d0evV957KNMqzHYgj0Gtr/TXQYWPbXqSWEuxLLMDxRhGe5glkzIXv1n6ijj6wgk13JvSiE=
X-Received: by 2002:a05:6871:68d:b0:1bf:61d1:a4d4 with SMTP id
 l13-20020a056871068d00b001bf61d1a4d4mr3548702oao.6.1692375430306; Fri, 18 Aug
 2023 09:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230817113349.749797-1-konstantin.meskhidze@huawei.com>
In-Reply-To: <20230817113349.749797-1-konstantin.meskhidze@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Aug 2023 12:16:59 -0400
Message-ID: <CADnq5_M6QEU5fZXiACiQWsLODtdWmpfX5FCvgyDBsdNGw95a1w@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: radeon: possible buffer overflow
To: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
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
Cc: yusongping@huawei.com, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, artem.kuzin@huawei.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Aug 17, 2023 at 7:34=E2=80=AFAM Konstantin Meskhidze
<konstantin.meskhidze@huawei.com> wrote:
>
> Buffer 'afmt_status' of size 6 could overflow, since index 'afmt_idx' is
> checked after access.
>
> Fixes: 5cc4e5fc293b ("drm/radeon: Cleanup HDMI audio interrupt handling f=
or evergreen")
> Co-developed-by: Ivanov Mikhail <ivanov.mikhail1@huawei-partners.com>
> Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
> ---
>  drivers/gpu/drm/radeon/evergreen.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/=
evergreen.c
> index 4f06356d9..f0ae087be 100644
> --- a/drivers/gpu/drm/radeon/evergreen.c
> +++ b/drivers/gpu/drm/radeon/evergreen.c
> @@ -4821,14 +4821,15 @@ int evergreen_irq_process(struct radeon_device *r=
dev)
>                         break;
>                 case 44: /* hdmi */
>                         afmt_idx =3D src_data;
> -                       if (!(afmt_status[afmt_idx] & AFMT_AZ_FORMAT_WTRI=
G))
> -                               DRM_DEBUG("IH: IH event w/o asserted irq =
bit?\n");
> -
>                         if (afmt_idx > 5) {
>                                 DRM_ERROR("Unhandled interrupt: %d %d\n",
>                                           src_id, src_data);
>                                 break;
>                         }
> +
> +                       if (!(afmt_status[afmt_idx] & AFMT_AZ_FORMAT_WTRI=
G))
> +                               DRM_DEBUG("IH: IH event w/o asserted irq =
bit?\n");
> +
>                         afmt_status[afmt_idx] &=3D ~AFMT_AZ_FORMAT_WTRIG;
>                         queue_hdmi =3D true;
>                         DRM_DEBUG("IH: HDMI%d\n", afmt_idx + 1);
> --
> 2.34.1
>
