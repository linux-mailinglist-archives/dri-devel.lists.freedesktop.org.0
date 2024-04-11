Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2668A8A099A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8CC10E2F7;
	Thu, 11 Apr 2024 07:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shruggie-ro.20230601.gappssmtp.com header.i=@shruggie-ro.20230601.gappssmtp.com header.b="0LiH31wF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCD210EF00
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 07:23:49 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-516dc51bb72so6276328e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 00:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20230601.gappssmtp.com; s=20230601; t=1712820227; x=1713425027;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dkOVgTaaGrXLtVM87ktxrc8mZTfhRT2o4/E/F6KN6Bk=;
 b=0LiH31wFWtw1JfwfKuTYmq6duox4udLG0n0+kvdRTtnAB3J9qwUD+O6WxeCtg+PEQY
 lq4HZ0ZVwnagHMguid4k8AzaapQs2z2Bg6Z2nvjuuIvwOgILzvlmcjqe8/eetb4imPUC
 yZKb8e50/Vzcmg+KBsF0f9PBV9ttt+iqiJ4GidJdIUISqa0wYix0QNxSMbCIWtEo+DAE
 nJ4UkgIb4dhYiSSdroar1ZxOmOQtG9baeALGKnOeZKtrBcI0t3kEEv4S8b8JJhJRxl79
 SEzNRHyXhYIrNyVPSoOWTAvNNCuVXnlnRnfsCBrsfoIBzbZwNetRam3vr4Y8jjo35ov3
 DyCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712820227; x=1713425027;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dkOVgTaaGrXLtVM87ktxrc8mZTfhRT2o4/E/F6KN6Bk=;
 b=hXNLZ7jXrWvagLqFxdhdwI46x/rX+zh5IXzYn2wy8sHOX3vmh2TXz7r/c/OZO1sDtn
 xvN7LWAQajH0KkRB2mcxqdcbC6BdSQvxUfWziqBNe5Fwt99isN2uRSoIlegJWjIWZ12F
 vVWDIEUPxYZn8KXp1d1OxEGdxyBVQrqVCdcMGoOvvc+DkPEs5uIyYDNUsa/By5UqD9CC
 ooN1Leaxa3BUNdDWyTN2b7a3OuyMe7aSWWjkMDPwxGCYgwriZO3YsqGsfXAWUjQVr3s9
 Xvuz7TY7PHLCL7aEnyAjMXaeM/xDkpn4sEnVCPieLIrFCtgDIucgruddTC8TsrdeJbuq
 tjEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUJuOel32FnzyR2+Uzjdvv023d2j3cb7rrX84M7NTufKIxSV2rH+IGQO2YlaYtRYAzjB0++hmCloRZIHUhH4kCzygBSuDZWWnkryUPoTU5
X-Gm-Message-State: AOJu0Yw+UzuvQL8BGdlaMWSBUJRzMgmyKbfxZHGHDRzC4QgGIrhJx3/F
 8vAxAsIrdZ9s90ZPgsq7Y6ZUQaSfPI04E2UcFmG0KDxdzjXMbkntFStJd80wGqiVw3G0BKTpVm8
 c1JFUpy/cxpWzAjrKZxFQs8z4oc459ApjdE6GyQ==
X-Google-Smtp-Source: AGHT+IFZZUKJ4M2JhpqzsUa3DBvNjlIu3bgNrsSmIxv09/CKGpbc9Zg/QoI/y4VRWj7pcSaPz1WFPMmYuLejmaOVLVY=
X-Received: by 2002:a19:f70b:0:b0:513:b90f:f4dd with SMTP id
 z11-20020a19f70b000000b00513b90ff4ddmr2683370lfe.49.1712820226865; Thu, 11
 Apr 2024 00:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240402105925.905144-1-alex@shruggie.ro>
 <20240402105925.905144-2-alex@shruggie.ro>
 <dxm3js6qpcw3n4duid4vmhnkxacmzgq4rnvpbdx62pcn34ybzc@q57pst7lyumf>
In-Reply-To: <dxm3js6qpcw3n4duid4vmhnkxacmzgq4rnvpbdx62pcn34ybzc@q57pst7lyumf>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Thu, 11 Apr 2024 10:23:35 +0300
Message-ID: <CAH3L5QosgOBTYgyHUcstNqh+JMBW93j+dk2JuDhdz1=Sfj8i_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: display: bridge: lt8912b: document
 'lontium, pn-swap' property
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, adrien.grassein@gmail.com, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com, 
 marius.muresan@mxt.ro, irina.muresan@mxt.ro
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sun, Apr 7, 2024 at 11:31=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Apr 02, 2024 at 01:59:25PM +0300, Alexandru Ardelean wrote:
> > On some HW designs, it's easier for the layout if the P/N pins are swap=
ped.
> > The driver currently has a DT property to do that.
> >
> > This change documents the 'lontium,pn-swap' property.
> >
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >  .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,l=
t8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt89=
12b.yaml
> > index 2cef252157985..3a804926b288a 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.=
yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.=
yaml
> > @@ -24,6 +24,12 @@ properties:
> >      maxItems: 1
> >      description: GPIO connected to active high RESET pin.
> >
> > +  lontium,pn-swap:
> > +    description: Swap the polarities of the P/N pins in software.
> > +      On some HW designs, the layout is simplified if the P/N pins
> > +      are inverted.
> > +    type: boolean
> > +
>
> I'd like to point out the standard `lane-polarities` property defined at
> Documentation/devicetree/bindings/media/video-interfaces.yaml. You can
> define and use it for the corresponding endpoint in the lt8912b schema.
>

Ohhh.
Interesting :)
Many thanks for pointing this out.
This will make things much easier.
Will do a V2 with this in a week or two.
I'm traveling now.

Thanks
Alex



> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >
> > --
> > 2.44.0
> >
>
> --
> With best wishes
> Dmitry
