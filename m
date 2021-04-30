Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53336FD62
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 17:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2E56F551;
	Fri, 30 Apr 2021 15:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801546F551
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 15:10:23 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1619795426; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+dVI3NdaeABnN/N1/ZkuDIQzB1RFAa3KmXh7BK9pWbs=;
 b=DcAupB4elIxysnksPVg2UYl0RxcZgVhhkrQ+tIGB/wsLSxueTQPBYuFYI8EttzKcLxXQEDzt
 UT1aMFB2P9/Tm4q1QjYnYYCzWcmShDstm1KMTB9hzSiZyP9iqMCJn69k6kMA3Xn4rqbjC7f2
 UXnASzFGKYS6ZuXghPmcFhUdmDQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 608c1dd9e0e9c9a6b69b8ff1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Apr 2021 15:10:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 501D1C43460; Fri, 30 Apr 2021 15:10:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: rajeevny)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 90E85C433D3;
 Fri, 30 Apr 2021 15:10:15 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 30 Apr 2021 20:40:15 +0530
From: rajeevny@codeaurora.org
To: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
In-Reply-To: <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
 <20210429180435.GA1385465@robh.at.kernel.org>
 <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
Message-ID: <78c4bd291bd4a17ae2a1d02d0217de43@codeaurora.org>
X-Sender: rajeevny@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, "Kristian H.
 Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30-04-2021 02:33, Doug Anderson wrote:
> Hi,
> 
> On Thu, Apr 29, 2021 at 11:04 AM Rob Herring <robh@kernel.org> wrote:
>> 
>> On Mon, Apr 26, 2021 at 11:29:15AM +0530, Rajeev Nandan wrote:
>> > Add bindings for DisplayPort aux backlight driver.
>> >
>> > Changes in v2:
>> > - New
>> >
>> > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
>> > ---
>> >  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
>> >  1 file changed, 49 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
>> > new file mode 100644
>> > index 00000000..0fa8bf0
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
>> > @@ -0,0 +1,49 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: DisplayPort aux backlight driver bindings
>> > +
>> > +maintainers:
>> > +  - Rajeev Nandan <rajeevny@codeaurora.org>
>> > +
>> > +description:
>> > +  Backlight driver to control the brightness over DisplayPort aux channel.
>> > +
>> > +allOf:
>> > +  - $ref: common.yaml#
>> > +
>> > +properties:
>> > +  compatible:
>> > +    const: dp-aux-backlight
>> > +
>> > +  ddc-i2c-bus:
>> > +    $ref: /schemas/types.yaml#/definitions/phandle
>> > +    description:
>> > +      A phandle to the system I2C controller connected to the DDC bus used
>> > +      for the DisplayPort AUX channel.
>> > +
>> > +  enable-gpios:
>> > +    maxItems: 1
>> > +    description: GPIO specifier for backlight enable pin.
>> > +
>> > +  max-brightness: true
>> > +
>> > +required:
>> > +  - compatible
>> > +  - ddc-i2c-bus
>> > +
>> > +additionalProperties: false
>> > +
>> > +examples:
>> > +  - |
>> > +    backlight {
>> > +        compatible = "dp-aux-backlight";
>> > +        ddc-i2c-bus = <&sn65dsi86_bridge>;
>> > +        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
>> 
>> So the DDC bus is connected to a backlight and also a panel? This
>> binding is not reflecting the h/w, but rather what you want for some
>> driver.
>> 
>> There's only one thing here and that's an eDP panel which supports
>> backlight control via DP aux channel. You can figure all that out from
>> the panel's compatible and/or reading the EDID.
>> 
>> You might also be interested in this thread:
>> 
>> https://lore.kernel.org/lkml/YIKsDtjcIHGNvW0u@orome.fritz.box/
> 
> I think Rajeev needs to rework everything anyway as per:
> 
> https://lore.kernel.org/r/87zgxl5qar.fsf@intel.com
> 
> ...but you're right that it makes sense not to model the backlight as
> a separate node in the device tree. The panel driver can handle
> setting up the backlight.
> 
> -Doug

It was not a good idea to create a separate backlight driver and use
ddc-i2c-bus to get access to DP aux. I am working to move the code
to the panel driver and to utilize the new DRM helper functions
(drm_edp_backlight_*) Lyude has added [1].

To use these helper functions, the panel driver should have access to 
the
"struct drm_dp_aux *". The simple-panel has a "ddc-i2c-bus" property
to give the panel access to the DDC bus and is currently being used to
get the EDID from the panel. Can I use the same ddc bus i2c_adapter to 
get
the "struct drm_dp_aux *"?

As per the suggestion [2], I get the "struct drm_dp_aux *" from the
i2c_adapter of ddc bus (maybe I didn't understand the suggestion 
correctly),
and, it turned out, the way I have implemented is not the right way [3].
So, I am afraid to use the same method in the panel driver.


[1] https://lore.kernel.org/dri-devel/871rb5bcf9.fsf@intel.com/
[2] https://www.spinics.net/lists/dri-devel/msg295429.html
[3] 
https://lore.kernel.org/dri-devel/20210426111116.4lc3ekxjugjr3oho@maple.lan/

Thanks,
Rajeev
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
