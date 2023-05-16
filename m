Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B725A7060D2
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B0D10E3BE;
	Wed, 17 May 2023 07:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C085710E175
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 22:13:19 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-51b33c72686so10248382a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 15:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684275199; x=1686867199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=deLfvcQ8xa6CGUhVXRhGKunzIPsoCAcNdYd8Dsf32jM=;
 b=cnRk6WTCmn7+02bJP06xojBUtFVAapIW8EBusy6jRtOAT6EtdBpWwOJR9b8slQU26J
 u4Yl3zSl5LPNX/vA6TQzHKcc/tM4bvGcbV9rpX9voRSJg5Bxnzu5MJI5E2tRZ4mlV8jZ
 qkV6PJETsXUiWE3ZcyAcKKhj99G/D/723PIUstPKQqT8RfuY9vaP7KecxQqG/DMQMoqY
 Sc+p7lP19ygaZutb+W100Trgktn7r9ziYcwCliq5SQfLQW7pGj4uB3BO1VGbDePkterP
 oTpTymNr/8vayPrlGXiQAKkZUNa+GqgeWwUk2UixHygCYFdpNRQ5K+fk1dQikQ7yR8nS
 3Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684275199; x=1686867199;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=deLfvcQ8xa6CGUhVXRhGKunzIPsoCAcNdYd8Dsf32jM=;
 b=FQSgZymc2T90T0Qy9w02y69Uc+YYGWp3WPnqsDV2FFLmS/fXK4gSuDEPU56n5DkTtB
 bSBtRa/A+t7v2/Ly/t3DxpR6y5u9FLH9eZiDD2Hf8MAoOSFjFmWOHeCrobgud1SRpXpi
 UP54AxmZnHmGlicVUtb8e6cCpH7ighTK4TaDQixjP2bhETN5r0qmMBJ/+0cSaCWmRDZh
 8254xYTMg1W2XZTDa7Opwp8SE3dvITuDtXYJn6kL4hvH7MuPrA/oJUXlVtvYFUDWCu0e
 jyRXB487mgUTC5S5JC+MMV7KuhQeTf1lN10q2o4ohqEnAxSgqFEKvpn7VGF39mgHpdz8
 9SNA==
X-Gm-Message-State: AC+VfDzwzx62TAYRDYJB+NhULNbjIXVFXpU5QOze+RK0QEluLxf9GZLp
 iHlIlYEyyVkcNdfcsJbH0nkz7Z//GDLtkVQdlk0=
X-Google-Smtp-Source: ACHHUZ7QHvqhBmf6DE62EnZvVmHwt/V7NlzlJIjAlLypBO6QGP0Uf8LSkmhLsqmTYyjEvvF0N8BPhjOVQ/rZKQqDVj4=
X-Received: by 2002:a17:90a:b297:b0:24d:ff56:f8c1 with SMTP id
 c23-20020a17090ab29700b0024dff56f8c1mr39160380pjr.13.1684275198705; Tue, 16
 May 2023 15:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
In-Reply-To: <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Wed, 17 May 2023 00:13:06 +0200
Message-ID: <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 17 May 2023 07:08:54 +0000
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, thank you for your time to review this patch and sorry for not
addressing all of the concerns, it was done unintentionally. This is
my first contribution to the Linux kernel and it is quite a process.
I have run those two scripts and haven't received any errors I have
latest master cloned so I will check what I did wrong.

The thing I would like to get approval on before I try anything else
is the name 'panel-mipi-dsi-bringup':

> Still wrong filename. You did not respond to my previous comments, so I
don't really understand what's this.
>
> Judging by compatible, this should be fannal,c3004.yaml
>
> If not, explain please.
>
> Missing user of the bindings - driver or DTS. Please sent patches togethe=
r as patchset.


I wasn't sure how to name it and this name seemed fit. I'm not sure
how to be concise about this, but here is the full story as to why I
have done that:

I got a task to enable panel for which working driver wasn't
available. I have started testing raydium driver and modifying parts
of it until I got it working.
Driver was modified quite a lot, new functions, macros and structures
were added which resulted in a new driver.
Therefore I have made a simple driver which I have submitted for a
review which will probably be rejected now due tomany reasons I have
noticed after sending it:
https://lore.kernel.org/lkml/CAO9szn03msW6pu37Zws5EaFGL10rjp9ugPdCuDvOPuQRU=
72gVQ@mail.gmail.com/T/

While talking with manufacturers of the panel I have figured out that
they aren't that familiar with the Linux kernel.
They had previously only enabled  it on bare metal (PLA?) and provided
me with the initialization sequences. Initialization sequences are hex
values sent over MIPI DSI to initialize panel controller.
Initialization sequences sometimes also require delays after certain
commands and for different panels it can be very different.
I believe I have simplified it so that someone can follow comments
inside of the driver and try to enable mipi dsi panel by copy pasting
initialization code from bare metal system and doing minor
modifications.
Since I have targeted this at people who need to enable their panels
for the first time name seemed okay. I thought that since there is
panel-simple.yml that panel-mipi-dsi-bringup.yml would be acceptable
name.

Best regards,
Paulo


uto, 16. svi 2023. u 17:57 Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> napisao je:
>
> On 16/05/2023 15:09, Paulo Pava=C4=8Di=C4=87 wrote:
> > Add dt-bindings documentation for panel-mipi-dsi-bringup which currentl=
y
> > supports fannal,c3004 panel. Also added fannal to vendor-prefixes.
>
> Thank you for your patch. There is something to discuss/improve.
>
> >
> > v2 changelog:
>
> Please put changelog after ---
>
> Missing user of the bindings - driver or DTS. Please sent patches
> together as patchset.
>
>
>
> >   - revised driver title, now describes purpose
> >   - revised description, now describes hw
> >   - revised maintainers, now has only 1 mail
> >   - removed diacritics from commit/commit author
> >   - properties/compatible is now enum
> >   - compatible using only lowercase
> >   - revised dts example
> >   - modified MAINTAINERS in this commit (instead of driver commit)
> >   - dt_bindings_check checked yml
> >   - checkpatch warning fixed
> >
> > Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> > ---
> >  .../display/panel/panel-mipi-dsi-bringup.yaml | 54 +++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> >  MAINTAINERS                                   |  6 +++
> >  3 files changed, 62 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringup.=
yaml
>
> Still wrong filename. You did not respond to my previous comments, so I
> don't really understand what's this.
>
> Judging by compatible, this should be fannal,c3004.yaml
>
> If not, explain please.
>
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi=
-dsi-bringup.yaml
> > b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bringu=
p.yaml
> > new file mode 100644
> > index 000000000000..c9e2b545657e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-br=
ingup.yaml
> > @@ -0,0 +1,54 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dsi-bringu=
p.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MIPI DSI Bringup Panel Porting Bindings
>
> Drop Bindings. I don't understand what is "Porting" in the terms of
> hardware. If it these are bindings for Panel, please write here proper
> hardware.
>
> > +
> > +description: |
> > +  MIPI DSI Bringup Panel porting bindings to be used for a collection =
of panels
>
> I have no clue what is "Bringup panel". Is it technical term for some
> type of panels?
>
> > +  from different manufacturers which don't require backlight control f=
rom the
> > +  driver and have a single reset pin which is required to be passed as=
 an
> > +  argument.
>
> Drop "driver"
>
> > +
> > +maintainers:
> > +  - Paulo Pavacic <pavacic.p@gmail.com>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +
>
> Drop blank line.
>
> > +  compatible:
> > +    enum:
> > +      # compatible must be listed in alphabetical order, ordered by co=
mpatible.
> > +      # The description in the comment is mandatory for each compatibl=
e.
>
> Drop above comment.
>
> > +
> > +        # Fannal 480x800 panel
> > +      - fannal,c3004
> > +
> > +  reg: true
> > +  reset-gpios: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reset-gpios
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    //example on IMX8MM where GPIO pin 9 is used as a reset pin
>
> This is a friendly reminder during the review process.
>
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
>
> Thank you.
>
> I asked to drop the comment.
>
> > +    mipi_dsi@32e10000 {
>
> dsi {
>
> There is no way it was correct in current form.
>
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.
>
> > +        panel@0 {
> > +            compatible =3D "fannal,c3004";
> > +            reg =3D <0>;
> > +            pinctrl-0 =3D <&pinctrl_mipi_dsi_rst>;
> > +            pinctrl-names =3D "default";
> > +            reset-gpios =3D <&gpio1 9 GPIO_ACTIVE_LOW>;
> > +        };
> > +    };
> > +...
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 82d39ab0231b..f962750f630a 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -462,6 +462,8 @@ patternProperties:
> >      description: Facebook
> >    "^fairphone,.*":
> >      description: Fairphone B.V.
> > +  "^fannal,.*":
> > +    description: Fannal Electronics Co., Ltd
> >    "^faraday,.*":
> >      description: Faraday Technology Corporation
> >    "^fastrax,.*":
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e0ad886d3163..46f988ee60bd 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6566,6 +6566,12 @@ T:    git git://anongit.freedesktop.org/drm/drm-=
misc
> >  F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-s=
pi.yaml
> >  F:    drivers/gpu/drm/tiny/panel-mipi-dbi.c
> >
> > +DRM DRIVER FOR MIPI DSI BRINGUP
> > +M:    Paulo Pavacic <pavacic.p@gmail.com>
> > +S:    Maintained
> > +C:    mipi-dsi-bringup:matrix.org
>
> Missing protocol. See explanation of C: entry at the beginning.
>
> > +F:    Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-b=
ringup.yaml
> > +
> >  DRM DRIVER FOR MSM ADRENO GPU
> >  M:    Rob Clark <robdclark@gmail.com>
> >  M:    Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Best regards,
> Krzysztof
>


--=20
Lijep pozdrav,
Paulo
