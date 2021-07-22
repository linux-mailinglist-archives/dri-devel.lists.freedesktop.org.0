Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE40A3D2DB5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CF36EAAE;
	Thu, 22 Jul 2021 20:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614936EAA0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:31:31 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id t143so7957804oie.8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 13:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Yy3HeS+seOW9oF85ZZ+kBEvNj9s3myL0jaHoXkTBtK4=;
 b=oXWv4ESd66hQUCh9IS64f1fvR6P7ao8qNtJy0VM408nNfaH6tQIpF57tLjAdEjdU6l
 L6fqgHh5RDvyRgEWAOhgK2q8feKD3t4TICkd70HZSUQxRKmOklm2raPOp9pMtF8sEJeK
 u77p+Q3ypT9M2D8mPcPXeMCI4ABhabknEtI04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Yy3HeS+seOW9oF85ZZ+kBEvNj9s3myL0jaHoXkTBtK4=;
 b=hONW5eRkS5ZbbTn02JleCR3d6j0WIX/xf1PIBSmNQn1SmG0OXupb175vLqmyht3EVk
 cPyckJvOF4jQUQ4PCQxgB6gaBodwpedXRmWSz5WZWMk2k13IQLE56+Tddg6eBEbSCPD8
 jRDrOPewOI2ra0oI9pdNrM9yfXLbIaPKSurKlfuvmTnbNf3IlewUXeA/51GIPIVUR/Th
 SSuM1szv9s9RGP5F3Wk/BvD+QxPh2BtwAQRg8JAp11cRV6m0nYo8lFBoTFoeh96OryIl
 Fl9H+WiNm4jQmfP09cv2+S8PeEehaprNY74mJLlAq3aBCI+bvvtae8vDktWXp6tdcU0W
 Ekng==
X-Gm-Message-State: AOAM533iNAhmXNVbgQ/k2moKzy5gkV+ee3paazy3YoQKpAzt6QkKd7+h
 5RfsnBxLx+IN4e0Qo5U9zqEc2G2Z/ZNCEPnouKzO9vy0KO0=
X-Google-Smtp-Source: ABdhPJwcHGD5E6pEZE6mSmgFnlXzVe4NS6hzeuQV4yPBN+FApumnKFVvNOOGt+K04hQm4EFeDeud++PB3DdUAAt6jFY=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr7139284oib.166.1626985890302; 
 Thu, 22 Jul 2021 13:31:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:31:29 +0000
MIME-Version: 1.0
In-Reply-To: <1626909581-2887-1-git-send-email-maitreye@codeaurora.org>
References: <1626909581-2887-1-git-send-email-maitreye@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:31:29 +0000
Message-ID: <CAE-0n50zCC9m9Wr6WUvM=mfaQ7GXVEjHNC_T2RfN1=9Y1U_qsg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/msm/dp: add logs across DP driver for ease of
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

Quoting maitreye (2021-07-21 16:19:40)
> From: Maitreyee Rao <maitreye@codeaurora.org>
>
> Add trace points across the MSM DP driver to help debug
> interop issues.
>
> Changes in v4:
>  - Changed goto statement and used if else-if

I think drm likes to see all the changelog here to see patch evolution.

>
> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> ---
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da..8c98ab7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1036,43 +1036,28 @@ int dp_link_process_request(struct dp_link *dp_link)
>
>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> -               return ret;
>         }
> -
> -       ret = dp_link_process_ds_port_status_change(link);
> -       if (!ret) {
> +       else if (!(ret = dp_link_process_ds_port_status_change(link))) {
>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> -               return ret;
>         }
> -
> -       ret = dp_link_process_link_training_request(link);
> -       if (!ret) {
> +       else if (!(ret = dp_link_process_link_training_request(link))) {
>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> -               return ret;
>         }
> -
> -       ret = dp_link_process_phy_test_pattern_request(link);
> -       if (!ret) {
> +       else if (!(ret = dp_link_process_phy_test_pattern_request(link))) {
>                 dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> -               return ret;
> -       }
> -
> -       ret = dp_link_process_link_status_update(link);
> -       if (!ret) {
> +       }
> +       else if (!(ret = dp_link_process_link_status_update(link))) {

The kernel coding style is to leave the brackets on the same line

	if (condition) {

	} else if (conditon) {

	}

See Documentation/process/coding-style.rst

Also, the if (!(ret = dp_link_...)) style is really hard to read. Maybe
apply this patch before?

----8<----
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 1195044a7a3b..408cddd90f0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1027,41 +1027,22 @@ int dp_link_process_request(struct dp_link *dp_link)

 	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
 		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
-		return ret;
-	}
-
-	ret = dp_link_process_ds_port_status_change(link);
-	if (!ret) {
+	} else if (!dp_link_process_ds_port_status_change(link)) {
 		dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
-		return ret;
-	}
-
-	ret = dp_link_process_link_training_request(link);
-	if (!ret) {
+	} else if (!dp_link_process_link_training_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
-		return ret;
-	}
-
-	ret = dp_link_process_phy_test_pattern_request(link);
-	if (!ret) {
+	} else if (!dp_link_process_phy_test_pattern_request(link)) {
 		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
-		return ret;
-	}
-
-	ret = dp_link_process_link_status_update(link);
-	if (!ret) {
+	} else if (!dp_link_process_link_status_update(link)) {
 		dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
-		return ret;
-	}
-
-	if (dp_link_is_video_pattern_requested(link)) {
-		ret = 0;
-		dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
-	}
+	} else {
+		if (dp_link_is_video_pattern_requested(link))
+			dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;

-	if (dp_link_is_audio_pattern_requested(link)) {
-		dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
-		return -EINVAL;
+		if (dp_link_is_audio_pattern_requested(link)) {
+			dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
+			ret = -EINVAL;
+		}
 	}

 	return ret;
