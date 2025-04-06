Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96328A7CDEA
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 14:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4131210E031;
	Sun,  6 Apr 2025 12:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DRAl3ayh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8E010E023;
 Sun,  6 Apr 2025 12:36:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 35CA4A42663;
 Sun,  6 Apr 2025 12:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C376C4CEE3;
 Sun,  6 Apr 2025 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743943007;
 bh=vUTWrvW/2OBcC1F1Bh/tjKBTEE36gpFTGnRvicQXbgs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DRAl3ayh4tXfcLdvmhZXIJQj//2nek+hU2tHzKMNrG34+O0I8AkwuzaLF280wa0x/
 4jCke0wtQuuQKaQh4JHRHJbGXYt8NBFQ4pILo28syj+xS9OvrStH9FBb2W5iinXCXD
 Qpkd4WlHZ4nLOuEI/EtbpmkjzFfE6EAuB/qigShMRbdXJmmNKS/fyTRnoRVoqy9bU4
 x60dMKqzgDFPccFPJ57EXBnI3OYtq+dk6G0EL3XsSJZV9JGDOyfHcLY5a0kbNF6WFN
 /5Tj/5uQV8sCaIwBTKTkxHir00qHuumcLZ1DhGzHHuuu4kvG/4AAIyZxg7UATWt3+4
 nuRR4o4xZVVgw==
Date: Sun, 6 Apr 2025 14:36:45 +0200
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
Subject: Re: [PATCH v3 02/10] dt-bindings: msm: dsi-controller-main: document
 the SA8775P DSI CTRL
Message-ID: <20250406-gifted-vulture-of-science-4fa1bc@shite>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
 <20250404115539.1151201-3-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404115539.1151201-3-quic_amakhija@quicinc.com>
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

On Fri, Apr 04, 2025 at 05:25:31PM GMT, Ayushi Makhija wrote:
> Document the DSI CTRL on the SA8775P Platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

