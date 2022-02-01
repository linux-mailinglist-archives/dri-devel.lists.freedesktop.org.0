Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B614A55B5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 04:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA8210E742;
	Tue,  1 Feb 2022 03:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC8710E73F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 03:51:42 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso6863683otv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 19:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RwCJ9hsr7K8u4lScvyqLshgsHaCbHyGZzuvtWtgyQhk=;
 b=W/QeLuCExljnv+CgrUxbXAs3XEeKWZ8rl6XrNIq1eFyWpdrTb+tFCq3TopqOgLpk4m
 B0egCwsR8NYgiW3xtg8pT+VdahFhPJYh7zIOaB2oqy+B9/ac8BeN7pLfY5sKT2nc93aU
 6jX0n3f4Z7rpaOFLQdVWswntJe2MvkaNK+vFyKYzhLFcwcbqoS056ui8qZrDju+3GZbe
 R1p/YAzPyXaBwcHwZApsp5Or+JeU7CNJ8WGt5XdSSMt/Ljp6MYAMtVkLJqeJZ2GXQJsC
 EL36wmFdryie/kaqRwmRZ1rzOAdo5jKBEJ9BS0w64YQFpRaEaB+bNQgbdPHK1DJPtF2W
 FFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RwCJ9hsr7K8u4lScvyqLshgsHaCbHyGZzuvtWtgyQhk=;
 b=fPLisoDxErHCryLwrqaD+zQPz1qs92oqPSPWrPgbAQaTG1Mae5kM4MS1K1OM7GUSAh
 orGKvFAf6CqRZf1SrAl05/C5CjkyJ4BGFNAczxJapt7rJR68OKpMjJRN3VAsZIthQ8SY
 /8K2ei8CCfH12/kX0gPh+pytqDAnFW9iekWjLt0lLtxX3JXZrnTTLrDIsHGJF8BAmF75
 rjspYiXSjcNYvrW7br6xQAEbsRQyZMz/wfO85d6TYFQ0GcNm7xYn9ZEJE5aqQ0YiQsKn
 99Zsuvz3y27oPJGW+QbHRKh5Wvv2uHiPSzoezaSxpkwKWnZ4DInqOQpPAxr2NY33BQWq
 LgPg==
X-Gm-Message-State: AOAM532/H8mmvTV7cm2UWxUMBlliHQO5qmwzV2gXwJtdhVcwPkjMV5UJ
 4XlRhKsVp6OcGfsyrb04vZFqLg==
X-Google-Smtp-Source: ABdhPJzlVbKkZvspjBMNPX/2jwwSYJ4UGETyWaSGL5Z6yUDRuLU1XIP91aNhSXJlSr73jp6k3OJsKw==
X-Received: by 2002:a9d:d72:: with SMTP id 105mr13424096oti.340.1643687501469; 
 Mon, 31 Jan 2022 19:51:41 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id y3sm16901825oix.41.2022.01.31.19.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 19:51:40 -0800 (PST)
Date: Mon, 31 Jan 2022 19:52:00 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH] drm/msm/dp: add wide bus support
Message-ID: <YfiuYFCONqRzv3Mk@ripper>
References: <1643390945-10813-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1643390945-10813-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 28 Jan 09:29 PST 2022, Kuogee Hsieh wrote:

> Normally, mdp will push one pixel of data per pixel clock to
> interface to display. Wide bus feature will increase bus
> width from 32 bits to 64 bits so that it can push two
> pixel of data per pixel clock to interface to display.
> This feature is pre requirement to support 4k resolution.
> 

Can you please elaborate further how this is a requirement for 4k
resolution, given that I write you this question on a 4k monitor.

Regards,
Bjorn
