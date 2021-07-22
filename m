Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73263D2C3C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90DE6E9C8;
	Thu, 22 Jul 2021 19:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535526E9C8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:01:29 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id t143so7685849oie.8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7Ps4RwIG6XxXEH9dDOqdo2BIvmsObr7mTJxhT6gePXI=;
 b=gNpk0Cpx9lWZ2uCwsB/kcTfPh+1K9iB+EDMv+ITNQxIi0uF+cfnykM1D7qwr+sXIu1
 C4UsfhxUoxPtHzoauLJAMCXX5ORhEV6TfPvly9wQSKI6Ndm+5GGQcZeJqoNU1YhHBqzd
 3HUMA5UwuNAAXpkwhE+tCQ2ifijzqZJukQM8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7Ps4RwIG6XxXEH9dDOqdo2BIvmsObr7mTJxhT6gePXI=;
 b=Is/YyPIOwci7l38VMi3Yh9qZMDUc2AVPzZh4YXcATP9CWFm2tNZWYEJBuVUbct3Eor
 kT9kiO66cbu5gM5jLZWWLoFNquxAild/o0pMvV6P1Xth9AFT3DtJgvUidijhdWWIIJyK
 HOdRWDMYZAiLuXo7BZi9xFcUjkwN4Rd0lqcNtJIjbOlWPMJjLqh6vUj0d3/kPhSISki8
 1gMxib7j42GjInQDLpmtVJorExOBHtMB3OXtL2TGfmeOpcrk/66DBgYjeBlmBARoD9Td
 CqR3Fhko0gOKR7rYircmWpv/HFHw1Er3SLW/leKRxBlXPkb9gOX9hO0X2otpa6eKWrcD
 kAAg==
X-Gm-Message-State: AOAM530BUQcRAPYO+KrHV9pDcifM2j6VPicbWABi5Rk41K3l1eqx1BTK
 9vlPV79Kwyf+S7Gjn60GlWiAHntKIRUspnZnOBcKJg==
X-Google-Smtp-Source: ABdhPJxQNi5FQCMbhTIZY1DogS2Ny4lCD+0Ic7kNij6RwwSTL/wAv3FKZBJNJ150MFs4NFiNsZf52qF6aTUeZdpMpkM=
X-Received: by 2002:a05:6808:a83:: with SMTP id
 q3mr6706715oij.125.1626980488491; 
 Thu, 22 Jul 2021 12:01:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:01:27 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-2-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-2-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:01:27 +0000
Message-ID: <CAE-0n52F2bVLS8xnTefQ+3cEmcXVo7p=BPOBmky3NJ0=8oMmMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] drm/msm/dp: use dp_ctrl_off_link_stream during PHY
 compliance test run
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-13 08:54:01)
> DP cable should always connect to DPU during the entire PHY compliance
> testing run. Since DP PHY compliance test is executed at irq_hpd event
> context, dp_ctrl_off_link_stream() should be used instead of dp_ctrl_off().
> dp_ctrl_off() is used for unplug event which is triggered when DP cable is
> dis connected.
>
> Changes in V2:
> -- add fixes statement
>
> Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly")
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
