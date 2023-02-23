Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 532486A0CBA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 16:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5557510E4CE;
	Thu, 23 Feb 2023 15:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0868D10E057
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 15:19:03 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-536bbef1c5eso196748407b3.9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 07:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LwN6HfLSUE5ZKSAzD6kxZTBLoYaNfg1FJI6Ev8TDx4M=;
 b=hY5XLuPCYfHmjKHQuLwKYFlB4WfA4hoN+aNfzERLVE6508A9iiPyioey5culYB5CI+
 ESYRSZAB2d9XOnbo+cPZOt5OLd7wLWB7difGrXDNSB7/03o81Ll8EMoLuzLSK2QUGew9
 awH6Y8ox1ORqwCp48m3OlXmzoIArA44JwGCBbwPMQ6k/CBSrsn6n1K6I40hBbX92WHjT
 DZ76eQqiDDhgz+O0wScTmQJ73Oa6UEiDlkgSHwECcXczHmoGueOLa/ZMalhUxiInxmv5
 MzDYTNI52JhbmS6KV9LughkC8xGgkDEItI0FrO9gg6tlDmWfV0LX6bJHB0udKm29d9zM
 Bz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LwN6HfLSUE5ZKSAzD6kxZTBLoYaNfg1FJI6Ev8TDx4M=;
 b=pPdJDzhnAZIA6HOpYoR4TNk7ycYlI+b3rG5gyxW2q51UNydNcg31wU7+FoT0kQOpdE
 ZQ7K+jkYbl26CmsKLPL3Bc1CkouUl1kICGScGiVqput4aKTHshvz3KQvGZvlmFesxgee
 EmqMMc2SDBpxFuhD1InoTkdco3Dp/cngS2i0IbcChnURLCyrNeEhsEQjYVsgXzbwSxbj
 EN78+vzTzajl2ueUwEhR7K7q7eDXGo+YSg46G+XRGMGaJ9alB1Xj0Je5uy0h9iP0BLlF
 mQ1jbI/xflc4T7T7wgZyhyBBQ67XFBOv/bTzzLKNDbmiXaVfSP40jGw5VeOCvt3tDha1
 O8Yg==
X-Gm-Message-State: AO0yUKUk5SXzo8Jtl9SjZTkk9clX3A4m9np8PkLXtWiq6MS6/B/kZzTS
 +pYonBcXcOvDi9OnWFUK+BnNEEscFy5hDRrViVqX7vNF0Hh9ig==
X-Google-Smtp-Source: AK7set/MGnbOMGB+D2Et65I+FbFHFBA3n+THAUTHlhkT5fuvYhaHgIJXj5QE6uw1NwL5PDsQmt26jDgvePFLaYbOwRQ=
X-Received: by 2002:a5b:b8b:0:b0:a28:737a:b214 with SMTP id
 l11-20020a5b0b8b000000b00a28737ab214mr1359757ybq.10.1677165542095; Thu, 23
 Feb 2023 07:19:02 -0800 (PST)
MIME-Version: 1.0
References: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
In-Reply-To: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Feb 2023 17:18:51 +0200
Message-ID: <CAA8EJppZ+Hyhb9MacaFX6xTrJ9XyYbbCRrBvO+yE0=-Bztk7CQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] drm/msm/dp: refactor the msm dp driver resources
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_bjorande@quicinc.com,
 quic_abhinavk@quicinc.com, quic_vproddut@quicinc.com, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, sean@poorly.run,
 seanpaul@chromium.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Feb 2023 at 15:57, Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The DP driver resources are currently enabled and disabled directly based on code flow.
> As mentioned in bug 230631602, we want to do the following:

private bug tracker

>
> 1) Refactor the dp/edp parsing code to move it to probe (it is currently done in bind).

This is good. I'd suggest splitting this into smaller chunks. First,
move all resource binding, then move the actual dp_aux handling. It
would be easier to review it this way.

> 2) Then bind all the power resources needed for AUX in pm_runtime_ops.
>
> 3) Handle EPROBE_DEFER cases of the panel-eDP aux device.

This is not handled properly. The eDP aux probing is asynchronous, so
you should move the second stage into the done_probing() part, rather
than relying on the -EPROBE_DEFER. There can be cases, when the panel
driver is not available at the DP's probe time. In such cases we
should leave the DP driver probed, then wait for the panel before
binding the component.

> 4) Verify DP functionality is unaffected.
>
> These code changes will parse the resources and get the edp panel during probe.
> All the necessary resources required for the aux transactions are moved to pm_runtime ops.
> They are enabled or disabled via get/put sync functions.
>
> This is a RFC to verify with the community if the approach we are taking is correct.
>
> https://partnerissuetracker.corp.google.com/issues/230631602

This link is useless, since its contents are not public.

>
> Sankeerth Billakanti (2):
>   drm/msm/dp: enumerate edp panel during driver probe
>   drm/msm/dp: enable pm_runtime support for dp driver
>
>  drivers/gpu/drm/msm/dp/dp_aux.c     | 155 +++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  12 ++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |   1 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 185 ++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_power.c   |   7 --
>  5 files changed, 250 insertions(+), 110 deletions(-)
>
> --
> 2.39.0
>


-- 
With best wishes
Dmitry
