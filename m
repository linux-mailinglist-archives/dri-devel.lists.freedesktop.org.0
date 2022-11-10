Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE37B623A52
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 04:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA92D10E656;
	Thu, 10 Nov 2022 03:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E100F10E656;
 Thu, 10 Nov 2022 03:20:47 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-13d9a3bb27aso901746fac.11; 
 Wed, 09 Nov 2022 19:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sKG4G9h9TOTqgYAsSpAovfgI8PcnagrrLPJ5Dk9nkwM=;
 b=n4wtwl3i3PgLhMLKzXNZyDNN/91PNYF/iQdfqKTPEOylqZJVL9o0xC2pwZaIxbKexM
 SR+QPhCjQ6xLqbw6ja5Pjj8+92+Iwjm0eC2Kt8Ij+l8JBPu7wrT+Pc33C6A+2jFvu+kg
 x1PS/IdcF1JwfEXJ15aZBkchXsEkivh0MJMlkAniT3ZaVNBJr23/Qg7dzBAZYJx6dboE
 2fGMp9KJkHTnldkcR4Xixiw5cFCOV4LgQTwVXhRQ0kgGdkP7ObmLKEXKJsyOz5JSWCxo
 TIBjGQLspF1YAqUUeZJbypIcaG6YEH2NvTtDJomz2aEGkpfceAJ5Ayp6cHTNcj6AOABc
 9ayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sKG4G9h9TOTqgYAsSpAovfgI8PcnagrrLPJ5Dk9nkwM=;
 b=A8NpQF0Yrgm8of2heC6HQs2fw7BhjVyjx8rYOqNRgvVeaCBPbeNCc5RjkUBp9gL49o
 MuJuN5LLEuX3o1RFvlkRJvAvhpv5yrUy934LU4Rt5C71lJDc3XfwnI6eKR+tVSSP1YVX
 DNGTGH5E0fvTP20+P5LqmxX/ND0Fe4IQmGh4lkYI6UGdWdysFor9iwIK6UslsJSvgQno
 hLoUqQWkYJAaby2lcQ0V7GM0UK7ud2vlgwsWrhx50DB/lr7bY5gxqrklNL4yeajGrTzo
 28p43qG6UXsQcik2c57sRHfIHOHsXZB/v49BJR1W3yfft8TYi9c7Tfkx1KEU2NKRwH7h
 F0+A==
X-Gm-Message-State: ACrzQf1wvKKT9L1R1CsVRLrNgZ2h3f3u8mh98qEBtqHDdqDpxK4dK3p6
 gjlVXhQws288BgqcxfFu7OHei3cH3EauuimksBc=
X-Google-Smtp-Source: AMsMyM5znauZhG62dW+SB19EIKJtR+jeY3ZOk38/PiLmhOxvQ2TETT3VRqjFEuDmG+dHN5beLp10tLOL2HF6BB9S8Wg=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr37758133oao.96.1668050446788; Wed, 09
 Nov 2022 19:20:46 -0800 (PST)
MIME-Version: 1.0
References: <Y2siZmiTD40mTYpJ@mail.google.com> <Y2xJxUnDnesWYckj@work>
 <Y2xUc9Q/+zTYbjaL@mail.google.com>
In-Reply-To: <Y2xUc9Q/+zTYbjaL@mail.google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Nov 2022 22:20:34 -0500
Message-ID: <CADnq5_NKeqFm9ysEC78gYFL_PKzgSfXBa6v6rB+sE8aYZffqfA@mail.gmail.com>
Subject: Re: [RFC] Approaches to deal with a struct with multiple fake
 flexible arrays members
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 9, 2022 at 8:31 PM Paulo Miguel Almeida
<paulo.miguel.almeida.rodenas@gmail.com> wrote:
>
> On Wed, Nov 09, 2022 at 06:45:57PM -0600, Gustavo A. R. Silva wrote:
> > On Wed, Nov 09, 2022 at 04:45:42PM +1300, Paulo Miguel Almeida wrote:
> >
> > Adding Alex, Christian and DRM lists to the thread.
>
> Thanks so much for your reply Gustavo
> Yep, that's a good idea.
>
> >
> > > struct _ATOM_INIT_REG_BLOCK {
> > >     USHORT                     usRegIndexTblSize;    /*     0     2 */
> > >     USHORT                     usRegDataBlkSize;     /*     2     2 */
> > >     ATOM_INIT_REG_INDEX_FORMAT asRegIndexBuf[1];     /*     4     3 */
> > >     ATOM_MEMORY_SETTING_DATA_BLOCK asRegDataBuf[1];  /*     7     8 */
> >
> > I didn't find evidence that asRegDataBuf is used anywhere in the
> > codebase[1].
> > ...
> > <snip>
> > ...
> > As I pointed out above, I don't see asRegDataBuf[] being used in the
> > codebase (of course it may describe firmware memory layout). Instead,
> > there is this jump to a block of data past asRegIndexBuf[]:
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1444:
> > 1444: ATOM_MEMORY_SETTING_DATA_BLOCK *reg_data =
> > 1445:         (ATOM_MEMORY_SETTING_DATA_BLOCK *)
> > 1446:         ((u8 *)reg_block + (2 * sizeof(u16)) +
> > 1447:                  le16_to_cpu(reg_block->usRegIndexTblSize));
> >
> > So, it seems the one relevant array, from the kernel side, is
> > asRegIndexBuf[]. I wonder if we really need asRegDataBuf[] in that
> > structure... or if we could try modifying that struct and only have
> > asRegIndexBuf[] as last member? and then we can transform it into a
> > flex-array member.
>
> I saw that one too. That would be the way it's currently accessing
> asRegDataBuf member as the existing struct would make asRegDataBuf[0] point
> to some index within the asRegIndexBuf member (as you probably got it too)
>
> you are right... asRegDataBuff isn't used from a static analysis
> point of view but removing it make the code a bit cryptic, right?
>
> That's pickle, ay? :-)
>
> >
> > If for any strong reasong we cannot remove asRegDataBuf[] then I think we
> > could give it a try and use DECLARE_FLEX_ARRAY() to declare both arrays
> > in the structure.
> >
>
> Out of curiosity, why both rather than just asRegIndexBuf?
>
> > But first, of course, Alex, Christian, it'd be really great if we can
> > have your input and feedback. :)

This header describes the layout of memory stored in the ROM on the
GPU.  It's shared between vbios and driver so some parts aren't
necessarily directly used by the driver.  As for what to do about it,
I'm not sure.  This structure stores a set of register offsets
(asRegIndexBuf) and data values (asRegDataBuf) for specific operations
(e.g., walk this structure and program register X with value Y.  For a
little background on atombios, it's a set of data and command tables
stored in the vbios ROM image.  The driver has an interpreter for the
command tables (see atom.c) so it can parse the command tables to
initialize the asic to a usable state.  The various programming
sequences vary depending on the components the AIB/OEM uses for the
board (different vram vendors, different clock/voltage settings,
etc.).  The legacy VGA/VBE and the GOP driver and the OS driver can
use these tables, so this allows us to initialize any GPU in a generic
way on any architecture even if the platform firmware doesn't post the
card.  For the most part the driver doesn't have to deal with these
particular tables directly, other than for some very specific cases
where the driver needs to grab some elements from the tables to
populate the power management controller for GPU memory reclocking
parameters.  However, the command tables as interpreted by the parser
very often will directly parse these tables.  So you might have a
command table that the driver executes to initialize some part of the
GPU which ultimately fetches the table from the ROM image and walks it
programming registers based on the offset and values in that table.
So if you were debugging something that involves the atombios parser
and walking through one of the command tables, you may be confused if
the data tables don't match what header says.  So ideally, we'd keep
both arrays.

Alex

> >
> > Thanks!
> > --
> > Gustavo
> >
>
> - Paulo A.
