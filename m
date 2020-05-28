Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3081E6B91
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 21:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151576E1F3;
	Thu, 28 May 2020 19:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B9C6E1F3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 19:48:38 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id d1so96952ila.8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 12:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Go6xO5WoC3zEQRJwVmH9bUe++RxJSEnlCwIRvUl4+dQ=;
 b=Gxf241y9rAnfkAw6YuP3JxlO981wL9LtiAP006k1QVc8GCZOLARZL5Bk+XQ9ifr/yQ
 b9UkUqL9pURA+XHp3EDV/JXgqa3CR4cRHnV1EgWPXYdMBh1P4R/k9A89vJ55ngftvJnX
 dDH8FtlcVG+wEFiuZOFZHdNp1RvLQaWNb51NELiN9DlADRyfs1lTP14b2bOhycX5WYgt
 kQbu2L2/N+PB1A5ZoB5Y7IFvAppld0I1pn0kiXHkzSVWrloLrgWf8NPtVttAEwnO4lJj
 VKVRxtnozD5lnmBA29+guE0iAQPgWnJnE5D2f0AWLWce9eVB4nV2s+EXFa4WWGEpYP+U
 bYsw==
X-Gm-Message-State: AOAM532l72Ejoi4tNLKbHy1rRzvhd59dVInue2T/KLNcUfj4qWtaLCVZ
 4xZnrR3c8w8FPPp1hgGDDg==
X-Google-Smtp-Source: ABdhPJxdVc8I3c5Wd+1g7euGl5ed0EkKErorxTkquQmiCvhOLVCyVbgdKy+eSwMN7mVRv2h0Ec4qUQ==
X-Received: by 2002:a92:c809:: with SMTP id v9mr4288575iln.209.1590695318014; 
 Thu, 28 May 2020 12:48:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id y13sm2960819iob.51.2020.05.28.12.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 12:48:16 -0700 (PDT)
Received: (nullmailer pid 568649 invoked by uid 1000);
 Thu, 28 May 2020 19:48:04 -0000
Date: Thu, 28 May 2020 13:48:04 -0600
From: Rob Herring <robh@kernel.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [RFC PATCH 1/6] dt-bindings: display/bridge: Add binding for
 input mux bridge
Message-ID: <20200528194804.GA541078@bogus>
References: <cover.1589548223.git.agx@sigxcpu.org>
 <14a44a664f40584ffa25c1764aab5ebf97809c71.1589548223.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14a44a664f40584ffa25c1764aab5ebf97809c71.1589548223.git.agx@sigxcpu.org>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>, Anson Huang <Anson.Huang@nxp.com>,
 David Airlie <airlied@linux.ie>, Shawn Guo <shawnguo@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Chiras <robert.chiras@nxp.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 03:12:10PM +0200, Guido G=FCnther wrote:
> The bridge allows to select the input source via a mux controller.
> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> ---
>  .../display/bridge/mux-input-bridge.yaml      | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/mux-=
input-bridge.yaml
> =

> diff --git a/Documentation/devicetree/bindings/display/bridge/mux-input-b=
ridge.yaml b/Documentation/devicetree/bindings/display/bridge/mux-input-bri=
dge.yaml
> new file mode 100644
> index 000000000000..4029cf63ee5c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/mux-input-bridge.y=
aml
> @@ -0,0 +1,123 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/mux-input-bridge.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: DRM input source selection via multiplexer

DRM is not a hardware thing.

The graph binding is already designed to support muxing. Generally, =

multiple endpoints on an input node is a mux. So either the device with =

the input ports knows how to select the input, or you just need a =

mux-control property for the port to have some other device implement =

the control.

You could do it like you have below. That would be appropriate if =

there's a separate h/w device controlling the muxing. Say for example =

some board level device controlled by i2c.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
