Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A61E3B4767
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 18:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABCC6EE14;
	Fri, 25 Jun 2021 16:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1296EDF4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624638433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5o+qfP6GHLfIPfnq02TmNaEHiucEY8RMLS1UO4vZ+s=;
 b=D0zFbwKuAXBltJ0CyDOOPDCLkicehizQLEnbHUBFuHTgAv/L9kRECge7d4CL3q09IMIFtZ
 m19DHtSujYHf1Rgtwnh4bmKWWjmHRZjw0t4Totiasd4yH1iaFKJn8VXx8joY2XE2oDQP+/
 uVY838Uy9i+4A8SfKIZnMBetXMN0u8k=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-fJAJ-JZYMXeBTFpqpwpH_A-1; Fri, 25 Jun 2021 12:27:11 -0400
X-MC-Unique: fJAJ-JZYMXeBTFpqpwpH_A-1
Received: by mail-qv1-f72.google.com with SMTP id
 s20-20020a0ce3140000b0290268773fc36bso10266934qvl.10
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=U5o+qfP6GHLfIPfnq02TmNaEHiucEY8RMLS1UO4vZ+s=;
 b=r5NuKNWFpFK+jV2vaT/6ohVIEM6afWmWzc8z+qA/OvaNcZHXc3/l0Qkgs37pvigjul
 oRgI0oy+wh0rGIhqjGUXqmoIyDL0hkJCjlPlqQG8F0r3OuF5hXf0cQDkbGEFyaDa3mde
 pBBT+S/FYUsxb9fnE62Ai3B0cX1yn3oQKp55RyxkxkeEC64ZOiwNbvfjLqtdvVSMH9i6
 5SXNd86q5OPTzj3dqSXnCbb6mMBjOxksf0FGn3qTdGYy/fGCcuU5PiC7BdDRvltlelEG
 uX7bQaL1agWiVfpUW5IASq1uSeXNOerJc1xBi1EGhH3xo8IPrr7US2XOZjpr6gPSwY8l
 +NBA==
X-Gm-Message-State: AOAM533318dk+sTA7aMT2o/zWVa5J+5bPfzQttIyIpFitVZuS2ujJy0A
 Ca+VHlA6SLdrjZN1rxXAUBUBrFuzoH1xtKZ5TSmnK9dA6du1eAAoUjkqNSoV5PVFeND9ImpjVUq
 Z3EG+t7C366iVf4+3de3AMFP89Ytq
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr11777574qvi.44.1624638431614; 
 Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNCXBo3wDqEwZBbeZJgLcThoweJoirnmT4pfoxXYsxbDiSqWO1f6DFrN67Lv8a1Xvc6DS5QA==
X-Received: by 2002:a0c:c3d1:: with SMTP id p17mr11777554qvi.44.1624638431416; 
 Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id t62sm5240494qkc.26.2021.06.25.09.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 09:27:11 -0700 (PDT)
Message-ID: <a48763801f0e903a227283a12cf881dc143034ff.camel@redhat.com>
Subject: Re: [PATCH] drm/msm/dp: Add missing drm_device backpointer
From: Lyude Paul <lyude@redhat.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dave Airlie
 <airlied@redhat.com>
Date: Fri, 25 Jun 2021 12:27:09 -0400
In-Reply-To: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
References: <20210625034721.1287948-1-bjorn.andersson@linaro.org>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ah - must have missed this when I added this. Thanks for the fix!

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2021-06-24 at 20:47 -0700, Bjorn Andersson wrote:
> '6cba3fe43341 ("drm/dp: Add backpointer to drm_device in drm_dp_aux")'
> introduced a mandator drm_device backpointer in struct drm_dp_aux, but
> missed the msm DP driver. Fix this.
> 
> Fixes: 6cba3fe43341 ("drm/dp: Add backpointer to drm_device in drm_dp_aux")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_aux.h     | 2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c
> b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 4a3293b590b0..88659ed200b9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -441,7 +441,7 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
>         dp_catalog_aux_enable(aux->catalog, false);
>  }
>  
> -int dp_aux_register(struct drm_dp_aux *dp_aux)
> +int dp_aux_register(struct drm_dp_aux *dp_aux, struct drm_device *drm_dev)
>  {
>         struct dp_aux_private *aux;
>         int ret;
> @@ -455,6 +455,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
>  
>         aux->dp_aux.name = "dpu_dp_aux";
>         aux->dp_aux.dev = aux->dev;
> +       aux->dp_aux.drm_dev = drm_dev;
>         aux->dp_aux.transfer = dp_aux_transfer;
>         ret = drm_dp_aux_register(&aux->dp_aux);
>         if (ret) {
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h
> b/drivers/gpu/drm/msm/dp/dp_aux.h
> index 0728cc09c9ec..7ef0d83b483a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.h
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.h
> @@ -9,7 +9,7 @@
>  #include "dp_catalog.h"
>  #include <drm/drm_dp_helper.h>
>  
> -int dp_aux_register(struct drm_dp_aux *dp_aux);
> +int dp_aux_register(struct drm_dp_aux *dp_aux, struct drm_device *drm_dev);
>  void dp_aux_unregister(struct drm_dp_aux *dp_aux);
>  void dp_aux_isr(struct drm_dp_aux *dp_aux);
>  void dp_aux_init(struct drm_dp_aux *dp_aux);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index c26562bd85fe..2f0a5c13f251 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -259,7 +259,7 @@ static int dp_display_bind(struct device *dev, struct
> device *master,
>                 return rc;
>         }
>  
> -       rc = dp_aux_register(dp->aux);
> +       rc = dp_aux_register(dp->aux, drm);
>         if (rc) {
>                 DRM_ERROR("DRM DP AUX register failed\n");
>                 return rc;

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

