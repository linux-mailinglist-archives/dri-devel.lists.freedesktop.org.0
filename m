Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 579C739FD48
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F56E247;
	Tue,  8 Jun 2021 17:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243CD6E237;
 Tue,  8 Jun 2021 17:11:16 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id p21so4098889qtw.6;
 Tue, 08 Jun 2021 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nBrruEgnz12ZC6jqDcLkPXxRhqlEWuwnn47cR6q73To=;
 b=esiHr1w1nbqv1SgrOWlb+Xsx3v8QLTfLfmIeuJLlb22Rx4RR62wOIWTMtqWQ2ntrEi
 zTslo7JZK6qdR+uSaHc7q0tC4751K6DoW4XxDElFvfccnrsiMc67rQqXZii9rpWsPHAY
 vzyULJwK7t1Sii3j66D3EOoPdaufMRyt9/IPkiK0x249taja7MNO5z0tkwnuIJT6S011
 HmQILfkXkn4IpI2fPg/TolDCaibTNCZYx4dDrdCYn+JQJEYyew89Bhq3rdJID9LXorHH
 OKSDkPlN6HtxGnLXPgMmyVlB1lPYHVjdBAwq2TzPxcwt+8P3sBsLp+RoEsQNsZLdPTt5
 Dsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nBrruEgnz12ZC6jqDcLkPXxRhqlEWuwnn47cR6q73To=;
 b=UGWi59Zbo9mDMSNLe5S9RGESgA0ydBGtcEC3MCFR+kI1Lzr6L1ckeIR4llZZT33+Ik
 tCtOZZfXpANhcI1/hXn5UinVDFKMe8VPcP9joZy7ioNkiNFm42HRT70DXjBnDPSu+HvA
 a0yEHGE4QU/OZ0aYA0IZ9vfEs6OI+1afLS12eaX9G1cpHXZCTkXiHX1/mMy0fXC4EgnW
 KU3giH6mHmp/NTk5UrALfWlsqJnUOKxg5RD4gpB1uk5yGOX1QGkfkPGqDGI/JyFBKQIM
 LADQA0RbFK9ugLJNss/m8Jsn6g9s2uaiCNVpiU1gSbbeb3kBvV63ton7mXO0lW9vw3k7
 99Ow==
X-Gm-Message-State: AOAM532dFK3kghsoiKJVTJ2U+DR7lV1KPu7uRwAvEtgcOzCQpiAVDq+j
 BkGoazkYtBT2IgCpRta7CuMU46DUdCV+KKoQqOo=
X-Google-Smtp-Source: ABdhPJzr0Q9DtlZHoEgFgkUAOM1QDQ4PIRFe0i1VQZq0JuTIvLaS6b2krGW4eTJTJ0UCdTe7VcXkwexYkZnNw/jDH5M=
X-Received: by 2002:ac8:60d:: with SMTP id d13mr22402742qth.223.1623172275282; 
 Tue, 08 Jun 2021 10:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210608092846.64198-1-thomas.hellstrom@linux.intel.com>
 <20210608092846.64198-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210608092846.64198-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 8 Jun 2021 18:10:48 +0100
Message-ID: <CAM0jSHOc6A8oJ384=owQiqPXfeX-NgpRsKtujpn9fQ=JfUYj2A@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/i915: Break out dma_resv ww locking utilities to
 separate files
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Jun 2021 at 10:29, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> As we're about to add more ww-related functionality,
> break out the dma_resv ww locking utilities to their own files
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile               |  1 +
>  drivers/gpu/drm/i915/gem/i915_gem_object.h  |  1 +
>  drivers/gpu/drm/i915/gt/intel_renderstate.h |  1 +
>  drivers/gpu/drm/i915/i915_gem.c             | 56 ------------------
>  drivers/gpu/drm/i915/i915_gem.h             | 12 ----
>  drivers/gpu/drm/i915/i915_gem_ww.c          | 63 +++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_gem_ww.h          | 21 +++++++
>  7 files changed, 87 insertions(+), 68 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.c
>  create mode 100644 drivers/gpu/drm/i915/i915_gem_ww.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index 4f22cac1c49b..ea8ee4b3e018 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -45,6 +45,7 @@ i915-y +=3D i915_drv.o \
>           i915_switcheroo.o \
>           i915_sysfs.o \
>           i915_utils.o \
> +         i915_gem_ww.o \

Nit: Should be kept sorted.

>           intel_device_info.o \
>           intel_dram.o \
>           intel_memory_region.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index 1fafcc89ecee..789529b424c1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -15,6 +15,7 @@
>  #include "i915_gem_object_types.h"
>  #include "i915_gem_gtt.h"
>  #include "i915_vma_types.h"
> +#include "i915_gem_ww.h"

Same here.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
