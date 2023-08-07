Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC0772B49
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B9310E2DE;
	Mon,  7 Aug 2023 16:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D9F10E311;
 Mon,  7 Aug 2023 16:41:12 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1bb575a6ed3so3605849fac.2; 
 Mon, 07 Aug 2023 09:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691426472; x=1692031272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TX744ksRAmEB2v2LFFyLe06U3uCgrdtHOoMM/78k+Wc=;
 b=cZnexmh9fQVWZ9khuz+PAU8TeTeq25QZFx4DiE/RKo0hYnUD5kIjMl9MjMu9V33l4k
 36xQj3yvh9m6Y0AkYS+yM3wdNhL+cQ03mzP3bBj1GcnG0cZA36gRimxwQqQcaPdzA7jE
 cYRL0/DnTsST7u42ktbmYpyI1ik9k2rgEK9IqaFshKFBqcYD53jTqYKoB4/n+V+zKPue
 eO03F0Saw862kGqJMfxX1Uer9RO9CNaxh9un+/DurDLR1Khr8l/WRSTJbSZIgBkouvyC
 8zXkHV+tEaeVeWOLkmfbHgxHOoehcRXEjylnRI+pEamVEpr+UA61GkSQt0e8spBeu6WF
 jQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691426472; x=1692031272;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TX744ksRAmEB2v2LFFyLe06U3uCgrdtHOoMM/78k+Wc=;
 b=a8spE7xX3ypnaqWmjhkfjlYbnKSIbXs7e4jAFdd58ybHeWDxgG4/9wvTFPnItE5pQW
 RtK+WBk398T74rJdK1ZAcinMLyXRdlxUxxlkQB0DQCs2yEC090liJG1NjHAJqZEu1fIW
 Vx6U1ZfX2kxdVpumYp/uYe0yZ1T2yO7WFFJb5KpTSwiski6VkhAFngq9CshnIGZIJdUb
 51MflO2n7tb+4PWJS018duUTdho8ggXxE0es/gtZlbsvc97oCHVbvG0pDMHOHMKKnVrs
 tAAhk4Bs0GeuSTDBXaDkVBMO2cQAHqzGALOMyNlSAYf+7jCalqAlVtkvero3IgUEg+wY
 JAhQ==
X-Gm-Message-State: AOJu0YyEsp8EimKuGN+rHJDFOplXQSlNLn0Z42lF17NAawS4d2eDKfxI
 qkD+99/WHYckACnHnf/lkLYDusoTk5Y0IuqPGeU=
X-Google-Smtp-Source: AGHT+IF++/sSKVlLioAJq19YbZy4gat4ybxvqCv9EBBFQSz7GX0zsq7s8IFYUU5nuP/v/12NG7/4k2tOv5FGeAPGbeE=
X-Received: by 2002:a05:6870:8a28:b0:1bb:4ec1:50af with SMTP id
 p40-20020a0568708a2800b001bb4ec150afmr11767708oaq.4.1691426471339; Mon, 07
 Aug 2023 09:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230801092213.7360-1-sunran001@208suo.com>
In-Reply-To: <20230801092213.7360-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:41:00 -0400
Message-ID: <CADnq5_MOWKO0q=7+oVtqGbqreH-cpTMyK_PCY-4Dp4Z-wTi2cw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/powerplay: Clean up errors in smu_helper.h
To: Ran Sun <sunran001@208suo.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 1, 2023 at 5:22=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space prohibited before that close parenthesis ')'
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h b/driver=
s/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h
> index 2a75da1e9f03..83b3c9315143 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.h
> @@ -194,7 +194,7 @@ int smu_set_watermarks_for_clocks_ranges(void *wt_tab=
le,
>  #define PHM_WAIT_INDIRECT_FIELD_UNEQUAL(hwmgr, port, reg, field, fieldva=
l)                          \
>                 PHM_WAIT_INDIRECT_REGISTER_UNEQUAL(hwmgr, port, reg, \
>                                 (fieldval) << PHM_FIELD_SHIFT(reg, field)=
, \
> -                                       PHM_FIELD_MASK(reg, field) )
> +                                       PHM_FIELD_MASK(reg, field))
>
>
>  #define PHM_WAIT_VFPF_INDIRECT_REGISTER_UNEQUAL_GIVEN_INDEX(hwmgr,     \
> --
> 2.17.1
>
