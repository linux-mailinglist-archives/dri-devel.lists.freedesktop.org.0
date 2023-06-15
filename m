Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FADF731A47
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 15:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1960110E4FE;
	Thu, 15 Jun 2023 13:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CFA10E4FD;
 Thu, 15 Jun 2023 13:41:18 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-78a065548e3so1415211241.0; 
 Thu, 15 Jun 2023 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686836477; x=1689428477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4WTgsjoTJ++OSepMTzs8x5zMgGNXZ92ZPRUNivR1rIg=;
 b=cWMq0uyYadDryv4hDl5aKtuWQJgf2brO6Ee6pEYpNuE4hyrt6tfD9GlU3SAvXQo6ko
 21owT5ejEo7LiWbghiEasPDFzJoydmc1qfWdAkxZBRtQ9arjXgHReOzfe1g0CWnBRNcM
 UxkkY1MRvnflvwjW9BziDLbqZ4WnBDqRoA5/ehiQ2kmtsNhHo86Jh+bWQYbNBsEWtLHB
 b3zS3LOgEfMAgkym1WsGQJTCXnLo0nQYbnOZJ7qZC7IlrJj0BHe9sMUYVWQ58mbiSH/k
 Z2uF+iIXmOPiU2vYqe+c6RW8qYbxnFYhDfY8Zw38j+vb2KZWrqKpxOZOO6sOc2ilz6m+
 Xh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686836477; x=1689428477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4WTgsjoTJ++OSepMTzs8x5zMgGNXZ92ZPRUNivR1rIg=;
 b=M8AhguHp9e3Rd6JnMgepm1TvPWDPSXuJjtfFLoBjrGbU1qLpMJ8N+oJiDFpb1jvReE
 baSvh923W+YkK/rP86kKRBkk2jaM4U7uov+nQS+M7zFBtfAA1ah89pL5JxpIbld2kg5F
 C9LQJodRWVM/jXXaH/4mi9zOmj80EKqgNdtnA54JoRpLLAjsqZ8V4ZzAEyiAU8SZ5Nad
 8Ax19CKTIIch9AFHR/y46+UC0Ct937fwHzTG8dvCv5GGfYiFuqULFKOcAYrbulz44LXZ
 DBltWAgA4sgRreig1sDUbrOUqzfK8qISQqyyZd7vrOZUw6rnpsjEPSUL0rbGcJNEMOut
 Y1IQ==
X-Gm-Message-State: AC+VfDyKXhwrnSCqidJzo3J0EDOxEbZZh7smAdPHieyB1PhdL68iPngB
 6yv5Amo4Bk0thw9/DAoFDiAtjc3meC1djc/EXa8=
X-Google-Smtp-Source: ACHHUZ6hq4JMIAKcu/2kE2tCDQoi8K+Mix0ax2Jn9wIMcFVIdLXJJOSI60KB5siYLCh04HS4+FmH05PSgQzMVA3GsZg=
X-Received: by 2002:a67:e899:0:b0:43f:41ae:46d1 with SMTP id
 x25-20020a67e899000000b0043f41ae46d1mr4764521vsn.25.1686836477262; Thu, 15
 Jun 2023 06:41:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230607125932.3518547-1-l.stach@pengutronix.de>
 <8c36b8bc-5a0d-75f7-265c-b0191979165a@loongson.cn>
 <d17de4ebfd08faa23238ece2ad0b737bf271498b.camel@pengutronix.de>
 <36946504-45c3-f0bc-3e4a-9106d9f4a2dd@loongson.cn>
 <CAH9NwWeB-MudNvuyuH1kUNiyWQTZ5Y4fuiB4uNKtutCKL3EZPg@mail.gmail.com>
 <b69671a6-4d4a-b1ee-784e-e21bd8f5558c@loongson.cn>
 <7bbad708041fffac5fcaf5c0ef2b0e53c29c682a.camel@pengutronix.de>
In-Reply-To: <7bbad708041fffac5fcaf5c0ef2b0e53c29c682a.camel@pengutronix.de>
From: Chris Healy <cphealy@gmail.com>
Date: Thu, 15 Jun 2023 06:41:06 -0700
Message-ID: <CAFXsbZo8Kcy0OAM61ENUE64-b0imbH8yHd68Mz-4=4sNGJ5x-A@mail.gmail.com>
Subject: Re: drm/etnaviv: slow down FE idle polling
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 kernel@pengutronix.de, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jingfeng,

Does your design have any bus PMU counters that can be used to measure
DRAM bandwidth of the 3D GPU directly or even indirectly?

Regards,

Chris

On Thu, Jun 15, 2023 at 2:53=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> Am Donnerstag, dem 15.06.2023 um 17:37 +0800 schrieb Sui Jingfeng:
> > Hi,
> >
> [...]
> > > > > > > +
> > > > > > > +   /*
> > > > > > > +    * Choose number of wait cycles to target a ~30us (1/3276=
8) max latency
> > > > > > > +    * until new work is picked up by the FE when it polls in=
 the idle loop.
> > > > > > > +    */
> > > > > > > +   gpu->fe_waitcycles =3D min(gpu->base_rate_core >> (15 - g=
pu->freq_scale),
> > > > > > > +                            0xffffUL);
> > > > > > This patch is NOT effective on our hardware GC1000 v5037 (ls7a1=
000 +
> > > > > > ls3a5000).
> > > > > >
> > > > > > As the gpu->base_rate_core is 0,  so, in the end gpu->fe_waitcy=
cles is
> > > > > > also zero.
> > > > > >
> > > > > Uh, that's a problem, as the patch will then have the opposite ef=
fect
> > > > > on your platform by speeding up the idle loop. Thanks for catchin=
g
> > > > > this! I'll improve the patch to keep a reasonable amount of wait =
cycles
> > > > > in this case.
> > > > It's OK, no big problem as far as I can see. (it my platform's prob=
lem,
> > > > not your problem)
> > > >
> > > It will become a problem as it eats up the bandwidth that you want to
> > > spend for real graphic work.
> > >
> > > > Merge it is also OK, if we found something wrong we could fix it wi=
th a
> > > > another patch.
> > > >
> > > Hmm.. I think that the fix for this problem is more or less an extra
> > > if so I would love to see a proper fix
> > > before this patch gets merged.
>
> Right, we don't merge known broken stuff. We are all humans and bugs
> and oversights happen, but we don't knowingly regress things.
>
> >
> > It just no effect(at least I can't find).
> >
> > I have tried, The score of glmark2 does not change, not become better,
> > not become worse.
>
> That's because it only affects your system when the GPU is idle but
> isn't in runtime PM yet. If you measure the DRAM bandwidth in that time
> window you'll see that the GPU now uses much more bandwidth, slowing
> down other workloads.
>
> Regards,
> Lucas
>
