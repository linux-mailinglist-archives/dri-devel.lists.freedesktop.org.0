Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841355E567
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 16:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D6610ECC1;
	Tue, 28 Jun 2022 14:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191B210EF7D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 14:43:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id cf14so17909389edb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7hmiP2nsm7GYKYeBHW+YUJEK/bavjayODZn3LUEPQfU=;
 b=Rg6Ce3D49JXUDLDeRZsgSz+yryqVA8Xki5kW8XtGn3by//+6dHO1GOAcOhbDNzgpwT
 aSztrbpOcnAUsBoPDQ7BV/QEUHC2BeteHolH+41XKkNYsy21dcDJNxo80eFEmFkffm7N
 xrlANZd2gutEao0wMT0i33DgFJ7qVkakqkuIKGzp1apMRQjGaeRIaAUATMXR7WhdJ1pG
 22Ybwmrl96PlHmzzq1U2dt/7mck7yCPOvFY/wTosedx//6dKv/OjQ8DN+UYG+pnrQ3V1
 CF2MqOlXTIJg0bcE8VwAUgguFd0E7qr/7G9hWBMzW3DOJ4XewARcERMpgO+veI9YZr7q
 Vt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7hmiP2nsm7GYKYeBHW+YUJEK/bavjayODZn3LUEPQfU=;
 b=sXWFxp2Ce11BoduvSNK7VGCBWw/Pv6WPhKBuzf/19IKGsj6hztJ55bB3IwhoBq9teL
 agJB8kfRKOgdYqjdimJGRaR41vxr6YQQJrCwayYI/LjzpH7xtkLuboicFVCAEPTsIWJl
 26txtWVFPJn7CvTZg0TynfFLnlyFvfhcSvYrCT40Ez+cLYaYnuCg60kwqk/6iNc88VyC
 /t54wRIW2RWuVPMKNd5KUQR8CBhIgyLc0Bj2P46pJGCpeFYbNMZ/ke5GJUtONBVc4dbi
 +Kd7TV67u7fFUAGOOw/DmvSP2K68yx2s0ELj2cvJo2qQ1zgfn4jlGPJvij6ouDNAPig3
 TX+A==
X-Gm-Message-State: AJIora9j7k//JuMj0VfDdo/89UC6eNohrhZIaaY4y8GdEAfiV5j1Qx91
 ou8qXLAKqQ6nCqJR+qso+n4nA/y/HOSH3FPFHh4=
X-Google-Smtp-Source: AGRyM1v3Zrmhh/ktA0MyQ64G0CINBj/oLTnBPPFjZQDaHSTrK7ZqnxVdUuVe2HWrTrfrPe56zqLklI36n15HTP7diSA=
X-Received: by 2002:a05:6402:50ce:b0:435:9249:dfe9 with SMTP id
 h14-20020a05640250ce00b004359249dfe9mr23490212edb.310.1656427386662; Tue, 28
 Jun 2022 07:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656409369.git.mchehab@kernel.org>
 <0129fa0ffb8d418ab66f2ab0f1d525cb49f01f75.1656409369.git.mchehab@kernel.org>
In-Reply-To: <0129fa0ffb8d418ab66f2ab0f1d525cb49f01f75.1656409369.git.mchehab@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 28 Jun 2022 10:42:54 -0400
Message-ID: <CADnq5_Ps_Pp1tzroPh6VwDsaBP-q6bLeaap4159S5BkSzhK1Hg@mail.gmail.com>
Subject: Re: [PATCH 12/22] drm: gpu_scheduler: fix a kernel-doc warning
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
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 28, 2022 at 5:46 AM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> The dev field was not documented:
>
>         include/drm/gpu_scheduler.h:463: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
>
> Document it.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>


Generally in the drm tree we use / rather than : in the patch titles.  E.g.,

drm/scheduler: fix a kernel-doc warning

With that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/22] at: https://lore.kernel.org/all/cover.1656409369.git.mchehab@kernel.org/
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
