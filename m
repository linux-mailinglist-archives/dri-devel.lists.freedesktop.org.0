Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E91AC90E9
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 16:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF6610E868;
	Fri, 30 May 2025 14:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mei7aynL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B052910E86E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 14:02:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 43C315C613A;
 Fri, 30 May 2025 14:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA955C4CEEF;
 Fri, 30 May 2025 14:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748613767;
 bh=alC+n25lh6Y0CfqOg41XwQuLN4LpTiNcPxMk5nDhSe0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mei7aynL6r2D5G7tNEqAWX743lADuFAffmrGpdtuv9Jf9I7dUa0rJWfvLwT8vNQlD
 1P8fs1+2P9HqsRQqOcmX4HVTAlTCVmLZ3WmTmvzzK7dzxBsXXvynUXMLclR9WdpeI3
 6vVbmf4XnkyMfe+7M0HcWmBOrmaT00Sqd9a1moBCxK1D7UyV7gzwTzlnkx//2gvv+f
 Ce6JNFW9lyZgeNOqzBwN9BYdsx4AgMMj8A1D+F6slgbWVjlguz5KiHBBN3gGarCTbQ
 Ph6XxVDwH3ygUTK0FNf+0GGpavFNQygvfq2QwQP1OFNxozB5WJVnBIBOlf8EdS+C+1
 jfPJ0hU9jbaiQ==
Date: Fri, 30 May 2025 09:02:45 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/1] dt-bindings: display: convert himax,hx8357d.txt to
 yaml format
Message-ID: <20250530140245.GA1608370-robh@kernel.org>
References: <20250529164822.777908-1-Frank.Li@nxp.com>
 <174854325819.3595451.10273154567966477690.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174854325819.3595451.10273154567966477690.robh@kernel.org>
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

On Thu, May 29, 2025 at 01:27:38PM -0500, Rob Herring (Arm) wrote:
> 
> On Thu, 29 May 2025 12:48:21 -0400, Frank Li wrote:
> > Convert himax,hx8357d.txt to yaml format.
> > 
> > Additional changes:
> > - add spi parent node in examples.
> > - ref to spi-peripheral-props.yaml.
> > - change himax,hx8357a to himax,hx8357 to align driver and existed dts.
> > - add himax,hx8369a and fallback to himax,hx8369.
> > - allow gpios-reset, spi-cpha and spi-cpol to align existed dts.

Fix the .dts files and drop gpios-reset. The kernel has a work-around 
and I would assume it's been in place long enough to support 
reset-gpios.

Rob
