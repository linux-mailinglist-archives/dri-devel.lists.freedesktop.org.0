Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AD11D41BF
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 01:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FEE6E0D6;
	Thu, 14 May 2020 23:38:03 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB5F6E0C4
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 23:38:02 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id 145so69419pfw.13
 for <dri-devel@freedesktop.org>; Thu, 14 May 2020 16:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QK2T0t/Jj0JFQe8jONLMLZrHIHWtDY8wi6hh+6HVsZc=;
 b=mYnOUX8GzYHSabSOa5Twez7NHxPD2GmAYqgM4bH8a0VNgWLtlOkVTW5tuAvMEvimR7
 Etu0z5LT+oPBLhSpHfTCojRjVsrV0q4wrwVu37uzHLuWl78dm4a7u8QwE6iJ/SwN/uBR
 hs/g4khJraR7/bYg5/+yRId7SUocqo1MZCIUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QK2T0t/Jj0JFQe8jONLMLZrHIHWtDY8wi6hh+6HVsZc=;
 b=NEt3ms2yEIcPygS3KY2tWMtvy8Aj0kK5e2EyQpGF6ERbjWyG5jtRIheMQNNC4vuZBT
 GBLMvUL9nXKlIU9C6k6+au3ZAOC1VQQNH31kKUIEMePLaNoMSINpcdmjZbQki8o2Ytk1
 S9tH1US+rx8A/zUGf4SmLST4NuQDeyqYs+G8/3a6HqHkjSQPWnuFjUWGhKw58NT087Y5
 w3BtZ+s6l6ufYG48VE6B703R3JMYhuzteic2KhD3ai/GwSmbkYNDHrdcjlWsDnG5qjhl
 tZj9kUlnnxI4iubGwLAjWZFnf3mRaKXuzUq/sA60s+Kp489ihpX+4FOfLowaXvTvbEwS
 h2iA==
X-Gm-Message-State: AOAM532QMAMTzZM4F62LkrHAjyD45zbsMPwx0Br46EJyqWHTOzKvStrj
 2WgeG5QNHGv1R8h9EcqxQ4dIHg==
X-Google-Smtp-Source: ABdhPJzr+P5MYAMvALz8QCCQYXEbupCUs1nuQKmzDf3JHLzo0/rZUuIfcPI9IrPK0NfSNUeQxUHy5g==
X-Received: by 2002:a63:4c5b:: with SMTP id m27mr502104pgl.198.1589499481632; 
 Thu, 14 May 2020 16:38:01 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id 14sm276163pfy.38.2020.05.14.16.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2020 16:38:00 -0700 (PDT)
Date: Thu, 14 May 2020 16:37:59 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: sc7180: Add interconnect bindings
 for GPU
Message-ID: <20200514233759.GR4525@google.com>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
 <1589453659-27581-2-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589453659-27581-2-git-send-email-smasetty@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@freedesktop.org,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sharat,

On Thu, May 14, 2020 at 04:24:14PM +0530, Sharat Masetty wrote:

> Subject: arm64: dts: qcom: sc7180: Add interconnect bindings for GPU
>
> This patch adds the interconnect bindings to the GPU node. This enables
> the GPU->DDR path bandwidth voting.

This patch doesn't add any bindings, it adds the interconnects/interconnect
configuration for the GPU

The order of the patches in this series is a bit odd. Typically you would
start with the binding changes ("dt-bindings: drm/msm/gpu: Document gpu
opp table" in this case), then the code needed to support these changes,
and finally the DT bits for the specific devices/platforms making use
of the new 'feature'.

It doesn't really matter once the series has landed since the end result
is exactly the same, however it's the logical order in which most
reviewers read your patches, and typically also the order in which the
patches land (especially when multiple trees are involved).
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
