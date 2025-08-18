Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0065FB2AB08
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 16:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351C410E45C;
	Mon, 18 Aug 2025 14:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="q8kSAfO7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E643110E45B;
 Mon, 18 Aug 2025 14:40:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 13D0D60052;
 Mon, 18 Aug 2025 14:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB7AC116C6;
 Mon, 18 Aug 2025 14:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755528042;
 bh=9CAtxwbtKGmS+5sKlkN7xk9e3EehcnWTeVpIrv0+z6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q8kSAfO7tF8oDKMTfBmkwUFL9rnEO+4zBu9etTY02QRy/73iEW882Z4Ngf5eD0Zde
 Wk6EE6X6TE+s853gOn0mLf3g2IPVTQsg8sAU/OXyV3ySWW1fsKYtpQJqYXbwxQfY3s
 +ye6CL1Q+y9PK2/n8YnelqF0iPVfam22hXKKnPD+hufns/F0DQBlpxmkVsSSPVGGfi
 Rh+KFjxTl/fP2a06p6Arj1LpdVUbPioA5knlRuvmrb6pRBrVsnZbFpPl07NY6CGEB5
 StEKndYLxm/tyOLOd9hhofJVqxDOS/9Oiz/+Dn/pXDsvxQV2X7hg9r8iAH0CxnEqIj
 XRvJxRBOVlmqQ==
Date: Mon, 18 Aug 2025 09:40:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <abhinav.kumar@linux.dev>, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <lumag@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,mdp5: drop lut clock
Message-ID: <175552804082.1191734.6799856998719669829.robh@kernel.org>
References: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-msm8976-no-lut-v1-1-f5479d110297@oss.qualcomm.com>
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


On Sat, 09 Aug 2025 11:36:54 +0300, Dmitry Baryshkov wrote:
> None of MDP5 platforms have a LUT clock on the display-controller, it
> was added by the mistake. Drop it, fixing DT warnings on MSM8976 /
> MSM8956 platforms. Technically it's an ABI break, but no other platforms
> are affected.
> 
> Fixes: 385c8ac763b3 ("dt-bindings: display/msm: convert MDP5 schema to YAML format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

