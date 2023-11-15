Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0087EC79D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285BD10E085;
	Wed, 15 Nov 2023 15:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5453A10E085
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:50:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40a4d04af5cso32706225e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1700063408; x=1700668208;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lzEnr8i1sT5AWLTvZnLADAf4vpUV1tEYyqWWPHLAQFo=;
 b=Atae3+BBlYKWy3eiuYq/q+f/65OighcLve8PR5W2X3Def+t9Qa2DR6q4cuW1zLBKUD
 VGcU/ZJweODV7E3qCgpBBZ8XPYqS2DRoKNIItvYnfqoroYzwRC6AfjZLMe2xhMbBzPwp
 q6De8pMTMdWQw93e/l+mt+8pP/PrQkgf9N+sSU1TuOEhuZcTZ2M1Wn/jMEUMVBrPP7AS
 TLt7xe32+0icMX8bGkOrLtRYWPTr0SoZLBpeja7NrV4hTUGr8aeq4rTAgjcBD1igqko1
 7PiLdDIOXFpk1W/fw/Wk1pRDI/GU2ZrdEOTiQRuVhPmmGMcFcqKwMuXZYP05ar+gIY99
 zmlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700063408; x=1700668208;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lzEnr8i1sT5AWLTvZnLADAf4vpUV1tEYyqWWPHLAQFo=;
 b=Vj3NgpBcHmJBe8C+XG6qF7B3rZZC64qvyvB3YlCoE/0HXniEcJ9QCnp8hCsfy2CEHM
 Pk71pRnRobI6CRwQD1acMtGcJHnjuOmcbLXPdphizx0gbGRlCM0rAzwqEp4JuIGR/yqY
 JuNA3W+etI5UfwIn/isO4JMXJTeRYlFW9WnWxPcn9TXKB1Fo/Q8KTj/f/+s+cz8f+9yB
 D9yAIgPH22bzwrbsddS8hudiWourA/8ml9i6oYjNzDwpR7Se/4Vk1+thaVlx+UUV1250
 i1LxHXJYxfrsNpXSFGrJGbt322RlcOhI7lvB4JXkILoHslIH5//JhrburSZvgJ6tHn1x
 kqtA==
X-Gm-Message-State: AOJu0Yx00YIHvTyoB/VfoZjLP7bMzX6tpivQ/z+47+xmBuwgvWbKxvD8
 2wnYuDkFw9atPCMrSgkI7Ygn0NIlkikhF5IF9oWY4XzhRgAssBRiGDW7WDkO
X-Google-Smtp-Source: AGHT+IFla7G1hT2tVBN1ZaWqd4Z9G6daPNypvTqubx3Og4idSx6Ik0nGx86WBC8LDRrRn2fpnCnRCijl0gBE6lz+FsY=
X-Received: by 2002:a5d:64c6:0:b0:32f:8920:48ab with SMTP id
 f6-20020a5d64c6000000b0032f892048abmr9261113wri.65.1700063407522; Wed, 15 Nov
 2023 07:50:07 -0800 (PST)
MIME-Version: 1.0
References: <20231114233859.274189-1-appsforartists@google.com>
 <70f12e96-0fcc-4954-8507-27cf5e15a3b2@redhat.com>
 <CAAL3-=9YYQBV-T-KhHdYrtGHH1RC29uzTuQ98roAY9GwrNrwmg@mail.gmail.com>
 <CAAL3-=-b3-RZNNfQEYzQxK=SW4PPJ7cmrX8omBniec+tgC2frw@mail.gmail.com>
In-Reply-To: <CAAL3-=-b3-RZNNfQEYzQxK=SW4PPJ7cmrX8omBniec+tgC2frw@mail.gmail.com>
From: Brenton Simpson <appsforartists@google.com>
Date: Wed, 15 Nov 2023 07:49:56 -0800
Message-ID: <CAAL3-=8_DL7ip753ue+Y9-xS+ma-yMmVX6U0Ojzxht0S+FdNcg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-orientation-quirks: add Lenovo Legion Go
To: Hans de Goede <hdegoede@redhat.com>
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
Cc: Patrick Thompson <ptf@google.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jared Baldridge <jrb@expunge.us>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Allen Ballway <ballway@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Arg - the special characters got mangled.  One last time.

-- >8 --

The Legion Go has a 2560x1600 portrait screen, with the native "up"
facing the right controller (90=C2=B0 CW from the rest of the device).

Signed-off-by: Brenton Simpson <appsforartists@google.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c
b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index d5c1529..3d92f66 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -336,6 +336,12 @@ static const struct dmi_system_id orientation_data[] =
=3D {
                  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IG=
L5"),
                },
                .driver_data =3D (void *)&lcd1200x1920_rightside_up,
+       }, {    /* Lenovo Legion Go 8APU1 */
+               .matches =3D {
+                 DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+                 DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
+               },
+               .driver_data =3D (void *)&lcd1600x2560_leftside_up,
        }, {    /* Lenovo Yoga Book X90F / X90L */
                .matches =3D {
                  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
--
2.43.0.rc0.421.g78406f8d94-goog

On Wed, Nov 15, 2023 at 7:48=E2=80=AFAM Brenton Simpson
<appsforartists@google.com> wrote:
>
> Resending from the email address linked to my GitHub account.
>
> -- >8 --
>
> The Legion Go has a 2560x1600 portrait screen, with the native "up" facin=
g =3D
> the right controller (90=3DC2=3DB0 CW from the rest of the device).
>
> Signed-off-by: Brenton Simpson <appsforartists@google.com>
> ---
>  drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu=
/d=3D
> rm/drm_panel_orientation_quirks.c
> index d5c1529..3d92f66 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -336,6 +336,12 @@ static const struct dmi_system_id orientation_data[]=
 =3D
> =3D3D {
>  =3D09=3D09  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "IdeaPad Duet 3 10IGL5"=
),
>  =3D09=3D09},
>  =3D09=3D09.driver_data =3D3D (void *)&lcd1200x1920_rightside_up,
> +=3D09}, {=3D09/* Lenovo Legion Go 8APU1 */
> +=3D09=3D09.matches =3D3D {
> +=3D09=3D09  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +=3D09=3D09  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +=3D09=3D09},
> +=3D09=3D09.driver_data =3D3D (void *)&lcd1600x2560_leftside_up,
>  =3D09}, {=3D09/* Lenovo Yoga Book X90F / X90L */
>  =3D09=3D09.matches =3D3D {
>  =3D09=3D09  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
> --=3D20
> 2.43.0.rc0.421.g78406f8d94-goog
