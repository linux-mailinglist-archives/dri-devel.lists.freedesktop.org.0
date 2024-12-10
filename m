Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB19EABDE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 10:24:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4733110E843;
	Tue, 10 Dec 2024 09:24:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mFgK7Zn3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3715E10E842;
 Tue, 10 Dec 2024 09:24:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 056D9A40D48;
 Tue, 10 Dec 2024 09:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936A1C4CEDD;
 Tue, 10 Dec 2024 09:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733822662;
 bh=O5XOuyjwnuqX3HgfIz2VRWoSd1CmC83IYUVQVp42D6g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mFgK7Zn3NmyYLjlZrqNvvTczPGCBGHSPRj13Um9o/qLOzDH1+Mn//zs9OpM8x1Noj
 7UGT9S0bhazTLt0uZd3TY4RLVoEqyTWnVcU0643XrHuqErrLV6s/FOdUOHayhWDULi
 wXsxgc5o8pun+UBZXYGR2R5Y0/Y3z3QmQ7ZBcGPmzDRoaMrpc/lW2x+hdCzlVZeblc
 hMwv6JR1wognVLcYpjxa620f6xB9zncPgUuLlA0+U0lRg7FRnIPRJYLkxV0/AMlNiw
 crOlIRDK6HgY8JvDZ973+6/lQJ8fg+0bDPAhwcX8vLAuqrWuaVxxH36oiwMcUS2kMS
 lxZ1JHMhQFiYQ==
Date: Tue, 10 Dec 2024 10:24:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: display: msm: dp: update maintainer entry
Message-ID: <gs6zhcauz7kjocgbkj5p6tr6gws4z65pxwrldmb35nikwkrdhv@6xybugfrnhjj>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-4-9a9a43b0624a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202-dp_mst_bindings-v1-4-9a9a43b0624a@quicinc.com>
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

On Mon, Dec 02, 2024 at 07:31:42PM -0800, Abhinav Kumar wrote:
> Add myself as maintainer for dp controller yaml as to support
> review of the incoming changes.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

