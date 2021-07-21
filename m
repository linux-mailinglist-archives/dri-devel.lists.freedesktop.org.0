Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9B63D084C
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 07:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7267D6E8FE;
	Wed, 21 Jul 2021 05:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03776E8FC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 05:31:16 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 n187-20020a4a40c40000b029025e72bdf5d6so325497ooa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 22:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=AziQaKgOzZUdFImL39sMy7YXJdQjDBARvL6h2OcgT2I=;
 b=a4ru4eiW3xPSP8N5PGXQjfNDTp4fhMwakS2V6G/XjLGrPXHmoP6xtF86l/0AXm3/sQ
 Fz2nmqQz3GgbbIwktYanCYu32ipOjxIXh8fNbPRbs1C1YTrjAUy41rzxsTuyXED1ZLDa
 MMfCgwNmk19mF/1yAFudoBRMn+l6RcZ/nAv+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=AziQaKgOzZUdFImL39sMy7YXJdQjDBARvL6h2OcgT2I=;
 b=G0VpEd+e5nwiRUWMZjEBL9CxiqAtvMoJVYJPFap1HXCBbDDvMDV6+bW8Pw6z9EZeOJ
 VantAcLah67gpZq9mzMMeguzSbScAgI5q5Oov3kc9jCicomMTtp5d8KEqmsqoJY0MKzT
 /YvPspT+wgbfnvno7WiNT5MNadMPn3vf78TjtsyqZgQT+kRRTHMiRkx8hYmYMjaK0qpa
 90kJSqrSTO5PQrI1B5kl+lPmerwk6slkfK2GDKbDAlgPuX97buvEvYg97T+rXfLTD9Dq
 7YZPbkm9YFF7ZU6IWrUvZqd8qnfY9cUO4TghvDwhJ52WZ/wrL/tV78jtuURff5hXBgvB
 4SmA==
X-Gm-Message-State: AOAM532p/I5rTzfoZPJrHRFRmgQPyr/5knpXv/tn6ymkNoEIO4h37R4e
 d6qUKg7ztMQpf8mz1KkIYeOFe8dNfWUPqce+Y1LVIif49L4=
X-Google-Smtp-Source: ABdhPJzBLUzjbGsYAqGoi/pDY5vm7sdHcdIspq2qL0j/Yu9mQneMPHNpkEf6T2iJ8i9LmcG7vFrwUcyotsgzJI4fTP4=
X-Received: by 2002:a4a:9783:: with SMTP id w3mr19466639ooi.80.1626845476096; 
 Tue, 20 Jul 2021 22:31:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Jul 2021 05:31:15 +0000
MIME-Version: 1.0
In-Reply-To: <1626820770-28158-1-git-send-email-maitreye@codeaurora.org>
References: <1626820770-28158-1-git-send-email-maitreye@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 21 Jul 2021 05:31:15 +0000
Message-ID: <CAE-0n52+E0eTgK_4x3OVnqv+U_12tMqxZYtcu3t+FiCJeaq2_g@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: add logs across DP driver for ease of
 debugging
To: dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
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
Cc: linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting maitreye (2021-07-20 15:39:30)
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da..316e8e6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1036,43 +1036,46 @@ int dp_link_process_request(struct dp_link *dp_link)
>
>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_ds_port_status_change(link);
>         if (!ret) {
>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_link_training_request(link);
>         if (!ret) {
>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_phy_test_pattern_request(link);
>         if (!ret) {
>                 dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> -               return ret;
> +               goto out;
>         }
>
>         ret = dp_link_process_link_status_update(link);

if ret == 0 we go into the if below and goto out.

>         if (!ret) {
>                 dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> -               return ret;
> +               goto out;
>         }

At this point ret != 0 due to the goto above.

>
>         if (dp_link_is_video_pattern_requested(link)) {
> -               ret = 0;

And now we've removed the ret = 0 assignment from here.

>                 dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> +               goto out;

And then we goto out. Isn't this a behavior change? Still feels like we
should be using if/else-if logic here instead of this goto maze.

>         }
>
>         if (dp_link_is_audio_pattern_requested(link)) {
>                 dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> -               return -EINVAL;
> +               ret = -EINVAL;
> +               goto out;
>         }
>
> +out:
> +       DRM_DEBUG_DP("sink request=%#x", dp_link->sink_request);
>         return ret;
>  }
>
