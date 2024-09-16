Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7104097A52F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 17:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A9E10E3A9;
	Mon, 16 Sep 2024 15:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="B5ITreaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD0710E089;
 Mon, 16 Sep 2024 15:21:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7EF615C5C68;
 Mon, 16 Sep 2024 15:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4741C4CEC4;
 Mon, 16 Sep 2024 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726500075;
 bh=15KPeQUmUDmhfRZADjOpKO9OZuRW742vA+qq24d9DQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B5ITreaqD66aCZn0ZnFRJQUnkcv9GGjMkBePgY00QODxUerihkKlQ/zgReoKJwE2Q
 Cap3vUp5CkErTeHLvGn0fZa13YQzZxOCbR+88hd5sTElej40AgSEz+toE+/ngvMUZm
 EGEtYX8jlXedfWk40Ep2CJOYrGNjS+8XUqV2K1kWZrw2P2vndv/Lw9zb9VL3pQPHkj
 YoGmZkYSS0I/H58sA1yM0QCgNHLkjE8SSN+w1RelY8FwpUsdq2uBiKyEOb1rirrEHc
 Z5C2xlsId/ivtorQ6nAOg7xPJ7QU550v4Z35ZhWnUq/g3VyAo/65+vr4nsezSW3mtV
 0C29kzbyIC/YQ==
Date: Mon, 16 Sep 2024 17:21:12 +0200
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
Message-ID: <qy4hizhsrz6nnfq4a5eremcc7b2gtw6czpav2j34nyj4i6fenv@p6vzlxanhmd5>
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
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

