Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B83CE70EEBE
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 08:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEBB10E578;
	Wed, 24 May 2023 06:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Wed, 24 May 2023 06:58:45 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA03C10E578
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1684911525; x=1716447525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=shsR1rGUNM1EmQeYgf3G+zkshdxAvDAMpbx1W7WU4Gc=;
 b=v5KmlVP0Pqs5oV545mYx87sIimrIjZs9jL14SY8FJOoi9OOx6gGVm5xs
 RzifNhGofGh4/sl37rnpX6Q170LCVYlCjh/l7fj8dkIcpb5N30KAvoYga
 3Oc7adXSVHuX/h93eS6YXo3FU1Jfpdppz+cjOmXY7MK6gcmzTOD/mSfqQ
 IO0enm84QYldx6O20vmNCQHbxkTRVMGyKNeed0xVjUKo1uDH/5NOAHACW
 f0m20VoqQyh4vtU2zgwwZ8/1kk2bqHvxn9V597MaSGQYLrda/YbrY5mfM
 UMpgxY9pTK1g0BAj4dH/7OZfyI2ewUWgOpyN2/x/xQtkHetrkGA3pMmq7 Q==;
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="217000363"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 May 2023 23:51:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 23 May 2023 23:51:33 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 23 May 2023 23:51:29 -0700
Date: Wed, 24 May 2023 07:51:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v4 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Message-ID: <20230524-scientist-enviable-7bfff99431cc@wendy>
References: <1684878827-40672-1-git-send-email-justin.chen@broadcom.com>
 <1684878827-40672-3-git-send-email-justin.chen@broadcom.com>
 <20230523-unfailing-twisting-9cb092b14f6f@spud>
 <CALSSxFYMm5NYw41ERr1Ah-bejDgf9EdJd1dGNL9_sKVVmrpg3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALSSxFYMm5NYw41ERr1Ah-bejDgf9EdJd1dGNL9_sKVVmrpg3g@mail.gmail.com>
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
Cc: andrew@lunn.ch, simon.horman@corigine.com, dri-devel@lists.freedesktop.org,
 edumazet@google.com, justinpopo6@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, f.fainelli@gmail.com,
 Florian Fainelli <florian.fainelli@broadcom.com>, linux@armlinux.org.uk,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, richardcochran@gmail.com, opendmb@gmail.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, davem@davemloft.net, robh+dt@kernel.org,
 christian.koenig@amd.com, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Justin,
On Tue, May 23, 2023 at 04:27:12PM -0700, Justin Chen wrote:
> On Tue, May 23, 2023 at 3:55=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
> > On Tue, May 23, 2023 at 02:53:43PM -0700, Justin Chen wrote:
> >
> > > +  compatible:
> > > +    enum:
> > > +      - brcm,asp-v2.0
> > > +      - brcm,bcm72165-asp
> > > +      - brcm,asp-v2.1
> > > +      - brcm,bcm74165-asp
> >
> > > +        compatible =3D "brcm,bcm72165-asp", "brcm,asp-v2.0";
> >
> > You can't do this, as Rob's bot has pointed out. Please test the
> > bindings :( You need one of these type of constructs:
> >
> > compatible:
> >   oneOf:
> >     - items:
> >         - const: brcm,bcm72165-asp
> >         - const: brcm,asp-v2.0
> >     - items:
> >         - const: brcm,bcm74165-asp
> >         - const: brcm,asp-v2.1
> >
> > Although, given either you or Florian said there are likely to be
> > multiple parts, going for an enum, rather than const for the brcm,bcm..
> > entry will prevent some churn. Up to you.
> >
> Urg so close. Thought it was a trivial change, so didn't bother
> retesting the binding. I think I have it right now...
>=20
>   compatible:
>     oneOf:
>       - items:
>           - enum:
>               - brcm,bcm72165-asp
>               - brcm,bcm74165-asp
>           - enum:
>               - brcm,asp-v2.0
>               - brcm,asp-v2.1
>=20
> Something like this look good?

I am still caffeine-less, but this implies that both of
"brcm,bcm72165-asp", "brcm,asp-v2.0"
_and_
"brcm,bcm72165-asp", "brcm,asp-v2.1"
are. I suspect that that is not the case, unless "brcm,asp-v2.0" is a
valid fallback for "brcm,asp-v2.1"?
The oneOf: also becomes redundant since you only have one items:.

> Will submit a v5 tomorrow.

BTW, when you do, could you use the address listed in MAINTAINERS rather
than the one you used for this version?

Cheers,
Conor.
