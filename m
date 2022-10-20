Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 687E7606869
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 20:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7B910E106;
	Thu, 20 Oct 2022 18:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3377110E106
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 18:50:12 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id x13so519317qkg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 11:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KR3+5kKvHDC9BOMnROlxG5MOfJS2Lys60n7JFJ+BFo8=;
 b=mhBsn6E6rtdaqvrsjBCKkElm6NPFr/Nvs9Ej/o3pCKoTTluJNxHO0gwQcnhLQJa5dy
 cYND0YLoo4DXoAiDK6EtFvlf0uaGxw1ki2i4KGkeacWtx67VX0xrRNVVOG6r+mU66lcu
 bfTfd5JahyoitdHLGh5fUDzbSCrtEnFDjGosp/3hmQUl1kRUsAQiJhZj9Io8idCfaAeQ
 SOns5amLoac6fOcfncpHy4p5wFyyGdbNb+46tGNwto6WD0v2skFyq5ahVz8au9S2QOju
 DE2OjLqhPBS1f92bSdS/q1u6WAlKJX+HHkVDCES280ySAHAb6sGkCIn4lYYwaMrEGspu
 Cb9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KR3+5kKvHDC9BOMnROlxG5MOfJS2Lys60n7JFJ+BFo8=;
 b=8FOVj/n+wDENLQ2nfmdNPahxp4wHYYwR/tLo2fo7d8Vcjs9Nn/NeJ6O/Y1t5mnUr6D
 zxlyPzJe3sDs3CnBZJku/8S4iQPKmI5eS2FlDODTcrHm22OB01YTsGrlzUVL0z7VMA38
 jQO1gRIeuTPEgt9NQ+NuxW3GMzF8ltmxQtZLb7KftqphbDXDKNFWHvQTUIhZK2VTa8E0
 us8hkUlphsoJ+zDxhmcR2ncfvgM8J0NIpAr8Y9NrvP7xFC8MIQ+V4EF+R1LTTKm1SqDs
 ETwVOYp8NK6gZJEKycM9ZAiZhX3nVd2uSRxN7Cn6+mfL5XluSKCeYtNxa58yWgA8oZlm
 9MMA==
X-Gm-Message-State: ACrzQf3PCjdV7NNSMixR8DBpPCYOgkbdkV6E7Jf6jjmINbgSzvC3Fxjy
 r1UQ0rQBEMDIzDao9sQsPfTvkycjtVzdhqJxYvI=
X-Google-Smtp-Source: AMsMyM5HzpiqT5Zi4u1f+qSsbgkOcKt56VuNKFX0yb70xpsBLz+QgXKuu0JrIpEffdsFSqFg9t+I9b+P1Xyy9ePidoE=
X-Received: by 2002:a05:620a:d58:b0:6df:ba25:4f5e with SMTP id
 o24-20020a05620a0d5800b006dfba254f5emr10589902qkl.320.1666291810707; Thu, 20
 Oct 2022 11:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
In-Reply-To: <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Oct 2022 21:49:34 +0300
Message-ID: <CAHp75VeLbZ6AWf5yyxc+QyzOOqmBd0jdyJ1m=eiQpep5wuEmoA@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 8:57 PM Maciej Kwapulinski
<maciej.kwapulinski@linux.intel.com> wrote:
>
> Add a new PCI driver for Intel(R) Gaussian & Neural Accelerator
> with basic support like module loading and unloading. The full
> function of the driver will be added by further changes.

...

> +GNA_GEM_NEW acquires new 4KB page aligned memory region ready for DMA op=
erations.

a new

...

> +GNA Library can allocate any number of memory regions for GNA usage. Its=
 number and total
> +capacity are limited by the OSs=E2=80=99 resources. Due to GNA MMU restr=
ictions, even when using

OSes' ?

> +multiple memory regions, the sum of all the memory regions used within a=
 single inference
> +request must be no larger than 256MB.

...

> +++ b/drivers/gpu/drm/Kconfig
> @@ -403,6 +403,8 @@ source "drivers/gpu/drm/solomon/Kconfig"
>
>  source "drivers/gpu/drm/sprd/Kconfig"
>
> +source "drivers/gpu/drm/gna/Kconfig"

It looks to me that you broke the order here.

...

> @@ -147,3 +147,4 @@ obj-y                       +=3D gud/
>  obj-$(CONFIG_DRM_HYPERV) +=3D hyperv/
>  obj-y                  +=3D solomon/
>  obj-$(CONFIG_DRM_SPRD) +=3D sprd/
> +obj-$(CONFIG_DRM_GNA) +=3D gna/

Ditto.

...

> +config DRM_GNA
> +       tristate "Intel(R) Gaussian & Neural Accelerator (Intel(R) GNA)"
> +       depends on X86 && PCI

No compile test for the rest of possible options?

--=20
With Best Regards,
Andy Shevchenko
