Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0013B260B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 06:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2638A6E9D9;
	Thu, 24 Jun 2021 04:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504DC6E9D9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 04:08:00 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id u190so3623308pgd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 21:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NTKcj1FwASbYIRc1/4RcXOYrrjpE/CHcjYdGKeIf8y0=;
 b=bkARmClXxH+0Yp4W2H7QZckNr5cVnBMFrbJzhhVlZG5Noxtgliy26pRjw39wh/fzKI
 OdF4XXnb/lgKyaNdFP39LECTpsALyNTtV9Ej1xshfgQ+hOStmbb0ouCfgbXvmp1HZvMs
 ae5oskgxJkqX0pHkq5DVfRx4WGmuUzUSVmC/Q5FKluFcWYCg3N1miPMavU6wxJXoxN9d
 0XCSCClYMlBLNx4Pe2JC5u17jWVHquwGcVVQf1gXieZv95/YE2NYv4vJ/3zl4UK+0fIR
 hD0NppjegsjWM8XGTO87IFwWQKYlpXIYJFTKyaRrDNVpQJZ3Kh4NnSj+ZZMFwuCKua5X
 mpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NTKcj1FwASbYIRc1/4RcXOYrrjpE/CHcjYdGKeIf8y0=;
 b=MM8/DPDS+4+Zanvmlz4FhPh5faQaJgU4k1NDHIpD4UzDYpPqFa3fjbehhUENk4cX7Q
 5eThVYFTKxfTnkiL+m1E7NJ1Gy0wQZ0E+rGNOxH8xCr2I9gBcyPZf1NhuKxxY9lQlIdt
 +XS5yn2gc6W9i5lgXRh749oP5auuamqMSMh6/9oj8TxAXIbxz0avsizOmiK+kxUfwtYB
 07p/TU8sX0VZgI14AAmE8iKGXrOI4ItHzXq8MLfg8GV22r0oo+hVSdwHqqZY2n9jfWd1
 shamKIu30gv8Kumc8VdobUUHZD79HpwpVUZgCj9KlCtU9TPou5dOwRFhLPEPDxzmAsQj
 lquw==
X-Gm-Message-State: AOAM533ndB9j7VeOeAlN2AfcnaXeLnUGb+7xp6EH2pZcLdQz7pCg822K
 0O3BiIKCRl/syMpXh0FBRrrOeg==
X-Google-Smtp-Source: ABdhPJzjp/1AjHOU55H1hkl4o3axEnthy6y3MWTgaD7g0SNM61aPxVBFMcFv39k+xyxHoK2yHEFXwQ==
X-Received: by 2002:a62:3344:0:b029:24c:735c:4546 with SMTP id
 z65-20020a6233440000b029024c735c4546mr3110132pfz.1.1624507679891; 
 Wed, 23 Jun 2021 21:07:59 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id m18sm1251125pff.88.2021.06.23.21.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 21:07:59 -0700 (PDT)
Date: Thu, 24 Jun 2021 09:37:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: Clean-up OPP binding node names in
 examples
Message-ID: <20210624040757.svquigqw2tjeb7ij@vireshk-i7>
References: <20210623230722.3545986-1-robh@kernel.org>
 <20210623230722.3545986-2-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210623230722.3545986-2-robh@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 Georgi Djakov <djakov@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23-06-21, 17:07, Rob Herring wrote:
> In preparation to convert OPP bindings to DT schema, clean-up a few OPP
> binding node names in the binding examples.
> 
> Cc: Georgi Djakov <djakov@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Leonard Crestez <leonard.crestez@nxp.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml   | 2 +-
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml   | 2 +-
>  .../devicetree/bindings/interconnect/fsl,imx8m-noc.yaml       | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
