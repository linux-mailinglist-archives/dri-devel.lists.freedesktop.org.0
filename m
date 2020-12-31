Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AB12E7FFA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Dec 2020 13:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A93890AD;
	Thu, 31 Dec 2020 12:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDD2890AD
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 12:45:09 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id 143so16177392qke.10
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Dec 2020 04:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=iE7HfAMBj6YL/aCkaObWpORKemTN/YDsqiL7M2VeFuw=;
 b=r/PveFJ5usPFvNVzKrd186mPcRq3WrqqtM6hshs5UpwOqIQjtGz1Z0Dc9yWRbgyiqy
 ph6qYaD3QJTAqNjkGQROUPxZ+h4gYmyB69PI6oaLOqXdHur4tOnN+SuoP9V/hSkaMUsq
 V0CbX4tq/yAmEIBnYJQh43IrmXoR3nPJxglvnc4qi+khq7FsnLzOrknV55tMFKyfrLek
 vVkbEuesoQ4QrM8rBiKs2qhmTNtVKFgVckG0psvf79kQHC4h0QAyDP7rkKqYf5VMXg74
 y9FVZi8MhgDUI/Js/mmb9pivDDg2czOX5iFVIMEnE1Rt9WUT/yEZFqmDJ4eeNgUEgNcx
 O81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=iE7HfAMBj6YL/aCkaObWpORKemTN/YDsqiL7M2VeFuw=;
 b=lZyD3DDfqQSXOzHqe1xeegtJfdO8L7hIn+zOA3R9YrmoPbqHfE/WSIfOF55kyjNEmA
 lDY2h6OnSy0VTyEa/3CFp48QrcZ2HhNbNBZ7ii6J84y/v5X1DHqf+S2ZEU5YVda7pbN/
 eZiAlr0nDaZ2x2IwXJ7nUERASNKpJmbZbEcoSXF94VIKFX8p2rOqRHmqqdW4OfDoaQcT
 MpGDFkh0fvDha0VyDnWK/CMO61zcqyYJ9zhMZx2e9/TwRokNAZttYkEVz20Cdv7h0YnK
 R/inJrUyWPExSK6UmDTZ87tWABlMX3tYMZ4fBt17GAHafdRRj2yal0CvanVcSGCNi8Bk
 9Pmw==
X-Gm-Message-State: AOAM533CtZBaDlDixvfI7etcQhguO7T3EP/F3x2PKOYnnBL9Hmzod7OP
 4lG0QI1YsicH/eRdF+1ia3KVwEi2llOfkWrfIDsv4IfzB3NgDg==
X-Google-Smtp-Source: ABdhPJxzKwlpzS+6MdrKlTwucIQus87BizVbl1MXyP+5KncnhmXvWKwWZFBv8EYOvQRGqmjmK03UVWktU28hqfNdowY=
X-Received: by 2002:ae9:e10d:: with SMTP id g13mr57382414qkm.444.1609418707736; 
 Thu, 31 Dec 2020 04:45:07 -0800 (PST)
MIME-Version: 1.0
From: Sriram G <mgsram@gmail.com>
Date: Thu, 31 Dec 2020 18:14:59 +0530
Message-ID: <CAKJXnF-D_hTmtQJka1VTjnsswyYucPojhsBHsbk2q48zaZJFFg@mail.gmail.com>
Subject: drm bridge for dual dsi
To: dri-devel@lists.freedesktop.org
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
Content-Type: multipart/mixed; boundary="===============0828332141=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0828332141==
Content-Type: multipart/alternative; boundary="0000000000005e9b1d05b7c1fe6a"

--0000000000005e9b1d05b7c1fe6a
Content-Type: text/plain; charset="UTF-8"

Hello,
I am trying to develop a bridge driver for a Serializer (DSI Peripheral)
that has two DSI Ports with the primary control bus being I2C. The host is
MediaTek MT2172 SoC (Compatible with MT8173). I defined the device tree
referring to example 5 in mipi-dsi-bus[1].

However the configuration does not work. The issue I am facing is that
drm_bridge_attach returns EBUSY for the second DSI (dsi1). This is because
the bridge is already attached to another device (dsi0). This seems to be
inline with the concept of crtc --> encoder --> bridge -> connector. i.e.
there is 1-1 relationship. But seems contradictory to the device tree
layout.

I looked up all the existing examples but none seemed to match my use case.
I considered the following options

1) Modify drm_bridge to keep up to n (<= 4) downstream devices. The idea is
to have something like the following ( please excuse the representation)

crtc1 --> encoder1 -->\                         / - - >connector1
                                    \   -> bridge - >/
                                    /                       \
crtc2 --> encoder2 -->/                         \ - - >connector2

The issue with this approach is, it is plainly incorrect based on my
understanding

2) Define a second bridge in the device tree with may be a dummy <reg> and
connect the endpoint of dsi1_out to an endpoint within this bridge. This
seems counter-intuitive as actually there is just one bridge device.

I am personally leaning towards approach 1. Any suggestions? Any examples
that you can point me to?

Thanks,
Sriram

[1]
https://www.kernel.org/doc/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt

--0000000000005e9b1d05b7c1fe6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<div>I am trying to develop a bridge driver fo=
r a Serializer (DSI Peripheral) that has two DSI Ports with the primary con=
trol bus being I2C. The host is MediaTek MT2172 SoC (Compatible with MT8173=
). I defined the device tree referring to example 5 in mipi-dsi-bus[1].=C2=
=A0</div><div><br></div><div>However the configuration does not work. The i=
ssue I am facing is that drm_bridge_attach returns EBUSY for the second DSI=
 (dsi1). This is because the bridge is already attached to another device (=
dsi0). This seems to be inline with the concept of crtc --&gt; encoder --&g=
t; bridge -&gt; connector. i.e. there is 1-1 relationship. But seems contra=
dictory to the device tree layout.</div><div><br></div><div>I looked up all=
 the existing examples but none seemed to match my use case. I considered t=
he following options</div><div><br></div><div>1) Modify drm_bridge to keep =
up to n (&lt;=3D 4) downstream devices. The idea is to have something like =
the following ( please excuse the representation)</div><div><br></div><div>=
crtc1 --&gt; encoder1 --&gt;\=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ - -=C2=A0&gt;connector1</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \=C2=A0 =C2=A0-&gt=
; bridge - &gt;/<br></div><div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\=C2=A0</div><div>crtc2 --&gt; encoder2 --&gt;/=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\ - -=C2=A0&gt;connector2</div><div><br></div><div>The issue w=
ith this approach is, it is plainly incorrect based on my understanding=C2=
=A0</div><div>=C2=A0</div><div></div></div><div>2) Define a second bridge i=
n the device tree with may be a dummy &lt;reg&gt; and connect the endpoint =
of dsi1_out to an endpoint within this bridge. This seems counter-intuitive=
 as actually there is just one bridge device.</div><div><br></div><div>I am=
 personally leaning towards approach 1. Any suggestions? Any examples that =
you can point me to?=C2=A0 =C2=A0=C2=A0</div><div><br></div><div>Thanks,=C2=
=A0<br>Sriram</div><div><br></div><div>[1]=C2=A0<a href=3D"https://www.kern=
el.org/doc/Documentation/devicetree/bindings/display/mipi-dsi-bus.txt">http=
s://www.kernel.org/doc/Documentation/devicetree/bindings/display/mipi-dsi-b=
us.txt</a></div></div>

--0000000000005e9b1d05b7c1fe6a--

--===============0828332141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0828332141==--
