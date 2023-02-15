Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B418E6986A4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 21:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D02210EC06;
	Wed, 15 Feb 2023 20:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A9A10EBFE;
 Wed, 15 Feb 2023 20:55:19 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id r28so16998542oiw.3;
 Wed, 15 Feb 2023 12:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zmbh1f8KIAJa4cfe7gLSSbxP1FhhqTnT01uu/QY3KeI=;
 b=bPW9aaLh1JaW0780UTgBkKiZwSdh4bZKO9tcXjlNHjGyhyih6rrW2OiaGWHn9GGrzo
 g4u2uJkYpOenZCoRHvtM+r1WPAg4N9NoB7sQIp2XXtNPsbBo6L2tyP/gIKtnULWcj0kf
 bxhhlMkvfKJg3kel4LDav48JbtUKK/hR2DAdP9dDCXcjHFgUz9WyPcWUCt0F8RQgZD7a
 FpP0MRSXQ262bYC2J63HxT5FAaeErd6fo3WKRaqw+8bWeLeBoNqfRbHdqL008vBqRbhy
 PnJpD2z6IEZ3fKibiG7042N+GjXjdDa9K3ax4VSAACfC702VSwGtsMma35HmfEIg17u5
 6NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zmbh1f8KIAJa4cfe7gLSSbxP1FhhqTnT01uu/QY3KeI=;
 b=oTwpPmHURUUY8TvOIXgz47Cyto4z0Z5pzimxI+mx+1t2rW4UxybOLDNSY5UctuZ4Vc
 TlF8dnYzxclqru+8M134kcATx76ddmYVHB9zQiDwTDiO0aUDoGMSto+CwSeyvSdGW9lk
 tBrrPTmuQB2LfhHIR/hCZPSzDy8BAfOl5uUvWQM1y0da+CYN3QTTx/lDcRHUr76qqfyr
 Z3RaPQMxNSNvVbmtZxfxoprw0atpW5iVUuxTckZEnXQL/Ka8E+8LUBcv2zVzm8udxZgM
 tIwg70/r6oLxutf2JZks3KuGOnTLgO+Sy7tRMvcI30TROqduUzXo4jkoMOiE4j6LOl78
 /wNw==
X-Gm-Message-State: AO0yUKVmnLCPtE16kTI63NlddBT0jsZMTJVEntA1r9VVbRIOs9mCjLkh
 JkN2y66DMrm3PO+84/sDMi84Q9wyknO8OAwZDr20Xtka
X-Google-Smtp-Source: AK7set8ABtTTUiS8oZK3RlDNhc5D2N8SMW1l2Ck93cqJrlRu9e68Rq3rGmBhaheeQUX2zCR4+IThgziKrKlEI8GPdmo=
X-Received: by 2002:a05:6808:1b09:b0:35b:d93f:cbc4 with SMTP id
 bx9-20020a0568081b0900b0035bd93fcbc4mr56498oib.96.1676494518455; Wed, 15 Feb
 2023 12:55:18 -0800 (PST)
MIME-Version: 1.0
References: <20230215204547.2760761-1-sashal@kernel.org>
 <20230215204547.2760761-24-sashal@kernel.org>
In-Reply-To: <20230215204547.2760761-24-sashal@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 15 Feb 2023 15:55:07 -0500
Message-ID: <CADnq5_PEGUSTFAzPOQtJFpsBqWQMaox=E1AxE+-h3_FxSbHNzg@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.1 24/24] drm/amd/display: disable S/G display on
 DCN 3.1.2/3
To: Sasha Levin <sashal@kernel.org>
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
Cc: stylon.wang@amd.com, yifan1.zhang@amd.com, sunpeng.li@amd.com,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, roman.li@amd.com,
 Jerry.Zuo@amd.com, aurabindo.pillai@amd.com, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 15, 2023 at 3:46 PM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Alex Deucher <alexander.deucher@amd.com>
>
> [ Upstream commit 077e9659581acab70f2dcc04b5bc799aca3a056b ]
>
> Causes flickering or white screens in some configurations.
> Disable it for now until we can fix the issue.
>
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/2352
> Cc: roman.li@amd.com
> Cc: yifan1.zhang@amd.com
> Reviewed-by: Yifan Zhang <yifan1.zhang@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This was reverted upstream and should be dropped.

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 988b1c947aefc..c026ba532b733 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1524,8 +1524,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>                         break;
>                 case IP_VERSION(2, 1, 0):
>                 case IP_VERSION(3, 0, 1):
> -               case IP_VERSION(3, 1, 2):
> -               case IP_VERSION(3, 1, 3):
>                 case IP_VERSION(3, 1, 6):
>                         init_data.flags.gpu_vm_support = true;
>                         break;
> --
> 2.39.0
>
