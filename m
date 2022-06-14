Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC1654B74C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 19:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00B910E87D;
	Tue, 14 Jun 2022 17:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B1110E87D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 17:04:56 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id y19so18410907ejq.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xzhLv9G6CaeSeCKFJO7N9j7SHkabcgH60j1lb89MxMI=;
 b=lfKKKCgx9I3YBLNpmg1jBXVVsz2rKVYta3PQAd8iskRng4cNe9qIdXaCCYthyAfKU2
 hCEC4ROiFCBEqhRrnaVv/6t0QBqG3wANPG2i2dcltVLJU2FvoCTI+5xa3CQ3l4R3zXcy
 1rRS7wb0DwF6mAYKE+3NPPL6/fd2uoqQpiN3pD61dAgxvksFvRZcXtRpEggK0Mnuik0I
 tG0AUpaoW3VgcSCe86c2NSZ4Jiiah4eCgxQmodMsv2v2BW9LE0yt7KKJeCgOvecPd+L4
 yL5SCTaLL7RRr01f4ktVQudBEKLBNACsB7F+e5pnnXuGuCyKA+bhT1XUcveO9DoL4XOK
 URRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xzhLv9G6CaeSeCKFJO7N9j7SHkabcgH60j1lb89MxMI=;
 b=a9d+Vhiss8yFdpJ0VbcBG0e+3xBoOJyXXyB9QkL2lwAeB8NRtd9gDMt8kOmVq/5Q8l
 fPay3jKpwt8QdtvkxkaKfuikpxYHwUEvlrnffBe0pyvPb1hsHdMzkAddgzpzdh3CgorK
 Es0sgR6HWITE2eoWYN+YHHdR+iIwI9e/bXdv3exde50nliI7J6zqYSS24MzIrdNv6+qM
 7mM6KeevJy+jMTEJGnF3lWcdnz208RK+wgjMcYwZ9OM9w0QSxRf8rQL3fxbJPboeZ+IK
 pP96FLj8RUATvLNObPRiDZvKRpbMYkdufULdUNH03dYZfXExROl+5Ibs8Bt3wXFDBmU2
 6Dkw==
X-Gm-Message-State: AOAM5334dpHpxL/6KiGWFw9JrWVhEq0v2DjN1vAvNvJHkJbW0jVFdZyy
 Swr85KCryOX/sJ1RC1Hj5V4rad1zCfvJOa93vSaIlA==
X-Google-Smtp-Source: ABdhPJxHXecqff3yA0YqHQdgoeEPx/+jbWGqCeiLcoW3mvPKbk6T1XRdV8tCTiCu7vKAqeZwl0ziB2e8xF6OiHagBpM=
X-Received: by 2002:a17:906:649b:b0:711:fde7:be43 with SMTP id
 e27-20020a170906649b00b00711fde7be43mr5357488ejm.294.1655226295217; Tue, 14
 Jun 2022 10:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-31-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-31-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 14 Jun 2022 18:04:39 +0100
Message-ID: <CAPY8ntBM-F0F=vipCw=LRv+J_dHLTHzUdBA9_ks8R0S04My_PA@mail.gmail.com>
Subject: Re: [PATCH 30/64] drm/vc4: dsi: Switch to DRM-managed encoder
 initialization
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jun 2022 at 10:30, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The current code will call drm_encoder_cleanup() when the device is
> unbound. However, by then, there might still be some references held to
> that encoder, including by the userspace that might still have the DRM
> device open.
>
> Let's switch to a DRM-managed initialization to clean up after ourselves
> only once the DRM device has been last closed.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index dbb3f6fb39b4..bcaf87b43cbd 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1599,7 +1599,10 @@ static int vc4_dsi_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 return ret;
>
> -       drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
> +       ret = drmm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_DSI);
> +       if (ret)
> +               return ret;
> +
>         drm_encoder_helper_add(encoder, &vc4_dsi_encoder_helper_funcs);
>
>         ret = drm_bridge_attach(encoder, dsi->bridge, NULL, 0);
> @@ -1632,7 +1635,6 @@ static void vc4_dsi_unbind(struct device *dev, struct device *master,
>          * normally.
>          */
>         list_splice_init(&dsi->bridge_chain, &encoder->bridge_chain);
> -       drm_encoder_cleanup(encoder);
>  }
>
>  static const struct component_ops vc4_dsi_ops = {
> --
> 2.36.1
>
