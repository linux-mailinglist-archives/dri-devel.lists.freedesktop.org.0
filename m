Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF45FB39F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3F910E3BA;
	Tue, 11 Oct 2022 13:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EC410E3BA;
 Tue, 11 Oct 2022 13:44:36 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-12c8312131fso15907060fac.4; 
 Tue, 11 Oct 2022 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hdOgpXIVzr2EZYZkvsQiaauFi/fh0de5ZMVYZE7lDc8=;
 b=fHot2KzfzI6Yjztuqcs7KGUv1VniLbHFwrQWp42/onebcYB1h/acJ02L73XzFS2pfM
 G97du6iYZ0Y9TRwDLUXHW/3nS18bmSN7V+3KggIXkYvqix/UU9VeLvcy9Vtv2gKz6Y7P
 bS71/353KqYgtJZqSAbpI9VoUgVjx4tWrvdTxTNZphOe8zJ/ZpCwlZdbfcnZ1HDI4WUg
 2dbpE3S5xvqPAU+c0aqESMthrux12t9RCcGdeQsf8fKXhzUm4sHTRg1kwB6XZ/qAx9uJ
 U8N+Vy6cCGs4dN3L2mjLTmWmW0MNxAntAg32BNMhofjbqV0rIALl41jvsOg9X+po8Zj5
 Fp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hdOgpXIVzr2EZYZkvsQiaauFi/fh0de5ZMVYZE7lDc8=;
 b=x3Gr1ctH0UnNgDCEPIbmxkTiZ4b/tHUip2fYb1Truy2bh7tQoeQ23ZGk3tx0Knrlnv
 IGbGODO1G2xP0mzHuvzi8yCQnEaCWvGLto/FZVQ06wcmQw/ewfrH0o0VBK165uYYAf8d
 fFLDd5KDBE/s/beoayhGZusibFtWdmwqtMy7uBQsG/wYqTqLJyMj95wvU+uxL2r49mua
 jgdIDpgfi3N1xDgq4X+LboPCkqSj+YNEjGsbxC99EhWQHrZZcz55uw9E08hz5HYnQB0O
 0FI4oZmw6Oq7fNDXS1fOg+fcULnR4SIIMUpwEWZpbdbm1oQfjrjGz/CLxvSLBxZPiFXP
 RPLw==
X-Gm-Message-State: ACrzQf2QQrgty6tx/+fMrEk1Wg0lxlfDeO81gvBCbVBNFv6Lv6k5Xaf6
 tyZ8O4sLGFTHtmmp/WMqZYJRP3XiXHbIxvMSz1s=
X-Google-Smtp-Source: AMsMyM4ImNHwDo4PzM4b6LyAa/QX8U/OBf5aPIiIpkt3nta3iHvW75nISEIVdsNnW7PBSU4pknSYnWUUxZfH7ajrtA4=
X-Received: by 2002:a05:6870:40c8:b0:136:4389:1375 with SMTP id
 l8-20020a05687040c800b0013643891375mr9662275oal.46.1665495875585; Tue, 11 Oct
 2022 06:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221011124103.2123883-1-yangyingliang@huawei.com>
In-Reply-To: <20221011124103.2123883-1-yangyingliang@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Oct 2022 09:44:24 -0400
Message-ID: <CADnq5_Mm0=DNifw=+3hW_4YNRreMjtViLJikB6WsJsaJg+unmQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: fix build error on arm64
To: Yang Yingliang <yangyingliang@huawei.com>
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
Cc: alexander.deucher@amd.com, jun.lei@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

Alex

On Tue, Oct 11, 2022 at 8:41 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> dcn20_build_mapped_resource() and dcn20_acquire_dsc() is not defined,
> if CONFIG_DRM_AMD_DC_DCN is disabled.
>
> Fix the following build error on arm64:
>
>   ERROR: modpost: "dcn20_build_mapped_resource" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>   ERROR: modpost: "dcn20_acquire_dsc" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>
> Fixes: 20dad3813b3c ("drm/amd/display: Add a helper to map ODM/MPC/Multi-Plane resources")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 4a6e867369b8..bbed5685d847 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -3721,12 +3721,16 @@ bool dc_resource_acquire_secondary_pipe_for_mpc_odm(
>                 else
>                         sec_pipe->stream_res.opp = sec_pipe->top_pipe->stream_res.opp;
>                 if (sec_pipe->stream->timing.flags.DSC == 1) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>                         dcn20_acquire_dsc(dc, &state->res_ctx, &sec_pipe->stream_res.dsc, pipe_idx);
> +#endif
>                         ASSERT(sec_pipe->stream_res.dsc);
>                         if (sec_pipe->stream_res.dsc == NULL)
>                                 return false;
>                 }
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>                 dcn20_build_mapped_resource(dc, state, sec_pipe->stream);
> +#endif
>         }
>
>         return true;
> --
> 2.25.1
>
