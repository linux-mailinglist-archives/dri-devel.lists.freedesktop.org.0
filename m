Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3C7DAD41
	for <lists+dri-devel@lfdr.de>; Sun, 29 Oct 2023 17:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFA710E0B9;
	Sun, 29 Oct 2023 16:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA87410E0B9
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 16:40:18 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-35809893291so13075645ab.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Oct 2023 09:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698597618; x=1699202418; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q9bWPCuhLl7Eu2Wz5OYZ1UnKjf97K54GCVXL6Pmup34=;
 b=RR6dBUuk0LebFOr5gguga2lAgeeQSf4Mq14xYCGWMAUC8yRnDx5jKzVex9VTjjLbCM
 fsp4awnt/PWuxHZZxfimULq66TMVB7ODqDiDGTc6qjfdCXm9nJreEvleFkgOdfCvjOI8
 ez0DD6OuMbs6f0ZYBSuriM+U3wYaVPb6mqCkvQBq1GSrb6UkmQjysvKrtd9D+CW6/8xg
 FSR+C40JC6pVOokw22Fl6fk26RVs1CnSPYAI2Cg18K4kWy0q5Z6DdMqbtB6ZFV4KEurd
 CMVCdZY5To8Q1RMcllyh8G9crnLtcDTHu+k8Yrbj3pltjRMx4zGr2DYhA5x37dnsu6YD
 +GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698597618; x=1699202418;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q9bWPCuhLl7Eu2Wz5OYZ1UnKjf97K54GCVXL6Pmup34=;
 b=At9ddoMH9pTJncb/jvGLYsd6LAkl7W9nagu0/YI18rZRnyxbSomy+zPFLlUQPriZhS
 f4lyhfiMD90MwE7JJk6B8MNqGLa2EB6+NMmYLBpKYKBy6VoQqOIMwV/Doo+LEqIvp1ti
 38jyh8Akoiot8qOUCS2jgZkHVF0RBy3esAqCCTd+lR6ePb6nM12EL9Fa2D9MA0Z+F+SB
 DF12bq+X7pRZ5eSc/IFhMeo9kYz8z+HgdRJ1yHkcHpobIhBhzPepJzXhpBDWMKiVoXst
 Xk6omg3hsJL+AY945xJkwBSReJE31nThffp3IXe8m8pfHM7MDgyGIuWNNCrwDO8UEniY
 2cpw==
X-Gm-Message-State: AOJu0YzboGGq+uP2DOSICXz9t4+kYL6NWuy+Es/cXN00E9t3BE7e9QMy
 evj1JXgZD6XQkqxV1wU3kOXCn7djcHzm9Pys/zHuDw==
X-Google-Smtp-Source: AGHT+IEMTTkd3iokIkHgwuWImh0kMLQCmV4IUjrrsJzeTsT2AK9xdWYaJqUNFO6i6aN3ig0Ep5iZuNbQcrZQnQdocIc=
X-Received: by 2002:a92:c266:0:b0:357:5db1:9170 with SMTP id
 h6-20020a92c266000000b003575db19170mr10291105ild.28.1698597617965; Sun, 29
 Oct 2023 09:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231027194537.408922-1-robdclark@gmail.com>
 <20231029150740.6434-2-robdclark@gmail.com>
In-Reply-To: <20231029150740.6434-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 29 Oct 2023 18:40:10 +0200
Message-ID: <CAA8EJpqK6uGDrjzhSq7zhGtcqsT7G3LEAj7cZKUex15E4uTK+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/msm: Small uabi fixes
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 29 Oct 2023 at 17:07, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Correct the minor version exposed and error return value for
> MSM_INFO_GET_NAME.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
