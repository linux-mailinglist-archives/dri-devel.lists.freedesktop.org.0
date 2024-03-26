Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210888CEBA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 21:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBC910F2B8;
	Tue, 26 Mar 2024 20:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jobp2iJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C2C10F2B8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Mar 2024 20:30:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E7E7CCE21AA;
 Tue, 26 Mar 2024 20:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2838C433F1;
 Tue, 26 Mar 2024 20:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711485013;
 bh=vXSgfx5ZlUMqb12HaSRiMrCETc8zcbZB2rpWCbEe/N4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jobp2iJMTCC7ePRlfqE3kPeCGHtBwA64FPlOwBxcDsGxGaLrCR439DIIdDJu5viR8
 bTfnhwEwdLFaSwghgYkteGPMVhFRV04vEjSRwa7zDK0Zml/jVASpBbDS355FzX0heP
 mv+ibo9ZXQEjSgNpS0+axQ8xWWIGWiV/R73H0o1KLYX5U6ra2GeYjMRzAapjgWM9SR
 BwZ8RwwLjV13yaABxrAUPm3e8eybBoS5MDwCaT0W+3zEO8ONV39adewLhFZ4pg13KW
 md8X3Y/L0J6b6Z6IO4LWIt0Rs2odNLJOtY5sQGVjH8Y1Sqa8KEUiGQiFTXMnovRF15
 ScfFetCSWOuMQ==
Date: Tue, 26 Mar 2024 15:30:10 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: sam@ravnborg.org, conor+dt@kernel.org, megi@xff.cz, airlied@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org,
 devicetree@vger.kernel.org, kernel@puri.sm,
 Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, agx@sigxcpu.org,
 linux-rockchip@lists.infradead.org, quic_jesszhan@quicinc.com,
 heiko@sntech.de, daniel@ffwll.ch
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefix: Add prefix for GameForce
Message-ID: <171148501047.3376252.8555158106984338212.robh@kernel.org>
References: <20240325134959.11807-1-macroalpha82@gmail.com>
 <20240325134959.11807-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325134959.11807-2-macroalpha82@gmail.com>
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


On Mon, 25 Mar 2024 08:49:55 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> GameForce is a company that produces handheld game consoles.
> 
> https://gameforce.fun/
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

