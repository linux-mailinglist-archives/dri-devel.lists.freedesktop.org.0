Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F731486FA4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 02:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794E310E6C5;
	Fri,  7 Jan 2022 01:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFFC10E6C5
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 01:20:52 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 p8-20020a9d7448000000b005907304d0c5so5053288otk.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 17:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=CxOVaVhRsLRq4HYjShTRxL0ueYps3B6EUDEkdRDY66M=;
 b=Bc4V1bTXXuzXBKN/0105snRyrQuze8wvwlkzqC1644vLFWsn3zSMXhMAunlIfW1i/H
 H2iTVBRkzSk5P4Kl14I28gES3f/2FHaIuUHsqfrWbdlMKP5b1GUw+WYkFMuYk5kUQqwz
 dmHJRUMEqeILxaYz4K3Ga9ncN7YdfSOCSRoeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=CxOVaVhRsLRq4HYjShTRxL0ueYps3B6EUDEkdRDY66M=;
 b=JUV7wASl9HxFoRuPl1VlE1joUMKfRSc/KbTZ/2VhdM0oVRh0ipIUAHY9AE0PUCyckY
 8Z7W7HLtY50icG5MuleMAnOmajZyLX4BT1lQSy9K8qDQHQ9MY/MjAhbcEGjXysIAIzHb
 OVTtlHszM/ZcQGqBrbOCL70S2a0zneB4D8lwx1rxKCwwA+OO/r9A/LsLAGc/z5VQAQUZ
 EWQQ/xyaj8+8zlILo9yX7g70a2gtbRMsKQRbkzNRL8Y+TJSHrsI8kKgOM5WvfddXk7nP
 8jKXui5OEq1nYgK4PtnLLTdW+lz1kS0T4bFjiwH8tm299bg+7RLgE/iUB+l5c47zgvx+
 0X0A==
X-Gm-Message-State: AOAM531hRFjzCuyqAcTuCpHSuLszBbwN94YHOlyg3NPqaIKRMWONbWnJ
 uEDMVKhFFBnTeJpezCMINbZWxz804HI5JCZfL1RF+g==
X-Google-Smtp-Source: ABdhPJx1QQDJrSBFz4xdC91jJMHJuO28JfFvcCm1pIgqyb9rNoMZxVNCuSqnuEPrtm/rE8qVSc3AUvrVc76Q71cv7Z0=
X-Received: by 2002:a9d:1a6:: with SMTP id e35mr3971287ote.77.1641518451931;
 Thu, 06 Jan 2022 17:20:51 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:20:51 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 17:20:51 -0800
Message-ID: <CAE-0n50SzQY1pujP5owR60CCa4at6mgpDXMqhwkwFnhQaY+Dqw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/msm/dpu: stop embedding dpu_hw_blk into
 dpu_hw_intf
To: Abhinav Kumar <abhinavk@codeaurora.org>,
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

Quoting Dmitry Baryshkov (2022-01-05 15:10:30)
> Now as dpu_hw_intf is not hanled by dpu_rm_get_assigned_resources, there
> is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
> (and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
> use dpu_hw_intf directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
