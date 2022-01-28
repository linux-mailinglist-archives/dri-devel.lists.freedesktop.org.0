Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612604A0058
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2783210E28C;
	Fri, 28 Jan 2022 18:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8133110E28C;
 Fri, 28 Jan 2022 18:50:59 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso6587585otr.6; 
 Fri, 28 Jan 2022 10:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bKX9pAz2N6f1LeV5jE9JpWncxYcfxVHZaRugBIOPKbo=;
 b=JtN7o50xVFQqlIL781UZBwe/EcDEfw8NHpccQlecEyj0wdpmnCb1zGecF/++5xnfMd
 F5ewgBhpYWA7EE1CdbXoz/tt1SrKQSxiwzFdisFm0+t5cF4rI4O8rdxr2JEu4AY7bqcc
 aUHDzqeQCIpziYIE8mPOYNzEo7ATgYzz0JAKl8hSM2CWD17lLcEHpktsFNbgem3tQRYR
 N92AH6vAJfpjvF37rqJaLSbIvpzvWxjpkuPG1Umen3AVtFyoBCwxarMUFv6w2P7mgQlQ
 +WhvsBX8ujfWZi2ogq0C8IHDx4Bde7mPn+l6c2CE1//imvnKK25t3TW1OUrJndUMuaVX
 7UZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bKX9pAz2N6f1LeV5jE9JpWncxYcfxVHZaRugBIOPKbo=;
 b=heOOX1FwxMJKNH2FpRCbzMmJkUida9dDVSCfvZmlCpCix/OoX8fircJ4Uy0oUOJ/2r
 FFc2rR1ZY7KYOObeiPZ27TDgUZFlp/3eXaa/KL8xRB7uzC0uwS8l2S9oyCRnSfL45xFa
 MeboEgrC+OiU+odrUYcGaZHy/A5AHmBB0JZj4wTugoh5aMyR9hlnuvkkwY7qEJ/jzihu
 /elbtGbc0EDeSi24L8dzNvuiwuZBdK0+BiHeWdTiolbJsEPAUGYfcFYrczlmtttbMPcS
 OgST0lazz6vIOG5t3bT9Sejr8X5Uhiaa+ctgGe8df+WN2sWMQZJllJK11/t9mBPkJCjx
 tMIg==
X-Gm-Message-State: AOAM532+2GAdaHrblCmlwa1VKMoI3Ko78HfIedMM5crErSB0sAYZZ8po
 Jpk5H3JzIoI6mVLtLU+GxE5YHnkd5zkj3/YHJR4=
X-Google-Smtp-Source: ABdhPJw5/vywGryf/EN4HvDyYic34Z2ylrPo+NRS3fcU525WNAQVjajsZilknfkCeEONCcJK9pI7KZhvlzNa3DWjl2s=
X-Received: by 2002:a9d:65cb:: with SMTP id z11mr5524190oth.357.1643395857180; 
 Fri, 28 Jan 2022 10:50:57 -0800 (PST)
MIME-Version: 1.0
References: <20220128071936.1210682-1-deng.changcheng@zte.com.cn>
In-Reply-To: <20220128071936.1210682-1-deng.changcheng@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jan 2022 13:50:46 -0500
Message-ID: <CADnq5_NMAEvgRKM864Vf+xsLuui8+gr_a6r2jViXYX6B5RGh_g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove duplicate include in 'arcturus_ppt.c'
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
Cc: xinhui pan <Xinhui.Pan@amd.com>, "Chen, Guchun" <guchun.chen@amd.com>,
 Dave Airlie <airlied@linux.ie>, Zeal Robot <zealci@zte.com.cn>, "Lazar,
 Lijo" <lijo.lazar@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, "Tuikov,
 Luben" <luben.tuikov@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Powell,
 Darren" <darren.powell@amd.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, "Nieto,
 David M" <david.nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  thanks!

Alex

On Fri, Jan 28, 2022 at 2:19 AM <cgel.zte@gmail.com> wrote:
>
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> 'amdgpu_dpm.h' included in 'arcturus_ppt.c' is duplicated.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index ee296441c5bc..709c32063ef7 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -46,7 +46,6 @@
>  #include <linux/pci.h>
>  #include "amdgpu_ras.h"
>  #include "smu_cmn.h"
> -#include "amdgpu_dpm.h"
>
>  /*
>   * DO NOT use these for err/warn/info/debug messages.
> --
> 2.25.1
>
