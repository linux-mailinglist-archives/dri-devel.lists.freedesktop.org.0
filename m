Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D875EA9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 07:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9A46E884;
	Fri, 26 Jul 2019 05:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E0E6E884
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 05:57:08 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id v18so20851935uad.12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 22:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ritHirmxie1YVxX8gsEBGYKgo9674hDWBBrNSNHU6lA=;
 b=qDc3hcGiSPAlusnptShBW3X6ZgUW+cwW1it80gIbJaCTN1KkOAV7xwkqYnM+DnA3Qk
 aXVma387jNnhiUDV6F1dH9CIfywVMnpADPmyLTxMPjT/GTo8V+cME31BNqwkW65P64gc
 27CNcPRAKRb6rn1ODCOP0m4/wqMW0UMq+MPDP/zwTMvrY6p+P6MtxJEgTjZ2wQN7234i
 X/2IGwP1TnuGFixOjzlpue7Fx8EAV6XguT5Ux8fLkOpVcQJy8UC/L/48EEkieTthv4Zh
 LSN05LSnSpwyseXYIqnC270ItPn3Tth1RNX5rWwomt2YTTwkKttR1Ctpz6Z5IyNzHq3+
 Ksyg==
X-Gm-Message-State: APjAAAWXoxPZqyKuqI7Bw/LKRtPV8otQ/IVHkOB8BJW51CgTvm9pMxSg
 Onh3DwENLdurbc/NHWOlSYnfaTCDQY3aRqqdhBnNqp29/Ew=
X-Google-Smtp-Source: APXvYqzYMhqIoJam8Xvkd7XcgGAlGjhpj9bY8DK1N/Fqd8iyTTM4rj/7btyKQ0xCTWBpRKcWG8Ve1eHTPky5aD/JvRQ=
X-Received: by 2002:ab0:66:: with SMTP id 93mr4068238uai.135.1564120627632;
 Thu, 25 Jul 2019 22:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190304125033.28841-1-josef@lusticky.cz>
 <20190708145618.26031-1-josef@lusticky.cz>
 <20190708145618.26031-2-josef@lusticky.cz> <20190724195744.GA22947@bogus>
In-Reply-To: <20190724195744.GA22947@bogus>
From: =?UTF-8?B?Sm9zZWYgTHXFoXRpY2vDvQ==?= <josef@lusticky.cz>
Date: Fri, 26 Jul 2019 07:56:31 +0200
Message-ID: <CAMqqaJFKUfodEf50EuJvCURKS+3pA2mesk4Dt1K-GHZuOh24xA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: panel: Add parallel RGB mode for
 Ilitek ILI9341 panels
To: Rob Herring <robh@kernel.org>
Content-Type: multipart/mixed; boundary="00000000000065ce3d058e8f3608"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lusticky.cz; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ritHirmxie1YVxX8gsEBGYKgo9674hDWBBrNSNHU6lA=;
 b=OZ16Wy3VqClU7qnmMtLfqHy3JNEfEiLqD1tZaDeShgmqyxUHNGIvxBvwZ/Mgfo3J8h
 WLwQ0Q50ShXjHe8XgqCUTZwQDe+qJaKK+sMdgdvLg09NEndmHrkoqebpHgzQ6OWdsjUZ
 ewnC82U+uXYVFDmjCfOUpy56h81LUQkJbKp3N/5ammyJlUBV7v3kieDOyZl+hMqjoANn
 2qfsBKu3OMTkc/Sp35HDTKk3ES2fNJ3v7ntaSA7eqF7r5sAChNoQCf8fFgrJq6SvnlgZ
 w2m+UlkpZ/I2qPyV+mx9t8jr2Zqy5vEcdk/xH7w7S7oYhbpTkPiYdkArWre3bVRrj8Z5
 CmmQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000065ce3d058e8f3608
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rob,
my fault, sorry, backlight should not be required.
I'll fix this in the next patch version.

I'd like to post the DT bindings in the YAML format.
Work-in-progress YAML bindings file is in the attachment,
any comments would be highly appreciated.

Kind regards
Josef

st 24. 7. 2019 v 21:57 odes=C3=ADlatel Rob Herring <robh@kernel.org> napsal=
:
>
> On Mon, Jul 08, 2019 at 04:56:17PM +0200, Josef Lusticky wrote:
> > ILI9341 supports both SPI input mode and parallel RGB input mode.
> > This commit adds parallel RGB input mode bindings.
> >
> > Signed-off-by: Josef Lusticky <josef@lusticky.cz>
> > ---
> >  .../bindings/display/ilitek,ili9341.txt       | 67 ++++++++++++++++---
> >  1 file changed, 56 insertions(+), 11 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/ilitek,ili9341.t=
xt b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > index 169b32e4ee4e..629f38a1d0cd 100644
> > --- a/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > +++ b/Documentation/devicetree/bindings/display/ilitek,ili9341.txt
> > @@ -1,27 +1,72 @@
> >  Ilitek ILI9341 display panels
> >
> > -This binding is for display panels using an Ilitek ILI9341 controller =
in SPI
> > -mode.
> > +This binding is for display panels using an Ilitek ILI9341 controller.
> > +The display panels are supported in the following graphical input mode=
s:
> > +- SPI input mode
> > +     MIPI-DBI Type 3 Option 1 or Option 3 is used to transfer
> > +     commands and graphical data
> > +- parallel RGB input mode
> > +     MIPI-DBI Type 3 Option 1 or Option 3 is used for commands
> > +     MIPI-DPI 18-bit parallel RGB connection is used to transfer
> > +     graphical data
> >
> > -Required properties:
> > -- compatible:        "adafruit,yx240qv29", "ilitek,ili9341"
> > -- dc-gpios:  D/C pin
> > -- reset-gpios:       Reset pin
> > +
> > +SPI input mode:
> >
> >  The node for this driver must be a child node of a SPI controller, hen=
ce
> > -all mandatory properties described in ../spi/spi-bus.txt must be speci=
fied.
> > +all mandatory properties described in spi/spi-bus.txt must be specifie=
d.
> > +
> > +Required properties in SPI input mode:
> > +- compatible:   "adafruit,yx240qv29", "ilitek,ili9341"
> > +- backlight:    phandle of the backlight device attached to the panel
>
> Why is backlight now required?
>
> > +
> > +Optional properties in SPI input mode:
> > +- rotation:     panel rotation in degrees counter clockwise (0,90,180,=
270)
> > +- dc-gpios:     GPIO spec for the D/C pin, see gpio/gpio.txt
> > +- reset-gpios:  GPIO spec for the reset pin, see gpio/gpio.txt
> > +
> > +
> > +Parallel RGB input mode:
> > +
> > +The node for this driver must be a child node of a SPI controller, hen=
ce
> > +all mandatory properties described in spi/spi-bus.txt must be specifie=
d.
> > +
> > +Required properties in parallel RGB input mode:
> > +- compatible:   "displaytech,dt024ctft", "ilitek,ili9341"
> > +- backlight:    phandle of the backlight device attached to the panel
> > +
> > +Optional properties in parallel RGB input mode:
> > +- dc-gpios:     GPIO spec for the D/C pin, see gpio/gpio.txt
> > +- reset-gpios:  GPIO spec for the reset pin, see gpio/gpio.txt
> >
> > -Optional properties:
> > -- rotation:  panel rotation in degrees counter clockwise (0,90,180,270=
)
> > -- backlight: phandle of the backlight device attached to the panel
> > +In parallel RGB input mode,
> > +the device node can contain one 'port' child node with one child
> > +'endpoint' node, according to the bindings defined in
> > +media/video-interfaces.txt. This node should describe panel's video bu=
s.
> >
> > -Example:
> > +
> > +Example in SPI input mode:
> >       display@0{
> >               compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
> >               reg =3D <0>;
> >               spi-max-frequency =3D <32000000>;
> >               dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> >               reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> > +             backlight =3D <&backlight>;
> >               rotation =3D <270>;
> > +     };
> > +
> > +Example in parallel RGB input mode:
> > +     panel@{
> > +             compatible =3D "displaytech,dt024ctft", "ilitek,ili9341";
> > +             reg =3D <0>;
> > +             spi-max-frequency =3D <32000000>;
> > +             dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> > +             reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> >               backlight =3D <&backlight>;
> > +             port {
> > +                     panel_in: endpoint {
> > +                             remote-endpoint =3D <&display_out>;
> > +                     };
> > +             };
> >       };
> > --
> > 2.20.1
> >

--00000000000065ce3d058e8f3608
Content-Type: text/plain; charset="US-ASCII"; name="ilitek,ili9341.txt"
Content-Disposition: attachment; filename="ilitek,ili9341.txt"
Content-Transfer-Encoding: base64
Content-ID: <f_jyjou8by0>
X-Attachment-Id: f_jyjou8by0

IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAolWUFNTCAxLjIKLS0tCiRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZGlzcGxheS9wYW5lbC9pbGl0ZWssaWxpOTM0MS55
YW1sIwokc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKCnRpdGxlOiBJbGl0ZWsgSUxJOTM0MSBkaXNwbGF5IHBhbmVscwoKbWFpbnRhaW5lcnM6CiAg
LSBKb3NlZiBMdXN0aWNreSA8am9zZWZAbHVzdGlja3kuY3o+CgpkZXNjcmlwdGlvbjogfAogIFRo
aXMgYmluZGluZyBpcyBmb3IgZGlzcGxheSBwYW5lbHMgdXNpbmcgYW4gSWxpdGVrIElMSTkzNDEg
Y29udHJvbGxlci4KICBUaGUgZGlzcGxheSBwYW5lbHMgYXJlIHN1cHBvcnRlZCBpbiB0aGUgZm9s
bG93aW5nIGdyYXBoaWNhbCBpbnB1dCBtb2RlczoKICBTUEkgaW5wdXQgbW9kZQogICAgTUlQSS1E
QkkgVHlwZSAzIE9wdGlvbiAxIG9yIE9wdGlvbiAzIGlzIHVzZWQgdG8gdHJhbnNmZXIKICAgIGNv
bW1hbmRzIGFuZCBncmFwaGljYWwgZGF0YQogIFBhcmFsbGVsIFJHQiBpbnB1dCBtb2RlCiAgICBN
SVBJLURCSSBUeXBlIDMgT3B0aW9uIDEgb3IgT3B0aW9uIDMgaXMgdXNlZCBmb3IgY29tbWFuZHMK
ICAgIE1JUEktRFBJIDE4LWJpdCBwYXJhbGxlbCBSR0IgY29ubmVjdGlvbiBpcyB1c2VkIHRvIHRy
YW5zZmVyCiAgICBncmFwaGljYWwgZGF0YQoKYWxsT2Y6CiAgLSAkcmVmOiAvc2NoZW1hcy9zcGkv
c3BpLWNvbnRyb2xsZXIueWFtbCMKCnByb3BlcnRpZXM6CiAgY29tcGF0aWJsZToKICAgIGl0ZW1z
OgogICAgICAtIGNvbnN0OiBhZGFmcnVpdCx5eDI0MHF2MjkKCiAgYmFja2xpZ2h0OiB0cnVlCiAg
cmVzZXQtZ3Bpb3M6IHRydWUKICBkYy1ncGlvczogdHJ1ZQogIHJvdGF0aW9uOiB0cnVlCiAgcG9y
dDogdHJ1ZQoKYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCgpyZXF1aXJlZDoKICAtIGNvbXBh
dGlibGUKICAtIGJhY2tsaWdodAoKRXhhbXBsZSBpbiBTUEkgaW5wdXQgbW9kZToKCWRpc3BsYXlA
MHsKCQljb21wYXRpYmxlID0gImFkYWZydWl0LHl4MjQwcXYyOSIsICJpbGl0ZWssaWxpOTM0MSI7
CgkJcmVnID0gPDA+OwoJCXNwaS1tYXgtZnJlcXVlbmN5ID0gPDMyMDAwMDAwPjsKCQlkYy1ncGlv
cyA9IDwmZ3BpbzAgOSBHUElPX0FDVElWRV9ISUdIPjsKCQlyZXNldC1ncGlvcyA9IDwmZ3BpbzAg
OCBHUElPX0FDVElWRV9ISUdIPjsKCQliYWNrbGlnaHQgPSA8JmJhY2tsaWdodD47CgkJcm90YXRp
b24gPSA8MjcwPjsKCX07CgpFeGFtcGxlIGluIHBhcmFsbGVsIFJHQiBpbnB1dCBtb2RlOgoJcGFu
ZWxAewoJCWNvbXBhdGlibGUgPSAiZGlzcGxheXRlY2gsZHQwMjRjdGZ0IiwgImlsaXRlayxpbGk5
MzQxIjsKCQlyZWcgPSA8MD47CgkJc3BpLW1heC1mcmVxdWVuY3kgPSA8MzIwMDAwMDA+OwoJCWRj
LWdwaW9zID0gPCZncGlvMCA5IEdQSU9fQUNUSVZFX0hJR0g+OwoJCXJlc2V0LWdwaW9zID0gPCZn
cGlvMCA4IEdQSU9fQUNUSVZFX0hJR0g+OwoJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKCQlw
b3J0IHsKCQkJcGFuZWxfaW46IGVuZHBvaW50IHsKCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZGlz
cGxheV9vdXQ+OwoJCQl9OwoJCX07Cgl9Owo=
--00000000000065ce3d058e8f3608
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--00000000000065ce3d058e8f3608--
