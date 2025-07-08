Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C46AFCA8D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 14:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1390C10E627;
	Tue,  8 Jul 2025 12:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AklCRbiJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF4710E623;
 Tue,  8 Jul 2025 12:39:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A28126148D;
 Tue,  8 Jul 2025 12:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D58FC4CEED;
 Tue,  8 Jul 2025 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751978346;
 bh=fKwQm9+PEYT4qO6DjCMzeRFdSKjvUdDiBPrtMKoE008=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AklCRbiJr+EFM2QaadOQIp8WvZQKti5qV8pj11XFIPAyeZ0P3NCNu0wH/WNspWOUF
 hC8ItfhUyTH8d1iF92AkPB8Xskv2PWqiIIugkfT1Ues9un6EY5M0LfeM/SA/KKlgVE
 dJ6orp0FY8jKCxwsUUipFLZ+G5H/C6Jq3/8iWqkEYTNjY53cNbOhWFOx6gyYHO1/p2
 OnlD6V6pKc4w6wqajh4Tq9m8DVfasbEWDZkGfgBtjAlrYYna7X6xG7oyQPMYKN/nrW
 60wwtfo0dugRVncsAmSfBlzSqUWhNbW0g2w+RpwyC4t5oD3gU3e5AX5La0Tuc6h/QE
 YpRNW8zlO0VHg==
Date: Tue, 8 Jul 2025 07:39:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: display/msm/gpu: describe alwayson clock
Message-ID: <175197834459.378548.13310049824030256384.robh@kernel.org>
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
 <20250628-rework-msm-gpu-schema-v1-2-89f818c51b6a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-2-89f818c51b6a@oss.qualcomm.com>
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


On Sat, 28 Jun 2025 06:02:36 +0300, Dmitry Baryshkov wrote:
> Adreno A506 and A510 have one extra clock, alwayson. Describe it in the
> schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

