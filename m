Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1288797A543
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 17:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCC210E3AB;
	Mon, 16 Sep 2024 15:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iCSYIdJ2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F3010E089;
 Mon, 16 Sep 2024 15:23:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 619BB5C5501;
 Mon, 16 Sep 2024 15:23:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9645C4CEC4;
 Mon, 16 Sep 2024 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726500238;
 bh=qD4ujfWspewbmLI96zIOIwR+FCHU3GJLIZW/IsoDLFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iCSYIdJ2R+jEL8qu1nVKJBsW7jCgmQs5cI9Y5u8/Rdvzt9tlTuPysbpyuuhcIUoZe
 UNAgJYN1dLkgYF9EnKhnJfo9XR9xCdQRUtuVp0qqvOmCDa14lH1FWjLUMb6eGiDkxA
 0QAvQr2+JKAA1ZEyx2DNMWXuhMHqtHm7/7rHgxrL2zqWOMQgN01TFWE6yX2u9gqNnT
 1cirZm6IuULvnnJsw7c4OYtXiLQkyG/ncfu8uWYN2IRvP91kt9IlWcUWvqgWih4tWg
 FaoqRG1UjZfUFnd96G6GEGkVskI0iZoFOmK7vnMwpEmWu8Yj7av7oMVxf+lCoUkuYw
 5WVHbeMZCQEXg==
Date: Mon, 16 Sep 2024 17:23:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
 andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org, 
 abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_khsieh@quicinc.com, 
 konrad.dybcio@linaro.org, quic_parellan@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: Add eDP PHY compatible for
 sa8775p
Message-ID: <2hv2hcpbanduw4wg2wbza4jkze4sgilrtyc7zack23uygwsjol@ckskl2rkd5xp>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-2-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913103755.7290-2-quic_mukhopad@quicinc.com>
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

On Fri, Sep 13, 2024 at 04:07:51PM +0530, Soutrik Mukhopadhyay wrote:
> Add compatible string for the supported eDP PHY on sa8775p platform.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
>  

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

