Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 786881C0292
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 18:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FAC6E936;
	Thu, 30 Apr 2020 16:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A8D6E937;
 Thu, 30 Apr 2020 16:32:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id u16so2681775wmc.5;
 Thu, 30 Apr 2020 09:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ugyb7Zb4Sysj1bxwGzOmKe/PaiDp8wxsBq9DmhoL44E=;
 b=j6eTQuzQbAwpZE/KG4Vb3yRnsgDC26xftMT2jvjHHgv2Ry9OmS0pTf+OOaX89NT7xR
 a6ye+t2bVtIHykJbMOPy5/zJM6YGO1023NU/VCkNr9A861zyXkMeCkiNnwU7yHmSKAmD
 cBkNlVPk7QQbKMdbAd5LIvfvE3URtUsecxEIDZB9UMbeAn+lluUEzBc+m8U215//CGsG
 Mje7KcnpQBmmm1f4M5+qYKrpGAwQ/nLtmFc4WgQbM2+oNW8Eaw4oxV8xLrOo3wkzHDDd
 I8e3hdaH1py0yn6TeFgl1G2KLhNEZ9+QsoUQQ3PK0n6SrJ479pmtaX1QQm3DiT/LlhnY
 wPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ugyb7Zb4Sysj1bxwGzOmKe/PaiDp8wxsBq9DmhoL44E=;
 b=uZjryBNT3fuBz2bY2k0WNZJzfbGIbOEIHdwRhZY/eFRFPJOXRyAE7gzlx6GCld0LwY
 NEBSc+/VnijTcqkmSOfglVuwjasgzvYFGRW67ZKa+7VsGGttndPOx8fKGXTqzZ2ez8X3
 fmAjn+dvElifomn5/emKJ92kTu49kmxHIi2wztJS5r/cbf7L59QtheON5JURX36SYihe
 2eroX9JqaUvCHF9mNIK0qcSH8GvTOaa3wY2Rv/JPRuzu9Jz9BUKAWl46csaS2LkqNjIn
 0+FCSWetr554+HBdzP8cU1R8uyaRxJ8BfeTyo/b+tXvv0DL4v576Q8RKL+sy3cWc6Asd
 Y8sA==
X-Gm-Message-State: AGi0PubsiP/0jDDZc7543brk1XMHfAxRHD45xntUGCeWNC9v3XzBmYMm
 dFMOvy2Q4i/UjcYlPfIpbKdNzMPji14Zqiop5Is=
X-Google-Smtp-Source: APiQypKrZHvtErC3cKfTsi/zEKLQ6xIA3UZ+0B7fI1AaibkS6bXo92M3dum2wwZ1ZNScd8GlY0v15RO8THKXaBE6uGQ=
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr3960280wme.79.1588264357899; 
 Thu, 30 Apr 2020 09:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <1588218962-75747-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1588218962-75747-1-git-send-email-zou_wei@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Apr 2020 12:32:26 -0400
Message-ID: <CADnq5_Nawk027_tzc4WChRcPaZqJtorQTy=YrFFdKL-C7+ScKw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Fix unsigned comparison to zero
To: Zou Wei <zou_wei@huawei.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Apr 30, 2020 at 3:33 AM Zou Wei <zou_wei@huawei.com> wrote:
>
> Fixes coccicheck warning:
>
> drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c:1398:60-61:
> WARNING: Unsigned expression compared with zero: j >= 0
>
> Fixes: 238387774232 ("drm/amd/display: fix rn soc bb update")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index ceaf70a..419cdde 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -1384,7 +1384,8 @@ static void update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_param
>         struct dcn21_resource_pool *pool = TO_DCN21_RES_POOL(dc->res_pool);
>         struct clk_limit_table *clk_table = &bw_params->clk_table;
>         struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
> -       unsigned int i, j, closest_clk_lvl;
> +       unsigned int i, closest_clk_lvl;
> +       int j;
>
>         // Default clock levels are used for diags, which may lead to overclocking.
>         if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
> --
> 2.6.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
