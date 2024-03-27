Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC6E88D303
	for <lists+dri-devel@lfdr.de>; Wed, 27 Mar 2024 01:04:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E84110F53E;
	Wed, 27 Mar 2024 00:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xTCuPwMq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290F710F53E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Mar 2024 00:04:27 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so5724306276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 17:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711497866; x=1712102666; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cdWwjlLjRKWPoRjlQky5MiZwOYfdmEHMy7nWkUa2pJg=;
 b=xTCuPwMqvuu7N8Yq0+9e9cd9VhqPO0lYc6Ja4cYoouv8KtkBxIOs2YEpGy3kXwjUQ4
 IXK1h3e8G9bo816qyacihaU/3mCSTjQaHPaJCv/W7SilktWApaOzdyjQPh8YKd/27Nq3
 BX0VE8bwbfnzkWVovhqN9UE4mJRfjNvUSvi+5qFTnxMLIDYCe1vj/i9/k4HHQXOnIdIO
 GdCSurr7ov0fGqFD3f2yN6DdwscfaEyOjeJvrhgEadCwJw9pLcN7FVjUSFELVx+exju3
 dxqXRmMyhI8UMdm/C6FZGLoj5yN1029N5Zgk1RctXrk1oIWxpj9x9YgTY8zPjIQ90QHl
 k1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711497866; x=1712102666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cdWwjlLjRKWPoRjlQky5MiZwOYfdmEHMy7nWkUa2pJg=;
 b=gjrUyaL9ck/KdGb13JkjQ9QWQID0L17xv/ddf37JiSxPvPyMPzi89u5VgMGOaMwjNH
 80Q5iO82o0EMitzUQfiV7/ehOPM/d7C39h8BbwRUIlRyg3UAYIFa0H+0jPe9EcCB9wuC
 m2T2+x/YviggwzNaNak17v5ZXBVw69SWkFrdKSKKknSI5EBz+1Z15S+Kz77NJY7wOLR7
 jOKYwDSBK1wE3xc9ipRHmxv6ykMvCiIOOsusEaLOo2UBJJkgp6L0HIe4dUEnJSlQr/9E
 WS/IDYn/RWm6PbBu0SEtaJU272qPssbRu2KfMHV/ZyMyDruBGs5AH441GXgBUy8keef5
 +ZsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvUS1WJYaRTRaOwxuUXNv3QYBcGA8ChnMsNAu8E3dK7qHOQYe2SRGpwIYrl9Cf7KAvD0pQq4N72KDQKwY4XpnHV9nkfB0LyitxeQVTjE16
X-Gm-Message-State: AOJu0YxHxZ7NszPKSj5RXDm3pJb/CWB3VOCISDnarvo7Gu076IezaY98
 uwd3LIzYSag8xrPB2+rtsJ5pffxpy2mzEx30KywCFBEzaXZAjwvQY3FOxAr1uljod4Qy93Bjzje
 pClLaRIoqh/T6jspCcA6PmsbZv49mcUOsSqeRhvpcWxClsk+Q
X-Google-Smtp-Source: AGHT+IHHf7+YNvPzDN4JuLfBI6UVtPxAG+UoXbABP3viX1ebb038qkns6OH4xyJU4zdD7VxtUJLuinCpZqrd6ZCFyoY=
X-Received: by 2002:a05:6902:4c5:b0:dcf:f525:2b81 with SMTP id
 v5-20020a05690204c500b00dcff5252b81mr2609255ybs.46.1711497866103; Tue, 26 Mar
 2024 17:04:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240323-fd-xml-shipped-v4-0-cca5e8457b9e@linaro.org>
 <20240323-fd-xml-shipped-v4-10-cca5e8457b9e@linaro.org>
 <8c866d80-f98d-29de-59f5-3055184fa115@quicinc.com>
In-Reply-To: <8c866d80-f98d-29de-59f5-3055184fa115@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Mar 2024 02:04:15 +0200
Message-ID: <CAA8EJppGmUPympav=NR1oYTPGs=b-DKs3a_h3oWs8tToLQOK=w@mail.gmail.com>
Subject: Re: [PATCH v4 10/16] drm/msm: generate headers on the fly
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas@fjasle.eu>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-kbuild@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Wed, 27 Mar 2024 at 01:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/22/2024 3:57 PM, Dmitry Baryshkov wrote:
> > Generate DRM/MSM headers on the fly during kernel build. This removes a
> > need to push register changes to Mesa with the following manual
> > synchronization step. Existing headers will be removed in the following
> > commits (split away to ease reviews).
> >
>
> This change does two things:
>
> 1) move adreno folder compilation under "adreno-y", move display related
> files compilation undere "msm-display-y", move common files under "msm-y"
>
> 2) changes to generate the header using gen_header.py
>
> Why not split it into two changes?

Basically because there is no difference between object files before
we start moving headers.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/.gitignore |  1 +
> >   drivers/gpu/drm/msm/Makefile   | 97 +++++++++++++++++++++++++++++++++---------
> >   drivers/gpu/drm/msm/msm_drv.c  |  3 +-
> >   drivers/gpu/drm/msm/msm_gpu.c  |  2 +-
> >   4 files changed, 80 insertions(+), 23 deletions(-)
> >
>
> <snip>
>
> Are below two changes related to this patch?

Ack, I'll move it to a separate patch.

>
> > +targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 97790faffd23..9c33f4e3f822 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -17,8 +17,9 @@
> >
> >   #include "msm_drv.h"
> >   #include "msm_debugfs.h"
> > +#include "msm_gem.h"
> > +#include "msm_gpu.h"
> >   #include "msm_kms.h"
> > -#include "adreno/adreno_gpu.h"
> >
> >   /*
> >    * MSM driver version:
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > index 655002b21b0d..cd185b9636d2 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -11,7 +11,7 @@
> >   #include "msm_mmu.h"
> >   #include "msm_fence.h"
> >   #include "msm_gpu_trace.h"
> > -#include "adreno/adreno_gpu.h"
> > +//#include "adreno/adreno_gpu.h"
>
> you can just drop this line

Ack

>
> >
> >   #include <generated/utsrelease.h>
> >   #include <linux/string_helpers.h>
> >



-- 
With best wishes
Dmitry
