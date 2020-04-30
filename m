Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42ED1C0278
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 18:28:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9907C6E935;
	Thu, 30 Apr 2020 16:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E81B6E935;
 Thu, 30 Apr 2020 16:28:07 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k1so7740665wrx.4;
 Thu, 30 Apr 2020 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+fLMnUMUsPkmSvT0kvVOGp9BzEZPMOJ5XFQJkVIA9QM=;
 b=RQBB70FTKz8X+ddbM5dnt6rrKCg+XxEhIWD6MQTLU1Wjoh1d7cGWWdULt0ij0F3g2j
 IPrvKRoeYr7220Odl14eUY0lLlHFNY2H/rjh5iCRudWkAJnVJeX/vFccPhbwj8IcedC7
 3mK2PQVqVzDMMlWoiE/i2fzFeqmxxVMOOYX5ErV84Rkg4TGw97wc2AnQFgVs/dU7N0Ks
 VIPDezFVm7flWw90msCt4Y9+8UBkSs0H7RIFdoW7kFwczZV9Y95Ztq7rznwNUjEaKKOD
 KDfGLoRifyL4AcUJmya/CsPyn+3Q4oO4PR0qh2seoKJhtHm0JSJus0+xYx3+r3tGrd4Z
 CM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+fLMnUMUsPkmSvT0kvVOGp9BzEZPMOJ5XFQJkVIA9QM=;
 b=qEmj3HuyS40EACeTsFphJEBUnaIiY8yPpWIftWvPAcjCektGnZBd/eDj2CyM6+odpX
 3REVjBGg5PeO8IrAcY0sOFmzjT8xLU3G33GOmeIdJy6Ycf/qs0S4qpHAgVBz1plCD6wQ
 12QI1xDihYbVdDONLhToXD/eSNxrVS4zo+7YPIrUmsH8Srs31EzMh+QcRjVTOfG1gbj8
 2bOyi7TGjGdbNFLtSBpgKT47gE/qOreZ0rjoEjMmoUSSNuPUi47sUTu/xrRbBp6umZse
 xfug3Ah/GyKY0fj1DoyWrajiVUIhr6N9KkQn0G6ezEr6LiUhDy0dcBGDUyI5s/2f/+hN
 QgXg==
X-Gm-Message-State: AGi0PubgBOcnoCvJ9zowDnmWUxLATDjkD1oFL3xcj4cNgMCKNSgUx/gB
 ATu1WYn0KP5Ce62L8DwmI8EMxjO4bAP9ue+l6BY=
X-Google-Smtp-Source: APiQypKxdWq6TcQWUfjQVg93ONjnBTqIqmPXLEeVuKpLfk+kVhslqEuWc1M9uiC4aVm3X61WiacMj7qfJdjcyGOhI4Y=
X-Received: by 2002:adf:cd8c:: with SMTP id q12mr5048810wrj.419.1588264086292; 
 Thu, 30 Apr 2020 09:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <1588228709-13512-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1588228709-13512-1-git-send-email-zou_wei@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Apr 2020 12:27:55 -0400
Message-ID: <CADnq5_NcOeCaBY7exuepMC+vtqmdrDbptUxmoq3Xzf3R-g1=_w@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: Fix warning Comparison to bool
To: Zou Wei <zou_wei@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 3:32 AM Zou Wei <zou_wei@huawei.com> wrote:
>
> fix below warnings reported by coccicheck
>
> drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:630:5-11: WARNING: Comparison to bool

This seems incorrect.  enable is a bool.

Alex

>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index b544baf..10080e4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -627,7 +627,7 @@ static void sdma_v5_0_enable(struct amdgpu_device *adev, bool enable)
>         u32 f32_cntl;
>         int i;
>
> -       if (enable == false) {
> +       if (!enable) {
>                 sdma_v5_0_gfx_stop(adev);
>                 sdma_v5_0_rlc_stop(adev);
>         }
> --
> 2.6.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
