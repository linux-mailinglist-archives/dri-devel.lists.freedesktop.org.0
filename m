Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF5B4A0FF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 07:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C10410E22B;
	Tue,  9 Sep 2025 05:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ioaWX+MX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9637010E22B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 05:00:17 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3e249a4d605so4096500f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 22:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757394016; x=1757998816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JvWoQumFNTmdVD16AHMfCOQayYv4kB4ZtuuQ9k6C1e0=;
 b=ioaWX+MXhhP9yvmB1EjeqtPDswl4HAGhZ14wZdl1E8JCv1uq3WkGc7KrBC8W3j5ae3
 Wfdlme1/79TxOM5hCulSrVTlVMkg6J+iHtETX6PIhh6DG5k8pNELEOzpw35lWtuYC86u
 XBCIjx9HTND8XYaLFyX5RQSenlvAM8hBMjhGBMFSQxphZvTwnH19ZPgHpq8o02Enx5CX
 0eEjC8C7/YY532Lw9bs7MrvtTZiKJva1SIZ6mvPBAOVw7SW3H1y4k04QuY9c92t4uS/C
 Xk5oZrrHazHRIU2KoTmfrY/cD01HGk/vgrhY0Nwz5WKlrV1Ji1uSdukIwhpKDhLTAWby
 Sghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757394016; x=1757998816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JvWoQumFNTmdVD16AHMfCOQayYv4kB4ZtuuQ9k6C1e0=;
 b=PawieIZL/iLDGPqKcKr/s33EFfOOFniusmP2by8NHFAWdIM5pzp2kAlLGJFvedJ+CC
 Ep6RAgUxfpDB+YVkKmJ181TqjTIP6TSgR6GMpdcxq0P+X6wz1aHp3qQZub/PW0Qe33Yg
 dhmlJHYsctqWmIzkVzITLqM0iw/GByHuVcoKEkmWcU/Oagd28yb7JGO1zJQ0Fh+IUTFC
 d+ZkEUeU/g8xM42hkimFWaK32zYUf6OmhvpUwPC3TySxY4e7700WFtbU5ldHzW2e4Ap1
 199BHxFJlIp/ZQd+4+oLgv+BzUYXjobinmgRupHmh/pVQ7gBVtYPY0cY4WM80KtaMXJY
 Wjqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsWxhgIPRW1+toxk+hzPimup8LT3BxOgQAWMTImo9a+NeeJIq/q/hIa+aQJIryQjFqWWOvj/k+Efg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtJVXixqja8UCJFCSmTTiDeRuAqYxUGNpBEOy/1IeNGB9zQmZL
 /12sf3UwQJbJOPOL4UXBWQr0Q1uEZIEp5uy6GLxsgLi4bab9JqdSNBDAE0sBy1aVnmt3e5k5rYQ
 UkWGPjARxioxU4josp4BBX+lAqKZA/Tg=
X-Gm-Gg: ASbGncvQImjH+I+fSw2HKLvt73C1ANwLEWHAVM8jZUerzgPIY5nLlacnk6RFfdkNcj3
 VC04hfgEZJzRCd2VqbP9qWluABdNJ+qkOfEPURCdcW62jLe5S91LpbQbRkcByqUT3aCrHfyOKzi
 uGweva9Z4JbFHVL5Jojckg3CQWkjDWdYGy7sCDxNS+qFYQd7EJ89rV7ESo3Z4pb0EFs3COl++TV
 PMECVFHkBcLVAzwJYU=
X-Google-Smtp-Source: AGHT+IG2zjYHyHxDrSFyGdWaycUP0DnV1hIepEsmw6nSgmsn9ogr9jjPFRCaYQPTy+roxHGLBD5nuBqHvVP9q4sOQgU=
X-Received: by 2002:a05:6000:26ce:b0:3cb:3ca5:870b with SMTP id
 ffacd0b85a97d-3e64c1c2b58mr9289210f8f.44.1757394015848; Mon, 08 Sep 2025
 22:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-13-clamor95@gmail.com>
 <20250909005729.GA2330015-robh@kernel.org>
In-Reply-To: <20250909005729.GA2330015-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 9 Sep 2025 08:00:04 +0300
X-Gm-Features: AS18NWBubeuZYVIrBS9Y3gvos_QkcU48-UEb6DN0-0PA-mnw9dcMiO5insdn20M
Message-ID: <CAPVz0n0PhzjsJSKp9P7amG36V+E_dLFXAgJqtTPx4cfH0m5BXQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/23] dt-bindings: display: tegra: move
 avdd-dsi-csi-supply from VI to CSI
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
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dmitry Osipenko <digetx@gmail.com>,
 =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
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

=D0=B2=D1=82, 9 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 03:57 Rob H=
erring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Sep 06, 2025 at 04:53:33PM +0300, Svyatoslav Ryhel wrote:
> > The avdd-dsi-csi-supply is CSI power supply, it has nothing to do with =
VI,
> > like same supply is used with DSI and has nothing to do with DC. Move i=
t
> > to correct place.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra210-csi.yaml | 3 +++
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-vi.yaml
> > index dd67d4162884..bb138277d5e8 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi=
.yaml
> > @@ -75,9 +75,6 @@ properties:
> >    ranges:
> >      maxItems: 1
> >
> > -  avdd-dsi-csi-supply:
> > -    description: DSI/CSI power supply. Must supply 1.2 V.
> > -
> >    vip:
> >      $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml
> > index fa07a40d1004..37f6129c9c92 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > @@ -37,6 +37,9 @@ properties:
> >        - const: cile
> >        - const: csi_tpg
> >
> > +  avdd-dsi-csi-supply:
> > +    description: DSI/CSI power supply. Must supply 1.2 V.
>
> On further thought, why does this have 'dsi' in the name at all. If it
> happens to be the same supply for DSI and CSI, that's an SoC integration
> detail. The name here should be local to the module. Perhaps
> 'avdd-supply' is enough? Fine to rename it as you are breaking the ABI
> moving it anyways.
>

Not only this supply is common for DSI and CSI, on all schematics I
have seem so far input for this supply on CSI block is always called
avdd-dsi-csi and supply is named accordingly. This patch aims not to
rename supply, which has correct naming IMHO, but to place it in
correct place - CSI, not VI as it is ATM.

> Rob
