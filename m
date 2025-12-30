Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208DBCEA695
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 19:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94810E280;
	Tue, 30 Dec 2025 18:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZzcKXYS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194B910E26D;
 Tue, 30 Dec 2025 18:07:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4519B60018;
 Tue, 30 Dec 2025 18:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C30C4CEFB;
 Tue, 30 Dec 2025 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767118046;
 bh=NCDy490TpQXg1SrXADbkgQVLfIf/ieUySJmjn0ZF6lI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZzcKXYS10iC4Ff5p/up8rjk5DFhb9i3cwtFSMaa5w/be6KP3a6+KOBxEWBjjEzH1G
 TkivbkkzgXGtTOTdGrwuS7aKOQu3dD4WRdHBtS/x8+zrwybFiPKSTS/O7yu15aabmD
 lY7dZUZ05RaZnCX0qDX26k+JysVlZwZTQn5H7eK1/PIDIOlC1fPAYURYyM4CAicZFU
 6KJexlrruk4F/X/PtW7JZU+zEkiRb4J6dwyM8iPi1qgfj/KmUiMxf1n9t2qCdGKjZv
 ueSpddCI8ySqvyHfEx+UO54eg85HSbTWYQRypyetjYNLJ4nly6Jn47EMqx44kAsFcQ
 ICBfBSbVmsvGA==
Date: Tue, 30 Dec 2025 12:07:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, freedreno@lists.freedesktop.org,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH RFT 1/3] dt-bindings: display/msm/gpu: Straighten out
 reg-names on A619L/610/702
Message-ID: <176711804473.885549.6357046736592597919.robh@kernel.org>
References: <20251229-topic-6115_2290_gpu_dbgc-v1-0-4a24d196389c@oss.qualcomm.com>
 <20251229-topic-6115_2290_gpu_dbgc-v1-1-4a24d196389c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229-topic-6115_2290_gpu_dbgc-v1-1-4a24d196389c@oss.qualcomm.com>
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


On Mon, 29 Dec 2025 21:47:39 +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These GPUs have physically have the same regions as the base case
> ("main" + "cx_mem" + "cx_dbgc"). Remove the specific override.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

