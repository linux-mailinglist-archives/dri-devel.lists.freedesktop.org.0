Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C036B341F57
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 15:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3166EA1A;
	Fri, 19 Mar 2021 14:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B78B6EA1A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 14:28:26 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id b184so6015790pfa.11
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 07:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wB7XW1expiEEiA0z4q1J+zFtd6n/h701jYh9DH52x/g=;
 b=rfMY38MqhnK5WXT7hN0NFVNWJw09ySqEl6rahFHBok2eKiGSQ2SNtxC0jMRggFiFlp
 YNwZt7MGTpigDLIAQKlPZmqoBKtAhhEZfliE5yoKKwNqonCgvMFh7k/B/fMmSMvqGIKr
 5o8ELS87A24SQYN48yn1Kk4x38DeIrzUpQ1vxEuFDiJufMUpYAWSvdq2f2AhwA7AksfV
 bzKZSInC5qkZPpyyM0fxBaDgRizOcLYb/NaHoS9F2+0iegoTshz2yU6lxf5+VEoO5kuz
 hLBfKtTo5O9LWVFySPV8SYcnOJrIxqA1hBYp3/kGnJNXZaR/mMgvqz0ywTpGOA39Y6hJ
 Z+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wB7XW1expiEEiA0z4q1J+zFtd6n/h701jYh9DH52x/g=;
 b=cwEd2HbthaZBvdE+MqBwGLqgCgckZNxKnGNU6PhTEOsspvQj1pAMqz0T/mZkuZ2nBk
 +9YOYNIYk6tupjTpnaKACRHEl5NIHG7Dm3jWPpj+c3uKxX139imJfqda5ZazUnpgl/Sz
 PdXRqpQFoe9NCMyR+v4EbhPUzWSFXUqh/vNJCNmlybNsd/6H+vqeMCRgDhYNu4v8kE0b
 24Nsy0YFKqEYIzDd25pJ+3vcnXtiRWG1fDW4uMJgRV5Hk78mUTQWjcBzqMij0KmYthZN
 GsqRa6nzJ/h4EH6A1xn1P9h14Db0/22WBQExXLecoYWoK+3Yxq0s6ecnnrBx+nMuatLt
 R51Q==
X-Gm-Message-State: AOAM5313Wk8OuQMn7JlLsJ8iVuu1Ocun6SNluPRD+R/zDAsLZiyTMk4T
 lIFREifbuCAdcq2j3lL06z6hDVeuJjhhA1Hkw0L+qA==
X-Google-Smtp-Source: ABdhPJyE0Wk9tAliN/2sKNin+z7nx+NeyBf7s/4rymph1mvk13Artsko/VpzzorcMg+3DPqfuz4cf4SD2HeAcfTrsYc=
X-Received: by 2002:a63:2321:: with SMTP id j33mr11536620pgj.120.1616164106191; 
 Fri, 19 Mar 2021 07:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210219215326.2227596-1-lyude@redhat.com>
 <20210219215326.2227596-8-lyude@redhat.com>
In-Reply-To: <20210219215326.2227596-8-lyude@redhat.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 19 Mar 2021 15:28:15 +0100
Message-ID: <CAG3jFyt10Z_MVvvXyBfYFrN7_FQCOUywfLNXZbei2c=1DxvqhA@mail.gmail.com>
Subject: Re: [PATCH 07/30] drm/bridge/analogix/anx78xx: Add missing
 drm_dp_aux_unregister() call
To: Lyude Paul <lyude@redhat.com>
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
Cc: Torsten Duwe <duwe@lst.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Lyude,

Thanks for the patch, it looks good to me.

Reviewed-by: Robert Foss <robert.foss@linaro.org>

On Fri, 19 Feb 2021 at 22:56, Lyude Paul <lyude@redhat.com> wrote:
>
> Surprisingly, this bridge actually registers it's AUX adapter at the
> correct time already. Nice job! However, it does forget to actually
> unregister the AUX adapter, so let's add a bridge function to handle that.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 81debd02c169..ec4607dc01eb 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -942,6 +942,11 @@ static int anx78xx_bridge_attach(struct drm_bridge *bridge,
>         return 0;
>  }
>
> +static void anx78xx_bridge_detach(struct drm_bridge *bridge)
> +{
> +       drm_dp_aux_unregister(&bridge_to_anx78xx(bridge)->aux);
> +}
> +
>  static enum drm_mode_status
>  anx78xx_bridge_mode_valid(struct drm_bridge *bridge,
>                           const struct drm_display_info *info,
> @@ -1013,6 +1018,7 @@ static void anx78xx_bridge_enable(struct drm_bridge *bridge)
>
>  static const struct drm_bridge_funcs anx78xx_bridge_funcs = {
>         .attach = anx78xx_bridge_attach,
> +       .detach = anx78xx_bridge_detach,
>         .mode_valid = anx78xx_bridge_mode_valid,
>         .disable = anx78xx_bridge_disable,
>         .mode_set = anx78xx_bridge_mode_set,
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
