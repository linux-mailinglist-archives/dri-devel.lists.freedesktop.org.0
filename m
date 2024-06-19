Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E482B90F494
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21C810ED4C;
	Wed, 19 Jun 2024 16:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TkUrxQuU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AA310ED4C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 16:56:48 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-652fd0bb5e6so16789a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718816207; x=1719421007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S2pOiKZCM6AEv9fRPfAqr24dsxT32FXEwY2yo/xeCPU=;
 b=TkUrxQuU1X+34Nrsw8WHokkYnGmlU3mgC17LwpSJSTabb87t4ud9PVT7S96+IURYBU
 RN1iTW6joUoXuq0+gH62UDTAuM6D3FVVQ+1en6AoRLjWTCuahcrjyFY5veadjVtWUZHA
 2oo91TULpHBIZjg3L+QuzJz/iYEUnU8bmyiHrt2ibMkbQqUZMp9vCxRCroGq7IeK2Z90
 vlAQ8Cyq46th9L9Y7q14PMR1DskTfpxDmHxHJSB/uuCGuaUXE6XvJlnivBBd5LkrgM/O
 mnHyl9+xnMA6Rxmp01vIi+rjqKntaC2GGttcoPS72nma18cFQvzHyhTu/WGs1Q/GdA//
 WkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718816207; x=1719421007;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S2pOiKZCM6AEv9fRPfAqr24dsxT32FXEwY2yo/xeCPU=;
 b=RfA8H9e5k1lOWA7D4/8vkGc72rfBXCJYoXi4N5Atbb6lvrjkY3XmKdK8lrPaw6Y6b0
 mZwEsu67F4JBN625HwXm2PjSjXO3ecSg0bK0eqsXZaJ9JUIeGXCD6+QQwR7/UGpANR0v
 Olxw833w5QW6Y+x+/UbogubUd/M7tBtqyzUKbhWnfNGMlK1w7AadaohtVOPDQufcjy8E
 ZIN6gb45v0h0fp6w0NxCzrpB3siGF6O3ix5oW1q1GTOhJkXivluw5q/ipTLtkcHEudh+
 T/Zfre3iptCo9uoO356gGP+jxhQe4EX/D68FcJjcXXEKl+xhq64vwnrdWhlC6b4Ebrhn
 GVPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWoetGq4o08715u3GoXQssO1gzFTaB6rv570u/yLboem+Kx5J2w5VlrQf7fU8XOJFiO3w32hseSiZBndNl09AL9nEfmEfqMo6OeoLgXjaA
X-Gm-Message-State: AOJu0Yw8+hruGhJJmcldnjbsYRFYFS2nsJOaKNEf565ASBejIHNB4aaG
 3mVM6VB6jMq6IjkKGmbyIDLw2z/c2psdEMk5CsEQqMl8Q0PSpAaA1Ru2XtnwxNiPbNpaKeVQSFl
 h5oTwp/SWtvWOB8RSGgLlOPtuEUY=
X-Google-Smtp-Source: AGHT+IERyacgj62eO2mHHlRd0wPullKaaMd7l6eTgV3VKINVH5yxaU0nlHl6jCJTt+Z3UyH6vlmBZQUH4XKAyUIMX9A=
X-Received: by 2002:a17:90a:fd0a:b0:2c4:e5f4:a20e with SMTP id
 98e67ed59e1d1-2c7b5d8ac46mr2856698a91.44.1718816207374; Wed, 19 Jun 2024
 09:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook> <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook> <Zm-FidjSK3mOieSC@itl-email>
 <Zm_p1QvoZcjQ4gBa@macbook>
 <ZnCglhYlXmRPBZXE@mail-itl> <ZnDbaply6KaBUKJb@itl-email>
 <0b00c8f9-fb79-4b11-ae22-931205653203@amd.com>
 <ZnGVu9TjHKiEqxsu@itl-email> <13ee25a3-91ef-48da-a58d-f4b972fe0c4f@amd.com>
In-Reply-To: <13ee25a3-91ef-48da-a58d-f4b972fe0c4f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Jun 2024 12:56:35 -0400
Message-ID: <CADnq5_N9-Db3+=JB1UrcZZho9psU-mnXz0xnatYJ+oDL24_A7g@mail.gmail.com>
Subject: Re: Design session notes: GPU acceleration in Xen
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, 
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, 
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 Jan Beulich <jbeulich@suse.com>, 
 Xenia Ragiadakou <burzalodowa@gmail.com>, Ray Huang <ray.huang@amd.com>, 
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Direct Rendering Infrastructure development <dri-devel@lists.freedesktop.org>, 
 Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
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

On Wed, Jun 19, 2024 at 12:27=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.06.24 um 16:12 schrieb Demi Marie Obenour:
> > On Tue, Jun 18, 2024 at 08:33:38AM +0200, Christian K=C3=B6nig wrote:
> > > Am 18.06.24 um 02:57 schrieb Demi Marie Obenour:
> > >> On Mon, Jun 17, 2024 at 10:46:13PM +0200, Marek Marczykowski-G=C3=B3=
recki
> > >> wrote:
> > >>> On Mon, Jun 17, 2024 at 09:46:29AM +0200, Roger Pau Monn=C3=A9 wrot=
e:
> > >>>> On Sun, Jun 16, 2024 at 08:38:19PM -0400, Demi Marie Obenour wrote=
:
> > >>>>> In both cases, the device physical
> > >>>>> addresses are identical to dom0=E2=80=99s physical addresses.
> > >>>>
> > >>>> Yes, but a PV dom0 physical address space can be very scattered.
> > >>>>
> > >>>> IIRC there's an hypercall to request physically contiguous memory =
for
> > >>>> PV, but you don't want to be using that every time you allocate a
> > >>>> buffer (not sure it would support the sizes needed by the GPU
> > >>>> anyway).
> > >>
> > >>> Indeed that isn't going to fly. In older Qubes versions we had PV
> > >>> sys-net with PCI passthrough for a network card. After some uptime =
it
> > >>> was basically impossible to restart and still have enough contagiou=
s
> > >>> memory for a network driver, and there it was about _much_ smaller
> > >>> buffers, like 2M or 4M. At least not without shutting down a lot mo=
re
> > >>> things to free some more memory.
> > >>
> > >> Ouch!  That makes me wonder if all GPU drivers actually need physica=
lly
> > >> contiguous buffers, or if it is (as I suspect) driver-specific. CCin=
g
> > >> Christian K=C3=B6nig who has mentioned issues in this area.
> >
> > > Well GPUs don't need physical contiguous memory to function, but if t=
hey
> > > only get 4k pages to work with it means a quite large (up to 30%)
> > > performance penalty.
> >
> > The status quo is "no GPU acceleration at all", so 70% of bare metal
> > performance would be amazing right now.
>
> Well AMD uses native context approach in XEN which which delivers over
> 90% of bare metal performance.
>
> Pierre-Eric can tell you more, but we certainly have GPU solutions in
> productions with XEN which would suffer greatly if we see the underlying
> memory fragmented like this.
>
> >   However, the implementation
> > should not preclude eliminating this performance penalty in the future.
> >
> > What size pages do GPUs need for good performance?  Is it the same as
> > CPU huge pages?
>
> 2MiB are usually sufficient.

Larger pages are helpful for both system memory and VRAM, but it's
more important for VRAM.

Alex

>
> Regards,
> Christian.
>
> >   PV dom0 doesn't get huge pages at all, but PVH and HVM
> > guests do, and the goal is to move away from PV guests as they have lot=
s
> > of unrelated problems.
> >
> > > So scattering memory like you described is probably a very bad idea
> > if you
> > > want any halve way decent performance.
> >
> > For an initial prototype a 30% performance penalty is acceptable, but
> > it's good to know that memory fragmentation needs to be avoided.
> >
> > > Regards,
> > > Christian
> >
> > Thanks for the prompt response!
>
