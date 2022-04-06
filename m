Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C504F601F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 15:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7C789EAE;
	Wed,  6 Apr 2022 13:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4CF89EA6;
 Wed,  6 Apr 2022 13:48:34 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e2442907a1so2562692fac.8; 
 Wed, 06 Apr 2022 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tff9KGQ+bsLXvvlGrFFOOruQ3oJjYqZr9JmnrxOjJ4Y=;
 b=Pz3peI03JaAXX+YmbVRrrD8aT8DBREGrmMjGut2CIoQTdDGqXz2WhW0vUrpoZXBRka
 H51aAXXnoCs6NqrBiAhWA2vseU18kw481zZpIFakuYP8CMlJsr/5Bo6yNfOozVJ6euRy
 u34G5xeCSik5Iawv8qzhX4Wzl7B0pJERh5J1eITcVUYOnZw15yxpyuAU9RELs0mezm0z
 hsUZCpiCmxtOC1v8elYqKefgAHkSABqLHPUpHqxfp3eSXhCbBsJ1NF9i2Smq+pNq41/C
 Drm3AQKIfCGLkHGxHgliJ/oPBCT8qYwhgxYo7qr3mm2M3EJfboJaSZe2lbfVM1b9hKfh
 t52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tff9KGQ+bsLXvvlGrFFOOruQ3oJjYqZr9JmnrxOjJ4Y=;
 b=lEw0w2s5CpLave2on0qY+vCaP5EdA36EwWKhv04OLEOWRqAx6TAwh24m1pPuxPSqcK
 A24nmysTlnrhUGdweqr5pE3R81IELdcRk3/etx2lBoMTqkF3VtmlMfdQCjdWF2L78dOw
 Q0V7on3Ymf/mlY7jB5A3KRwfNm7aWxH7slcf9oNQmB401uKeQcvD62rnSl9p63X1IkPV
 /Y/c8mRQqdPmtTTknOOEz1cPzTRoK+6JKhQPVe312Xr0z6lnAm1EGkw8cft/t0ZnlcQ/
 0O6l2z5us21no0mGKGY3OtE9QCFpBLLXijexAud5MvIw/6Q7D1EsUJ9OQ5Y04ppMSw3Y
 fEKg==
X-Gm-Message-State: AOAM533o2vak6w9xk0KkfwpThUmNOeoMEclV3dzWYBX6vyEidEKqsF4S
 CaH4/g2o/D6mTlWStPEyULh5VDQuA50QJE+2iBQ=
X-Google-Smtp-Source: ABdhPJwBF5ZUL/edR5iad6IQUajo1OlMxWFZiax+WO1MJDzlgdbsH4OO5bN2bmOs9l8HaQAZW75Cg/RP1hV91K7Lkio=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr3687787oaa.200.1649252913998; Wed, 06
 Apr 2022 06:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220406072840.2488056-1-lv.ruyi@zte.com.cn>
In-Reply-To: <20220406072840.2488056-1-lv.ruyi@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Apr 2022 09:48:22 -0400
Message-ID: <CADnq5_N1MyBy5C+3-e7pxXewX_hpXCZtavemO_xv-a+ZxCGN4A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/dc:: remove duplicate include
To: CGEL <cgel.zte@gmail.com>
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
Cc: lv.ruyi@zte.com.cn, hvanzyll@amd.com,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>, Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Wang,
 Angus" <Angus.Wang@amd.com>, "Guo, Bing" <Bing.Guo@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Zeal Robot <zealci@zte.com.cn>, Alvin Lee <alvin.lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Apr 6, 2022 at 3:29 AM <cgel.zte@gmail.com> wrote:
>
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> 'dm_services.h' included in 'freesync,c' is duplicated, so remove one.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> index d72566c6928a..0130f1879116 100644
> --- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> +++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
> @@ -29,7 +29,6 @@
>  #include "dc.h"
>  #include "mod_freesync.h"
>  #include "core_types.h"
> -#include "dm_services.h"
>
>  #define MOD_FREESYNC_MAX_CONCURRENT_STREAMS  32
>
> --
> 2.25.1
>
