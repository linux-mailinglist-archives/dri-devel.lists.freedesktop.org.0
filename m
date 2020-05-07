Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 641A31C9B35
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 21:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228A18800B;
	Thu,  7 May 2020 19:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF4E6E1B6;
 Thu,  7 May 2020 19:36:10 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h9so7817399wrt.0;
 Thu, 07 May 2020 12:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sPW4CK7OR/eqFHRLBEIEsrbWm8BRZpXSUtYnRNfi4pY=;
 b=qxSScwYWuPpzH/RkFnyM8ln4aSwLFEWBqwRkfBedY18y68OZBuf1kLVFgmm8q67GfK
 lfMsP0PgZju31IV8YWMyuhuHc70Q57Z9V7UpGW0u+GVK8tOa6ksQ7FU3wVZSBxY4GQv+
 wdlVOqiEDLmllXeykL9RpUZxPfoRB7WbOETGRVijjlH+237kMDJUjGhgN6Ca5dZN8LMN
 82o5yexw2JTQaAlJ0gt0ussG6jh95rRWJINwZdq417OpIZCXYbDXHC57Ngkj7ri01/he
 CgC4nfliK8Y97BGY5iVfauqn/Tzg7d1+xLB1e1k39eMhMYyZq5XA4pdY2u1iglQmaljN
 jPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sPW4CK7OR/eqFHRLBEIEsrbWm8BRZpXSUtYnRNfi4pY=;
 b=t0qbWtqhcPygw2/cDKKiq/v/qGC/f5WZZ6TVZ2oNGfDH1IR3gDamTLShkNLFUkXCn0
 ZcG6oPzkOGCcT17Zmwmw55ifXhubDaVkxolZb59jJoRRe/9l0aHYlCDaoPWBDoyo/r62
 H7sQLSOjGJQIG4aKCe6r6j08B71auBDMUdb+1a3rzWmyoUvRU6m7gk9FrV3GqFGeorIg
 M3ZgXLmefR9WK02YdnOYksES6gqLb/0z7ZQeZutML2ddzhzDgoVc8YyvayacNaoVLc6c
 hP2byxR+zmkxOWorA/XvwFycG2L/XNwwkYJ5gbXiYYz5WrQy9HF+IiiFaRsY/F1BxlCj
 EpMQ==
X-Gm-Message-State: AGi0PuYTUnrON9npP9HgstPTbSaJElBSnfX30BS3gu5ABnMWaq54f2g5
 QEkznJ8HcL2n2nKFRAkEx4smDHPV5zhxPYsGkqw=
X-Google-Smtp-Source: APiQypIWrV496/a3WjEusmf1TVTRkBkRygVkQbDUmrGwf/7VmDoeDd8rPT3/q4WtU2IvlD+T9H8BWLV2ZhjgmPYM5ek=
X-Received: by 2002:adf:ee86:: with SMTP id b6mr18453318wro.419.1588880169326; 
 Thu, 07 May 2020 12:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200507110703.37509-1-yanaijie@huawei.com>
In-Reply-To: <20200507110703.37509-1-yanaijie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 May 2020 15:35:58 -0400
Message-ID: <CADnq5_PRtJmgacP57MHH0uDjnWCd1bc_7g4KK9-NW6VACjXBXw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove variable "result" in
 dcn20_patch_unknown_plane_state()
To: Jason Yan <yanaijie@huawei.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied thanks!

Alex

On Thu, May 7, 2020 at 9:35 AM Jason Yan <yanaijie@huawei.com> wrote:
>
> Fix the following coccicheck warning:
>
> drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c:3216:16-22:
> Unneeded variable: "result". Return "DC_OK" on line 3229
>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> index 4dea550c3f83..3c0090797866 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> @@ -3228,8 +3228,6 @@ static struct dc_cap_funcs cap_funcs = {
>
>  enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state *plane_state)
>  {
> -       enum dc_status result = DC_OK;
> -
>         enum surface_pixel_format surf_pix_format = plane_state->format;
>         unsigned int bpp = resource_pixel_format_to_bpp(surf_pix_format);
>
> @@ -3241,7 +3239,7 @@ enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state *plane_stat
>                 swizzle = DC_SW_64KB_S;
>
>         plane_state->tiling_info.gfx9.swizzle = swizzle;
> -       return result;
> +       return DC_OK;
>  }
>
>  static struct resource_funcs dcn20_res_pool_funcs = {
> --
> 2.21.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
