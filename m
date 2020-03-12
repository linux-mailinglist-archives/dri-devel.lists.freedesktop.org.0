Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983511832D2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 15:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A886EAD6;
	Thu, 12 Mar 2020 14:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA656EAD6;
 Thu, 12 Mar 2020 14:23:15 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so6514890wme.5;
 Thu, 12 Mar 2020 07:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dA44/I1QbEkp26HsS2gxH3ezQBrq3Jv9y5bBZu912Y0=;
 b=HFuW7YyPKrK83ubj5R7+KkP1itV8Df1zykmwz5swPLhELoHn3gdPaqfkU0zhBK2Grs
 baRnK1c4/CWO57wcF2HFDKEXS2vKZFS3ilfvJ2ngnsB/T7CDbQk3ZxOhPVOxD8fh18tS
 m1ZofGxh6WKrMMp4UCV8D1uuDHzL0X/181D7pRITK692vzLratBNkHkZJg99a0dobw83
 mx3Ydg3vsvOyAekpj31LRYLMOSeM5/3GU7QQhtI+ycBhiZLdsqdqNxEscvRWBrnHkxaC
 T31mSzwl+c7YjpyKD662mB+KfCY3SEgzMkVCE6DTIky4WGChdyESILEu+0hDBb4uKl+r
 BRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dA44/I1QbEkp26HsS2gxH3ezQBrq3Jv9y5bBZu912Y0=;
 b=pMC2ZEFZXAng7HI54TnJP899rpaVu4vsqjUniRderJcB4pPkkCPj8ZGsJa1BCusJC+
 9k1wujvCYFYghVCYCyR3WaoXUMYR0eXxqpQd4HKdE+31+wEBRm06/GwBDF0t1WBHoMk7
 WV56l0y4YnPwjvMe2iEUFMhkEPYYsfYbBGQw3E1PWHnOjzDz5Bm0UQKaITHgro/crvVa
 xnMjrGXt/UTQILWQRhahhlgxHoO5oujrKi5XqdaMIF6LOAySikgNOvbhoEkYen2H1sfO
 5XFOJJE2zwbhqfBP5TDdg0An96myZjnOiDr6YRkqywVaRZzwhENbzkBuBQJib2Npd2WD
 d/JA==
X-Gm-Message-State: ANhLgQ32rFGsiLvKPaiqT2fHrqsVFA9ok4Li2cq1J4Wn6i7jYEAoRVEW
 U/PBiac48/JWLGduKUvdLND/hV/eUx92Nebrjaw=
X-Google-Smtp-Source: ADFU+vsi+U4lSevQi2U0MZAwb5EtFRnXvKFJCMWeT+WV57OOOomrWmd04fBStp0WtmBv9CGj8sCSva8PdiK3VstXdcY=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr5164075wmb.73.1584022993776;
 Thu, 12 Mar 2020 07:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200224103120.zrvgqaokmoehs5y7@kili.mountain>
In-Reply-To: <20200224103120.zrvgqaokmoehs5y7@kili.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Mar 2020 10:23:02 -0400
Message-ID: <CADnq5_Or06=BeVmnx35vSqvK1vUxx+Vvzq9h=UY7OkRU+SK+4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: clean up some indenting
To: Dan Carpenter <dan.carpenter@oracle.com>
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
 David Francis <David.Francis@amd.com>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 24, 2020 at 5:31 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These lines were accidentally indented 4 spaces more than they should
> be.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 4cb3eb7c6745..408405d9f30c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -2138,10 +2138,10 @@ static void handle_hpd_rx_irq(void *param)
>                 }
>         }
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
> -           if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
> -                   if (adev->dm.hdcp_workqueue)
> -                           hdcp_handle_cpirq(adev->dm.hdcp_workqueue,  aconnector->base.index);
> -           }
> +       if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
> +               if (adev->dm.hdcp_workqueue)
> +                       hdcp_handle_cpirq(adev->dm.hdcp_workqueue,  aconnector->base.index);
> +       }
>  #endif
>         if ((dc_link->cur_link_settings.lane_count != LANE_COUNT_UNKNOWN) ||
>             (dc_link->type == dc_connection_mst_branch))
> --
> 2.11.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
