Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A914C84D2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B47E10E565;
	Tue,  1 Mar 2022 07:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0B710E8F3;
 Mon, 28 Feb 2022 21:19:07 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id e13so11824167plh.3;
 Mon, 28 Feb 2022 13:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=pX3FOaQ5tpG+krWAy5EzbawK39YqA5YwRZTg6hddt4E=;
 b=JpEWCU5sl0Tb/FD34RSH61Ey9dRKreZqOQa3CJ02luf0uqIT78+8GWNevF0TXmNO1k
 V82hjNGseb3oWLNgnnFwXHAFmfIF+pTCtPsXm95pt2iCzBmJFwg04njU2K1WfIC8K4PQ
 JYTCrkA4ACMCh2biL4u47uoOFfhnbmO/1jCCSOx3OESfK5+oDGNitg9s7NqsmIU5fVsE
 xsR4ABTTJUTksMDshckaPyVLHegSArBm3erCaRT01IEJkH2S1g98XNdRHKV6JZW5AanM
 gI9+nSzlxhKCRaqGLAQjGqwME5o9/K6faQyfblLD265MKP0MWlgdnuFxCRxjUTwlasET
 Zo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=pX3FOaQ5tpG+krWAy5EzbawK39YqA5YwRZTg6hddt4E=;
 b=egp74ez16sYePF6VXevNYQckygfSYtAquVgDmEOAcYIQTBoEpsLbK4H+LZuEvIwkrU
 o9FT+OMTU6JFOombmD7QpAKGgTSlNU1ZMoGXbGc2fh9sGa6d/e6mJq7KJEUKLIg0c65L
 ZHRidR5OQjdsIaGzQQaP3xbyP4jSfXIaX0pJi5knkKAjR7j+nJOgusWz3ZiwTcj94zX6
 Sc8stgED187TT6TbsIhRuZADQ4kJUMxsBwx14Hm44Dry5quEJ6gUQIEXGoGEM6wwpYhm
 UG+DqPDmELgBxqMjU9WMf9+U/8GqS/U+/eH9TzrYq+GJRLa3D6LQBfbaX3436obcQUHQ
 sSuw==
X-Gm-Message-State: AOAM533hTJhroOcyATPueYVwzrRJa69BtCOifI9hLOk89BiMZcyDjo5n
 h/X7EoVxqljkiX3sojtpI4C3sFUh6w057XaZJV4=
X-Google-Smtp-Source: ABdhPJxYQDaw0FFWrTXZCk3OvnKpy6mSdQ8Z9qbCWYQ2FvSetamSp4Rz90y2uoGU7tjomvOtre1MYsL9s+rZuYttBVs=
X-Received: by 2002:a17:902:ce8a:b0:14f:fd0e:e4a4 with SMTP id
 f10-20020a170902ce8a00b0014ffd0ee4a4mr22765912plg.47.1646083147399; Mon, 28
 Feb 2022 13:19:07 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
 <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
In-Reply-To: <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 28 Feb 2022 16:18:56 -0500
Message-ID: <CAH8yC8nwp8f3rANhCiiP_Oiw2cjfqCwAgZdTXY9OxtN9Tmm7HA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 01 Mar 2022 07:18:19 +0000
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
Reply-To: noloader@gmail.com
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
 linux-aspeed@lists.ozlabs.org, linux-scsi <linux-scsi@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 Linux PM <linux-pm@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, v9fs-developer@lists.sourceforge.net,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-sgx@vger.kernel.org,
 linux-block <linux-block@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 linux-usb@vger.kernel.org, samba-technical@lists.samba.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
 tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 3:45 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> ...
> > Just from skimming over the patches to change this and experience
> > with the drivers/subsystems I help to maintain I think the primary
> > pattern looks something like this:
> >
> > list_for_each_entry(entry, head, member) {
> >      if (some_condition_checking(entry))
> >          break;
> > }
> > do_something_with(entry);
>
>
> Actually, we usually have a check to see if the loop found anything,
> but in that case it should something like
>
> if (list_entry_is_head(entry, head, member)) {
>     return with error;
> }
> do_somethin_with(entry);

Borrowing from c++, perhaps an explicit end should be used:

  if (list_entry_not_end(entry))
    do_somethin_with(entry)

It is modelled after c++ and the 'while(begin != end) {}' pattern.

Jeff
