Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E21B55D1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600506E258;
	Thu, 23 Apr 2020 07:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244716E3C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 10:26:58 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id v2so751123plp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 03:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=6gdINTWw5qbNqv+goCkAx9WxOclB6kfMGhupWamyF/Q=;
 b=XNRaT88T1nqiUZ51J9UejP6i7hnQv7eU7Uue7ieUv0Az3LPOAyUC97V8zUzOY7UV3P
 7vS9knLlETaJKXjxoJO5Nd29sCjQR0b5lVKY+ZUpsO/rQYe7B0eMZZ9OhMsOoHv7AAnO
 lj7bnr88UGowfAV2pYpeiEXswsaPg8GYpgJOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=6gdINTWw5qbNqv+goCkAx9WxOclB6kfMGhupWamyF/Q=;
 b=bss+oWZI0vUpxmrYnAD3tjyHu27VxqrdnSOvUTU9bRkupa9nYuv2Ra8IAPsr934QCr
 9fPgowHf1/aZJ7X5YDrMowSA+i/PXKRHTPazdI9FfclcVOoD42xLd7LIK7AepBlvomMN
 Cb3LNWfPjyr5Iqb68KblGGcAVTvAGcQbGtw5A9imBL03yquHrSX8EESHyAxhRYwHNmzh
 iArM9vJC0WCMHVummC3QbS45Pdn3eQ6vMYjF1tUHGFCOFwNRYLTq8tc+eeCGq4sB/XnQ
 HlrMw/p0IrjddHl5AUIXumIoSJbWT6cdLl6uxL7ZAo3vxFqbc3iSbv5uL/CYjz1WbYFP
 urIQ==
X-Gm-Message-State: AGi0PuZZYIlnk3ElkUELbK0FUvyWteGf4gyjSXZm6QQs3USpXwvndsIc
 asjuD5r/K1z9Dw9QmKGdzqpsQw==
X-Google-Smtp-Source: APiQypIskeEJItuLaEBjMhbnRTsFEb0DYilPaPMtUzz55q/ztGTMyUgTbonADiaJsrnVUd76J6a9Uw==
X-Received: by 2002:a17:90a:cb09:: with SMTP id
 z9mr11612172pjt.120.1587551217755; 
 Wed, 22 Apr 2020 03:26:57 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id p2sm3994378pgh.25.2020.04.22.03.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 03:26:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200420220458.v2.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
References: <20200421050622.8113-1-dianders@chromium.org>
 <20200420220458.v2.6.I89df9b6094549b8149aa8b8347f7401c678055b0@changeid>
Subject: Re: [PATCH v2 6/6] arm64: dts: sdm845: Add "no-hpd" to sn65dsi86 on
 cheza
From: Stephen Boyd <swboyd@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, Laurent.pinchart@ideasonboard.com,
 a.hajda@samsung.com, airlied@linux.ie, bgolaszewski@baylibre.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, narmstrong@baylibre.com,
 robh+dt@kernel.org, spanda@codeaurora.org
Date: Wed, 22 Apr 2020 03:26:56 -0700
Message-ID: <158755121629.159702.14849607096816306080@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jeffrey.l.hugo@gmail.com, linux-arm-msm@vger.kernel.org, jonas@kwiboo.se,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-gpio@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2020-04-20 22:06:22)
> We don't have the HPD line hooked up to the bridge chip.  Add it as
> suggested in the patch ("dt-bindings: drm/bridge: ti-sn65dsi86:
> Document no-hpd").
> 
> NOTE: this patch isn't expected to have any effect but just keeps us
> cleaner for the future.  Currently the driver in Linux just assumes
> that nobody has HPD hooked up.  This change allows us to later
> implement HPD support in the driver without messing up sdm845-cheza.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
