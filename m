Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B550C6AB8C6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2B710E196;
	Mon,  6 Mar 2023 08:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC0810E196
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:49:09 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id y144so7280730yby.12
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GtbYZNGHC9OG/em8LL7OjKhJVuS4kO26d62qIDYXYI=;
 b=NnsoZeNTHmUEHQhNevMja7R9F15XSmY4P2l9hG+U62xDY9b0hNtQzCUYSjzqlF59xg
 vPGWYPeyVtLlOpOw+zbtVNh1En+npDGonQ35A/V66prlNZEFMVTDgLS5NC/XtAgOnthK
 dSi11XgdRVhsK/30F18fP8e+oxJWv9Bmf8n0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3GtbYZNGHC9OG/em8LL7OjKhJVuS4kO26d62qIDYXYI=;
 b=7+PhS8Z+ky04S/wB6Ud2ZE2tKtZ/OB0NiwViaSpGi5q/bwjzrpzX1mqi9cQ0gNRj7N
 T0WIfUQ+jYeYan4EA80spMZv/qObFS5R/6Q7EYci9u500LG0HvDOloiZyYcc6rekdIYF
 GvE8PIsjZfm/1pkkn8fO9aO0qyZN/EEv/eyholagwelSB6tPJ9UjXbQRe+T+K49lYWjL
 iuxJPe5LwKgiOvgDEt7EGZ4w5MRqnwkvIGUVmjpsmE37g50vOescciIm1RKjHW5lq6pn
 T2ewTuL6U7MdgPGG3MKi293cWPZ2X1TMZcnKL2D4roxBozfjgdshw61f7jZNsR2ghB9N
 CGgw==
X-Gm-Message-State: AO0yUKWkINCUUXxZDDNhKHlKPaYVgdwEj9Mctinbt173NiTHIzI9Cqbc
 CQkAF4FhceE/9kaJAthR1TmHCwdAeVinwV1ycn4zRg==
X-Google-Smtp-Source: AK7set9rICjWfZoA7wXooedrv/zZHgvLYiJ04JIwAbDgtQsowOKoLuFK98s0pP3K9IfwxVDppUW8fJm5nKBNyqCr+e0=
X-Received: by 2002:a25:938c:0:b0:91d:d6ed:6bd2 with SMTP id
 a12-20020a25938c000000b0091dd6ed6bd2mr6093105ybm.1.1678092548604; Mon, 06 Mar
 2023 00:49:08 -0800 (PST)
MIME-Version: 1.0
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
In-Reply-To: <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 6 Mar 2023 14:18:57 +0530
Message-ID: <CAMty3ZA3y4UgVSY5cYfAjksyp6zJaRWgEfkmc70K5qtWxBOMHQ@mail.gmail.com>
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
To: =?UTF-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?=
 <inki.dae@samsung.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Inki Dae,

On Mon, Mar 6, 2023 at 10:54=E2=80=AFAM =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen P=
latform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90
<inki.dae@samsung.com> wrote:
>
> Hi Jagan,
>
> > -----Original Message-----
> > From: Jagan Teki <jagan@amarulasolutions.com>
> > Sent: Friday, March 3, 2023 11:51 PM
> > To: Andrzej Hajda <andrzej.hajda@intel.com>; Inki Dae <inki.dae@samsung=
.com>;
> > Marek Szyprowski <m.szyprowski@samsung.com>; Neil Armstrong
> > <neil.armstrong@linaro.org>; Marek Vasut <marex@denx.de>; Maxime Ripard
> > <mripard@kernel.org>
> > Cc: Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> > <kyungmin.park@samsung.com>; Frieder Schrempf <frieder.schrempf@kontron=
.de>;
> > Tim Harvey <tharvey@gateworks.com>; Adam Ford <aford173@gmail.com>; Mat=
teo
> > Lisi <matteo.lisi@engicam.com>; dri-devel@lists.freedesktop.org; linux-
> > samsung-soc@vger.kernel.org; linux-amarula <linux-
> > amarula@amarulasolutions.com>; Jagan Teki <jagan@amarulasolutions.com>
> > Subject: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
> >
> > This series supports common bridge support for Samsung MIPI DSIM
> > which is used in Exynos and i.MX8MM SoC's.
> >
> > The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
> >
> > Inki Dae: please note that this series added on top of exynos-drm-next
> > since few exynos dsi changes are not been part of drm-misc-next.
> > Request you to pick these via exynos-drm-next, or let me know if you
> > have any comments?
>
> Seems some issue Marek found on testing. If fixed then I will try to pick=
 this
> patch series up.

Okay, I have a few comments from Maxime and Marek V pointed out. I
will send v16 now if you are okay with it?

Thanks,
Jagan.
