Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77BA4A177
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E18010E102;
	Fri, 28 Feb 2025 18:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="eQ8imoeE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3729710E2B1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 18:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7E13D102901D2; Fri, 28 Feb 2025 19:27:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740767234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PSz7ZuQ5nzLnJet5Y9kbEfPUEX42BXLUnRfN3fMKwQ=;
 b=eQ8imoeEEwidEDudYu5MHyQsLjGLBO8dj5+QfJK9e2JR0FczsFVk87HbncD71csVZAqfeX
 NqtxMeJMIE2eDYNpvkV6pDJpNYP2pKf4UpMnXXPmNweU/w9RFgQHyHC3Vi/kDcQDtgIgTU
 lGkR9vFKdJPU4zaH4OEzkKqebb5/sG74EKmGOKYh5PFC/7XScQvvcbC2GXgL3WH16wBk3q
 AB4jy9asH5ejxdYyy6Z6DdnfxSOwE8I/HdYJN9CFrbULwwWdeBIdG0OzU7y/roQOtPbNYz
 O3lTUWEFE3vEf5Tt37NRw/70PeHGwBobRkeXb5t8wOkcncG9sgLeV8oSL2MBfA==
Message-ID: <b6eed3e6-e416-4c36-9fdf-f14471b029a8@denx.de>
Date: Fri, 28 Feb 2025 18:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
 <20250228123010.GB2321092-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20250228123010.GB2321092-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 2/28/25 1:30 PM, Rob Herring wrote:
> On Thu, Feb 27, 2025 at 05:58:07PM +0100, Marek Vasut wrote:
>> The instance of the GPU populated in Freescale i.MX95 is the
>> Mali G310, document support for this variant.
> 
> You should combine patch 4 with this one and make resets required for
> imx95 since you said it is required.
The reset support is orthogonal from MX95, but I did add the resets 
requirement for MX95 , thanks !
