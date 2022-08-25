Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B46D5A164D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 18:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FDF10E248;
	Thu, 25 Aug 2022 16:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D6510E2C7;
 Thu, 25 Aug 2022 16:02:05 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-11c4d7d4683so25449989fac.8; 
 Thu, 25 Aug 2022 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=sNFG5s7LnC8XjcoTGJvLHOo5cpf+AMAvCpxCgUj2R30=;
 b=fWZaRka9wUl4/qnh2iE8plD6aPudPrd3NC1h7pM8MDzeR2jm77ODxKAJxd3h0XnE9+
 5xhZi4dp6VjyYk3diQttP5OtSuRn+1qdMGKasRvT1BefIxQ/xW3iI82PCRYV2aYJr822
 l+6zFPnYaEgLoDMG2oWkfPCIb4focwG9dk56oSN2Za0eDsMw78jvZ9oTdoCXnBwUyG3o
 MFLuty8zPbMZQT6fkJGz+DYSh/Pj6vy/6X6XxXNh58SaYe7CiZf7JkXvehq/uGSZjjLY
 wHb0VmfbPjJ616zZYjc5NPYuFeD4bqzbO6T4+IwHdgqP+yajiSGuANzDbID+oTZyJypO
 FfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=sNFG5s7LnC8XjcoTGJvLHOo5cpf+AMAvCpxCgUj2R30=;
 b=31tDlBqV43MJ/exIMZUZMKrvhHqdYFEWzvOJ6N57aHWZkWzyUGwjxcnnVCjad3E1IT
 /YfQL8vssDVWr9ElGgcVzN7fTArrQodMEIYt4XxFsQSielYleXXtxtw2mYzIo5CZLA73
 m4QazgNrNcT6R0ie3FQAlG7mK2wEmoEZsueuEwbUkD9fRuSEIikGeIWX0voe7cbE6/Aw
 wBSEXRdehNaWbwGCJT5YuFKX9VgGJtwEOT5eJHbMsLQVcMG4WZLBWDqei+/4D/L/61OR
 T05LgYL7xbrtOfxk1wuKmckSRzSvYVgmv/FLtja71oXnlf4YUEbLMHtCoZpb9k3/HBYW
 9AXQ==
X-Gm-Message-State: ACgBeo2KkyB2Na0fviTSrD+kjO1WaM88ikkLsySL2aYXDHnL8FMobH9i
 WJ4QIeHjr4JqzXCF8AkX0BDTqQIxjS/9TbhB0G0=
X-Google-Smtp-Source: AA6agR7kiQ57XUkKXiAkkw2tu36haHCQjPWJKC0f16Gw0lXMggESritHc0IDxS7hh/vyn0Bw/EEhS9xLHMi8uy36klg=
X-Received: by 2002:a05:6870:9a06:b0:11e:3d19:2614 with SMTP id
 fo6-20020a0568709a0600b0011e3d192614mr943043oab.96.1661443325104; Thu, 25 Aug
 2022 09:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220823064137.13726-1-bernard@vivo.com>
In-Reply-To: <20220823064137.13726-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Aug 2022 12:01:53 -0400
Message-ID: <CADnq5_Ojb8U3gPckX3Ox3mkhQGTjusMOdneExcWZp_Zz8PTawQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: remove possible condition with no effect (if ==
 else)
To: Bernard Zhao <bernard@vivo.com>
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
Cc: zhaojunkui2008@126.com, Eric Yang <Eric.Yang2@amd.com>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Michael Strauss <michael.strauss@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 23, 2022 at 3:30 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> This patch fix cocci warning:
> drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c:1816:6-8:
> WARNING: possible condition with no effect (if == else).
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> index 85f32206a766..dccc9794e6a2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> @@ -1813,8 +1813,6 @@ static bool dcn314_resource_construct(
>
>         if (dc->ctx->dce_environment == DCE_ENV_PRODUCTION_DRV)
>                 dc->debug = debug_defaults_drv;
> -       else if (dc->ctx->dce_environment == DCE_ENV_FPGA_MAXIMUS)
> -               dc->debug = debug_defaults_diags;
>         else
>                 dc->debug = debug_defaults_diags;
>         // Init the vm_helper
> --
> 2.33.1
>
