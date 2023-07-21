Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0CC75CCC3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 17:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A0510E6A0;
	Fri, 21 Jul 2023 15:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02C010E6A0;
 Fri, 21 Jul 2023 15:55:48 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1b078b34df5so1598632fac.2; 
 Fri, 21 Jul 2023 08:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689954947; x=1690559747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tl0eTAwzZMqhrxk94X5w3ULTemUp7A7rZI7DezrgeA0=;
 b=kmuAo33/+EOAbBUeF2mJvFIvjHiyGDFqgVkxovydnyB+xcalD42PZFUywMTVcGNa8t
 5u4fevWpKgGGQiezFXTQkf7jwfFC0llQlpMIwAIQKM/BPDfdf20BfJkXkXGfurQ4gqAx
 eiB0ljF43D5RmbBCizRa98SBKdhu0Il0FmJyzjX9EqMDxuvjvX2XddKQzWI6bxZraYXr
 ffvqZ3CyBL2oRQ9Ut+ahEuZgU2oh5GtpQ3/nFq4l1IlFaYgG4+JADAloi03ppBV/aAu3
 V1YZkFNO0TOnqwjf42Y+u61M4BM7CDldqMPhfQvtZn9QTvjfgzGaiPk2EziUpvYK2OWh
 epGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689954947; x=1690559747;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tl0eTAwzZMqhrxk94X5w3ULTemUp7A7rZI7DezrgeA0=;
 b=Szb2xr32prbx1qemUGxGjbGD8bBJ4kS0lvqLCjFxmXKOs37sz5T7VXX2AzIKkGc3wW
 RKORIt8dGDDLZaleDMcZgBEyv/iIpkW+4KlLN8pqyMpwCXMrDBPr2ADcySQYiCvEIynd
 p77EuhwI7hjqCg/8zL7ZdBecgFDtmIPsosS5vievM9FiKXH/ucY6eOH7Lr9gmKm8zuGA
 488pAmstiUD1pUE7Xqjc5Kfml4QxvmmaBCP4Qm37uxn6x7tTR/Umhhb4I74uTE7xzGdq
 qe42EjW3XlQZjFflWeDtCDE5XCVbtDeW/Wcwo4Pp2hJtS4nmLmWxKsmSszFEISnBka7a
 KBGw==
X-Gm-Message-State: ABy/qLbIfBSYmvtZLlZnjMyiCqM4ZZL+v28rR4FuVplAS1pap8jQ+aJC
 gkq8N0BTKVbVcdfUTpYP016X769La83kgesYv+c=
X-Google-Smtp-Source: APBJJlGM5h3R4hILd/o0pnv8AxWx2WjHbhsf+MePdcnfu8LONxoSi8vOo0ew6VGAU3e747yKPBDUS4PpIeBWd1GtK0c=
X-Received: by 2002:a05:6870:7389:b0:1b0:89e4:e26b with SMTP id
 z9-20020a056870738900b001b089e4e26bmr2799810oam.48.1689954947629; Fri, 21 Jul
 2023 08:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230721012635.4552-1-xujianghui@cdjrlc.com>
 <f9f0077b8f91d858777e9ad2db972db8@208suo.com>
In-Reply-To: <f9f0077b8f91d858777e9ad2db972db8@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Jul 2023 11:55:36 -0400
Message-ID: <CADnq5_O6HO70hXuoahwcnN6q0e1YbW8kLZbFT0uV=YeLPZwnmg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: open brace '{' following struct go on the same
 line
To: sunran001@208suo.com
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

On Thu, Jul 20, 2023 at 9:31=E2=80=AFPM <sunran001@208suo.com> wrote:
>
> Fix the checkpatch error as open brace '{' following struct should
> go on the same line.
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>

git am didn't seem to like the patch, but I was able to apply it
cleanly manually with no fuzz.  Not sure what's up, but I've applied
it.

Alex


> ---
>   drivers/gpu/drm/amd/include/yellow_carp_offset.h | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/include/yellow_carp_offset.h
> b/drivers/gpu/drm/amd/include/yellow_carp_offset.h
> index 0fea6a746611..a2c8dca2425e 100644
> --- a/drivers/gpu/drm/amd/include/yellow_carp_offset.h
> +++ b/drivers/gpu/drm/amd/include/yellow_carp_offset.h
> @@ -7,13 +7,11 @@
>   #define MAX_SEGMENT                                         6
>
>
> -struct IP_BASE_INSTANCE
> -{
> +struct IP_BASE_INSTANCE {
>       unsigned int segment[MAX_SEGMENT];
>   } __maybe_unused;
>
> -struct IP_BASE
> -{
> +struct IP_BASE {
>       struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
>   } __maybe_unused;
