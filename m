Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BC4A5738F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 22:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5BA10E308;
	Fri,  7 Mar 2025 21:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JnHaMZ6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 688F810EA10
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 21:24:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F15DDA4516D;
 Fri,  7 Mar 2025 21:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA8DBC4CED1;
 Fri,  7 Mar 2025 21:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741382665;
 bh=Op08E3EJ3jq2CjneWJsJoQaPOY3AxoOhvzYkKdG27Oo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JnHaMZ6zq7F5KQ4LSCPCgRLg2uF26Myhk/oh0YiVL2MU5TwN2RK0kG50XLCfWyIDO
 8+V4T9AiDVqPx689Nes/Eg1by9lPkZIM23B8VczAW80cTLhVfe8+FPAWhMP3I0EI4E
 9nmA03QVvadYXfGDG/A0QzbJ0YQXfSiKvzkTTge+p92VjdmEMPQ0oRJrv1FaL29TiS
 z7dUNRV6vEE8QrPAO8qK/dFDdLsJJjBfMSbyhCgY/PU8xEbJfChrOweOVsvlFT26pO
 1Tw9aiuTGy0lj5dYSJkeRp8+BDgkM/3JAMcmKZ5RHx+opS7RUnipWEl14I5++ujRxQ
 WTAFFQgBu1SLg==
Date: Fri, 7 Mar 2025 15:24:23 -0600
From: Rob Herring <robh@kernel.org>
To: "A. Zini" <alessandro.zini@siemens.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 Andrej Picej <andrej.picej@norik.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] Introduce h/vsync-disable properties for ti-sn65dsi83
Message-ID: <20250307212423.GA630904-robh@kernel.org>
References: <20250306091133.46888-1-alessandro.zini@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306091133.46888-1-alessandro.zini@siemens.com>
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

On Thu, Mar 06, 2025 at 10:11:31AM +0100, A. Zini wrote:
> From: Alessandro Zini <alessandro.zini@siemens.com>
> 
> This patch series adds support for disabling the generation of h/vsync signals
> on the ti-sn65dsi83 bridge.
> 
> This is required on some panels which are driven in DE-only mode but do not
> ignore sync packets, and instead require them to be low-voltage level or ground.
> 
> A discussion (1) on TI's E2E forum confirms that this may be required for some
> panels.

If this is a property of the panel then it should be in the panel's 
endpoint or implicit with implicit being preferred. It should not be 
defined in some bridge binding.

Rob
