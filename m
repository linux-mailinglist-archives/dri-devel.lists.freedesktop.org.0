Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439B48C1E0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 11:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECAC113735;
	Wed, 12 Jan 2022 10:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D132113730
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 10:01:34 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id u25so7794442edf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 02:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T5yvoHZXf5sRcIr28nRZ918Ghx2PDXySAnpXVpTEeyo=;
 b=IFnPU1h6tQdehMMmQirBcyt3PUDYvOYItJ7Gc2qM2IvjLICD+XK0IF0sEZnFTQ6aHg
 n2++qzfy9+/2SstO58HcFlkSXrXky9rMusNMOMWIom7d7hQeTilkwcspTekZ2lKPzg4r
 0xpEifFX8O1cCdxr8NyqVOr4UxU7UKQscxxcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T5yvoHZXf5sRcIr28nRZ918Ghx2PDXySAnpXVpTEeyo=;
 b=M+7ORsMxNQFq127/C31oCt2DKr19yQ3WlfXNcCrKRyzaS5f9ieuW2WYooCN3u59kHj
 IvH/y/CM7/XELHrYLEmiwetT4BsbxpCTRVJU+z+TodPh5v9QhQmpVeapAycSSSitwfQm
 +X0+nF91b4Rmr/E88XsgcZzs6Gn93rbQR9Z71AI88mn/4rshbtFdINoRdc+Ab5fmU8uA
 eWIB9+MwQ0yKSCEybuQ/cJnfYQbLJmgpPBubOrFMCo0oxn2OOCsLwug89zSYwwd8drnR
 c6WgKI6N2AJkOHxTenRO+WGtIpsGaUqstcTe0jbgGZV0Qbzo+otNQbxYi3Z22UL2fW1d
 XO4A==
X-Gm-Message-State: AOAM530NqTo06z9eUVzL8ITIf1qwItLQoZcQOa/bBNzJvAZ9tC0hOj1B
 pMnSuCwiQNyHbHKUCJHHMhGJ5iarfriRtYimHS8bFg==
X-Google-Smtp-Source: ABdhPJzBCKeQImyBz9RVwKOY2T54xBFQQK7yDRACZFnbHnlAKzoMjJH8dsFKhcz6QDIsGnLn67HJYp60Nwck4y9NKCk=
X-Received: by 2002:a17:906:bc56:: with SMTP id
 s22mr7649762ejv.760.1641981692859; 
 Wed, 12 Jan 2022 02:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-7-jose.exposito89@gmail.com>
In-Reply-To: <20211222090552.25972-7-jose.exposito89@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 12 Jan 2022 15:31:21 +0530
Message-ID: <CAMty3ZD_R+Tzab-qcWEcbTKVCKq3pNTi7Mr7903Vu9a9M5EefQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/stm: ltdc: Drop format_mod_supported function
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
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
Cc: marex@denx.de, mcoquelin.stm32@gmail.com, kernel@pengutronix.de,
 s.hauer@pengutronix.de, tzimmermann@suse.de, airlied@linux.ie,
 intel-gfx@lists.freedesktop.org, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yannick.fertre@foss.st.com, linux-imx@nxp.com, benjamin.gaignard@linaro.org,
 rodrigo.vivi@intel.com, dmitry.baryshkov@linaro.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 22, 2021 at 2:36 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gm=
ail.com> wrote:
>
> The "drm_plane_funcs.format_mod_supported" can be removed in favor of
> the default implementation.
>
> Signed-off-by: Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmail.com>
> ---

Reviewed-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Jagan Teki <jagan@amarulasolutions.com> # i.Core STM32MP1
