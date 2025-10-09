Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D7BC9A2B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 16:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F23C10E07A;
	Thu,  9 Oct 2025 14:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="oU0HepS2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5E310EA8A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760021540;
 bh=xTL7DiG+Wk108ylAXsFi8OtRDEe6Q9eiMtDN6TQ8Apk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oU0HepS2IWZZrhWZYuEfvO/ws2PxfGE4XKGmToRtThn9ggtmE+yHPSaXnHJgeMW8s
 HsKmBk6g1OsQYwqbilxLK+LpbJDWdWZlee40S7xQfirBLQ3IzhnTCeP5S+orEv0vXU
 jSlm5MGJ1dY4wMi/UbDykqrxN3X1n8lf7haASYuVcZ1l7H1cJE8Sn4mdtg2KOebKV0
 YaictgUawY/PEac8aIiDdn8LLgM8KS7RJTG7T4H4KTCb/EegoO941FYyPYSeKcnVdb
 dveNCofdcEuQPHmcemW6kzP4PLG4Su5P5C8+IzSYdXQNU8Ph6X8ccExe4fxycb0ZdI
 xhmJW7rFsvk6Q==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 71DE917E009B;
 Thu,  9 Oct 2025 16:52:19 +0200 (CEST)
Date: Thu, 9 Oct 2025 16:52:16 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Steven Price <steven.price@arm.com>, Rain Yang <jiyu.yang@oss.nxp.com>,
 imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.co, simona@ffwll.ch,
 marek.vasut@mailbox.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Rain Yang <jiyu.yang@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpu: mali-valhall: make mali-supply
 optional
Message-ID: <20251009165216.3670c6bf@fedora>
In-Reply-To: <aOfKDbjIHnFi6AX1@lizhi-Precision-Tower-5810>
References: <20250928090334.35389-1-jiyu.yang@oss.nxp.com>
 <7c3b219f-f504-4c4c-a13a-6a25a0eda277@arm.com>
 <aOfKDbjIHnFi6AX1@lizhi-Precision-Tower-5810>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 9 Oct 2025 10:43:25 -0400
Frank Li <Frank.li@nxp.com> wrote:

> On Thu, Oct 09, 2025 at 02:00:43PM +0100, Steven Price wrote:
> > Series applied to drm-misc-next.  
> 
> I have not seen DT team's acked tag for binding.

Rob acked it.

> 
> Frank
> 
> >
> > Thanks,
> > Steve
> >
> > On 28/09/2025 10:03, Rain Yang wrote:  
> > > From: Rain Yang <jiyu.yang@nxp.com>
> > >
> > > Not all platforms require the mali-supply regulator. This change removes
> > > it from the required list in the binding schema, and make mali-supply
> > > required for rk3588 only.
> > >
> > > Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
> > > ---
> > >  .../devicetree/bindings/gpu/arm,mali-valhall-csf.yaml          | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > index b220cbd5362f..ef9791d8ed95 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> > > @@ -92,7 +92,6 @@ required:
> > >    - interrupts
> > >    - interrupt-names
> > >    - clocks
> > > -  - mali-supply
> > >
> > >  additionalProperties: false
> > >
> > > @@ -109,6 +108,8 @@ allOf:
> > >          power-domains:
> > >            maxItems: 1
> > >          power-domain-names: false
> > > +      required:
> > > +        - mali-supply
> > >
> > >  examples:
> > >    - |  
> >  

