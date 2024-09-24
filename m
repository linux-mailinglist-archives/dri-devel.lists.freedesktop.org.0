Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42047984028
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3F7710E65B;
	Tue, 24 Sep 2024 08:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rE7JzeZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C9610E656;
 Tue, 24 Sep 2024 08:18:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D7BDCA43596;
 Tue, 24 Sep 2024 08:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26B8C4CEC4;
 Tue, 24 Sep 2024 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727165901;
 bh=71k19nXTK4VVFBoakaBb1kid4ielPiHfKS52/6eP+gY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rE7JzeZIXW9kWQ/3E0EMx6AbqqDwhdczKPUleEJndoZ7M1poY7ANVSHJDkLKhEl4J
 EzCEmJWnPCpP4MFvlDpJIqFMQOAq+g9gKNAo0DZhL5BU60DpY6FHPvLMhPibyHam6C
 bSw1YvSzNX+awAYbp+q1dZW2MPMGtkI8owBLEJo7rnDOuKuJ2ohlruH87SMtGQLj7U
 2IV+fUljatlm1yrfND+ZesCfiH3hMrjkZMaNE03AVlySu3+ag+RgPJZB5qlGvRteZj
 ROoQtRQdYR7cwVOpjZUfAIChXntyuGQ0Dlp36ogkIg4xgl1vZ1ZId+jEJgK1dn5xVm
 58V8dr9YC4/JQ==
Date: Tue, 24 Sep 2024 10:18:17 +0200
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
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add eDP PHY compatible for
 sa8775p
Message-ID: <vxyvyfab3m3yp4s6lraympgukmpxo2zjmh4irxu3lwxzve7mrn@jykursrajsrd>
References: <20240923113150.24711-1-quic_mukhopad@quicinc.com>
 <20240923113150.24711-2-quic_mukhopad@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923113150.24711-2-quic_mukhopad@quicinc.com>
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

On Mon, Sep 23, 2024 at 05:01:46PM +0530, Soutrik Mukhopadhyay wrote:
> Add compatible string for the supported eDP PHY on sa8775p platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

As explained in reply to Konrad in v2, reviewed-by was given by mistake.
Please drop on next submit.

> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
> 
> v3: No change

Best regards,
Krzysztof

