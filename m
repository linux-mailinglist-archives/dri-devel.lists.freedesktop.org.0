Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5868273F28
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 12:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C419D6E84A;
	Tue, 22 Sep 2020 10:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEB06E84A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 10:02:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j2so16374420wrx.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 03:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jGjQ3k/r+TMPP6GtSQ2cJ+/Z4emC4eudN/bSW4LOP00=;
 b=0aY5I2s6bBkRJiz6UI7Px72FsFicwCbLU4boOg4paQjoLnkC+jVh5W6eql08yFIY1m
 NzXeLIpoDluFv1pvGJbipVHKo/EqKPgreoaFzrrsAzHLjzNjAp2uQhbdlwUzJMxQsbOC
 2EASEyO65aEaz68JLu5hhBC1vocg3CrPhMm8AbITBf23IyyCO4Tfxq3e42XTrwj+sXg/
 DZkPcQ56jqOoVPyZhuPUJQQ2lo2XYXPgm1x1Nydonay/6SzKLSyytsl4MmBXniaHUkw/
 lb7aqQ9SvEsU8fpabyPwM8K8z2qsMI1UyMHLDwvedLDrVEQW81MTAEp3Z0O3fcpVBOhY
 0gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jGjQ3k/r+TMPP6GtSQ2cJ+/Z4emC4eudN/bSW4LOP00=;
 b=Eg5PBQUG944oW5xHx09SqnGEsH/9qTRab9ImT5fMFmn3qIDx1cHpv6kN5mxiZOsqPf
 xYJyoB1ZoEBdfBqGiOZAFkM1kdLvBe+QD54+WDe2AYRSy/zwX6P8bt18eLN7zp9QRrON
 knh3+/I2LXaJPKF3nEUXAQDUSROs5LrtN+pb+5gBTnPktVjeVF852yP7DgKUT+YmuqkD
 fjkvnDnfYJ3n7IvEUid7KlLyInc33WAfZuj0KJLPJTMTn9r2MlAjvQTTuPBiu1pL/v7N
 mGh/UKXSSOldRCJrhfcsdLk63F7beF76somQXpj5Nw9qlxka1uPc2+rlo5hviM3Kdkz1
 zyxQ==
X-Gm-Message-State: AOAM531HEqJ1bQPDBkbdRMaJxfE1RNk20GJcRW7BSh7MPLFIG1xOSMta
 eAOzGuFYTLpovN3/GcgmUERMPH5J1cysMpCsNAYm+m8rK4A=
X-Google-Smtp-Source: ABdhPJwqUGjB+iaMVfcWu3YkxA+Kp9Fywr5xIHQ8ZG4zKmvoOKYiLXWSUSFT1t41hbI/aODD63wY5SSxsHUjWkGUoI4=
X-Received: by 2002:a5d:608f:: with SMTP id w15mr4406044wrt.244.1600768970385; 
 Tue, 22 Sep 2020 03:02:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190902125359.18001-1-tomi.valkeinen@ti.com>
 <20190902125359.18001-5-tomi.valkeinen@ti.com>
 <20190903152413.GB8247@pendragon.ideasonboard.com>
 <b44372e2-1bb7-ddb8-d121-ae096b38d918@ti.com>
 <20190904111105.GA4811@pendragon.ideasonboard.com>
 <d75b942b-0256-3824-9055-1f6b68bb8c3b@ti.com>
 <CAKb7Uvhcvi5AQZq21ky8V07wjeNfdpV0y+5j=O=S1PTp=4o5Bw@mail.gmail.com>
 <5beadfb2-86a5-a782-ff88-ce77c727ecfe@ti.com>
 <20200921144944.3f2aa593@eldfell>
 <b06e3c39-2a87-c5e0-0fdb-162eead5d36e@ti.com>
In-Reply-To: <b06e3c39-2a87-c5e0-0fdb-162eead5d36e@ti.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 22 Sep 2020 11:02:39 +0100
Message-ID: <CAPj87rP9zmDV+nqLWX+zeSSOZ-kWKQgd9i3+D_J9PjOvaB=sQA@mail.gmail.com>
Subject: Re: [PATCH 4/7] drm/omap: Implement CTM property for CRTC using OVL
 managers CPR matrix
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
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
Cc: Jyri Sarha <jsarha@ti.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 22 Sep 2020 at 08:44, Tomi Valkeinen <tomi.valkeinen@ti.com> wrote:
> On 21/09/2020 14:49, Pekka Paalanen wrote:
> > would it not be simplest if KMS UAPI specification defined the abstract
> > color pipeline with all the blocks that may be exposed with
> > driver-agnostic UAPI, and then just say that if a block is not present,
> > it behaves as pass-through, a no-op?

Correct, that's the intention and also the result you get today. If
the documentation doesn't make that clear then it should be fixed.

> > Each block would be represented by standardised KMS properties, that
> > either exist or don't.
> >
> > I think that would be fairly easy for userspace to grasp, but I don't
> > know if the abstract model itself would be feasible considering all the
> > hardware out there.
> >
> > If we happened to be limited to
> >
> > FB -> plane-degamma -> plane-CTM -> plane-gamma -> (blending) ->
> > degamma -> CTM -> gamma -> encoder -> wire
> >
> > it would still be tractable.
> >
> > No funny business with new KMS properties changing how old KMS
> > properties behave. Old userspace understands and uses old KMS
> > properties but not new KMS properties, so it wouldn't even work.
>
> Isn't this how it's currently defined for the output side? So if I understand right, your suggestion
> means that a HW that has:
>
> gamma -> CTM -> out
>
> would map those to DRM's degamma and CTM, and the userspace should use degamma to do gamma? I'm ok
> with that, and it's probably more manageable than having properties which would describe the order
> of the blocks.
>
> While using degamma for gamma sounds a bit illogical, but thinking of it as:
>
> pregamma -> ctm -> postgamma
>
> sounds fine.

Totally. 'degamma' and 'gamma' are just normative from most uses,
they're not prescriptive, e.g. userspace can use the 'degamma' LUT to
do gamma whilst leaving the CTM and 'gamma' LUT disabled if it wants.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
