Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BE1AF6B58
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 09:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA16510E7D3;
	Thu,  3 Jul 2025 07:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oh3DuRXA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAFF10E7D3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 07:20:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A65BE61142;
 Thu,  3 Jul 2025 07:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C576DC4CEE3;
 Thu,  3 Jul 2025 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751527250;
 bh=pOwg1+ep1s42O2vvKzmecAXJEbVajSNurh827rc4U1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oh3DuRXAa0hNLQAoS+jUbMCEUDffVxNs6KV6YVJpd6COmZt/Ylbl6iJRbXIlzS6xh
 1uPh7+1wSfAO9VUO03HTBFCDpU10Hdg9hJuyMvoLpd/oaHiP01ebt+SkFQZY5rTXUL
 SpyXwB1ZffEzqtRbPGI6NdURaG7R07VvOX7LkPAWycG+STpJY4w9L4k9/JcOaZiJPo
 9H+PY5aDa80eogZatyBjSZt/mqlvZSFjOD6GNGjzW5npcCR67wAdfHoDB4ht6+dFut
 X8G8tA9CXAg6sYsRr3KxUcExMaWmVROo9khmN0uSKX+okcbQL5kPOl8Bz22fz3jwwf
 QjElgvglicWCw==
Date: Thu, 3 Jul 2025 09:20:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
 konradybcio@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 quic_kuiw@quicinc.com, 
 ekansh.gupta@oss.qualcomm.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: misc: qcom,fastrpc: Add GDSP label
Message-ID: <20250703-qualified-roaring-gaur-c7c2b7@krzk-bin>
References: <20250702025341.1473332-1-quic_lxu5@quicinc.com>
 <20250702025341.1473332-2-quic_lxu5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250702025341.1473332-2-quic_lxu5@quicinc.com>
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

On Wed, Jul 02, 2025 at 08:23:38AM +0530, Ling Xu wrote:
> There are some products which support GDSP remoteprocs. GDSP is General
> Purpose DSP where tasks can be offloaded. There are 2 GDSPs named gdsp0
> and gdsp1. Add "gdsp0" and "gdsp1" as the new supported labels for GDSP
> fastrpc domains.
> 
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

