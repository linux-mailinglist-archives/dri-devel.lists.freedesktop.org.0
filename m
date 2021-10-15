Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FDE42FDD4
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 00:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179488825B;
	Fri, 15 Oct 2021 22:07:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CBC6E3F5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 22:07:16 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id w19so43136321edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 15:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KEPuILzn8A/tb4FgOT0nL/Q0aVprlx+TzeMfH0xSkng=;
 b=ItI+9yo9glXHT4IvBd+1RhAfsc5PnfbvkeLAGL38PcdKsXZ0kscSOA0bux1h24L5AJ
 R9R923qh5I98RpB26cp7oC8SgLgt1VkEEMJ9v5mrRWLB1BeDwW6nscU9ilENcIYSxyFR
 l2TYYmwAaRLibcHsp/u7Xxl6vz6eI4BCJROzsYU+NAe8Dwf/SOSko4OM57bipfymsKl7
 8LHRUcAlVr/YJb0tQpfu1BQjLPZM9X+9chhaob3Um5k9LGik3zZIiHquzNUWrpSIxi9o
 fYAHJ4eVoB+YkbDPLh5p/XlwO8l6U1zuZXxM05N13qkTxXFg0p1oGGvGUDgxLspsPxLx
 EwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KEPuILzn8A/tb4FgOT0nL/Q0aVprlx+TzeMfH0xSkng=;
 b=Bfz0JM7wKqbJGCzvmc3eAlIufIWKZLWcOByZnWbrwgksD/4h8npqXCsIL6D5elfvM4
 WbSWs7JvrRmhUeXE2np2dJyKLWRQHugamLEJZcV7j9Yd8yx2f+rA2OVSKdIkgUQnY/wy
 oXODxeLJGsRDyVyZ5j2Sb8IwoaBkGeoIbHZZirypWMYYCPDXcUU7ELPdRiXmNnqwH0fK
 FJUgzkNn1lj8A28O50YKmfe1nK9CyCLdc3IE4rO9lTc9DPbFibhQXiqvC1HHO04HsGPH
 KAAuxptwTydys9FVGU6USyS13tPiJOITnUZtBDdHKoE2N2tasFlZE/VReSpKd05wt9zh
 JtXg==
X-Gm-Message-State: AOAM532fgwGbRpT7Fuk2AE+mE0OzvL4psZe3k0+R+mlJNe2NTZBWPS7r
 FWw318ksYfxXffbIPc5I1xaiu0TH4GsXwVp1370=
X-Google-Smtp-Source: ABdhPJz1ai8dR1OFBDh7IzSW9u4hxzvcUqM2tgq5qQyCsHsN1/wnXC4Qz2Hcy2NMTPIAjsBrcoY7rEAFdcOFm9FB9KQ=
X-Received: by 2002:aa7:cb41:: with SMTP id w1mr21546574edt.327.1634335634903; 
 Fri, 15 Oct 2021 15:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211015141107.2430800-1-narmstrong@baylibre.com>
 <20211015141107.2430800-5-narmstrong@baylibre.com>
In-Reply-To: <20211015141107.2430800-5-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 16 Oct 2021 00:07:04 +0200
Message-ID: <CAFBinCB_Z+errWL4C-K3WrPu2B7gxr3NRFsF3_Xoy48XDsOb-A@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/meson: encoder_hdmi: switch to bridge
 DRM_BRIDGE_ATTACH_NO_CONNECTOR
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

On Fri, Oct 15, 2021 at 4:11 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This implements the necessary change to no more use the embedded
> connector in dw-hdmi and use the dedicated bridge connector driver
> by passing DRM_BRIDGE_ATTACH_NO_CONNECTOR to the bridge attach call.
>
> The necessary connector properties are added to handle the same
> functionalities as the embedded dw-hdmi connector, i.e. the HDR
> metadata, the CEC notifier & other flags.
>
> The dw-hdmi output_port is set to 1 in order to look for a connector
> next bridge in order to get DRM_BRIDGE_ATTACH_NO_CONNECTOR working.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
another great piece which helps a lot with HDMI support for the 32-bit SoCs!
I have one question below - but regardless of the answer there this gets my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       pdev = of_find_device_by_node(remote);
I am wondering if we should use something like:
    encoder_hdmi->cec_notifier_pdev

> +       if (pdev) {
> +               struct cec_connector_info conn_info;
> +               struct cec_notifier *notifier;
> +
> +               cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
> +
> +               notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
> +               if (!notifier)
> +                       return -ENOMEM;
> +
> +               meson_encoder_hdmi->cec_notifier = notifier;
> +       }
and then move this logic to meson_encoder_hdmi_attach()
This would be important if .detach() and .attach() can be called
multiple times (for example during suspend and resume). But I am not
sure if that's a supported use-case.


Best regards,
Martin
