Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A38A829C
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 13:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54F410E9BD;
	Wed, 17 Apr 2024 11:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vRRpcf1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C5310E9BD
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 11:58:37 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dcc71031680so5497524276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 04:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713355116; x=1713959916; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ox5LPkHgtGr2/XHUCfFXXYvppG+HqbU+7l8WZ9khYtU=;
 b=vRRpcf1FhG3B+fGLt7XoI6Zkc3ZCUa3Y24yPxm/wWbIeaxlsCRlFUzMdQeTqq+2BTq
 LNZcsHHIWhCZaQ3U2uikMiUWBVn2XlBteL95LdX/l3okdMN8WF8QZhZdB8f78YF5lY5V
 2QSFy8AYR7DXxdkd4jU8AV2wJ+aR34z3gh9GKCMLsiOw5DDmWnBq7qgJJRfvpbfq5T3G
 6V/CkEunIXeO6Wc/pK/CeuJ76UDeHyD9w4OLmUHZRCfnl4e7jRZhyJcpxGKBUXBUJqXF
 SlEoWKzciN8+fvF1SWfsOvjZ9WraStG4H1F8gwpFWtLemxK5I33sbofBUnaWHphwj7by
 oQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713355116; x=1713959916;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ox5LPkHgtGr2/XHUCfFXXYvppG+HqbU+7l8WZ9khYtU=;
 b=kqXV56NaFbkeRjKZBUtGpVMb3YBEpW5YXHsPtPovEwJjOFkEHqZH+SKOY0tho/V4Jh
 sKQmecJPu7RoGGu2FS+jdMj8ywixk/khKjVFfUXae89iVNIUI6cQP8a0mo2x947MaI68
 E4er/3KpXVU8hcaXKj2MDuogcIoHfpStEHFoOLbq57HGEuDTpj3BKGu5KIWM+qNXYYf3
 ekopO7VdLqy6A5N2lk/mJ03Gqgn+w7iFo0L09+fPClF6jrWv/8GFgjCvOe9ktVULY2Ib
 j7O2yFWjY8EPP25OkpGkVOG65DKVI0rTcxHOcWjQhTfECE1IX9b+1cUPxI6xqDYxKtSZ
 2pMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyNwOBgYuA1G+g/ZxNHlheIie61mjiHmaLbHu5a6Gy224n/14WoTQC15s9xeA1BsYHekYbbBVHXPWLZzVYAEw35KstKGz/x8PGbseiaANT
X-Gm-Message-State: AOJu0YzzHa09mi0cAgqQNEe7MMzy1p2CWssgOcjmFNOAS1F3Vdl4n2PU
 g8RlM4msUcaPI18bcjq0IKsr6weExApHcdoJivb7FZ+b3vyxakrveewJPRR6Z+LChx/Q/sJ8Q7i
 bm/rRUHXMmhNvOt5u2cnanJz57s3j936Dkv9GQQ==
X-Google-Smtp-Source: AGHT+IHroa6k1HZ0B1EjkdHyvkWVW2/keRVisrkhSaTkSXI+Xy1B+n4dLICjNC9Mn6XDdWwQWSgpT8LgLcWwaM+pobs=
X-Received: by 2002:a25:3d05:0:b0:dc6:d093:8622 with SMTP id
 k5-20020a253d05000000b00dc6d0938622mr15444148yba.15.1713355116056; Wed, 17
 Apr 2024 04:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-2-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:58:25 +0300
Message-ID: <CAA8EJpq-1QwoM2hEyegpfKnVH+qrswjmTd_hpYs9d9B7gikHjg@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/dsi: Pass bonded-DSI hdisplay/2 to DSC timing
 configuration
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> When configuring the timing of DSI hosts (interfaces) in
> dsi_timing_setup() all values written to registers are taking bonded
> DSI into account by dividing the original mode width by 2 (half the
> data is sent over each of the two DSI hosts), but the full width
> instead of the interface width is passed as hdisplay parameter to
> dsi_update_dsc_timing().
>
> Currently only msm_dsc_get_slices_per_intf() is called within
> dsi_update_dsc_timing() with the `hdisplay` argument which clearly
> documents that it wants the width of a single interface (which, again,
> in bonded DSI mode is half the total width of the mode).  Thus pass the
> bonded-mode-adjusted hdisplay parameter into dsi_update_dsc_timing()
> otherwise all values written to registers by this function (i.e. the
> number of slices per interface or packet, and derived from this the EOL
> byte number) are twice too large.
>
> Inversely the panel driver is expected to only set the slice width and
> number of slices for half the panel, i.e. what will be sent by each
> host individually, rather than fixing that up like hdisplay here.
>
> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
