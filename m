Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F79243B3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 18:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF99D10E00C;
	Tue,  2 Jul 2024 16:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="yOE3sPSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8E110E00C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 16:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1719938340; x=1720197540;
 bh=CpVKI9xvAsQhb5WSBNmHEXw3e7rCrukG749UojhvqQQ=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=yOE3sPSUugkyEPdp1DiWDMOftqaaCUoQ2aikKtVJttHlrvezAmo0Z+fgbx7IgZAd/
 +L8aEMrEju7sGMHrovpDu+n1zFiBD9uzcn8BeD2MzmoO3imJ/IQ3cKdIBxUKvc7EQg
 VCFBiAruOLweRPWO1bemCgAqSPWfixRcNEPsM1hSy64Vjk10iFXusowzd3hC9nQ+tu
 GXL1QcDlDndbba6JK1zFZ/+PQZqn3cP1CSZxaxmZETN7CnQnIOHekUiR2fosrEaklS
 Hza20bbT7Rb+L9QGPVJLoSXeK+djC4H2RDZaQZHAlYYSxPZr8QsYRxTaYPrnb7XY9A
 MXVAJoxAF5lKw==
Date: Tue, 02 Jul 2024 16:38:58 +0000
To: "Olsak, Marek" <Marek.Olsak@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Pillai,
 Aurabindo" <Aurabindo.Pillai@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: AMD GFX12 modifiers
Message-ID: <puRC6uFBtCVBzB86vMEYSr2EEy6ByN5dSXIJH1ePIcIckTFo1xw2r0GUMx39uPMnOGYf6DxpjGEfGRwyVRHSezhX_NIIwKUQD8MGlhXewuk=@emersion.fr>
In-Reply-To: <DM6PR12MB47312197417DE10FB70EA8B1F9DC2@DM6PR12MB4731.namprd12.prod.outlook.com>
References: <vahBbQHXGpyFcIwzIVTPHRnphiAma3_wNbTftk7O3I6gN4gToIj3zIJrIkO263Ly61q2HArlyB1lvyKM1FFyqkqAdLH195Y41xK8GWL4ZBg=@emersion.fr>
 <CADnq5_NgzVn4AOekFQ1xYqkdhuZhTE1QVqxO1WJtp-Bchx6dcw@mail.gmail.com>
 <DM6PR12MB47312197417DE10FB70EA8B1F9DC2@DM6PR12MB4731.namprd12.prod.outlook.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: eea337860f020920f65040a54a591fafb9df1718
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

On Tuesday, July 2nd, 2024 at 15:22, Olsak, Marek <Marek.Olsak@amd.com> wro=
te:

> The code you are=C2=A0looking at seems out of date. The latest code is on
> amd-gfx.

Could you point me where? I searched for drm_fourcc.h and only found [1]
which I guess at least answers my question about
AMD_FMT_MOD_GFX12_DCC_MAX_COMPRESSED_BLOCK_MASK.

[1]: https://lore.kernel.org/amd-gfx/20240626183135.8606-5-marek.olsak@amd.=
com/

> That doesn't matter though. This seems to be a general
> question about modifiers. Here's the answer.
>=20
> Modifier definitions don't describe compatibility between chips and gener=
ations. They only identify the memory layout. Because of that, hw support c=
an't be inferred from modifiers. There could be multiple GFX definitions,=
=C2=A0tile numbers, and even modifiers from other vendors describing exactl=
y the same layout, and all such equivalent modifiers can be exposed by the =
same hw.
>=20
> The gfx12 modifiers work in exactly the same way as any other modifiers.

Thanks, I know how modifiers work, I'm a WSI person. :)

My questions were not generic questions about modifiers though. My
questions are about the technical detail of how GFX12 buffer tiling
properties are encoded in the modifier u64.

This is something I need to know for libdrm modifier pretty-printing,
as well as drm_info and drmdb. And in general, I think it's important to
audit changes to drm_fourcc.h, rules around modifiers are a bit
complicated and easy to get wrong.

> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: July 1, 2024 13:09
> To: Simon Ser <contact@emersion.fr>; Olsak, Marek <Marek.Olsak@amd.com>
> Cc: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; DRI Development <dri-de=
vel@lists.freedesktop.org>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; D=
eucher, Alexander <Alexander.Deucher@amd.com>; Bas Nieuwenhuizen <bas@basni=
euwenhuizen.nl>
> Subject: Re: AMD GFX12 modifiers
>=20
> + Marek
>=20
> On Sat, Jun 29, 2024 at 1:15=E2=80=AFPM Simon Ser <contact@emersion.fr> w=
rote:
> >
> > Hi all!
> >
> > In 7ceb94e87bff ("drm/amd: Add gfx12 swizzle mode defs"), some
> > definitions were added for GFX12 modifiers. However I'm not quite sure
> > I understand how these work.
> >
> > Tile values seem to not be in the same namespace as GFX9 through GFX11,
> > is that correct? In other words, can GFX9 ~ GFX11 modifiers be used wit=
h
> > GFX12, or are these mutually exclusive?
> >
> > AMD_FMT_MOD_GFX12_DCC_MAX_COMPRESSED_BLOCK_MASK has a comment explainin=
g
> > the 3 possible values, is there a reason why #defines are missing for
> > these values?
> >
> > The comment lists a lot more swizzle modes than just 64K_2D and 256K_2D=
,
> > any reason why the rest are missing (at least for the 2D ones)?
> >
> > Could you explain how the new GFX12 modifiers work?
> >
> > Would it be possible to update the comment on top of #define AMD_FMT_MO=
D
> > to reflect the GFX12 updates?
> >
> > Thanks,
> >
> > Simon
