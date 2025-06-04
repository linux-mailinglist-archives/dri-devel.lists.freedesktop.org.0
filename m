Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B595ACDC8D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 13:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E9D10E5B4;
	Wed,  4 Jun 2025 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VloJxxD6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DFC10E5B4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 11:30:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D20F43D60;
 Wed,  4 Jun 2025 11:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD83C4CEE7;
 Wed,  4 Jun 2025 11:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749036642;
 bh=xaRdU654C9wS4ZfZAI2RLoVKKEW4q0RIJHCOrcqPbi4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VloJxxD6gyjQMD7btdyTj1BT0e4gBvR+E479LFRc4RqDa5BCpNiyY9BksVkveHe/H
 QT27yuDd6r82lNHPAuxdWpVOt6QpC8Z4rgyDNkkyXMLinicyXDG4LYbPQROyqFZ7nn
 4qkpFAKUL3sTFO8cqBp9256NMpmK1yoOYk/yfKR1OAvoJMR0CCXDXqc36Goin/uFvd
 d681mGEyt2bz2v/OhTbFdSfeU0xVZN6lYdnUUAe4fCZUoJ6Y/1DbZ0ZV562cYFdDI3
 EpSZIS2B6kBbpTmbRXs11TMblGwwlSyvQ32DamVq3SZw5XHjuyu8spR4WGMfIjTDSm
 SiCjM7WP3t+Cg==
Date: Wed, 4 Jun 2025 13:30:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, sebastian.reichel@collabora.com, heiko@sntech.de, 
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de, 
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch, 
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org, 
 javierm@redhat.com, megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: display: himax-hx8394: Add Huiling
 hl055fhav028c
Message-ID: <20250604-ruddy-lemur-of-defiance-333aef@kuoka>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
 <20250603193930.323607-3-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603193930.323607-3-macroalpha82@gmail.com>
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

On Tue, Jun 03, 2025 at 02:39:28PM GMT, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add compatible string for the Huiling hl055fhav028c. This panel is
> based on the Himax HX8399C display controller which is extremely
> similar to the existing HX8394. Add a new constant for
> himax,hx8399c for this new display controller as well.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

