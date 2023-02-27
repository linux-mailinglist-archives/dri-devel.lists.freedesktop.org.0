Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A9A6A441E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 15:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9604210E40E;
	Mon, 27 Feb 2023 14:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832B610E40E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 14:18:35 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id o6so11200632vsq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 06:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0j33WLUX22jY0kRqHnT7c89EEsJ+L4pa+T+QCCmpPFw=;
 b=aOcz0qqpahIe3gWz4bgbPKQW7vG2G8AAvJAksvnK4suQhIMMJ1n8omzHzYKIVzecFJ
 7x45c6IpheePGZwQOp625ieovfcS92nh84QDyAS7OYT1mYPgpmdilO9nwd6JvvpZBq4J
 NuY49VrLOTubDvzBVZhrb96E/mUkIzR8aLQsV/D+lchWUlBXV7y1OJosMKsWz5iV/efA
 YJbLYUeS9iddE5h8gGBQI2xKsI/4HWKOzTdCSclxOetJ4GtIic1F7qK0ryeApa9PMUbF
 srQ8okfIRqIJzePTe07Xya+CLQirS2ev2L/57BynH4Wqau/vsJqTD3/EIyVcLXAauf7v
 4YmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0j33WLUX22jY0kRqHnT7c89EEsJ+L4pa+T+QCCmpPFw=;
 b=ez62RqQ/qe6RfJhoP4wahJS8WiyEHh+k++AYK8Oo6D+BFOadv1XgzFS3TG7HxSP4wg
 b4eueg12p3Ysz3tr8QkSs0GLeG5SHFbwMRSL8rTuJ2Tdl2AvDpCDACVmCFRZ0uG88fXk
 KfDSR9lH3PjJASKWC4URiuOIexC5jyrtLmuUzviEWcE+llhJOOylXzB8r+mUvTJVqAkM
 9YSEk7jxxHbE/603rZVdbwg8kYtUPiCuZOJJP+NbR4hNZYjNtBBsnTXSUB1qEVX1rff6
 5r0VECtZz6S8E+lVY3UbFmb4qECpjTf7L7ehUgNHMJbmsl6NWObIVVNNogOCB5nIfWbw
 7UvQ==
X-Gm-Message-State: AO0yUKV4cALXLfi6p1VhQxgnh8jtOdWEU05uFF/nadHDS8hII7IIduta
 9CHV/8edSLAIKTm4JSmLNgcJzg3K24oOvHkMgZ6tIg==
X-Google-Smtp-Source: AK7set8YWna5laoZgmeO3VDHPiSsZc91nFUlcj2HWII75xF+J2LyJhKq0BRWt7ob4YT7fsV1qE4DZxHU2SI5TsnBPzc=
X-Received: by 2002:ab0:5550:0:b0:68a:a9d:13f5 with SMTP id
 u16-20020ab05550000000b0068a0a9d13f5mr10799053uaa.1.1677507514499; Mon, 27
 Feb 2023 06:18:34 -0800 (PST)
MIME-Version: 1.0
References: <20230227122108.117279-1-contact@emersion.fr>
In-Reply-To: <20230227122108.117279-1-contact@emersion.fr>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 27 Feb 2023 14:18:18 +0000
Message-ID: <CAPY8ntCf_3AQyHwqcZ2NQr_3+uqShVKAbJqaa13WyrRWpc0udA@mail.gmail.com>
Subject: Re: [PATCH] drm: document TV margin properties
To: Simon Ser <contact@emersion.fr>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Feb 2023 at 12:21, Simon Ser <contact@emersion.fr> wrote:
>
> Add docs for "{left,right,top,bottom} margin" properties.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

This certainly matches my understanding of the properties. Thanks.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/drm_connector.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 9d0250c28e9b..65a586680940 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1590,10 +1590,6 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector=
_property);
>
>  /*
>   * TODO: Document the properties:
> - *   - left margin
> - *   - right margin
> - *   - top margin
> - *   - bottom margin
>   *   - brightness
>   *   - contrast
>   *   - flicker reduction
> @@ -1651,6 +1647,16 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subconnector=
_property);
>   *
>   *     Drivers can set up this property by calling
>   *     drm_mode_create_tv_properties().
> + *
> + * left margin, right margin, top margin, bottom margin:
> + *     Add margins to the connector's viewport.
> + *
> + *     The value is the size in pixels of the black border which will be
> + *     added. The attached CRTC's content will be scaled to fill the who=
le
> + *     area inside the margin.
> + *
> + *     Drivers can set up these properties by calling
> + *     drm_mode_create_tv_margin_properties().
>   */
>
>  /**
> --
> 2.39.2
>
>
