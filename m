Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8442243D18
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 18:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8336EA4A;
	Thu, 13 Aug 2020 16:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9945F6E216;
 Thu, 13 Aug 2020 16:16:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g8so5176267wmk.3;
 Thu, 13 Aug 2020 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZDZxK557QyydjLfRKCH3a63KYLOab4MosSYsDN0lTPI=;
 b=Me8R6C+bT+HcxPAfKWKJXWW0PdK3ui8PTkMX4mfTZia+OsdLQzy26AOH4SPA6csTne
 AH/QScFCt8eRHHy2kzT0sDROOyf/+cesMWqQDzb45MRYMkUxfYD4JU2UFEkPDBweUBWh
 sJ/MW/U31mPfbg6SC3XGecibDGmFei+W06ypvarH3yHd2NYMKqVlsHuPeDVYWw0HcyNq
 lxgL9T9/VTNfOTsOVzyWrBvLE9UymEpSfbSKTeDB9N9XjyKafFen4Me03sf8odU6w2LK
 7VGQQiyLYvEn+HgMVau1xJUNdI/Qgc3hT9zkTgbZpBYzqv70RrLfp518z+Su3/QtbSWd
 MMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZDZxK557QyydjLfRKCH3a63KYLOab4MosSYsDN0lTPI=;
 b=nqqZEJXYhNMFSf8rfn5lkC03N8SbaPgNDIOMLFmCaoHqu5+KuaBEF89AICi4X00hPU
 kwWpi90N7RIrEe5g4flnRjvQ0FBdY6kH61pzULlqRQDSRX1l88mKXeVPQYa3QG0OzOIQ
 1VQDYDeGpJ+peO7omEg4eipsSgY+vzGp6jE0Koc++Jb9u/kSxWiAQ0endEkebM5bMTu+
 wIsfpAteF9mvwjViZb6ED2ZVjTquvXUDp5fUspPuwB/9CATuShUXxgQldgmSdsglG6i8
 g5imJmGT6vAElfxW1E0I3FrCQC2OyTfdY8dPlh0wbqFbtYCIWeLeQyesY8izsxrUScHG
 svBg==
X-Gm-Message-State: AOAM5303bTmaXTTcN2BFryiG+50GIhvsY7JWw4/knFPLOHc7PSSgp0J1
 f3ZSaKdzfsih/eWZhNwZuE6AYze0g1fhfCu6O6k=
X-Google-Smtp-Source: ABdhPJx9BIL8YvczFKCJBH4UENkHUjiA1/2Ml3mI2JxBFhQVn2uDFhMYCBAVLjNaZCNs0zfCkO4LE+S5uR3RemIOvk0=
X-Received: by 2002:a7b:c257:: with SMTP id b23mr4890016wmj.164.1597335395036; 
 Thu, 13 Aug 2020 09:16:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-8-jcrouse@codeaurora.org>
In-Reply-To: <20200810222657.1841322-8-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 13 Aug 2020 09:17:21 -0700
Message-ID: <CAF6AEGsA-jWLvSjZYz=ZkM7cxC5Wv6rDcoVv-9K5QpEZT=Cv7A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v12 07/13] drm/msm: Add a context pointer to
 the submitqueue
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, Brian Masney <masneyb@onstation.org>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 3:27 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Each submitqueue is attached to a context. Add a pointer to the
> context to the submitqueue at create time and refcount it so
> that it stays around through the life of the queue.
>
> GPU submissions can access the active context via the submitqueue
> instead of requiring it to be passed around from function to
> function.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 +++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +--
>  drivers/gpu/drm/msm/msm_drv.c           |  3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           |  8 ++++++++
>  drivers/gpu/drm/msm/msm_gem.h           |  1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  8 ++++----
>  drivers/gpu/drm/msm/msm_gpu.c           |  9 ++++-----
>  drivers/gpu/drm/msm/msm_gpu.h           |  7 +++----
>  drivers/gpu/drm/msm/msm_submitqueue.c   |  8 +++++++-
>  11 files changed, 39 insertions(+), 30 deletions(-)
>

[snip]

> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 972490b14ba5..9c573c4269cb 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -142,6 +142,7 @@ struct msm_gem_submit {
>         bool valid;         /* true if no cmdstream patching needed */
>         bool in_rb;         /* "sudo" mode, copy cmds into RB */
>         struct msm_ringbuffer *ring;
> +       struct msm_file_private *ctx;

So, it looks like this is (currently) unused, and everything is
instead using submit->queue->ctx

That said, changing this so the submit also holds a ref to the ctx
seems to fix the intermittent splat I can trigger by repeatedly
hanging the gpu.  Which (from the pile of additional tracepoints I've
added on top of this series) seems to be related to re-playing submits
after the userspace process has crashed and/or closed the device.

It seems like the reference the submit holds to the queue should keep
the ctx (and therefore address space) alive, but I need to dig through
that a bit more.

BR,
-R

>         unsigned int nr_cmds;
>         unsigned int nr_bos;
>         u32 ident;         /* A "identifier" for the submit for logging */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
