Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8349FD220
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 09:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B659410E245;
	Fri, 27 Dec 2024 08:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X1SelRVB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CBB10E210;
 Fri, 27 Dec 2024 08:41:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 95ECFA4129A;
 Fri, 27 Dec 2024 08:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30081C4CED0;
 Fri, 27 Dec 2024 08:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735288888;
 bh=+DfnXbfYpsZSpFyfyfS60TU6RcqCaLnx601olT7c+SU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1SelRVBIZlFgmLZ/O85kx4mfu2FZD6xyxjM3AmoASJ3PI826XpRXwkmOtdt+TptL
 Tf1h4MPLkUD12iOB27g1J+LTYkhkwr5U2+Y7GzZc/q1DZT864dXWI0vosOe6/Qlrqy
 o+qwQflZn0RY8D6mOX/BzKEhTM+HnqTmFGItNjaxAAVoqf2hiZKye+GWZ8UhkjrRk2
 4ASW++ig6Mwza9g99RWixYPbYjvzInHdz9JSJPKjeq3mo6b0WvaRE63BFYJ8En/LVq
 N1/FjFSY1lk9U1Do9ksdkZZTFKtPuOc3P4+8eNV5HP0cW/XSfMkhNU5lEOK7teIyTJ
 B/Dt7JFOkjqzQ==
Date: Fri, 27 Dec 2024 09:41:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display/msm: Document the DPU for
 QCS8300
Message-ID: <66x4orucj6kenpwetugmng3kmuzjoagjkmctrn727j5hayjhhe@dvzdd6a2ehzn>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
 <20241226-mdssdt_qcs8300-v2-1-acba0db533ce@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241226-mdssdt_qcs8300-v2-1-acba0db533ce@quicinc.com>
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

On Thu, Dec 26, 2024 at 05:40:45PM +0800, Yongxing Mou wrote:
> Document the DPU for Qualcomm QCS8300 platform.It use the same DPU

Missing space after full stop.

> hardware with SA8775P and reuse it's driver.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

