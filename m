Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22751486FA9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 02:21:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF2A10E6DE;
	Fri,  7 Jan 2022 01:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AD710E6DE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 01:21:15 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id t204so6203995oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 17:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/9SlotMENCux44wQbAsfKzhy+Cu/ZqcUuwyf9fYDVkE=;
 b=UjvIM9QYo+bY3BEpxncpQS7NXTJ9Y+lJTVCkI1V89b/w+7SFs8f2s8I25f2i7Q/6zx
 n5x07iBtgeEolKmAml2Ia5epbuu468orBW8naOxwe+LQ9hsKk+BWR6O4XEq+tv1uK6Dh
 +qDn8fbsX25q2JYWLk8SdEFxx6MZgHBnVXJjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/9SlotMENCux44wQbAsfKzhy+Cu/ZqcUuwyf9fYDVkE=;
 b=GMEOZYc+IQDfIvOz92kZb8QZtZucR5tqo73HtfPIL0aqCHVEv6cfDeoJR4Iy+WSiLd
 7nLlDJII43j46s7VohP6fFBy6i25LNgJQNw+ioYJomSPKEVEUd5lYJgo54cOaTu0fvpV
 /JE+8GFoSZA59ypP+8ZNNTzPUWqesH1S2uUS7eROvXcG/2kVoY3DWtVwf4Gl5cqkPAmz
 TwhDuCmNWW6DBj+nnY6RR0T3LBeays3hLfnb0rOMITlmqppATr9IghbZu1R7nTvFA8VD
 f9CamWI8M/SMf/sOeCftUKhhkQwNNiCVZfZ6qJB6P2I9SN68BZko7V7ZhftMoUb/CBb5
 gvQw==
X-Gm-Message-State: AOAM533JU5uaOGla6Q2UE8+gHyjeMPxBR09DQBIOWGZALSako5cr8hbc
 6WbI1VMtoJxWUiLH5iJNWx5Reo/nDonLIdT7RUcpFw==
X-Google-Smtp-Source: ABdhPJyvya1hnP9xuBJucbgcNWItbLuNz5uYbCgMd74jX/VjprlkduKp3+30krJxD2G1v8kziq3fNXKT/i3DTelj134=
X-Received: by 2002:aca:a953:: with SMTP id s80mr8300111oie.164.1641518474906; 
 Thu, 06 Jan 2022 17:21:14 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:21:14 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
 <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 17:21:14 -0800
Message-ID: <CAE-0n53V9UZ6+dF9JXdFKP7P7tLoQV=rDcuraEmen9t3EUHinA@mail.gmail.com>
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

s/hanled/handled/

> is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
> (and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
> use dpu_hw_intf directly.
>
