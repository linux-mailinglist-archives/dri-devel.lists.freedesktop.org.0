Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2787601A5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB7910E388;
	Mon, 24 Jul 2023 21:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590A210E387;
 Mon, 24 Jul 2023 21:58:37 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-56352146799so3419529eaf.3; 
 Mon, 24 Jul 2023 14:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235916; x=1690840716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8NJFs6oMV2v7s/6JWLw92i8k8fJbTsKr3ji5S2m8KS0=;
 b=iRhyHEHT9v0N25GBiANzkyyDiU2tkhSDVDb+ndq32RtThI/B1SEelfS7MJletWVxMs
 xHSzY/5cMtImbSa3tDKQv3FNId4sQASFMqVIaAANlenBUZIgne88uJuRXqN/PDEuDwS0
 JxX3JA/B8lOOaQFrErfISUrx08U/LwiBB3DMUIVIykUhjmtzyOWSC+KsD+mkvJM0aDUQ
 qmyCQqAThsL44UtNgdztyMHKrQwp90hHcYHlzeFdNZq9oqTJZYQz2JD5ocXRg3Jd3eHc
 y2PadWI0ZL0YSIAIYRIKHLW7YtgMoHMZ6pSO3C4t1v1wVLbL4Gwa/jvrYOwwz4TSoAfE
 xHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235916; x=1690840716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8NJFs6oMV2v7s/6JWLw92i8k8fJbTsKr3ji5S2m8KS0=;
 b=DfXzncy+GuNriDVdSqg3cpI+sVRxc2URCkwBntleql5s5DAIFL4aEXTrQHCRvSznVb
 gsIXjRcTC2euHkvgdbz3/mr+kcggLlgWgMnWlsdm345FNZs8Rr8xGMVAelUKdtiEXOSH
 Iq4cF/PmA9nP6JuQdyM42VOx/mepDZig0jTrS0/w5idtVi6LSnhv/luXGyp+TGLSHAsN
 E7dzVQcUZkTV9HX/58meq5ZMUAochvSmMMKi1pQYaEcTXQxjk9SP0CGI+Bcw3XldTT9U
 PNIv0h6FFCE3IdYVZK+PlDAinsX3YdZXrEiiiDAWbDcE9l30/wK2yKyV4QQUKn4ivhfG
 qCAg==
X-Gm-Message-State: ABy/qLYrqi1S6o+2Ubs0dWBXsFl0/hD7AWYLTIMstBfKQ2qNNtlqO34T
 ceomnNqVEKXM+IGDXUYq+0BiGIYF9RvXlTXdf51ijUbH
X-Google-Smtp-Source: APBJJlEjAyCLEl3W4KjypzjxkJg0xvoj++O/ICBdF0x8TZ0kBTlIiMDzQZR83k+PaRGpN5MVvoEIjibwSTR2y5mubxM=
X-Received: by 2002:a4a:750d:0:b0:569:d46a:5c1d with SMTP id
 j13-20020a4a750d000000b00569d46a5c1dmr4477416ooc.4.1690235916477; Mon, 24 Jul
 2023 14:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230724083344.9285-1-xujianghui@cdjrlc.com>
 <7e638628f942fe7989fe2da3da537c28@208suo.com>
In-Reply-To: <7e638628f942fe7989fe2da3da537c28@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:58:25 -0400
Message-ID: <CADnq5_Pj+B8azBwSMAWg5d=UWS9ey-wnVTJWLScHCv--xMLTgw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in smu_v13_0_1_pmfw.h
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This doesn't apply cleanly.

Alex

On Mon, Jul 24, 2023 at 4:57=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: trailing whitespace
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
> b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
> index c5e26d619bf0..8ec588248aac 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu_v13_0_1_pmfw.h
> @@ -30,7 +30,7 @@
>
>   #define ENABLE_DEBUG_FEATURES
>
> -// Firmware features
> +// Firmware features
>   // Feature Control Defines
>   #define FEATURE_CCLK_DPM_BIT                 0
>   #define FEATURE_FAN_CONTROLLER_BIT           1
> @@ -92,7 +92,7 @@
>   #define FEATURE_ZSTATES_ECO_BIT             57
>   #define FEATURE_CC6_BIT                     58
>   #define FEATURE_DS_UMCCLK_BIT               59
> -#define FEATURE_DS_HSPCLK_BIT               60
> +#define FEATURE_DS_HSPCLK_BIT               60
>   #define NUM_FEATURES                        61
>
>   typedef struct {
