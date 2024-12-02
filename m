Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2843C9E0BC3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 20:12:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3D310E818;
	Mon,  2 Dec 2024 19:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="CIt96mwv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6417C10E80C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 19:12:37 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-53de5ec22adso5802741e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 11:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733166755; x=1733771555;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y5P0+db7NElW+RfhzCk/WkVDLZpj6atKSAhLo042qRI=;
 b=CIt96mwv1YUfU17OBv0MAq8gMMsndqeL8XLHstQDeOGvy4pZUZo1NhK66HChZ9mNXK
 2V/9Eq0iEwMfKQwMlNwhmFVhKmfJVsTEEZC9uQmS/3pkXd8+15LkF85KbDXBPrrAec2O
 nwbSorXoZWPU9oDkJYfI3stXNQJERBGEWkGWXFyFJvg2kq+cewt9Ax8EeSmg+/zGgEU2
 7n0FWp9gdBieoUF0RJCAc5veGStg9luSagJ6AnVg4sqgMorSK6sh3phmObSAMijsV2kV
 BwsRmvVOs2tVAnzZ+cSWKW1J05zs3zJ+Sh1lLWBHWSUBzU26s+906BYIP+MYK/+cW5HY
 hrUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733166755; x=1733771555;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y5P0+db7NElW+RfhzCk/WkVDLZpj6atKSAhLo042qRI=;
 b=N8gid1uHuERVnmdOAL+/xbbPk7rJkdfwSb58pET4KEoTanuZt8MXtq+Qr3nIiM/vVJ
 8lfMEXCC86QHQ72TnWDVJxU2WBIv0eFXN5mmiE8+RNh1ZrMVhUl2jkcRlb6s8lSG6BZu
 57dDmAjzGXd5AEw4AVUtjNpn5fsrj7zm7J+mfcAvk1wNVQjtl/8dxBJ0b1GjljFSxvLj
 0qZKq+QDh4+NS0kWeRJHg3eTz2frVM3lC9FzmBiB6E0xfYOzufT3lw67HDZiYkdT9YjP
 YFuwzOJHVI6r1+KKqyu5p5vsdwfrP6hPuteQyGZrjHF1LE+119TRXwOYEurRQRIU1Nir
 NfhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDrVHxtI+9zB2kkNBu+Po4KHv46ISI5VmYk0m3NfDPfGWkpc9Pb0tryIAKqhSeu07+2wtzAcU9tXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxlx6XE7E13C+xXuf2mTbw7v9+B8XptT0P4W3yilyxaxoiRwG44
 zUisM5oHhaH3pZkhAN3LhiE+uj3MW2IU1bhKGalwPyRntDik6l+jwn7vw1ZzmIOBbzTAO8s4/j3
 xpbDncTQIARoQrRXxK/9AvfzX2ouJNt7kpS8=
X-Gm-Gg: ASbGncsVAWSyXsGLwz1ILy9ZFUoFB2SLC5w+W2MkYE46ufn+ziC1IdZVWyhDWa6DluM
 OXt3tEsUcSB2UL2DARSgDnw9IxUm5Q6pbOWVxmPxaAqtiLkyUmUHKVa1c2AHP
X-Google-Smtp-Source: AGHT+IHZfCjhITQ3qERmJbAY1aREzd4BIcVZPSiVSRGk4ymF9wRxc0gWXYA3+kYFBl8DXbtnZqYMib0piYz7PcngqQY=
X-Received: by 2002:a19:8c4e:0:b0:53d:f177:51d1 with SMTP id
 2adb3069b0e04-53df17752b3mr9327407e87.13.1733166755293; Mon, 02 Dec 2024
 11:12:35 -0800 (PST)
MIME-Version: 1.0
References: <20241202115827.50388-1-mripard@kernel.org>
In-Reply-To: <20241202115827.50388-1-mripard@kernel.org>
From: John Stultz <jstultz@google.com>
Date: Mon, 2 Dec 2024 11:12:23 -0800
Message-ID: <CANDhNCpTnc6=YkjQgQngRCw1_xLWgOFrcjTxrrGX+bRhvGb5DQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: dma-buf: heaps: Add heap name
 definitions
To: Maxime Ripard <mripard@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-media@vger.kernel.org, linux-doc@vger.kernel.org
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

On Mon, Dec 2, 2024 at 3:58=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> Following a recent discussion at last Plumbers, John Stultz, Sumit
> Sewal, TJ Mercier and I came to an agreement that we should document
> what the dma-buf heaps names are expected to be, and what the buffers
> attributes you'll get should be documented.
>
> Let's create that doc to make sure those attributes and names are
> guaranteed going forward.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>
> ---
> Changes from v1:
>   - Add the mention that the cma / reserved heap is optional.
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
>  Documentation/userspace-api/dma-buf-heaps.rst | 76 +++++++++++++++++++
>  Documentation/userspace-api/index.rst         |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 Documentation/userspace-api/dma-buf-heaps.rst
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> new file mode 100644
> index 000000000000..68be7ddea150
> --- /dev/null
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -0,0 +1,76 @@
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
> +following heaps:
> +
> + - The ``system`` heap allocates virtually contiguous, cacheable, buffer=
s
> +
> + - The ``reserved`` heap allocates physically contiguous, cacheable,

So, I think calling the heap name the "cma" heap might be clearer here?
On some platforms the chardev is "reserved" because the default cma
region is setup via dma_contiguous_reserve_area() (which calls it
"reserved"), but the dma heap is exporting cma.

Additionally, on some downstream devices there can be multiple purpose
separated CMA heaps. This hasn't made it upstream over objections to
how downstream devices were enumerating the separate cma regions in
their devicetrees. It was proposed to export all cma regions as
separate cma heaps, but there was reasonable concern over kernel
drivers not expecting userland to be able to allocate from special
reservations, so that seemed like a bad idea.

Ideally upstream drivers would want to explicitly export their special
CMA region themselves and we would export something like
add_cma_heap() to do so.

All to say: this document really only covers the naming of the
"default" CMA region that is exported via the cma heap.  Eventually
there may be other CMA heaps as well upstream.

> +   buffers. Only present if a CMA region is present. Such a region is
> +   usually created either through the kernel commandline through the
> +   `cma` parameter, a memory region Device-Tree node with the
> +   `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
> +   `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
> +   might be called differently:
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
>

Hrm. I'm not sure I see the value in enumerating things in this way,
it seems like it will be a nuisance to keep current?  Maybe something
like:

On most systems the default cma region is named "linux, cma" or
"reserved", with a few exceptions:
    - Allwinner sun4i, sun5i and sun7i families: ``default-pool``

thanks
-john
