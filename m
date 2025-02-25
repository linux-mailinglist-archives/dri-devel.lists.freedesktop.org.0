Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B07A4329B
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 02:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056F810E515;
	Tue, 25 Feb 2025 01:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MVWtf0Zq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7110E515
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 01:48:56 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ab771575040so1053212866b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1740448134; x=1741052934;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=loyJuf6zNk03z78etJFgemOo09eYVwdWkJ6KQXv4Jfk=;
 b=MVWtf0ZqKcxsXyofdtuNEx5zJxgrBEreu2gqtfMjEYYrm0yRG0YsNFjhFK4DhXmupK
 V15oqwLYHjDcWhhnP/fYuEkNs8mwXtrUhnoExQUbNY01k0T76iAJvLyqkikYy/dOxi4f
 DfX+Qhs+EndW0tGq+nm0esRfZEsJleaMHeSM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740448134; x=1741052934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=loyJuf6zNk03z78etJFgemOo09eYVwdWkJ6KQXv4Jfk=;
 b=uhEYhhfPqrAAAXRiGxYQNV8teaGbuY3BMe6+wxXfljYCqTFxIsEBR1znTtyP4uAHir
 8gKKFQd56gW0fJMxvmWj6WpG+KMMdAYvqH//qH3AwQcLrmvw8Viikeulisla7UEX/0Dv
 U6inKPN+sfUOJQoEvtYd6Tb6X/Wjvbv1GD9sL+IXtgSZprNLH+egySIk0gcN8eDJYuBh
 At8HrFnJBe8BmkgNDAw1WKmXgx8Kfpi0HpznERMwGc3qoetUlJ20ebPH+bXbL9HY86q4
 VdnWIskpcdrVPUyd9cRqfG/RYYW3YxZRWoWvd0fyiu9wYbH8l7i0vvMucmvTrw0GF9LA
 4whA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxouYSgUIATbxjaTYaYRtamOKfHQO4FWsG2ejj50azMEnU2XAkOsMMRPCiTD0vAHFjve+uslZ1BRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydcZyuO6nRXoCmT8V2U9+fMGQi6CKSYf5/+dPlmZaKsyWUdSPg
 yDh/R2rbPjexVQFtwSC9Tn9AHYFGNS8eWkYQ6VYQTZCfrMyFTPc2/ChtimS9IlCtspjHizK/ZvL
 g0FhO
X-Gm-Gg: ASbGncs05qrh+YQ48wUGr9rUMWbUJehhna3e8qVAsOQb+fIPT18/DDz8mPjpEoJMd6S
 rz/PL7RX3s7wpecZT0Pg7f/y0kaZuaFeYoemqBLqqSQMMq2uEnLKJyQkpPE41TW7aYuhkdzdNl0
 56I8o7xPAgvkXiZnzELeXNW0gB/OcoK8L0mR3MrELW8++GOHQVMX1ljzKElDvya2sFrPsE7KcMr
 0XtpuG3UjNKWdcJ2oKnJ9F4EM9uGpvVvPK+Mi6ye6G4D6pW+k8e1jT3bRjw1aNdUwkb/MF+LI+N
 6AXgx6addAqtWQUj1DliWI2oBqkOMN+skSnDJsau5Stpw5QOvWwvxtBvxdSJ1bgQYQ==
X-Google-Smtp-Source: AGHT+IFdafxW5ar2tQ0Gs1zzLdQqmt54jyGmH1ubGR47N+4kxSgnbTxbF0Pwzi2ohxu6L0bPJ1wP8Q==
X-Received: by 2002:a17:907:720a:b0:aba:6385:576e with SMTP id
 a640c23a62f3a-abc0ae1aed3mr1436007166b.3.1740448134406; 
 Mon, 24 Feb 2025 17:48:54 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abed1cd2d3asm55668366b.18.2025.02.24.17.48.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2025 17:48:54 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5dccaaca646so8853188a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 17:48:54 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXXAhJsYbpIfZRvJOSiZfEFkDbQ2xYCFeCM0l0sZ0MB5GNALAvhXdIGSPp/K5MdqS4BimOFthGWaC0=@lists.freedesktop.org
X-Received: by 2002:a05:6512:1253:b0:545:6a2:e59 with SMTP id
 2adb3069b0e04-54838cb627cmr5635189e87.18.1740447736562; Mon, 24 Feb 2025
 17:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
 <20250224081325.96724-11-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-11-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:42:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WS_2JAKMyFFmrNtaN7-O4dh2hOXHc25FytDxXAjAr+5A@mail.gmail.com>
X-Gm-Features: AWEUYZkb9AduQv4S2t7Q6Lb4ouepbii0QdSB144heJ2UJlKArYXhKCxoqxEOhvg
Message-ID: <CAD=FV=WS_2JAKMyFFmrNtaN7-O4dh2hOXHc25FytDxXAjAr+5A@mail.gmail.com>
Subject: Re: [PATCH v7 10/15] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi,

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> @@ -392,11 +393,27 @@ static const struct component_ops rockchip_dp_compo=
nent_ops =3D {
>         .unbind =3D rockchip_dp_unbind,
>  };
>
> +static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
> +{
> +       struct analogix_dp_plat_data *plat_data =3D analogix_dp_aux_to_pl=
at_data(aux);
> +       struct rockchip_dp_device *dp =3D pdata_encoder_to_dp(plat_data);
> +       int ret;
> +
> +       ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat=
_data->panel, NULL);
> +       if (ret && ret !=3D -ENODEV)
> +               return ret;

Can you explain why you treat -ENODEV as a non-error case here? Maybe
this is for the non-eDP case (AKA the DP case) where there's no
further panels or bridges? Maybe a comment would be helpful to remind
us?


> +       ret =3D component_add(dp->dev, &rockchip_dp_component_ops);
> +       if (ret)
> +               return ret;
> +
> +       return ret;

nit: the above could just be:

return component_add(dp->dev, &rockchip_dp_component_ops);


> @@ -448,9 +460,16 @@ static int rockchip_dp_probe(struct platform_device =
*pdev)
>         if (IS_ERR(dp->adp))
>                 return PTR_ERR(dp->adp);
>
> -       ret =3D component_add(dev, &rockchip_dp_component_ops);
> -       if (ret)
> -               return ret;
> +       ret =3D devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp),=
 rockchip_dp_link_panel);
> +       if (ret) {
> +               if (ret !=3D -ENODEV)
> +                       return dev_err_probe(dp->dev, ret,
> +                                            "failed to populate aux bus =
: %d\n", ret);

IIRC this -ENODEV case is for old legacy panels that aren't listed
under the aux bus in the device tree. Maybe a comment would be helpful
to remind us?

nit: don't need the %d in your error message. dev_err_probe() already
prints the error code.


> +               ret =3D rockchip_dp_link_panel(analogix_dp_get_aux(dp->ad=
p));
> +               if (ret)
> +                       return ret;
> +       }
>
>         return 0;

You can get rid of a few of your return cases by just returning "ret" here.


-Doug
