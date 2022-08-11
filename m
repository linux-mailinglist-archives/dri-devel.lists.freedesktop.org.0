Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0159040D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84F411A775;
	Thu, 11 Aug 2022 16:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C331139DA
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 16:33:04 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id u9so21930751oiv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=X4v1+9M+lzJNhjmu0VSf3gTMP0So1BV3q3LJQbuMFXw=;
 b=RPAc0fEzeU+2pzE6N5pkSQY0cZtsVivrHMqBPS8FyZ6sWRakSb9Z2PTJ6YttJcQfXt
 HzHIQR/n4Ng8b6SAXHJVD3XAU3ewK4VJIWLmQV9tjHaodwgHOxbWA3wUn5rS4JMru7ml
 F0s4i+8gLdNILQ8K749Eqc4I4b+vG0CZnX25zDHl5XKU82YCVJgzXCYynDesqHbLY6/x
 RqIrMop6HieggT5l0c0lOXVbn2nH+Y5bzcghBdSYYC9so0CxbWMy0BEUOizRtFED1mCH
 2m0D6Z+qRTqNNj3qgpsDChlHVEEdRFoa+8MuTeYf/zpKE8IL2hfUDbq/KlsJxPWW2b7q
 fmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=X4v1+9M+lzJNhjmu0VSf3gTMP0So1BV3q3LJQbuMFXw=;
 b=YuS+BKr77pErSGTuYN24+fZ9SEym+ECNxNT87BPsTp3Y40U724LYfRQ69fBk4CnekC
 bRiAIRHW8BTAeH7WbyFZLCdI0zsQrwZdha+NHmdPeH/XgRceoo5RzqsoNB0GBTAJK69y
 hSEeXViMYW5zrVd0UxrSUWz5+h3t8B8NvQ8GJnZZ1tsWDMkb/DFPbSC9RWkQbUp2B8bH
 MtwZymO4gIonbzDB0YwqGzZUhy/abn5O4YDxorspUmIp1JESe3KFaSNwgs2pnBM8OVSZ
 +13mpYeemnCVcWZUjThMo5OzuHXHmosXmRVAHVwaV/iemZNBFzNSIehpAvY+d+tvbegb
 WQ3Q==
X-Gm-Message-State: ACgBeo1btCJK6a8NAK69L9E/aasKXqFCKRlWeEwJm3i2HvzrJ9tO5qgk
 22HdsrtiZx7AkR+1o0r4YWLmld4+Ly9JI0qjUvM=
X-Google-Smtp-Source: AA6agR7nn2jBlh9kqBmNI654QihqMenEiy9qbh+AfpMKzePccSF8dP9jSQFso5k4gHo9wp0B7T+QhL4SEn7/RTZtXvA=
X-Received: by 2002:a05:6808:ecb:b0:33a:3b54:37f9 with SMTP id
 q11-20020a0568080ecb00b0033a3b5437f9mr15131oiv.33.1660235583346; Thu, 11 Aug
 2022 09:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657360984.git.mchehab@kernel.org>
 <879d916ad72029ea9611f78de1181df01dee5ca3.1657360984.git.mchehab@kernel.org>
In-Reply-To: <879d916ad72029ea9611f78de1181df01dee5ca3.1657360984.git.mchehab@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 11 Aug 2022 12:32:51 -0400
Message-ID: <CADnq5_OuMzr6R3aZQue7rQRjXh9VX_4WayEQMUoKWYDgGKU6wg@mail.gmail.com>
Subject: Re: [PATCH v3 09/21] drm/scheduler: fix a kernel-doc warning
To: Mauro Carvalho Chehab <mchehab@kernel.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 9, 2022 at 6:08 AM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> The dev field was not documented:
>
>         include/drm/gpu_scheduler.h:463: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
>
> Document it.
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Patches 9, 10 are:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Do you have commit rights to drm-misc or do you need me to push them?

Thanks,

Alex


> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/21] at: https://lore.kernel.org/all/cover.1657360984.git.mchehab@kernel.org/
>
>  include/drm/gpu_scheduler.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index addb135eeea6..c7c487e0c40e 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -435,6 +435,7 @@ struct drm_sched_backend_ops {
>   * @_score: score used when the driver doesn't provide one
>   * @ready: marks if the underlying HW is ready to work
>   * @free_guilty: A hit to time out handler to free the guilty job.
> + * @dev: pointer to struct device.
>   *
>   * One scheduler is implemented for each hardware ring.
>   */
> --
> 2.36.1
>
