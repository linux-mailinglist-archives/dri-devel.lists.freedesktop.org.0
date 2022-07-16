Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE62577159
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 22:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4093410E300;
	Sat, 16 Jul 2022 20:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FCA10E0F4
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 09:28:49 +0000 (UTC)
Received: from hillosipuli.retiisi.eu
 (dkwl20tj04snw15cjtflt-3.rev.dnainternet.fi
 [IPv6:2001:14ba:4493:6f40:fec3:d72a:e447:8113])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by meesny.iki.fi (Postfix) with ESMTPSA id C6B68202B9;
 Sat, 16 Jul 2022 12:28:46 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1657963726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p05g2JQKkBK9/C2od8mJWwhH6CARhop8sa56RkQcfW8=;
 b=xJzqQ59ggOobD05ybTWofxUjSPteY0XaFMBRL0WZ3NdAUtFkG5xZmt/UH0cY2lV60qj1Lw
 C25fGruCEEmehrsy70VPDVc+LbXxLFfBsjEtSChqp033zLAo4VIIOyLw4wY5JV0waoxCm3
 1V0jdG6O4Y8P+ViYu4SIoszp0tqCkxo=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 1D7E1634D5E;
 Sat, 16 Jul 2022 12:28:46 +0300 (EEST)
Date: Sat, 16 Jul 2022 12:28:45 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: Use new video interface bus type
 macros in examples
Message-ID: <YtKEzS6j0/45E7tP@valkosipuli.retiisi.eu>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-3-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-3-laurent.pinchart@ideasonboard.com>
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1657963726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p05g2JQKkBK9/C2od8mJWwhH6CARhop8sa56RkQcfW8=;
 b=HE2Vvi2HOVel765S3EHbm8gjv26CEl6v6LhtN1LqPoojWFtL3khNN7hIwFscrDadz1NCTN
 znTHxDtE+qgxfUOR09rfl7QPjOz1QcfLwwqHOLCmKfD1wYoKkt5hxo0lrk9TvjM4q4goZn
 Qsr85Oc9WwuE4V2BRO9foSasb5JGEHk=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1657963726; a=rsa-sha256; cv=none;
 b=EV15RjFtJPTEV21NGwQ8m+XyGp6cjFUKUutDeVdMfmai9HbdEuD/VZsshexAehlRDGsaHr
 G+zxRDggpqZbfPCbNWt9wiovlGFI1jrApV6XXd836m5qwql0sYyeZkuX0KvxOLXeZX9uDI
 FK6K7+A8yQsmL4i5rd/AarioYXJwSVM=
X-Mailman-Approved-At: Sat, 16 Jul 2022 20:16:29 +0000
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, Jun 16, 2022 at 01:14:06AM +0300, Laurent Pinchart wrote:
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT binding examples.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v2:
> 
> - Go back to PARALLEL
> 
> Changes since v1:
> 
> - Rename PARALLEL to BT601
> ---
>  .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 1 +
>  Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml     | 3 ++-
>  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml  | 3 ++-
>  .../devicetree/bindings/media/marvell,mmp2-ccic.yaml          | 3 ++-
>  Documentation/devicetree/bindings/media/microchip,xisc.yaml   | 3 ++-
>  Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml    | 4 +++-
>  6 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> index 35a48515836e..b0e5585f93e2 100644
> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> @@ -118,6 +118,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
>  
>      i2c0 {
>          #address-cells = <1>;

The definition doesn't seem to be used here. Is there a need to include
this?

I could drop this chunk while applying. There's just one trivial change
elsewhere in this patch to make.

-- 
Kind regards,

Sakari Ailus
