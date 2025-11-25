Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD584C843E1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 10:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115F510E39B;
	Tue, 25 Nov 2025 09:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XoPGKc+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6624710E39A;
 Tue, 25 Nov 2025 09:33:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A387C60156;
 Tue, 25 Nov 2025 09:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D9DC4CEF1;
 Tue, 25 Nov 2025 09:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764063203;
 bh=pGhsmOcrkvPA6u1+azfwJ62zcu/PYOCnqEKaM8TXPUE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XoPGKc+wd8yWEVmVLfjC5Co7rsKEGsX7bbr4PgEML8eZewwVdj2ceHiuH7WIHvzp6
 NE71tg+HT/t2ICyBIZFSlq0/WEmko1/PBIGfNM4FAiybwC6wTAGPsZ+VJryL5UX6OC
 0tGJWGYvzRp703ZwD4nzOv84JmdM7UP83zZExwX7v+cNzh7eSAwM897Tb8GPk95UZa
 4MDQbx2uy2VmunxOGoqGexQ+s/pQmMY8+LdNVbmqYUVlkBEJpTHjfb5KrOWhGibASF
 G0tbEiaRTxZmLed2RY1I7i2TX9mzdgXsz3C1gyuP5s9kZzIDBF7Yyl1aWTJUr1ox1e
 G9fXtWIGMIryg==
Date: Tue, 25 Nov 2025 10:33:20 +0100
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
Subject: Re: [PATCH v3 3/5] dt-bindings: display: msm: document DSI
 controller and phy on QCS8300
Message-ID: <20251125-obedient-literate-newt-e7f6ce@kuoka>
References: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
 <20251125013302.3835909-4-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125013302.3835909-4-quic_amakhija@quicinc.com>
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

On Tue, Nov 25, 2025 at 07:03:00AM +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on QCS8300 platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../display/msm/qcom,qcs8300-mdss.yaml        | 102 +++++++++++++++++-
>  1 file changed, 101 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

