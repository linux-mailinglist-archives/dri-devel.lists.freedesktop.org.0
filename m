Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B00EDCB65CE
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:41:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F1610E872;
	Thu, 11 Dec 2025 15:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NUghXMUO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CD110E895
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:41:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C7C440134;
 Thu, 11 Dec 2025 15:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EC6C4CEF7;
 Thu, 11 Dec 2025 15:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765467701;
 bh=/Ij9Fjramg3/sU+Yj0yoSQgfiCyDiDbImdGGPvmGbwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NUghXMUOhpfs3VXuO3PrWQFC+1epwLk8YHWdLhDK2wtUhkwYNIuYxJ7edP4nh/h9R
 iU+uHo1nDk8uLmpm2sHxWQykTgLvxK2shakJyetB2vmOYm9497+/DB+cRe8ZILC6sh
 bNiN+2YRfDvo66qe0pZ+MmAOe6xQInJF8mBl1eJcfu5uq/OyIK9FQxnq4CwS5Wb3dE
 ZXR5bqiQberpg3E47wynVhk336WNpwlYiTYZaOHMusf1hFFWphG5SGKr1ypFu8BFoc
 qZ+0NP8Zo5JTeRJ8niaShxdLi4EZlOBLSzQbcyVxl1r/8dYyqvdObUlUTAmoitaV6F
 IgP7petqUxQyQ==
Date: Thu, 11 Dec 2025 09:41:39 -0600
From: Rob Herring <robh@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_bkumar@quicinc.com,
 ekansh.gupta@oss.qualcomm.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v6 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
Message-ID: <20251211154139.GA1424272-robh@kernel.org>
References: <20251211100933.1285093-1-kumari.pallavi@oss.qualcomm.com>
 <20251211100933.1285093-2-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211100933.1285093-2-kumari.pallavi@oss.qualcomm.com>
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

On Thu, Dec 11, 2025 at 03:39:30PM +0530, Kumari Pallavi wrote:
> Kaanapali introduces changes in DSP IOVA layout and CDSP DMA addressing
> that differ from previous SoCs. The SID field moves within the physical
> address, and CDSP now supports a wider DMA range, requiring updated
> sid_pos and DMA mask handling in the driver.
> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 3f6199fc9ae6..142309e2c656 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -18,7 +18,12 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,fastrpc
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,kaanapali-fastrpc
> +          - const: qcom,fastrpc

Does the driver work at all on this platform without the changes in this 
series? If not, then it is not compatible with "qcom,fastrpc" as you 
say here.

Rob
