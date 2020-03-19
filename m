Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAE318B197
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 11:36:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFF66E128;
	Thu, 19 Mar 2020 10:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413A66E128
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 10:36:42 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id e8so1680342ilc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jByhry3gs2H5qXvZC0UkGfNm9a2QynZUOXNZT5iWXPU=;
 b=LrhUCrty6VTjteyrFkLT7oftaJdH0uJD6Q0eFmNpFZhLmrcMUjPIENPiH/VahRSJWE
 gyY7COYRnuM+V0sVs2XAi7UpAOkwh7RI/2fzxeAfteP2aK4lKMp/PBGmtEIuaBwy67n7
 2ko6h3Owylut1BfFwiR+NmZB+QvKBGExgfATY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jByhry3gs2H5qXvZC0UkGfNm9a2QynZUOXNZT5iWXPU=;
 b=iwSjCXJasYwyyO75k1d9cE3HbffyS1Ojm0rFJK95vfP5RDVQnVrKSWcInprCp8yKh5
 ehA2mqVhj5pwz8AJ0NGyIaySGKHeBFaL/frpXXzJIJck2koNFIgwQByULZ6vou0BFlzS
 W4pGAAKALppVzRW4T+/jURYUk3uOxFqJBPVc1mGMTcpTn2JAJ3ve21uMimJcA7MaDi/H
 ORdFn1iqTTrCi+AKgIwJxtXzlEHEXN/A6i4/kHDK7Hqurvs28nu5YkC3xibOIMCmFfEr
 PPuKI3ZjvSIx4fHAkXVxpgEGSK1UHcksoLerrtIUDYkBOAs+MrKcm6GPpNHvXRzeGTPM
 vzMA==
X-Gm-Message-State: ANhLgQ2Kn03mNDxkc2ag/JqnITyKLmJZrZYsHBodvdA3n1N1Ou1Vlvqm
 PRILgN3V1/tPdvYhxbQ4X4oy76mD8io+vlqLYEMmow==
X-Google-Smtp-Source: ADFU+vtUIa7Up2vK9a1UDtKtiFK1yVGwE7V/lc6dlLy2fPPUu+x6KfsLr3DI3JqtxeKHg9FokDpkfS2gY2/i2Lc5+pk=
X-Received: by 2002:a92:77c2:: with SMTP id s185mr1238038ilc.297.1584614201515; 
 Thu, 19 Mar 2020 03:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200318171003.5179-1-jagan@amarulasolutions.com>
 <20200318185713.GA28092@ravnborg.org>
In-Reply-To: <20200318185713.GA28092@ravnborg.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 19 Mar 2020 16:06:30 +0530
Message-ID: <CAMty3ZAjmu+h7XTyTUfge3kXFE=a=1iFm7MjR6DYnQnZ615fOg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: Convert feiyang,
 fy07024di26a30d to DT schema
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Thu, Mar 19, 2020 at 12:27 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Jagan.
>
> On Wed, Mar 18, 2020 at 10:40:01PM +0530, Jagan Teki wrote:
> > Convert the feiyang,fy07024di26a30d panel bindings to DT schema.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Thanks for the resend.
>
> Please fix so the two bindings uses panel-common.yaml.

Is is because few of the bindings in this panel are similar to
panel-common.yaml?

>
> And then only properties specific for this binding shall have a
> description.
>
> See below - please fix both bindings and resend.
>
>         Sam
>
> > ---
> > Changes for v2:
> > - fix dt_binding_check
> >
> >  .../display/panel/feiyang,fy07024di26a30d.txt | 20 -------
> >  .../panel/feiyang,fy07024di26a30d.yaml        | 57 +++++++++++++++++++
> >  2 files changed, 57 insertions(+), 20 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
> > deleted file mode 100644
> > index 82caa7b65ae8..000000000000
> > --- a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.txt
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -Feiyang FY07024DI26A30-D 7" MIPI-DSI LCD Panel
> > -
> > -Required properties:
> > -- compatible: must be "feiyang,fy07024di26a30d"
> > -- reg: DSI virtual channel used by that screen
> > -- avdd-supply: analog regulator dc1 switch
> > -- dvdd-supply: 3v3 digital regulator
> > -- reset-gpios: a GPIO phandle for the reset pin
> > -
> > -Optional properties:
> > -- backlight: phandle for the backlight control.
> > -
> > -panel@0 {
> > -     compatible = "feiyang,fy07024di26a30d";
> > -     reg = <0>;
> > -     avdd-supply = <&reg_dc1sw>;
> > -     dvdd-supply = <&reg_dldo2>;
> > -     reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
> > -     backlight = <&backlight>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> > new file mode 100644
> > index 000000000000..f292c57a5bd6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/feiyang,fy07024di26a30d.yaml
> > @@ -0,0 +1,57 @@
> > +# SPDX-License-Identifier: (GPL-2.0+ OR X11)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/feiyang,fy07024di26a30d.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Feiyang FY07024DI26A30-D 7" MIPI-DSI LCD Panel
> > +
> > +maintainers:
> > +  - Jagan Teki <jagan@amarulasolutions.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: feiyang,fy07024di26a30d
> > +
> > +  reg:
> > +    description: DSI virtual channel used by that screen
> reg is already described elsewhere so no description.
> Thus is becomes:
>
>     reg: true

Look like reg didn't describe in panel-common.yaml

Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
