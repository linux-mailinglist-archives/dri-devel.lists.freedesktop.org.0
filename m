Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB5392AA42
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 22:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DB710E403;
	Mon,  8 Jul 2024 20:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S3PWHRlJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED9810E403
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 20:04:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F204461070;
 Mon,  8 Jul 2024 20:04:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74967C116B1;
 Mon,  8 Jul 2024 20:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720469072;
 bh=+LGYnoamoS4zfZqMrzKzYDviwFlUv6xLADZa36LTO0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S3PWHRlJ0VCjKO1lj50fEwf/58isiHjCmzm7NgA9+k3pMwfnIopSOatyfxItxA4st
 Rnft84KW6cOJ3zTX2writ+/UVW1fs/hqOqmNiCrIpTIGQA0Lr9EnJVk7dhEHKVU/aY
 LGvP6aGWDFLnFyX9uqpf6hPRdx7IAAhydYmOF7CXvA7DP5Z1rJHFVD8lrkTp+i0t7o
 ZOoa75Ju8biYaHc2XvmaoeQoR3pzMTzomvqGPSII2E+bcdc2FwvhixjGxcUvu/BuV8
 v2bVClheX+wE9OOOn55kW2Wq8PdUvmc6TJSDDvYQiVbEGpcwZaWivSw5SmL27cGG1x
 1wnkCCu8XVFGg==
Date: Mon, 8 Jul 2024 14:04:31 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
Subject: Re: [PATCH 01/10] dt-bindings: display: imx: Add some i.MX8qxp
 Display Controller processing units
Message-ID: <20240708200431.GA3492466-robh@kernel.org>
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-2-victor.liu@nxp.com>
 <eec3d2a7-0197-4196-bf6f-71d0e29777de@kernel.org>
 <9a911f88-7fbf-4484-997c-98b6c3ec045b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a911f88-7fbf-4484-997c-98b6c3ec045b@nxp.com>
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

On Mon, Jul 08, 2024 at 02:30:37PM +0800, Liu Ying wrote:
> On 07/07/2024, Krzysztof Kozlowski wrote:
> > On 05/07/2024 11:09, Liu Ying wrote:
> >> Freescale i.MX8qxp Display Controller is implemented as construction set of
> >> building blocks with unified concept and standardized interfaces.
> >>
> >> Document some processing units to support two display outputs.
> > 
> > 
> >> +maintainers:
> >> +  - Liu Ying <victor.liu@nxp.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: fsl,imx8qxp-dc-tcon
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  fsl,dc-tc-id:
> >> +    description: Timing Controller unit instance number
> > 
> > No instance numbering. This applies to your entire patchset.
> 
> Then, I'll call of_alias_get_id() from the drivers to get
> instance number instead.

Ideally, no.

> As i.MX8qm SoC embeds two Display Controllers, the alias
> stem would contain the Display Controller instance
> number, like "dc0-tcon" and "dc1-tcon".  Is this ok?

The format of aliases is fooN, so no. Aliases should also be generic 
rather than vendor specific.

If you need to describe the connection of components in the display 
pipeline, then use the graph binding.

Rob
