Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9558227A5B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544CB6E431;
	Tue, 21 Jul 2020 08:18:04 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FFD46E1C4
 for <dri-devel@freedesktop.org>; Tue, 21 Jul 2020 03:24:55 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id s26so10063526pfm.4
 for <dri-devel@freedesktop.org>; Mon, 20 Jul 2020 20:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xEKJp/jVsPRX4UpWt8HfxSdWbSchkUleBYjVnsTaofA=;
 b=LQHyZUWBvXVCW395DzCgA0Dhe5iVnTk00XHZfa9Y30Fi6a7xuBBwh8d/I2OiyxQi8O
 +LA8HvHeYdFDOzs4BqC3u3SV8ITPjtTbJFB8rSBrsk5B9SfjlOOghCWPQ2HCeWTEw5It
 R7Yq+EdLhhwajEl5phhZ0NpX/S8XoLKNpSthc2i5xLCERwf8ohqeWqd93eJzunZtDWpC
 wxlBW46cFDuL3s+EbbViTlFSPFuZ/CxjYL7oDjdoKeSHoZVhk1lgTqI9fwmdg2LZ0woA
 yl/MBm9Qb8WXF8FkLvcb1DUI6Owzq7zAgMNx9EDlZwu4lJ033QNTwmrXOozbT5lNJcRS
 71aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xEKJp/jVsPRX4UpWt8HfxSdWbSchkUleBYjVnsTaofA=;
 b=AbF5W38iZ0+y88XlhLO2RMSDEbXx1PTJjt+fNny6OCT4DxjWPMAlPhgZPFBbFV/YPH
 GtD/T7mACWzI5XwUkjiVZmJF/KgWRJwri1uylV3mdKrza3Uarphbyn8TyvNY+HqUHv3g
 hCODhrS5kIhcf9b2rcp19CvuypJM3roP5UUeCeLJ62jBQbReuYUMZXMVsNQI9nbliPDM
 +mUxBBJyzd/T6H2DIxFFGKNT2gR4PVBgxezug3C+S458aQCnjwB5FzxjAvQK9xzDaDbS
 4mKYGq8qb2XyQWFWgLMqbwoKNB+0kY+rJBmoaztVMv4lAHBbUbK0yVC5s6bYW5UEGNTV
 WTFQ==
X-Gm-Message-State: AOAM532siaZoIe5GleeLwXpyCoe2MBKQx1oMKBijq7qamXp//Eb7Xl6i
 41Z60ifueseIK1RMi3jpVhRrFw==
X-Google-Smtp-Source: ABdhPJzzJUvTTt3zYg8Ad9nFkak4Z6dshzvJaAVPO+PpmMtkXDtOIXzZcz5rd02eSZR/emH7oCtbLw==
X-Received: by 2002:a65:4bc8:: with SMTP id p8mr20871536pgr.418.1595301895018; 
 Mon, 20 Jul 2020 20:24:55 -0700 (PDT)
Received: from localhost ([223.179.133.67])
 by smtp.gmail.com with ESMTPSA id e18sm18353912pff.37.2020.07.20.20.24.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 Jul 2020 20:24:53 -0700 (PDT)
Date: Tue, 21 Jul 2020 08:54:42 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
Message-ID: <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20-07-20, 08:03, Rob Clark wrote:
> On Mon, Jul 20, 2020 at 3:01 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 15-07-20, 08:36, Rob Clark wrote:
> > > I can take the first two into msm-next, the 3rd will need to wait
> > > until dev_pm_opp_set_bw() lands
> >
> > You can base that on a8351c12c6c7 in linux-next, I will make sure not to rebase
> > it anymore.

This was 5.8-rc1 + 2 patches for OPP. That's all.

> >
> 
> I can't really base on something newer than drm-next

But you need the OPP dependency, isn't it ?

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
