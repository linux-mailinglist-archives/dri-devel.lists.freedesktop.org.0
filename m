Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2929FFF85
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 20:44:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1844310E77F;
	Thu,  2 Jan 2025 19:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GEpshzUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC5610E308
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 13:02:00 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-aa6c0dbce1fso1543682566b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jan 2025 05:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735822859; x=1736427659; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXS24HNk/PcPkWyO7/S1209SrdCqek8Xs180xOiisVo=;
 b=GEpshzUUdl/nDibtdTI/9Xpmoxh+yR2nllpvqyiaOAqAiI67E/dttS1XGqNz7ksSY8
 vJvCOvTTeG+eDBr2FWrRTx8qILGynjZG2dT+ztOutkI4qWMr1UhFlK7yokhTP5cdPp66
 vhn+5h1ffFkPSckNe1vfr2pWRSBvxKw+8rOngF1O6xtVrUAtty0TFdTcMmUfOPE2o/2z
 0mbPWVtuQUh2sd46YCu/ZqItFi2+jpJRfYUCxKrY+6Y6XGpifiQl7NRuoW7AlZBngzdF
 doVtlj1SvmFW5L94KALIMPwGMTCl8YpNTNvjCBQGSQ5IrpODJK9qYSE5dN8Rzs2D8MZB
 IdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735822859; x=1736427659;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXS24HNk/PcPkWyO7/S1209SrdCqek8Xs180xOiisVo=;
 b=ZlnC56xouLd1l95mv69H8abmJpOq7VbJ9lyL2RMlWVoFlHt5ZtHqmJ1+1lQ8hHkh2X
 p6q0nU6YmFU5gvERt6H7TvYziwU+laQc/F2NgmpOfBRJeZNfIK3bJ/p82TYKdcbAMrfn
 IDDP91p+Uud4l32Ap5BmhIR2oUxyDMaoSCqA67NZgfgL3dXfy1WlRlzCCMgHhxqcVa7K
 ALB/4CSfrziBdhmnkBTAQNwSs7+S0X0xjJcSBpSajYAI+c9IMymdv/loLiz0mimpxPXT
 rtoPKnWvVM9SgvxdY9wnIi4cuxTjuuvl3RmSwTpKyYlazKxdtpode8EMOcyvlRYboWSH
 UYdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv4w8MebdAHXWov9/fn9SJ1r7aDsdrv6bkdo+0yWUauv/oZJmgzqHo/agRl6hOJD9tFUDwXnbmQDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4RWWBmNRIgVfedwx5R6XKuPQwOqdp5JWnQ9dTznmO6O+LzTtE
 yOj+Ti1tBmW11Cj/Cpl1xjaeIc8VCj1/HxJbJ6LbKIaSzPB/CKdO8HvKa/c8V7D05XUoc4k0XvJ
 nqJpe9pR1AZWNp4DikSnC0c1s4Gw8/dQpRs+IAg==
X-Gm-Gg: ASbGncskTbkXDAWiyOsy7E4gpW8065qHcCzFay+7oXcq/gb0wGPT/V3UmAZFVjX84qp
 5evi/akvjFMPU86BgBX5wza1EN06YEJ9LWd8WWA==
X-Google-Smtp-Source: AGHT+IGLvuXj+dIrqlUzp0aOb3Z7mz1qVwkY++yurih/6Pd33sBtFEvkwwttWiJ3Nh2EseGJDAQCU7eALZPBZTPzrLo=
X-Received: by 2002:a05:6402:2802:b0:5d3:cff5:635e with SMTP id
 4fb4d7f45d1cf-5d81de065b8mr107382476a12.26.1735822529291; Thu, 02 Jan 2025
 04:55:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1735550269.git.zhoubinbin@loongson.cn>
 <4d62076ee560b35c653a9fbced8d03ef3bdb3005.1735550269.git.zhoubinbin@loongson.cn>
 <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de>
In-Reply-To: <3daaaff8-062a-4985-a5bc-8d228314b02e@suse.de>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 2 Jan 2025 20:55:17 +0800
Message-ID: <CAMpQs4JcuRhpOyXHxy0ab+D-Wd0itKdb0GiZdTE59_qEpUfyLA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] drm/ls2kbmc: Add support for Loongson-2K BMC
 display
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>,
 Lee Jones <lee@kernel.org>, Corey Minyard <minyard@acm.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Huacai Chen <chenhuacai@kernel.org>, 
 linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 dri-devel@lists.freedesktop.org, Xuerui Wang <kernel@xen0n.name>, 
 loongarch@lists.linux.dev, Chong Qiao <qiaochong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 02 Jan 2025 19:43:55 +0000
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

Hi Thomas:

Thanks for your reply.

On Thu, Jan 2, 2025 at 5:07=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
>
> Am 30.12.24 um 10:31 schrieb Binbin Zhou:
> [...]
> > +
> > +static struct platform_driver ls2kbmc_platform_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "ls2kbmc-framebuffer",
>
> The driver is mostly a copy of simpledrm. Why don't you use
> "simple-framebuffer" for your device name? You could use simpledrm
> directly then.

Ah, indeed, the driver is based on simpledrm.

Initially, I also tried to use simpledrm directly, but it will fail in
drm memory acquire.
Because although we register the driver in platform form, its memory
belongs to pci space and we can see the corresponding pci probe and
resource allocation in Patch-1.
Therefore, we need to use aperture_remove_conflicting_pci_devices().

Also, since we are using BMC display, the display will be disconnected
when BMC reset, at this time we need to push the display data (crtc,
connector, etc.) manually as shown in Patch-4.

Probably it's not the most suitable way to implement it.

>
> Best regards
> Thomas
>
> > +     },
> > +     .probe =3D ls2kbmc_probe,
> > +     .remove =3D ls2kbmc_remove,
> > +};
> > +
> > +module_platform_driver(ls2kbmc_platform_driver);
> > +
> > +MODULE_DESCRIPTION("DRM driver for Loongson-2K BMC");
> > +MODULE_LICENSE("GPL");
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>


--=20
Thanks.
Binbin
