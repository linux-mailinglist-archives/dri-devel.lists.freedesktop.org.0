Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CC162194A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 17:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE7810E3C4;
	Tue,  8 Nov 2022 16:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8380710E3C4;
 Tue,  8 Nov 2022 16:25:05 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id h132so8155713oif.2;
 Tue, 08 Nov 2022 08:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a+8Yf/sZNwiNDUj/OMYT77J47waMsvsoaujY8tR8y14=;
 b=EFa7PkfPRlnNLAkXTEiEnYgZ6Y/YaZgVL3Mejm9llw7t8k9z2FPghpxGNhbq6VFRz2
 k7PwoEROsjYqFNWwtx5OsaxUU5VihVUmV33d3R8czegD4Rf9mz6bKtYLqY6LUL3yJ2kw
 qyM56Dyue5UAeC1R+nQWfRqk54qAo78RUOhkcKka8uYp35x5E655VZB55hwSxBXKGtsk
 x/YE+JhmfgoapqnX/pKbhmS+Sv7/WyGNIDFWvkvr1D7BohVGprfjMHJSclZc2dSIaVHN
 4AHbgUQrN6Mgqb0OFic4NvD3QVYHX5cT6tVHFXkG7c4aH5c91EF6OIz/o4cQLVa0iZcd
 wneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a+8Yf/sZNwiNDUj/OMYT77J47waMsvsoaujY8tR8y14=;
 b=x+2PxVCxTAiCrPGijX0BJOHkF4t8RfmqJdq/sdNrqlChHCRnXNNVNenyjFNLpM1aub
 yKZpBtKGBUiHdq7QM/djGg81NVE3/iHQ4KAE6xLqRJTEsOzcfscF8fptj4CWshNaZjQO
 IuYM69jZYHAZcix/ryzc+P5D1NCcNVDj2YMXi/Qg9aYy7iI5lQSEoayjT1IJqVoW3fDt
 PXYt//ynjfiIXcHYl344OX4UbjxkuBK0z6kHlUj9QXXCA2gyYcTSi5SXlP/b8KupYkq/
 S7HtFYghfNYVoxZvZOTgJZakKuFlO+FBGQ0e1I5nU475tJA0DRqAE8Ngw5af43aJYDlb
 OBbw==
X-Gm-Message-State: ACrzQf0n/Dbw1bsGPYXOQFVwpjY5WpVT1eIOCPtAMG0m/Sqje81bsyJh
 VBqMfRvWE6p8ey/91oLHDin/3dROoboqsD/+cmQ=
X-Google-Smtp-Source: AMsMyM6FnW3smzsc2vqX42JCVFSvKrKyc0iMu552UOAzqJ/Mwzlw4oMjND0EEJAJMN56tBl6uBS3XHec1Vjmj7CzLVM=
X-Received: by 2002:aca:b655:0:b0:35a:4fb4:c3d2 with SMTP id
 g82-20020acab655000000b0035a4fb4c3d2mr16042060oif.96.1667924704519; Tue, 08
 Nov 2022 08:25:04 -0800 (PST)
MIME-Version: 1.0
References: <20221107143715.279841-1-carlos.bilbao@amd.com>
In-Reply-To: <20221107143715.279841-1-carlos.bilbao@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Nov 2022 11:24:52 -0500
Message-ID: <CADnq5_M9EvboWq9Oi58S3Rgh_U2_sNXGDA57NCh-oJWUedAN4Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Amend descriptions within enum
 pipe_split_policy
To: Carlos Bilbao <carlos.bilbao@amd.com>
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
Cc: sunpeng.li@amd.com, Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, jun.lei@amd.com,
 christian.koenig@amd.com, bilbao@vt.edu
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 9:37 AM Carlos Bilbao <carlos.bilbao@amd.com> wrote:
>
> Correct descriptions of two last fields of enum pipe_split_policy, updating
> comments with proper field names.
>
> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index bfc5474c0f4c..277631a899d8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -457,15 +457,16 @@ enum pipe_split_policy {
>         MPC_SPLIT_DYNAMIC = 0,
>
>         /**
> -        * @MPC_SPLIT_DYNAMIC: Avoid pipe split, which means that DC will not
> +        * @MPC_SPLIT_AVOID: Avoid pipe split, which means that DC will not
>          * try any sort of split optimization.
>          */
>         MPC_SPLIT_AVOID = 1,
>
>         /**
> -        * @MPC_SPLIT_DYNAMIC: With this option, DC will only try to optimize
> -        * the pipe utilization when using a single display; if the user
> -        * connects to a second display, DC will avoid pipe split.
> +        * @MPC_SPLIT_AVOID_MULT_DISP: With this option, DC will only try
> +        * to optimize the pipe utilization when using a single display;
> +        * if the user connects to a second display, DC will avoid pipe
> +        * split.
>          */
>         MPC_SPLIT_AVOID_MULT_DISP = 2,
>  };
> --
> 2.34.1
>
