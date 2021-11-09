Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87444B529
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 23:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BEF6E82D;
	Tue,  9 Nov 2021 22:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094326E82D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 22:09:25 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id bk14so1368253oib.7
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 14:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=DPT5pWa6cT8nw3Zv9xh5xFmmq85YU9JvkFn3DJbbeno=;
 b=Eepl0E0INMovuY9E/5rpog6e/jKCyo5Mf5NMvqE+gygcSEWSSwfak8b9jRvDyxJIwV
 XbsyCcK/RVQDnUuh1ed6cRQNrYmeYfIzc4Rcw8U4qaSagdxJ5nO9ylDvR6Gpksurt6KS
 5RZ3DEDXQvUcXuCz53c1nTjSQHHOQOSASdlQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=DPT5pWa6cT8nw3Zv9xh5xFmmq85YU9JvkFn3DJbbeno=;
 b=O0VVk/IAHKrcLg5Qb4UxxxKuK82SGLREwqsyPupVS58sPa9+2IPoaNsCKpOlj5hCJc
 9dNAa8lZpQ3qu2kDvqgehzbhu/Kpsg8MSBwPo5B/JjUWeeGDQEMoqCHzMkGDPAIxsZXm
 bSrR3tcKL9wg/V206tel+AgTB+V0b+v7XqieSZyScaFWtFlGr/cbWI9ehvHDexKxQ3g9
 CZrf63v9kj6a0zWr628pFxQMBR8KP4SU1mRNNkUotZJsUzX3D9gNWxI7PFu1Dmcz+kqb
 5rpCjHXkAEe4K/fUHKxmL6B+jQ2XXbh5oi8Iy7J6aszcPK7Ytx9CwSqOSz/3yoAdiBUM
 6HHg==
X-Gm-Message-State: AOAM531ZGjfOKBwrad56ml0lGR9Fgpdu+pLZbPxOtPYsjCjfOaERm/hW
 WdIoeU1ye9QPtakKU2db80JKLIwlWMOY23l9OUwAmQ==
X-Google-Smtp-Source: ABdhPJyq+WHaMv+pQAv1iUIqLn4EAtyzQnLJaulAUyKW2RUle/i+EGbpt/SBpZiLkLkmUM3ZrpMeVk6x9TtFHDQkxCA=
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr8942621oiw.64.1636495764284; 
 Tue, 09 Nov 2021 14:09:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 9 Nov 2021 22:09:23 +0000
MIME-Version: 1.0
In-Reply-To: <20211106172246.2597431-1-bjorn.andersson@linaro.org>
References: <20211106172246.2597431-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 9 Nov 2021 22:09:23 +0000
Message-ID: <CAE-0n51evrWUseEKRbdsfx9nLHuv5YdS89OE3X5Ffs+LLN-35w@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Drop now unused hpd_high member
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-11-06 10:22:46)
> Since '8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon
> Chipsets")' the hpd_high member of struct dp_usbpd has been write-only.
>
> Let's clean up the code a little bit by removing the writes as well.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
