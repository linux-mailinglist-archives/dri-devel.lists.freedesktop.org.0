Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA685B40CF
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477DE10E0B5;
	Fri,  9 Sep 2022 20:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3BA10E069;
 Fri,  9 Sep 2022 20:41:50 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so7072727fac.0; 
 Fri, 09 Sep 2022 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Aiun8CusNgh/PUTHR9vRms66+k6qtenVsahGU6Eq63U=;
 b=U3vXka7eQa25N8VZDHmT2KsIz/3SRsNUo+WH1qlg5ulr1RjX7VaO57gV+TWUuBeqxX
 y2A3oJsm7Zs8Uo6IZHsUBsgdEgR6BMgCrCYZKvRbJ/svLnYEIU4OXJu9g9GNmcoiePMp
 XzfOHxcoPYqyAmjrYu8BauNhmC7zmG+HHQjOgaJ1+NKTTBd3TvDk7O2M2icxWRIBMTiA
 h07E0BUIb2YJt1DqWrr8QuaxWic+ae2kGr5mFYkeTKPi4l3C5z8gE53mRl+l73FbMfgv
 7oYCLHffsHYpS2TatLwoMEt8mWo+Jq6JxGeM90kilnsA3Wh+iJUXY9XZ79Eyb7XzJPaC
 Yhgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Aiun8CusNgh/PUTHR9vRms66+k6qtenVsahGU6Eq63U=;
 b=yyjzKMvXvMMxG74g6K8inceeac3MrOR8U4zI7mhiRsANrXGtr6SVBxD+qM/ZdF2VCC
 RMDFyc0KwcqY6QgtaPw74N0mjS49J/gWaW20EGLcClSHeVTy+u6zXoPLN2ED7TMoVdrQ
 Qcbqw0s9+NpAuoAfRqeBAK1FdUrgSgkcJt8h51PpPly1ppbFqeJC9+erqzzGUsWO62GI
 JL7lwNjjxWjpHDYU1SVh7Tg9USLiKPhbTbqGOUKfzaHuvnZ8vn0HdW746eqbS2qYrkU2
 S2pI1WNBFsyGX21xFGrHxD8JC84n8L90H6vD09Hjckm0K+4xeDoeCFruswJ+ziNPOEnM
 8F5A==
X-Gm-Message-State: ACgBeo0NGf1k5SYGu7/1E1u8sZpLhlheA0znGSD/QUTtelzrGomE3eN8
 1lWWLz12hyZQIvJhKyfnBe33aObUbVChesbmYvk=
X-Google-Smtp-Source: AA6agR52Zp70u5YUKPMxE2dP1G33FINV9iw1YeREdDxeoQMi1BG1aPSMAgRE0quDLePMj29oK37xQPmS63XdBPnY3sY=
X-Received: by 2002:a05:6808:2187:b0:344:eccd:3fc5 with SMTP id
 be7-20020a056808218700b00344eccd3fc5mr4797981oib.46.1662756109694; Fri, 09
 Sep 2022 13:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220901075655.57494-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220901075655.57494-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:41:38 -0400
Message-ID: <CADnq5_MuAXcCZ6aeRSzuCjsw12C0eYR0_2FWYynMOdx4ppvcgA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: clean up some inconsistent
 indentings
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Sep 1, 2022 at 3:57 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> This if statement is the content of the for statement above it. It
> should be indented.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2026
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> index 9dd705b985b9..0139e98a0aa1 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_hw_sequencer.c
> @@ -417,8 +417,8 @@ void get_subvp_visual_confirm_color(
>         for (i = 0; i < dc->res_pool->pipe_count; i++) {
>                 struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
>
> -       if (pipe->stream && pipe->stream->mall_stream_config.paired_stream &&
> -                               pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
> +               if (pipe->stream && pipe->stream->mall_stream_config.paired_stream &&
> +                       pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
>                         /* SubVP enable - red */
>                         color->color_r_cr = color_value;
>                         enable_subvp = true;
> --
> 2.20.1.7.g153144c
>
