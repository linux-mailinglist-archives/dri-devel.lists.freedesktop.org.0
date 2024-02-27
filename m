Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401CF86981E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 15:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFCC10E5F1;
	Tue, 27 Feb 2024 14:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e7zrkFUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3E610E5F1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 14:29:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F090CCE18A7;
 Tue, 27 Feb 2024 14:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB05C43390;
 Tue, 27 Feb 2024 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709044153;
 bh=BeuKeRmCI8fl+4Mky6qTDE0ESLxkqayEq8heDHUciIc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e7zrkFUJjNkuT6ejQss+PGilg6MNPyI006Dx1xx8Zoe39qoMrNhJei7Ymxa34PjBb
 XXEnchbRee8ptxfWLoZirWVOzrypkJuJN831n7y8aYviicaZZkbm+K+6LgaO8GRodf
 axaBwr1hpp/O4zsmtbMqRFCMz0fc/Bskw7Pa1KxBm8uKJbKWG3qPPaTTAVv2M1bfVm
 ZEc1BIqE6o2uzkwBPWVH3HjI46Kt9VBq12B5U+pPIDmsPZW7eVb2W4vmdytNSbU8P6
 hTbFCfJ7AxhuU5WdnavbGLC8XrL90TYMhcDVVgjnjns8L6ETTmUknj8su/EcURMCGE
 ia+RFHnjoLtnA==
Date: Tue, 27 Feb 2024 08:29:11 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UGF3ZcWC?= Anikiel <panikiel@google.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, airlied@gmail.com,
 akpm@linux-foundation.org, conor+dt@kernel.org, daniel@ffwll.ch,
 dinguyen@kernel.org, hverkuil-cisco@xs4all.nl,
 krzysztof.kozlowski+dt@linaro.org,
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, chromeos-krk-upstreaming@google.com,
 ribalda@chromium.org
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
Message-ID: <20240227142911.GB3863852-robh@kernel.org>
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
 <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
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

On Mon, Feb 26, 2024 at 11:59:42AM +0100, Paweł Anikiel wrote:
> On Mon, Feb 26, 2024 at 10:13 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 21/02/2024 17:02, Paweł Anikiel wrote:
> > > The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> > > Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > > capture and Multi-Stream Transport. The user guide can be found here:
> > >
> > > https://www.intel.com/programmable/technical-pdfs/683273.pdf
> > >
> > > Signed-off-by: Paweł Anikiel <panikiel@google.com>
> > > ---
> > >  .../devicetree/bindings/media/intel,dprx.yaml | 160 ++++++++++++++++++
> > >  1 file changed, 160 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > > new file mode 100644
> > > index 000000000000..31025f2d5dcd
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > > @@ -0,0 +1,160 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Intel DisplayPort RX IP
> > > +
> > > +maintainers:
> > > +  - Paweł Anikiel <panikiel@google.com>
> > > +
> > > +description: |
> > > +  The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> > > +  Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > > +  capture and Multi-Stream Transport.
> > > +
> > > +  The IP features a large number of configuration parameters, found at:
> > > +  https://www.intel.com/content/www/us/en/docs/programmable/683273/23-3-20-0-1/sink-parameters.html
> > > +
> > > +  The following parameters have to be enabled:
> > > +    - Support DisplayPort sink
> > > +    - Enable GPU control
> > > +  The following parameters' values have to be set in the devicetree:
> > > +    - RX maximum link rate
> > > +    - Maximum lane count
> > > +    - Support MST
> > > +    - Max stream count (only if Support MST is enabled)
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: intel,dprx-20.0.1
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  intel,max-link-rate:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: Max link rate configuration parameter
> >
> > Please do not duplicate property name in description. It's useless.
> > Instead explain what is this responsible for.
> >
> > Why max-link-rate would differ for the same dprx-20.0.1? And why
> > standard properties cannot be used?
> >
> > Same for all questions below.
> 
> These four properties are the IP configuration parameters mentioned in
> the device description. When generating the IP core you can set these
> parameters, which could make them differ for the same dprx-20.0.1.
> They are documented in the user guide, for which I also put a link in
> the description. Is that enough? Or should I also document these
> parameters here?

Use the standard properties: link-frequencies and data-lanes. Those go 
under the port(s) because they are inheritly per logical link.

Rob
