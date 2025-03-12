Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103F3A5DBD9
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 12:45:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5A910E10D;
	Wed, 12 Mar 2025 11:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sVH6zzSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E541010E0AD;
 Wed, 12 Mar 2025 11:45:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1C66EA4537A;
 Wed, 12 Mar 2025 11:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80962C4CEE3;
 Wed, 12 Mar 2025 11:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741779902;
 bh=HZn6RlsOswkW3adjrj5XUZr0KS0DHc4suL0U/KWEGIM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sVH6zzSBQV0fLi3kMCD38aHo2hizX92nAlToTw5pulOgOLzOhmz6r3r+aRlRjomDR
 kDg0euFdnsr3JXZk6KE6i5cjFxMiOKmngf7YWmpJf2bHFSdsPrySFo2PvMkiTgIi6U
 dXBZOQK14P8JDWwrYFN1m7WMMBhxq/HCaa0BswvzFZ25JS8kFcTekLvOVdKokumRjj
 OrqzZSNti+0SbDgVe+CxEFUW9SLFPOjVAzIDKCgX4vtHUpOyMlG8seqc3SSp64BNvv
 OGVDmK3kI8qVNIl0bKalnEv/LwT86+4wk7WkGVo7eKnaBQwMXQDwoioYQitRlkH1rU
 g98jGwo+tH2lA==
Date: Wed, 12 Mar 2025 12:44:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, dmitry.baryshkov@linaro.org, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 quic_abhinavk@quicinc.com, quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v2 02/10] dt-bindings: msm: dsi-controller-main: document
 the SA8775P DSI CTRL
Message-ID: <20250312-fine-vermilion-grebe-bdd5c9@krzk-bin>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
 <20250311122445.3597100-3-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250311122445.3597100-3-quic_amakhija@quicinc.com>
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

On Tue, Mar 11, 2025 at 05:54:37PM +0530, Ayushi Makhija wrote:
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index ffbd1dc9470e..3621e3f12b65 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -23,6 +23,7 @@ properties:
>                - qcom,msm8996-dsi-ctrl
>                - qcom,msm8998-dsi-ctrl
>                - qcom,qcm2290-dsi-ctrl
> +              - qcom,sa8775p-dsi-ctrl

That's incomplete, where is the rest of updates in the file? Not
needed?

Best regards,
Krzysztof

