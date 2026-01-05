Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16920CF19CA
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 03:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC2910E074;
	Mon,  5 Jan 2026 02:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uUIE7nEw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uuk28qZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279D010E074
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 02:13:52 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dkyXG4DChz9t0l;
 Mon,  5 Jan 2026 03:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767579230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUECMuqTPTti9Ot6WKiCSLREkvP/PSjUrsLYS0gj92w=;
 b=uUIE7nEw3HzG/JFECxTLY3A8M8W3sWxH/2pqxddIfrenRGrQsVFRVRKPmKMdRGecfhKXFu
 lkrvomg/r15r/XTin1lRDwBLjA9+Mi5KHN+89FAlTPxGCCjUnqR757VAS2/Ts5hnk82ebm
 jvjH5E6KM+mTL9dXVgCDeAQTCn1s/Cs2KWm5Z24MX6KIDa1aRrxwqCB44OJh7VtfDa+B1j
 WFD/f+4yfytSGLwmWDFE4nzldkragMBmULc+2xbQ7heM45NrDPjGNhhyQnGWKiK8ELNv7d
 3W9If+rJzBNwkFR2GTICLmbRWk1F+nCj/UCaR9IOxSWM5PtQl9CeZsntPDsx1A==
Message-ID: <dec21ad6-c87f-451b-bdab-9227d457a166@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1767579228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JUECMuqTPTti9Ot6WKiCSLREkvP/PSjUrsLYS0gj92w=;
 b=uuk28qZDKMnJhI3Owfbv0IzmBf2xE4iGmD+q/qhu+7V8Uo30XiDayu/65ciYu9xtldWdTU
 4SgbmQ3FwnqMIV5LYfDwdFAI6TYAGVz8BoxUrxe06BKoGWQ5Di6qM/PpGpSn92h2VPh9KG
 FFA4UowtTOwm70LIOk/u7oPbGwO2dpwgI6gEIgwEJYyW3RaOQLNQA/Rqx6s6wraIA1rOf5
 nEXRl10uhMsZboMfLQUCYmSmls4IiuG7aATqIUY0KJ5wh2LQJ9Dy4ZlnEfgq16ZIF8BzzB
 +UZ1rCTazbslmCkx4uRh3BZ+BQNVqOx+TRNdPlY5KRRVwxOQL5wkzYEZnKMY6A==
Date: Mon, 5 Jan 2026 02:30:59 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img, powervr-rogue: Document GE8300
 GPU in Renesas R-Car D3
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
 <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20260104222653.1659382-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9c3t8gm3gacrsr9u4o75s1myppzmoz1n
X-MBO-RS-ID: c84e245cb2454d947dd
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

On 1/4/26 11:26 PM, Niklas Söderlund wrote:
> Document Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
> present in Renesas R-Car R8A77995 D3 SoCs.
> 
> Compared to other R-Car Gen3 SoCs the D3 only have one power domain and
> it is always on. Extend the list of special cases for R8A77995 to
> capture this.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>   .../bindings/gpu/img,powervr-rogue.yaml       | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 86ef68985317..2122380561e4 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -25,6 +25,11 @@ properties:
>                 - renesas,r8a779a0-gpu

> +              - renesas,r8a77995-gpu
                                   ^

Keep the list sorted (995 goes before a0)

> +          - const: img,img-ge8300
> +          - const: img,img-rogue
>         - items:
>             - enum:
>                 - ti,am62-gpu
> @@ -111,6 +116,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - img,img-ge8300
>                 - img,img-ge7800
                             ^^^

Keep the list sorted, 8 > 7 .

>                 - img,img-gx6250
>                 - thead,th1520-gpu
