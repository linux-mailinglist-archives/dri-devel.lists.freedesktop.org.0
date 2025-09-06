Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06FAB475FC
	for <lists+dri-devel@lfdr.de>; Sat,  6 Sep 2025 19:55:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB78010E097;
	Sat,  6 Sep 2025 17:55:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Vo8En1fH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD40010E097
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Sep 2025 17:55:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757181295; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WNxEioriaEs/u+KCseNI2dB68EOHRgf0F+l9UmkTxpaMjOTaqo7u92cu+ELDxOq6VauP91oW2ZnCuFdGdIQG226W+TRDWmCwA6K1lZfffMI7N5jNd0xsoKMeTVR1IK7VMxAMZB0evgvqsPZF3Nuz8Jix1RWyYjfVfQelO0JUG6g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757181295;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IP7rUBaz1mvKnSQijXZkfLhmJRgyKEeoaWImepnoHPM=; 
 b=mM+byTotFb+OP9BafKuB5zHSQdFPMwb3RQYFI8+0FJmDjAyweLe7SNCFmWy+36m5UCxNSlRPRyu0GAm8QbEmAmilnIpWvS5mwtSI5Vs3PEYrSxv5JBfOOaVstU2l2TGJaQBFEzZvZOkP023kXkSiEAzAJ3ZZKPwVhvEWRN0EGdc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757181295; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=IP7rUBaz1mvKnSQijXZkfLhmJRgyKEeoaWImepnoHPM=;
 b=Vo8En1fHBjlORqqr4nwH2t1Ko4oGKDiIZXye5dpPTJTXQ0z0uomJitKJBaxlGxz0
 Hyf/qh7Sf5IUbhGDXsb0Bl7OJakZbjMGKA4FFAayKBvo3sM8/nDtjSqFD7NHQPPAjTa
 lnvN1396nqMaHKXIkhA6srQFSndnyRG4BHZ+RY68=
Received: by mx.zohomail.com with SMTPS id 1757181293913862.8978758635274;
 Sat, 6 Sep 2025 10:54:53 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH RFC 01/10] dt-bindings: gpu: mali-valhall-csf: add
 mediatek,mt8196-mali variant
Date: Sat, 06 Sep 2025 19:54:46 +0200
Message-ID: <13801600.O9o76ZdvQC@workhorse>
In-Reply-To: <20250905232657.GA1497794-robh@kernel.org>
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-1-7b6c2d6be221@collabora.com>
 <20250905232657.GA1497794-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi Rob,

On Saturday, 6 September 2025 01:26:57 Central European Summer Time Rob Herring wrote:
> On Fri, Sep 05, 2025 at 12:22:57PM +0200, Nicolas Frattaroli wrote:
> > The Mali-based GPU on the MediaTek MT8196 SoC is shackled to its concept
> > of "MFlexGraphics", which in this iteration includes an embedded MCU
> > that needs to be poked to power on the GPU, and is in charge of
> > controlling all the clocks and regulators.
> > 
> > In return, it lets us omit the OPP tables from the device tree, as those
> > can now be enumerated at runtime from the MCU.
> > 
> > Add the mediatek,mt8196-mali compatible, and a performance-controller
> > property which points to a node representing such setups. It's required
> > on mt8196 devices.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 36 +++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > index a5b4e00217587c5d1f889094e2fff7b76e6148eb..6df802e900b744d226395c29f8d87fb6d3282d26 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > @@ -19,6 +19,7 @@ properties:
> >        - items:
> >            - enum:
> >                - rockchip,rk3588-mali
> > +              - mediatek,mt8196-mali
> >            - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
> >  
> >    reg:
> > @@ -53,6 +54,13 @@ properties:
> >    opp-table:
> >      type: object
> >  
> > +  performance-controller:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle of a device that controls this GPU's power and frequency,
> > +      if any. If present, this is usually in the form of some specialised
> > +      embedded MCU.
> 
> We already abuse power-domains binding with both power and performance. 
> There's a performance-domain binding too, but only used on one platform 
> for CPUs (Mediatek too IIRC). Or perhaps you could just point to an 
> empty OPP table. I don't think you have anything new here, so don't 
> invent something new.

Oops, yeah, I forgot about performance-domain already existing. I agree
that it looks like a good fit; iirc I initially disregarded it because
I thought it was an actual heterogenous core cpufreq-y thing I'd be
overloading with new meaning, but I see now that this is not so, and
aside from mediatek, Apple appears to be the only user.

Thanks for the fast review.

Kind regards,
Nicolas Frattaroli

> 
> Rob
> 




