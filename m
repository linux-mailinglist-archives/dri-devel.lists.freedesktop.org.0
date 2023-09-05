Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6FF792C8C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EAD10E200;
	Tue,  5 Sep 2023 17:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B4110E200;
 Tue,  5 Sep 2023 17:38:37 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1c4c5375329so2141437fac.2; 
 Tue, 05 Sep 2023 10:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693935517; x=1694540317; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Z5P61rHX3TJCqeK0dVJotGAV1FyleJ9U0LtLbQPTDk=;
 b=N1UGvzgbPN16qKg5dEJQVOTPnbnJgXew7MxudYaI+EEsQ/y9ubaYAIUbVUWJc92Vr2
 8W54TJan1E8pi6PzKB9D8CSj5W3gUTqgzB24+cDd6S0Aku10FEMNKLAoHxJ43XeGKHAU
 T2d0/VmpXfR6IrnLghGzZ1AKZFD9L8Sgq6k48yqQq9/sLICGqNobMvLM5YawQPT1UNQJ
 YtT6DW/6wMR5swu4LlTvC6mclVeMlFtu44E42RumQ7RCZGHPMigzfVItrRhzhxU5nTiN
 RtNl0fKAYwahruJCHiKNKZR0+8Lz4Gly76Ey+E815hqOYoTDw8a/k+XKt0DMwLP92R5p
 5f4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693935517; x=1694540317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2Z5P61rHX3TJCqeK0dVJotGAV1FyleJ9U0LtLbQPTDk=;
 b=Is8iJFK8J8UQ81yHtasv9AMxM3LcVqYLmYifEs9A8AHuD5kKmZknIRhmTDe7Fxl5w9
 cWFnTUG8aioaN5fntsyxt2jrN0qzOQi7ZU/LcvHmsCoOoxZoWNWLOpTFDI8cbexz4R8V
 c1jBcOhlcjJD97f6PH/+fzYOMfTfpIwpgelP2od8BvLRwyjUwd3WzBt4ksxMZN5We3mJ
 xjWSFzMywGT1yaXxlODWdEqlH/LiLDIKy92mHBWMRwVTPFzyAHysW6UZkMClvTJXAk0I
 EpnKRZ8EX/PXExwzdtE8zG3HM1HEBgo9ogf00bS7W7CnIBZdxe3RXyL7HvR/Z3P2XYi5
 6+hA==
X-Gm-Message-State: AOJu0Yx5wFf5rW8/5IIKV8R/RtlgJ2s8pdcQPnNk2f6U0lrrNNf+FYxJ
 5uMqiFPh9lviHcfQv43aBBybvqj3hdmBMhQcrrw=
X-Google-Smtp-Source: AGHT+IHPib75naSjYJTJfVF7LppbLLE6k6pU+0i1iZmAN1p38X6cF2pRWpirWqMujp6N2mdrF24R5dwzOOJvBpK6oQE=
X-Received: by 2002:a05:6870:b027:b0:1c8:b82b:cbdb with SMTP id
 y39-20020a056870b02700b001c8b82bcbdbmr16663096oae.33.1693935517234; Tue, 05
 Sep 2023 10:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230901012924.120196-1-yang.lee@linux.alibaba.com>
 <20230901012924.120196-5-yang.lee@linux.alibaba.com>
In-Reply-To: <20230901012924.120196-5-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Sep 2023 13:38:26 -0400
Message-ID: <CADnq5_MO1+vf=SBJ4jpGab-fXMOfuJ7j=JgHBNJhaqYZsSNwow@mail.gmail.com>
Subject: Re: [PATCH -next 5/5] drm/amd/display: clean up one inconsistent
 indenting
To: Yang Li <yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Thu, Aug 31, 2023 at 9:29=E2=80=AFPM Yang Li <yang.lee@linux.alibaba.com=
> wrote:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn35/dcn35_fpu.c:260 dcn35_=
update_bw_bounding_box_fpu() warn: inconsistent indenting
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c b/drive=
rs/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> index 525ca0ed9ea9..46eb2d0592f3 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn35/dcn35_fpu.c
> @@ -348,8 +348,8 @@ void dcn35_update_bw_bounding_box_fpu(struct dc *dc,
>                         dc->debug.dram_clock_change_latency_ns / 1000.0;
>         }
>         /*temp till dml2 fully work without dml1*/
> -               dml_init_instance(&dc->dml, &dcn3_5_soc, &dcn3_5_ip,
> -                                 DML_PROJECT_DCN31);
> +       dml_init_instance(&dc->dml, &dcn3_5_soc, &dcn3_5_ip,
> +                               DML_PROJECT_DCN31);
>  }
>
>  static bool is_dual_plane(enum surface_pixel_format format)
> --
> 2.20.1.7.g153144c
>
