Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA86901DAA
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 11:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9537D10E3B5;
	Mon, 10 Jun 2024 09:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dn07kPiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BE210E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 09:03:01 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-48c4c5c0614so295422137.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 02:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718010180; x=1718614980; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8D1xRI+i6XbOFe1nGV/VEBCOouzsGHQh9VuVWaJeScE=;
 b=Dn07kPiYz3hE68PYAC9ywmhHeQ/i/B5EFsDv2W3L1Xw0zbtEbp8ibhb5jmNBx0Nlyg
 7ynCr0IhdO9DcqKvcEY2MYPKVHH9uX8847PWbumoEE4eoANMP6Zbnehngzgd0cGhIGsQ
 xlXz43mgqiepCxAP0pOGGtBKh2Tr0sf56FwnS+pQfJL7YeD5s1ta/wu/Ko6+fBY/SekJ
 +zmSPZn7kRBQz9VisYlB0vkaSCftIwrWBwPqvicyx7p+cNB1MrZZa7YfoDvIdh1etfnz
 Naxn3BQjEmn4XO7XuZAjZbhjjWjziPK62pU7F2087qLxD9067kPSwsmXVJYZE5g6u8Ek
 YGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718010180; x=1718614980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8D1xRI+i6XbOFe1nGV/VEBCOouzsGHQh9VuVWaJeScE=;
 b=Xkg3YMKy0Usjr4g718nokYG6JnqqFthWa/0erURcXYPfTIUXrj8Aaxs/7gRJupojM/
 T7DrnYLlyz26sXacpdDbqefElWXQXI+wo+TVHLYnPldFZoyOnOqg1jswPqK314iA+aGb
 Y7HLuAo8Uj4Jgjc5ZLzqsxQVo8Q7ClelfKdh509NeCqFxmMNcBfX632s6JJ7RpdOa0gf
 HoMtYkWTFpiQ1CR/r/pAWii+YcOgDsU6NocqFKhUeV9cwgY7yFkWGWR29P5i/2U/gjPz
 vnFuI40AUSVVIP439+Dru8feyj91KuQILC+H+bh0+Ablhu1+qzDCa4W4EhFI8XhfaM5Z
 lnEw==
X-Gm-Message-State: AOJu0Yy3h5nT6IjCsJ0V3xVlmUyYgzaUz74tvwu8VOe7kPv1UxQAJI14
 zQ4TdVJSpXHDCYraFPm4r/CoHvTzePBCHorW8JBG4sLTZfqxfWQT9/+liIsAEwSdBL1G4QBWrFH
 7AUH/SXeQMwXVrxX9JsCp2nujvH8=
X-Google-Smtp-Source: AGHT+IENq9kzQ6aI4IYLBQaNTUgvTVHL49Rkm7/5OoofhYSBaeobfRJ13I1Ha1fqNTI1Enwb179CJpHpoqTO6gDCSS4=
X-Received: by 2002:a67:fb49:0:b0:48c:3514:2f9f with SMTP id
 ada2fe7eead31-48c351431cdmr6607984137.23.1718010180219; Mon, 10 Jun 2024
 02:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1715691257.git.jani.nikula@intel.com>
 <2fe0b4deb4f2ab255735cd6e1a657a17e0d45784.1715691257.git.jani.nikula@intel.com>
In-Reply-To: <2fe0b4deb4f2ab255735cd6e1a657a17e0d45784.1715691257.git.jani.nikula@intel.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 10 Jun 2024 18:02:23 +0900
Message-ID: <CAAQKjZNhUzyUO4rjPZGGrp=0MsTdQvT2ij3bVV91oDcYjk9EDg@mail.gmail.com>
Subject: Re: [PATCH 04/11] drm/exynos: hdmi: convert to struct drm_edid
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org
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

Hi, Jani Nikula,

Thanks for your contribution and sorry for being late. Below are my comment=
s.

2024=EB=85=84 5=EC=9B=94 14=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:57, J=
ani Nikula <jani.nikula@intel.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
>
> The functional change is that the CEC physical address gets invalidated
> when the EDID could not be read.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> ---
>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exyno=
s/exynos_hdmi.c
> index e968824a4c72..9033e8b66816 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -883,27 +883,30 @@ static const struct drm_connector_funcs hdmi_connec=
tor_funcs =3D {
>  static int hdmi_get_modes(struct drm_connector *connector)
>  {
>         struct hdmi_context *hdata =3D connector_to_hdmi(connector);
> -       struct edid *edid;
> +       const struct drm_display_info *info =3D &connector->display_info;
> +       const struct drm_edid *drm_edid;
>         int ret;
>
>         if (!hdata->ddc_adpt)
>                 return 0;
>
> -       edid =3D drm_get_edid(connector, hdata->ddc_adpt);
> -       if (!edid)
> +       drm_edid =3D drm_edid_read_ddc(connector, hdata->ddc_adpt);

drm_edid_read_ddc function can return NULL for an error. Could you add
an exception handling?

> +
> +       drm_edid_connector_update(connector, drm_edid);

Ditto. drm_edid_connector_update function can return a negative value
for an error.

> +
> +       cec_notifier_set_phys_addr(hdata->notifier, info->source_physical=
_address);
> +
> +       if (!drm_edid)
>                 return 0;
>
> -       hdata->dvi_mode =3D !connector->display_info.is_hdmi;
> +       hdata->dvi_mode =3D !info->is_hdmi;

Above change wouldn't be related to this patch.

>         DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>                           (hdata->dvi_mode ? "dvi monitor" : "hdmi monito=
r"),
> -                         edid->width_cm, edid->height_cm);
> -
> -       drm_connector_update_edid_property(connector, edid);
> -       cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
> +                         info->width_mm / 10, info->height_mm / 10);

The purpose of this patch would be to replace edid with drm_edid so
how about updating the above change like below?
    drm_edid->edid->width_cm, erm_edid->edid->height_cm);

Thanks,
Inki Dae

>
> -       ret =3D drm_add_edid_modes(connector, edid);
> +       ret =3D drm_edid_connector_add_modes(connector);
>
> -       kfree(edid);
> +       drm_edid_free(drm_edid);
>
>         return ret;
>  }
> --
> 2.39.2
>
>
