Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F0B50DDA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 08:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D06810E145;
	Wed, 10 Sep 2025 06:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PqAV+yqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCEA10E145
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 06:10:24 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b0787fdb137so55382666b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 23:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757484622; x=1758089422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIIpzdS8c9OeYQKLWQsdxP00kZekR6xE06hcgvXgJZ8=;
 b=PqAV+yqYO1duRqkWmW1l06s1jGj3k+wcAzqJc7uLa6ZaWU0WVoXPSnGohsjxIDlbdi
 yo2TPGGW9l5xjPLL6rDSpPl9n3r9OcjEfu9niktR1ddnca9BY0fMyW8hA4du2OBBUj2P
 X1Eo4vFsLfAIQ3/Wn3sMrda/Hxa7Tb1iUEOA1/RDi2hbj46AISNDSbCP/Bss10cMAKYu
 ItAkBWRI2qepF0W0uxvuXMFN3e2S02RSg3BYCQ5DJeRF6y7ZAbqLUOscXGAGa8qszZ6b
 zgr4Bdegqrhb7h021tSfvefJf+Z9A/PU1tQhuutJEZp7bDREENdu1VQ9U/61Gexw/g0f
 qXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757484622; x=1758089422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aIIpzdS8c9OeYQKLWQsdxP00kZekR6xE06hcgvXgJZ8=;
 b=PnbSUNvm0EUlX98IOCKoy6ADwasjj8+sI9vZ+0k8hyMPdcxpxEDzY1X4pXnujJh6M+
 BuSI03wQAT/VHLyj4d1kADxanFqlsbKQ7hWbycmWFbGddXPLY+ULJ5phTdSFjda+lnMn
 w58Bs/E2kYxXhxxCPPyhfLiHJ2WsYBpBUmcXQ4gbpOa2TcowTTYmHGsMoT2lyXHA+uBp
 G0vsrzkeiXOdjdCDxD3SG6ty2YJ9A3amNvoYKgpKPTvroK1XI49HXstc3n7dza7Tie7A
 2arNmjxAq7krFTiqbD0IiHfI8aozIEe8/Kuy/brK+oSSZ67hdubAcoLWAsIFg2C23cAJ
 aJJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF7Kzbhy4jWHCVCxErwG3P1BpKFwKEEseWLT9xtbVy8XnIGCtbq5RBdxP22PyoKUCm76lJ3XOQhJ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJRMap0mXGiQUS2S1vyT8Oe9vqTV27bJW/zhqP/nwsyS33lQej
 /3TmTZ8KCW1g6wBecx9krusvlz/fh7ym/QfoxxarAZw1ov4A3DLdyW+hylSfLM4OjhJECJO+Cnp
 TO+hvvNeK/65EF26JgQw14OaUsFl9ceSQIqitVRuVXQ==
X-Gm-Gg: ASbGncs6yfanGVX4w/B/ASzoObR+cYlwPHy0Cj7pH0caHZOIdPdvYW2mS4z1jRiH21w
 EI2QsAtzrxRkcLy812dtzhlQ4/smYpcTGuE5HORDAvHuWRZ9u6ksGPu15fKmyC9xbYhwq4O9PpY
 M4/jcw9WT8kfyK41MdmkiGZw4vFFiKGVX9E1bauN22k3jAoGvifh1DskecFkhYS8MSMz1PqWYPv
 iRxhKAJx/fD5oe5yPqJeTp4mzqqPaywh0SRfNY=
X-Google-Smtp-Source: AGHT+IHtltdBE6OyCGOjnTcRy/1zlqJJiS3bBRZ6Sp6xQiGD2+sybE8i8kqhky52N8PljETBXEHJPYT64WU/zafZwdY=
X-Received: by 2002:a17:907:6093:b0:b04:5e57:6d0d with SMTP id
 a640c23a62f3a-b04b1714547mr1454575766b.50.1757484622475; Tue, 09 Sep 2025
 23:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0dfd@kernel.org>
In-Reply-To: <20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0dfd@kernel.org>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Wed, 10 Sep 2025 11:40:11 +0530
X-Gm-Features: AS18NWC9G3fMk0QfS66tLk1WOnGvCPe7TBSPm8NPx9Lx1FMibITf2FeEIh1wODI
Message-ID: <CAO_48GHsteXa9vu5n8FyuWYGOK7yMBhz3ppQeO=CtxTdcM+K8g@mail.gmail.com>
Subject: Re: [PATCH v4] Documentation: dma-buf: heaps: Add naming guidelines
To: Maxime Ripard <mripard@kernel.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Davis <afd@ti.com>,
 Jared Kangas <jkangas@redhat.com>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bagas Sanjaya <bagasdotme@gmail.com>
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

Hello Maxime,


On Mon, 28 Jul 2025 at 13:51, Maxime Ripard <mripard@kernel.org> wrote:
>
> We've discussed a number of times of how some heap names are bad, but
> not really what makes a good heap name.
>
> Let's document what we expect the heap names to look like.
Thank you for the patch. In principle, I'm ok to take this patch, with
the obvious understanding that if there are future heap name
requirements that can't be satisfied with these rules, we will discuss
and adapt the rules accordingly.

I hope this sounds reasonable to all.

If I don't hear any objections, I'll merge this by this weekend.
>
> Reviewed-by: Andrew Davis <afd@ti.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Best.
Sumit.

> ---
> Changes in v4:
> - Dropped *all* the cacheable mentions
> - Link to v3: https://lore.kernel.org/r/20250717-dma-buf-heap-names-doc-v=
3-1-d2dbb4b95ef6@kernel.org
>
> Changes in v3:
> - Grammar, spelling fixes
> - Remove the cacheable / uncacheable name suggestion
> - Link to v2: https://lore.kernel.org/r/20250616-dma-buf-heap-names-doc-v=
2-1-8ae43174cdbf@kernel.org
>
> Changes in v2:
> - Added justifications for each requirement / suggestions
> - Added a mention and example of buffer attributes
> - Link to v1: https://lore.kernel.org/r/20250520-dma-buf-heap-names-doc-v=
1-1-ab31f74809ee@kernel.org
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 35 +++++++++++++++++++++=
++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentatio=
n/userspace-api/dma-buf-heaps.rst
> index 535f49047ce6450796bf4380c989e109355efc05..1ced2720f929432661182f1a3=
a88aa1ff80bd6af 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -21,5 +21,40 @@ following heaps:
>     usually created either through the kernel commandline through the
>     `cma` parameter, a memory region Device-Tree node with the
>     `linux,cma-default` property set, or through the `CMA_SIZE_MBYTES` or
>     `CMA_SIZE_PERCENTAGE` Kconfig options. Depending on the platform, it
>     might be called ``reserved``, ``linux,cma``, or ``default-pool``.
> +
> +Naming Convention
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +``dma-buf`` heaps name should meet a number of constraints:
> +
> +- The name must be stable, and must not change from one version to the o=
ther.
> +  Userspace identifies heaps by their name, so if the names ever change,=
 we
> +  would be likely to introduce regressions.
> +
> +- The name must describe the memory region the heap will allocate from, =
and
> +  must uniquely identify it in a given platform. Since userspace applica=
tions
> +  use the heap name as the discriminant, it must be able to tell which h=
eap it
> +  wants to use reliably if there's multiple heaps.
> +
> +- The name must not mention implementation details, such as the allocato=
r. The
> +  heap driver will change over time, and implementation details when it =
was
> +  introduced might not be relevant in the future.
> +
> +- The name should describe properties of the buffers that would be alloc=
ated.
> +  Doing so will make heap identification easier for userspace. Such prop=
erties
> +  are:
> +
> +  - ``contiguous`` for physically contiguous buffers;
> +
> +  - ``protected`` for encrypted buffers not accessible the OS;
> +
> +- The name may describe intended usage. Doing so will make heap identifi=
cation
> +  easier for userspace applications and users.
> +
> +For example, assuming a platform with a reserved memory region located
> +at the RAM address 0x42000000, intended to allocate video framebuffers,
> +physically contiguous, and backed by the CMA kernel allocator, good
> +names would be ``memory@42000000-contiguous`` or ``video@42000000``, but
> +``cma-video`` wouldn't.
>
> ---
> base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> change-id: 20250520-dma-buf-heap-names-doc-31261aa0cfe6
>
> Best regards,
> --
> Maxime Ripard <mripard@kernel.org>
>


--=20
Thanks and regards,

Sumit Semwal (he / him)
Senior Tech Lead - Android, Platforms and Virtualisation
Linaro.org =E2=94=82 Arm Solutions at Light Speed
