Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62548927ECB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 23:58:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDC410E00E;
	Thu,  4 Jul 2024 21:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="NoN1gOOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F7710E00E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 21:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1720130278; x=1720389478;
 bh=jcpphOxcKqDgmZFG5laam2USdpCS8njyFrIf6xUFINw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=NoN1gOOyVW4SgT4XDOzVSfc8kW8bDEyDNh7BTjE2l34uMulOdhpG4LZLHnVeO+OS7
 rg/aMFfAv/jDhdxVHpAw7D2xp3jhF40qkThwSYf+0j+oA/ohLxc2Ou3g/7goys6Oew
 3XCtmNDzOKLddWBThtoPPHeWYdd9Iwg9A1i65p0tUGETeq5UIm9X4teuTiLkDGTGQP
 oRtqPKjJ0bQsa4qSL2AK+Jxc/u4ttIDI6NyXiuoCJUcvdFIFAfomeMWOgwjtTOTk+3
 +6O+A99Kd3NC8JJibtY23bWahhqAiXpu9rMHIb+lFt0arEqcq9KeTyj3ZRgu1R1OHr
 9+1GN3qn58FXg==
Date: Thu, 04 Jul 2024 21:57:54 +0000
To: "Olsak, Marek" <Marek.Olsak@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: AMD GFX12 modifiers
Message-ID: <vj4fiAeZ6gKbGp3-Pc4VTWsrXVakEw4qVAFWvSwuInGFav8XX51muU57abjq5t5xIsjlLivoUXyiVqT_X_sP2ufgnzoDx6uJotCvl10Tczk=@emersion.fr>
In-Reply-To: <DM6PR12MB4731C6A4ED42471BA85EB75FF9DD2@DM6PR12MB4731.namprd12.prod.outlook.com>
References: <vahBbQHXGpyFcIwzIVTPHRnphiAma3_wNbTftk7O3I6gN4gToIj3zIJrIkO263Ly61q2HArlyB1lvyKM1FFyqkqAdLH195Y41xK8GWL4ZBg=@emersion.fr>
 <CADnq5_NgzVn4AOekFQ1xYqkdhuZhTE1QVqxO1WJtp-Bchx6dcw@mail.gmail.com>
 <DM6PR12MB47312197417DE10FB70EA8B1F9DC2@DM6PR12MB4731.namprd12.prod.outlook.com>
 <puRC6uFBtCVBzB86vMEYSr2EEy6ByN5dSXIJH1ePIcIckTFo1xw2r0GUMx39uPMnOGYf6DxpjGEfGRwyVRHSezhX_NIIwKUQD8MGlhXewuk=@emersion.fr>
 <DM6PR12MB4731C6A4ED42471BA85EB75FF9DD2@DM6PR12MB4731.namprd12.prod.outlook.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 50e3f24113a91ee6d16043b8719e497da2f87ba2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Wednesday, July 3rd, 2024 at 17:11, Olsak, Marek <Marek.Olsak@amd.com> w=
rote:

> Alex publishes the amd-staging-drm-next branch regularly where all our ke=
rnel commits go.

I know. That's what I use as a base when I send amdgpu patches.

This doesn't contain any more relevant changes.

> See the gfx12 modifiers that Mesa exposes.

The modifier u64 bit layout is not supposed to be "Mesa-specific".
It's shared by multiple userspace components. It needs to be defined
properly in drm_fourcc.h.

Please, can you read my questions and answer them?

> From: Simon Ser <contact@emersion.fr>
> Sent: Tuesday, July 2, 2024 12:39:10 PM
> To: Olsak, Marek <Marek.Olsak@amd.com>
> Cc: Alex Deucher <alexdeucher@gmail.com>; Pillai, Aurabindo <Aurabindo.Pi=
llai@amd.com>; DRI Development <dri-devel@lists.freedesktop.org>; Siqueira,=
 Rodrigo <Rodrigo.Siqueira@amd.com>; Deucher, Alexander <Alexander.Deucher@=
amd.com>; Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Subject: Re: AMD GFX12 modifiers
>=20
> On Tuesday, July 2nd, 2024 at 15:22, Olsak, Marek <Marek.Olsak@amd.com> w=
rote:
>=20
> > The code you are=C2=A0looking at seems out of date. The latest code is =
on
> > amd-gfx.
>=20
> Could you point me where? I searched for drm_fourcc.h and only found [1]
> which I guess at least answers my question about
> AMD_FMT_MOD_GFX12_DCC_MAX_COMPRESSED_BLOCK_MASK.
>=20
> [1]: https://lore.kernel.org/amd-gfx/20240626183135.8606-5-marek.olsak@am=
d.com/
>=20
> > That doesn't matter though. This seems to be a general
> > question about modifiers. Here's the answer.
> >
> > Modifier definitions don't describe compatibility between chips and gen=
erations. They only identify the memory layout. Because of that, hw support=
 can't be inferred from modifiers. There could be multiple GFX definitions,=
=C2=A0tile numbers, and even modifiers from other vendors describing exactl=
y the same layout, and all such equivalent modifiers can be exposed by the =
same hw.
> >
> > The gfx12 modifiers work in exactly the same way as any other modifiers=
.
>=20
> Thanks, I know how modifiers work, I'm a WSI person. :)
>=20
> My questions were not generic questions about modifiers though. My
> questions are about the technical detail of how GFX12 buffer tiling
> properties are encoded in the modifier u64.
>=20
> This is something I need to know for libdrm modifier pretty-printing,
> as well as drm_info and drmdb. And in general, I think it's important to
> audit changes to drm_fourcc.h, rules around modifiers are a bit
> complicated and easy to get wrong.
>=20
> > From: Alex Deucher <alexdeucher@gmail.com>
> > Sent: July 1, 2024 13:09
> > To: Simon Ser <contact@emersion.fr>; Olsak, Marek <Marek.Olsak@amd.com>
> > Cc: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; DRI Development <dri-=
devel@lists.freedesktop.org>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>;=
 Deucher, Alexander <Alexander.Deucher@amd.com>; Bas Nieuwenhuizen <bas@bas=
nieuwenhuizen.nl>
> > Subject: Re: AMD GFX12 modifiers
> >
> > + Marek
> >
> > On Sat, Jun 29, 2024 at 1:15=E2=80=AFPM Simon Ser <contact@emersion.fr>=
 wrote:
> > >
> > > Hi all!
> > >
> > > In 7ceb94e87bff ("drm/amd: Add gfx12 swizzle mode defs"), some
> > > definitions were added for GFX12 modifiers. However I'm not quite sur=
e
> > > I understand how these work.
> > >
> > > Tile values seem to not be in the same namespace as GFX9 through GFX1=
1,
> > > is that correct? In other words, can GFX9 ~ GFX11 modifiers be used w=
ith
> > > GFX12, or are these mutually exclusive?
> > >
> > > AMD_FMT_MOD_GFX12_DCC_MAX_COMPRESSED_BLOCK_MASK has a comment explain=
ing
> > > the 3 possible values, is there a reason why #defines are missing for
> > > these values?
> > >
> > > The comment lists a lot more swizzle modes than just 64K_2D and 256K_=
2D,
> > > any reason why the rest are missing (at least for the 2D ones)?
> > >
> > > Could you explain how the new GFX12 modifiers work?
> > >
> > > Would it be possible to update the comment on top of #define AMD_FMT_=
MOD
> > > to reflect the GFX12 updates?
> > >
> > > Thanks,
> > >
> > > Simon
