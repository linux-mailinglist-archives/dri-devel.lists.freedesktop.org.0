Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075B4992453
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 08:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0182A10E13A;
	Mon,  7 Oct 2024 06:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Kmxc/Vrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E24010E13A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 06:15:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1CC675C59A1;
 Mon,  7 Oct 2024 06:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172F7C4CEC6;
 Mon,  7 Oct 2024 06:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728281731;
 bh=PAlO2/0oeLaCiTChrJrxR82FAuJV1p5u9yp6LU0cKC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kmxc/Vrtptz7VB4T+5Eg4MLf6j3QjE9Z/JOfhNWQOaCA72RmnLUnD8iZIzukLLS11
 wEJoPUy5Sh+5g+KuLZCCkNLCIr7+N1zMJpfpwk1S0BD0bY3mDstUPzP0NnBYlC0FIa
 FYfbtoingUoR/IY39+45k8uwwowH/6aqIdHN8Fz2mSJFe6HwSuYiKksnyfC6xKG9b1
 kXsbM3e9gTp2bviCkY7GmgxFNdzm7QuBNmkjlq4i97aMu8sOpPamVN3N0aZXkt1SqZ
 MpEDQbcU3uOEikP6JM70ljtSwhhc+RLHVB+e7TYwTfaTYrSV8uW0Hz1dFecOAQPybh
 MZhhcuIh8s5Uw==
Date: Mon, 7 Oct 2024 08:15:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alain Volmat <avolmat@me.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpu: mali-utgard: Add
 st,stih410-mali compatible
Message-ID: <w4gdi2vhp7pq62xmdmvspqnwf2szirif5xe4cnok5vpeisqeb4@qfws4d4pufna>
References: <20241006-sti-gpu-v2-0-c6bb408d6903@me.com>
 <20241006-sti-gpu-v2-1-c6bb408d6903@me.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241006-sti-gpu-v2-1-c6bb408d6903@me.com>
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

On Sun, Oct 06, 2024 at 08:42:49PM +0000, Alain Volmat wrote:
> ST STiH410 SoC has a Mali400. Add a compatible for it.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

