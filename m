Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D093E3A1D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 14:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CD2891EC;
	Sun,  8 Aug 2021 12:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B54D891EC
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 12:04:19 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id bh7so4628666plb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Aug 2021 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DzOUOaS540Cron5XlLhz1i69/y58EIYipvvUh9fco7I=;
 b=ydBKzvhbo8Zunvu0ScJ1TBFgq+3iiG8fbjKF+gXXK3BfDi13tfU3H+XdwYGxKuavBW
 z9Qzx+JCsLeVLWoK2AZ7pOkopIn+Bqlke4bcd2/z07t52RkRF4fDliiTdFH8gth4Zyco
 EMXXzqP6R09M9QIeiXEtT0kci+WJE4XOOCVMfhs9OKpAUqYO/wq2LUyyqJNwytGfYUtq
 lDfdXkciTk2m2f7mE0AsAysFr/mY8/W9wIbsmO1LCwDiks3yJb4VnRXNGrDvOkqaKHhc
 kjzQ5wGo/IVk8vwoBKiRLDa4H/NQF8s7Mfo4y1V2sAYy7xfQYinMfswpFXRCwm/M2G6J
 RHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DzOUOaS540Cron5XlLhz1i69/y58EIYipvvUh9fco7I=;
 b=E1RPadGbJxqB+zUkrQIgeb5y4LOt0XQtY+Z56kMy+X775gSso5mfgfcjgN6ZkMdjCA
 AnYt79aDAQSyr2x7ffMnRX/U062vQsssuwXTUu61EzD3i83SAoR/frC49nWJ36orx9Tt
 WwyMsG5CLTqWIrdYJjd1lflbR8D+P4lvgAxZDXfBtCes8fzfUrFk3gqmNtFmFM7v3Sk1
 UwuAhFByuQYlLOPkaGAwbz5FwGzlst/wLjPjLYmrkd1cmhcBQfw+hjLzfVmRCpsv9utN
 ER7rOzbrBJR1bNND/T4Dq1uvMiRRq2YnvcR1gHTizX44+XyzEdb0UbMpduYHgJqDSbXR
 oe9A==
X-Gm-Message-State: AOAM5303a+98f833XwJ1t0kgceZ/yzjUpBErxX/mTC3dCj1UX0SVkJCz
 DCTMeskwFbxhFhlQEqkchKvAHr/15uEPUMiQ
X-Google-Smtp-Source: ABdhPJwc2ghN3JZOLInzhYcoPLdSwuBpmKo4THl4e7PriYyB3yqvcNXd+CJwhsSPA6v8s/TJrM7Vzw==
X-Received: by 2002:a17:90a:4812:: with SMTP id
 a18mr30565965pjh.40.1628424259593; 
 Sun, 08 Aug 2021 05:04:19 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id u190sm17253360pfb.95.2021.08.08.05.04.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 08 Aug 2021 05:04:19 -0700 (PDT)
Date: Sun, 8 Aug 2021 20:04:13 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Truly NT35521 panel
 support
Message-ID: <20210808120412.GA6795@dragon>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-2-shawn.guo@linaro.org>
 <YQq6ascrSCtErWrf@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQq6ascrSCtErWrf@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, Aug 04, 2021 at 06:03:54PM +0200, Sam Ravnborg wrote:
> Hi Shawn,
> 
> On Wed, Aug 04, 2021 at 04:13:51PM +0800, Shawn Guo wrote:
> > The Truly NT35521 is a 5.24" 1280x720 DSI panel, and the backlight is
> > managed through DSI link.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> 
> Please consider adding an optional port node, so we can use this panels
> in a setup using a graph.

Sure, will do in v2.

> A simple port: true would do the trick.
> I am aware that it may not be used today, this is a preparation for
> potential future use.
> 
> With this fixed,
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Thanks, Sam!

Shawn
