Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70901C8D196
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 08:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28C510E180;
	Thu, 27 Nov 2025 07:31:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bSwmYIP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA8510E180
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 07:31:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 121E5441B5;
 Thu, 27 Nov 2025 07:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650D2C116B1;
 Thu, 27 Nov 2025 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764228661;
 bh=BzSSbRUngkZLCHPiK66chBRHs0psXmRouSqUaQ+VoLM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bSwmYIP9ynLIkEl3xQ6dmCibhUeC4ELNOwSg13QX8NMq6+dVofv3xfSBhFiSxdE63
 jUFnuZslfO44Brd3yBXW5EzR2kElhkieD4Z6B+zvLRDuWKRlYkjfkTHfvXRay09/Eh
 L9WEyaZEM6nt48XKsntmaLk1SSSzWwoF7l7OGN23kz33Q0TeksXy9V3od0j9ZLNTcg
 pLnHbmfgEzCI/RZuqt4AU8+xJwHUdGtDm32qC9CCZHvsjlaEfGVWwYFFSahaR3dV3C
 pD9tnUbdu78C3fyVR2lZGZ1vSPp8iyh8AL1OfUyvsRmcIEKz9+Ndxe03lW7IXcb6Sy
 07ej9zMGISwZQ==
Date: Thu, 27 Nov 2025 08:30:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
 arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 jingyi.wang@oss.qualcomm.com, 
 aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v4 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
Message-ID: <20251127-prehistoric-sponge-of-faith-efde44@kuoka>
References: <20251126094545.2139376-1-kumari.pallavi@oss.qualcomm.com>
 <20251126094545.2139376-2-kumari.pallavi@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126094545.2139376-2-kumari.pallavi@oss.qualcomm.com>
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

On Wed, Nov 26, 2025 at 03:15:42PM +0530, Kumari Pallavi wrote:
> Add a new compatible string "qcom,kaanapali-fastrpc" to support
> for Kaanapali SoC.

... and here you write WHY or provide background about hardware
differences, instead of writing what you did. We see what you did easily
- we can read the diff. Additionally your subject already said this, so
basically your commit msg is redundant...

I still do not know why Kaanapali needs this.

> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 3f6199fc9ae6..6c19217d63a6 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -18,7 +18,10 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,fastrpc
> +    items:

No need to introduce items, wasn't here before. Just enum directly.

> +      - enum:
> +          - qcom,kaanapali-fastrpc
> +          - qcom,fastrpc
>  
>    label:
>      enum:
> -- 
> 2.34.1
> 
