Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F42DB43720
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 11:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E65B10E07A;
	Thu,  4 Sep 2025 09:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HIp5rGKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F14810E07A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 09:30:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1F7D143687;
 Thu,  4 Sep 2025 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58917C4CEF0;
 Thu,  4 Sep 2025 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756978238;
 bh=NuLfP+r54LURDa2LMo8LpqmiyCBnEVHwC9eXfZe3py4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HIp5rGKSsb4OffYTPRkTkmC9E5V/Dz1pqOk7/EYbgLIWe3oY2+HwirS20q+oEPy7Y
 JMxHmdnotOEJ8ULS1BDyK7jDnnJH74Kf9u3jTPldI2ZFawLqRARtARC8L0G/wqu+p0
 kzUoCsSHywe6b6JIv+2jQ3aWL7u6dlQ9B7W402IpH19nRtWcuJAxd3dZbBZ/ptL9Kg
 +bvoO7gBWo1QDg/Qwsx3T+tFveH8XnAxmfJRrAb6JFrjJLS2B1hUcdAEHYu+udoGUk
 UM5tvz4E86r5BCr809NTNldr6BMX4bc2Qm8AYrLLMPjIimyfDxJVOxcvQPidbWSuvi
 3Wu5OChGPV14w==
Date: Thu, 4 Sep 2025 11:30:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] dt-bindings: gpu: mali-valhall-csf: add MediaTek
 MT8196 compatible
Message-ID: <20250904-practical-dazzling-quail-f1bebb@kuoka>
References: <20250903225504.542268-1-olvaffe@gmail.com>
 <20250903225504.542268-2-olvaffe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903225504.542268-2-olvaffe@gmail.com>
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

On Wed, Sep 03, 2025 at 03:55:03PM -0700, Chia-I Wu wrote:
> MediaTek MT8196 has Mali-G925-Immortalis, which can be supported by
> panthor.

What is panthor? Please describe here hardware or provide some
explanations of not-that-known hardware names (if panthos is that).

Best regards,
Krzysztof

