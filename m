Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F874B5642
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 17:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5677810E11E;
	Mon, 14 Feb 2022 16:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2142 seconds by postgrey-1.36 at gabe;
 Mon, 14 Feb 2022 16:31:26 UTC
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D22510E13F;
 Mon, 14 Feb 2022 16:31:26 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com
 [217.182.119.155])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id E729D267CF;
 Mon, 14 Feb 2022 16:31:24 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com
 [149.56.130.247])
 by relay3.mymailcheap.com (Postfix) with ESMTPS id 9C68E3ECDF;
 Mon, 14 Feb 2022 17:31:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by filter1.mymailcheap.com (Postfix) with ESMTP id EB1BC2A037;
 Mon, 14 Feb 2022 16:31:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
 by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qKU721WRsB0; Mon, 14 Feb 2022 16:31:20 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter1.mymailcheap.com (Postfix) with ESMTPS;
 Mon, 14 Feb 2022 16:31:20 +0000 (UTC)
Received: from ice-e5v2.lan (unknown [59.41.163.244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 240EE406EA;
 Mon, 14 Feb 2022 16:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1644856280; bh=SXjwCWk3oSG3im+8gZm1YswbqCYyFuy3JQhG9lXT+a0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=A+DUMKET/gco1tQQjy17WxpPKQN53qYG3s69VcWu0hwQBBFGwM27FMw353NmwgbAL
 gWu3PrCyI2ia2v0b0tQgk91AJK6Tn2mfAEVZrIQuWybBZvF7YYSlTjQTpbPdmuiasY
 pdpobKVhNKWhru5UfJV/RqlGOH4e7I0Cp8fqWiUA=
Message-ID: <c50c9c7f569914ef56c2c7bc975f7e46db394c65.camel@aosc.io>
Subject: Re: [PATCH] drm/nouveau/bios: Use HWSQ entry 1 for PowerBook6,1
From: Icenowy Zheng <icenowy@aosc.io>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 15 Feb 2022 00:31:08 +0800
In-Reply-To: <CAKb7UvjRoS-z1f6a=p0TknPruZJBKmUEiAFOR9Ka5LgJ765Ybg@mail.gmail.com>
References: <20220214155518.2980270-1-icenowy@aosc.io>
 <CAKb7UvjRoS-z1f6a=p0TknPruZJBKmUEiAFOR9Ka5LgJ765Ybg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

在 2022-02-14星期一的 11:07 -0500，Ilia Mirkin写道：
> I'm not saying this is wrong, but could you file a bug at
> gitlab.freedesktop.org/drm/nouveau/-/issues and include the VBIOS
> (/sys/kernel/debug/dri/0/vbios.rom)? That would make it easier to
> review the full situation.

Created at https://gitlab.freedesktop.org/drm/nouveau/-/issues/158 .

> 
> On Mon, Feb 14, 2022 at 11:03 AM Icenowy Zheng <icenowy@aosc.io> wrote:
> > 
> > On PowerBook6,1 (PowerBook G4 867 12") HWSQ entry 0 (which is
> > currently
> > always used by nouveau) fails, but the BIOS declares 2 HWSQ entries
> > and
> > entry 1 works.
> > 
> > Add a quirk to use HWSQ entry 1.
> > 
> > Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_bios.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c
> > b/drivers/gpu/drm/nouveau/nouveau_bios.c
> > index e8c445eb11004..2691d0e0cf9f1 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> > @@ -1977,6 +1977,13 @@ static int load_nv17_hw_sequencer_ucode(struct
> > drm_device *dev,
> >         if (!hwsq_offset)
> >                 return 0;
> > 
> > +#ifdef __powerpc__
> > +       /* HWSQ entry 0 fails on PowerBook G4 867 12" (Al) */
> > +       if (of_machine_is_compatible("PowerBook6,1"))
> > +               return load_nv17_hwsq_ucode_entry(dev, bios,
> > +                                                 hwsq_offset + sz,
> > 1);
> > +#endif
> > +
> >         /* always use entry 0? */
> >         return load_nv17_hwsq_ucode_entry(dev, bios, hwsq_offset +
> > sz, 0);
> >  }
> > --
> > 2.30.2
> > 


