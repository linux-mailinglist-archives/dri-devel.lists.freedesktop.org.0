Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FB3AFE968
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603BF10E07B;
	Wed,  9 Jul 2025 12:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dn/Gpc3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C8310E07B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:51:08 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b271f3ae786so4510461a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752065468; x=1752670268; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3NyEhmSVIBICxuUIBvtGawGc4Iwp2NdQOe0bbugc22A=;
 b=dn/Gpc3lFH2D4XHoLh9yI6CNYeeeyok2g4Gi+sCQDj3OF/+qE+RAHwA2IBFi/zhTJu
 KY87ZtIVthyfR8t5vQwuTN1P8Uj1l4vmrk6oBwpTxbJn2ajcFnBCiU9tbJu6hYsmF1TO
 h66KEcJOZ8L9ny1GaI8J8ztp77uXHHYkHDhRLobyh4wzI7gZJvdnjTq5EMOAxe5NaGfQ
 3JPOrIAZ0pzTnUFhDDu9ygUTrZHMjOePrHAwWe0zABYZDkWLZmbRBAXPFLfKsOtate2t
 uTm3vx/Vh1WnY11btvxy11rH2GN+ExcayKt6B1VZi03yjTacKjJOn4a3apQ1dAmR1dmm
 TYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752065468; x=1752670268;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3NyEhmSVIBICxuUIBvtGawGc4Iwp2NdQOe0bbugc22A=;
 b=o1yoiHu7S1iAXnyX3Gvquzw31HzaWFnZSvKvD5dgfBK2fr+ZDZQFVyBXzLtaZRMDpI
 3e/sK3beylsUZdxvYWpK0pyyCSJj+XZGXl1n5B4TZcd8lHzgS5tKJnisdK8zrNUeHNIA
 psEZzhRV9g2Ykv08sqKcHMlYQDxmhdQOmoLO+XEY8iloyyhfGeldXX0M0ueICpzFAFZR
 Oojra/mfKf/GEWOVg2Tp2r0gg27XI970Ts+dIF52buaQueK4mF58sPu+crwYa/semNBo
 XWTVrxh7ChLDh6wkvG1mNgZ2D/607osTgE8qEDnf36Hl1tZIKLnp317zdf0nqkjDWERR
 FhKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrdQBa2HLudVXRPLDIjYwpVlw90Tdph8WktOtJEg6CweE+L/8SU/DQwoS0QGcd4asVAU8t6lcPTWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzxg0e8q+FZXdDdX33uQPvdseMsTeeV5FOa+dto1R+kgV+NXIgA
 Cn6XkeNtnxDwEC6iiFUohwhy40G2dGnLAuiTXJKqWZf8w5KJFBBCsnmn44tWJpchJ2sgOqnRRh5
 FBou7xg+P0S1k71EXJNWP+bio6oCqsjA=
X-Gm-Gg: ASbGnctXYn9l414entx6XqH0JcgreYmOV9/LVU1qFRiGckOH3D6hTvkE5nbaeaZZKxG
 u/keFRS1ML7rVHEr3+ghQdMZZ/93puE1pcylSMWRkfCtunWaofVp5tYlxAbr8FBCDAOtKpo8SYc
 dwagk0vhqXpIz9S3Qb1iapjf3JXFPMiLYIJWSa8rfo
X-Google-Smtp-Source: AGHT+IGH2nT6IZbDo+Ks/jODFk/vV/IDP2mO4EVK6jpwo5O0W2jmbx6OyQumL7TIFPqqenseGtE+uLTBc2Qz1uGxJ1U=
X-Received: by 2002:a17:90b:5247:b0:2fe:85f0:e115 with SMTP id
 98e67ed59e1d1-31c2fdd1716mr3642904a91.26.1752065467724; Wed, 09 Jul 2025
 05:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
 <20250709122332.2874632-9-laurentiu.palcu@oss.nxp.com>
In-Reply-To: <20250709122332.2874632-9-laurentiu.palcu@oss.nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 9 Jul 2025 15:53:10 +0300
X-Gm-Features: Ac12FXzjfnR6C_2CM5IgN-GnBOUmsZy0yzBqb-TNLTHux0vSrVzkSRKBepnd5vs
Message-ID: <CAEnQRZDY6vKwUTVuGqV7_DdV43doq=NRij6+zqJp9h1M5HgBig@mail.gmail.com>
Subject: Re: [PATCH 8/8] MAINTAINERS: Add entry for i.MX94 DCIF driver
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Wed, Jul 9, 2025 at 3:26=E2=80=AFPM Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> The driver is part of DRM subsystem and is located in
> drivers/gpu/drm/imx/dcif.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8be3e0fbe72b8..fbec7e42e693b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18066,6 +18066,14 @@ S:     Maintained
>  F:     Documentation/devicetree/bindings/media/nxp,imx8-jpeg.yaml
>  F:     drivers/media/platform/nxp/imx-jpeg
>
> +NXP i.MX 94 DCIF DRIVER
> +M:     Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +L:     dri-devel@lists.freedesktop.org

Please also add imx@lists.linux.dev
