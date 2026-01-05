Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4BCF23D7
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 08:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127E910E37C;
	Mon,  5 Jan 2026 07:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DfmW3yBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D495C10E37A;
 Mon,  5 Jan 2026 07:40:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A960B6000A;
 Mon,  5 Jan 2026 07:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED5CC116D0;
 Mon,  5 Jan 2026 07:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767598805;
 bh=PpycFFVo6d67uW2ow6i4VxbFkB3D1IT1U43lxSm7wyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DfmW3yBdeIvQmgnN9TGVTTvCcg6+b7eQPcT9mmTXwQwhcKULc796jY5y+eIP8bWOt
 6C9mojhFOdZAwLjTHhogh1yN1so+rHLXmiHkzUdHTdcY3C15EvvtfekHuVpJtjNXe1
 zhl6tFaF5zV9Xi0otmT67DWcXX+tJSjZB1Z9W/xA9xyvW+ufyg+JJxh0RHw/Xedmfu
 yaVFroXhPQ//dt2vaHxaoDZESfv5PZqgtVaaEzg7pVvMeMQKWaTFqetLv99lhEVqzp
 AaiRASeY6QQxNEEhFVTTA0g7+Pn5Uj/ESaqWJEVnGXt2quDm19rGdOtArk+LmPXMPm
 ADBHHiu28L8cg==
Date: Mon, 5 Jan 2026 08:40:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v5 2/5] dt-bindings: msm: dsi-controller-main: document
 the QCS8300 DSI CTRL
Message-ID: <20260105-enchanted-overjoyed-caracal-1c8ff4@quoll>
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-3-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260104134442.732876-3-quic_amakhija@quicinc.com>
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

On Sun, Jan 04, 2026 at 07:14:39PM +0530, Ayushi Makhija wrote:
> QCS8300 MDSS DSI controller reuses the same IP as SA8775P, with
> identical register layout and programming model. Introduce a
> QCS8300-specific compatible with a fallback to
> `qcom,sa8775p-dsi-ctrl` to reflect this hardware reuse.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

