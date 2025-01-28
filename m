Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AECA20CCF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 16:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E034A10E111;
	Tue, 28 Jan 2025 15:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Hvl2r6Jn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2AD10E111
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:19:52 +0000 (UTC)
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C3A8496;
 Tue, 28 Jan 2025 16:18:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1738077518;
 bh=/M3sluiHSQ79DO/JWZhFhxH1LzXYMDwMfYXtk623IT4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Hvl2r6JnjxPhpXspXDdU9PxgZ7CvA31J5qb3ox9CyPTBKy3uXjcvmHdturEqWO/Uh
 2jKJJU1/3pzNqNu62vUnfcsoznWxhlJt6FMyoOsgM6gNCLpMQtHcnOj+Tjj0/2UfTm
 b+NS4+rmEqSwXw+ez/wyx9ktZ9PG+uLGp10r46KI=
Message-ID: <b03dc27c-4bc8-4faf-b60d-b7ca5f1c5d18@ideasonboard.com>
Date: Tue, 28 Jan 2025 17:19:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: display: renesas,du: narrow
 interrupts and resets per variants
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
References: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 28/01/2025 11:47, Krzysztof Kozlowski wrote:
> Each variable-length property like interrupts or resets must have fixed
> constraints on number of items for given variant in binding.  The
> clauses in "if:then:" block should define both limits: upper and lower.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This was sent already in August 2024 (!) and still not picked up. Thus
> some other people started doing similar in December.
> 
> Can this be finally merged?
> https://lore.kernel.org/all/20240818173003.122025-1-krzysztof.kozlowski@linaro.org/
> 
> Changes in v2:
> 1. Add Ack
> 2. Rebase
> ---
>   .../devicetree/bindings/display/renesas,du.yaml      | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

The series looks good to me.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

I'll push to drm-misc-next.

  Tomi

