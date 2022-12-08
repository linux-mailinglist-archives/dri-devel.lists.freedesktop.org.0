Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19102646B04
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 09:50:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A4610E47C;
	Thu,  8 Dec 2022 08:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E54010E47C
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670489433; x=1702025433;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HS1LXFNFWH8asbrv1/rNtKvQd0Vnd4v/MZSu33SbCIk=;
 b=Dxflhaak844iuXAoW5gQDn5JOqTMYDwT+wHI67OkX27UU63oH1mpQ0Jf
 o8TXsYeb6/ViaPfU3nYRVL5akT0Lm9olFcwHK3pf4p2aS19+tlQF7nugf
 vZFupgNMHxYVaADoanRZBXXKVyunQUwEIADNkkNduwR+v/Ji3jJkNhBmp
 ybhHDPtdOz4remjX69ybwm8hJMBYf+a7POeowdiIYx5sotRcyhjlkfage
 XH+PI/igRQ+ncWmDro1/u9GB1h+qTrYOUIYnbWKAXp4pOu3gQC0enjEfZ
 oBUT1bSTkOkdvYx29cfZE8mgtSMGN3EOcVTBhZNzfIVfKWMRlLU+2hMGZ g==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27830345"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 08 Dec 2022 09:50:31 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 08 Dec 2022 09:50:31 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 08 Dec 2022 09:50:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1670489431; x=1702025431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HS1LXFNFWH8asbrv1/rNtKvQd0Vnd4v/MZSu33SbCIk=;
 b=NxfOcP81VJMhdR3oELxJL8QcPDM5ziReZWTq8ttR/kM1wF6wZr2RdVZE
 bqD1GdPdptGixpHsrRbxrCD1YuFDxot4fBR4y9Bx8DNCeRrEBPy3FxgYz
 5Yye6OERbE60loDKHSu6ka4+hroL/n+1smlUZ2IhDWWijbDC304ZHUygr
 l8TuvErtTF53TsRuDSWugJYUXzAqy6gjtMD/joKMQrnbGja05/ZxYicM/
 PIqDEp0aNq3SncukAi64aeDtz6qW16HLyG+urlFq1vU782Zj9Kv3G91Td
 wFXzlQgiEtqUWj0acxTvmrRo0j5d/BnaZxlwNDH0DVLcwxZ+g76GM9TXT A==;
X-IronPort-AV: E=Sophos;i="5.96,227,1665439200"; d="scan'208";a="27830344"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 08 Dec 2022 09:50:31 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 08D74280071;
 Thu,  8 Dec 2022 09:50:31 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marek Vasut <marex@denx.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: lcdif: Add optional power-domain
Date: Thu, 08 Dec 2022 09:50:26 +0100
Message-ID: <3212302.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <a033d9a3-4bee-d749-9bd9-24a419398d0b@linaro.org>
References: <20221207151400.1572582-1-alexander.stein@ew.tq-group.com>
 <1839665.tdWV9SEqCh@steina-w>
 <a033d9a3-4bee-d749-9bd9-24a419398d0b@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Krzysztof,

Am Donnerstag, 8. Dezember 2022, 09:25:31 CET schrieb Krzysztof Kozlowski:
> On 08/12/2022 06:59, Alexander Stein wrote:
> > Am Mittwoch, 7. Dezember 2022, 17:00:22 CET schrieb Marek Vasut:
> >> On 12/7/22 16:14, Alexander Stein wrote:
> >>> i.MX8MP requires a power-domain for this peripheral to use. Add it as
> >>> an optional property.
> >>> 
> >>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >>> ---
> >>> 
> >>>   Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 3 +++
> >>>   1 file changed, 3 insertions(+)
> >>> 
> >>> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >>> b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml index
> >>> 793e8eccf8b8b..9d9fb5ad587c2 100644
> >>> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >>> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> >>> 
> >>> @@ -52,6 +52,9 @@ properties:
> >>>     interrupts:
> >>>       maxItems: 1
> >>> 
> >>> +  power-domains:
> >>> +    maxItems: 1
> >>> +
> >>> 
> >>>     port:
> >>>       $ref: /schemas/graph.yaml#/properties/port
> >>>       description: The LCDIF output port
> >> 
> >> Should this be required on mx8mp then ?
> > 
> > I'm hesitating to add a required property later on. But I'm okay with
> > both.
> > Rob, Krzysztof: Any preference here? Shall power-domains be made required
> > for fsl,imx8mp-lcdif only?
> 
> I don't know. That's not the question to us, but to someone who knows
> the hardware/datasheet.

I was not talking about the hardware, which needs the power-domain, but the DT 
schema. Sorry to be not specific about this.
Is it okay to add a required property for a compatible later on?

Best regards,
Alexander



