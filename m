Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA793418F1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACF76E9DE;
	Fri, 19 Mar 2021 09:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B031E6E9D6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TgleNGeQ16aMvI/a7tBquUukHlqXq2WMoe5SiiWgH/M=;
 b=dCqs5xiko5GeOtL1eEcJeQdy9wmewVswqrZ+T7ZyWq/JZUWdYVOuMFUE8hj5/98br5nDGv
 yZE7lnTCSbURh7xf/3hk4ZqjXfLqAPqjiKrlEoo7n+vfHprVrGbIsbsM+hSKo0AanztGJ/
 2V6ix7X4SwkAWa8z0FK1J0XphjnyyBc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-bEVcFz1AOYWOH5RG8BM4sA-1; Fri, 19 Mar 2021 05:57:31 -0400
X-MC-Unique: bEVcFz1AOYWOH5RG8BM4sA-1
Received: by mail-wr1-f71.google.com with SMTP id t14so4192437wrx.12
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TgleNGeQ16aMvI/a7tBquUukHlqXq2WMoe5SiiWgH/M=;
 b=cIqUflwXYAtcpfQYIUhuKIOgxeuSl/3I1a8Gyv0L/Ua5yKS1+SN64A4EHnu73QA/6T
 AE4l+0l1GCyBLZE19NFJfGAwI6QCZKq+WINjHHydWJtVY3ph4tiyRF8+rQfU420JF0AV
 yrzl49nsRvrhoql8idPQhdNS4FsgzvS50ULNfzBfD/Pzu8wXAZrFZduaOJS9cMnSAJmD
 IUfW7wIVzmmVBHIWqYVxbfkSdy08mdxVFVmsnA1f8EmpwkatRfTxaOjOlV2FkM4XZWXt
 j5bqSJQus81F/dykaqeQKj0Ttm4g/CqGdaKM2fVhG+dXrWt7xIcx1bianKNbAT3esekO
 +sdg==
X-Gm-Message-State: AOAM5328bZkB5jT8fQjwVZmF+sA+bAn785uqym4Di/vTU/VYaG4GCyrB
 XG6oQ5vH+75lbpdrbPREOBqaJ1aLkb8bqTz8e18h7m3AphUrvOSnvcpn2JbYhXC54veUwTgl0q3
 YL4+iiIGeFbgnTe8hzRsnXJA+QC+Zyl0XBcopEoSkHv0A
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr3595022wrz.373.1616147850301; 
 Fri, 19 Mar 2021 02:57:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyodC37R41eda3GZ5ZIkrkElEd2nIrO+/K3P2l9TcTShBgK7E6mIX6v+y8SYjujCKVkuwpVpy49XjH2/oX0tZQ=
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr3595013wrz.373.1616147850147; 
 Fri, 19 Mar 2021 02:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-18-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-18-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:57:19 +0100
Message-ID: <CACO55tvmj1-_ZcmLyN0tUdrH1QzN2c23-a+bDBXCKEOEsiak9g@mail.gmail.com>
Subject: Re: [PATCH 17/19] drm/nouveau/nouveau_ioc32: File headers are not
 good candidates for kernel-doc
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 9:25 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c:2: warning: Cannot understand  * file mga_ioc32.c
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> index adf01ca9e035d..8ddf9b2325a42 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
> @@ -1,4 +1,4 @@
> -/**
> +/*
>   * \file mga_ioc32.c
>   *
>   * 32-bit ioctl compatibility routines for the MGA DRM.
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
