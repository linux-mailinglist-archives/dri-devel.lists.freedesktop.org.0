Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47A8535BB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 17:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CC310E864;
	Tue, 13 Feb 2024 16:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OTbYHWT9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80AE10E864
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 16:12:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E93B6156A;
 Tue, 13 Feb 2024 16:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DDEC433F1;
 Tue, 13 Feb 2024 16:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707840741;
 bh=l9QqS29DqRYDm0qQfNCFLgO3rb42T1OTnJCo6+CfEWg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OTbYHWT9uHvaWMckwR8HQ7CCx2h0+rmXywvv5X7PhJLHR0p9KY+clpXXonapMYIJW
 Mh548qQzpxJx1JfUOY87SYf8532MfkppZDlAI8dpZ7nan7XaDebgERSHarFLBJImUu
 s6+c/fcnEgUijmk6USZs7JCiy1iw1/wrMWJJA74XJleac9HaEgcnoQRcIVjWKyLUBs
 IVNVpnqWcBAfBX77AExRCuLee+Xrkj17A3Nfwu4zTfWZiEpcslX8tJk2UWSA2QdMl9
 cmRjLnlgUytxRcpDXCh7ieZggPnFSqjMrvB4uqQtBuwJuuYssNMXeshnn3kyn+3pUc
 7t60zyl5RWJbQ==
Date: Tue, 13 Feb 2024 10:12:19 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Benjamin Bara <benjamin.bara@skidata.com>, linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] dt-bindings: use capital "OR" for multiple licenses in
 SPDX
Message-ID: <170784073862.1459522.15100332753986878275.robh@kernel.org>
References: <20240208105327.129159-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208105327.129159-1-krzysztof.kozlowski@linaro.org>
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


On Thu, 08 Feb 2024 11:53:27 +0100, Krzysztof Kozlowski wrote:
> Documentation/process/license-rules.rst and checkpatch expect the SPDX
> identifier syntax for multiple licenses to use capital "OR".  Correct it
> to keep consistent format and avoid copy-paste issues.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/visionox,r66451.yaml      | 2 +-
>  Documentation/devicetree/bindings/usb/cypress,hx3.yaml          | 2 +-
>  include/dt-bindings/power/amlogic,c3-pwrc.h                     | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!

