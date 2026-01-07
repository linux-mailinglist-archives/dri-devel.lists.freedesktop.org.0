Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163A9CFC54D
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 08:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF32610E046;
	Wed,  7 Jan 2026 07:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B2610E046
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 07:26:28 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-3ec6c10a295so821148fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 23:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767770787; x=1768375587;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Twe1C1BbPg2woexDagJv2HCcDGXNh4FadpJITTB224w=;
 b=dRv2RJ0nUZS3Xf11osvXfpF+f9SdwP+JfytqbSEBKDjURphRLAk11/4820Is6/Rb/8
 s7nL0g6rT9FdqMEm53Yc5YT+EQppCScco086nrTy/k1IAF6mnU9iC2sgHJvrhruEuq6L
 VWdWUxR6bbgBDAqY6HpQFGZ4kGV51JZIjrhIDe4/JpDR8Wy0j4mOERGHBgf0Imsm3n9+
 ilGZE1J/ue7VErAXm4GYS7tfV1EMFfn4n8MCOZkBEiP53h+56Z5Wvtbzb2C/+fqcPIRh
 k9U+3QgwOr1iyCN2+M6IC+yjpKah/0x3d26HIZVf328eI5CmLYQa2TvajTUcGuLU1JAh
 l62w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpMN+M+kWQDsuQOPMdzagOdPEumrB4cZcH38BBsKcNGn4DeMKg7z5wHeOr7d+gJ8iVN0jV+HKS9p0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNvx+F6vyRBSYKnODnrM2w6D4lgF+luE0tTd2XDzj9IhCtcRWL
 DCpwHD1mBd7S8FrXU95nS1f3Tfr/w7mxlkTFJ7+QcB/HMnsXj9v39duMrOmSYA==
X-Gm-Gg: AY/fxX7jzD63JpwYnmc0wnHqjfT3B8SZgkf+ig5fSJjSbXlevlK7g46ebIlnhyZjIEH
 ff964EcSGn3Snr7yBcvB+6MirJYNMb/qSkCnBn/l+AZ3KOJFz51HeuPCbO/sFdPMZpiIu78q2Ua
 B0wVboVwbc3zmu4Xw8bkFsJ4vdi6R6iNy6NDORV+kZv27hcEL6QrVxINwadQfFKLIB72Qw+xuxS
 zSxD9/+tHe2XdSeAkhLmSEonvVFb+lgRlLOudeIfnnbuo09cLC/nN+nqnT9cGG56xQWCm4yPDH6
 nOvXhEKZXxmBKES/OwGG+UDBZLgu47xSocVcSbqST+pr8NNxW4LBER08dQUePLsss64aep7yR9a
 S0tmRzHpdKW6mzguuKI7Ievk5bAIJTN+J8Vtp+SxqUTtl9hLM8yZWLgmExjbsvU3MvIIiMUyY6G
 YtDak8DaV3CSE45BBUminK/P2QTBL3EoSQmUdmB1ON6ZdexFJKYMmPOGQsMqb11TNcXrswO1Fp
X-Google-Smtp-Source: AGHT+IEvkXyhZFHC+0PvQ6SIDAc+ZQ6ElI2IuwmxGhb/e9ypsQolau0HOL98M98h4cg7iws6uCJ8wA==
X-Received: by 2002:a05:6870:b008:b0:3e8:8dcb:cdbd with SMTP id
 586e51a60fabf-3ffc0be5f49mr608096fac.43.1767770787051; 
 Tue, 06 Jan 2026 23:26:27 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
 [209.85.210.41]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3ffa4de55ffsm2750770fac.2.2026.01.06.23.26.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 23:26:26 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7c75178c05fso688857a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 23:26:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUpEsBGdc4JyJNSqEgFUNM8t0sV+VunZHImIG90rAtQMJ5gF9N6AsSkEkzJGGJ4n/TKBFAk4q2u8Bo=@lists.freedesktop.org
X-Received: by 2002:a05:6830:4426:b0:7ce:2b15:de88 with SMTP id
 46e09a7af769-7ce50bf0a1bmr888031a34.26.1767770786197; Tue, 06 Jan 2026
 23:26:26 -0800 (PST)
MIME-Version: 1.0
References: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
In-Reply-To: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 7 Jan 2026 02:25:50 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-Y2y_ibBemxN6ZQdHW-x+_kRa8ymiJ7z_79CHj=zorfQ@mail.gmail.com>
X-Gm-Features: AQt7F2oqU_xLCPULW_gdHypgzwTMbTeHLd2wn-sF13-JYl990OjGigdncta4T_M
Message-ID: <CAEg-Je-Y2y_ibBemxN6ZQdHW-x+_kRa8ymiJ7z_79CHj=zorfQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t 0/3] Add infrastruture and initial tests for ashi
 DRM render driver
To: Janne Grunau <j@jannau.net>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev
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

On Mon, Jan 5, 2026 at 4:04=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> I will start with upstreaming the asahi DRM render driver. The UAPI was
> merged in v6.16-rc1 and the downstream Asahi Linux kernel tree has a
> driver implementing this fully.
> The asahi (OpenGL 4.6 conformant) and honeycomb (Vulkan 1.4 conformant)
> user space drivers using this UAPI are available in mesa since 25.2.
>
> This initial submission contains test infrastructure and tests for the
> ioctl DRM_IOCTL_ASAHI_GET_PARAMS and DRM_IOCTL_ASAHI_GET_TIME.
> These two tests are the only ones the initial version of the initial
> upstream submission of the driver will pass.
>
> I have additional tests which the downstream driver passes as well. I
> was planning to submit them together with upstream driver patches which
> implement the necessary functionality for the tests.
>
> If preferred I could submit all tests and gate them based on the driver
> version to avoid expected igt-gpu-tools test failures against
> incomplete (as in not implementing the full UAPI) upstream driver
> versions.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (3):
>       drm-uapi/asahi: Initial import of asahi_drm.h
>       asahi: Add test infrastruture for asahi DRM render driver
>       tests/asahi: Add test for DRM_IOCTL_ASAHI_GET_TIME
>
>  include/drm-uapi/asahi_drm.h   | 1194 ++++++++++++++++++++++++++++++++++=
++++++
>  lib/drmtest.c                  |    1 +
>  lib/drmtest.h                  |    1 +
>  lib/igt_asahi.c                |   58 ++
>  lib/igt_asahi.h                |   15 +
>  lib/meson.build                |    1 +
>  meson.build                    |    8 +
>  tests/asahi/asahi_get_params.c |   55 ++
>  tests/asahi/asahi_get_time.c   |   63 +++
>  tests/asahi/meson.build        |   14 +
>  tests/meson.build              |    2 +
>  11 files changed, 1412 insertions(+)
> ---
> base-commit: cef45b995557367ba082bc460fbab2190af943fd
> change-id: 20260105-asahi-tests-wave1-7a850d0e0af0
>

This series looks great to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
