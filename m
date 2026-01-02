Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D354BCEE77A
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 13:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49B110E0FA;
	Fri,  2 Jan 2026 12:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GeaexvRW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7514810E02D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 12:13:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 512EF60128;
 Fri,  2 Jan 2026 12:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76953C116B1;
 Fri,  2 Jan 2026 12:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767355995;
 bh=NcRPChKxYj82FiPy4b7x8IpELwc/9I1LcPx0q63Fxig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GeaexvRWNhiKsqd2gZm7KDJXfhJutk9i6mAW9+BPYp+Xs7mcN8yaGmygZoUJwQogJ
 67KhqCKivg9pWFOI5GY0Y0cIlqZmGffKAKaE8NBo7MWVjkqkFHsSzcVawj5dQ8oszp
 QEvVyPn8REexi1XzzLR3L3bazPzmQaNDF2ujqAPb/nXdWPT/x2WCZq6ynwerZkz/90
 HObOMiisnJblzEWx/Frh74n/6HgAB1ANMXA9Bga67eBk40ghKno0Qf4/Vkq3nNcbVu
 2Ba69gQEQZ1+nrr8YhYmp/hi0T5Y/dITENHP8vN9sEUBT98gfG+F7pOZFrpww9ouOJ
 aRKW2sqFNYOmg==
Date: Fri, 2 Jan 2026 13:13:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Innolux
 G150XGE-L05 panel
Message-ID: <20260102-garrulous-mink-of-engineering-f2eaef@quoll>
References: <20251230125913.3670617-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251230125913.3670617-1-festevam@gmail.com>
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

On Tue, Dec 30, 2025 at 09:59:12AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add Innolux G150XGE-L05 15.0" TFT 1024x768 LVDS panel compatible string.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index fc244fbb5a54..3b7550f09936 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -182,6 +182,8 @@ properties:
>        - innolux,g156hce-l01
>          # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
>        - innolux,n133hse-ea1
> +        # InnoLux 15.0" G150XGE-l05 XGA (1024x768) TFT LCD panel
> +      - innolux,g150xge-l0

g < n

g150 < g156, at least that is what is visible in the diff. Please keep
things sorted.

Best regards,
Krzysztof

