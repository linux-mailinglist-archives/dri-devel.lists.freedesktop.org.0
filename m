Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E755BC2A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 23:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D0D10E13D;
	Mon, 27 Jun 2022 21:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F7A10E081;
 Mon, 27 Jun 2022 21:39:15 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id lw20so21865381ejb.4;
 Mon, 27 Jun 2022 14:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bbdSb2cTZ0htDASIs4pX7vkvL5oD25vksluOzr2XcSs=;
 b=GxRdWAzs+A4aw28qbnHYzF6sgFjJtNW/9+gd2VO19JgtV0Q7IQF7D22365cu5DoXD1
 gz56oEIsl+W22kzUC7dO8n4vFZzKyauew1ddf4+Po8WULnJNQEEx8qKedCEAvOmdB4p1
 jIUWOWdI8ma2GAnhvY+Fm7zd5+ejqXh6iU4AAm2VGvcvPVPEM6B3WcbJGRBf0i4r2UxC
 Iyfh0ZmhdjUZQqoBojFg3Pfb2ZQhQw0DKS8HBpvRSPaTxiy+XQsVXS92tKncxB0qn/q0
 jnrTk853Duoe+8dUamO33oScwdroGkW00qjNxgFMhxOwaOTH6wXbRgiia3S8e1TBiqlA
 zD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bbdSb2cTZ0htDASIs4pX7vkvL5oD25vksluOzr2XcSs=;
 b=i4nEereXgJbOY7aUlbHVBNLH5xCFy0PwoMAplCHVnul7fiUbMQAMvA2g6Rbe3wyNjk
 guASOoKxbXtL2k6UBjCz+GV64BWf973U4V4v9U1y7pEy/EMA5cOtPMPzn+zNbmovnJzt
 kr2r26hu0aeoTVyf+uLK/0tqJ+7RbwLnWY7WKS0XLuqepZQJSfY7sPYNIZsJgOYOesMC
 qGuwRdbi8lYD+GcytQNpwlFTng6D/ftd4q00Lfopzcd7iQJqkTYNJ3rBgIvRHVmy5g17
 wzLyWlnbbFAny1BnAFxwN7AysQKDjT69ig6JDrebQA4LhTb9RxWFFveKTECYAs7itSn0
 B6kA==
X-Gm-Message-State: AJIora/LL+765f28NZLDz4TKICoj9QT6Ln+xFyJzjHg723dS5UgO1+QJ
 9hPMO7fTnhf8eTBVO9JFvTIViKC4Y2yUvdwQF3M=
X-Google-Smtp-Source: AGRyM1vR3YQYUmiaHSFQiFk4p7DhkSC+ahsp6sDc8p2/glRlJGZlfXGcuDzQXqHJdsSub/M0Ib2jJiBhUqFcH+JFpAc=
X-Received: by 2002:a17:907:94cf:b0:726:c81a:f30e with SMTP id
 dn15-20020a17090794cf00b00726c81af30emr2387143ejc.451.1656365953879; Mon, 27
 Jun 2022 14:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220625014157.5004-1-jrdr.linux@gmail.com>
In-Reply-To: <20220625014157.5004-1-jrdr.linux@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jun 2022 17:39:02 -0400
Message-ID: <CADnq5_McHFHKiXWMpMEo0QtKW_HMe5dkp9-Q-3LFs1AjDQ0Kzg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Removed unused variable ret
To: Souptick Joarder <jrdr.linux@gmail.com>
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
Cc: kernel test robot <lkp@intel.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Dave Airlie <airlied@linux.ie>, Jerry Zuo <Jerry.Zuo@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jun 24, 2022 at 9:42 PM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>
>
> Kernel test robot throws below warning ->
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:
> In function 'dc_link_reduce_mst_payload':
>    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:3782:32:
> warning: variable 'ret' set but not used [-Wunused-but-set-variable]
>     3782 |         enum act_return_status ret;
>
> Removed the unused ret variable.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index 55a8f58ee239..445357623d8b 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -3706,7 +3706,6 @@ enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw
>         struct fixed31_32 pbn_per_slot;
>         struct dp_mst_stream_allocation_table proposed_table = {0};
>         uint8_t i;
> -       enum act_return_status ret;
>         const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
>         DC_LOGGER_INIT(link->ctx->logger);
>
> @@ -3777,7 +3776,7 @@ enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw
>                         &link->mst_stream_alloc_table);
>
>         /* poll for immediate branch device ACT handled */
> -       ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> +       dm_helpers_dp_mst_poll_for_allocation_change_trigger(
>                         stream->ctx,
>                         stream);
>
> --
> 2.25.1
>
