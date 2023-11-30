Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0B37FE818
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 05:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7B710E6AE;
	Thu, 30 Nov 2023 04:03:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C910E6A6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 04:03:48 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5cc642e4c69so5498827b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 20:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701317028; x=1701921828; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jxl8V7SoUueHtisey+knlKp1RuXYZdbFzSs7V8BWyIE=;
 b=U76vRu/lRVzlr4A/EVwzMvOuZ1Bu5iNDYm4YwdQgu0n0L/8m/WakCs2pE5LLn21rrv
 MNyetnNIvB2ShYwr6grWDMR3NwHsxbu9//D3Nj0zd2pcStFQ+g2dFJ+6YlCFPmSTtCoY
 39DyQQrktsKfnS3YrnMKpNWvMOlg3Vttj23Z7TvNRYSj8Cps7DNgij51bjvH09OZHLCk
 nm53N/txrjQsBllqLw0kd9LvAzo6vQoit/llvO0R0i6BpgiLDMl815bTafQ8mzKuayXE
 xRbpCprw4fLjYytlqfd11v/1UMFshlWCz6d+ZiXO9MnAJrjZw7noYG1yTO16ngxNz4SO
 g/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701317028; x=1701921828;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jxl8V7SoUueHtisey+knlKp1RuXYZdbFzSs7V8BWyIE=;
 b=nZD1Pf80WdjAQQE4A71pIS/kx3hXm68/yHIx4vUatQrMvQJyyvEah9bTEbfoB5BY9z
 EgErP0UIhdNMtF6Mo7e4c6+6/xylSwIXJhSYin/Vkz7C94q2MEf4++zpZiLOutMg5qDq
 c5laUiPqP8EC4jaxW0O1kgY682YFuCf0H9CbHQoi5NoLO9uonfrBaJk5t+8Sf+Ka/R2y
 9/xBeA88uhF00v3azzeogNcpOf79zbE0OwryVF93spz3eedHln9bp+1kv9MtYDLArdb1
 73S5O6jz2pVLOPebkgrdvv8wYniXO4/xp/UJte0E7Wfh8gf6F9qh6rZEYmJUsNcFvPhl
 Idbg==
X-Gm-Message-State: AOJu0YxMTasuMjJZiWK0LrZuNPABGHWx32MeSl1BO0txe04veXJvLOJ9
 NUGumo17xiYHr+SlUNFpCnb0qrVuPwJyRW7NmwCWBg==
X-Google-Smtp-Source: AGHT+IEwWLHqph3JGgHycFzt1NMlSK3FF6ZkBFWeALtSzoO9O/ZiigKO6lVXvEx4s2H9Pp71up9RUvjDqtMEhNaWtmY=
X-Received: by 2002:a81:93c6:0:b0:5ca:71fe:4dbc with SMTP id
 k189-20020a8193c6000000b005ca71fe4dbcmr19556613ywg.49.1701317027922; Wed, 29
 Nov 2023 20:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <20231027-solid-fill-v7-2-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-2-780188bfa7b2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Nov 2023 06:03:36 +0200
Message-ID: <CAA8EJpoKvufcKvkYCBY2XoLVkbdNK_O1TFEGe889ETXeqR=dpg@mail.gmail.com>
Subject: Re: [PATCH RFC v7 02/10] drm: Introduce solid fill DRM plane property
To: Jessica Zhang <quic_jesszhan@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sebastian.wick@redhat.com, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com,
 Marijn Suijten <marijn.suijten@somainline.org>,
 wayland-devel@lists.freedesktop.org,
 Sebastian Wick <sebastian@sebastianwick.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 28 Oct 2023 at 01:33, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Document and add support for solid_fill property to drm_plane. In
> addition, add support for setting and getting the values for solid_fill.
>
> To enable solid fill planes, userspace must assign a property blob to
> the "solid_fill" plane property containing the following information:
>
> struct drm_mode_solid_fill {
>         u32 r, g, b, pad;
> };
>
> Acked-by: Harry Wentland <harry.wentland@amd.com>
> Acked-by: Sebastian Wick <sebastian@sebastianwick.net>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  9 ++++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 26 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_blend.c               | 30 ++++++++++++++++++++++++++
>  include/drm/drm_blend.h                   |  1 +
>  include/drm/drm_plane.h                   | 36 +++++++++++++++++++++++++++++++
>  include/uapi/drm/drm_mode.h               | 24 +++++++++++++++++++++
>  6 files changed, 126 insertions(+)



-- 
With best wishes
Dmitry
