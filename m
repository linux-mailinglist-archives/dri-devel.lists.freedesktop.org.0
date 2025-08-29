Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B76B3C3E9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 22:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8163F10E2A0;
	Fri, 29 Aug 2025 20:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="Cks1foIN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D0F10E28E;
 Fri, 29 Aug 2025 20:49:00 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 9917D40E0176; 
 Fri, 29 Aug 2025 20:48:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1HIo8XtwEOWj; Fri, 29 Aug 2025 20:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1756500535; bh=kkuOsSBk0lMyzox1zOeLQPDxcRHJN+ocAuOHBc3PZP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cks1foINE6OFW+Tiv7M8/BbnxobBbsjbjNcWwVO+MlyUQxZ1tFIoWXMyesIn93wvH
 5TfexEGy+7nMu/JY23HtB54MW1wTXBNMUSAoY19toCfivVOudSyZjtC8ri0faCnMiy
 N5uIvbyifLq+IxOOOrZ64hxFaJhLsf/Tm5b4BGvheerF5VsjTl6WVuanrfJFAyuSks
 05QGSpei7pU5Ecz5RxCbkR2UDsG3IgZVPZ9XqkRB2/prSoO47P41j92ojKavCiAHGV
 TVV0PG3dVYMlnxI5QquqVgEPBqHkG+U9IFRf/jAUjrwQFyAFrY1yzaWuSvRxPAFthn
 f9OzvjKrRWxxPrhOwhq4bzOUhuIZbmfGO1LR0of0+5ZIl/j0V2/Wr0woTsuM0U9j0U
 vAUZknYZ8Eycp7NCTijxciAQdE/gjQTk+wxX1ypak0OStd/ZWadkMFDgc6+riwD76N
 TxDHQmMxs+6xnS35tw0Y6vJUtmC7wF12CXX6pzgefok6MeNtPGeDBmt1BTt1RIi4Ep
 zQuuIgwLnPfy4E3JO5QyTpe53bAu6/jyHdqxt12S1ltQHO/HlclBp+QX67lxAjM733
 OsqIOKSjVGMJdnkv/dkdqPPO5F/N/GtmXwB787FuDcc4RcI00FizNRKYwmk/eah/pG
 Mpk/90nsCbpfrts5uqD9Eb5U=
Received: from zn.tnic (pd953092e.dip0.t-ipconnect.de [217.83.9.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id
 2884440E016E; Fri, 29 Aug 2025 20:48:49 +0000 (UTC)
Date: Fri, 29 Aug 2025 22:48:40 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
Message-ID: <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
References: <20250829171655.GBaLHgh3VOvuM1UfJg@fat_crate.local>
 <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
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

On Fri, Aug 29, 2025 at 09:40:44PM +0200, Borislav Petkov wrote:
> On Fri, Aug 29, 2025 at 02:26:50PM -0400, Alex Deucher wrote:
> > Have you updated mesa?  Looks like a userspace change.
> 
> Yeah, I did a long overdue OS upgrade today:
> 
> $ grep -i mesa /var/log/dpkg.log

Btw, this thing:

                                if (p->rdev && (size + offset) > radeon_bo_size(reloc->robj)) {
                                        /* force size to size of the buffer */
                                        dev_warn_ratelimited(p->dev, "vbo resource seems too big for the bo\n");
                                        ib[idx+1+(i*8)+1] = radeon_bo_size(reloc->robj) - offset;
                                }

is yet another example of useless flooding of dmesg.

It's not like I can do anything about it except report it. And that thing
fires every 5s or so.

You could consider turning that into a _once thing and be done with it.

And someone already ratelimited them:

59d76d6bc206 ("drm/radeon: ratelimit bo warnings")

but it ain't enough.

$ dmesg | grep "vbo resource" | wc -l
22393

So even if I go and find which commit added it:

  cb5fcbd540b4 ("drm/radeon/kms/evergreen: add initial CS parser")

I'm still none the wiser. And I'm not even a normal user - I have seen kernel
code in the past :-)

Hell, I don't even know what CS is...

/me goes and searches the web a bit...

Aha, it could be a command submission parser or so. Still have no clue what
this warning is telling me.

Going back to searching the web...

ok, so it looks like this is validating some packet3 set resource thing and
when the resource type? is a SQ_TEX_VTX_VALID_BUFFER - perhaps a valid vertex
buffer? Vertex buffer I understand. But texture vertex buffer?

Anyway, it checks whether the vbo (vertex buffer object?) resource is
too big for the buffer object which has gotten as some sort of a relocation
packet 3 thing...

And I still have no clue what is going on. Perhaps the new MESA is sending
wrong command types, who knows.

I absolutely cannot fix it - that's for sure.

And so this rambling of mine confirms my old theory that the warning and error
messages we put in the kernel are not really useful. Especially to users.

Because there isn't a whole lot they can do about them except reporting them
to those who can actually do something about.

I.e., those messages might as well be hashes which we can stick into a lookup
table to fish out a longer string which tells us what is going on.

So I *think* you should make this a once message or *at* *least* ratelimit the
hell of it so that it appears very seldomly. The rule of thumb should be what
you want this message to do?

To make a user report it to you?

Or something else?

In any case, I am already very picky with the error messages visible to users
in the code I'm maintaining, this'll make me be even stricter.

Oh well.

Thanks for listening. :-)

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
