Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 320BA1DA28C
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 22:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411F589E41;
	Tue, 19 May 2020 20:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DBD89E41
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 20:25:37 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id v192so182401vkd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 13:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cysi0CoNBsu9DhP/dMMLTlA0RNEElv2ZCbOSz0zvm1U=;
 b=uI4Z4CVhMiPZX6sByzDWE7ZFzcwaR+6wPM7HAlZLpc4hLaQ4012RvTFwesTownI+Bs
 j8kpFgg17yYeJhbuR+n9lnpXEr8tBTkj6xaVlmRt/vnllgXmZMEjSgfPTKetO2FaQWKV
 VpfnSqfteyu+lbYGOp0/zHd858vbvRHaXBwBj0zjkFWzpLd1kJUasVZITFtoF5ZCrWQM
 WWkmAvZbjeIvNQB/KpaTxpaJXWL8dLZnVrjus730ZRNma+mRrjL9fIc4Ch7v9O6ajCkz
 yf9hFXaO3YJoSejYY1qxdHiVuQc5W+IPxTYlsl+SjH65eJW13lwqZY7bAgRVnGWDjtf/
 5x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cysi0CoNBsu9DhP/dMMLTlA0RNEElv2ZCbOSz0zvm1U=;
 b=WWWdpqD7s9XMimUK7uWQz88rQEjzKFovT3uQHZh9mT2SmhTb09zoC/EjyRdlvLndmG
 sBN8pTIfP3yVRIwMZ+Z/sCJASxBYtweWi5ffkD7gfpPuIE/VYjOXjHCCikYdWexqhnPF
 5pqeBKLhSDoHuJ9ZIWVsv/0MozfiiH8UKRrn6h3ThvvMVpqy9LOG3bwtHOZOhI6yOkL4
 ibUCNbYBbRDlZ4RbjHWGj3ZS7Hj7PW2iwilT09AsWK9WnM+qCvKewqUV1bILAEiVmkQk
 SePux0i9ANhJn1JbxKLQDxTzshvpV3HamOg5LmnmwolMtAsw9sD4FNYrw0wAgIG2k55+
 5Kow==
X-Gm-Message-State: AOAM531m80GrL8a3Q3kZm0MMJ+/M1QfK0bI6DmgTP9Yfr/9JfPydSQaZ
 zGERMkwzfsVf3r9uIP3/lChGTtBJmgOyu3D1a1C+admm
X-Google-Smtp-Source: ABdhPJxzr/wYHStcp2W7Yr/aP7XG19XGEIQOjr8Kxa0FejuJCLcwi9VSK/A8W46CT4JeGy/ZYWZ/uyU4spAYVziWDD8=
X-Received: by 2002:a1f:bd96:: with SMTP id n144mr1516532vkf.6.1589919936532; 
 Tue, 19 May 2020 13:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200518201646.48312-1-dagmcr@gmail.com>
In-Reply-To: <20200518201646.48312-1-dagmcr@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 19 May 2020 21:22:42 +0100
Message-ID: <CACvgo50w90k18K8pEtiAv5foesEcJ9LuOyUzegY8Z9aidscwGw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix build error
To: Daniel Gomez <dagmcr@gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 May 2020 at 08:01, Daniel Gomez <dagmcr@gmail.com> wrote:
>
> Select DRM_KMS_HELPER dependency.
>
> Build error when DRM_KMS_HELPER is not selected:
>
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd48): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd50): undefined reference to `drm_atomic_helper_bridge_destroy_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd70): undefined reference to `drm_atomic_helper_bridge_reset'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xdc8): undefined reference to `drm_atomic_helper_connector_reset'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xde0): undefined reference to `drm_helper_probe_single_connector_modes'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe08): undefined reference to `drm_atomic_helper_connector_duplicate_state'
> drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe10): undefined reference to `drm_atomic_helper_connector_destroy_state'
>
> Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
Nicely spotted.
AFAICT the only way this ever worked is if people had
DRM_FBDEV_EMULATION, which is unset in your case.

Cc: <stable@vger.kernel.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

I suspect Laurent will pick this in due time.
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
