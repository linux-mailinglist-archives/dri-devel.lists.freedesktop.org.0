Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD047B64C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 00:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E2F10F37F;
	Mon, 20 Dec 2021 23:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5673910F37F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 23:53:18 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id b67so10979777qkg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 15:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NcXgqI6cxpe0e91iQv5hDRD0JOXrVC93a0bIwF8hPSM=;
 b=Ws1YkYkUr9UQiyjkjzcDfhUOL2xPU099pRZc/DVWPUqgSkTISCxkmbTnZUDKAzLfWA
 rXurwah7hW92RHgf4AfGporMV6jEGkWvykl1RhJbiY6Z31s88Vn+zEc35OMnbIZYeSP4
 CepC8EGG3Wii+57keP6eq1lsupwPUR+cgohunTTfdwPD7cZEJd2p0zmSqtyvcRd+Rpae
 +WIcvTi7P1Ey8W9eCBHQCRtVsuIwp70EIDu8b0sTFvy1ELF5TKrMhG3WZSojc0zMFxzX
 x54Z6g9bakthG8guJwl5gMXlk17VPKWIXt+cBnzITS6vFSkkMqmhoLdoJ5CfEU0dYCJS
 xChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NcXgqI6cxpe0e91iQv5hDRD0JOXrVC93a0bIwF8hPSM=;
 b=WjOQZPbPwhYa4x4X+p5gUGxKXvLJYEsjDdNuYwR79EZq8fX//KX4qka9Isw0kaUkRO
 7x9lMWl069UgRsTxIrHuJc2ri12ahgQHWI3wCDJMrLgLH+OwhtAwuCHPVyUfHrjyXvus
 SFnwRpY7SzftRJuds4s6Ou4RLtr20J5rOMwYdVeupWDp2uVe0sg2fCgWv4yDak89cEZr
 JYybl5SUAAbARNhoyaRUC1YhJvRcu3GOeZT+2v6BVEogF5GsgDASn4ThA63n64sqaD4V
 kkX0xvbiWppwhj3g9y1qDyASowZoIx/72JQ2ehKsjME29FHPAhoa1BsF+REemyN+3iPf
 CfPg==
X-Gm-Message-State: AOAM530O4A6O3nD9HCH0fldLwmYkehDwP45NgGV99+/adYbwhujeAhwn
 i+wIQwvh3947trZr/0ORXlMmeLIby9HiZelAzz8tuw==
X-Google-Smtp-Source: ABdhPJzFnDz2W0GHUrVIingh+4j+ON9BLU7ywtLTtBYgCoWWu0JGYwbykopD9mXXSuORzJrQ8/OZ1svpmcADUPTh3JU=
X-Received: by 2002:a05:620a:13ea:: with SMTP id
 h10mr476112qkl.30.1640044396450; 
 Mon, 20 Dec 2021 15:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20211217002026.2304973-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211217002026.2304973-1-bjorn.andersson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Dec 2021 02:53:05 +0300
Message-ID: <CAA8EJpoYJFfB5qfFMoc3-QsmYZzO16C28MOrPyokANQyPBhdyg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: Only create debugfs for PRIMARY minor
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Dec 2021 at 03:19, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> dpu_kms_debugfs_init() is invoked for each minor being registered. Most
> of the files created are unrelated to the minor, so there's no reason to
> present them per minor.
> The exception to this is the DisplayPort code, which ends up invoking
> dp_debug_get() for each minor, each time associate the allocated object
> with dp->debug.
>
> As such dp_debug will create debugfs files in both the PRIMARY and the
> RENDER minor's debugfs directory, but only the last reference will be
> remembered.
>
> The only use of this reference today is in the cleanup path in
> dp_display_deinit_sub_modules() and the dp_debug_private object does
> outlive the debugfs entries in either case, so there doesn't seem to be
> any adverse effects of this, but per the code the current behavior is
> unexpected, so change it to only create debugfs files for the PRIMARY
> minor.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Moved the check up from msm_dp_debugfs_init() to dpu_kms_debugfs_init()
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2ee70072a1b4..a54f7d373f14 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -193,6 +193,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
>         if (!p)
>                 return -EINVAL;
>
> +       /* Only create one set of debugfs per DP instance */

The comment is misleading. Could you please fix it?

> +       if (minor->type != DRM_MINOR_PRIMARY)
> +               return 0;
> +
>         dev = dpu_kms->dev;
>         priv = dev->dev_private;
>
> --
> 2.33.1
>


-- 
With best wishes
Dmitry
