Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF93A1EAA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 23:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A6B6E303;
	Wed,  9 Jun 2021 21:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5106E332;
 Wed,  9 Jun 2021 21:12:29 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso25336672otu.10; 
 Wed, 09 Jun 2021 14:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X+vTwOmzwLF/GmiUHSZdVNz6KHeSQoupkzPT9DlPZJE=;
 b=UXdMRlhsFFSxm/2Mk/c3mHNqpjn4ns2S31aVCngPlEAlxhlPqMJeo2LAHOKakytmzB
 Wm0FplBGGEnaeJ4svs6nd4fp65TxM2SKVMcrS6Ywn8NaPXs7xSLOvmhCmmcTiL5FTCM3
 /qgxdqIBTYAVRqjOKiZfbDKgCEpUjd0KkgmeDWsDGN2XtaoiaZ/RYfkdyVhhdpkM3GIn
 SnGoxWlPdVfOq9P81ZMRiAiy+b+OCkA82+RFmAIPMFy85yi6PGuXzSwFkZd8GYW188MT
 93bZSz8GyuYPMbEjwxAq8hn9ky0h5jxM/9hshAEqQEITHGp0z/1x4sXsl5MNrqNRp5IW
 Ro3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X+vTwOmzwLF/GmiUHSZdVNz6KHeSQoupkzPT9DlPZJE=;
 b=eo1/D9UH9O5bZWo9QUoYM0/DgS0bSK3JO1v3H2mHCOAz3wmCrNRsLBXgayNm5ZnGek
 RJ7JZqGpIZGQy5VcHp0YVO6DfY0aVO3J+n31A7de6nNtyktIjpM+BtkgIjcHTpPU/kDE
 siKllsQQXqkb34wjocQp1fzOhRGJ/aCsWxXmX8ncMxrLpnWwwcFYmj40NWT4oY8ht7R+
 OVe4KUg95zTDX4hi3ewJuksiK6LanjpGYBjSl1FhzPnyxp2rq8Gd3ccBBQwy7YhJPSH7
 e3kvjgLbubfC60Fg/rmStDUbUfgRIZP6HbXPqXVcS476xlwBJZ5vhp9Z5VWWXfW7Cu40
 kGxA==
X-Gm-Message-State: AOAM531A12L5pzNgSjGpUOZME8tjXCjkO4LBUsHniFBINEbL4JouLjsF
 ASfeBhB4qIRMlgIjgBdfJVun6lyeDTeheMCzgzA=
X-Google-Smtp-Source: ABdhPJy5gjHIlujtByvS9IHsso8aiM/8W+YZHouRkqXFR2/zW0it21pwmOAG+IooOSApA2+nBXEpbk7ROb81/QPfn6w=
X-Received: by 2002:a9d:6287:: with SMTP id x7mr1212482otk.132.1623273148945; 
 Wed, 09 Jun 2021 14:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <1623233366-100202-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1623233366-100202-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Jun 2021 17:12:18 -0400
Message-ID: <CADnq5_Ms6Hv=PpSWXEabE1C0oQ=B37Mz1HYfxjn+vF9e8kK9SA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: use ARRAY_SIZE for base60_refresh_rates
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Jun 9, 2021 at 6:09 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Use ARRAY_SIZE instead of dividing sizeof array with sizeof an
> element.
>
> Clean up the following coccicheck warning:
>
> ./drivers/gpu/drm/amd/display/dc/core/dc_resource.c:448:47-48: WARNING:
> Use ARRAY_SIZE.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 57afe71..3f00989 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -445,7 +445,7 @@ bool resource_are_vblanks_synchronizable(
>  {
>         uint32_t base60_refresh_rates[] = {10, 20, 5};
>         uint8_t i;
> -       uint8_t rr_count = sizeof(base60_refresh_rates)/sizeof(base60_refresh_rates[0]);
> +       uint8_t rr_count = ARRAY_SIZE(base60_refresh_rates);
>         uint64_t frame_time_diff;
>
>         if (stream1->ctx->dc->config.vblank_alignment_dto_params &&
> --
> 1.8.3.1
>
