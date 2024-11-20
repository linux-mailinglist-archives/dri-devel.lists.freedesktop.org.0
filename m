Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A2D9D355F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 09:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2EA410E167;
	Wed, 20 Nov 2024 08:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hyf4p+jL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309B710E167
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 08:28:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DFA23A42D62;
 Wed, 20 Nov 2024 08:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBE5C4CECD;
 Wed, 20 Nov 2024 08:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732091280;
 bh=SnrNpt481bFjFOWYHOj8+5+1Y/gn4MZcw71jG86uXjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hyf4p+jLqWNpvWPhWsWUyWiof86UtkM/be6WhrO+1+y5UMS67WXaDKys1sJA6+HBM
 Sc+z7k88o1jfLp4f5vtKYeMmcQK4oKh+0tPhkEI+MsqxjEjaAImZdPM3+FMQm9y+L8
 vPtNW+AZ5gNudF8x+iF176dMQaAnnmqfS98tBXGiUW7fCs2g9fannURoEHNBC/K5MT
 496Oazw3dBaYyxuvWY/Cus/hp/LYFVM5TlHQVjJaM8DnQxTMofj9TuLMq+ccauGtZc
 UubDdP3qE/EYhdQKxaxxr12R0wM8sIM3Zx599eXzqQ9pHYBCq6m/9mCXc+6N7u3dQk
 EYNV+7pspIVXw==
Date: Wed, 20 Nov 2024 09:27:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
 Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH v2 04/21] dt-bindings: gpu: img: Allow dma-coherent
Message-ID: <dvqeqopwztjk2odgtdzsncklj36aaii3wsmzsf4b2qlsv55ru5@wplvvf6oqmvz>
References: <20241118-sets-bxs-4-64-patch-v1-v2-0-3fd45d9fb0cf@imgtec.com>
 <20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241118-sets-bxs-4-64-patch-v1-v2-4-3fd45d9fb0cf@imgtec.com>
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

On Mon, Nov 18, 2024 at 01:01:56PM +0000, Matt Coster wrote:
> This attribute will be required for the BXS-4-64 MC1 and will be enabled in
> the DTS for the TI k3-j721s2 in a subsequent patch; add it now so
> dtbs_check doesn't complain later.

That's not a reason. You add it because device is DMA coherent, not for
some imaginary future checker errors.

Best regards,
Krzysztof

