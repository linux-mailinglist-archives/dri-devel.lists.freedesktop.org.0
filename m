Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1019D6B8E2A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 10:09:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D9710E745;
	Tue, 14 Mar 2023 09:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085A910E73F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 09:09:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 36E05615F6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 09:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7629C433A7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 09:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678784973;
 bh=Qd1nbannETFomGm9GsEi5IHo2sm+rqQECwcrSVO7fWM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cFKlIlbC/CrTJrib31zUpsz8tpbzGYzp7DevTy8PmIlc6G/tyc0AR72eK9lymYbkv
 mkU7Z+oIImM5C1X68MX0Tot/L2CyTf72k2g6xdrdcdcIcXuiePMQrP3mX6aSZWJf9r
 8XwUqlw0u/K4ai4HeTUYLdLcBUNJcWZaVEC7cb66oA8ya0VYXuWhtsunHEO7C61QKk
 W/12QcnZqkX3BI7f4bmaCPoPQfnTT8TuZCq6/lwOvnGxluze4AcFnRIvuJIcVToMxw
 a0KPEu4K0Ur1koU4gkJ7LoidOJfR3EnSPDAyeOvsmQV/4yT1tZhXbDur+ANcdLRi1r
 9Y/f6u6pOMOQA==
Received: by mail-pj1-f43.google.com with SMTP id d13so4690087pjh.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 02:09:33 -0700 (PDT)
X-Gm-Message-State: AO0yUKW45y7LDImazp+ehcIfEhFt5LOu7QCMryfe+u5PwjsROk6+CS+8
 qCCNqrMPX+YrvSlr6tb9PKsdF/KwEV5PizQa+laJWg==
X-Google-Smtp-Source: AK7set+si7MgFQh/j5xb0hkTPa+NSWZ43KlwrS1MkYz8I7vgGZvOoyujmbLcfCD2KvKwJ7EWMVkRtgH8tg2ulqUtShI=
X-Received: by 2002:a17:90a:f10b:b0:23a:6ed6:7817 with SMTP id
 cc11-20020a17090af10b00b0023a6ed67817mr13505930pjb.5.1678784973394; Tue, 14
 Mar 2023 02:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230314055035.3731179-1-victor.liu@nxp.com>
In-Reply-To: <20230314055035.3731179-1-victor.liu@nxp.com>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 14 Mar 2023 10:09:22 +0100
X-Gmail-Original-Message-ID: <CAN6tsi4Qymz1aqGh6B9fB0Y2D9sNHwdq5uFRLAmkoOo4x7zmUA@mail.gmail.com>
Message-ID: <CAN6tsi4Qymz1aqGh6B9fB0Y2D9sNHwdq5uFRLAmkoOo4x7zmUA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: Fix returned array size name for
 atomic_get_input_bus_fmts kdoc
To: Liu Ying <victor.liu@nxp.com>
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
Cc: neil.armstrong@linaro.org, andrzej.hajda@intel.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 6:45=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> The returned array size for input formats is set through
> atomic_get_input_bus_fmts()'s 'num_input_fmts' argument, so use
> 'num_input_fmts' to represent the array size in the function's kdoc,
> not 'num_output_fmts'.
>
> Fixes: 91ea83306bfa ("drm/bridge: Fix the bridge kernel doc")
> Fixes: f32df58acc68 ("drm/bridge: Add the necessary bits to support bus f=
ormat negotiation")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v1->v2:
> * Correct Fixes tag format.
> * Copy DRM bridge driver maintainers.
> * Copy Boris.
>
>  include/drm/drm_bridge.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 42f86327b40a..bf964cdfb330 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -423,11 +423,11 @@ struct drm_bridge_funcs {
>          *
>          * The returned array must be allocated with kmalloc() and will b=
e
>          * freed by the caller. If the allocation fails, NULL should be
> -        * returned. num_output_fmts must be set to the returned array si=
ze.
> +        * returned. num_input_fmts must be set to the returned array siz=
e.
>          * Formats listed in the returned array should be listed in decre=
asing
>          * preference order (the core will try all formats until it finds=
 one
>          * that works). When the format is not supported NULL should be
> -        * returned and num_output_fmts should be set to 0.
> +        * returned and num_input_fmts should be set to 0.
>          *
>          * This method is called on all elements of the bridge chain as p=
art of
>          * the bus format negotiation process that happens in
> --
> 2.37.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
