Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FFA97A8B2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 23:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E11210E3DE;
	Mon, 16 Sep 2024 21:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WakJpZiT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF9010E0DA;
 Mon, 16 Sep 2024 21:22:21 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-71790698b22so1283274b3a.1; 
 Mon, 16 Sep 2024 14:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726521741; x=1727126541; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MnZ+w3zQ4IHZ8UMqW7Wlzbtf2x6KfNdPBGv/gNGn4hE=;
 b=WakJpZiTcm+smJay1k/VBT2k/UUDdAwILQ12KQh0Yaom72qaxb374SllWkeJGoHb4R
 Dk/OEa4RfNbVVc2eNcrV+qJjt4kB8X3P8k9xi1w3TYyjWAujqLLIhmtlKztdDngkP4eA
 7SGU7GpRR48VgCpb1pR8biTlvWKiGO4GjUQOS8piblcWnrIW/qGF/3bIAWYCImX1mXDH
 MNixK0t615TM8uiTaTB5DD7jrn5376jRJFg9juaGuVKsiDWFm/1Db9h5vQaNXfNImhkJ
 ogaoUQGfa9gBsylqIr6QgAeaJb1OHxIIFXJO/s7T0b+Eo5t5Ofmg3KcymnjKBYJsZpuK
 YqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726521741; x=1727126541;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MnZ+w3zQ4IHZ8UMqW7Wlzbtf2x6KfNdPBGv/gNGn4hE=;
 b=VYks1fUrEI88O9EY2H7gEGOf9RcdfBnk6CAYOgOSCjHh3WhyVcUewOQmpO9TxGk9Ql
 63u/Zli3+f1s2nZUvM99GK9YAQ0EwZcTDDveHmJ1y93jNvAN+EvMCKLeJhI9tEyYvV9a
 QS0JaUKi2y1p4Xc29QMHSIzFTzwoCFnSZGXHsAcW30avLMXbR66PqeeLhq6kN1k4jhAf
 zCyomit5R+RZTTyJxrLOuqLMEP3eHE6cmf/TDQ155/5khu0OZmnQGd/7JuUpZNChahM1
 9RIHyqGud+yFUFFYoFz5qNP2EJCJvl8oD8nrDDHM1B3Zb7fRUUN60c9dl22/fgsOUP2R
 XPzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6pOy3Z5iVf44RBvIHVU2AC9xnoldrdNR0FqPATH98j+YR//9rJMOUElgPbcPnn9p3cOEqjoomfNOM@lists.freedesktop.org,
 AJvYcCXCxmixGPXmNVfQl7pCbk/hCUYKxhvHYM5pWchdStmL0zOEnlfCdGtJmeGrTrXJHSxP78Y22pVm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzSsz7ONzQyn2fpbpGN7gzCVMw9bNqprHh5j6kvvA1MoZ4AhoP
 O80F1e2zIo3wGM6PmEWE6ngEcwCtVTn7fB+fTP2l/vQNqkSW2HGJ0PAg+72jvl3kkhlk6VOtHwN
 IciwNTB4rRGt7MzCeN0jp9thtjgfAm3jC
X-Google-Smtp-Source: AGHT+IH5SjI+U0A7P/wtoSude0aArR/OHyFC0Phr5mIxCQoIJV8kcO5I/Gdj3ckinVYf82EStXGIVhanMBob4xTNuA0=
X-Received: by 2002:a17:902:d2c1:b0:206:99a2:b058 with SMTP id
 d9443c01a7336-2076e35fdd8mr105279965ad.5.1726521740510; Mon, 16 Sep 2024
 14:22:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240915140144.36988-1-linux@treblig.org>
In-Reply-To: <20240915140144.36988-1-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Sep 2024 17:22:08 -0400
Message-ID: <CADnq5_OGNOfDkpGumipdpwJBCa1_UCB0NHQQ5otnPrH9b=_V8Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unused function
 bios_get_vga_enabled_displays
To: linux@treblig.org
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Acked-by: Alex Deucher <alexander.deucher@amd.com>

And applied.

Thanks!

On Sun, Sep 15, 2024 at 10:19=E2=80=AFAM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> bios_get_vga_enabled_displays has been unused since
>   commit 5a8132b9f606 ("drm/amd/display: remove dead dc vbios code")
>
> Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c | 7 -------
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h | 1 -
>  2 files changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c b/d=
rivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c
> index adc710fe4a45..8d2cf95ae739 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.c
> @@ -78,10 +78,3 @@ void bios_set_scratch_critical_state(
>         uint32_t critial_state =3D state ? 1 : 0;
>         REG_UPDATE(BIOS_SCRATCH_6, S6_CRITICAL_STATE, critial_state);
>  }
> -
> -uint32_t bios_get_vga_enabled_displays(
> -       struct dc_bios *bios)
> -{
> -       return REG_READ(BIOS_SCRATCH_3) & 0XFFFF;
> -}
> -
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h b/d=
rivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h
> index e1b4a40a353d..ab162f2fe577 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser_helper.h
> @@ -34,7 +34,6 @@ uint8_t *bios_get_image(struct dc_bios *bp, uint32_t of=
fset,
>  bool bios_is_accelerated_mode(struct dc_bios *bios);
>  void bios_set_scratch_acc_mode_change(struct dc_bios *bios, uint32_t sta=
te);
>  void bios_set_scratch_critical_state(struct dc_bios *bios, bool state);
> -uint32_t bios_get_vga_enabled_displays(struct dc_bios *bios);
>
>  #define GET_IMAGE(type, offset) ((type *) bios_get_image(&bp->base, offs=
et, sizeof(type)))
>
> --
> 2.46.0
>
