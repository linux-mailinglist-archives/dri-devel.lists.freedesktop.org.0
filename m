Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E06CCC67EE
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 09:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097B910EBE1;
	Wed, 17 Dec 2025 08:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GI921RMV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B637210EBE0;
 Wed, 17 Dec 2025 08:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D7BA41A37;
 Wed, 17 Dec 2025 08:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791B0C4CEF5;
 Wed, 17 Dec 2025 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765959186;
 bh=OMyUtJmYXFZQY4uUTT6FKmP7KYbyBgFkDOaoGuFOv2k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GI921RMVYDQ2hFRIBwahO7FIge2v3l/1y6U+KnlgaXo0ULu4PfaDTtio+C4wGXSSS
 ExPF9QWjoAWgeC7LZZLuhX2VJt6M1K2YQ+v3HxzyH5d9stDo2/vbkAD7u6FXgKJVb0
 rbUkXf4pvwqiu9rq/BlIiaIDSl8aSViA0pPxiIDtU8W+Ok04FodaoqdzPFD2j73C7+
 oTgOlYvpTu7m0seECHf1LmqWJjCn74HKmbAyTuQ+6s8T+1Ui/wBB6ylTuk25kTKpM3
 I6IIqTRZlteP9Y9YR+wpiHQHSjVmO4FgMIAsAKyTHCnlbDW82H3RQqOJzuG5Jz6/uT
 B1HTev21/d/zA==
Date: Wed, 17 Dec 2025 09:13:03 +0100
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
Subject: Re: [PATCH v3 03/11] dt-bindings: display/msm: dsi-controller-main:
 Add Kaanapali
Message-ID: <20251217-rough-devious-moth-fe941e@quoll>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-4-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215083854.577-4-yuanjie.yang@oss.qualcomm.com>
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

On Mon, Dec 15, 2025 at 04:38:46PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> The DSI registers on the Kaanapali platform differ from those on SM8750.
> So add DSI for Kaanapali to compatible these changes.
> 
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

