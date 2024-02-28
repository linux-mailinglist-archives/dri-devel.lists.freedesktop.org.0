Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27D86B6D4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 19:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D406610E255;
	Wed, 28 Feb 2024 18:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nsyyGS/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7568E10E298
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 18:09:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9A40ECE18CD;
 Wed, 28 Feb 2024 18:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA29C43394;
 Wed, 28 Feb 2024 18:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709143792;
 bh=jN9QlXDJ15ZeBxgujDKHhTa1Kz6iYVY1KYcwaimXXaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nsyyGS/WvV4jVM3ehxt3V6KfTNRP8EcWiGgtsg0f2AWTq4Nxb5qxw4rnxVyUFUIdc
 v4e3WtScH8Hi6B3X7anWWARgs1z2X4c19G2Ea+z5Fq58EXKHKT43LldtMyLyZAGekY
 65RAmdz65emTnc8LB6WCjL90hvjnqJqruhyI/+kfpcQkmX+xBLzzRPfhcqG3+fyHZ8
 /GE14H0VPUGMZEsDGEr5RTX89WHdBGt3sutbgQcmvZh0f+fRGCyBjjdshqiZ1yACQi
 aSNKjrlg3px5uuRRmcsqsR9H+h4hCgZedWmnjmFiZ1ydTR432ryWe7Lub73/j8oyOD
 L8E6i4xc4keeQ==
Date: Wed, 28 Feb 2024 12:09:50 -0600
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
Message-ID: <20240228180950.GA392372-robh@kernel.org>
References: <20240221160215.484151-1-panikiel@google.com>
 <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org>
 <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
 <20240227142911.GB3863852-robh@kernel.org>
 <CAM5zL5pXu5sbzCHY_BrCJ7eZj-p9n0tCo6CmuTqUpvniTrqWJg@mail.gmail.com>
 <324f7b6e-c72c-40aa-afe6-779345c2eade@linaro.org>
 <CAM5zL5oJSHxJK4QWsr2X23g-cN6G54VhGfuwHhMJ9rNu6+gZ=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM5zL5oJSHxJK4QWsr2X23g-cN6G54VhGfuwHhMJ9rNu6+gZ=w@mail.gmail.com>
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

On Wed, Feb 28, 2024 at 02:09:33PM +0100, Paweł Anikiel wrote:
> On Wed, Feb 28, 2024 at 1:18 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 28/02/2024 12:05, Paweł Anikiel wrote:
> > > On Tue, Feb 27, 2024 at 3:29 PM Rob Herring <robh@kernel.org> wrote:
> > >>
> > >> On Mon, Feb 26, 2024 at 11:59:42AM +0100, Paweł Anikiel wrote:
> > >>> On Mon, Feb 26, 2024 at 10:13 AM Krzysztof Kozlowski
> > >>> <krzysztof.kozlowski@linaro.org> wrote:
> > >>>>
> > >>>> On 21/02/2024 17:02, Paweł Anikiel wrote:
> > >>>>> The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> > >>>>> Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > >>>>> capture and Multi-Stream Transport. The user guide can be found here:
> > >>>>>
> > >>>>> https://www.intel.com/programmable/technical-pdfs/683273.pdf
> > >>>>>
> > >>>>> Signed-off-by: Paweł Anikiel <panikiel@google.com>
> > >>>>> ---
> > >>>>>  .../devicetree/bindings/media/intel,dprx.yaml | 160 ++++++++++++++++++
> > >>>>>  1 file changed, 160 insertions(+)
> > >>>>>  create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
> > >>>>>
> > >>>>> diff --git a/Documentation/devicetree/bindings/media/intel,dprx.yaml b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > >>>>> new file mode 100644
> > >>>>> index 000000000000..31025f2d5dcd
> > >>>>> --- /dev/null
> > >>>>> +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > >>>>> @@ -0,0 +1,160 @@
> > >>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > >>>>> +%YAML 1.2
> > >>>>> +---
> > >>>>> +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
> > >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>>>> +
> > >>>>> +title: Intel DisplayPort RX IP
> > >>>>> +
> > >>>>> +maintainers:
> > >>>>> +  - Paweł Anikiel <panikiel@google.com>
> > >>>>> +
> > >>>>> +description: |
> > >>>>> +  The Intel Displayport RX IP is a part of the DisplayPort Intel FPGA IP
> > >>>>> +  Core. It implements a DisplayPort 1.4 receiver capable of HBR3 video
> > >>>>> +  capture and Multi-Stream Transport.
> > >>>>> +
> > >>>>> +  The IP features a large number of configuration parameters, found at:
> > >>>>> +  https://www.intel.com/content/www/us/en/docs/programmable/683273/23-3-20-0-1/sink-parameters.html
> > >>>>> +
> > >>>>> +  The following parameters have to be enabled:
> > >>>>> +    - Support DisplayPort sink
> > >>>>> +    - Enable GPU control
> > >>>>> +  The following parameters' values have to be set in the devicetree:
> > >>>>> +    - RX maximum link rate
> > >>>>> +    - Maximum lane count
> > >>>>> +    - Support MST
> > >>>>> +    - Max stream count (only if Support MST is enabled)
> > >>>>> +
> > >>>>> +properties:
> > >>>>> +  compatible:
> > >>>>> +    const: intel,dprx-20.0.1
> > >>>>> +
> > >>>>> +  reg:
> > >>>>> +    maxItems: 1
> > >>>>> +
> > >>>>> +  interrupts:
> > >>>>> +    maxItems: 1
> > >>>>> +
> > >>>>> +  intel,max-link-rate:
> > >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> > >>>>> +    description: Max link rate configuration parameter
> > >>>>
> > >>>> Please do not duplicate property name in description. It's useless.
> > >>>> Instead explain what is this responsible for.
> > >>>>
> > >>>> Why max-link-rate would differ for the same dprx-20.0.1? And why
> > >>>> standard properties cannot be used?
> > >>>>
> > >>>> Same for all questions below.
> > >>>
> > >>> These four properties are the IP configuration parameters mentioned in
> > >>> the device description. When generating the IP core you can set these
> > >>> parameters, which could make them differ for the same dprx-20.0.1.
> > >>> They are documented in the user guide, for which I also put a link in
> > >>> the description. Is that enough? Or should I also document these
> > >>> parameters here?
> > >>
> > >> Use the standard properties: link-frequencies and data-lanes. Those go
> > >> under the port(s) because they are inheritly per logical link.
> > >
> > > The DP receiver has one input interface (a deserialized DP stream),
> > > and up to four output interfaces (the decoded video streams). The "max
> > > link rate" and "max lane count" parameters only describe the input
> > > interface to the receiver. However, the port(s) I am using here are
> > > for the output streams. They are not affected by those parameters, so
> > > I don't think these properties should go under the output port(s).
> > >
> > > The receiver doesn't have an input port in the DT, because there isn't
> > > any controllable entity on the other side - the deserializer doesn't
> > > have any software interface. Since these standard properties
> > > (link-frequencies and data-lanes) are only defined in
> > > video-interfaces.yaml (which IIUC describes a graph endpoint), I can't
> > > use them directly in the device node.
> >
> > DT describes the hardware, so where does the input come? From something,
> > right? Regardless if you have a driver or not. There is dp-connector
> > binding, if this is physical port.
> 
> Yes, it is a physical port. I agree adding a DT node for the physical
> DP input connector would let us add link-frequencies to the input port
> of the receiver.
> 
> However, dp-connector seems to be a binding for an output port - it's
> under schemas/display/connector, and DP_PWR can be a power supply only
> for an output port (looking at the dp-pwr-supply property). Also, the
> driver for this binding is a DRM bridge driver (display-connector.c)
> which would not be compatible with a v4l2 (sub)device.

So then we should add 'dp-input-connector' because they are different. 
When we haven't defined connectors, properties of the connector have 
been shoved in whatever node is associated with a connector like you 
have done. That works for a while, but then becomes unmanageable. DP on 
USB-C connectors for example.

OTOH, maybe your use here is niche enough to not be worth the trouble. 
Depends if we see the need for video input connectors in general.

Rob
