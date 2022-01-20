Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21617494D1C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6941810E70A;
	Thu, 20 Jan 2022 11:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F60C10E6E5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:37:59 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 a10-20020a9d260a000000b005991bd6ae3eso7137626otb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3AEP3n86qrRT0CWA9xWkTT4oPgLT5Dg8J2aIKheyYRw=;
 b=bm+tBZ9hQXuKzRclihZx/q0WHctVogb8PlEpMFwPV4uE8k5bHH3uM8xPaziTcHtIyX
 M7LUhprxNO93EI9P7Vexu9rylB90oIi9ajLkqG+riBQCUgtLddw/AZESFg55jbIt560Z
 +5FqvDkb+uu/POVaRX1GxgenwvCjm2+6lgQeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3AEP3n86qrRT0CWA9xWkTT4oPgLT5Dg8J2aIKheyYRw=;
 b=C/CzPhML3clT76MouU7GMRakEps5LnVCM8P4qxAwbAEkzSUJe0npPDzRclnGHh3OcV
 snGJ7aVnLi8lFLCh0UST7V/11rw7CgBAikhGQQWEK/cFO9cfvKtu20mzWV2WrEOoF38t
 0kBGXQrTt4iXenSwnZerdKPjr+h4r5BYEY3ykq+NqbC8I02sIfPI0cwTJl5o+2vjKvF3
 gMyCtJ78/LVYFiFDSSiPPj4a6VaeTQwPNLgMUp5prpWUdgUPGGL67G5uNxTzKsVsRSeM
 VgqhuteaOCWPbqPLIXPStDl+MjDD/A5JsiDNs5FSGVF3qTFTKVRxr/n0S9cMhKcmi3gh
 MKbw==
X-Gm-Message-State: AOAM533sySjW6awmWYWhDEW9bvapYvAKtjIJDWad0xhleuBaNLxu9Ij/
 c1QtmR1kE8b4tWJQMuWZ67LvsCAQzqAxtMk9FGa6DJYt9Yg=
X-Google-Smtp-Source: ABdhPJwiTQi00qJXN52XBMUzMeX1OVN7uw9mNus8WPhS4x+FzxbJWfbXglouxPBTruCqLotN3LdLk3618q+hdDd8TzA=
X-Received: by 2002:a05:6830:2704:: with SMTP id
 j4mr15770268otu.323.1642678678305; 
 Thu, 20 Jan 2022 03:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20220120113647.22484-1-tzimmermann@suse.de>
In-Reply-To: <20220120113647.22484-1-tzimmermann@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 20 Jan 2022 12:37:47 +0100
Message-ID: <CAKMK7uGXDfF-kJ=qge=UHmY_Z2chP24PTHZHMywLjuCSqw93aw@mail.gmail.com>
Subject: Re: [PATCH] drm: Update docs after moving DisplayPort helpers around
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 12:36 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> DRM's DisplayPort helpers moved into the subdirectory dp/. Change
> the documentation accordingly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: adb9d5a2cc77 ("drm/dp: Move DisplayPort helpers into separate helper module")
> Reported-by: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/drm-kms-helpers.rst | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 5bb55ec1b9b5..c3ce91eecbc1 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -232,34 +232,34 @@ HDCP Helper Functions Reference
>  Display Port Helper Functions Reference
>  =======================================
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_helper.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp.c
>     :doc: dp helpers
>
> -.. kernel-doc:: include/drm/drm_dp_helper.h
> +.. kernel-doc:: include/drm/dp/drm_dp_helper.h
>     :internal:
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_helper.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp.c
>     :export:
>
>  Display Port CEC Helper Functions Reference
>  ===========================================
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_cec.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_cec.c
>     :doc: dp cec helpers
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_cec.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_cec.c
>     :export:
>
>  Display Port Dual Mode Adaptor Helper Functions Reference
>  =========================================================
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_dual_mode_helper.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
>     :doc: dp dual mode helpers
>
> -.. kernel-doc:: include/drm/drm_dp_dual_mode_helper.h
> +.. kernel-doc:: include/drm/dp/drm_dp_dual_mode_helper.h
>     :internal:
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_dual_mode_helper.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_dual_mode_helper.c
>     :export:
>
>  Display Port MST Helpers
> @@ -268,19 +268,19 @@ Display Port MST Helpers
>  Overview
>  --------
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
>     :doc: dp mst helper
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
>     :doc: Branch device and port refcounting
>
>  Functions Reference
>  -------------------
>
> -.. kernel-doc:: include/drm/drm_dp_mst_helper.h
> +.. kernel-doc:: include/drm/dp/drm_dp_mst_helper.h
>     :internal:
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
>     :export:
>
>  Topology Lifetime Internals
> @@ -289,7 +289,7 @@ Topology Lifetime Internals
>  These functions aren't exported to drivers, but are documented here to help make
>  the MST topology helpers easier to understand
>
> -.. kernel-doc:: drivers/gpu/drm/drm_dp_mst_topology.c
> +.. kernel-doc:: drivers/gpu/drm/dp/drm_dp_mst_topology.c
>     :functions: drm_dp_mst_topology_try_get_mstb drm_dp_mst_topology_get_mstb
>                 drm_dp_mst_topology_put_mstb
>                 drm_dp_mst_topology_try_get_port drm_dp_mst_topology_get_port
> --
> 2.34.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
