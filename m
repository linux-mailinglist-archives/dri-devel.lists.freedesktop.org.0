Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 079107A421C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 09:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C491310E1EC;
	Mon, 18 Sep 2023 07:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6BD10E00E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 22:47:36 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-52f3ba561d9so717576a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 15:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694558855; x=1695163655;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JPQmiOiJEVpUypTzrtCNWvG84b8X0egdVXAFfU36T2Y=;
 b=ks9fomWhxxiNmzFy81fCWOC+fvX8ED9itd13h27gpkg93HgnBKioaoJhDsAdlfyGTu
 HuztKGvYDf23eJe8hdXm01byjkT5fXyEk4y7NAdX4Q2wfUE+JEAOgAov79Co9SD5GhuQ
 ThzUat4TdUCEm4nzq28z3yqVQ7usGkhJTwg68B6DBzPuazEHi5EIw+EghDQmO+v49M4H
 6xLAmDRfV6ANUQC3YBBgU/o7rUI0c/NkMadxFPsiH+zIL4q9ZXwVmyBxNl0YtU/hLum1
 QqM5bob6HRRQPkFAlB/L0njw/a39xVtxdaOOpDcgcN0DywfZy5D3LeaaUf79G6OoolJM
 H0SA==
X-Gm-Message-State: AOJu0Yx+g4LYeXPEd40Hst9FbHZHie4XY1UU52OH/ZsXJ27dyVpDaFmG
 e34e4qYVleLySGKDQ5wP0dZYZeXy/aDcROux
X-Google-Smtp-Source: AGHT+IEquYcTZoRNV3AV8QqOwWG8GIZ4Tu7CJBpuqzbKRp7Cwdz7qavdrvegQjn0faY2jpfg0dfHbg==
X-Received: by 2002:a05:6402:11d2:b0:525:4696:336d with SMTP id
 j18-20020a05640211d200b005254696336dmr6049754edw.8.1694558854603; 
 Tue, 12 Sep 2023 15:47:34 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com.
 [209.85.218.46]) by smtp.gmail.com with ESMTPSA id
 v21-20020a056402185500b0052a3edff5c3sm6508362edy.87.2023.09.12.15.47.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Sep 2023 15:47:34 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-9a9d6b98845so74728066b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 15:47:33 -0700 (PDT)
X-Received: by 2002:a17:907:96a4:b0:9a5:c38d:6b75 with SMTP id
 hd36-20020a17090796a400b009a5c38d6b75mr5511540ejc.15.1694558853578; Tue, 12
 Sep 2023 15:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
In-Reply-To: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 12 Sep 2023 18:46:56 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8i4P8r-5EUikS=6wy5_3OvufeLzfLWkB+SgMq-nkpArA@mail.gmail.com>
Message-ID: <CAEg-Je8i4P8r-5EUikS=6wy5_3OvufeLzfLWkB+SgMq-nkpArA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/simpledrm: Add support for multiple "power-domains"
To: j@jannau.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Sep 2023 07:16:21 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 4:22=E2=80=AFPM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> Multiple power domains need to be handled explicitly in each driver. The
> driver core can not handle it automatically since it is not aware of
> power sequencing requirements the hardware might have. This is not a
> problem for simpledrm since everything is expected to be powered on by
> the bootloader. simpledrm has just ensure it remains powered on during
> its lifetime.
> This is required on Apple silicon M2 and M2 Pro/Max/Ultra desktop
> systems. The HDMI output initialized by the bootloader requires keeping
> the display controller and a DP phy power domain on.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - removed broken drm_err() log statement only ment for debugging
> - removed commented cast
> - use correct format spcifier for 'int' in log statement
> - add 'continue;' after failure to get device for power_domain
> - use drm_warn() in non fatal error cases
> - removed duplicate PTR_ERR conversion
> - Link to v1: https://lore.kernel.org/r/20230910-simpledrm-multiple-power=
-domains-v1-1-f8718aefc685@jannau.net
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 105 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simp=
ledrm.c
> index ff86ba1ae1b8..9c597461d1e2 100644
> --- a/drivers/gpu/drm/tiny/simpledrm.c
> +++ b/drivers/gpu/drm/tiny/simpledrm.c
> @@ -6,6 +6,7 @@
>  #include <linux/of_address.h>
>  #include <linux/platform_data/simplefb.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/regulator/consumer.h>
>
>  #include <drm/drm_aperture.h>
> @@ -227,6 +228,12 @@ struct simpledrm_device {
>         unsigned int regulator_count;
>         struct regulator **regulators;
>  #endif
> +       /* power-domains */
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +       int pwr_dom_count;
> +       struct device **pwr_dom_devs;
> +       struct device_link **pwr_dom_links;
> +#endif
>
>         /* simplefb settings */
>         struct drm_display_mode mode;
> @@ -468,6 +475,101 @@ static int simpledrm_device_init_regulators(struct =
simpledrm_device *sdev)
>  }
>  #endif
>
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +/*
> + * Generic power domain handling code.
> + *
> + * Here we handle the power-domains properties of our "simple-framebuffe=
r"
> + * dt node. This is only necessary if there is more than one power-domai=
n.
> + * A single power-domains is handled automatically by the driver core. M=
ultiple
> + * power-domains have to be handled by drivers since the driver core can=
't know
> + * the correct power sequencing. Power sequencing is not an issue for si=
mpledrm
> + * since the bootloader has put the power domains already in the correct=
 state.
> + * simpledrm has only to ensure they remain active for its lifetime.
> + *
> + * When the driver unloads, we detach from the power-domains.
> + *
> + * We only complain about errors here, no action is taken as the most li=
kely
> + * error can only happen due to a mismatch between the bootloader which =
set
> + * up the "simple-framebuffer" dt node, and the PM domain providers in t=
he
> + * device tree. Chances are that there are no adverse effects, and if th=
ere are,
> + * a clean teardown of the fb probe will not help us much either. So jus=
t
> + * complain and carry on, and hope that the user actually gets a working=
 fb at
> + * the end of things.
> + */
> +static void simpledrm_device_detach_genpd(void *res)
> +{
> +       int i;
> +       struct simpledrm_device *sdev =3D res;
> +
> +       if (sdev->pwr_dom_count <=3D 1)
> +               return;
> +
> +       for (i =3D sdev->pwr_dom_count - 1; i >=3D 0; i--) {
> +               if (!sdev->pwr_dom_links[i])
> +                       device_link_del(sdev->pwr_dom_links[i]);
> +               if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
> +                       dev_pm_domain_detach(sdev->pwr_dom_devs[i], true)=
;
> +       }
> +}
> +
> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
> +{
> +       struct device *dev =3D sdev->dev.dev;
> +       int i;
> +
> +       sdev->pwr_dom_count =3D of_count_phandle_with_args(dev->of_node, =
"power-domains",
> +                                                        "#power-domain-c=
ells");
> +       /*
> +        * Single power-domain devices are handled by driver core nothing=
 to do
> +        * here. The same for device nodes without "power-domains" proper=
ty.
> +        */
> +       if (sdev->pwr_dom_count <=3D 1)
> +               return 0;
> +
> +       sdev->pwr_dom_devs =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> +                                              sizeof(*sdev->pwr_dom_devs=
),
> +                                              GFP_KERNEL);
> +       if (!sdev->pwr_dom_devs)
> +               return -ENOMEM;
> +
> +       sdev->pwr_dom_links =3D devm_kcalloc(dev, sdev->pwr_dom_count,
> +                                               sizeof(*sdev->pwr_dom_lin=
ks),
> +                                               GFP_KERNEL);
> +       if (!sdev->pwr_dom_links)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < sdev->pwr_dom_count; i++) {
> +               sdev->pwr_dom_devs[i] =3D dev_pm_domain_attach_by_id(dev,=
 i);
> +               if (IS_ERR(sdev->pwr_dom_devs[i])) {
> +                       int ret =3D PTR_ERR(sdev->pwr_dom_devs[i]);
> +                       if (ret =3D=3D -EPROBE_DEFER) {
> +                               simpledrm_device_detach_genpd(sdev);
> +                               return ret;
> +                       }
> +                       drm_warn(&sdev->dev,
> +                                "pm_domain_attach_by_id(%u) failed: %d\n=
", i, ret);
> +                       continue;
> +               }
> +
> +               sdev->pwr_dom_links[i] =3D device_link_add(dev,
> +                                                        sdev->pwr_dom_de=
vs[i],
> +                                                        DL_FLAG_STATELES=
S |
> +                                                        DL_FLAG_PM_RUNTI=
ME |
> +                                                        DL_FLAG_RPM_ACTI=
VE);
> +               if (!sdev->pwr_dom_links[i])
> +                       drm_warn(&sdev->dev, "failed to link power-domain=
 %d\n", i);
> +       }
> +
> +       return devm_add_action_or_reset(dev, simpledrm_device_detach_genp=
d, sdev);
> +}
> +#else
> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
> +{
> +       return 0;
> +}
> +#endif
> +
>  /*
>   * Modesetting
>   */
> @@ -651,6 +753,9 @@ static struct simpledrm_device *simpledrm_device_crea=
te(struct drm_driver *drv,
>         if (ret)
>                 return ERR_PTR(ret);
>         ret =3D simpledrm_device_init_regulators(sdev);
> +       if (ret)
> +               return ERR_PTR(ret);
> +       ret =3D simpledrm_device_attach_genpd(sdev);
>         if (ret)
>                 return ERR_PTR(ret);
>
>
> ---
> base-commit: 15d30b46573d75f5cb58cfacded8ebab9c76a2b0
> change-id: 20230910-simpledrm-multiple-power-domains-f41efa6ad9bc
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
