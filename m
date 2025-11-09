Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E3FC44362
	for <lists+dri-devel@lfdr.de>; Sun, 09 Nov 2025 18:08:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C2B10E0BA;
	Sun,  9 Nov 2025 17:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uk8IVwQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B049B10E0BA
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Nov 2025 17:08:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DABD843975;
 Sun,  9 Nov 2025 17:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D15C116B1;
 Sun,  9 Nov 2025 17:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762708124;
 bh=ET1zFUZTZRnzMVHdUq9/iGHDQDRbTzMHvG3AIriBGSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uk8IVwQh0VOPTSgkhsyAP5awGCF7kD/7XLwTBhztlDI9xfMCkrbomuammpNj/p6j+
 VfrdLjqdb7/12MJZTe1VimPRdieQWsTAKhtpvCexwmMeEI45iV9koopEAs34CKn23h
 TKW4eT7ycao3l8mqbOUtTkgdtHKHzmKZFW/i/EXuwLthKDEC3fhsJsEh/hUbQ6EGuQ
 em7oHrSIjMMStOPtDz/nYXdSCnrCvziFb+kHgde3htv/Hj9gQ9l85I1EO2jRy1wpom
 W0Js1ZlsSdzfWOZzPEJxTvBz+t/k34hd96dZd8S8UBThehLlz/Ixjb0dhwISY+tcPF
 3IxUxSnYjCxnQ==
Date: Sun, 9 Nov 2025 18:08:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Helge Deller <deller@gmx.de>, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: Add Awinic AW99706
 backlight
Message-ID: <20251109-righteous-dove-from-saturn-9b9bb3@kuoka>
References: <20251109032240.3422503-1-caojunjie650@gmail.com>
 <20251109032240.3422503-2-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251109032240.3422503-2-caojunjie650@gmail.com>
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

On Sun, Nov 09, 2025 at 11:22:39AM +0800, Junjie Cao wrote:
> Add Awinic AW99706 backlight binding documentation.
> 
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
> Changes in v3:
> - breaking a long line (Krzysztof)
> - rename backlight node (Krzysztof)
> - Link to v2: https://lore.kernel.org/linux-leds/20251103110648.878325-2-caojunjie650@gmail.com

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

