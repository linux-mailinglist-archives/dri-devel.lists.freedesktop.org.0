	by mail.lfdr.de (Postfix) with ESMTPS id B891D98C732
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 23:03:58 +0200 (CEST)
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D0210E130;
	Tue,  1 Oct 2024 21:03:57 +0000 (UTC)
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="pFYZYWl/";
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4792510E130
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2024 21:03:56 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-45b4e638a9aso29361cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2024 14:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727816635; x=1728421435;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yL5+DFCKVXpdvIU7o9JTei5eaaMJNukFkXpSxhCohs=;
 b=pFYZYWl/ukItVNL7HAlF+L80k54abpJ0/3DBb0/JwiKJ6esepMU+oxpo/8pUVCreGe
 MBYzRC9rGPDntNibvAjfli+t+GzBSSOxzyI/kj5XQzLr1ZLJdjXte7bhwrIe14Dhh+HM
 ZM20+DcJGevzicxz8tEZxiC25tHlBv2b5paxaYEPox/vqV7gahiAgzjUoBzi5rsBogCW
 1a6oiwT/MXxa/o1gYcxYmvNhwYtFK/gVRJ6mFvlr+DOwub8EogZz9n6p8mwmZvjfZtvu
 tsYjTgsTYmNNCNG2yKQZ6f0qP2RV+MB7/sBgnBKHut4jyLsbNebETB+wsg13aOcsuGsX
 bQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727816635; x=1728421435;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0yL5+DFCKVXpdvIU7o9JTei5eaaMJNukFkXpSxhCohs=;
 b=isDdorQzXwJxjSy4x9toy9koec7mhCRwHfAijtbpiAXt77YaWlig0uD7Tn0bzDrjHZ
 /pTJDl1Wr6gPsTS2ObxBPvLF2mSEh9ydi4JFztq/8LdxrKel8t2Z0FQsWVIs/5sBS0el
 s0cLfzTpfRzBkTnV42zxOqb3J6W0czXMB3jrXV5CcIYZxWjDtqNGBxQAb+mvCrquRP0G
 Ka+bT29vrz3xpgWHjHEOQjcMYuX+vJ/dM9EB2oZadZzYM9DzVwChf7Ytz/1bsSOv35BP
 +MD3Ie8SGqybNhx1Vceal7u2xSbFgJ4JDXJDsdaoXzscxnpj2fcG7W42Um999ma+iHJ4
 4SzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+m69C3kLixxKp53A2h6RCDFvD3Zu9lXzfbVnyQ9+y7bgra2WeOlOswA8nEYj138p6/YEFWs4IKb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9zUzIQRnlM2OegWu/BbFD6n+fkdqIzsBNaR3YDf3JR/SdLWFe
 rNSM8+jtFX8apBvfnmJVFL4EqCm5ctGozkvGhbL9W0ruqR8jdYKIFp8QBTdS6JArTj6nUvVko1p
 ttJ9VkgJi/MiVN3gnMjdEx5mz6SqIxAe/pjfV
X-Google-Smtp-Source: AGHT+IGSw23X0VtbGJrp3RuM+W4ZEUK3ccsVBPcc338djiZUFHRx6Ws10QSWrDK7baFgiaNhONZcnQB5Uj1bMNXMTXU=
X-Received: by 2002:ac8:628f:0:b0:458:142b:ee66 with SMTP id
 d75a77b69052e-45d8170a18cmr1046281cf.2.1727816634742; Tue, 01 Oct 2024
 14:03:54 -0700 (PDT)
References: <20240930144057.453751-1-mripard@kernel.org>
In-Reply-To: <20240930144057.453751-1-mripard@kernel.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 1 Oct 2024 23:03:41 +0200
Message-ID: <CABdmKX3=h57Jcphiq2Ekseg=j_ay8frmFgyHKWb04b4J5f2T5w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: dma-buf: heaps: Add heap name definitions
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
On Mon, Sep 30, 2024 at 4:41=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Following a recent discussion at last Plumbers, John Stultz, Sumit
> Sewal, TJ Mercier and I came to an agreement that we should document
> what the dma-buf heaps names are expected to be, and what the buffers
> attributes you'll get should be documented.
>
> Let's create that doc to make sure those attributes and names are
> guaranteed going forward.
Hey, thanks for sending this!
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> ---
>
> To: Jonathan Corbet <corbet@lwn.net>
> To: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Cc: Brian Starkey <Brian.Starkey@arm.com>
> Cc: John Stultz <jstultz@google.com>
> Cc: "T.J. Mercier" <tjmercier@google.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 71 +++++++++++++++++++
>  Documentation/userspace-api/index.rst         |  1 +
>  2 files changed, 72 insertions(+)
>  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> new file mode 100644
> index 000000000000..00436227b542
> --- /dev/null
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -0,0 +1,71 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +Allocating dma-buf using heaps
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +Dma-buf Heaps are a way for userspace to allocate dma-buf objects. They =
are
> +typically used to allocate buffers from a specific allocation pool, or t=
o share
> +buffers across frameworks.
> +
> +Heaps
> +=3D=3D=3D=3D=3D
> +
> +A heap represent a specific allocator. The Linux kernel currently suppor=
ts the
"represents"

> +following heaps:
> +
> + - The ``system`` heap allocates virtually contiguous, cacheable, buffer=
s

Virtually contiguous sounds a little weird to me here. Sure, that's
what userspace will get when it maps the buffer (and I guess this *is*
UAPI documentation after all), but I'm not sure it's correct to say
that's a property of the buffer itself? What if we invert this and
instead say that there is NO guarantee that the memory for the buffer:
 - is physically contiguous
 - has any particular alignment (greater than page aligned)
 - has any particular page size (large order allocations are attempted
first, but not guaranteed or even likely on some systems)
 - has bounds on physical addresses

Maybe that is too much detail here...

> +
> + - The ``reserved`` heap allocates physically contiguous, cacheable, buf=
fers.
> +   Depending on the platform, it might be called differently:
> +
> +    - Acer Iconia Tab A500: ``linux,cma``
> +    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``
> +    - Amlogic A1: ``linux,cma``
> +    - Amlogic G12A/G12B/SM1: ``linux,cma``
> +    - Amlogic GXBB/GXL: ``linux,cma``
> +    - ASUS EeePad Transformer TF101: ``linux,cma``
> +    - ASUS Google Nexus 7 (Project Bach / ME370TG) E1565: ``linux,cma``
> +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) E1565: ``linux,cma``
> +    - ASUS Google Nexus 7 (Project Nakasi / ME370T) PM269: ``linux,cma``
> +    - Asus Transformer Infinity TF700T: ``linux,cma``
> +    - Asus Transformer Pad 3G TF300TG: ``linux,cma``
> +    - Asus Transformer Pad TF300T: ``linux,cma``
> +    - Asus Transformer Pad TF701T: ``linux,cma``
> +    - Asus Transformer Prime TF201: ``linux,cma``
> +    - ASUS Vivobook S 15: ``linux,cma``
> +    - Cadence KC705: ``linux,cma``
> +    - Digi International ConnectCore 6UL: ``linux,cma``
> +    - Freescale i.MX8DXL EVK: ``linux,cma``
> +    - Freescale TQMa8Xx: ``linux,cma``
> +    - Hisilicon Hikey: ``linux,cma``
> +    - Lenovo ThinkPad T14s Gen 6: ``linux,cma``
> +    - Lenovo ThinkPad X13s: ``linux,cma``
> +    - Lenovo Yoga Slim 7x: ``linux,cma``
> +    - LG Optimus 4X HD P880: ``linux,cma``
> +    - LG Optimus Vu P895: ``linux,cma``
> +    - Loongson 2k0500, 2k1000 and 2k2000: ``linux,cma``
> +    - Microsoft Romulus: ``linux,cma``
> +    - NXP i.MX8ULP EVK: ``linux,cma``
> +    - NXP i.MX93 9x9 QSB: ``linux,cma``
> +    - NXP i.MX93 11X11 EVK: ``linux,cma``
> +    - NXP i.MX93 14X14 EVK: ``linux,cma``
> +    - NXP i.MX95 19X19 EVK: ``linux,cma``
> +    - Ouya Game Console: ``linux,cma``
> +    - Pegatron Chagall: ``linux,cma``
> +    - PHYTEC phyCORE-AM62A SOM: ``linux,cma``
> +    - PHYTEC phyCORE-i.MX93 SOM: ``linux,cma``
> +    - Qualcomm SC8280XP CRD: ``linux,cma``
> +    - Qualcomm X1E80100 CRD: ``linux,cma``
> +    - Qualcomm X1E80100 QCP: ``linux,cma``
> +    - RaspberryPi: ``linux,cma``
> +    - Texas Instruments AM62x SK board family: ``linux,cma``
> +    - Texas Instruments AM62A7 SK: ``linux,cma``
> +    - Toradex Apalis iMX8: ``linux,cma``
> +    - TQ-Systems i.MX8MM TQMa8MxML: ``linux,cma``
> +    - TQ-Systems i.MX8MN TQMa8MxNL: ``linux,cma``
> +    - TQ-Systems i.MX8MPlus TQMa8MPxL: ``linux,cma``
> +    - TQ-Systems i.MX8MQ TQMa8MQ: ``linux,cma``
> +    - TQ-Systems i.MX93 TQMa93xxLA/TQMa93xxCA SOM: ``linux,cma``
> +    - TQ-Systems MBA6ULx Baseboard: ``linux,cma``
> +

This part LGTM. Might be worth it to document that a CMA region must
be specified on the kernel command line. Otherwise this heap won't
show up at runtime by only enabling the kernel configs necessary to
build it.

> diff --git a/Documentation/userspace-api/index.rst b/Documentation/usersp=
ace-api/index.rst
> index 274cc7546efc..4901ce7c6cb7 100644
> --- a/Documentation/userspace-api/index.rst
> +++ b/Documentation/userspace-api/index.rst
> @@ -41,10 +41,11 @@ Devices and I/O
>
>  .. toctree::
>     :maxdepth: 1
>
>     accelerators/ocxl
> +   dma-buf-heaps
>     dma-buf-alloc-exchange
>     gpio/index
>     iommufd
>     media/index
>     dcdbas
> --
> 2.46.1
>