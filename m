Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2399F7651
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 08:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881CE10ECB5;
	Thu, 19 Dec 2024 07:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="w9Sh0JKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F7D10ECB5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 07:53:50 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6eff5ad69a1so4278447b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 23:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594830; x=1735199630; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZhKlO/IptDE5jyqk3Xmfuu5iUOAfV8BaMvi98b0zJY=;
 b=w9Sh0JKlh9+vYE/MlEIOvKgh/cpsZtKLyLzvIq3QVyAemdqEIq63K4u1otVK28UVl2
 wD0LOnevLu9ueEoMYEAqi5qQCvP24XVyC89TlZDTCewnktx0eI7ridKRB239jfyWcFue
 9YJ0oyFCTTIKU8ozFZTPjd21BC+kpvRzfjsCInUmgXezpc8Iz8y2GmDsjpAO/S1u+F4a
 EgEZqnEFlJpuHuBYpenErw82KJwS4Yir0TzrNFJyV1a16/R23+tZEbfAeSD9OJNDIxax
 MCFkfh+q2SzElle9hEibldj6IaQbU+xn3hLx4vuuivMH+J3EWMqOUOmBvi0ExECJ6aTQ
 mhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594830; x=1735199630;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZhKlO/IptDE5jyqk3Xmfuu5iUOAfV8BaMvi98b0zJY=;
 b=mYi37IVV7YVwECb6/7y9VTuonmF7pg5dx8e5knPglD9UDCheevVDlott0HWBokLMI6
 Wt8PNgsV72wjNLrofA8Kazp2fgDtXP+VzhxU0XWPqZHW3mftyQYVEUZTT5unOs3YkC01
 RtsAyYZN6T2r+s9T/kSuOPWznuYFSydjiIziawSMrA2AisL49AFFtv8+54dsAbB4AA3e
 EBIbqxO3nacIpBga/qDgER9Q2YPiRGl7caoyT2m9IZkpl1rLmCZeaMITSOZNC32uad8Q
 qdJvDapW4CiF7z4xQuGj6HXqeRuO2NwcfWLUmPGIULDNJZEnABocRvII/SeSmPQkc9df
 +Umg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2iw6jMIaG+SJV9asUCHfcF/KfStRKysnyr/UR/lSEqnl/3khMCKL7OuVUXHGBcXxtl5jRZ+6sDvM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmsEi/uN4EKjbv9w8B/UGb3cHsHpFOpzNQbebZs2mjhNBuay4C
 bMFRhRpk9HU5AmmkGxN7xt8Vv+Jp1JBxwr4BgOro8+LF98BwGc/Kl6/SHyFmujwb6QdO5Ug1aeC
 QukIFPPMHFsIdQrPmieJh6zm/mhUF7c1lFI/1vg==
X-Gm-Gg: ASbGnctMIbAy2YY9j/iQgaCR2S7BXIy1tYM+8PO0Vp6sSaZ3WpdZlGcg3yaHjyUuJwq
 +xsrEchM/zWlrGqMA6DaZiWj2j4INWjhuxZGUyXQ=
X-Google-Smtp-Source: AGHT+IHWrLjcvkgONZ+j/BKJ3YumZP/eZvJ2y2xElKYDKii2UHE9RCFq3yxovVi3IZ6O2JaUt8yiyGK5pHM15WJDTq8=
X-Received: by 2002:a05:690c:6404:b0:6ee:a81e:6191 with SMTP id
 00721157ae682-6f3d11239d9mr51702047b3.22.1734594829867; Wed, 18 Dec 2024
 23:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:53:39 +0800
Message-ID: <CABymUCN_17o7xpvv1DjfAe+o07-Ns85G+d4W-8bmz=t9hWS6NA@mail.gmail.com>
Subject: [PATCH v3 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jun Nie <jun.nie@linaro.org> =E4=BA=8E2024=E5=B9=B412=E6=9C=8819=E6=97=A5=
=E5=91=A8=E5=9B=9B 15:49=E5=86=99=E9=81=93=EF=BC=9A
>
> To: Rob Clark <robdclark@gmail.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> drm/msm/dpu: Support quad pipe with dual-DSI
>
> 2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
> And 4 DSC are preferred for power optimal in this case. This patch set
> extend number of pipes to 4 and revise related mixer blending logic
> to support quad pipe.  All these changes depends on the virtual plane
> feature to split a super wide drm plane horizontally into 2 or more sub
> clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> whole drm plane.
>
> The first pipe pair co-work with the first mixer pair to cover the left
> half of screen and 2nd pair of pipes and mixers are for the right half
> of screen. If a plane is only for the right half of screen, only one
> or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> assinged for invalid pipe.
>
> For those panel that does not require quad-pipe, only 1 or 2 pipes in
> the 1st pipe pair will be used. There is no concept of right half of
> screen.
>
> For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> the single SSPP and its multi-rect mode.
>
> This patch set depends on virtual plane patch set v7:
> https://lore.kernel.org/all/20241130-dpu-virtual-wide-v7-0-991053fcf63c@l=
inaro.org/
>
> Changes in v3:
> - Split change in trace into a separate patch.
> - Rebase to latest msm-next branch.
> - Reorder patch sequence to make sure valid flag is set in earlier patch
> - Rectify rewrite patch to move logic change into other patch
> - Polish commit messages and code comments.
> - Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd=
-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org/
>
> Changes in v2:
> - Revise the patch sequence with changing to 2 pipes topology first. Then
>   prepare for quad-pipe setup, then enable quad-pipe at last.
> - Split DSI patches into other patch set.
> - Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-=
mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
> Jun Nie (15):
>       drm/msm/dpu: Do not fix number of DSC
>       drm/msm/dpu: configure DSC per number in use
>       drm/msm/dpu: polish log for resource allocation
>       drm/msm/dpu: decide right side per last bit
>       drm/msm/dpu: fix mixer number counter on allocation
>       drm/msm/dpu: switch RM to use crtc_id rather than enc_id for alloca=
tion
>       drm/msm/dpu: bind correct pingpong for quad pipe
>       drm/msm/dpu: handle pipes as array
>       drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
>       drm/msm/dpu: Add pipe as trace argument
>       drm/msm/dpu: blend pipes per mixer pairs config
>       drm/msm/dpu: support plane splitting in quad-pipe case
>       drm/msm/dpu: Support quad-pipe in SSPP checking
>       drm/msm/dpu: support SSPP assignment for quad-pipe case
>       drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  77 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  74 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 403 ++++++++++++++---=
------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 219 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
>  13 files changed, 511 insertions(+), 348 deletions(-)
> ---
> base-commit: a9b9ea7b45d661fff0f3fd2937703a536f528cd2
> change-id: 20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-2bdbc2=
2f5131
>
> Best regards,
> --
> Jun Nie <jun.nie@linaro.org>
>

Sorry to have no title for cover due to miss handling the b4 tool . So
reply to this thread with the title in it.

- Jun
