Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCPMB9gMj2kgHgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 12:36:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BA5135C1C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 12:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57ACE10E00F;
	Fri, 13 Feb 2026 11:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="caJNCcok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C4910E00F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 11:36:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6C2814389E;
 Fri, 13 Feb 2026 11:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB283C116C6;
 Fri, 13 Feb 2026 11:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770982610;
 bh=gYIUDyOnQ4i+NX/uRmisjwBc8e2TSySxYxiqfeOYn8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=caJNCcokTOFaoy5qVeixCz6GWmO+vpd5b/ulWWauByaWJxvOdrSs349mS2wEjK39+
 KhQyqms9iunHaYIAJ5GZ/Au305z/p2MPwXGgzOSfL6dgsHS7gF4zjp/ZpyohdcFuAZ
 xzprcZu/+7qISqExYV4OJMBxeSiuF89YvizZQoChYPh1fdspZfJaAvMvZpVXKQ80b0
 apnnFSLPv+e7JHLUehNNXb41eX8Xss4LOeohT5R3x2+DSBlcKN6ThzRxCKYD6SVhn2
 w2ni+MnoDQaFSwdn7apIhJ/rkDOyIFzEdadCus7aIrNMJPMG+37NyOwtBBlvDDrJh3
 5DBdfATgnGWgg==
Date: Fri, 13 Feb 2026 12:36:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, simona@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, mani@kernel.org, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, dev@kael-k.io,
 kever.yang@rock-chips.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dianders@chromium.org
Subject: Re: [PATCH v2 1/3] dt-bindings: vendor: add taiguan
Message-ID: <20260213-seriema-of-optimal-vitality-f4cb8b@quoll>
References: <20260213071946.1436852-1-yelangyan@huaqin.corp-partner.google.com>
 <20260213071946.1436852-2-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260213071946.1436852-2-yelangyan@huaqin.corp-partner.google.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:yelangyan@huaqin.corp-partner.google.com,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:mani@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:dev@kael-k.io,m:kever.yang@rock-chips.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dianders@chromium.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 69BA5135C1C
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 03:19:44PM +0800, Langyan Ye wrote:
> Add the "taiguan" vendor prefix for Shenzhen Top Group Technology Co., Ltd.
> 
> The prefix is derived from the vendor's website domain:
> www.taiguanck.com/en/, which uses "taiguan" as the primary

Website does not work, so cannot verify any of this.

> identifier of the company.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index fc7985f3a549..a0fcd7154ff8 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1598,6 +1598,8 @@ patternProperties:
>    "^synopsys,.*":
>      description: Synopsys, Inc. (deprecated, use snps)
>      deprecated: true
> +  "^taiguan,.*":

taiguanck, because this is the domain.

> +    description: Shenzhen Top Group Technology Co., Ltd.
>    "^taos,.*":
>      description: Texas Advanced Optoelectronic Solutions Inc.
>    "^tbs,.*":
> -- 
> 2.34.1
> 
