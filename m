Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58BB4F84FC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 18:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4210EB74;
	Thu,  7 Apr 2022 16:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2C010EB74
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 16:29:05 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id g9so10468290ybj.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 09:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NDM7wlMq64JzrOWsB+7BgQsvGKPEysooG41+nOUmUp0=;
 b=KVKDK10IKH4hrbWXVdHXMgr7bRQOJ1oaOsNvUM3pw5sLy/QGpajD5M0JmmIj0hcT4C
 RreBmGFooTRgUbrJg/cUIjQSvre/H3DogX5vOfUb+oJbSm1fgryOaxHZIiG0yoyII9OP
 z8SIxf3voNWu32GFXzTOVbqS2h3XTHXICU9vbVT5QY0R/BD9t9FUaRa/uMeC+dXFchD8
 p9if1WAU9tmrooVu9Un2iHQEoMvXlTdcnl91ODWRx2RurFvlydITOGZcz/q7Plonk0Ay
 Jj48eozySQ7kwpRVrFWhdMl9mkR9lBX0TAJZbNdqSmbELGHKPGFKLv+5e70QWka8L5Hv
 f7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NDM7wlMq64JzrOWsB+7BgQsvGKPEysooG41+nOUmUp0=;
 b=KFHim4CxjnREpXvcfCv8EoADTY2qWLEzypsP72u4FyNKDaln/837JRvj8rmfSFTTLW
 DchU9lRK0HPWRlqORM0kDvNN/YpJUxVL4o+o2R7q0WvFl+qOzPPlLPQEfSI9aGKO/RtS
 lyuppltiO2FMGURIHoSdfMkYhW5bNvR2bXvJPByYSO9uWx/lsjC0ki1OYXcH6Bh041zK
 4EECY26ah31Pwsw5I5lH4OvteHPA8dPs4sj5A7ZJjLkONCogMgF3Pw0ZztwILaG8MfZV
 xQaRbi/M+DLjg3+LgsyS7+ImS2H8keFX6vmGEFUpGH+Uk9r/6+kKnDumJxPyzmbQnA98
 jetg==
X-Gm-Message-State: AOAM5335oy+JiYHthuHBI1m5NBqP3Og6xV2wJUnS5XgHWhY9tBcU3T9K
 LcEmQetxTclDGcAaIXffI/QGMtmVGKIJ4f/A6XY=
X-Google-Smtp-Source: ABdhPJyghH3SAS7jw4XD4ro17jnPvwM4geTQKWtoA4Skyngk8dgdvRIXCcwVkW3zJsVO4yB7KIYeo+N681NWg1Dj3rY=
X-Received: by 2002:a25:9783:0:b0:63e:f532:8374 with SMTP id
 i3-20020a259783000000b0063ef5328374mr109005ybo.415.1649348944476; Thu, 07 Apr
 2022 09:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <1649312827-728-1-git-send-email-ssengar@linux.microsoft.com>
In-Reply-To: <1649312827-728-1-git-send-email-ssengar@linux.microsoft.com>
From: Deepak Rawat <drawat.floss@gmail.com>
Date: Thu, 7 Apr 2022 09:28:53 -0700
Message-ID: <CAHFnvW2V0tz25D4YMxYMNqYs5uMkbjEoc6p93e6naBhvybzmoQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/hyperv: Added error message for fb size greater
 then allocated
To: Saurabh Sengar <ssengar@linux.microsoft.com>
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 ssengar@microsoft.com, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 6, 2022 at 11:27 PM Saurabh Sengar
<ssengar@linux.microsoft.com> wrote:
>
> Added error message when the size of requested framebuffer is more then
> the allocated size by vmbus mmio region for framebuffer
>
> Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
> ---
> v1 -> v2 : Corrected Sign-off
>
>  drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index e82b815..92587f0 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -123,8 +123,11 @@ static int hyperv_pipe_check(struct drm_simple_display_pipe *pipe,
>         if (fb->format->format != DRM_FORMAT_XRGB8888)
>                 return -EINVAL;
>
> -       if (fb->pitches[0] * fb->height > hv->fb_size)
> +       if (fb->pitches[0] * fb->height > hv->fb_size) {
> +               drm_err(&hv->dev, "hv->hdev, fb size requested by process %s for %d X %d (pitch %d) is greater then allocated size %ld\n",
> +               current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size);

Any reason to add an error message here. Since this function is called
whenever there is an update, avoid printing an error here.

>                 return -EINVAL;
> +       }
>
>         return 0;
>  }
> --
> 1.8.3.1
>
