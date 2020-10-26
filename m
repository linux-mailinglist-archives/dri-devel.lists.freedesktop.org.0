Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 428E629A63F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 09:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA45B6EB22;
	Tue, 27 Oct 2020 08:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6DD6E153
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 20:56:10 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id l18so6771031pgg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 13:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=5HeFLa89GKRfQ1XZepG1+Qq8mgTYnKfDuFsFx2t5hik=;
 b=ZnwvKThmJJRc7XtDD9S148ZbXLzkCKb13MMwlf6PpcbaAKGllxcAeTrBPlQWXgTyTt
 Cx9vp+bKlaRXdjdLVvrUhc0kkbtvE1ETmzQbN2aQjvswcZDdCrMC7UgjyuftV57g4WTy
 wSkVDm1l6tdzpNw8nxONLM/sGb/ogqbo+ymcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=5HeFLa89GKRfQ1XZepG1+Qq8mgTYnKfDuFsFx2t5hik=;
 b=buG/hA2RQA5+BDQ0pfv8xCqhWSr1DxObVefXD5nZhysWuQ2qah9p8FtCuEBJpNATVm
 Euk3SlimrV2Ygi8Oe63a3A5jGDSwQ59bHk1ZLG9an5Fd5zpGKZdaTgS4uQ+oi4U/4CH2
 AYWEakIO9HEthDdZz+ik42cbvos0Z9OHOBoRh3HmWzvL/dGG9pS6jxnzoCB8+WPpKqu6
 cSA9aOjzvzOj9f2aKh3xJW7ngpKi0tPI1BnkETIfHPcDF+ndQQdk5O5evaaTq0oN2AfP
 Yrv3P01pOXWiGcUR34oA5izggHy0SYtmFVfJyvvjprSfokUT5ZRQKkFSRHCE4dyfFuKc
 f9Qw==
X-Gm-Message-State: AOAM532e3cx5hn/Z0nFi2wvHE/Da8NB2yIAOoLbbWk7TbQEC6iULsqoB
 EJNpLEV86iZWD+KfNDMs2x4yxg==
X-Google-Smtp-Source: ABdhPJxi7nbZgFH7nWutnr3b3SCmGRv6cRm4tL4fle6uvBxMr2G6t7oz6Oswhe2y151V4jCatLqa3A==
X-Received: by 2002:a63:e705:: with SMTP id b5mr14922382pgi.230.1603745769694; 
 Mon, 26 Oct 2020 13:56:09 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id n19sm12588831pfu.24.2020.10.26.13.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 13:56:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20201026194110.3817470-3-arnd@kernel.org>
References: <20201026194110.3817470-1-arnd@kernel.org>
 <20201026194110.3817470-3-arnd@kernel.org>
Subject: Re: [PATCH 3/4] drm/msm: fix -Woverride-init warning
From: Stephen Boyd <swboyd@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jonathan Marek <jonathan@marek.ca>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date: Mon, 26 Oct 2020 13:56:07 -0700
Message-ID: <160374576766.884498.794065087413944435@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 27 Oct 2020 08:12:06 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Shubhashree Dhar <dhar@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>,
 Raviteja Tamatam <travitej@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2020-10-26 12:41:03)
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is one harmless duplicate initialization that causes a warning
> with 'make W=1':
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: warning: initialized field overwritten [-Woverride-init]
>   122 |  .max_linewidth = 4096,
>       |                   ^~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: note: (near initialization for 'sm8250_dpu_caps.max_linewidth')
> 
> Remove one of the two identical initializers to avoid the warning.
> 
> Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
