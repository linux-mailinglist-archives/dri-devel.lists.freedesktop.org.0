Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3EB37B1A5
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 00:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4453B89DB8;
	Tue, 11 May 2021 22:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28C689DB8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 22:34:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BEEC5A5;
 Wed, 12 May 2021 00:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1620772439;
 bh=KzHx1Q72g1Ph0hy3qlmj9H4gxvGEMdk3xBf/U2vswNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mlIdKyd0YYwFWiJ5nRc1b+qPije5a5tmd1SvlsC15Xo2aJgRfdeFTyxS9M+Cj5dTh
 ZF7l22wgGEtqSdN2h6MuAkWaBDUWjgEeoRdH265GsOMGoLKpL0oWqc4yMIbzfNdfxg
 L1je65f0KGFsc8tmjGbLI02Bz3VqygMVfhSVM+TM=
Date: Wed, 12 May 2021 01:33:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: rajeevny@codeaurora.org
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
Message-ID: <YJsGToxCpE4I+8MC@pendragon.ideasonboard.com>
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
 <20210429180435.GA1385465@robh.at.kernel.org>
 <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
 <78c4bd291bd4a17ae2a1d02d0217de43@codeaurora.org>
 <CAD=FV=XW90L6or8NKA-Rjjp3s3fRno1xSkD+X0PA1rTyeKgpMw@mail.gmail.com>
 <c867b2e59e90899e6c1648e06f5f9cd2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c867b2e59e90899e6c1648e06f5f9cd2@codeaurora.org>
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
Cc: mkrishn@codeaurora.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rajeevny,

On Tue, May 11, 2021 at 11:41:57PM +0530, rajeevny@codeaurora.org wrote:
> On 01-05-2021 03:08, Doug Anderson wrote:
> > On Fri, Apr 30, 2021 at 8:10 AM <rajeevny@codeaurora.org> wrote:
> >> On 30-04-2021 02:33, Doug Anderson wrote:
> >> > On Thu, Apr 29, 2021 at 11:04 AM Rob Herring <robh@kernel.org> wrote:
> >> >> On Mon, Apr 26, 2021 at 11:29:15AM +0530, Rajeev Nandan wrote:
> >> >> > Add bindings for DisplayPort aux backlight driver.
> >> >> >
> >> >> > Changes in v2:
> >> >> > - New
> >> >> >
> >> >> > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> >> >> > ---
> >> >> >  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
> >> >> >  1 file changed, 49 insertions(+)
> >> >> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> >> >> >
> >> >> > diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> >> >> > new file mode 100644
> >> >> > index 00000000..0fa8bf0
> >> >> > --- /dev/null
> >> >> > +++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> >> >> > @@ -0,0 +1,49 @@
> >> >> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> >> > +%YAML 1.2
> >> >> > +---
> >> >> > +$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
> >> >> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> >> > +
> >> >> > +title: DisplayPort aux backlight driver bindings
> >> >> > +
> >> >> > +maintainers:
> >> >> > +  - Rajeev Nandan <rajeevny@codeaurora.org>
> >> >> > +
> >> >> > +description:
> >> >> > +  Backlight driver to control the brightness over DisplayPort aux channel.
> >> >> > +
> >> >> > +allOf:
> >> >> > +  - $ref: common.yaml#
> >> >> > +
> >> >> > +properties:
> >> >> > +  compatible:
> >> >> > +    const: dp-aux-backlight
> >> >> > +
> >> >> > +  ddc-i2c-bus:
> >> >> > +    $ref: /schemas/types.yaml#/definitions/phandle
> >> >> > +    description:
> >> >> > +      A phandle to the system I2C controller connected to the DDC bus used
> >> >> > +      for the DisplayPort AUX channel.
> >> >> > +
> >> >> > +  enable-gpios:
> >> >> > +    maxItems: 1
> >> >> > +    description: GPIO specifier for backlight enable pin.
> >> >> > +
> >> >> > +  max-brightness: true
> >> >> > +
> >> >> > +required:
> >> >> > +  - compatible
> >> >> > +  - ddc-i2c-bus
> >> >> > +
> >> >> > +additionalProperties: false
> >> >> > +
> >> >> > +examples:
> >> >> > +  - |
> >> >> > +    backlight {
> >> >> > +        compatible = "dp-aux-backlight";
> >> >> > +        ddc-i2c-bus = <&sn65dsi86_bridge>;
> >> >> > +        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
> >> >>
> >> >> So the DDC bus is connected to a backlight and also a panel? This
> >> >> binding is not reflecting the h/w, but rather what you want for some
> >> >> driver.
> >> >>
> >> >> There's only one thing here and that's an eDP panel which supports
> >> >> backlight control via DP aux channel. You can figure all that out from
> >> >> the panel's compatible and/or reading the EDID.
> >> >>
> >> >> You might also be interested in this thread:
> >> >>
> >> >> https://lore.kernel.org/lkml/YIKsDtjcIHGNvW0u@orome.fritz.box/
> >> >
> >> > I think Rajeev needs to rework everything anyway as per:
> >> >
> >> > https://lore.kernel.org/r/87zgxl5qar.fsf@intel.com
> >> >
> >> > ...but you're right that it makes sense not to model the backlight as
> >> > a separate node in the device tree. The panel driver can handle
> >> > setting up the backlight.
> >> 
> >> It was not a good idea to create a separate backlight driver and use
> >> ddc-i2c-bus to get access to DP aux. I am working to move the code
> >> to the panel driver and to utilize the new DRM helper functions
> >> (drm_edp_backlight_*) Lyude has added [1].
> >> 
> >> To use these helper functions, the panel driver should have access to the
> >> "struct drm_dp_aux *". The simple-panel has a "ddc-i2c-bus" property
> >> to give the panel access to the DDC bus and is currently being used to
> >> get the EDID from the panel. Can I use the same ddc bus i2c_adapter to get
> >> the "struct drm_dp_aux *"?
> >> 
> >> As per the suggestion [2], I get the "struct drm_dp_aux *" from the
> >> i2c_adapter of ddc bus (maybe I didn't understand the suggestion correctly),
> >> and, it turned out, the way I have implemented is not the right way [3].
> >> So, I am afraid to use the same method in the panel driver.
> >> 
> >> 
> >> [1] https://lore.kernel.org/dri-devel/871rb5bcf9.fsf@intel.com/
> >> [2] https://www.spinics.net/lists/dri-devel/msg295429.html
> >> [3]
> >> https://lore.kernel.org/dri-devel/20210426111116.4lc3ekxjugjr3oho@maple.lan/
> > 
> > So it's definitely up to maintainers, not me. ...but I guess I would
> > have expected something like a new property called "ddc-aux-bus". Then
> > you'd have to create a new API call called something like
> > "of_find_ddc_aux_adapter_by_node()" that would allow you to find it.
> 
> To implement the first suggestion, I can think of the following way
> to get the "struct drm_dp_aux" in the panel_simple_probe function:
> 
> - Create a new panel-simple DT property "ddc-aux-bus", a phandle to the
> platform device that implements the AUX channel.
> 
> - Create a global list of drm_dp_aux in drm_dp_helper.c. Initialize list 
> head
> in drm_dp_aux_init(), add the drm_dp_aux onto the list in 
> drm_dp_aux_register().
> Similarly, remove the drm_dp_aux from list in drm_dp_aux_unregister().
> 
> - Create a new function of_drm_find_dp_aux_by_node() to get the expected
> drm_dp_aux from this global list.
> 
> Please let me know your views on this implementation.
> 
> Below is the summary of the changes in drm dp helper:
> 
> ---
> 
> // drm_dp_helper.h
> 
> struct drm_dp_aux {
> 	...
> 	struct list_head list;
> 	...
> }
> 
> // drm_dp_helper.c
> 
> static DEFINE_MUTEX(dp_aux_lock);
> static LIST_HEAD(dp_aux_list);
> 
> static void drm_dp_aux_add(struct drm_dp_aux *aux)
> {
>      mutex_lock(&dp_aux_lock);
>      list_add_tail(&aux->list, &dp_aux_list);
>      mutex_unlock(&dp_aux_lock);
> }
> 
> static void drm_dp_aux_remove(struct drm_dp_aux *aux)
> {
>      mutex_lock(&dp_aux_lock);
>      list_del_init(&aux->list);
>      mutex_unlock(&dp_aux_lock);
> }
> 
> #ifdef CONFIG_OF
> struct drm_dp_aux *of_drm_find_dp_aux_by_node(struct device_node *np)
> {
>      struct drm_dp_aux *aux;
>      mutex_lock(&dp_aux_lock);
> 
>      list_for_each_entry(aux, &dp_aux_list, list) {
>          if (aux->dev->of_node == np) {
>              mutex_unlock(&dp_aux_lock);
>              return aux;
>          }
>      }
> 
>      mutex_unlock(&dp_aux_lock);
>      return NULL;
> }
> EXPORT_SYMBOL(of_drm_find_dp_aux_by_node);
> #endif
> 
> 
> int drm_dp_aux_init(struct drm_dp_aux *aux)
> {
>      INIT_LIST_HEAD(&aux->list);
>      ...
> }
> 
> int drm_dp_aux_register(struct drm_dp_aux *aux)
> {
>      ...
>      drm_dp_aux_add(aux);
> 
>      return 0;
> }
> 
> void drm_dp_aux_unregister(struct drm_dp_aux *aux)
> {
>      drm_dp_aux_remove(aux);
>      ...
> }

Overall this seems like a good approach, but there's one unanswered
question: what happens if drm_dp_aux_unregister() is called while a
panel holds a reference to it ? The drm_dp_aux instances likely need to
be reference-counted.

> > I guess an alternate way to solve this (I'm not totally sure whether
> > it's better or worse) would be to add a function that would walk up
> > the chain of parent bridges and ask them for a pointer to the aux bus.
> > I definitely haven't thought it all the way through, but I'd imagine
> > something like drm_bridge_chain_get_ddc_aux(). This is _probably_
> > better than adding the "ddc-aux-bus" property but it assumes that the
> > aux bus is provided by one of our parents. Hrm, looking at this
> > briefly, though, I'm not sure how to do it. It doesn't seem possible
> > to get the parent bridges from the panel structure. Even if you assume
> > that your parent is wrapping you with a panel_bridge it still doesn't
> > seem possible?
> > 
> > This probably needs more drm-expertise.

-- 
Regards,

Laurent Pinchart
