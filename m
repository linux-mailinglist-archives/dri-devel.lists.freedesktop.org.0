Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8855FAFA58F
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 15:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F24710E086;
	Sun,  6 Jul 2025 13:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J8xYCmvB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43DC10E086;
 Sun,  6 Jul 2025 13:42:26 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b31c8eed8f2so82469a12.3; 
 Sun, 06 Jul 2025 06:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751809346; x=1752414146; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9p/OUC5tbbC2lQw5VTLyJND4KlM7wvMWqPSiwnuyFw=;
 b=J8xYCmvBeDrIsyeYrfRzJlUJ4eG3b2cfo1lNG06EYKLl3Vl20lH4DCrJmY1gvAiqwh
 kQfzY6OSJE1hkWTBHkyoGOQoXI1f4077pd0j9h5F5EHhdArMGd9Golzfokb6oFwiucgs
 hG8Ms0RNBWUcW05WBwm9YKCxKFSjD7kCDKtiMEHQQtU45i8OhaabpIPT2qzaib735Qsr
 Df7dtqccI2DOxbrhAHLYfdaGKj7ixRx7TTNXPdlsTFJ1wMrKXQAwqeqr7VS5g04nioS9
 eSn1dudr9YiAHrmszW9Lx8FO2MKqL34zxpTSzgk8B7qWUti8EAsiZ0VRnO/gVIJbmSxL
 Q6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751809346; x=1752414146;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x9p/OUC5tbbC2lQw5VTLyJND4KlM7wvMWqPSiwnuyFw=;
 b=ut9lmTpFjGyhOMjK0iNa72dYJD4jW/FQ6xq612X0CIHK2SpoTD38T8ufthfnm5mYsU
 LDBjJEbMBPiPs3q04TO5KHf8rrgT9ZvXWToPENvT+dm7PRnHX9N+9e+uDQ/KGE+/p4pD
 7N8OjqL2cC3H3HrKTGIF3HT4x0ZP8AB47Snv471QEAVKKNzqG4FHRXXxUofzl/apSqEH
 cRDSwNkCEAp0Y2ZdtA1vRmdj+Ugp7aU/0mAjTu60lfQbTEtdv6Lkb9nIfPT4xD3EdCtJ
 6KW2SQcYmcig2B8SLFsD+oR68ltzDS9rVsOes0SaHYilS0YWaPFQh2EYSJJPeuKHKv2F
 H/3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhgye0FUfcolEHYLeSDKmjE+hjVsuYWSTd11o0VKgIlkihNzwecHemr6xI0zfJN5pA2lmjmVks/A==@lists.freedesktop.org,
 AJvYcCWJsFxCrWvrayJXvNw+8YL0MDcI3otbxur9qLFT2D7k22SxLPZg1aTy7MKKN8jzUbO5T4WDPQzNkEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhYC4XJ4F6lVX32ZzluN7FQDvO7ci5l9+zo+YsIf2EwzzoZM/s
 uS+sbucsja0ioZSBekDRypb+ERj/ysnxXnZC1qFCZ5eGgeNgZT9bWbPXbvwwPjKbsOhZveNCq0E
 MTHYxkrfQ1ZS7kwF1B4MXyK7+nb/Cifk=
X-Gm-Gg: ASbGncvtkKws5A30t0rkSEsFpdPd6xQOfbAEVpPU/amuzov6trvKf/o83zPOXNqBj3K
 Go+j5mjKYKLSSux28jvRBuej7A4IzarMNWT8lYYd1g7QhrDpeAK1SpgwMrcLOm+KDzBiQeK85Wa
 e//S/Vye2rhZYLQSCoAR/6mmHrG1HtknFfz6avIJMlYz3a
X-Google-Smtp-Source: AGHT+IEUJFZL2JU8xJSFulzsZPwp7Y5KKKb4k5Vl4oukDhrgiu5ve9lkLrK/mtQ4PMRZ7/XS+4qg94PJ9RHtwPTgAOs=
X-Received: by 2002:a17:90b:258c:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-31aaca78f48mr5496701a91.0.1751809346077; Sun, 06 Jul 2025
 06:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-1-f362260813e2@nvidia.com>
In-Reply-To: <20250702-nova-docs-v3-1-f362260813e2@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Jul 2025 15:42:13 +0200
X-Gm-Features: Ac12FXy1CaP3o3WtkbtVOog3-QiqhLt2Ifo86odUyVkUt2_fgezqFSeaSXeO-AY
Message-ID: <CANiq72kUoyhbwiTeB3Bwv3X0iGLbiVWeQCBvKshOaNMqkEsUPw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] gpu: nova-core: Add code comments related to
 devinit
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Joel Fernandes <joelagnelf@nvidia.com>
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

On Wed, Jul 2, 2025 at 1:04=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> +        // Check that FWSEC has lowered its protection level before read=
ing the GFW_BOOT status.

`GFW_BOOT` (another one below), since it is written like that above.

> -/* PGC6 */
> +/*
> + * PGC6 register space.
> + *
> + * `GC6` is a GPU low-power state where VRAM is in self-refresh and the =
GPU is powered down (except
> + * for power rails needed to keep self-refresh working and important reg=
isters and hardware
> + * blocks).
> + *
> + * These scratch registers remain powered on even in a low-power state a=
nd have a designated group
> + * number.
> + */

I noticed the file uses `/*` in a couple files -- could `//` be used
or there is a reason for it?

(I guess maybe in a different series, since it is already there for
PMC in mainline. It could be a good first issue.)

The idea is to only use `/*` when `//` cannot be used, e.g. within
code, so that they have a different purpose.

Cheers,
Miguel
