Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E9A79DA2A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 22:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F39886A4;
	Tue, 12 Sep 2023 20:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECDD10E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 20:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694551001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jmUI45+6EVj+Kwlgk9vFbEhiSU7sjy2egj4BAvZP6Ys=;
 b=J2TEJz/tUHA593A1wZkvCYL/KCPj3KQikvCK1M3lqgezgJOS71FD+iP+PdPxONC54L/aA2
 M7QMA6DcF/TCAcY+fUMG5cF8BCCo+Ezh0rMA6186CqKKT4d47wI8aNWPs9qvt7cxsq+Rpu
 kq5UqMFGEnmJ18GcwocQNt7KXNCDkl4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-kXsiABdBNN-COji00pVuFA-1; Tue, 12 Sep 2023 16:36:39 -0400
X-MC-Unique: kXsiABdBNN-COji00pVuFA-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-267f666104aso220457a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 13:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694550998; x=1695155798;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jmUI45+6EVj+Kwlgk9vFbEhiSU7sjy2egj4BAvZP6Ys=;
 b=ACCKOIqQ85Hi+VpPfZHDlcefp85C4+8IVGDvs9i5d+kF3CJt/4wmt4MzZi8wvP34KN
 OnYX9XyNDS4DubQNdoQOFwBBa43KLB2i0faC/o/DS+/sXuB/K4NH7K28cmov4ezolWHU
 iUDzTWb7Q2KafSMhY6XJHiq7rTEFnb6YXpIulGf3fzYN07gkyu1K/LFZhDAQ/lkJTsvl
 i8nd/UMmHAs6UvUaPuH1Xo5pasO1eRYrY5MLMXSAn1RwFczkxqcrPhoNg7kAsZZkJInN
 Hx+ilD8li5+cu8AzWeYrTlswtZNthc4QsV7wRer9h/qDqz2B0rBt22Cw6etihmOj7o0a
 8l7g==
X-Gm-Message-State: AOJu0YyurYljaGzxqpcuZnJTha8KA60bIJRpOekPhQoMvlxVPfwLi1UD
 TrNCkDnezLvwNz5RSBX6TyyDtlglnXUVJm6M9tgp1lptkBmg8hTQW8kbL4NhBh63ChdOXsXAeoV
 4Dk0u60VRIbaRUw96RV9cCOOt7vvJN68rmkCMxZYxEQji
X-Received: by 2002:a17:90a:cc0e:b0:271:78a0:8ab2 with SMTP id
 b14-20020a17090acc0e00b0027178a08ab2mr4405372pju.24.1694550998149; 
 Tue, 12 Sep 2023 13:36:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmQhaGvp1VhOkGT2XahtSZDgOt2QiYoJ6GOki4JEK6bZNbMlefKB8QCZg/b9mop+4h+DbOKAIaBamVyWjNK/w=
X-Received: by 2002:a17:90a:cc0e:b0:271:78a0:8ab2 with SMTP id
 b14-20020a17090acc0e00b0027178a08ab2mr4405346pju.24.1694550997706; Tue, 12
 Sep 2023 13:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
In-Reply-To: <20230912-simpledrm-multiple-power-domains-v2-1-01b66bfb1980@jannau.net>
From: Eric Curtin <ecurtin@redhat.com>
Date: Tue, 12 Sep 2023 21:36:00 +0100
Message-ID: <CAOgh=Fx-ei8RPDpK5kCQWCgW6epf+fSmNRTkebozDXPNwFx2bA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/simpledrm: Add support for multiple "power-domains"
To: j@jannau.net
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Sept 2023 at 21:30, Janne Grunau via B4 Relay
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

Reviewed-by: Eric Curtin <ecurtin@redhat.com>

Is mise le meas/Regards,

Eric Curtin

> ---
> Changes in v2:
> - removed broken drm_err() log statement only ment for debugging
> - removed commented cast
> - use correct format spcifier for 'int' in log statement
> - add 'continue;' after failure to get device for power_domain
> - use drm_warn() in non fatal error cases
> - removed duplicate PTR_ERR conversion
> - Link to v1: https://lore.kernel.org/r/20230910-simpledrm-multiple-power-domains-v1-1-f8718aefc685@jannau.net
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 105 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>
> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
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
> @@ -468,6 +475,101 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
>  }
>  #endif
>
> +#if defined CONFIG_OF && defined CONFIG_PM_GENERIC_DOMAINS
> +/*
> + * Generic power domain handling code.
> + *
> + * Here we handle the power-domains properties of our "simple-framebuffer"
> + * dt node. This is only necessary if there is more than one power-domain.
> + * A single power-domains is handled automatically by the driver core. Multiple
> + * power-domains have to be handled by drivers since the driver core can't know
> + * the correct power sequencing. Power sequencing is not an issue for simpledrm
> + * since the bootloader has put the power domains already in the correct state.
> + * simpledrm has only to ensure they remain active for its lifetime.
> + *
> + * When the driver unloads, we detach from the power-domains.
> + *
> + * We only complain about errors here, no action is taken as the most likely
> + * error can only happen due to a mismatch between the bootloader which set
> + * up the "simple-framebuffer" dt node, and the PM domain providers in the
> + * device tree. Chances are that there are no adverse effects, and if there are,
> + * a clean teardown of the fb probe will not help us much either. So just
> + * complain and carry on, and hope that the user actually gets a working fb at
> + * the end of things.
> + */
> +static void simpledrm_device_detach_genpd(void *res)
> +{
> +       int i;
> +       struct simpledrm_device *sdev = res;
> +
> +       if (sdev->pwr_dom_count <= 1)
> +               return;
> +
> +       for (i = sdev->pwr_dom_count - 1; i >= 0; i--) {
> +               if (!sdev->pwr_dom_links[i])
> +                       device_link_del(sdev->pwr_dom_links[i]);
> +               if (!IS_ERR_OR_NULL(sdev->pwr_dom_devs[i]))
> +                       dev_pm_domain_detach(sdev->pwr_dom_devs[i], true);
> +       }
> +}
> +
> +static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
> +{
> +       struct device *dev = sdev->dev.dev;
> +       int i;
> +
> +       sdev->pwr_dom_count = of_count_phandle_with_args(dev->of_node, "power-domains",
> +                                                        "#power-domain-cells");
> +       /*
> +        * Single power-domain devices are handled by driver core nothing to do
> +        * here. The same for device nodes without "power-domains" property.
> +        */
> +       if (sdev->pwr_dom_count <= 1)
> +               return 0;
> +
> +       sdev->pwr_dom_devs = devm_kcalloc(dev, sdev->pwr_dom_count,
> +                                              sizeof(*sdev->pwr_dom_devs),
> +                                              GFP_KERNEL);
> +       if (!sdev->pwr_dom_devs)
> +               return -ENOMEM;
> +
> +       sdev->pwr_dom_links = devm_kcalloc(dev, sdev->pwr_dom_count,
> +                                               sizeof(*sdev->pwr_dom_links),
> +                                               GFP_KERNEL);
> +       if (!sdev->pwr_dom_links)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < sdev->pwr_dom_count; i++) {
> +               sdev->pwr_dom_devs[i] = dev_pm_domain_attach_by_id(dev, i);
> +               if (IS_ERR(sdev->pwr_dom_devs[i])) {
> +                       int ret = PTR_ERR(sdev->pwr_dom_devs[i]);
> +                       if (ret == -EPROBE_DEFER) {
> +                               simpledrm_device_detach_genpd(sdev);
> +                               return ret;
> +                       }
> +                       drm_warn(&sdev->dev,
> +                                "pm_domain_attach_by_id(%u) failed: %d\n", i, ret);
> +                       continue;
> +               }
> +
> +               sdev->pwr_dom_links[i] = device_link_add(dev,
> +                                                        sdev->pwr_dom_devs[i],
> +                                                        DL_FLAG_STATELESS |
> +                                                        DL_FLAG_PM_RUNTIME |
> +                                                        DL_FLAG_RPM_ACTIVE);
> +               if (!sdev->pwr_dom_links[i])
> +                       drm_warn(&sdev->dev, "failed to link power-domain %d\n", i);
> +       }
> +
> +       return devm_add_action_or_reset(dev, simpledrm_device_detach_genpd, sdev);
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
> @@ -651,6 +753,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
>         if (ret)
>                 return ERR_PTR(ret);
>         ret = simpledrm_device_init_regulators(sdev);
> +       if (ret)
> +               return ERR_PTR(ret);
> +       ret = simpledrm_device_attach_genpd(sdev);
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

