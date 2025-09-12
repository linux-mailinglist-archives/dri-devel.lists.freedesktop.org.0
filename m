Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1807B54239
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 07:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA30010E439;
	Fri, 12 Sep 2025 05:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I2tmdPcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB9910E077;
 Fri, 12 Sep 2025 05:54:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 33A54601DE;
 Fri, 12 Sep 2025 05:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418C2C4CEF5;
 Fri, 12 Sep 2025 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757656468;
 bh=rWJWEK9OInlMBtKQyvNiNT2+XSgnu6NXba6lfxrN24Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I2tmdPcQx1TUL3+1Bk7PDte09eLzAoWJ+FrHypU8zQnJk+2uPDE89Ia4y4aX7unBl
 J60P3PbGHzs9yCMDP6L23pRNY02nPFSXJzhZxniyIJ1c1fEk+5e6YANr9qFGYTXzHu
 HSbLH39Mii6vg3bbBmvBHNZqUADjXbTNDK8sxhDdjwO67ldX8GvTi0XVo3LCBmboNN
 1KZ7oxDc9dkmz6z9alFV7zU26Yu0oFmLvejN3K4ng6+ObxQi+oBwrWVqI5hl7AT3GZ
 5Q9KzWTGuyHlyAzVRyOfUEbQZEC/RQLWqe4on4jNY/PS4mMGk6aKpzoljK9Hf6+K8d
 a52EcUKLBXU6Q==
Date: Fri, 12 Sep 2025 07:54:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Message-ID: <20250912-attractive-centipede-of-modernism-d3f13c@kuoka>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
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

On Thu, Sep 11, 2025 at 03:28:50PM +0300, Abel Vesa wrote:
> Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> There are 4 controllers and their base addresses and layouts differ,
> therefore being incompatible with all previous platforms.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

You need to address in this exact spot the test failures.

Best regards,
Krzysztof

