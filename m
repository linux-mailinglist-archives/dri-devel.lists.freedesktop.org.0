Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DE0CC67E5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 09:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94F9C10E063;
	Wed, 17 Dec 2025 08:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j2WqR7jD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AEA10E063;
 Wed, 17 Dec 2025 08:12:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8BE006018C;
 Wed, 17 Dec 2025 08:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E20C4CEF5;
 Wed, 17 Dec 2025 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765959135;
 bh=FyNpsusmUyeNieXFwe3YptetXP2BtdFkldukT23gM4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j2WqR7jDwala4SMNzmPeGnNwlxVOlbf3MIIYMakQGJibjyI+siQvirtR7EMUANV73
 /eUUBmuYXolLTzfz86XXYOODOtQOpmHdUzUE5SdVasPgbs+iKYyMVdcitEUCqrcXAT
 eOc18Is2qSQlmB/VsVFzOi3IblRddAZUS95DmKLggL7yJbR/spuq92O9jMej8+8l+r
 dzOalcvma/TPhKmv6w7Ig21uYPS++Pw2hdAEGzznz9aIH/v6xj+QShV7wnRtAsUXdl
 rA2O89vDGUGu9UcUOZ8ekhSJJCxJlwllspbnWXbtVsgPow0LhprbBCJsC9fPywa/Yq
 /Psv2LOvAqgOg==
Date: Wed, 17 Dec 2025 09:12:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
 abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 02/11] dt-bindings: display/msm: dsi-phy-7nm: Add
 Kaanapali DSI PHY
Message-ID: <20251217-astonishing-turquoise-grouse-cbaa6f@quoll>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-3-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215083854.577-3-yuanjie.yang@oss.qualcomm.com>
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

On Mon, Dec 15, 2025 at 04:38:45PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The DSI PHY registers on the Kaanapali platform differ from those
> on SM8750. So add DSI PHY for Kaanapali to compatible these changes.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

