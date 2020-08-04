Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F5023C1D6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 00:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D7F6E3F3;
	Tue,  4 Aug 2020 22:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE416E3F3;
 Tue,  4 Aug 2020 22:20:11 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 3so4408837wmi.1;
 Tue, 04 Aug 2020 15:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bIU597/R52NdHt9My0gKrv9XPCqvlmRzraRI2fhWzKw=;
 b=N8IhA7xXYSSwwD5ZHij95ahJQh5m7VjaobHv39G8BqYbUStXlUudUwRau+y0sqrYIN
 TrnPoZst9mLsMipwxTzW/Ee7yXQx2TjEIE5kvFOIX8I9ZKPOw1x7E0FPVEykt5MtHeW+
 CugqxmE4WdbsZjjMyIdWQv2pyl8yFMUxFzQCi8PN65pCnJQYNEK6odoaWHs3GsbQp8BH
 g7QYvMAynvurxHOsg59Rz1nmLLNZx3SuPzbzS768v53YnXP1Ujzfx6gN+KkohPqvjyPn
 dWh0DeqmRGxwKH4seuHv+HRylwC0v7KxHIE8AlA6jaDMvMtSuBBjtnXK0X370erD2HeZ
 j5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bIU597/R52NdHt9My0gKrv9XPCqvlmRzraRI2fhWzKw=;
 b=eE+KQyIrlaQVhr7C4mvudUq2BI+FTQdvjeZ8Q9voorKrGSLntLLNs0AhtE+x5HjbYG
 DfutpzfLLFbSMwqv6w2UNEJhH4jH5DhwEwBxKSTIHPDIUTN4BjSGpDDG+YCQ9YLcP9y3
 n9KWNsDYzr8O64v6eaGd0MrQaSbPwcuV3HNx1XB4oJmnFaCHaF7Bht0A8cA1L33dbGMa
 59YD24kycnufH0QZSgulBzpN4gO+bYPD8f3cr/6lmD+TkxeF1qsli1St5sa4Spn+Ie6n
 1HjdFX6l5ERU9ImXY0J1CclYJ3HS7mJNqkH6YShPXAw8z5hhEgFSVd8QVmyV201m8oZ4
 OjLQ==
X-Gm-Message-State: AOAM531TTjxfm9ZM4x4JkEUvJo/tUyyZNRAORontL9ynG+OdnCRdN5Ls
 /HXCwEg8nPXnMX0gg2h69PiofFIImEedFzOhUng=
X-Google-Smtp-Source: ABdhPJwT9QBo034XdTdgDXsb7+dWpt+h8erXIzRln2NsLfuf3lRuDViXWgaH7wvl80+hXBC9BzPnHPOGAU8dh5dECC4=
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr469144wmh.39.1596579610237;
 Tue, 04 Aug 2020 15:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200802111536.5246-1-tianjia.zhang@linux.alibaba.com>
In-Reply-To: <20200802111536.5246-1-tianjia.zhang@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 Aug 2020 18:19:58 -0400
Message-ID: <CADnq5_ObopJHTDfoLHunJGakLNgxLwwfo-g53HCDP=fis+E+iQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix wrong return value in
 dm_update_plane_state()
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, tianjia.zhang@alibaba.com,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Lipski,
 Mikita" <mikita.lipski@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 3, 2020 at 4:21 AM Tianjia Zhang
<tianjia.zhang@linux.alibaba.com> wrote:
>
> On an error exit path, a negative error code should be returned
> instead of a positive return value.
>
> Fixes: 9e869063b0021 ("drm/amd/display: Move iteration out of dm_update_planes")
> Cc: Leo Li <sunpeng.li@amd.com>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 710edc70e37e..5810416e2ddc 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8182,8 +8182,7 @@ static int dm_update_plane_state(struct dc *dc,
>                                 dm_old_plane_state->dc_state,
>                                 dm_state->context)) {
>
> -                       ret = EINVAL;
> -                       return ret;
> +                       return -EINVAL;
>                 }
>
>
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
