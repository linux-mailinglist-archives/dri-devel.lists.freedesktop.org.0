Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9C824C51A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 20:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A9A6E9A3;
	Thu, 20 Aug 2020 18:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8606E9A3;
 Thu, 20 Aug 2020 18:11:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r2so2970781wrs.8;
 Thu, 20 Aug 2020 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oPlGwJIUawBNMyu0GOt8u+swdga2De9aEs3KqrqQvrs=;
 b=QVv6MSZ8Sh06WnMusxMgELfzaIEbb2IkEvNAueK335WPwymR2s7FFHdnAs6qw0+41z
 YucDvXomV/OWqs4SUkwEyzhxh2dS9zJBFLzIARA3RBrRM4kf08+EqfGyeAVtUtpkaV6t
 Zg1TXHJZKyik23/eXCy/rv/Kb2gOmaARcKGnMgnbNLBKH2QmOSqIYUPZ9qyTuvgunnwL
 5K/pjUcfgkt0KK0iIDZIOg0G2X79W7y/BYlk6djqWExJ2pQajQ0Z3pn7i8ie2S9CyhGD
 l3BiPQcBqCIde/rfb6123vgwXvhQsYQPWHUT/ZSLTbgULk/JiKICKi7/lixWk/wKQPcj
 ekdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oPlGwJIUawBNMyu0GOt8u+swdga2De9aEs3KqrqQvrs=;
 b=jPk0A6cyYdPkR11Ck54hgBDE7rHYYidOU8PK+Fb5VvM+cu0y0uI3Xja9yiVe0jpLCx
 qHZSmH9jGf8mE59kU3zbgNNCFwaL806kSYFuIISsu2ZJ/E836m9+rJ6rCpoQMjrH+E3u
 RM8FreUsSd1SEVP/klaUln+qaMUamrrzFVwjHdEgqHbRhMwm0kGArpEYlzwEr5NNDiSi
 tHfzDvJ7AdQkcyx7fIWklWwpqVGT1MpaCxMNeTdeohBJapTEHIZGalMKPJ+VcwaVk2CT
 fl210OMtcbBNWA2KGYnYWSZQummzn1oIgjxSXiQfjKs1Z87ysW6gwRaEELOP70crIR8T
 g81w==
X-Gm-Message-State: AOAM5314Kxr2RkkBrEzvIW+8HBXCkFA6SAQ66s2NMDx+18ryzD49YpZ4
 OIgsQPkbZLaRx9qDu0S87uReYs/cjaulnkFvgiU=
X-Google-Smtp-Source: ABdhPJxuIGpO6/AQWt7ia2owpwQILxjXyYzx0hIYF34TL+5QaBNo3srd6VF6rJurt0B1vw0fUdiH500DdzT7oNp8RSk=
X-Received: by 2002:adf:a351:: with SMTP id d17mr4251209wrb.111.1597947079898; 
 Thu, 20 Aug 2020 11:11:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200819113409.10137-1-wanghai38@huawei.com>
 <DM6PR12MB26191A1647B5AADB390CDE77E45A0@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26191A1647B5AADB390CDE77E45A0@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Aug 2020 14:11:08 -0400
Message-ID: <CADnq5_O_+GJ6z4gN9nf4pm38v83VCA9paNrumJPSSx-S0wD2eA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/powerplay: remove duplicate include
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: Wang Hai <wanghai38@huawei.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Aug 19, 2020 at 11:00 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> -----Original Message-----
> From: Wang Hai <wanghai38@huawei.com>
> Sent: Wednesday, August 19, 2020 7:34 PM
> To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; airlied@linux.ie; daniel@ffwll.ch
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> Subject: [PATCH -next] drm/amd/powerplay: remove duplicate include
>
> Remove asic_reg/nbio/nbio_6_1_offset.h which is included more than once
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>
> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h
> index e6d9e84059e1..0d08c57d3bca 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega12_inc.h
> @@ -34,7 +34,6 @@
>  #include "asic_reg/gc/gc_9_2_1_offset.h"
>  #include "asic_reg/gc/gc_9_2_1_sh_mask.h"
>
> -#include "asic_reg/nbio/nbio_6_1_offset.h"
>  #include "asic_reg/nbio/nbio_6_1_offset.h"
>  #include "asic_reg/nbio/nbio_6_1_sh_mask.h"
>
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
