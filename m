Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229DCC0B601
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 23:34:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1680110E112;
	Sun, 26 Oct 2025 22:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KuQiCFa2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADDD10E0EF;
 Sun, 26 Oct 2025 22:34:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3935460377;
 Sun, 26 Oct 2025 22:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91A3C4CEE7;
 Sun, 26 Oct 2025 22:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761518051;
 bh=LBZTOeQzkwEAtB+OTRZAwa0RyutEcg+dNryHY4Ipwrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KuQiCFa2Uh2PcSTOLJ1L5PL7m+mmvkGcjhcRwlEoojfKCnshek1AmFwxaVoHqv6tC
 ru4L8as1G665sHXfJGfaKIwfEPC0RiUjENx6zLqcNisrKngEy38XkLA0TzgyE7GkQR
 W1qr3Z/vdHJlYgulKiAIztztW2Rp/Tig/sEbfqof03g+Qy7H8UmOjOdOWRiM8J7mtA
 noe1PzrjhwSCi32T+qPgtr/3+Q8E1yG+pppjv8clBq0lQRILKZ2i47M305MBEnjiXQ
 r6j72mgW+Ev5hZwNmcY7WaXh6705A0UMhD+Ake4Cq/XFAip5aiVVnE7lVl/vUerK9p
 8VHzzg9DWXm4A==
Date: Sun, 26 Oct 2025 17:34:09 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: conor+dt@kernel.org, simona@ffwll.ch, airlied@gmail.com,
 quic_khsieh@quicinc.com, lumag@kernel.org,
 marijn.suijten@somainline.org, aiqun.yu@oss.qualcomm.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, quic_mkrishn@quicinc.com,
 neil.armstrong@linaro.org, jonathan@marek.ca,
 robin.clark@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 abhinav.kumar@linux.dev, freedreno@lists.freedesktop.org,
 yongxing.mou@oss.qualcomm.com, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 mripard@kernel.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 09/12] dt-bindings: display/msm: qcom,kaanapali-dpu: Add
 Kaanapali
Message-ID: <176151804747.3053476.10366376472665121341.robh@kernel.org>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-4-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-4-yuanjie.yang@oss.qualcomm.com>
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


On Thu, 23 Oct 2025 16:06:06 +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
> DPU and SM8750 have significant differences, including additions
> and removals of registers, as well as changes in register addresses.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

