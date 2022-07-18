Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05455781BA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 14:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AACCAFAE7;
	Mon, 18 Jul 2022 12:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F55A7BA1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 12:11:04 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id tk8so9457768ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 05:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lsQO/Tw3Gh2Hr6DWnMzaSIS4emgYI0NAma/4NvXt1ac=;
 b=OjdyHa871+3F8Qk6i9mAEYAfjNBfT2nc6XwWa3L18CCAD2kTxtsV7qwt2Gp3dkjSIy
 o0x7MvpYhQzXT0TS6TFXyDKvVzQHOowv2JqHad1ZR6RRzeOYmLJtvxzitb25UgcuYkO8
 H66CEN0ZCYnTGDX76wtQMa/dGD2MLGT+OV5KB9o1BKdZDLlYAQ8JpiFJRbLpyadoMThY
 sWSp/eRZ1pL0P3LWLfGvgkoflxtzbDze9pferdrjjMYb1GteFQcBSJiURVABIG0HAEiq
 ymn5meeG7YndGE5EWaJ4qayJPVb5vnjXTxDA6V9CsDIfZ36P9VyNolSbRUKDlJcw7l3O
 yvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lsQO/Tw3Gh2Hr6DWnMzaSIS4emgYI0NAma/4NvXt1ac=;
 b=bxWHUVgXvdnu3R7RD4FYU+ZUAJhmxvWWW20PSAxvoXNFV1se7Ruh/ZaXpyWE8SU9PS
 wHSWcPkN57xNnrgc88b+W1MZ4nS51K3pMKEo+PU+cmk4uYDFWhdBhMfUgwqD9V/Po2Xe
 F1YTV4gVtZLZiOKVqEjjDqozo6vj98V/nrp91lhw+kebY/uSOZneGttEcYGmvx5G4JI7
 Dd/1qFPqDVTyf33bpDLenjji4Q39lGTX6PtfViCotsh1lABItJtmfI3nPo7nPStUTZec
 uZp9hgvJTQx0qt1/CFcs41xKNRlaZ83UQS+eVqS7pZM/cFF6TS24lpnOF5fvDY2mbSP/
 IOwg==
X-Gm-Message-State: AJIora+udkNE4Y4xEk89k6TJy9Jo+DaLugA8GQteYSlzK8NU2v/0Wewr
 1x3tYX/Ptl6C4oMsf+8YEnop94wosvlUuLffz6vNPw==
X-Google-Smtp-Source: AGRyM1ursz8J1IZJUj1pCpQAmiHhHe66RTZ11OOW/dowBMB/UBnZ9mVv5CK8Hj5CDMi85kK7sm7vuZHD93sxeV50uKA=
X-Received: by 2002:a17:907:2d93:b0:72b:60a0:6b2e with SMTP id
 gt19-20020a1709072d9300b0072b60a06b2emr25466778ejc.487.1658146263412; Mon, 18
 Jul 2022 05:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220707021143.306926-1-windhl@126.com>
In-Reply-To: <20220707021143.306926-1-windhl@126.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 18 Jul 2022 14:10:52 +0200
Message-ID: <CAG3jFyvSXuamEg-8aZ7DhEGW1a0soQp53p-3jbVxXN30QdJDRg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge:tc358767: Add of_node_put() when breaking out
 of loop
To: Liang He <windhl@126.com>
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
Cc: jonas@kwiboo.se, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Can you use the norma commitl title prefix "drm/bridge: tc358767: "

On Thu, 7 Jul 2022 at 04:45, Liang He <windhl@126.com> wrote:
>
> In tc_probe_bridge_endpoint(), we should call of_node_put() when
> breaking out of the for_each_endpoint_of_node() which will automatically
> increase and decrease the refcount.
>
> Fixes: 71f7d9c03118 ("drm/bridge: tc358767: Detect bridge mode from connected endpoints in DT")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 485717c8f0b4..7362a1a7a7df 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1986,8 +1986,10 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
>
>         for_each_endpoint_of_node(dev->of_node, node) {
>                 of_graph_parse_endpoint(node, &endpoint);
> -               if (endpoint.port > 2)
> +               if (endpoint.port > 2) {
> +                       of_node_put(node);
>                         return -EINVAL;
> +               }
>
>                 mode |= BIT(endpoint.port);
>         }
> --
> 2.25.1
>

Please resend a v2 with the above change.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
