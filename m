Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92CDACDFDE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 16:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1751510E75E;
	Wed,  4 Jun 2025 14:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sPXHGYb/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CCFE10E757
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 14:08:58 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-e7da099de49so6151520276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749046137; x=1749650937; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bCKMLvfrG58EXYW/q3xMdTa1ro6Bjgf7O9LMZV8k7Fg=;
 b=sPXHGYb/DIqEkH+qCG7rbR4FLbEQJdXOV11z9he2FD04HXY+ZKTsA3R7PWMoHyX5lE
 2gJYQafRC179rHFvZo0/7TMbHzDcUMVX1J9YOG3iAP7RFC4wShoaBjyRb99Z2l4M4nA1
 a85Ik4XZPbWxpvObjdXYjsI70O0DLrVYZkv6OswAqaMeaffXjOaqEvSo0cxPgdHQboz5
 /HgUDoKvhBCAD26H5Yco5SuCwjAg/62jqQtqgkI/S9EvUYz3djMOic26TBPYG5I+U5ka
 sHSVPHtdwcc3WQf/7TmyVT0XUXdKcAla8Pd0z7cte8YtQrl6cIB1pEBXC1RY8PcwmLF5
 2VKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749046137; x=1749650937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bCKMLvfrG58EXYW/q3xMdTa1ro6Bjgf7O9LMZV8k7Fg=;
 b=SfStwyY9uK9Zmdrax0gj9RybB0Y8qZqMplgJqRT4+zGgIc5Fg3bC9r9xFDD4bLZmNr
 SlwkAUOEGo2/ALC6jG3tARd2Q+X/q47CrwZMS1Ua/LSOZqJV58wE0SaXHBNAse5If+yx
 gI1h52TyUu1rQlE+WAdvgXAeuqzfEKE18sxxHA4soTUWUy+zlNIj3B3Czgkfr6glWhO1
 wnG6FAnMWDhX7YfR/ecUWerkv6VvR15xDAs0rAy0QDMjXHSk9lJz1DoCxs1psTt7oK6c
 ImgulKnJRkBsSZsQ+O7XAR+fUUaJSzaSiobFeKD7uOdm+gOOJSJhajQSRsIfp1ag4ZMv
 16Gg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZpLZV0RcUOgZ+pljH+o1wD334CNkbD22QJgAb633aDIxppXK3kX2n4hOIy7r3pfubm17ok35UQVo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwS5mAyqzDShWHcHHfoNMo05l7/JpnITQwRRa/rpASOnbMGuufZ
 wE6oV/gzvKHeq2dL+IjUbFY5rx7GvITzUuZjlGSd6+yg1plCIeM77ec6PEQpZdbL9l0ikCwB6AO
 lric4jyAZyh1JM5UVJcIxVFE4gpazbyr0nEukzeizTw==
X-Gm-Gg: ASbGncuQGjxdzaZUY41JVYYtVyPLE2WRMrf2d8XlQiMZe8Gq07FO3Y87tBKYnZ2IPVD
 4T4Ct65fbCZjnFtEHbk8CIsrZyeA6/ewf5PyoLM9PVtwV8cdQ1DXyBVL8vipIKdt2y4OWbYo1rP
 kGHNKeL5KEbOa/2F8VdnAkGEHW9gqfMYh7+A==
X-Google-Smtp-Source: AGHT+IH1uN9PQBI4TxvQgOMEHLZAQqYAI1FFT1QA2Z54eVoaJJVTZCIulnmyyn43PiYP3CgChRHTn+sbXKdyr+ZK87c=
X-Received: by 2002:a05:6902:2291:b0:e81:8639:c5aa with SMTP id
 3f1490d57ef6-e818639ce67mr1014126276.32.1749046137370; Wed, 04 Jun 2025
 07:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250410-sets-bxs-4-64-patch-v1-v6-0-eda620c5865f@imgtec.com>
 <20250410-sets-bxs-4-64-patch-v1-v6-5-eda620c5865f@imgtec.com>
In-Reply-To: <20250410-sets-bxs-4-64-patch-v1-v6-5-eda620c5865f@imgtec.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Jun 2025 16:08:21 +0200
X-Gm-Features: AX0GCFvzY5vbkEIzVaD80QV5URTGeK5dhN_mN9Qk3_Vhcas3hbWoHL7IT58BST4
Message-ID: <CAPDyKFpKkSb=kGn4y18uFy9uhxFkjt7Gi2bUAzzqGnyUtTAoMg@mail.gmail.com>
Subject: Re: [PATCH v6 05/18] drm/imagination: Add power domain control
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, 
 Darren Etheridge <detheridge@ti.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>, 
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Apr 2025 at 12:12, Matt Coster <matt.coster@imgtec.com> wrote:
>
> The first supported GPU only used a single power domain so this was
> automatically handled by the device runtime.
>
> In order to support multiple power domains, they must be enumerated from
> devicetree and linked to both the GPU device and each other to ensure
> correct power sequencing at start time.
>
> For all Imagination Rogue GPUs, power domains are named "a", "b", etc. and
> the sequence A->B->... is always valid for startup with the reverse true
> for shutdown. Note this is not always the *only* valid sequence, but it's
> simple and does not require special-casing for different GPU power
> topologies.
>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Frank Binns <frank.binns@imgtec.com>

Realize that I am a bit late to this, but I was recently pointed to
this commit [1] by Michal.

[...]

> +
> +int pvr_power_domains_init(struct pvr_device *pvr_dev)
> +{
> +       struct device *dev = from_pvr_device(pvr_dev)->dev;
> +
> +       struct device_link **domain_links __free(kfree) = NULL;
> +       struct device **domain_devs __free(kfree) = NULL;
> +       int domain_count;
> +       int link_count;
> +
> +       char dev_name[2] = "a";

It's certainly good to use a name to be future proof, but we should at
least try to pick a somewhat descriptive name for what this PM domain
is used for.

Moreover, this requires a corresponding update to the DT docs.

> +       int err;
> +       int i;
> +
> +       domain_count = of_count_phandle_with_args(dev->of_node, "power-domains",
> +                                                 "#power-domain-cells");
> +       if (domain_count < 0)
> +               return domain_count;
> +
> +       if (domain_count <= 1)
> +               return 0;
> +
> +       link_count = domain_count + (domain_count - 1);
> +
> +       domain_devs = kcalloc(domain_count, sizeof(*domain_devs), GFP_KERNEL);
> +       if (!domain_devs)
> +               return -ENOMEM;
> +
> +       domain_links = kcalloc(link_count, sizeof(*domain_links), GFP_KERNEL);
> +       if (!domain_links)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < domain_count; i++) {
> +               struct device *domain_dev;
> +
> +               dev_name[0] = 'a' + i;
> +               domain_dev = dev_pm_domain_attach_by_name(dev, dev_name);
> +               if (IS_ERR_OR_NULL(domain_dev)) {
> +                       err = domain_dev ? PTR_ERR(domain_dev) : -ENODEV;
> +                       goto err_detach;
> +               }
> +
> +               domain_devs[i] = domain_dev;
> +       }
> +
> +       for (i = 0; i < domain_count; i++) {
> +               struct device_link *link;
> +
> +               link = device_link_add(dev, domain_devs[i], DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +               if (!link) {
> +                       err = -ENODEV;
> +                       goto err_unlink;
> +               }
> +
> +               domain_links[i] = link;
> +       }
> +
> +       for (i = domain_count; i < link_count; i++) {
> +               struct device_link *link;
> +
> +               link = device_link_add(domain_devs[i - domain_count + 1],
> +                                      domain_devs[i - domain_count],
> +                                      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
> +               if (!link) {
> +                       err = -ENODEV;
> +                       goto err_unlink;
> +               }
> +
> +               domain_links[i] = link;
> +       }

Most of the code above (and the error/remove-path) can be considered
as boiler-plate code and can be replaced by using
devm_pm_domain_attach_list() instead.

[...]

Kind regards
Uffe

[1]
https://lore.kernel.org/all/a68e3bee-f4ad-4d73-a5a8-e39772c41711@samsung.com/
