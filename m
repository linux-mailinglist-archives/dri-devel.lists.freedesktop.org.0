Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91565423053
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 20:45:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40466EB7D;
	Tue,  5 Oct 2021 18:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0086EC2A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 18:45:51 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so44326otb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=OHTvFeyJP3J+uo/9wz+ahOIzpwEg9uJmeumv+TyQfVM=;
 b=KlgpGE95LIxZlb/pXE9cZu9nugQIb8LshfOewuCbEuACzl+rQB1xWDjBU3mPOLrDcW
 j5C+gbD94hGL4uSgBoXfUM5rt42vBONs9pSviN0hEYnzNWeOvmPxCoa6eWbHPVH7pzq8
 9uUd3ccnAK2NsO+petzbwloyc4I76262QBVaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=OHTvFeyJP3J+uo/9wz+ahOIzpwEg9uJmeumv+TyQfVM=;
 b=DXpXI+FyrqCVvjKWE5ZZFXTJ/n4ve+s1Jg74MK3D3Pp4WQa0Pe3gyeYO8SVFqBVzYR
 8UXg8jOFiObsOZxWmuUInjUdhoGt+17OdwoJ3jEORn8QdobzwSvlNBM3zX0RAXBRkvi6
 nSLThw5P8MkXnx2AVkIBaaz/AO0Hs+zPbWNlU7BifnZwA8Zs2+o8pfVaRfJS1g4RG3nr
 OVllWj6JQEnLT8HPVtOG7h/lresqx/G5Map+tU8Me9ZMXD2hkFcj4aTZyqIGMQ9NQ6nJ
 AFfAtkikUZrsCSsWA31lYVXxUzPZZVjSwSQuvP9CpZG+6XkFiZsX4J2zxwPSTWYkkbCZ
 jd1g==
X-Gm-Message-State: AOAM531eb/e23poQtZgVmAGYQY4+QkqwEGbrq24xiaxywLtrlKvo7kL6
 DuSHkT9+UqkN8qurOtq69onFpX0Rf0r1A+WkjYBspA==
X-Google-Smtp-Source: ABdhPJzA4iPXbH8yz7UdLkbyMSd1FJG8yE9lKOiGiI04UiNVk5/3sbM0WRNEBTKxB3XmF+4HfBHW7j8fmcgm3mYJLEA=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr16240694otn.126.1633459551057; 
 Tue, 05 Oct 2021 11:45:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Oct 2021 11:45:50 -0700
MIME-Version: 1.0
In-Reply-To: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 5 Oct 2021 11:45:50 -0700
Message-ID: <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sankeerth Billakanti <sbillaka@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-10-04 19:37:50)
> Found in the middle of a patch from Sankeerth was the reduction of the
> INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> is initalized and HPD interrupt start to be serviced, so in the case of
> eDP this reduction improves the user experience dramatically - i.e.
> removes 9.9s of bland screen time at boot.
>
> Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
re-read the code a couple times to understand that it's waiting 100ms
times the 'delay' number. Whaaaaat?

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
