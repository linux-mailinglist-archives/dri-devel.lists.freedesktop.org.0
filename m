Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1377516572D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 06:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82276E0F3;
	Thu, 20 Feb 2020 05:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B425D6E113
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 05:48:46 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 77so2578171oty.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 21:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b0F6mdIbbyqJ8pmrP/z43Dyul8vyOpgKKbRJlBxceSI=;
 b=Dj/PTuGcX5bvKKNndi7kNoL5fDDrnj8sA5ecSWCgXS5spldvi9f+HfbQiZk1BZ4Q27
 BqVHTzq3Jf/QSqAp8/o6T1qrNhMFBsPsukftmAY6VAtLwds2AtYb1zdRi6JHsHzMHyPP
 pUeCmkvyJt0aPlrTsOCCPfW0xGxsF4RZiM+L5AoVWG7xz6Ool8zSOAEy72MrFFrFIr8J
 /9s8GKi1Vt8QkHBdpOr3i0EPmG2GCBqdRJDwC0d/9CboaJyQi3o230tDWy1i3vTVABT7
 gZBTcuyBl/po1AuNmHZazbR6K82R+/fFvOvgzIIUHoJyr4xEwtTxTQAY2J2XDOKzxFfx
 qP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b0F6mdIbbyqJ8pmrP/z43Dyul8vyOpgKKbRJlBxceSI=;
 b=DRGDqKchZI3snQnKLnLLrQ9jk6o/yfjV7w2CcJca7FsFdunB3BqiRdOW5LKD1xsWm4
 Ognwv9/ZDyLeYBzh0ouDDTMgrHFN1QpZoJuUT0sINfatHFc21Sqlyg2cf72ohHFPiR0n
 Y62pqkF6nDkRhMFX51YeKaIWGE/iPOz2Cb7UuvtPmTMbm/gV6TkwVGkFwzb8EGIg1edS
 yky1a7RV/o3NRDPbkK39DqkIwyubO4MVHn9Ku2OXGfvdsHIUybFGxgGG++2VDV5koMzW
 Ig0pH4fiemcz+36AFn7GMJrXRqIM1XbFu1MWCFWVB3A7wXPhEv1QGvnadMDO0+TM9ghe
 /H9Q==
X-Gm-Message-State: APjAAAUON593Nufsvt3UrzmplP/9qi9QromUngDTzFywztDnf8TzB+hY
 azYJxBVVRhX4AoCpIWjB+aGEQALtD78N6eGqWC9wCw==
X-Google-Smtp-Source: APXvYqzKncDhV3hzHRxI4jFA2zFrFbfgTQzje+xro87W+aJ9SnJ1h1RBfXJLiqq06+0n0Lm5UwlHJjEcfTJS0vOnrPs=
X-Received: by 2002:a9d:7d93:: with SMTP id j19mr23329830otn.102.1582177725955; 
 Wed, 19 Feb 2020 21:48:45 -0800 (PST)
MIME-Version: 1.0
References: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 19 Feb 2020 21:48:34 -0800
Message-ID: <CALAqxLUzCN=xuF1Kx0Op_E0zMXK7PbHqynPu6TDozTMRrAuxkw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] msm/gpu/a6xx: use the DMA-API for GMU memory
 allocations
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 1:33 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> When CONFIG_INIT_ON_ALLOC_DEFAULT_ON the GMU memory allocator runs afoul of
> cache coherency issues because it is mapped as write-combine without clearing
> the cache after it was zeroed.
>
> Rather than duplicate the hacky workaround we use in the GEM allocator for the
> same reason it turns out that we don't need to have a bespoke memory allocator
> for the GMU anyway. It uses a flat, global address space and there are only
> two relatively minor allocations anyway. In short, this is essentially what the
> DMA API was created for so replace a bunch of memory management code with two
> calls to allocate and free DMA memory and we're fine.
>
> The only wrinkle is that the memory allocations need to be in a very specific
> location in the GMU virtual address space so in order to get the iova allocator
> to do the right thing we need to specify the dma-ranges property in the device
> tree for the GMU node. Since we've not yet converted the GMU bindings over to
> YAML two patches quickly turn into four but at the end of it we have at least
> one bindings file converted to YAML and 99 less lines of code to worry about.
>
> Jordan Crouse (4):
>   dt-bindings: display: msm: Convert GMU bindings to YAML
>   dt-bindings: display: msm: Add required dma-range property
>   arm64: dts: sdm845: Set the virtual address range for GMU allocations
>   drm/msm/a6xx: Use the DMA API for GMU memory objects

Awesome! Thanks so much for the quick turnaround on this! This set
resolves the crashes I was seeing with
CONFIG_INIT_ON_ALLOC_DEFAULT_ON.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks again!
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
