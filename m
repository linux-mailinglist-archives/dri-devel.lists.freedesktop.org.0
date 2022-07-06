Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0F4568E4F
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 17:53:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E84E11B35E;
	Wed,  6 Jul 2022 15:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A2711B482;
 Wed,  6 Jul 2022 15:53:50 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id k30so11712335edk.8;
 Wed, 06 Jul 2022 08:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwbqnUpjiSN4hgfIC7ffIeFKyZvoDEGRDTZHu+A2QaQ=;
 b=ILrEVzPO9R1qY/womGdC0iB2h8cQstee4G6RPCy8IsBo5G+Oq1Ac4D3JEMDqXno5YZ
 rFglDoNwKgK5Ahs8bN0iXQY4O5xB27jjUnHkySSsL57Ii34QAArVmX3OQekHTkkSSiRB
 lDv7xx5uodVD6HJ2t6PVpYOHPl2h1WdPvty70Z6HrwMflqOXkgWnbVt8eI4WTxeM5L1+
 h6j7f0LJ8E2EwJPhDutzUUJMM+MwW9MLyJ4qwQhfTDR9UGXJn3it3H1kXzCocDtQlz8V
 EcrMmHqGrEZcZS5qLyv4QAPv8RvMVvgUYNGpB5zviOt1DErrU4n2KBj2EfHGsTOfRjfv
 8CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwbqnUpjiSN4hgfIC7ffIeFKyZvoDEGRDTZHu+A2QaQ=;
 b=id4CR8C2WSfccbxLUE2J91T3wrNhT9sDi4Vg01LlMTLToT1DCLsja9tsQRrystZ7uT
 IUdH76WXv6T8oSZiakETf1dt7wVHNopvwwQUw18XFTAEvpjSFBPdvXwO/J4eyrs5+n8V
 8tv3IIC6UFLkXSXL2I8LY8oOHyHPTsh9jwGPxvuaUToiCaxwNKHOd+WkouMKyyUonqb+
 xtECmqM85ujokPtADXEf+STSccJtAzq18COSgx4pHGwzXMbLJPixOxIFj3SXBZqwmV4J
 XUi39MDXL4eTa4PhwGE1NqKQaprjGPPfNCl0J6o45haZlz+A/UoGZMX6KJCxOKOxJ0C0
 GT+w==
X-Gm-Message-State: AJIora+5ocqOedVqnuDK/8w7fzuuxxo/mXJhQWqk4oq0TExS0CuerYhb
 O6I0n0cgyGxs1DT3lif1icpT/+sd77FaZymW3As=
X-Google-Smtp-Source: AGRyM1uwT5QDUQoR6JIWgndHtR6Gp682jCxMwaMSkfBVcUtVDpJAybSMPRNGuI9Y7y3A8712mLoRkOZB/2rknVTIUzo=
X-Received: by 2002:a05:6402:380a:b0:437:d11f:b8b0 with SMTP id
 es10-20020a056402380a00b00437d11fb8b0mr55333549edb.425.1657122828767; Wed, 06
 Jul 2022 08:53:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220706091329.62192-1-guozhengkui@vivo.com>
 <5dc99a6e-569c-a736-9f64-ac632433da81@amd.com>
In-Reply-To: <5dc99a6e-569c-a736-9f64-ac632433da81@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Jul 2022 11:53:36 -0400
Message-ID: <CADnq5_NLkSzg9PA+JHoCi+0+vtkVrSctGs=RPTBeYrW7YbyTgQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove repeated includes
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Guo Zhengkui <guozhengkui@vivo.com>, Leo Li <sunpeng.li@amd.com>,
 zhengkui_guo@outlook.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jul 6, 2022 at 9:49 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 2022-07-06 05:13, Guo Zhengkui wrote:
> > Remove a repeated "#include <drm/drm_print.h>"
> >
> > Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/os_types.h | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
> > index 795dd486b6d6..6b88ae14f1f9 100644
> > --- a/drivers/gpu/drm/amd/display/dc/os_types.h
> > +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
> > @@ -39,8 +39,6 @@
> >  #include <drm/display/drm_dp_helper.h>
> >  #include <drm/drm_print.h>
> >
> > -#include <drm/drm_print.h>
> > -
> >  #include "cgs_common.h"
> >
> >  #if defined(__BIG_ENDIAN) && !defined(BIGENDIAN_CPU)
>
