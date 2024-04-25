Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BF78B2613
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 18:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7350C11A5C6;
	Thu, 25 Apr 2024 16:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fvq2lU3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46C611A5C6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 16:13:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B5DC61EA1;
 Thu, 25 Apr 2024 16:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFF1C2BD11;
 Thu, 25 Apr 2024 16:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714061639;
 bh=feTbD2uTqi+ngg+EWsqq4nTtcv2X2wbI6YTY0TM5urQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fvq2lU3QMJOQ+m997z8dJi9QqF2Q0BJX048hYDevUOtGvMTTjFfZ3HOY75CNckttF
 hDbsgGv5Sd5pFeLj7PDQpsqBRsNRZROMQEXoRbVGz9OFNJGCwo6lnzv/pU7Rjx2D4D
 DgiBCs8Q2mKW9E5I25hrmc8IKI3M9axUGIe4/eIRnGTzQ5jHk10bKgiTfDzbcYbSRw
 FtNGrYcbHe2AwnBUQwHohsxqyqlp71QhB81cqLw2VDWgRFM/R/TvFcdz5b2Tid/Egs
 b+ZqzWIS9yzkrw8hhfo7SUYIoUck09smLMhcR3FUWJNuqGlH48MYqIfRdORB2RbojJ
 yQlx4fZOuxR3A==
Date: Thu, 25 Apr 2024 11:13:56 -0500
From: Rob Herring <robh@kernel.org>
To: Xilin Wu <wuxilin123@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Junhao Xie <bigfoot@classfun.cn>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 08/10] dt-bindings: vendor-prefixes: Add AYN Technologies
Message-ID: <20240425161356.GA2729350-robh@kernel.org>
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-8-e0aa05c991fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424-ayn-odin2-initial-v1-8-e0aa05c991fd@gmail.com>
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

On Wed, Apr 24, 2024 at 11:29:13PM +0800, Xilin Wu wrote:
> Add an entry for AYN Technologies (https://www.ayntec.com/)
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index e4aeeb5fe4d1..c2365b0f4184 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -194,6 +194,8 @@ patternProperties:
>      description: Axentia Technologies AB
>    "^axis,.*":
>      description: Axis Communications AB
> +  "^ayn,.*":

It is somewhat preferred to use the domain name (ayntec).

> +    description: AYN Technologies Co., Ltd.
>    "^azoteq,.*":
>      description: Azoteq (Pty) Ltd
>    "^azw,.*":
> 
> -- 
> 2.44.0
> 
