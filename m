Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D623C98EAD2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8E610E7C5;
	Thu,  3 Oct 2024 07:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PCKqCEzI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2A410E7C5;
 Thu,  3 Oct 2024 07:53:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D449A5C5CFE;
 Thu,  3 Oct 2024 07:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A62C4CEC7;
 Thu,  3 Oct 2024 07:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727942010;
 bh=Pnx8kHxQm0FdTMFRWgE03qZ03nNrfmYdyEyjD1G0its=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PCKqCEzIslXrsHczDbIFNb6zfwf5FXgCWFf2GUGBco5/vRUfcqBo5JEmXO5uhqY9o
 Rh3JhnbfWw5tFNzGUj1gfOYD4K78wbI5hzzGCbo9g3BCcktN5adkx9jB17nWNxXD67
 ad5bRAOfpUfSenSWEr0piHxg7g991hBgcsy90zbw3oX2tLvpnaqOpuivme+0RLyWWo
 weu70wy12lb1FczfxluRN3pwVbG1f0iTHaBblc6c/LrPP25E39TDZ0y6GPBXDqC9RJ
 eT4nKO0Pi9EONx+vHK12Vn4JcW65mSQYaoHNgOfIniGyEouChKquoplLmJ25zkzHM1
 QkDn696Hw1qjw==
Date: Thu, 3 Oct 2024 09:53:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display/msm: Document MDSS on SA8775P
Message-ID: <hieznomkoezdzmmvxfrvfrma3v5lixnkjkahh25fz5fttcpetv@t4pvd343j3ww>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-1-d23284f45977@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001-patchv3_1-v3-1-d23284f45977@quicinc.com>
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

On Tue, Oct 01, 2024 at 12:11:36PM +0530, Mahadevan wrote:
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        const: qcom,sa8775p-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sa8775p-dp

Where is this binding? The schema is incomplete.

Best regards,
Krzysztof

