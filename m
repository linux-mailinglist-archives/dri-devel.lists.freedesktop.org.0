Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FF1BC02CF
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 07:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550B910E046;
	Tue,  7 Oct 2025 05:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UOlbLACa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E6910E046
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 05:13:23 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3ee15505cdeso4501312f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 22:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759814001; x=1760418801; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1pS3XDiQK8f8eyTQX//zdVzSc4GWTW1yqVKROF9NUcQ=;
 b=UOlbLACade2b3XdYW+LpO+q/ficr5+GR0i0iPqQvhMeXOoF2IXjxrktf0+ctIBa6fX
 GNYHEeVWO6FW0kXk/BQTkCToH9wkO3NyP8Qk1QJhTLWTfUPjZgWO+r99gQMIlEMadSjA
 umu3N9bU4byQIoLnyUMOrazpoB4A+pKrIZQtp69/YucsJekF+EZa/vkz8/Jj561NefBl
 Zl9KvxuEbMRJdm/z7kfd3j5oRTbr8KK9dwCmBVZd2yw5OXYYONbLHQytofOHCeBl+A0+
 Ppt8Xjhtw7kIgDQSCzChhrsBvVMhMINAOUez80ummDyGMQ1qzyB6VgZMKfkNKlsqxvJf
 DMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759814001; x=1760418801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1pS3XDiQK8f8eyTQX//zdVzSc4GWTW1yqVKROF9NUcQ=;
 b=v8JUKjzrKsT17R81tGkjRQOdvcFomliVEUWlr83891DvNzjFUag4D4zSy9XRK8wnqs
 as+LysgQpn4xYgnRl1dbX8efuBmZK+nGG7YXun7iatonQ+KC1Eq4xVPNM6mWaT2JX0A3
 7NQZiSSxuEJtRAcmRE2qWu/Rt1LQCbNiKZUWxvFxQouvOvTSmC1Yc9H8NMLHlsjRHZj4
 hCSocEY2ul3r/qoAlrm3fH/FTAQFAGbiMSLUq2CUR4dvcPRYLonaqsoMFH4yssHZYqAr
 dRcMk+QAYosjUGbenuJai1YKZ4a+999YKpI4ivmCqxtGBF7eT56HOKMz5Yaq9EqBl7SN
 2HnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwjWC+dfoowHI7BS5ifJNt6MkoqY0PImJQzX8VDUlIr98ZRpvLC2VlHQMnOPL8zyMjnsH8bXametE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCpc93TAWaug+kGL6pfkjmSgKc608QF/tUthnDDGGo06/ehlgI
 ivJIOEutVm24uDYcW2J+ZzIBS/xrXQk9Fr2Kt3+TF18zMeJJ7IFtzlSHxfPdIfkQqnI+/z0JIjb
 yQM5aSLDT5j/oCeS8okz9eE24E6+FXNk=
X-Gm-Gg: ASbGncvorcwD3nVXkGTxDZmXshLpy0kQSQ9Ulc39iSkck+UACOtpmt9ytwXETOuukLF
 zK1B0tcCUANDRjchODQc1R8VdUvw9jOVT0OACArkOT0Iyz4r36zBDyfdPqY89jtJfYw1ttjoNHh
 Ll6C1Gq0NoMO783ZXmJGuT1UBWukKU3Qk7KSfhU2fOYUN1Vuny8rxiqS/OVVBgsiOh2vT3//9Xb
 bm44CYMQnh6bkF+v14Pc6IxD1TXVDOY
X-Google-Smtp-Source: AGHT+IGV0xtcmM1zsg2OwGtKvJdRiIXrdxpv8K4QHttJAzVgt0D6HfXUccFjYZoOM3q6VTY6zRPYzZjolHquEvhvO7E=
X-Received: by 2002:a05:6000:26d1:b0:3ec:db87:ff53 with SMTP id
 ffacd0b85a97d-425829bf154mr1325418f8f.12.1759814001232; Mon, 06 Oct 2025
 22:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-21-clamor95@gmail.com>
 <20251002015244.GA2836647-robh@kernel.org>
 <CAPVz0n1By+akzp0t+GfF9nRzZ27NwYEikXxQ+=M=W2NEGpLNFw@mail.gmail.com>
 <20251006203148.GA523657-robh@kernel.org>
In-Reply-To: <20251006203148.GA523657-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 7 Oct 2025 08:13:10 +0300
X-Gm-Features: AS18NWDkvx6agTucL7VNWr7MeuduCABFIlrIhwhvyaKckkFjZfLI9EvskSqNc_g
Message-ID: <CAPVz0n3CZTa8eV=gsJdpQ=yQ9sFbVd_vHAEpESP=Y6pE1=cLUw@mail.gmail.com>
Subject: Re: [PATCH v3 20/22] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
To: Rob Herring <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
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

=D0=BF=D0=BD, 6 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 23:31=
 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 02, 2025 at 08:14:22AM +0300, Svyatoslav Ryhel wrote:
> > =D1=87=D1=82, 2 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 0=
4:52 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Sep 25, 2025 at 06:16:46PM +0300, Svyatoslav Ryhel wrote:
> > > > Document CSI HW block found in Tegra20 and Tegra30 SoC.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  .../display/tegra/nvidia,tegra20-csi.yaml     | 135 ++++++++++++++=
++++
> > > >  1 file changed, 135 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/display/tegra=
/nvidia,tegra20-csi.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia=
,tegra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,=
tegra20-csi.yaml
> > > > new file mode 100644
> > > > index 000000000000..817b3097846b
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra2=
0-csi.yaml
> > > > @@ -0,0 +1,135 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-cs=
i.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: NVIDIA Tegra20 CSI controller
> > > > +
> > > > +maintainers:
> > > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - nvidia,tegra20-csi
> > > > +      - nvidia,tegra30-csi
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks: true
> > > > +  clock-names: true
> > > > +
> > > > +  avdd-dsi-csi-supply:
> > > > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#nvidia,mipi-calibrate-cells":
> > > > +    description:
> > > > +      The number of cells in a MIPI calibration specifier. Should =
be 1.
> > > > +      The single cell specifies an id of the pad that need to be
> > > > +      calibrated for a given device. Valid pad ids for receiver wo=
uld be
> > > > +      0 for CSI-A; 1 for CSI-B; 2 for DSI-A and 3 for DSI-B.
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > +    const: 1
> > >
> > > Sorry I didn't bring this up before, but is this ever not 1? If it is
> > > fixed, then you don't really need the property. I prefer it just be
> > > fixed rather than getting a bunch of vendor specific #foo-cells.
> > >
> >
> > This is not an introduction of property, such property already exists
> > in Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mipi=
.yaml
> > and is used in multiple device trees. As I have told before, in case
> > of Tegra30 and Tegra20 CSI block combines mipi calibration function
> > and CSI function, in Tegra114+ mipi calibration got a dedicated
> > hardware block which is already supported. This property here is used
> > to align with mipi-calibration logic used by Tegra114+
>
> Okay.
>
> You will have to continue to tell me again if my past questions are not
> addressed in the commit message. A review only last week was 100+
> patches ago. Don't expect I'll remember nor go re-read prior versions.
>

That is not a problem, I did not meant to offend you. I will add info
into commit message.

> Ideally, we don't define the type of a property more than once. So this
> should really first be moved to its own shared schema that's referenced
> here and in the original user. Then it is perfectly clear reading the
> patches that this is not a new property.
>

I am not sure that creating a dedicated shared schema for a single
properly which is used by 2 schemas worth it, though, if it is
preferred, may the refactoring be done in followups later?

> Rob
