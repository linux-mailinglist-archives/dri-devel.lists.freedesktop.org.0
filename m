Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9A545410
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 20:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057B112B646;
	Thu,  9 Jun 2022 18:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E986712B646
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 18:24:46 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id k2so3801374ybj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 11:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Om1J1P4rfNxje/5N3K/cXLZVUQSG2BHAt4SwjWydlTY=;
 b=YYPuN5NTr7iQ2zF8DXZCmRX+mvtzQ5srbyOkUnNhp/fHww6bqk9m0dTcuxyLu0GpVI
 M5eBgZeVan+AesZMoxUu7JrXFCi4lK16QSqe3YfYF5y8rwt00oakyjKHVQoaBuX+6lVL
 ehDrnRQYUKoYSJPn4G8P3gK5B0H4b3ZeCzZAk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Om1J1P4rfNxje/5N3K/cXLZVUQSG2BHAt4SwjWydlTY=;
 b=sLPAyPalBYsVebHnORAg0vCpRb87if2lkOnrvm7/XYROsmH/QRfapZukNObmwWaWz8
 mB5JY64VUJBw2tFeO41HT3pcMxXyQ0fqr65uIE3+UTWt2/RrfE9OFIZj5Zc1tSQlJMHr
 3Vrm+t+My5lH5Oh6zdf4yRZeEOpJsMUuC4cf/QvoYs3jlwsYKYW4FO3BmI5V7DXMIQZL
 M8KX3vVtCBgWgX6koB/CF9hRAOs1wiDZzmENDF2ccEjrXtZ8WXpHSOA8AngFjajzmYSF
 DpU1VTKxRnYg/q5SpWciOSm22bR6gGrT4IHR2JCza8DndJJ0uNwVhdAWez9Ke/em5bhd
 kGfA==
X-Gm-Message-State: AOAM530+jB+OqpPevVDCVVMnInl7FNT6fW3UDJsnUs3073fXzihAy9SQ
 UPwKCy/zCZVetcxpCG05K9vVBRwFO9J/vt3+zsAvyg==
X-Google-Smtp-Source: ABdhPJxOcF2XSzpjDlACbf3M67kUcUVbiOUYu+jZcEiQ9+pJ6bPCiNtQ+mRH+nccMcwhVJelujQ71ebD8bS9flCw6/o=
X-Received: by 2002:a25:5e87:0:b0:660:240c:784 with SMTP id
 s129-20020a255e87000000b00660240c0784mr39902806ybb.445.1654799086080; Thu, 09
 Jun 2022 11:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220607190131.1647511-1-pmalani@chromium.org>
 <20220607190131.1647511-5-pmalani@chromium.org>
 <fbc48d41-b2cc-86f6-5f1c-7cfcbdb41e46@linaro.org>
 <YqDXfGa9bugnLFGH@chromium.org>
 <CACeCKaeHocnAuY5D-oVt1fhgRGkNT014RcK3JSe6piKoXNtKCQ@mail.gmail.com>
 <fac58827-5b82-81a2-e782-99056180c0ed@linaro.org>
In-Reply-To: <fac58827-5b82-81a2-e782-99056180c0ed@linaro.org>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 9 Jun 2022 11:24:35 -0700
Message-ID: <CACeCKafA=wTELAWhzHgR5bm6i+qB9swRY7SPhseNBo=fwbaowg@mail.gmail.com>
Subject: Re: [PATCH 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: heikki.krogerus@linux.intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 8, 2022 at 11:41 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/06/2022 23:56, Prashant Malani wrote:
> > On Wed, Jun 8, 2022 at 10:08 AM Prashant Malani <pmalani@chromium.org> wrote:
> >>
> >> Hi Krzysztof,
> >>
> >> Thank you for looking at the patch.
> >>
> >> On Jun 08 11:24, Krzysztof Kozlowski wrote:
> >>> On 07/06/2022 21:00, Prashant Malani wrote:
> >>>> Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
> >>>> alternate mode lane traffic between 2 Type-C ports.
> >>>>
> >>>> Update the binding to accommodate this usage by introducing a switch
> >>>> property.
> >>>>
> >>>> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> >>>> ---
> >>>>  .../display/bridge/analogix,anx7625.yaml      | 56 +++++++++++++++++++
> >>>>  1 file changed, 56 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> >>>> index 35a48515836e..7e1f655ddfcc 100644
> >>>> --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> >>>> +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> >>>> @@ -105,6 +105,26 @@ properties:
> >>>>        - port@0
> >>>>        - port@1
> >>>>
> >>>> +  switches:
> >>>> +    type: object
> >>>> +    description: Set of switches controlling DisplayPort traffic on
> >>>> +      outgoing RX/TX lanes to Type C ports.
> >>>> +
> >>>> +    properties:
> >>>> +      switch:
> >>>
> >>> You allow only one switch with such schema, so no need for "switches"...
> >>
> >> See below comment (summary: we'd like to allow 1 or 2 switches).
> >>>
> >>>> +        $ref: /schemas/usb/typec-switch.yaml#
> >>>> +        maxItems: 2
> >>>
> >>> Are you sure this works? what are you limiting here with maxItems? I
> >>> think you wanted patternProperties...
> >>
> >> Yeah, I might not have used the DT syntax correctly here.
> >> What I'm aiming for is:
> >> "switches" should can contain 1 or 2 "switch" nodes.
> >> 2 is the maximum (limitation of the hardware).
> >>
> >>>
> >>>> +
> >>>> +        properties:
> >>>> +          reg:
> >>>> +            maxItems: 1
> >>>> +
> >>>> +        required:
> >>>> +          - reg
> >>>> +
> >>>> +    required:
> >>>> +      - switch@0
> >>>
> >>> This does not match the property.
> >>>
> >>> You also need unevaluatedProperties:false
> >>
> >> Ack, will update this in the next version.
> >
> > Actually, could you kindly clarify which of the two needs this?
> > "switches" or "switch" ?
> > I interpreted "switch" as requiring it, but I thought it better to confirm.
>
> Depends what do you want to have there. If two properties called
> "switch", then "switches" is ok. However old code had only one property
> thus switches with maximum one switch is a bit weird.
>
> Looking at example you wanted to switch@[01], so you need to use
> patternProperties.

Thanks for the suggestion. I've made the change in v2.

Regards,

-Prashant
