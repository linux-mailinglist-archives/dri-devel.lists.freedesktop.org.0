Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0A177049C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884BA10E093;
	Fri,  4 Aug 2023 15:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F4310E093
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:28:26 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d066d72eb12so3256788276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 08:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691162905; x=1691767705;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bOp+t06WK94f00hVoOjlTqLRBmqA68qFwjlm/n5u6Ec=;
 b=xHyAU5gFLrQk/gFvvaEuvE4iL524vBoq3VFKmFGmMrJmlrLhZ8ekaq6F3/eh661EnK
 UJx8eo2HkhJY/2v3qR0pPpqKEkGXXLOzA/IvPPkd+5jaEPwY1Ngv3Ljw4B/mGDWp6aJK
 U2OEf6+L1JpngBNlD6LdMhd5wf8Rx7GSYyBh3eQtosM8yz2CH69AJQohmY3pnrKAv2zn
 Yu6NCNB4LW4fzH5xJj4Kkt3EPcv8LFnL16A+0GbnMWkHwa6PHFgSRbJlFmYNrQTwnFCw
 fQwlAwv2JxvwaL/Gi26pgvLI04zes8zfaEXA0T6hfuDa/bxieF4/dpfgGKWORaWxaDyO
 bvQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691162905; x=1691767705;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bOp+t06WK94f00hVoOjlTqLRBmqA68qFwjlm/n5u6Ec=;
 b=kyBmS4El2faodsuNPkQFCQRix79rLDGdwZb0t6AB1DsboUS40VMVX1RV4nJlt1yNsk
 8kSGDRSPKT7M3iif5ZcV13Ny0dIqMQ75HfEKCvlxuLoaYLrwCgKXNkmWp/ebF4ZOfjf+
 eYF+567Ikm4jd/h5fN5st3yLq2CikcXVW5ZDDhEtjwFDyWgKAK7m9W0OcBqhtAobymnK
 Qd/m9a0Bl/pbe6H3Vjc1rSBGdhUtZB5Chz/DALqGJEcjCW4DhV+6j7iEjNFuCPvZnOuB
 /hMy+ev5t1v54LRSJqyorbuxaHl9izErtdxKy5/0y8P/BuJLg4DxjXvm6iIbhiw/prT9
 XFtQ==
X-Gm-Message-State: AOJu0Yz5Bvgj3P0gObz+uhSvQjhZkEIOdGhLWmgT8/+vH8jZgSg627DO
 QLuqfQlcFpr8yEaSoh4PSnMHsjNToJewI9gXJpkY/w==
X-Google-Smtp-Source: AGHT+IHqkYFEA1xwnINMzjY1othogdYg+XLYUdXpv/bsW9GIOBmficGrOej0iBqP7HOWy9w0haZ7t5epondlOjOTEac=
X-Received: by 2002:a25:fc5:0:b0:cee:639a:be94 with SMTP id
 188-20020a250fc5000000b00cee639abe94mr78778ybp.0.1691162905601; Fri, 04 Aug
 2023 08:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230727212208.102501-1-robdclark@gmail.com>
 <20230727212208.102501-14-robdclark@gmail.com>
In-Reply-To: <20230727212208.102501-14-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 4 Aug 2023 18:28:14 +0300
Message-ID: <CAA8EJpq-Z7vNJjQML6waeHOAvQ_1EtU0Zx5-9f_q9j-KyOq4Tg@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] drm/msm/adreno: Switch to chip-id for
 identifying GPU
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Adam Skladowski <a39.skl@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Liu Ying <victor.liu@nxp.com>, Mukesh Ojha <quic_mojha@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Jul 2023 at 00:23, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Since the revision becomes an opaque identifier with future GPUs, move
> away from treating different ranges of bits as having a given meaning.
> This means that we need to explicitly list different patch revisions in
> the device table.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |   2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |   2 +-
>  drivers/gpu/drm/msm/adreno/a5xx_power.c    |   2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  14 ++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 137 +++++++++++----------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  14 +--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  49 ++++----
>  7 files changed, 115 insertions(+), 105 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
