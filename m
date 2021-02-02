Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC9830D4E3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047A86EA03;
	Wed,  3 Feb 2021 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3203C6E08E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 23:25:04 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id df22so8905347edb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Feb 2021 15:25:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lagfreegames.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xE2EhQE7qr1T56mKx4U2nzoMU82bVzA5Q7RBjAWlWmk=;
 b=H/tkCIM++E+tp7Wr0Id4M0B3oqXjtiel74rj0C48W+DoMD91Per5+ubMYx0gNp8aPq
 DFRZ0OeT/NVLmFrOm+nb+xbFypMGY04b94F0fGlOIwNU5QWyImI2Ys9Xyvsyoo9JJxZD
 xPbh5B/u3dBsEXhdODqhRkIN2lRWT+fL2Uuj9VXiGV6dbII9LZuI31LQmJunxTlPNDGz
 Gj0HcscG9x6AjBaFEdC14aV7QJOFkPjly/Bi2B42DDnzUCzimTye/caCJvHZTVxyivyk
 gmIhuUNpHuFRFGFqHMG6wg7IVkgJBSM7DposUwWoBMUgSHAZ4lgLCdBwo4oqJuKWWrRS
 JfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xE2EhQE7qr1T56mKx4U2nzoMU82bVzA5Q7RBjAWlWmk=;
 b=ibaAcSobLgMSVH05NqUWvIWca8XqOGLIBno8Yn33AtxXsv1AN6/kFKdiqC6K4HGu7z
 XdvI4JdEQOBkjliEGoYiwzNuqmHUo8n22QT3fJ14ekPEGCQezTWXSMRI6d4MyqM7kcEm
 Br3CaNbOGaLeTPddIfR66mJG/xabftU3pB9vQODEIJ3T7AedyFNHI0uyEiy4akjP+Viz
 ZYPtX2YoHiTSsgOCmkncfG8tl00ZR4nC49iHxJ7km7shH5pNEWpDR84UyEnq0qpTuVzw
 Uvv0KVP2XcqSRjsNlX1onBYe0eCKA3m6WF+zlH/JdNpJD/OBu80m2noVR0IydjnkG1wL
 v2fg==
X-Gm-Message-State: AOAM531lJfVv+xzzqYOskX+edjJ1G/hM7AnCrDIXIQI5zoXm6QjbB6/p
 rNLX7KQ2GEZp7Lc1gW4aFmpPYLudjHNXgR9J36CWXQ==
X-Google-Smtp-Source: ABdhPJzTFbwQdSXBzUzk+ptvfbN472UPRCdvsn/NNZRbX96Gn+fL0L5sOn7fsLwJS0mpBBx+b6jTJKg6WaBfMlDX+og=
X-Received: by 2002:a05:6402:1291:: with SMTP id
 w17mr456888edv.112.1612308302793; 
 Tue, 02 Feb 2021 15:25:02 -0800 (PST)
MIME-Version: 1.0
References: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
In-Reply-To: <20210202224704.2794318-1-emil.l.velikov@gmail.com>
From: James Park <james.park@lagfreegames.com>
Date: Tue, 2 Feb 2021 15:24:51 -0800
Message-ID: <CABjik9dde-HCWBsfwxjD+jTKaoy-YxDeSObmH7X5rSzNHoA_qA@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
To: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:13:07 +0000
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 2, 2021 at 2:47 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Currently, the drm_fourcc.h header depends on drm.h for __u32 and __u64.
> At the same time drm.h pulls a lot of unneeded symbols.
>
> Add new guard DRM_FOURCC_STANDALONE, which when set will use local
> declaration of said symbols.
>
> When used on linux - this is a trivial but only when building in strict c99
> mode. One is welcome to ignore the warning, silence it or use c11. If neither
> of the three is an option, then do _not_  set the new guard.
>
> Cc: James Park <james.park@lagfreegames.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
> As mentioned before - there's little point in having yet another header
> since keeping those in sync has been a PITA in the past.
> ---
>  include/uapi/drm/drm_fourcc.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 6f0628eb13a6..c1522902f6c9 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -24,7 +24,26 @@
>  #ifndef DRM_FOURCC_H
>  #define DRM_FOURCC_H
>
> +/*
> + * Define DRM_FOURCC_STANDALONE you're interested only FOURCC and do not want
> + * to pull drm.h into your application.
> + */
> +#ifdef DRM_FOURCC_STANDALONE
> +#if defined(__linux__)
> +
> +#include <linux/types.h>
> +
> +#else /* One of the BSDs */
> +
> +#include <stdint.h>
> +typedef uint32_t __u32;
> +typedef uint64_t __u64;
> +
> +#endif /* __linux __ */
> +
> +#else
>  #include "drm.h"
> +#endif /* DRM_FOURCC_STANDALONE */
>
>  #if defined(__cplusplus)
>  extern "C" {
> --
> 2.30.0
>

One of my earlier solutions similarly would have forced people to deal
with duplicate typedefs, and we arrived at the current solution
because we didn't want to burden anyone with that. I feel like having
the extra include-guarded file is the lesser of evils. If it helps the
patch go through, then I'd drop my preference but I really think the
current solution is better.

- James
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
