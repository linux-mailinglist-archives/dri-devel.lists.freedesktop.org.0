Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E18437DB7C3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 11:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2B710E280;
	Mon, 30 Oct 2023 10:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAFA10E280
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s1HkBC5J2bQkOCGXJtMaVI0R5FDCJgFP7wLZSCZStqc=; b=D+9RN9tvynL292AVSFRuaLgL3C
 J68xxV0GrTP/I2/Kob4wv3jfOFtPh62hXkbGbaftmznbBvUyn5z3T7K+XRe3JJG6fIjdCQApQQSf2
 F6meQBZgsuU7kQHhw37zzV6Va6rB4d/pNJ5ajQBYZAdFSZE+gr47na4+d3rK11d4P+02iodNk0uMh
 s4aGYE7Foxf074dIim/rlzi2CEdGUYzZ+nxyG3/rzX9nDyqaqQOISm7IYMnztNW0SwQyLJNYPJC2A
 77B3hUvdTx8AVTl3Alq6huBk6PLcB+ji1GvpYquqNdphfwxe8SiQBGRmySf7lGmndy1OOi2oLY5Oe
 qDFVVBRQ==;
Received: from 229.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.229]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxPLy-00ErRv-CC; Mon, 30 Oct 2023 11:18:38 +0100
Message-ID: <641b573516a2d22dfe082b1c25b26e4e68d6a68b.camel@igalia.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: gpu: v3d: Add BCM2712's compatible
From: Iago Toral <itoral@igalia.com>
To: Stefan Wahren <wahrenst@gmx.net>, Maira Canal <mcanal@igalia.com>, 
 dri-devel@lists.freedesktop.org
Date: Mon, 30 Oct 2023 11:18:38 +0100
In-Reply-To: <1d926740-74d8-4114-85c7-30b2e986ba8a@gmx.net>
References: <20231030082858.30321-1-itoral@igalia.com>
 <20231030082858.30321-4-itoral@igalia.com>
 <1d926740-74d8-4114-85c7-30b2e986ba8a@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El lun, 30-10-2023 a las 10:57 +0100, Stefan Wahren escribi=C3=B3:
> Hi Iago,
>=20
> Am 30.10.23 um 09:28 schrieb Iago Toral Quiroga:
> > BCM2712, Raspberry Pi 5's SoC, contains a V3D core. So add its
> > specific
> > compatible to the bindings.
> >=20
> > v2: new, requested by Stefan Wahren.
> Thanks for sending this but the line above belongs below --- since
> it's
> not relevant after the patch has been applied.
> >=20
> > Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
> Unfortunately this patch will be ignored because the relevant
> devicetree
> people are missing to give their Ack.
>=20
> Please use scripts/get_maintainers.pl
>=20

Sorry about that, my bad, should I resend the patch (as part of a v3)
or is it enough to add the relevant maintainers in a reply to the
original v2 patch?

Iago

> Best regards
> > ---
> > =C2=A0 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml | 1 +
> > =C2=A0 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/gpu/brcm,bcm-
> > v3d.yaml b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> > index dae55b8a267b..dc078ceeca9a 100644
> > --- a/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> > @@ -17,6 +17,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0 compatible:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - brcm,2711-v3d
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - brcm,2712-v3d
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - brcm,7268-v3d
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - brcm,7278-v3d
> >=20
>=20
>=20

