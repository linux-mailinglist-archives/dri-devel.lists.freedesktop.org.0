Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26495CDBD26
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 10:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA99110EA4F;
	Wed, 24 Dec 2025 09:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jC5YlRCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EBF10EA4F;
 Wed, 24 Dec 2025 09:39:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 07BF760127;
 Wed, 24 Dec 2025 09:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB549C16AAE;
 Wed, 24 Dec 2025 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766569169;
 bh=XTv2qlMyC0ohRJj/nW7GhRyn3CHdHat7GiQHo+rf9HE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jC5YlRCD2v0O0qCk4x2W/x5/e6JMZ9GK1ReZ4m/T3SH9GhpaYIN9EEH1zT/NPeajH
 cVkWxKDYdY+i989hhzxDDh9JIrD5zmnAWsfYfTDLvQK1249zj7M1r1z9D5DbVRp8bQ
 GUIiJtBpIdEm4gilByXRPYBTBVamAYYJ16jIqYySfF1Q3KRJBJdLDtfWx50u2JA3U3
 H82FU1r9a+N9GTsa8KrhvW9KrpdDm0rMAItjBx0AhP0w6+ahnWmH2ogc3DGmxLj7Ih
 hSUV5+eXNsZjYWEhzHvPbudxcswkL82T/ch0QGO0gdzILOJwgqotWfsCVe2uYSNeqI
 q+1FFjm/3m8gw==
Date: Wed, 24 Dec 2025 10:39:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com, 
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com, 
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v4 04/11] dt-bindings: display/msm: qcom,kaanapali-mdss:
 Add Kaanapali
Message-ID: <20251224-shaggy-brass-dinosaur-4da3d2@quoll>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
 <20251222102400.1109-5-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222102400.1109-5-yuanjie.yang@oss.qualcomm.com>
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

On Mon, Dec 22, 2025 at 06:23:53PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> Kaanapali has significant register changes, making it incompatible
> with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
>  1 file changed, 297 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

