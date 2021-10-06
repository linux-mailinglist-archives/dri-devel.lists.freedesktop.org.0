Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43133423652
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 05:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D389A6E4D2;
	Wed,  6 Oct 2021 03:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF7E6E444
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 03:35:20 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 h16-20020a9d3e50000000b0054e25708f41so674856otg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 20:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2sbh8LLwhe0nCiTyzEPV2SKVkwsiELLTCq3fosoU3eY=;
 b=CjWp3tQXqVMU4eM/Dp4xP9dx5gR1kbkWFj9qKDDDpvaOnn1iV6QvRhvIhuov5BjYB/
 kZDWWfvJL0yJhr46rXLxozF9dIDwcdWEvrbO6lOlL1TSoRbAuZYJdEOjI5a6hDl81R/h
 If9IlPYsS/KlslkIn1yT84KelCrJsELo8wC41lqaaBOXvrYKkurIzZqaghU/XR2iG/Y2
 TmSkcxwCp8JIAxdhzjnxfZ46oZw9mXp57GoIgKUdQZU1dsfZz23PQ4a63kTmQurjj/5+
 J2o6gz/HN1nrrWD3ga9Ff6XLOh0yjfrO5r9XYXRgvLBNEa6/dwcXzTNN/PUnJ3g+Jpku
 ZAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2sbh8LLwhe0nCiTyzEPV2SKVkwsiELLTCq3fosoU3eY=;
 b=ko8DAbIiz8QL85KtVhnlakNmDZju9Xl7Ds6cG+Jr1a6FUYPPZIjDRdUfMjz+2cDCJb
 9HFKrb4K2zuiqgrHu2loUDwuH0Hk50OOGZWXe84NYzyd0WUGlSP42qfFSslImmRb39zN
 AAhkRh6OTEK+xU8JOnXMI338o3ToRf43NL62YoFbFreyw9ASTbbQWjfwZzPHjqA0SBK8
 FdHBox83xKL7SD+7xqc0phQPkkg6FabtRbFydzyjOBI3d1yPDef1nQTRpCtVSELHX4a/
 btyHY+3molVUF50b3Zxc42Tq4szDA7j3UNwDXmeo7iGv3kvmPrEoTSgxFgq73VWiUuFF
 HT7A==
X-Gm-Message-State: AOAM5317f9Y8fA2cpu0pCJCfp7OAu/7Tt/tOhp0M+ezI3p9jIRvKoOP/
 39zWqIMajtToYJPpRrbtJE+GpQ==
X-Google-Smtp-Source: ABdhPJzTy8d/HbUt5693DrCKpOktGkmrPUKavSTW1qTcXIrEfQMG1KpYwY3dDGC13/Rs5VW2onMJXA==
X-Received: by 2002:a9d:6396:: with SMTP id w22mr17247964otk.26.1633491319916; 
 Tue, 05 Oct 2021 20:35:19 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:c84c:8eff:fe1e:256f])
 by smtp.gmail.com with ESMTPSA id w1sm3947298ote.41.2021.10.05.20.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 20:35:19 -0700 (PDT)
Date: Tue, 5 Oct 2021 22:35:16 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/7] drm/msm/dp: Allow specifying connector_type per
 controller
Message-ID: <YV0ZdF1nMMkDDWRF@yoga>
References: <20211005231323.2663520-1-bjorn.andersson@linaro.org>
 <20211005231323.2663520-4-bjorn.andersson@linaro.org>
 <CAE-0n53bGyVSBC9zsFu9Uacp+t=56vrttq+fWj155zA_LXJbuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53bGyVSBC9zsFu9Uacp+t=56vrttq+fWj155zA_LXJbuw@mail.gmail.com>
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

On Tue 05 Oct 19:29 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-05 16:13:19)
> > As the following patches introduced support for multiple DP blocks in a
> > platform and some of those block might be eDP it becomes useful to be
> > able to specify the connector type per block.
> >
> > Although there's only a single block at this point, the array of descs
> > and the search in dp_display_get_desc() are introduced here to simplify
> > the next patch, that does introduce support for multiple DP blocks.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > Changes since v3:
> > - New patch
> > - Extended msm_dp_config with connector_type, wrapped in inner struct
> > - Refactored out of the next patch
> > - Pass the connector_type to drm_connector_init(), from yet another patch
> > - Dropped double newline and unnecessary {}
> 
> BTW, I see that we check for the connector type in debugfs.
> 
> $ git grep DRM_MODE_CONNECTOR_DisplayPort -- drivers/gpu/drm/msm/dp/
> drivers/gpu/drm/msm/dp/dp_debug.c:
> DRM_MODE_CONNECTOR_DisplayPort)
> drivers/gpu/drm/msm/dp/dp_debug.c:
> DRM_MODE_CONNECTOR_DisplayPort)
> drivers/gpu/drm/msm/dp/dp_debug.c:
> DRM_MODE_CONNECTOR_DisplayPort)
> drivers/gpu/drm/msm/dp/dp_debug.c:
> DRM_MODE_CONNECTOR_DisplayPort)
> 
> So do those need to be updated to handle either connector type?

The debugfs code loops over all the connectors for the DRM device and
skips those that aren't DisplayPort ones. So fixing this up to properly
support multiple instances in the dp_debugfs code as well should resolve
this.

Regards,
Bjorn
