Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F83780C84
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065D710E510;
	Fri, 18 Aug 2023 13:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB99110E50E;
 Fri, 18 Aug 2023 13:28:42 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6bd0911c95dso751309a34.3; 
 Fri, 18 Aug 2023 06:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692365322; x=1692970122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3niGq6H8AJo9IW4o/nVMSYi4n92JBNuP1VAfWV0dVo4=;
 b=aRJ0hy1TD9BipgvTZaaiUwLrhPaftOcQPG27JbjAMIJhhyyTajRK8VXdb6/D4saWyh
 ynTiZ9tlGUOmsn2tQW7IL5wgWKM8EvKpWyP3Bb7Dun5pWrd/6yJxr5mv44JhiMTQEns3
 qHFQciWQsKwObJLbvSnk6W2VJqGP2Tld3XJWUURE/rMsm+hYufLBNerwFeyJW6yFYbaM
 5mzP1XKpIoFVgybsfhV1G3dv9pnL1q/VpA/3nu9Ddic6+VlyoRBu8k3mtp3iilYQ30Zm
 O8KDYE/xFtlFYjYA+6hN630KXW8pFzUUetgq4I1e3L1Xi9lJJU9rnc226aLafpQB5PXc
 gDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692365322; x=1692970122;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3niGq6H8AJo9IW4o/nVMSYi4n92JBNuP1VAfWV0dVo4=;
 b=iKCxbiHf+jspMzfbS6dZv3hNAQfU4Y/P1G1zjYs7MKAQvQC7snc1UuKgfXhFTIkZ3Z
 /fU1ox8QY8JQUDmoGC1gE+5kv0uk+6dhxStUsviwLdq39zM32FgaMpQvZCZkcoQpKw4F
 cc8cjBcAc2VsU1c3kBmubdA9XaHmHqPVQ5gxmMMzDC+SMKueiFK0LvLSleY9vQbqTs1q
 DTKGHOTh+9vAl5ck/beCdCYS9SiRNnG2G7StpVxvrG9S6H5gCZ+XMDd0yTK5RHGDOCtO
 BrXHM0TQSN/R0fHY3xYLkaHP30Q49qx4vofn0NFCl9GPYOUOzB4ubOFsJ7zgzMMYV6Gt
 Rlfw==
X-Gm-Message-State: AOJu0YyJ9hOe0ci0zbnaxOUikky44Ies/t5UMB32I7EX9UKunlxNkwNg
 FXc9uoVoSS7n2lvpZtPNS8lx2IQs2QYN8WMLDzc=
X-Google-Smtp-Source: AGHT+IEVr16uL1Sq3eXXDiiAbsZ27vFlyigu9Sb+vdMlCXTrDuEZmhwcgVsPOM21VzqeflmkN5s0gW4p3iJezTaRtxE=
X-Received: by 2002:a05:6870:e314:b0:1ba:3a7f:50eb with SMTP id
 z20-20020a056870e31400b001ba3a7f50ebmr2818671oad.22.1692365321864; Fri, 18
 Aug 2023 06:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230818131742.88763-1-hamza.mahfooz@amd.com>
In-Reply-To: <20230818131742.88763-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Aug 2023 09:28:30 -0400
Message-ID: <CADnq5_PjGmULp42JLcOZy1r-_S0t+FTz5H1MTz55GFcDgJQobA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix mode scaling (RMX_.*)
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Alan Liu <haoping.liu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 dri-devel@lists.freedesktop.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 9:25=E2=80=AFAM Hamza Mahfooz <hamza.mahfooz@amd.co=
m> wrote:
>
> As made mention of in commit 4a2df0d1f28e ("drm/amd/display: Fixed
> non-native modes not lighting up"), we shouldn't call
> drm_mode_set_crtcinfo() once the crtc timings have been decided. Since,
> it can cause settings to be unintentionally overwritten. So, since
> dm_state is never NULL now, we can use old_stream to determine if we
> should call drm_mode_set_crtcinfo() because we only need to set the crtc
> timing parameters for entirely new streams.
>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Fixes: 712237a4a1b4 ("drm/amd/display: Always set crtcinfo from create_st=
ream_for_sink")
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Does this fix:
https://gitlab.freedesktop.org/drm/amd/-/issues/2783
If so, add a link tag for that.

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 3b27b7742854..e9aff5014e39 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6035,7 +6035,7 @@ create_stream_for_sink(struct amdgpu_dm_connector *=
aconnector,
>
>         if (recalculate_timing)
>                 drm_mode_set_crtcinfo(&saved_mode, 0);
> -       else
> +       else if (!old_stream)
>                 drm_mode_set_crtcinfo(&mode, 0);
>
>         /*
> --
> 2.41.0
>
