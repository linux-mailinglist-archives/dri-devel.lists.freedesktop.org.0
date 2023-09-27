Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0BF7B0DE6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 23:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0A710E5BA;
	Wed, 27 Sep 2023 21:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A25510E5B2
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 21:11:26 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-59bbdb435bfso149050377b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695849085; x=1696453885; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a74pdDrZrdwlkEh28Y630eaCwo/I4QCGA/VwQZGH4Q8=;
 b=lMcxi5f8nJvN+lG1t2TwDpNp6P/3lSUPzRYCNC7mJuWksMN5S+anGWWJdDInQh6RdV
 ie6ic62Vr6mAD3n61P1MySWRDE/LaKzBQEM1PgzQ6FmREDoBrzmXaw0XchKnrCTmLFbg
 Y8iE9tlpXVlMkuxRk2QfCtPAt0GpGro4gxon2A+kx8f+D0FgBIVnxfu1tZOwrJx+xuve
 pz28rXnR6vqvyG17H7+SVsJXHIEWWibnQYpgHdHnzRa/peeqxQO2QGd3cDpmdlR41Q8r
 il9Ejv/4kF4JgmccmpXMUc6txB5lYYjSCWsG43psz/MSqBS/Hmm+zy+HNKSUT02oPJWB
 wTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695849085; x=1696453885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a74pdDrZrdwlkEh28Y630eaCwo/I4QCGA/VwQZGH4Q8=;
 b=tItb9xCAG4q25AW55nl/0kfXe50d3fZ5aRIZsixrEpMqvpFYcwla3dCrp7g948UJac
 p7OMXVJwF9J0hzZFx7LbGHDFZU7OwU077FMsk5zQQEwvYR34t6gAs/Dn+SKqz2yJ7Qh1
 lNRdG+7Dxqo8quhuxJKxXG+hZjs2UIDKA1az6wWZqgOtSCSKGKjnClbUfArSXaU2yMia
 Lk7fk5Zhwl8MNgY2XS9fT47CqRIWXZdoiznGEl8X5qiDn9tQ4ieagab6/ZHMuJKwQ+UW
 9uowa39IAcK0eLjjwICcdoalfuF8GDjkbvzmfdlB0Zb45gisSgeLU/d8EgYnROOps5dV
 uchA==
X-Gm-Message-State: AOJu0YxDgBpqQgFXJRu4P2lTDdjZE8EqH2JOtv3H2ivGP2dklwfEKCFu
 jrwgSs2V7Lys++IiT6gx3hL35Tk/QSUus2YYICDolQ==
X-Google-Smtp-Source: AGHT+IH67numDaxZxD54zJxyc373zfgNCr6bHhLpTmrffYZJw6Y61+w8l7XIlNFAtKDeQo92EdTus8ziHzjBuyteBp8=
X-Received: by 2002:a0d:dcc1:0:b0:59e:9fbc:a16c with SMTP id
 f184-20020a0ddcc1000000b0059e9fbca16cmr3335409ywe.35.1695849085295; Wed, 27
 Sep 2023 14:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Sep 2023 00:10:18 +0300
Message-ID: <CAA8EJpodnwS7nLupewLJfmGw6HhVSpFj=EGxSp4gKXDwtLw2QA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] incorporate pm runtime framework and eDP clean up
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Incorporate pm runtime framework into DP driver and clean up eDP
> by moving of_dp_aux_populate_bus() to probe().

Dear Kuogee. Let me quote my response to v1 of your series:

Please use sensible prefix for cover letters too. It helps people
understand, which driver/area is touched by the patchset.

This is v4 already and the cover letter still has the same subject line.
If you are ignoring the review comments, should I start ignoring your patches?

>
> Kuogee Hsieh (8):
>   drm/msm/dp: tie dp_display_irq_handler() with dp driver
>   drm/msm/dp: rename is_connected with link_ready
>   drm/msm/dp: use drm_bridge_hpd_notify() to report HPD status changes
>   drm/msm/dp: move parser->parse() and dp_power_client_init() to probe
>   drm/msm/dp: incorporate pm_runtime framework into DP driver
>   drm/msm/dp: delete EV_HPD_INIT_SETUP
>   drm/msm/dp: add pm_runtime_force_suspend()/resume()
>   drm/msm/dp: move of_dp_aux_populate_bus() to eDP probe()
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   4 -
>  drivers/gpu/drm/msm/dp/dp_aux.c         |  40 +++-
>  drivers/gpu/drm/msm/dp/dp_display.c     | 341 +++++++++++---------------------
>  drivers/gpu/drm/msm/dp/dp_display.h     |   3 +-
>  drivers/gpu/drm/msm/dp/dp_drm.c         |  14 +-
>  drivers/gpu/drm/msm/dp/dp_power.c       |  16 --
>  drivers/gpu/drm/msm/dp/dp_power.h       |  11 --
>  drivers/gpu/drm/msm/msm_drv.h           |   5 -
>  8 files changed, 161 insertions(+), 273 deletions(-)
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
