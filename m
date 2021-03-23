Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBB6346286
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C7916E938;
	Tue, 23 Mar 2021 15:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD466E150;
 Tue, 23 Mar 2021 15:14:17 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 68-20020a9d0f4a0000b02901b663e6258dso19751163ott.13; 
 Tue, 23 Mar 2021 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X2/dvppl9EFycIbzir/9o2eLnvUFv2pJ4xfdH+MA8QM=;
 b=UYL7rLim99JevyGztNbHniK+OkVfhlRvzTAL3RkiH8/YQTtZTQTM6+dc0rvPvDc2eP
 o/5tgadaF2WWFKuJfSiVvaxfxamcwfN1D80bNBUKwo1u96pAZRa+OCuybj1dmJI4IWAf
 PlIA1zuFfV+0jKBBp7Kc6qhSo3IVU60AV5w1d+QQCxjnQLzt7UaMtQx4qQiJyI1Z6yap
 +9VUSFj19N8glrhb1A4IqQU5icycGjm9mq7t9VX5wvQoSRTYcgMzm1aTrsenoUUYwGle
 XWlJ84ApF9FXH6EN3rh4CJuUB11mVfpKNhcpIGaJ6oeZbOOOkrdAZKTs/uDG8DA7Sruz
 sDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X2/dvppl9EFycIbzir/9o2eLnvUFv2pJ4xfdH+MA8QM=;
 b=uXR6B0WwuX3wFRsFYHuz8NqBY8NHDWYcN/vuZDWufP012GFatzLDw7VVudMiP3N6RF
 Cap0dlwWzhNHdFKw4NX4wnxdaJW1ZVQmtfBHYHwOTR7qk3r9XE5F/AwEpwlSdK3AMQB8
 U0kyiCudl23Mm1Gaq6jlBkN7AEOOM1vUq9bAVllIfYjpSGCIcv1C3jms+We3CeQaNc2g
 sVOrJetwusvj3UVKnDnpJvUgIGghbRW/JgOyU7FbxsccphYDxVNzxjBBKbYf4HdYG8lq
 LYseUZibuSj/TRk7EUJLqkQu3W242YXzAYru/dROdo3266EdnzvEFa7jGxboo2CBCV52
 FbCQ==
X-Gm-Message-State: AOAM531KsOfyPM6oMbK0rUA4oe4TjPnVOYYa2W/VFBv5iFWXqsIylIjO
 9C0/UWNLcEg81hKnFV+lFhFVGMQ4KIv/JPsVrOs=
X-Google-Smtp-Source: ABdhPJxccxo6qay1Ja8B5rRGkZ84PCoqVfKLkENwqOk7ApRciBrgC59v5U9P9CD7fq7Ef1XGJlgxtw+h+XkfyAT3oxU=
X-Received: by 2002:a9d:750e:: with SMTP id r14mr4876999otk.311.1616512457068; 
 Tue, 23 Mar 2021 08:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210323011923.133284-1-wanjiabing@vivo.com>
In-Reply-To: <20210323011923.133284-1-wanjiabing@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Mar 2021 11:14:05 -0400
Message-ID: <CADnq5_MWQPaSjKY5ky2xSacUr5_fP0uDiw8TU3HVA6QC6NvAtA@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: Remove duplicate includes
To: Wan Jiabing <wanjiabing@vivo.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, kael_w@yeah.net,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Same patch was already applied recently.

Thanks,

Alex

On Mon, Mar 22, 2021 at 9:19 PM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> ../hw_ddc.h, ../hw_gpio.h and ../hw_hpd.h have been included
> at line 32, so remove them.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  .../gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c    | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c b/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
> index 66e4841f41e4..ca335ea60412 100644
> --- a/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
> +++ b/drivers/gpu/drm/amd/display/dc/gpio/dce110/hw_factory_dce110.c
> @@ -48,10 +48,6 @@
>  #define REGI(reg_name, block, id)\
>         mm ## block ## id ## _ ## reg_name
>
> -#include "../hw_gpio.h"
> -#include "../hw_ddc.h"
> -#include "../hw_hpd.h"
> -
>  #include "reg_helper.h"
>  #include "../hpd_regs.h"
>
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
