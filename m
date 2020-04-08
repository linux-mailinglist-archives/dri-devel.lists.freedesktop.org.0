Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794261A2947
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9646EABB;
	Wed,  8 Apr 2020 19:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DE26EABA;
 Wed,  8 Apr 2020 19:17:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f20so658375wmh.3;
 Wed, 08 Apr 2020 12:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+6JzrZjnSiXEa9+7zWd+dDvEone33rVhyL+hGBTdC80=;
 b=hRmrWvcKKjoy8psvsbRSOoTPjT/LbPaDB5n94pF6pMwCEgeLaWJdf/aziAZXVCsFUt
 vf20mJBTzLgCgHQhkIUVzZtksdRYr2o8GFAbAUjwbQ+CcFaN5/Hk6VTY4wKNxV7byM5i
 9WPXCoOKEPT9Uw5qOyeHM+iobynnZpn8nHMPNFeTIt9ItCmmkszBFyZG3Ej4/uF5R4e+
 rAuLI8tA+6JUM2f+MVawq0VwbXBZF6BmxgKIaADMsZhAt4A6XCIJkiwX4C3joV+nERkc
 fYm1RCNJPbV0cYAeSenR5KfPn89eTA5k7qYRRPXSD7dCVRamlvyXACaKo0w4gFCwEU+q
 ZNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+6JzrZjnSiXEa9+7zWd+dDvEone33rVhyL+hGBTdC80=;
 b=IV//SQ6RzVlgGIf71fJwEA+KTE9ZeEaxwQjOi2m7yzpFMdVcYcKBRr8aCb/MydqL9y
 sLpWHNppTkS8rooCyMO2olpptMcAd3r1oHULkDs6ro6x8wxd1iEP1vZh49cp/3bFMKZE
 Ve4d9nwQoqKIyg8G7xcGZzktkcfXAN1HAOAx9NhcBCdnlhbvCmipleaZEXKNb2Gqle2c
 Saz2HSR+07Tk/MilVpyOwmuxuW+uJE+9tx8kmR2rFrcV2yTgTSNuX6DMehOz+VU+EKNO
 GOMFUNW7pd7DoJbcnPmYMVEOe1RIfq57pciDTnV3B0Kiext68KFR7Mv3kw7Be7icVoFI
 WpoA==
X-Gm-Message-State: AGi0PuYmQBSLjidI3aFwqJvh3wRjEEt/5ubIyItd6NeAjqMmr6f7w5lW
 Dbc9hvV9F4ufLw6p8qKld76Xqvrkqko0ZTmH34s=
X-Google-Smtp-Source: APiQypLTeMFPxlYaC7RUOxxRIYya9dI7QcYjmKm2GLyGj1BRBapdHfC8cywqbmuYCSzDkPolem0Eft6U6fTo14K+9hg=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr3689039wmb.56.1586373462592; 
 Wed, 08 Apr 2020 12:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191305.1179310-1-arnd@arndb.de>
In-Reply-To: <20200408191305.1179310-1-arnd@arndb.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Apr 2020 15:17:31 -0400
Message-ID: <CADnq5_OQqos8x-pkYzo0zdxj3Ay427BRmau4Hyk6zX5Nd4pKDA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: avoid unused-variable warning
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Roman Li <roman.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 8, 2020 at 3:13 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Without CONFIG_DEBUG_FS, this newly added function causes a harmless
> warning:
>
> amdgpu_dm/amdgpu_dm.c: In function 'amdgpu_dm_connector_late_register':
> amdgpu_dm/amdgpu_dm.c:4723:30: error: unused variable 'amdgpu_dm_connector' [-Werror=unused-variable]
>  4723 |  struct amdgpu_dm_connector *amdgpu_dm_connector =
>       |                              ^~~~~~~~~~~~~~~~~~~
>
> Use an IS_ENABLED() check instead to let the compiler see what
> is going on.
>
> Fixes: 14f04fa4834a ("drm/amdgpu/display: add a late register connector callback")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Already fixed:
https://cgit.freedesktop.org/~agd5f/linux/commit/?h=drm-next&id=ef04ca2a941ae62cef517eac08210fed5c20fd5d

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d3674d805a0a..8ab23fe98059 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -51,9 +51,7 @@
>  #include "amdgpu_dm_irq.h"
>  #include "dm_helpers.h"
>  #include "amdgpu_dm_mst_types.h"
> -#if defined(CONFIG_DEBUG_FS)
>  #include "amdgpu_dm_debugfs.h"
> -#endif
>
>  #include "ivsrcid/ivsrcid_vislands30.h"
>
> @@ -4723,9 +4721,8 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
>         struct amdgpu_dm_connector *amdgpu_dm_connector =
>                 to_amdgpu_dm_connector(connector);
>
> -#if defined(CONFIG_DEBUG_FS)
> -       connector_debugfs_init(amdgpu_dm_connector);
> -#endif
> +       if (IS_ENABLED(CONFIG_DEBUG_FS))
> +               connector_debugfs_init(amdgpu_dm_connector);
>
>         return 0;
>  }
> --
> 2.26.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
