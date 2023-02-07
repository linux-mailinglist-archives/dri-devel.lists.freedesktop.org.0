Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715268E024
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 19:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7601810E599;
	Tue,  7 Feb 2023 18:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9141B10E590
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4GfeO/XZAAdUxo1fix4X+pe63hWI1TdtNYDToXtW6gs=;
 b=DwGgnC56M27GcJtqsSlyWtPzcBCL3k6aBLX6+g/5zUq0WTbscpVg/rvNKu6PqhxKVh24TT5MOA2Qh
 5S9OpcOzbaYO9wO/zTOFVepkWWPrbfSXP/32Ask4e5Y2dadNjw8xoiDMtxiNCH1jPUw4BiVPOJ7rZ6
 Z/Q/bLmnx2jYrBgGXYZ4S8iqcy0LIfAu/+B6YVLENS4ed7583vwVk78sMJ8LaWlaY6YkJ4AlJ7jRSs
 pTN0j9rqQNDC2mxnbYFwYGz89MwfHKy3lpSoATOi5fof0C3ndZisXzOxWmk2THtZuDs6YWy+PX/8Dn
 YnvrFG/PrTfR70Gc6ETFNaQBpaMg/ig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=4GfeO/XZAAdUxo1fix4X+pe63hWI1TdtNYDToXtW6gs=;
 b=5l5sNo2fgYRGt6tnuy4JMfL4cjfxeKDxZwpAiIHQSsE3X3PpNrs7lg5Bln2CpKAFEu3ex6IdJ6Gfq
 Ci40VVDDQ==
X-HalOne-ID: 4421bf51-a716-11ed-b8d7-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 4421bf51-a716-11ed-b8d7-ede074c87fad;
 Tue, 07 Feb 2023 18:36:02 +0000 (UTC)
Date: Tue, 7 Feb 2023 19:36:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel: visionox,vtdr6130: add
 missing reg property
Message-ID: <Y+KaEPO7he39Gmd5@ravnborg.org>
References: <20230207-topic-sm8550-upstream-vtdr6130-bindings-fix-v1-1-0ba2323420c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230207-topic-sm8550-upstream-vtdr6130-bindings-fix-v1-1-0ba2323420c5@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil.


On Tue, Feb 07, 2023 at 11:04:36AM +0100, Neil Armstrong wrote:
> Add missing reg property and update example to add dsi top node.
> 
> Fixes: ef85db911134 ("dt-bindings: display: panel: document the Visionox VTDR6130 AMOLED DSI Panel")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/panel/visionox,vtdr6130.yaml  | 34 ++++++++++++++--------
>  1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> index 49e2fd4b4e99..84562a5b710a 100644
> --- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
> @@ -16,6 +16,10 @@ properties:
>    compatible:
>      const: visionox,vtdr6130
>  
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
Other panels using dsi uses a simple
"	reg: true"

I think that would suffice here too.

	Sam
