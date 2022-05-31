Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B86538BFE
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 09:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AF210F035;
	Tue, 31 May 2022 07:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375A910F035
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 07:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1653982389; x=1685518389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yaL7tj+bNCaojD7dpIfu0rRMv3VVPjyGM5oOqum92Nk=;
 b=QVnyyghcNkaMOppQwnCSp0rnBQEMkTk6fWmJHgA52IghXyc6ygALY0Bn
 0Q48HHiI/sCtg0XqoIKnIyXmqb9hS17ktLT8jrADYP5X3k+MsD9UYuASK
 U1lFWy+OU3XScixfcnDHCPaG6YNqH31F1GZCrdKBGi7y8gBXh+86d075g
 sKvRv8YgU2TVny3FBNAW0apj19iPH3vpGqBYYpOsp6DlMuuz7WWUm0/gB
 b8f9jrA3sLdLEtEu7KFmAZVbIpNIDwLTsbGdPUA9P7W3d3mdGjhSBQ4gZ
 5pEBoERHB3eJiA1GDzVeOnsUWj+bynbIXmiV+QmezqRU8qPsnhuprY/eu g==;
X-IronPort-AV: E=Sophos;i="5.91,264,1647298800"; d="scan'208";a="24165816"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 31 May 2022 09:33:06 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 31 May 2022 09:33:06 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 31 May 2022 09:33:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1653982386; x=1685518386;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yaL7tj+bNCaojD7dpIfu0rRMv3VVPjyGM5oOqum92Nk=;
 b=kIF8WOJbl0kUb0M2Uh4HREaUF/WrhIUkRXV+0aGI2mYYBq1O5Ls7uVKw
 qI5naLN2PexiqoopcZbWu6cd3jaD1nf4YsFJZcvYbgU6sZ1Pnrjx9B5kY
 x69E49UZb9eggz6jRKvoP/hrkds6cY70ApY356XdTy9xbLYSEw1MNaVAV
 WQG+zFXQaBFCvAnKJYufZgGi2/qX/ftZV96cWHEfvU3eI7xtRKbuuSLT/
 piKhSySc7FLLencgSxGgR3Llxt+wFYB/4vNSJah2hIDfPmM+F5rjwWVKa
 xv8iFbqqMC/G8RCThG3c/F8QK82lqc2fpCeYyn0Y+H1ZkrXC43pMqSh1x w==;
X-IronPort-AV: E=Sophos;i="5.91,264,1647298800"; d="scan'208";a="24165815"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 31 May 2022 09:33:06 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8564A280004;
 Tue, 31 May 2022 09:33:06 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: (EXT) [PATCH 5/6] dt-bindings: drm/bridge: ti-sn65dsi83: Add
 reset controller documentation
Date: Tue, 31 May 2022 09:33:04 +0200
Message-ID: <5789362.MhkbZ0Pkbq@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220530150548.1236307-6-m.felsch@pengutronix.de>
References: <20220530150548.1236307-1-m.felsch@pengutronix.de>
 <20220530150548.1236307-6-m.felsch@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 robert.foss@linaro.org, dri-devel@lists.freedesktop.org,
 jernej.skrabec@gmail.com, robh+dt@kernel.org,
 laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marco,

Am Montag, 30. Mai 2022, 17:05:48 CEST schrieb Marco Felsch:
> The bridge device can now also be enabled/disabled by an external reset
> controller. So the device now supports either enable/disable by simple
> GPIO or by an Reset-Controller.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml    | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml index
> 7306b9874dc3..eff8360c184e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -35,6 +35,12 @@ properties:
>    vcc-supply:
>      description: A 1.8V power supply (see regulator/regulator.yaml).
> 
> +  resets:
> +    maxItems: 1
> +    description: |
> +      Reset specifier for bridge_en pin. This is required only if the
> brdige_en +      pin is connected to a reset controller.
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports

Maybe it should be added here, that 'resets' is an alternative to 'enable-
gpios' as both are essentially controlling the same pin from the bridge.

Best regards
Alexander


