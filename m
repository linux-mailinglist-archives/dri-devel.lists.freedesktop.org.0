Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A13338228
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 01:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2926E0AB;
	Fri, 12 Mar 2021 00:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E786E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 00:19:20 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id o9so23937873iow.6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 16:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rT2mi0RKYY9eIELY8dDq2xYzkDbSu9DFCbXj3lrsyO8=;
 b=b3/pQlLIJf1GuZIXeLp4zUU/d9dPVtBEbf4GaQevVN16+0H1piJ4YR17Iqr+biM4T2
 mE6TNNfuAHsyubhJJBvfYZrdWMl7Jfe/5FK6nvHr1SVoDW06aD/eLG16cfdIk8Z1iToi
 9BI/PPADuH9SmBcZgoNBLuZKPdzV1iJaO79V+aENmYtFrKurpszniGV4a+fNCoEKyWfS
 8bf/QLF5iBq4AVvynOrQc/z0d64xcDGTSBjePPw9afqKgrEBfnhngjmZ2sas069u6oX2
 SJnn2NkOJQNq7pTCgdCh0DOUOuICdEWZ3FC7q6vcB+9eY5Vbu1cnCVche4tiks0rQViH
 AIJw==
X-Gm-Message-State: AOAM530/heMCo0xojjCheIHHDBqPBc2MHHSlnPtT/eKjlr4MnKnstRkm
 fr7ZCupwDbu9pFZEaJTLcqE5QRR4DucoTtj7m8U=
X-Google-Smtp-Source: ABdhPJxpA+rAOy8CGFGb0V7Q8yffnlhkpxscOQV5U71Ypt5nwje6CHV6BCtt99aN9HSK8O8Y0R9/0G9SpF89b8n8iSw=
X-Received: by 2002:a6b:ec08:: with SMTP id c8mr7915047ioh.55.1615508359573;
 Thu, 11 Mar 2021 16:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20210310045544.28961.qmail@stuge.se>
 <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
 <20210311144839.29454.qmail@stuge.se>
 <04a86207-325c-8170-6692-a87ec3b0fe4c@tronnes.org>
 <20210311200226.1166.qmail@stuge.se>
 <CAKb7UvihLX0hgBOP3VBG7O+atwZcUVCPVuBdfmDMpg0NjXe-cQ@mail.gmail.com>
 <20210311225751.2721.qmail@stuge.se>
In-Reply-To: <20210311225751.2721.qmail@stuge.se>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 11 Mar 2021 19:19:08 -0500
Message-ID: <CAKb7UvgRLa=_4vzeFS-ws6T28S_j8yz8Jq_ONowPcBKaBHwYkw@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
To: Peter Stuge <peter@stuge.se>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, th020394@gmail.com,
 lkundrak@v3.sk, pontus.fuchs@gmail.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 11, 2021 at 5:58 PM Peter Stuge <peter@stuge.se> wrote:
>
> Ilia Mirkin wrote:
> > > > #define DRM_FORMAT_XRGB8888   fourcc_code('X', 'R', '2', '4') /* [31:0]
> > > > x:R:G:B 8:8:8:8 little endian */
> > >
> > > Okay, "[31:0] x:R:G:B 8:8:8:8" can certainly mean
> > > [31:24]=x [23:16]=R [15:8]=G [7:0]=B, which when stored "little endian"
> > > becomes B G R X in memory, for which your pix32 code is correct.
> > >
> > > That's the reverse *memory* layout of what the name says :)
> >
> > The definition of the formats is memory layout in little endian.
>
> To clarify, my new (hopefully correct?) understanding is this:
>
> XRGB8888 does *not* mean that address 0=X, 1=R, 2=G, 3=B, but that
> the most significant byte in a packed XRGB8888 32-bit integer is X
> and the least significant byte is B, and that this is the case both
> on LE and BE machines.

Not quite.

XRGB8888 means that the memory layout should match a 32-bit integer,
stored as LE, with the low bits being B, next bits being G, etc. This
translates to byte 0 = B, byte 1 = G, etc. If you're on a BE system,
and you're handed a XRGB8888 buffer, it still expects that byte 0 = B,
etc (except as I outlined, some drivers which are from before these
formats were a thing, sort of do their own thing). Thankfully this is
equivalent to BGRX8888 (big-endian packing), so you can just munge the
format. Not so with e.g. RGB565 though (since the components don't
fall on byte boundaries).

> I previously thought that XRGB8888 indicated the memory byte order of
> components being X R G B regardless of machine endianess, but now
> understand XRGB to mean the MSB..LSB order of component bytes within
> the 32-bit integer, as seen by software, not the order of bytes in memory.

There are about 100 conventions, and they all manage to be different
from each other. Packed vs array. BE vs LE. If you're *not* confused,
that should be a red flag.

[...]

> > I'm not sure why you guys were talking about BE in the first place,
>
> I was worried that the translation didn't consider endianess.

The translation in gud_xrgb8888_to_color definitely seems suspect.
There's also a gud_is_big_endian, but I'm guessing this applies to the
downstream device rather than the host system. I didn't check if
dev->mode_config.quirk_addfb_prefer_host_byte_order is set -- that
setting dictates whether these formats are in host-byte-order (and
AddFB2 is disabled, so buffers can only be specified with depth/bpp
and ambiguous component orders) or in LE byte order (and userspace can
use AddFB2 which gives allows precise formats for these buffers). Not
100% sure what something like Xorg's modesetting driver does, TBH.
This is a very poorly-tested scenario.

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
