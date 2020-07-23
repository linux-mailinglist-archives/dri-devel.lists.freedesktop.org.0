Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449422B0C8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 15:53:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7156E1D2;
	Thu, 23 Jul 2020 13:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29CB6E0AF;
 Thu, 23 Jul 2020 13:52:55 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id a14so5254968wra.5;
 Thu, 23 Jul 2020 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p3pTNZMs0Co8HSRLuxgx+ra6lY54Ifu742adT9Ty5xY=;
 b=YOuWGFzGLdaS8sm/4P693z/q9JjhWvmhyhFplKGUqSRHHyBRTgEA59O7Z47QFiQvpU
 UzStdAD1j6xaxcTfNTvyBXxChNNnPcM6jJUG8HVtyTzyBq4ELzoQzMdZxy34SlfLEzHW
 dHohAAM0reRYYgZQmFS1bNrCNr3wNah2/OqE7fO9rjNbJkbmwWGHoDKjvz4Ujn/gzgVh
 qjpIxoNbckBJ5iPIJyP4ABG5NK/Dc5/8u9AZxdlzl4rP2pSl3q8Y9fTH4l2cyb9Vf/Bf
 SOWeR7V/+N5dXtEJidhNYOjw3geeykDGZRwPxeFxaHPvKDLk5/QL14t41L7KbMa2W5Kc
 PD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p3pTNZMs0Co8HSRLuxgx+ra6lY54Ifu742adT9Ty5xY=;
 b=UaAl3v9Uc+f2tCfMRr9aWbXkgWMCiNrCk2kBAL+sp1dWRsOYr5/s0cc9mAIi3ADtY5
 lyeQkpqBtZLb2lzJFvg2bpopLbtxxIfpstv9F08ECdQOO8QO/cigOGfG3P7qcx2IS+lu
 BY2yYk/7zH+Y8SFOyh6D+BPrDuHdWgVQh3e7RgkeWhf8nVsMNJy6NYqDq0V43z9a9BvJ
 y+V+7DYDFy2UU2kFY2DQ4UMAqm+czqmm3s22oz3tx8nbiqGBLcNEgwFg10LPAnnVa3aq
 nlgk4bn5FLmQQxiGSUtVMXkvYx+P/tBduBT65TgnSfz0Sgu6SJ9msbkJ+FlmIVWIMIhR
 yZ5w==
X-Gm-Message-State: AOAM530ge5dNLbikLJwwqiakYhHqKS44br1LMKEzyj3C8BHFyN2ikVkD
 XOxOJo8/S1S+tWYwrymTuaijJRiQGcH07cnfx4c=
X-Google-Smtp-Source: ABdhPJw7F4eKclGD+IAsLEwgabBkwXiJmgMEVwJzwCYsa73+YKGp6CGgLTDL/65UmlqOrvOFwmGjZAY84PaJ4RKlgTI=
X-Received: by 2002:adf:a351:: with SMTP id d17mr4116950wrb.111.1595512374316; 
 Thu, 23 Jul 2020 06:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <1595474863-33112-1-git-send-email-liheng40@huawei.com>
 <1595474863-33112-2-git-send-email-liheng40@huawei.com>
In-Reply-To: <1595474863-33112-2-git-send-email-liheng40@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Jul 2020 09:52:43 -0400
Message-ID: <CADnq5_PgjxWHxzemDPh1kmfT7twPrend5a5uewMTqVdvf_wkjg@mail.gmail.com>
Subject: Re: [PATCH -next 2/2] drm: Remove redundant NULL check
To: Li Heng <liheng40@huawei.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 23, 2020 at 12:11 AM Li Heng <liheng40@huawei.com> wrote:
>
> Fix below warnings reported by coccicheck:
> ./drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:557:2-7: WARNING: NULL check before some freeing functions is not needed.
>
> Fixes: 4d55b0dd1cdd ("drm/amd/display: Add DCN3 CLK_MGR")
> Signed-off-by: Li Heng <liheng40@huawei.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
> index d94fdc5..d8af56a 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
> @@ -553,8 +553,7 @@ void dcn3_clk_mgr_construct(
>
>  void dcn3_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr)
>  {
> -       if (clk_mgr->base.bw_params)
> -               kfree(clk_mgr->base.bw_params);
> +       kfree(clk_mgr->base.bw_params);
>
>         if (clk_mgr->wm_range_table)
>                 dm_helpers_free_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_GART,
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
