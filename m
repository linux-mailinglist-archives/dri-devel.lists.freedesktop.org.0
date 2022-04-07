Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFF44F86C8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 20:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FE410EC17;
	Thu,  7 Apr 2022 17:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F378A10EC16;
 Thu,  7 Apr 2022 17:59:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x20so7307913edi.12;
 Thu, 07 Apr 2022 10:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4WI8dxwe4b3rh4wbz1s8dWC+0Q4/tNtWQhYTCvMgaWg=;
 b=M7SIK2MkUwKLwzi/3DHrnEDIb57hI1xKLKxsRdf25MYXG4n7aAziUoWxRnF4tzq0TR
 j3o1lrSp/51pm+eJ/Q1+imaaoxR6XD4MU73TNodpCb2W4WO1flERSYsqHhpk7Fsht18g
 mWKWc5F2oWqgt8nhsUg6bhH34H512m0lRMqrPf/26GhmfcROYrcdfWyigh2R3dRtiZWV
 5rKOKC7JnC6DJvzncd/gBwNU/YK516l+DmSBlW9Ng0iI/X8DG/2cnCPPIvkIqvbCuqIE
 1zF3Tiw0tSLEuWgt7vYO8yOEphOwrLZ4f6vhG6hs1O5hdpQEqmZKIuPf1pUGbX8NWU7K
 1JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4WI8dxwe4b3rh4wbz1s8dWC+0Q4/tNtWQhYTCvMgaWg=;
 b=CiQdKNyfqbCQsKTDKGexsgUNflJuI0e3oEZ1IgOBe+vXYFACuyjfFHp6AxjqK5IOfK
 VMmzNj+RLs0gMCIqiUvgsnE25paJKSHTtjQ3KgmJz/SFIbR5ckIIO6PQCXWaB7+GEvLH
 Gf2JcGYOVolOfhpMxdD9d6iLhRcVZGacxw9KkOF6WwaAbrQLpH7sRZDq6MOfOMtLgpD+
 8fievDeaZ7xJeXCbVcMMiQhYID6PKAO9ruHQky1p7N6yWj6VPbHog1bFNGVV4jEP+mjY
 aCX4aDFeFdgad15mI9ZcH2t8grTb2QPel7xcAKGORcWwmNMtdO3zJCogTXjYPfoRk5sr
 VGUQ==
X-Gm-Message-State: AOAM5309uWdSGtTf3vvqiRxybAWNACSesBwa9FEoD2G1vHXJgj+T6fLc
 GhPdRrYEN5qmkLsnpkOqHrIqZxJVckWEUCJt4TY=
X-Google-Smtp-Source: ABdhPJwqPgTfmh2eKYARtTkzYXTyBP35fIzqxtF9gOR8XTTzQjGs9AMiYyhlMM2NMNspNeLAuAfPCn7pm5MYaxQ89AU=
X-Received: by 2002:a50:d098:0:b0:41c:bd64:b0de with SMTP id
 v24-20020a50d098000000b0041cbd64b0demr15287267edd.366.1649354396277; Thu, 07
 Apr 2022 10:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220404133846.131401-1-imre.deak@intel.com>
 <20220404133846.131401-2-imre.deak@intel.com>
In-Reply-To: <20220404133846.131401-2-imre.deak@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 7 Apr 2022 20:59:45 +0300
Message-ID: <CAJ=qYWSU-6v-cJ9a_=4-cYU1n9kDDMj4AXG3sFhXXUrfuFvLXw@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/fourcc: Introduce format modifiers for DG2 render
 and media compression
To: Imre Deak <imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Nanley Chery <nanley.g.chery@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Seems my first mail didn't come through so here's second time for this patch:

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On Mon, Apr 4, 2022 at 4:39 PM Imre Deak <imre.deak@intel.com> wrote:
>
> From: Matt Roper <matthew.d.roper@intel.com>
>
> The render/media engines on DG2 unify render compression and media
> compression into a single format for the first time, using the Tile 4
> layout for main surfaces. The compression algorithm is different from
> any previous platform and the display engine must still be configured to
> decompress either a render or media compressed surface; as such, we
> need new RC and MC framebuffer modifiers to represent buffers in this
> format.
>
> v2: Clarify modifier layout description.
>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Acked-by: Nanley Chery <nanley.g.chery@intel.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index b73fe6797fc37..4a5117715db3c 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -583,6 +583,28 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
>
> +/*
> + * Intel color control surfaces (CCS) for DG2 render compression.
> + *
> + * The main surface is Tile 4 and at plane index 0. The CCS data is stored
> + * outside of the GEM object in a reserved memory area dedicated for the
> + * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
> + * main surface pitch is required to be a multiple of four Tile 4 widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 10)
> +
> +/*
> + * Intel color control surfaces (CCS) for DG2 media compression.
> + *
> + * The main surface is Tile 4 and at plane index 0. For semi-planar formats
> + * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
> + * 0 and 1, respectively. The CCS for all planes are stored outside of the
> + * GEM object in a reserved memory area dedicated for the storage of the
> + * CCS data for all RC/RC_CC/MC compressible GEM objects. The main surface
> + * pitch is required to be a multiple of four Tile 4 widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> --
> 2.30.2
>
