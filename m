Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8100E38CF58
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 22:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E7A6F90C;
	Fri, 21 May 2021 20:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9216F90B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 20:47:47 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 v13-20020a4aa40d0000b02902052145a469so4871015ool.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 13:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=FZv+TdRvjRXdoAiuFDzSVh1xS2bkm0D0W6/+ClB4tlw=;
 b=aUJsB2gG5m+r2/oE3sh1SIEYobu4HVFKIAd1xUIwJkNi26hhPLJPwwj2Qq3wjSIAsA
 xTX8TEoaYN2XL7kLIyx9CYj9LltNGXBW8HbzgD42bLQzWGPBwvTq0xaahoQsoy1F6UAE
 oTbSMRLTR/hToYwszdZInC1oO6KLxOf8ojy+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=FZv+TdRvjRXdoAiuFDzSVh1xS2bkm0D0W6/+ClB4tlw=;
 b=RpTGhC/lwzndpkgbOI+SBLKdZekVy34uhK3VS75tiedaCfUunnQydzM4RQqh8GvOpo
 2bOilcV9Hg8S35TMtFo/tyeGBrtYeHzULGOTlsVhi3BZGn0e6hvpaqVykPAbgoMaDZto
 SIniTwO+oP45zlVtDPXydbZQMkdxIdFYu2CCIZ4pgoXIzQFsQJtNvoQn/TVPAGdgibpH
 89vPaXPbOjJdnOAEYsKcPRBAE9+nebK1pn1QuSrWJXLrQvXLBaGNA2BWTSK3nAxh2cGW
 GcpVP1oerhsERRvDEKtXnO1Kntr+R/bGPlYXOIeE/sSTl5yIUz1vxml+eFBjuqmdKn3k
 f//w==
X-Gm-Message-State: AOAM533w+VtH3jRX1xWxLoM4CkuuWgT7wnQqnyqSmQLTqKKaHHzJlmF/
 1U4n/eOQEjXL2lCwrvz6z7NmpjOqk/3ZX9xSICbXNg==
X-Google-Smtp-Source: ABdhPJyUmsRhbIFY6CiBuzJMtveYnQvcH/rQqHjH9C2afTGvPXZxmvEgG0Aqoi3ktvGUfo062P/DR8+bldZq9BSb9n0=
X-Received: by 2002:a4a:85ca:: with SMTP id u10mr9705115ooh.80.1621630066738; 
 Fri, 21 May 2021 13:47:46 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 13:47:46 -0700
MIME-Version: 1.0
In-Reply-To: <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 21 May 2021 13:47:46 -0700
Message-ID: <CAE-0n52w3YW=-KOas6T9Fn31wOMafoCima9Od3wZ=D24+=n-8g@mail.gmail.com>
Subject: Re: [PATCH v17 3/4] dt-bindings: msm: dsi: add yaml schemas for DSI
 PHY bindings
To: Krishna Manikandan <mkrishn@codeaurora.org>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Cc: vinod.koul@linaro.org, dianders@chromium.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, robh+dt@kernel.org,
 tanmay@codeaurora.org, kalyan_t@codeaurora.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-05-21 03:27:23)
> Add YAML schema for the device tree bindings for DSI PHY.
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
>
> Changes in v1:
>    - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
>    - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
>    - Add clock cells properly (Stephen Boyd)
>    - Remove unnecessary decription from clock names (Stephen Boyd)
>    - Add pin names for the supply entries for 10nm phy which is
>      used in sc7180 and sdm845 (Stephen Boyd)
>    - Remove unused header files from examples (Stephen Boyd)
>    - Drop labels for display nodes and correct node name (Stephen Boyd)
>
> Changes in v2:
>    - Drop maxItems for clock (Stephen Boyd)
>    - Add vdds supply pin information for sdm845 (Stephen Boyd)
>    - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
>    - Keep child nodes directly under soc node (Stephen Boyd)
>
> Changes in v3:
>    - Use a separate yaml file to describe the common properties
>      for all the dsi phy versions (Stephen Boyd)
>    - Remove soc from examples (Stephen Boyd)
>    - Add description for register property
>
> Changes in v4:
>    - Modify the title for all the phy versions (Stephen Boyd)
>    - Drop description for all the phy versions (Stephen Boyd)
>    - Modify the description for register property (Stephen Boyd)
>
> Changes in v5:
>    - Remove unused properties from common dsi phy file
>    - Add clock-cells and phy-cells to required property
>      list (Stephen Boyd)
>
> Changes in v6:
>    - Add proper compatible string in example
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
