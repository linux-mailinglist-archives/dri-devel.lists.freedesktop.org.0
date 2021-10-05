Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D284232F0
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 23:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5E36EC65;
	Tue,  5 Oct 2021 21:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F20F6EC65
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 21:38:57 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso613564otu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XwBxFBF/Wz7qJo21AO0Spsmb8Z2fz8+ghFhMq6YjQTU=;
 b=WQ8XmZxsPfbZllzokRO7+Jjx/nD/hJboaXKtbethxbp3yID6yrPSP1lSPe2WQPhrn5
 aeG5uWM9yj3v7XY1gQVk6l3rK/YsaGZIADln28Ae7thnLpJf9Ee1SIDTiQdmshxmsX20
 nRwZfEheKCBrFroqZt1ZFnHViTUarBBJrk/mHHGt9sZpCdy06NetQ5pQv86QuaHuLGOf
 keRle//NDqbe2CoGUEJb57LfABJe3RsjgPaU2tIFKthI80mE0XR+6OrW4NKZuCu0ZZnP
 EnhGft/J5pAEvxsRah9fc9NjZjBOlRsX8VYzyOnNtTbHbBtod0DGP66L9iPCddng66Ge
 zmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XwBxFBF/Wz7qJo21AO0Spsmb8Z2fz8+ghFhMq6YjQTU=;
 b=COEJgKC3PYhmht8ClVcB3bCQrMabLkiOI3Pca7bICtni+aNSpoQDF+F43rZUh8wGfq
 pngBz7mR6SCRmA1bZh52YqFNffg//wUKwxbZ39P4kEGpzl3iCbiPijuDDEzzC7cXSeoV
 gUACNxdxEcVu59mIufRRaiokaptKx4VZzX+76KI2Bsv8CH71mcwnVoIs0HWOKWEj8EQN
 1i1TyvV7WykOlF1IrdBy6E24DNkoRCJpVBOse76l0SxpSVp4T6/zyzkhIdmowpT4KNzY
 foJdO7KuZ5m3hSS2UwdKnGG/UQuB5ejwM5tyt+AvXZwz9qumEy8e5kvIykI6xQyaZePr
 UGVQ==
X-Gm-Message-State: AOAM532nm85PhrHj34rfHoAtqzNvCzBbVa6TmtAFsv/VvJzx39z5NJgs
 ndmX5Cc/4aNVqJmD3nnzLiMZcA==
X-Google-Smtp-Source: ABdhPJxZU82kUOM2pe8hCHCAjxEF1gNb5QXbBnbhthExkr2zHei0ZXp/UlrjxB3s9dJBtIBvaocs5w==
X-Received: by 2002:a05:6830:812:: with SMTP id
 r18mr16200467ots.282.1633469936358; 
 Tue, 05 Oct 2021 14:38:56 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id z24sm3514610oic.26.2021.10.05.14.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 14:38:55 -0700 (PDT)
Date: Tue, 5 Oct 2021 14:40:38 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sankeerth Billakanti <sbillaka@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
Message-ID: <YVzGVmJXEDH0HfIL@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
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

On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > Found in the middle of a patch from Sankeerth was the reduction of the
> > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > is initalized and HPD interrupt start to be serviced, so in the case of
> > eDP this reduction improves the user experience dramatically - i.e.
> > removes 9.9s of bland screen time at boot.
> >
> > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> 
> Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> re-read the code a couple times to understand that it's waiting 100ms
> times the 'delay' number. Whaaaaat?
> 

I assume you're happy with the current 10s delay on the current
devices, so I don't think we should push for this to be backported.
I have no need for it to be backported on my side at least.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Thanks,
Bjorn
