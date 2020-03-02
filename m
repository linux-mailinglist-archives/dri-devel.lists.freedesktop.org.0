Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7ED7176631
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 22:42:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7D989DFB;
	Mon,  2 Mar 2020 21:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A4D89CE3;
 Mon,  2 Mar 2020 21:42:23 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 6so707154wmi.5;
 Mon, 02 Mar 2020 13:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gtj1VeOQBAMY54K2WK/HQP2VkyPeMrUejjMW6DQ3/yE=;
 b=U4pPnyKxgdpSZC6nRnyjg8fU1JAKea40JYKqyKlryD89Ewkn1WGCxtbiIVS2+/K2cr
 W7Ry66hXDi6X0pxqXfKKSBydESWwiP/LgepRxqQe7kTLi+bc5HtFhqQdjAs4NSgRoKC5
 RdqpRTPHHGgD89n32wqqnciTjRjJ2ggN+J+MLlSSEagX1nHZf6AKnPyai/IB5vnN+ZZQ
 HRUtFSi3Aa0W157cZRaSn75tqpWOwBxCOY8ga4YbeQ5v7JOTIeiPYNHaKOEFXWg7rUGV
 lbbCx+lI4EjJcQspD4aCu8WZbRZxzodg/PPh1QAe4dS7bppx192u3J7EFgpiq2rGO9ZP
 zstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gtj1VeOQBAMY54K2WK/HQP2VkyPeMrUejjMW6DQ3/yE=;
 b=IJck7sjpynH+iCOCIGF8EGBiGY6ygseZIzE2NOsb68dBF2vQon6OrwTiiJJDJLiD41
 EYWBUop6iW3m5rkkWAwo84Ec27H6vYwSMMpoqrXG/j+D055DE/7zKI1bxIy5Af/N311I
 +Ucg40lQAyz0gPVWVNYIIMdSJ1yUbFjfGHzpCrokoz1Qsdq7r7p1D2W372NuBYU5bj4c
 f2ATo+LWkZ+PFOnQwLmu3xbdTHZzRR6QYiaQ5XAvJaaQ7wtYJNZXR9SXMEKy11pVKU0G
 ajKYQg3C+SbtbH8bLPWFYtcH4c8q2RdFUCQYZJbJhqaEKq1V+SE3AASUR5HpfVm2XlXw
 ef6Q==
X-Gm-Message-State: ANhLgQ1XQFYO0xh/CDqczjyfH9+5tX8CTx7bkP2F3U0saAbwwjGnPRKZ
 BOlk4zEtftGGN0slz5GSCECbkyiFPtz+6UEnGqM=
X-Google-Smtp-Source: ADFU+vuboFvf+6nB6fSXvPJN6jcdUsV/EeApNESli/UtIgKfpP5g1vVzBX/Y1vbaPEB2PJb4s8qzMqxfwxIpHeoFdow=
X-Received: by 2002:a05:600c:218b:: with SMTP id
 e11mr422306wme.56.1583185342202; 
 Mon, 02 Mar 2020 13:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-5-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200302125649.61443-5-pankaj.laxminarayan.bharadiya@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Mar 2020 16:42:11 -0500
Message-ID: <CADnq5_NmqqRVnOfARSo2+B+523SaZCs3Brgv1huFA1YDxJ1aHQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm/i915/display: Remove drm_fb_helper_{add,
 remove}_one_connector calls
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 2, 2020 at 8:09 AM Pankaj Bharadiya
<pankaj.laxminarayan.bharadiya@intel.com> wrote:
>
> drm_fb_helper_{add,remove}_one_connector() are dummy functions now
> and serve no purpose. Hence remove their calls.
>
> This is the preparatory step for removing the
> drm_fb_helper_{add,remove}_one_connector() functions from
> drm_fb_helper.h
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index d7bfa7c350e9..b15404a3b1ca 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -721,27 +721,15 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>
>  static void intel_dp_register_mst_connector(struct drm_connector *connector)
>  {
> -       struct drm_i915_private *dev_priv = to_i915(connector->dev);
> -
> -       if (dev_priv->fbdev)
> -               drm_fb_helper_add_one_connector(&dev_priv->fbdev->helper,
> -                                               connector);
> -
>         drm_connector_register(connector);
>  }
>
>  static void intel_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
>                                            struct drm_connector *connector)
>  {
> -       struct drm_i915_private *dev_priv = to_i915(connector->dev);
> -
>         DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id, connector->name);
>         drm_connector_unregister(connector);
>
> -       if (dev_priv->fbdev)
> -               drm_fb_helper_remove_one_connector(&dev_priv->fbdev->helper,
> -                                                  connector);
> -
>         drm_connector_put(connector);
>  }
>
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
