Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9DAB3B390
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 08:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E59E10EB4D;
	Fri, 29 Aug 2025 06:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dKEKQJ0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C3710EB4D
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 06:42:44 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3ceb830dd58so528981f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 23:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756449762; x=1757054562; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWSNy/JRqLkLoJxnOEcFDdNep+6HQzRpiS/0aFPTMrQ=;
 b=dKEKQJ0JJViZE8NqRmxX2ONycAk99WSr3ilgTxil5Xs+wbLBDKUoee2J7Cyi/h7alw
 tQi8901JnTgIesN/4rtMLW01rQ2QsfpIroRpPwxSuUa4KLLTujmE4oZD2XkXi/rJlJcV
 PMJf9c+e1cB0ReAX9usjJSBrWeSlhHGogvThJvt9s6sY0saZTG3ZMWBqxAyv3B5Q3gMg
 MZNr5Zs0OOpz5OiBltlZqYqEyKDLVrZl+XCr1Sqka85ISrFGLHCz7X+ISpSJjniU5stE
 7JvvsIi+NkIFcXVAlfNj1rvjFtqIZE5RFqycFKfCLocASg32QAdy4ZGKKuHjVjRazS3F
 NxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756449762; x=1757054562;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QWSNy/JRqLkLoJxnOEcFDdNep+6HQzRpiS/0aFPTMrQ=;
 b=lpXdIsxk/LlvXV+nJPa7Srn1K6tcj3+oE0ua8FwljiA1Psrp+hsjAOlm8U45KOVHUh
 gXBwkW+W4rF3cY21ESfuh1LEq9bw6hhLIDVxMdLdnsbqcbNRjJXjVNvpNOdEkm4l5OVn
 p1CEGFS22jHGREhDQJNgBGfpCjYQIfNCNPgyR8UvtgnL77U1ozOTshVIoVsXfW8GACSs
 qENdR1qyEzcJl4NiWH4Acbs+VIXyqledOUkMJcEXPPtuX0/kNNo5wUdV1zl2u2C5kupS
 WNGseDZDvPM+BGEFYQ0oYZBKCbgd1MpBEO5yXjzJmnQAPBpzHCZZNjkvNf+KtrKexNWH
 kFwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgt/5eG8l1hgIt5hNHDQhu6X9ncyKcuGt17XPrIT9C3ekOJFF9cYK5l3Q+3bkr0hPhtdQCUee8rOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEsmHOzP+Dv5pWvgvnBULu4bdRwNsKsYAmIypjZYr5tp/nhjt0
 H0AEyubFhwHbBeyQ6aIGRqi2ognMFoQ7bHycJz6d3C6pjlEqx+YkyHgzPolM/utatb1pbOacrkY
 EOYCw6A7tULVOqWLigo5JMAMqny0gWCw=
X-Gm-Gg: ASbGncsRfId1NU770n5NmMvDMML70Oqx+a1pPJQwOWfruzN7kehA/HT8lezyuQMK2hO
 gnBw2+W7HxCuqs++TaK8F9gYII1fKzMstfC4y1u91of+82dIgZZuZEB5rlK5Of3cpKh7BlLZNLW
 dI8To6xau6oB4o1pdpDPocPTInrj1pDD04x0+yfG8erSWQN1/ZG+evHl15xENj2LJw7WGM2a8Rs
 7pwecAJ
X-Google-Smtp-Source: AGHT+IHjRL9sOfRC6KlJXM91TuBldUFCTWN+6IKyuNVfAGqivuS+QA4CO7lbMYhZ/89R1DWqkhTaNLnSJ6XXeiMAmew=
X-Received: by 2002:a05:6000:40ca:b0:3d0:c6bf:60c6 with SMTP id
 ffacd0b85a97d-3d0c6bf6478mr507752f8f.13.1756449761912; Thu, 28 Aug 2025
 23:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-5-clamor95@gmail.com>
 <20250819202722.GA1264491-robh@kernel.org>
In-Reply-To: <20250819202722.GA1264491-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 Aug 2025 09:42:30 +0300
X-Gm-Features: Ac12FXxicf5syu3ZrQDe1liim-jpvbuNbb6FjdElmnqfyMSBMVU7aVm-Nae8-uI
Message-ID: <CAPVz0n1CN_rXu6EvgiMBeCvpOK6Ep96pax+naRha-=9THBifZQ@mail.gmail.com>
Subject: Re: [PATCH v1 04/19] dt-bindings: display: tegra: document Tegra30 VIP
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org, 
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
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

=D0=B2=D1=82, 19 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 23:2=
7 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Aug 19, 2025 at 03:16:16PM +0300, Svyatoslav Ryhel wrote:
> > Parallel VI interface found in Tegra30 is exactly the same as Tegra20 h=
as.
>
> That's not what the compatible schema says. 'exactly the same' implies a
> fallback to whatever it is exactly the same as.
>
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml    | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-vip.yaml
> > index 14294edb8d8c..39e9b3297dbd 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
p.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
p.yaml
> > @@ -13,6 +13,7 @@ properties:
> >    compatible:
> >      enum:
> >        - nvidia,tegra20-vip
> > +      - nvidia,tegra30-vip
> >

Rob, may I use this:

properties:
  compatible:
    one0f:
      - const: nvidia,tegra20-vip
      - items:
          - const: nvidia,tegra30-vip
          - const: nvidia,tegra20-vip

Among all Tegra SoC only 2 have VIP support Tegra20 and Tegra30.
Tegra30 is backwards compatible with Tegra20 so we can use fallback.
There should be no new generation added to this schema.

OR should I use enum?

properties:
  compatible:
      one0f:
        - enum:
          - nvidia,tegra20-vip

        - items:
          - const: nvidia,tegra30-vip
          - const: nvidia,tegra20-vip

> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> > --
> > 2.48.1
> >
