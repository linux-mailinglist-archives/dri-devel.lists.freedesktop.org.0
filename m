Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000444949E4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3709E10E922;
	Thu, 20 Jan 2022 08:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BF410EC0A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 20:14:10 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y15so4506045lfa.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kdECfyTlH9oIX1INZDhG7zfW8t8vpJV5SIYtDDGY1nc=;
 b=mVfChiTRlR52otgIciCZ+fVVRi8nHooY5ndpTYsWLVFk3NlEGYw4jeLbQHYh6BKxxI
 vlxeIjppYp65Y01iqLnfjYe1HSgQi9LnuZAcYROl76L0wkn/ihtCvLQJP11hZ549duCd
 U+yMDLD6IJtQFaiVbg17mGhD/Bg+xszj8xyEQOC91h+MO2S0Xi1Hf6aZUYZiaDClLJG8
 Fvply5AVXxI8ACmV5Z0a/SI4Lchm7P5apnX3JwAZnkBQlm3KZqi/lUwsPmY08HV/TrxU
 vgpHEQ1HnG3gBl4A4+7Jl1y1yC8WcN9BP9/VRG9PAosELLNmUq2p/ghLI9SuSZPAdCtb
 rbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kdECfyTlH9oIX1INZDhG7zfW8t8vpJV5SIYtDDGY1nc=;
 b=IymmJV+fwpQrCEnlTsDLUtgBbqqdjH5+GmYg4SKHLElP7Uf0PXkLVIescRm86Pg9AV
 OOX015BUh0HsLgCAoEmepCu4X3LyCvJDdKE+DrJGIgzzd5bSYbyWsgHq9Y44TwJr4+0P
 bhQmlG7ZqRVPZUnQ9GAULlXTeH4drz7zCt4z/6badJpVXwXSI2kET2qyXWlv1LMU3eLF
 JsHeG7RhRFrdRnjX/HKXM6ovZ5FCO3Qakrg/LXZN30q1pAHL+UCMfNe2+1LapOGFv/3R
 gDaftJcsSl9vMBEPtEy/pJb0Di1+3D2dzZGYZL4uwNZaCZ+F3ZgqmvsQNJhf1slVKUVh
 n0fQ==
X-Gm-Message-State: AOAM531nH6ozCJwZ5vp28Ow60o/pXx+h7yn5Rwyxt85JrgmAFvm/Y5ko
 2YlwT3rvD2C4Ymtk0A0HyN4z6YT+W3lXr6VyyDQ=
X-Google-Smtp-Source: ABdhPJy7lyRzLjKdMwTgSEYWLm+wfhMR600om5OGmmvwN2/K/WUWdz4wmJe8VFPXMmuG2eJ+qll39mfrBiWSWVSxGIQ=
X-Received: by 2002:a05:6512:39d5:: with SMTP id
 k21mr25180456lfu.474.1642623248573; 
 Wed, 19 Jan 2022 12:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20220109095516.3250392-1-yanminglr@gmail.com>
 <20220110004419.GA435914@anparri>
 <20220114191307.uu2oel7wbxhiqe56@liuwe-devbox-debian-v2>
 <CY4PR21MB1586D30C6CEC81EFC37A9848D7599@CY4PR21MB1586.namprd21.prod.outlook.com>
In-Reply-To: <CY4PR21MB1586D30C6CEC81EFC37A9848D7599@CY4PR21MB1586.namprd21.prod.outlook.com>
From: Yanming Liu <yanminglr@gmail.com>
Date: Thu, 20 Jan 2022 04:13:45 +0800
Message-ID: <CAH+BkoGWu7BgEJo9+c3kAcyEf1qptvmts1DMoW4RoP=3e7eN7Q@mail.gmail.com>
Subject: Re: [PATCH v2] hv: account for packet descriptor in maximum packet
 size
To: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
Cc: Andrea Parri <parri.andrea@gmail.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "lkmlabelt@gmail.com" <lkmlabelt@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 20, 2022 at 2:12 AM Michael Kelley (LINUX)
<mikelley@microsoft.com> wrote:
>
> From: Wei Liu <wei.liu@kernel.org> Sent: Friday, January 14, 2022 11:13 AM
> >
> > On Mon, Jan 10, 2022 at 01:44:19AM +0100, Andrea Parri wrote:
> > > (Extending Cc: list,)
> > >
> > > On Sun, Jan 09, 2022 at 05:55:16PM +0800, Yanming Liu wrote:
> > > > Commit adae1e931acd ("Drivers: hv: vmbus: Copy packets sent by Hyper-V
> > > > out of the ring buffer") introduced a notion of maximum packet size in
> > > > vmbus channel and used that size to initialize a buffer holding all
> > > > incoming packet along with their vmbus packet header. Currently, some
> > > > vmbus drivers set max_pkt_size to the size of their receive buffer
> > > > passed to vmbus_recvpacket, however vmbus_open expects this size to also
> > > > include vmbus packet header. This leads to corruption of the ring buffer
> > > > state when receiving a maximum sized packet.
> > > >
> > > > Specifically, in hv_balloon I have observed of a dm_unballoon_request
> > > > message of 4096 bytes being truncated to 4080 bytes. When the driver
> > > > tries to read next packet it starts from a wrong read_index, receives
> > > > garbage and prints a lot of "Unhandled message: type: <garbage>" in
> > > > dmesg.
> > > >
> > > > The same mismatch also happens in hv_fcopy, hv_kvp, hv_snapshot,
> > > > hv_util, hyperv_drm and hyperv_fb, though bad cases are not observed
> > > > yet.
> > > >
> > > > Allocate the buffer with HV_HYP_PAGE_SIZE more bytes to make room for
> > > > the descriptor, assuming the vmbus packet header will never be larger
> > > > than HV_HYP_PAGE_SIZE. This is essentially free compared to just adding
> > > > 'sizeof(struct vmpacket_descriptor)' because these buffers are all more
> > > > than HV_HYP_PAGE_SIZE bytes so kmalloc rounds them up anyway.
> > > >
> > > > Fixes: adae1e931acd ("Drivers: hv: vmbus: Copy packets sent by Hyper-V out of the ring buffer")
> > > > Suggested-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
> > > > Signed-off-by: Yanming Liu <yanminglr@gmail.com>
> > >
> > > Thanks for sorting this out; the patch looks good to me:
> > >
> > > Reviewed-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
> > >
> >
> > Thanks. I will pick this up after 5.17-rc1 is out.
> >
> > Wei.
>
> I'm NACK'ing this set of changes.  I've spent some further time investigating,
> so let me explain.
>
> I'm good with the overall approach of fixing individual drivers to set the
> max_pkt_size to account for the VMbus packet header, as this is an
> important aspect that was missed in the original coding.   But interestingly,
> all but one of the miscellaneous VMbus drivers allocate significantly more
> receive buffer space than is actually needed, and the max_pkt_size matching
> that receive buffer size is already bigger than needed.  In all these
> cases, there is already plenty of space for the VMbus packet header.
>

Appreciate for the additional insight on what Hyper-V would do!

> These hv-util.c drivers allocate a receive buffer 4 Kbytes in size, and all
> receive only small fixed-size packets:  heartbeat, shutdown, timesync.
> I don't think any changes are needed for these drivers because the default
> max_pkt_size value of 4 Kbytes bytes is plenty of space even when
> accounting for the VMbus packet header.
>
> The VSS driver in hv_snapshot.c allocates a receive buffer of 8 Kbytes
> and sets max_pkt_size to 8 Kbytes.  But the received messages are
> all fixed size and small.  I don't know why the driver uses an 8 Kbyte
> receive buffer instead of 4 Kbytes, but the current settings are
> more than sufficient.
>

Well, I'm not sure, on August 2021 there was a patch changing
max_pkt_size to 8 KiB for VSS driver:
https://lore.kernel.org/linux-hyperv/20210825190217.qh2c6yq5qr3ntum5@liuwe-devbox-debian-v2/T/

The patch mentioned a 6304 bytes VSS message. Which is part of the
reason I tried to address the more "general" problem of potentially
mismatching buffer size.

> The FCOPY driver in hv_fcopy.c allocates a receive buffer of 8 Kbytes
> and sets max_pkt_size to 8 Kbytes.  The received messages have
> some header overhead plus up to 6 Kbytes of data, so the 8 Kbyte
> receive buffer is definitely needed.  And while this one is a little
> closer to filling up the available receive space than the previous
> ones, there's still plenty of room for the VMbus packet header.  I
> don't think any changes are needed.
>
> The KVP driver in hv_kvp.c allocates a receive buffer of 16 Kbytes
> and sets max_pkt_size to 16 Kbytes.  From what I can tell, the
> received messages max out at close to 4 Kbytes.   Key exchange
> messages have 512 bytes of key name and 2048 bytes of key
> value, plus some header overhead.   ipaddr_value messages
> are the largest, with 3 IP addresses @ 1024 bytes each, plus
> a gateway with 512 bytes, and an adapter ID with 128 bytes.
> But altogether, that is still less than 4096.  I don't know why
> the receive buffer is 16 Kbytes, but it is plenty big and no
> changes are needed.
>
> The two frame buffer drivers also use 16 Kbyte receive buffers
> and set max_pkt_size to 16 Kbytes.  Again, this looks to be overkill
> as the messages received are mostly fixed size.  One message
> returns a variable size list of supported screen resolutions, but
> each entry in the list is only 4 bytes, and we're looking at a few
> tens of resolutions at the very most.  Again, no changes are
> needed.
>
> After all this analysis, the balloon driver is the only one that
> needs changing.   It uses a 4 Kbyte receive buffer, and indeed
> Hyper-V may fill that receive buffer in the case of unballoon
> messages.   And that where the original problem was observed.
>
> Two other aspects for completeness.  First, all these drivers
> do protocol version negotiation with the Hyper-V host.  The
> negotiation includes a variable-size list of supported versions.
> Each version in the list takes 4 bytes, but there would never
> be enough different versions to come close to filling a 4 Kbyte
> buffer.  So there's no problem here.
>
> The other lurking issue is the 'offset8' field in the VMbus
> packet header, which says where the payload starts relative
> to the VMbus packet header.  In practice, this value is always
> small, so there's no significant additional space to account
> for.  While it's theoretically possible that Hyper-V could use
> a much larger value, and cause max_pkt_size to be exceeded,
> there's no real way to fix this problem.  Adding an extra page
> to max_pkt_size, as it done in this patch, certainly provides
> some extra room, but doesn't guarantee the problem can't
> happen.  But since there's no indication Hyper-V would ever
> put a big value into offset8, I don't think we need to worry
> about the possibility.
>

Thanks for confirming this!

> My bottom-line:  Let's fix the balloon driver.  But now
> that we know the other drivers are safe "as is", let's leave
> them unchanged and not waste the additional memory.
>

Sure, after all I just want a working kernel :)

> Michael
