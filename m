Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BAE8AAD72
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8DF10EBB8;
	Fri, 19 Apr 2024 11:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YNfrSo2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C380C10EBB8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:10:33 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2dac77cdf43so25111221fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 04:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713525032; x=1714129832; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=f0GwB5qJ+cyOywFV3R2azRhim7NBqTDtJm3XeiS5x10=;
 b=YNfrSo2pY7li36pJ2+7BzfFBEJj3TkF9gIG1/CiGkrfBB/cBeg0eS1KqL3j/vM7nS+
 OyiMiFFuSCh7Fgd6+l+6Q5RaQdxbdn/ghHelPj9tNyN7A08pHyOTa5Vu4dv4bRrtfRV6
 yG8x6SzlJBRKRnFxdMaN0b7pEHZAAtQJJzF/WZ0RyJVz34/JPGom7bIe1HMAvW4ulRIK
 ldlq8wO8iKvD4i7fK+VnRqj/JRaOXDpoZxJ1bTnoWOAlQFvIkgsQLrlxDPL5ywJM+G9F
 vjKmgtfCrWhUTWS5h4/8SDVhL1p79BTw4kr92nTRV3rqomoVchIbwTq0i02dQWvJuxZg
 uBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713525032; x=1714129832;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f0GwB5qJ+cyOywFV3R2azRhim7NBqTDtJm3XeiS5x10=;
 b=GEae/lial3n/9CQvQrPve+OGMdIQ4pqGpm4JnnhYpqToBah+Mgqjd1aWXM6fHbLfj9
 VpJ93tuyqQ6jQDCOClUxMoh0bp2C3tZwmbvKrTo5v9OC5Iy+sIky6iA9q6FY3yZ0e+iN
 WPzLAGRWtGYzYxdaHj2T0So9//UxXF93h1+9qfur08YMJ5cYlXQNQlh/BMh9BBwQk96m
 NbEi55cQ5RW+8U+dsLHLhHl1TetucWWsJuAf3tFBBaoNq1a+Ic+ufMkeno/gxI64aNic
 GpJ8Gp50wp9l4ehwPyHtn43WJqQmPjr9xAdMoMC/aaudGGBZ3YGkZmEYo5GMkfzm8f9m
 l5Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtdggq8tk0L1S6a61/xlnwrVNpop5yn3KfmHk38e5zNn/vPbmKnaZ5BOV0vfv39D3Ieg9T+elXIIYmtG/tL6oUfSklS7pDGToXMifVm7T0
X-Gm-Message-State: AOJu0Ywo+PNNTkJQcGdOgVbAjtnDT0GJI/DARaaoIXZ4I8uRLeqKXi7q
 7pwQTKd3geBaTWcibrUd5PIey0AWhGySYLyujJU5qjvrRknqHotRqjE/cQdMm9k=
X-Google-Smtp-Source: AGHT+IFQo1G5Y1xQHtbUg2nwyWjiKgAT9a/1iOBxkBGTK/stbBS9hYfv5OT/OGO4XL4ZN4IxJzHdRg==
X-Received: by 2002:ac2:5629:0:b0:513:13eb:c99b with SMTP id
 b9-20020ac25629000000b0051313ebc99bmr1166467lff.62.1713525031233; 
 Fri, 19 Apr 2024 04:10:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 i36-20020a0565123e2400b00516ced23066sm656047lfv.61.2024.04.19.04.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 04:10:30 -0700 (PDT)
Date: Fri, 19 Apr 2024 14:10:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Herman van Hazendonk <github.com@herrie.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] component: Support masters with no subcomponents
Message-ID: <fmqfaq55l7l4ipreflgzrhvybtvar4kfclbtstctw2qkcxakbh@tge4viy6u7u7>
References: <20240417-component-dummy-v1-1-b0854665c760@herrie.org>
 <CACRpkdbijfwYFhg2XigzVKoPDjU00K+arqaL_kP3FNxsS82gHg@mail.gmail.com>
 <4xywfprr7qkxpncmnhqjc3lrrcjbv46tsmlzz5yxvcr4xr2dnq@w57ni7u2hpvu>
 <CACRpkdYT9my4KETHybHPQ3ksXhiEgYQLSdP8TsBmwzNd+r-qxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdYT9my4KETHybHPQ3ksXhiEgYQLSdP8TsBmwzNd+r-qxA@mail.gmail.com>
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

On Fri, Apr 19, 2024 at 10:22:19AM +0200, Linus Walleij wrote:
> On Thu, Apr 18, 2024 at 1:36 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> 
> > I have LVDS working on apq8064, but it requires fixes in the MMCC
> > driver, in the MDP4 driver and in DTS. I need to clean up them first
> > before even attempting to send them out. Also a PWM/LPG driver would
> > help as otherwise the power supply is quick to be overloaded by the
> > backlight.
> 
> Thanks then I bet the prototype 8060 MMCC driver needs similar fixes
> before it will work as well, so we should work to merge this, then look at
> 8060 support after that.

Once I have time to cleanup them, I'll post 8064-related fixes.

-- 
With best wishes
Dmitry
