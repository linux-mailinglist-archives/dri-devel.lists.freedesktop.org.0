Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EE2772B46
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D20510E313;
	Mon,  7 Aug 2023 16:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1A510E2F6;
 Mon,  7 Aug 2023 16:40:37 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-6bca38a6618so4051801a34.3; 
 Mon, 07 Aug 2023 09:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426437; x=1692031237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yaPYaqaFDCU5jC3MKKmSmMMn4YAXxnsQcK9wgpCcRQ4=;
 b=gBxDE02r5V+myaSbv5/I3zVBzUL6Y08FjzDWLGY9Mn1YOGOSKFx8fQc7Q/GLfqsByL
 v6l002Y37dfvGCR2gZPbCX+vEfczWF2x04zGPK0ZcEI0tz94dVQOvoDRXQaLGL1uSZLn
 JT9lPQ1FeDUMW1cS+wMR3rL6KcPf0lyoIrUU+tL+JoClm9BbxUgOzuuAoCxd9dGCqBlI
 QhD73bDMegwqAgjPMxPrf9/+GWBZrKU15hLCJN0k6XAVRawYtdCZ/nYL4fsJFxyMIqc1
 nWghePP92IQP0v3yXuVaUsGwxiptE83Xk/RwWv+2mv0AIb92L3RjmP0bweW2mfaSKQNV
 4wWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426437; x=1692031237;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yaPYaqaFDCU5jC3MKKmSmMMn4YAXxnsQcK9wgpCcRQ4=;
 b=M7bjpr5iHGvacFRzA/tZuWKK7ZJlvxFQRvfUqd3XeNN18kKxW0ihfCCLlI5C5yv+R2
 ZOHC1l3RjAF6CByMCpX9+b1FX8fMu2MFbamm5pTA8NCu/vBpz5Uc5GUpEv3dKysjFOTi
 EfhLiVG0srLlDe8+5OdxhZD59eV895ZopG/7bpxutPOypudUrPU31FGiVL5PQRIq1bSc
 jqoC5ExY6zZuh+fDF6oslK0Vk6O+9pPzz2m3Mw5PyTYFjQXDBkygYBdZQTHgLrw1VCN3
 BQRJJYwUoUCtg6qwctX+junsMcvNgGA6akBwh1MnJWC29WIAnBdfHrhNV28Bj+GZcJNV
 6y2g==
X-Gm-Message-State: AOJu0Yzr3nKb2QFbg9jwyEf657AkNY0N08y91Fz0P0ZbVi6gV6nbuDs1
 t8Mwmu/URfJ6ViQtCOmIVNIVWm01JwcobkVwNOM=
X-Google-Smtp-Source: AGHT+IGFmb5vESGA6g+6euItG2gjeRnrfhDdtSVwLuyAV78N6vIgNdo1FsMx/lyO+M6eZf5E6F3z6P9PQhaHQDGOJ60=
X-Received: by 2002:a05:6870:8a14:b0:1be:c87d:c670 with SMTP id
 p20-20020a0568708a1400b001bec87dc670mr11199409oaq.47.1691426436882; Mon, 07
 Aug 2023 09:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230801091906.7270-1-sunran001@208suo.com>
In-Reply-To: <20230801091906.7270-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:40:25 -0400
Message-ID: <CADnq5_Mb3c1Mks+O-9jP15gH-Be+oL8CX9WJ2zdF3hxvmNT72w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Clean up errors in vega10_processpptables.c
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 5:19=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: "foo* bar" should be "foo *bar"
> ERROR: space required before the open brace '{'
> ERROR: space required before the open parenthesis '('
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptable=
s.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c
> index bb90d8abf79b..3be616af327e 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c
> @@ -372,9 +372,9 @@ static int get_mm_clock_voltage_table(
>         return 0;
>  }
>
> -static void get_scl_sda_value(uint8_t line, uint8_t *scl, uint8_t* sda)
> +static void get_scl_sda_value(uint8_t line, uint8_t *scl, uint8_t *sda)
>  {
> -       switch(line){
> +       switch (line) {
>         case Vega10_I2CLineID_DDC1:
>                 *scl =3D Vega10_I2C_DDC1CLK;
>                 *sda =3D Vega10_I2C_DDC1DATA;
> @@ -954,7 +954,7 @@ static int init_powerplay_extended_tables(
>         if (!result && powerplay_table->usPixclkDependencyTableOffset)
>                 result =3D get_pix_clk_voltage_dependency_table(hwmgr,
>                                 &pp_table_info->vdd_dep_on_pixclk,
> -                               (const ATOM_Vega10_PIXCLK_Dependency_Tabl=
e*)
> +                               (const ATOM_Vega10_PIXCLK_Dependency_Tabl=
e *)
>                                 pixclk_dep_table);
>
>         if (!result && powerplay_table->usPhyClkDependencyTableOffset)
> --
> 2.17.1
>
