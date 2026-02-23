Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOzML/qAnGmLIgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:31:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC21179D17
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 17:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01D810E0F8;
	Mon, 23 Feb 2026 16:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tU+tAIO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C401E10E0F8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 16:31:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8F749439A4;
 Mon, 23 Feb 2026 16:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DA3C116C6;
 Mon, 23 Feb 2026 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771864311;
 bh=mkZX9bthwOnmlihIsb3M3krfMhzFMjXTFrQo7kXeUwI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tU+tAIO3YmZseIcWYuwlghq1OcEArNepaNoS2z0/h/FS9nGusNkqA8YNmYNZdqqVC
 XuKpMP8LASjAkHdfUbWQo8GRefrnJkkWTCjJrMdMmSOm/J8LtFo9kBXNOa+6dUeYni
 u/wsewa6ns7ZkvkCSzef5AAKt86NGjD6KCWa+rU/XDqjBv6rhQcU0U1LI9G5dM4SNm
 YYMKqTAy9dBABTqQzJwwrAbqZeIf5ipx3zdelOMZiowIT8e0AtNAqM9WIyHmLEFmbD
 G6o1OR5/bxOWVBllLtS+vBw3COvs/1btKKRmFYlOVywA9uD3JRjU89Hgtxy8JAUlqp
 z4pY4kqkQP4xg==
Date: Mon, 23 Feb 2026 10:31:48 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com, 
 krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org, 
 mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 3/5] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Glymur
Message-ID: <siuuvqcxcfw2be72hh2pu6csmw6qxy26ixnxppbfy7gtpzxxzd@vuucoicoj4h2>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129001358.770053-4-sibi.sankar@oss.qualcomm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:srini@kernel.org,m:amahesh@qti.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 4EC21179D17
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 05:43:56AM +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur fastrpc which is fully compatible
> with Qualcomm Kaanapali fastrpc.
> 

I assume this means that you have successfully called at least one
FastRPC function on Glymur - with the WP firmware?

Regards,
Bjorn

> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/misc/qcom,fastrpc.yaml        | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index d8e47db677cc..ca830dd06de2 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -18,9 +18,14 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,kaanapali-fastrpc
> -      - qcom,fastrpc
> +    oneOf:
> +      - enum:
> +          - qcom,kaanapali-fastrpc
> +          - qcom,fastrpc
> +      - items:
> +          - enum:
> +              - qcom,glymur-fastrpc
> +          - const: qcom,kaanapali-fastrpc
>  
>    label:
>      enum:
> -- 
> 2.34.1
> 
