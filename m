Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70140250763
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 20:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B473C6E435;
	Mon, 24 Aug 2020 18:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1B16E435;
 Mon, 24 Aug 2020 18:24:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id a15so9838733wrh.10;
 Mon, 24 Aug 2020 11:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RgeYevYFJkRsy/wt1R2pKTfZS0NBDKpEJa8zajXw8ac=;
 b=KqFvPL7VMN/GSvmvfCrrHRanmwj0lqKxg4c5DCpYub9P26eDjouQHTYjwpPVNcZH+m
 Seb6shEAHcF3hoBMjDEbugGOuIyc4wUGwKmQJOpLtVNnm4SYJAZ7wqNP7/ob6eJ3kt9O
 6Zdp2vx7XY9FFfdj/3/cBOcenb8cTbqcRjiMdBW5n0u0F+A9Q+nNVK3xUrNOYoBCUaVj
 rpEvlhFDV5NywcPMDUe+nSz7d0xr160dMWEH3B9AcDjj+OYMe9emfPeqmXgrv2ZAME5k
 KCgvi79N8KUy29LH67NO1CcVjl9PikWmSLqRvTQWci8hvBqqvbkyslaXVOaAiHkjOLFh
 BDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RgeYevYFJkRsy/wt1R2pKTfZS0NBDKpEJa8zajXw8ac=;
 b=WxC9f8XZVmQp6sCUNdymZnEYJ1YXFO/l2JplCknN1J93WjLIHT+b+OKbciA7LyIKCL
 lJj1KROBqmnQQ86G5wkfTnOtIvbg8A9lNZx2GrNq7HIoojw5y85e4MBFUaNSnbrnfC3h
 zlB0wypNySGZo0kdADtd0O6xT7Sh3Yobw0u1hcVthNmvUnEumoDGss2THYcxFPJwxU/k
 cJvcNQoGnUfFENxyUWx7nIC5iEHeMCn5CFNPZR8bidsEBH4cKP6/YXjExZt1D0vInuog
 0uR7yJMG50MELZv3wwjSBPsXBj/SnB//l+w+sGrVFnbtJ8VsiQFrmC0RKi3HWmxPeZWF
 BkPA==
X-Gm-Message-State: AOAM532qjscL+qBfq+YrtD1bNzGpJ4ECdOaPJFTEWqS1EXcpKdlKw0pF
 u/FiCqyUVW2R687pK6/3MqIIMuf+yi2HCjHIx4H4+sYzEZM=
X-Google-Smtp-Source: ABdhPJyuF/fDWq/fdHFH0aq435FTW94C96Ef+TTcRnpGK5whZbKTalhbivwAxq+d+nSqI4G2Yz/ONM856Ch+QDE6Yhg=
X-Received: by 2002:adf:edca:: with SMTP id v10mr3890039wro.124.1598293477120; 
 Mon, 24 Aug 2020 11:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200824163634.606093-1-sashal@kernel.org>
 <20200824163634.606093-46-sashal@kernel.org>
In-Reply-To: <20200824163634.606093-46-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Aug 2020 14:24:26 -0400
Message-ID: <CADnq5_M3RJbhL8e3dwOZFUucngDjTcW-8YRuC6XHdfiD5JqQaA@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.7 46/54] drm/amdgpu: disable gfxoff for
 navy_flounder
To: Sasha Levin <sashal@kernel.org>
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
Cc: Tao Zhou <tao.zhou1@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Jiansong Chen <Jiansong.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "for 3.8" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 24, 2020 at 12:37 PM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Jiansong Chen <Jiansong.Chen@amd.com>
>
> [ Upstream commit 9c9b17a7d19a8e21db2e378784fff1128b46c9d3 ]
>
> gfxoff is temporarily disabled for navy_flounder,
> since at present the feature has broken some basic
> amdgpu test.
>
> Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
> Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Support for this chip does not exist in 5.7 or any other older trees.
Please drop this.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index ff94f756978d5..8ee94f4b9b20f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -681,6 +681,9 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_device *adev)
>                 if (!gfx_v10_0_navi10_gfxoff_should_enable(adev))
>                         adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
>                 break;
> +       case CHIP_NAVY_FLOUNDER:
> +               adev->pm.pp_feature &= ~PP_GFXOFF_MASK;
> +               break;
>         default:
>                 break;
>         }
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
