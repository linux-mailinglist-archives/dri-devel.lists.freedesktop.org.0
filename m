Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3DA39FF05
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 20:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638236EC26;
	Tue,  8 Jun 2021 18:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B646EABC;
 Tue,  8 Jun 2021 18:25:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o127so2442748wmo.4;
 Tue, 08 Jun 2021 11:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dpc7jDBgR4bRpyMxKiXPomFG+A3xIaiwS0cF873d9mc=;
 b=KWkZvnHH4nxrApOkUehAeCyA/rXa/6rXfhy3TXCuxO1ELjYLR5JOVuwHID6fMdUdR3
 So2WEZVTMUm7TerayCLetB7N4TU3eSAIApIImU/UB4CF1z250RdTgeJtQjfyVUMSLekd
 KJUQCeb3AHWCAF8IBtH+H+L360Y53dugYCoN0QKIjQYnWj+Cc5kYwBUThnKeHNQCR7In
 neh8DtKATy4ZxUB3FsTUR2liOFldzj0hmjOl1W0y9XuBAklsRhIarK+8ytPMZmh6JGY3
 ik4VvTClouqJoxnl8Mds2dDLyVwducLo+GV1QJFmFRGcifmCsL6p2TTuuxifajUhON1A
 0c2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dpc7jDBgR4bRpyMxKiXPomFG+A3xIaiwS0cF873d9mc=;
 b=ERNvDOqeGoDHZBWzMA8UlGsVAJ5zByr1hUdG0GzeWsHopNKH+F33bXP+2WB19DkFEp
 wLflJriQH3mCeDWmII+f1WAEn55LgOpSj83gL0d0g0PuqwIC+MnzWt/dWNqnYkHcrMR5
 nve6TyYraLqzGGObppnQ0kR5kbrfUbWqAFrZDbL5//CPdzU9/Rg2ZTp1mnQOcbsSAEW7
 34WI0El6oCsHNStj1SusULAxwAthjyV2OIoMk38h26TYUIxOq/SONMBoOfP6dtD50dpJ
 lOFJ5lLT+X5FYzrZDUqCoPqz45hcmQ9OvBZKBn3R/Z8XuSKr5j808zrN0cJvTkgl2Vxw
 Urxg==
X-Gm-Message-State: AOAM530p7ouchMAvdKiLnYWK6bvt8MCQt3CuO+Cq8JB3q4KrX7J7PnkP
 jfQCXnLPa8TjGOYir7IMS87vk4NHkoz9LaM2642a+Vha
X-Google-Smtp-Source: ABdhPJx9NnFyX8wNc/FCRYHa2nklvr22qyrJ85Vop8BJ6EWvcd9fUqRCCIPSZwGzWxtXWq5SbvlnnUFj17ZgcRkBZnE=
X-Received: by 2002:a05:600c:1c84:: with SMTP id
 k4mr5813076wms.164.1623176727348; 
 Tue, 08 Jun 2021 11:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGs+zjKrj2_oU0ByF=UqBgh3oEOuNkNem3eg5HcFhffmBQ@mail.gmail.com>
In-Reply-To: <CAF6AEGs+zjKrj2_oU0ByF=UqBgh3oEOuNkNem3eg5HcFhffmBQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Jun 2021 11:29:21 -0700
Message-ID: <CAF6AEGsKyvkreMM67HY2Oi8LN=-w7sB7NWVoPdyfaJ8390Lz=Q@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-fixes-2021-06-08 for v5.13-rc6
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

sorry, spotted a small typo, I'll resend this shortly

On Tue, Jun 8, 2021 at 10:32 AM Rob Clark <robdclark@gmail.com> wrote:
>
> Hi Dave & Daniel,
>
> A few late fixes for v5.13
>
> The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:
>
>   drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
> 16:26:57 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-06-08
>
> for you to fetch changes up to 924f4cba9e68bf2b4717e7941697db96c6f203be:
>
>   drm/msm/a6xx: avoid shadow NULL reference in failure path
> (2021-06-08 10:08:05 -0700)
>
> ----------------------------------------------------------------
> Alexey Minnekhanov (1):
>       drm/msm: Init mm_list before accessing it for use_vram path
>
> Jonathan Marek (3):
>       drm/msm/a6xx: update/fix CP_PROTECT initialization
>       drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
>       drm/msm/a6xx: avoid shadow NULL reference in failure path
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 155 +++++++++++++++++++++++++---------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   2 +-
>  drivers/gpu/drm/msm/msm_gem.c         |   7 ++
>  3 files changed, 122 insertions(+), 42 deletions(-)
