Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC084B7CF8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 02:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4004710E5EE;
	Wed, 16 Feb 2022 01:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F2E10E5EE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 01:57:44 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id x24so964988oie.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 17:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ZTvRSyO/qxdBQNSGL9ioAIGzVWwq5zlmxJWFNV0Wr20=;
 b=HWkZ5vwx6mfNm7n1oEfjdUBxUESzSpCu2CsLux7GU2KdSWXNU0jeYezuanMY6f2y5e
 hNS9w8SCmFlzTS9/iiJ23crC0cHF4VhHNHS30ToDRmvV+RcIDsiiRzh7uMf9dZw8re9L
 3E6EtMbGrKz+ChwbcCrxsB+Hw04fAQJsbMAGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ZTvRSyO/qxdBQNSGL9ioAIGzVWwq5zlmxJWFNV0Wr20=;
 b=UaFOhCOwjyELFyjvfezGMBtX/TGfOAb+YyDXhgYMfm3Z5OgCQfACgD2TYhk/JrFXEc
 BSYi42vTInERzjw67Pn2LoaWtW3WJF7DAJq2p7aFF7rd9wQb03RQpbJOLkMI1pc20E04
 hu+r7nOTkyRhUF0TwglVOYaRwYa2JLx7Jdy/2jYQOda1fmXykQefhOTOz7jh87J8tIv/
 kYP8oJ4t/TukDy+GPVxXjw/UvhHiHkgwWCBR3Ee8O5ujdncBziP9ZhMCLvtEp+bF150X
 vf74uYrO6nmAd2r8rDfEGgbtMcTwmqwS2a9BccD2At5FGp3yDo44SizFijl5UFsBf0/o
 MEbA==
X-Gm-Message-State: AOAM532AM/CHBGoj7e6FOkfpyYsh0XmtBMMTMf6uWdhAHg0aRaJ8hi8R
 /O1kNDCahIUmrLIwpQ0FwK4eSKXXWSE/76xAVZ9rmw==
X-Google-Smtp-Source: ABdhPJzj73iDJin5F5rq+gKYnmF1uPigCaFPDoFUn1UpFRxX1o20jaMBpJ1kNDnX+e6MAm8LSl2NEdmpMhg/9cC7XAM=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr295838oij.112.1644976663351; Tue, 15
 Feb 2022 17:57:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:57:42 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:57:42 -0800
Message-ID: <CAE-0n51V=dDCU8QDmLigJMOevYKO0v6JwoTEB0ghpHM7OobubA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: drop bus_scaling_client field
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:16:39)
> We do not use MSM bus client, so drop bus_scaling_client field from
> dpu_encoder_virt.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
