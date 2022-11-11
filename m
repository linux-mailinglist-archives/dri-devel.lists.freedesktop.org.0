Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D2862534F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 07:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E5310E75B;
	Fri, 11 Nov 2022 06:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D510510E75B;
 Fri, 11 Nov 2022 06:05:30 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id i3so4045804pfc.11;
 Thu, 10 Nov 2022 22:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ALbqWn+YL8M50XLCfgkXbFZ6qiStxMdCmB11f1vM6Qo=;
 b=j29LXutMSWr8pwcIj4DoA1+DYr/kLsz1qvLxSdejrHKDPbypUbK2KzKT7nGdHpKUxb
 hsmYsMouw1iJwaxgt2FQSB5vXsNXzHw7PsTVDz6m/4eGFNSDfsTYgDkmc/ImKmBFz6Nk
 E5vMr7pb2L6AMzT7AZsOcIOU1/DTwKQbZ2rgU7UWi+bdkceXAKVs3VodKBS0TLAFkae6
 i8QTjs4xLH+Us9yzjjon/YA5BtAa9nC+62xSnbtUud0lGzl8vxp5h+JBjIObDBg92QOU
 cIEnOOMBO5tHlRhV8EwcZ8z3MaqqzAEkW5qXAgrGHX4ETAepvFY6ujpU5d2+mHAbPEym
 lsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ALbqWn+YL8M50XLCfgkXbFZ6qiStxMdCmB11f1vM6Qo=;
 b=fhmWWj+6vf+2aIj1NNyo+OXTX7mJO/CBTHotu4cQYEg1Y2le9fqBH62XTlbuu8ifWc
 JIeGPoP6nJHxYxK6EoorpqOjJ6SzhhYI2ZMdx7MQCoo5iSk7Cdc+nAl5bHCO17X+Izr6
 Wdo1PUdiKzyYK9FmH9gxs/QHeTagAy13TF+mqG0rI8Ipp/hqliryEVzUCiTVtGcK1KvW
 QK/lrF30BMiFTVi/4CatNCiPseNSQ8ClYz4j6bfbWat5K1LlKzcM4B7s91CBxpR/lgr8
 oLf+PcRCTbpHUE/BYZoBgxkjf79yFKQpxs/0FoG9VeT7ec+lxTp2+lfZJuc+B3BJFDh8
 9emQ==
X-Gm-Message-State: ANoB5pk9eaZpR1xxHvwpvJw0kyJkKL2H+58qfjCUZkQ+8kQAD5eypymd
 pcK+6SoQg3SRZftNmd7hE6Y=
X-Google-Smtp-Source: AA0mqf7bZje/kwnW4RSlfQYKlhfQjvwAuCazv+TcT8XgOIWjNepygL24yW9gS/19++m84Mfo4ntuyg==
X-Received: by 2002:a63:d354:0:b0:46b:3acb:77b2 with SMTP id
 u20-20020a63d354000000b0046b3acb77b2mr322174pgi.560.1668146729896; 
 Thu, 10 Nov 2022 22:05:29 -0800 (PST)
Received: from mail.google.com (125-237-50-34-fibre.sparkbb.co.nz.
 [125.237.50.34]) by smtp.gmail.com with ESMTPSA id
 ik15-20020a170902ab0f00b00172973d3cd9sm749319plb.55.2022.11.10.22.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 22:05:29 -0800 (PST)
Date: Fri, 11 Nov 2022 19:05:23 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [RFC] Approaches to deal with a struct with multiple fake
 flexible arrays members
Message-ID: <Y23mI6pQ0yOl1L/o@mail.google.com>
References: <Y2siZmiTD40mTYpJ@mail.google.com> <Y2xJxUnDnesWYckj@work>
 <Y2xUc9Q/+zTYbjaL@mail.google.com>
 <CADnq5_NKeqFm9ysEC78gYFL_PKzgSfXBa6v6rB+sE8aYZffqfA@mail.gmail.com>
 <Y23f9u6wQjwj1cRL@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y23f9u6wQjwj1cRL@work>
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
Cc: dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 11:39:02PM -0600, Gustavo A. R. Silva wrote:
> On Wed, Nov 09, 2022 at 10:20:34PM -0500, Alex Deucher wrote:
> > On Wed, Nov 9, 2022 at 8:31 PM Paulo Miguel Almeida
> > <paulo.miguel.almeida.rodenas@gmail.com> wrote:
> > >
> > > On Wed, Nov 09, 2022 at 06:45:57PM -0600, Gustavo A. R. Silva wrote:
> > > > On Wed, Nov 09, 2022 at 04:45:42PM +1300, Paulo Miguel Almeida wrote:
> > > >
> > > > Adding Alex, Christian and DRM lists to the thread.
> > >
> > > Thanks so much for your reply Gustavo
> > > Yep, that's a good idea.
> > >
> > > >
> > > > > struct _ATOM_INIT_REG_BLOCK {
> > > > >     USHORT                     usRegIndexTblSize;    /*     0     2 */
> > > > >     USHORT                     usRegDataBlkSize;     /*     2     2 */
> > > > >     ATOM_INIT_REG_INDEX_FORMAT asRegIndexBuf[1];     /*     4     3 */
> > > > >     ATOM_MEMORY_SETTING_DATA_BLOCK asRegDataBuf[1];  /*     7     8 */
> > > >
> > > > I didn't find evidence that asRegDataBuf is used anywhere in the
> > > > codebase[1].
> > > > ...
> > > > <snip>
> > > > ...
> > > > As I pointed out above, I don't see asRegDataBuf[] being used in the
> > > > codebase (of course it may describe firmware memory layout). Instead,
> > > > there is this jump to a block of data past asRegIndexBuf[]:
> > > >
> > > > drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c:1444:
> > > > 1444: ATOM_MEMORY_SETTING_DATA_BLOCK *reg_data =
> > > > 1445:         (ATOM_MEMORY_SETTING_DATA_BLOCK *)
> > > > 1446:         ((u8 *)reg_block + (2 * sizeof(u16)) +
> > > > 1447:                  le16_to_cpu(reg_block->usRegIndexTblSize));
> > > >
> > > > So, it seems the one relevant array, from the kernel side, is
> > > > asRegIndexBuf[]. I wonder if we really need asRegDataBuf[] in that
> > > > structure... or if we could try modifying that struct and only have
> > > > asRegIndexBuf[] as last member? and then we can transform it into a
> > > > flex-array member.
> > >
> > > I saw that one too. That would be the way it's currently accessing
> > > asRegDataBuf member as the existing struct would make asRegDataBuf[0] point
> > > to some index within the asRegIndexBuf member (as you probably got it too)
> > >
> > > you are right... asRegDataBuff isn't used from a static analysis
> > > point of view but removing it make the code a bit cryptic, right?
> > >
> > > That's pickle, ay? :-)
> > >
> > > >
> > > > If for any strong reasong we cannot remove asRegDataBuf[] then I think we
> > > > could give it a try and use DECLARE_FLEX_ARRAY() to declare both arrays
> > > > in the structure.
> > > >
> > >
> > > Out of curiosity, why both rather than just asRegIndexBuf?
> 
> Because if I understand the code and Alex's reply below correctly, both
> arrays are being used to describe data of variable size, and both arrays
> need to stay. The situation is that it'd be _strange_ to transform just
> one of them into a flex-array member and not the other, and at the same

My apologies, I tried being succinct and I ended up mistakenly leading you 
to understand a different thing. I will be more careful next time :-)

What I meant was why would you use DECLARE_FLEX_ARRAY macro for both
members instead of the following ?

typedef struct _ATOM_INIT_REG_BLOCK{
   USHORT                           usRegIndexTblSize;
   USHORT                           usRegDataBlkSize;
   DECLARE_FLEX_ARRAY(ATOM_INIT_REG_INDEX_FORMAT, asRegIndexBuf);  // Macro needed
   ATOM_MEMORY_SETTING_DATA_BLOCK   asRegDataBuf[];		   // Regular FMA
}ATOM_INIT_REG_BLOCK;

> On the other hand, I fail to see how the current state of the code is
> problematic for things like -fstrict-flex-arrays, right now. asRegDataBuf[]
> is not being used for anything in the kernel, and asRegIndexBuf[] is
> correctly being accessed through it's only valid index zero, after which
> is decays into a pointer[2].
> 
> That struct is definitely not great (I don't love it), but we might try
> to explore other cases while we determine how and if we ultimately need
> to modify it.
> 
> I'll open an issue for this in the bug tracker, so we keep an eye on it.
> :)

Fair enough. Thanks heaps Gustavo, I will move on to the other fake flex
array occurences and circle back to it once a decision in made. Please
count on me to make the changes :-)

> 
> > >
> > > > But first, of course, Alex, Christian, it'd be really great if we can
> > > > have your input and feedback. :)
> > 
> > This header describes the layout of memory stored in the ROM on the
> > GPU.  It's shared between vbios and driver so some parts aren't
> > necessarily directly used by the driver.  As for what to do about it,
> > I'm not sure.  This structure stores a set of register offsets
> > (asRegIndexBuf) and data values (asRegDataBuf) for specific operations
> > (e.g., walk this structure and program register X with value Y.  For a
> > little background on atombios, it's a set of data and command tables
> > stored in the vbios ROM image.  The driver has an interpreter for the
> > command tables (see atom.c) so it can parse the command tables to
> > initialize the asic to a usable state.  The various programming
> > sequences vary depending on the components the AIB/OEM uses for the
> > board (different vram vendors, different clock/voltage settings,
> > etc.).  The legacy VGA/VBE and the GOP driver and the OS driver can
> > use these tables, so this allows us to initialize any GPU in a generic
> > way on any architecture even if the platform firmware doesn't post the
> > card.  For the most part the driver doesn't have to deal with these
> > particular tables directly, other than for some very specific cases
> > where the driver needs to grab some elements from the tables to
> > populate the power management controller for GPU memory reclocking
> > parameters.  However, the command tables as interpreted by the parser
> > very often will directly parse these tables.  So you might have a
> > command table that the driver executes to initialize some part of the
> > GPU which ultimately fetches the table from the ROM image and walks it
> > programming registers based on the offset and values in that table.
> > So if you were debugging something that involves the atombios parser
> > and walking through one of the command tables, you may be confused if
> > the data tables don't match what header says.  So ideally, we'd keep
> > both arrays.
> 
> Thanks a lot for the input, Alex.
> --
> Gustavo
> 

Same here, thanks heaps Alex!

- Paulo A.

