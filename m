Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A151ABF4BED
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 08:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A2F10E298;
	Tue, 21 Oct 2025 06:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ufgJENoW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4688910E173
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 06:52:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C67A143B51;
 Tue, 21 Oct 2025 06:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119D9C4CEF5;
 Tue, 21 Oct 2025 06:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761029564;
 bh=kEveI288R5aLgEy1LfWmXLzg1vJMJmJhDW/u+SLA3ys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ufgJENoWaQrbt1LbWl7US2kpvPAXm6hP4SYC0sBEkppguWvqx4odoeREOZ1hzvcGH
 T9puAiLpk8ER0bHDe+9wfqX+bS1+J00ibNQc5Q34vqQUr2Z/VbZaiNtXT5b7nPfxE9
 x3thfr7qGTtlUbZ/qk+m0cjtv6PT/V+URbn6Ar+0wMPpOtKABk2ZHCO4ISJUlIxFIl
 sBujnreUL9haT+U2tsiifPloDnhX93Helsh60Bhwd484BroWUlphn78V/HSabn7DSR
 nEpicEoTQiKy2nsGxdymT+5neEkdjAHbVQW6Df7K3aQe7y0lwCaNsBw10mJ7voRV9f
 al5JbcNESGw/g==
Date: Tue, 21 Oct 2025 08:52:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>, 
 dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 01/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller DomainBlend
Message-ID: <20251021-mighty-artichoke-crayfish-dc85b7@kuoka>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-2-marek.vasut@mailbox.org>
 <20251015132442.GA3241958-robh@kernel.org>
 <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c5bb009-3463-4282-946f-3ae93fab11ec@nxp.com>
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

On Thu, Oct 16, 2025 at 10:07:26AM +0800, Liu Ying wrote:
> On 10/15/2025, Rob Herring wrote:
> >> +properties:
> >> +  compatible:
> >> +    const: fsl,imx95-dc-domainblend
> >> +
> >> +  reg:
> >> +    maxItems: 1
> > 
> > No clocks or other resources?
> 
> As patch 39 shows, there are 3 interrupts - domainblend{0,1}_shdload,
> domainblend{0,1}_framecomplete and domainblend{0,1}_seqcomplete.

So they should be here. Just like all other resources, because bindings
should be complete (see writing-bindings doc).

Best regards,
Krzysztof

