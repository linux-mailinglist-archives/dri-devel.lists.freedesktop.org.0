Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141A2B154B1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 23:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D3C10E09E;
	Tue, 29 Jul 2025 21:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YlDTkwMb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80510E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 21:34:44 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-b3507b63c6fso6454846a12.2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1753824882; x=1754429682;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xp7eLWjLlPUY2gLZxRm+MGuoAxS9M5bnsTC/FZdxS6c=;
 b=YlDTkwMbh+bvRljdThrFXQqRclGp0mPqLsJ2mANAdrIYw0ImEZ1MuAn2KpQbUcuZRn
 sNCnUzaVqrz5TudbY05nLyhQZMOMwwFG9QJrm2OKHOL3h/bn11/T3fNEAPPcOdO8x88H
 XEPSfQtNaeC+DVVurP6Pji2g8dyPj7nPJniss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753824882; x=1754429682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xp7eLWjLlPUY2gLZxRm+MGuoAxS9M5bnsTC/FZdxS6c=;
 b=oYKMug8URXBLmHz+vtdKhClvHgkNja4LutqlME/+VmzYNtOviqtwCriCm7m959Ny5C
 +XV6xRhMehET1XcQddR0PFkePf01tlVFMTtkZtV9omqjBHjDSAXRMRmou2MnPyQ0+lG1
 leBmZWSUGG1IulP9X1KQZmPpYaMgGqNpoyzeUcEjgc4xnlMCU28re2Dk7Uwb6qHoGCyv
 Jpk9Xw6neAg+TdOQ9o07v+x66xCsef5ccduIHF69lIX0Ew+oGXUp53p9ivICafGPkUgF
 jTCZiu2XeKERpglWUQmwAqHewtfokQ3WkwQoy5wG60hmlCU9IC9LMZ5dmeULTCWnnq6m
 GLnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5JQGL1kgVw5symBq8UYJgSdTxBRR5YvmoFFSx4uD5iIaKwSzTy7fjfJcuBOVeWGwuHpNZaApG2f0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTtBR3/7AE0ucx31PBctsM1FGx6Atc7kT/dZvP+FMQE0JaUajo
 79HVOrGXvpcsGju4SAJPHRMCboAKuPRTA0VcUBjlx/DerXgz/nq8fo5Ibz70h/35TQNqwGHMod2
 QIyY=
X-Gm-Gg: ASbGncs/biPh1v7eFJxG895o8Rulg00fLmQTzdQwjvDa7rWOgeHaBpn3HQtWFrlxcv3
 tpYxWqA89j/zx4fjf1VlilXLGEftAnJ8p8DwF0q5YgtFO9oeH5zZG+92fIQoqI4XplxpIUshXpE
 Z3A6q58R8ol4HvyqpfBkCJZ2ATOcq3dCWD0fzPkaLykyGiSqX75E5zDWY9eIzE0iWeA4u5b+NBC
 9dsNeddBVfzF+IJN+bBKcxBHzvipNniDTX7qw8GOaczJxveUzrzVkeTFVd7CCeMf9EAg6omqtgD
 qU7a9hN6MwZVt/XeudK1L79mh5fL9NWuRSWxjE52i8mN1i+6NZXOkvwLoQQB+4ELzcsXJmnYhMv
 4/oTPmCbpvIKZ89IQWdLExU3RLdRlb1YDJd5ATrp9e8BAiYJEWlR4OZurNduJ8V5fUCbNAoBf
X-Google-Smtp-Source: AGHT+IEdEYOEigpXz/ZwFBx5q8qDEeqhVnJh37JQXejrKdVj3Hfv4hS5XDW5hvVkrpRgIwbCS80+Vg==
X-Received: by 2002:a17:903:41c2:b0:240:aa0:1584 with SMTP id
 d9443c01a7336-24096b68210mr13524845ad.38.1753824882525; 
 Tue, 29 Jul 2025 14:34:42 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com.
 [209.85.216.41]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2409166e135sm7023425ad.157.2025.07.29.14.34.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 14:34:39 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-31f02b6cd37so2489369a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 14:34:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrmM5zbe3uW2zxMbFSlE3l6odncO0WMKwTjEUFMLleP/ZgC8DM8dtFpjtB0h1e4zUdqfZs5vTPNss=@lists.freedesktop.org
X-Received: by 2002:a17:90b:17d2:b0:31f:12a7:da67 with SMTP id
 98e67ed59e1d1-31f5ea4c8a8mr1070193a91.32.1753824876205; Tue, 29 Jul 2025
 14:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250729054435.1209156-1-me@brighamcampbell.com>
 <20250729054435.1209156-3-me@brighamcampbell.com>
In-Reply-To: <20250729054435.1209156-3-me@brighamcampbell.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 29 Jul 2025 14:34:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLoMenu22F_VeoHyfXwRO7JfXL8peQLEpkqeZ1tDOmEQ@mail.gmail.com>
X-Gm-Features: Ac12FXwuRPQLnCei2aPWgGqgkhJiepLnrrXfiREPquhd3zgNcTNh4R-TaDAM560
Message-ID: <CAD=FV=VLoMenu22F_VeoHyfXwRO7JfXL8peQLEpkqeZ1tDOmEQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm: Add MIPI support function and macros
To: Brigham Campbell <me@brighamcampbell.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org, 
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi,

On Mon, Jul 28, 2025 at 10:44=E2=80=AFPM Brigham Campbell
<me@brighamcampbell.com> wrote:
>
> Create mipi_dsi_dcs_read_multi(), which accepts a mipi_dsi_multi_context
> struct for improved error handling and cleaner panel driver code.
>
> Create mipi_dsi_dcs_write_var_seq_multi() and
> mipi_dsi_generic_write_var_seq_multi() macros which allow MIPI panel
> drivers to write non-static data to display controllers.
>
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
> ---
>
> I looked into using __builtin_constant_p() to extend
> mipi_dsi_{generic,dcs}_write_seq_multi() to accept both static and
> non-static sequences of bytes and store them accordingly, it looked
> promising at first, but I found no such solution ultimately. At the very
> least, if we find a solution at some point, my hope is that cocinelle
> could be used to replace each of the new var_seq_multi() usages among
> drivers with an improved seq_multi().
>
>
>  drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
>  include/drm/drm_mipi_dsi.h     | 35 ++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)

nit: maybe make the subject a bit more specific, like:

drm: Add MIPI _multi reader func and two new write variants


> @@ -415,6 +417,22 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi=
_multi_context *ctx);
>                 mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
>         } while (0)
>
> +/**
> + * mipi_dsi_generic_write_var_seq_multi - transmit non-static data using=
 a
> + * generic write packet

nit: "non-constant", not "non-static"

From the caller's point of view the difference is that the data is
compile-time constant in one case and not compile-time constant in the
other case. It happens that means you can _store_ it in a "static
const" in one case and not in the other case, but that doesn't make
the parameters "static".


Other than nits:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
