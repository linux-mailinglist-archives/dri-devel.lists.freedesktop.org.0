Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BCA890BF6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 21:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873B610FDE6;
	Thu, 28 Mar 2024 20:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VvlsDCvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03445112555;
 Thu, 28 Mar 2024 20:51:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1DAE0CE2CF8;
 Thu, 28 Mar 2024 20:51:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2A8C433C7;
 Thu, 28 Mar 2024 20:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711659065;
 bh=iOyWwbSJk+L+ozP+CdGJ5tWsDyrn3ZFA+c6SRWUyhZo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VvlsDCvp5nvBMzJIew5rLj4PkeBWXO81h3W+/fgJBa1a5k7xSTMCLMJ3p1bBJh9YT
 UrB72nDFPCpzBAjsVo/tf7vgoVWlrW4DSV7tY6vt4r+hIWJIV1Xz8APeKXRUeSunzS
 oQZ4yJ/4ft5PCnU8aRuPKeQobdVfUFfHFqzHvr6q8KwjIqEnREVaafCs5o/Vd0/1RK
 XOCbRB4Ma0zXwEmsWZ/A3ACYIi+Vey1SIj6cABbPaVy8trgJakk2wh5HlFYJn0tTi2
 DhikL8dzknvtYreOW59zlvYToENi7KXeQSFQFBvhnzJSLNfv+OoZjwA34gf8qI++xH
 EL20FRmVuMOnw==
Date: Thu, 28 Mar 2024 15:51:03 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>, ~postmarketos/upstreaming@lists.sr.ht,
 Rob Clark <robdclark@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: dp-controller: document
 SM8250 compatible
Message-ID: <171165906079.323814.7495184633421494076.robh@kernel.org>
References: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
 <20240328-sm6350-dp-v1-1-215ca2b81c35@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240328-sm6350-dp-v1-1-215ca2b81c35@fairphone.com>
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


On Thu, 28 Mar 2024 10:42:44 +0100, Luca Weiss wrote:
> Add the compatible string for the DisplayPort controller on SM6350 which
> is compatible with the one on SM8350.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

