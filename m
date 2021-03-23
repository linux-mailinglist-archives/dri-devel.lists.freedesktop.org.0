Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E83934627C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6B96E8C9;
	Tue, 23 Mar 2021 15:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E786E8C9;
 Tue, 23 Mar 2021 15:12:52 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so19761548otk.5; 
 Tue, 23 Mar 2021 08:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SAZiBIhngviqShlUYcMIqLkoRDGcp5pdl7KlOZufEbs=;
 b=ZbDu2rn8fNsxu8F9SovGehcfuhr82N1+Txnspq/N5gPtuNK3xwZC22HeaoZUyZzmPN
 D+3lS3ri3Vi4fGQjAwiBzuG54soNmiWJFhyo0GgBVtuc+kkS063aqcJhos0bER1scwGu
 Sgrf6InpqubuhnCLtEzkJrmtPfBSMYooY3TMeOnCRL2OC2Y9lUavvvAi45D1eHkm44/C
 g/QRGtTHJO1WlNvPiGwzKoWjzfBs4tYNBddReyL9GUIsE/8UJicSS/mB8eSp5Idiy69O
 3OLJCd1czzBB+DHsn7nKVedDc3qtrZ/PqGRB7jLY7BKVdH6Gcf3lWsJuc/tyKbeqerny
 i6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SAZiBIhngviqShlUYcMIqLkoRDGcp5pdl7KlOZufEbs=;
 b=LbisBNDE7uQidtc7Sub5c+6m6d12nbYPq7jSlJIO2Rky+jZht51KqpvpfS7UReotI6
 GvzIKwTRXfNHDlJCJWdt340Hywvtk2W8+V8JoSv2Pn+M/vqSluKng7WFmMfyPl+r/zIx
 B2+r3BYwc4nCp93wRTvXOZgjyc6D1q95Um30ZGO1m5E9LK4Re7iv63vdccinvYl+5g11
 8ECcKeuhtnNpxzIUqoN5/CfotaPdT01Myz7lNcPHx7lkLxKAkG26KtKPJ/E5ycK9p9V2
 Q72NhyANwlFghrU9gACW1rG+qjYgNEPqyk8nIhGjHXMJ8kkGyPIth62B6uT7SmYPAwvG
 mkcA==
X-Gm-Message-State: AOAM533DRN6/nuxFQBlITS7Kc8YIMdEHgkYeDQgkp92SY/jg16rTP47R
 4guOTcg+hspPkxWhyGnpbeBOJnZ86TzM5RnbRTUb5qGT
X-Google-Smtp-Source: ABdhPJzZAaNbYPvJqTOFk1n5Xa1ABvpgzcKFUXSzPKV/+WIOQNhS0MW3AGO2JaQaQ9xVy7k5/xNPps9LC+WDytVXetM=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr4838484ots.23.1616512372013;
 Tue, 23 Mar 2021 08:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210323010955.132219-1-wanjiabing@vivo.com>
In-Reply-To: <20210323010955.132219-1-wanjiabing@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Mar 2021 11:12:41 -0400
Message-ID: <CADnq5_MNBuBRGYc3r-PzLaiXO82eWwop+F+G+KDtixj-XiFuAA@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: amd: Remove duplicate include of
 dce110_resource.h
To: Wan Jiabing <wanjiabing@vivo.com>
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
Cc: Isabel Zhang <isabel.zhang@amd.com>, Sung Lee <sung.lee@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Tony Cheng <Tony.Cheng@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Wyatt Wood <wyatt.wood@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, kael_w@yeah.net,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The same patch was already applied recently.  Thanks!

Alex

On Mon, Mar 22, 2021 at 9:10 PM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> dce110/dce110_resource.h has been included at line 58, so remove
> the duplicate include at line 64.
>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> index 4a3df13c9e49..c4fe21b3b23f 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> @@ -61,7 +61,6 @@
>  #include "dcn21/dcn21_dccg.h"
>  #include "dcn21_hubbub.h"
>  #include "dcn10/dcn10_resource.h"
> -#include "dce110/dce110_resource.h"
>  #include "dce/dce_panel_cntl.h"
>
>  #include "dcn20/dcn20_dwb.h"
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
