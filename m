Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D44C7AB9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 21:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A634E10E8CE;
	Mon, 28 Feb 2022 20:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236E610E8CA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 20:43:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b11so23409773lfb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 12:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S/LNP14iVGpJY7HEU3KoWC3rGBeIOldyeXi/18P4YEg=;
 b=JCfpf2EkV0u8p2DIwI3SoZoRhHthQMEAy9/7LEkowc8JnTmPgsFXHlzh4U3t+Q6SEk
 Lc7ftzGO2kIrejoWkV3dzzd0jpx1zu67BigJ1Dmt6MH2aSREOTU5VOooJKZjMGKU+kco
 F0IyOo2hDxkf3WtcbllN4ffR7kqC0AZqO0I4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S/LNP14iVGpJY7HEU3KoWC3rGBeIOldyeXi/18P4YEg=;
 b=TzEKy5hQ4fUfB8PRvttyOGMfJodPiLHJuXN11Podmcdiqdh/g8sYr3s9FT+F72I/uv
 klgN6UiAk0gzOREan02+hfyfFVs7LPzY1vOjwZIA3q9WhVH0k9b3nOEVioof2tz6FgpK
 7St9A/MOmqC2mZbp0rAMJLx7WmTlTzPHBku7YsftKW87GdjXDDtL9XOzqf4SwWxTdrQX
 BhnvH1n1sReTKwhMGPkd3ntbrrJtC6ZTzDygNCz8VedyBUvAfQBP9DDKi775HAcldGgV
 ci5maDH4QmY0alT2h23Leg0qJQsET5ayWMg4FNAtbw0CccKDMNCL6h72dNxsZTxVQkFM
 ti3w==
X-Gm-Message-State: AOAM531oDNHrmk44fsxQq9/FHAsRZY2u9ZQHXTO5lCUDDCcc3T5lUnTX
 eikgG2ofnnhi4GceVt8SPrmvH2v2x8sRWj63iaM=
X-Google-Smtp-Source: ABdhPJwEORMIsL375Q7DF2s81U4bskMEqXWCKZHQH/fRrm3C/QgI3cyPos6QoUuugmPPa8xlQ5hdRQ==
X-Received: by 2002:ac2:43cb:0:b0:443:7bed:75e4 with SMTP id
 u11-20020ac243cb000000b004437bed75e4mr12976111lfl.230.1646080982940; 
 Mon, 28 Feb 2022 12:43:02 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 e3-20020a196743000000b0044311216c42sm1131931lfj.307.2022.02.28.12.43.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 12:43:02 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id d23so23385191lfv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 12:43:02 -0800 (PST)
X-Received: by 2002:a2e:924d:0:b0:246:370c:5618 with SMTP id
 v13-20020a2e924d000000b00246370c5618mr15158756ljg.358.1646080652034; Mon, 28
 Feb 2022 12:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com>
 <2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
 <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
 <CAHk-=wj8fkosQ7=bps5K+DDazBXk=ypfn49A0sEq+7-nZnyfXA@mail.gmail.com>
 <CAHk-=wiTCvLQkHcJ3y0hpqH7FEk9D28LDvZZogC6OVLk7naBww@mail.gmail.com>
 <Yh0tl3Lni4weIMkl@casper.infradead.org>
In-Reply-To: <Yh0tl3Lni4weIMkl@casper.infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:37:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
Message-ID: <CAHk-=wgBfJ1-cPA2LTvFyyy8owpfmtCuyiZi4+um8DhFNe+CyA@mail.gmail.com>
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
To: Matthew Wilcox <willy@infradead.org>
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 12:16 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> Then we can never use -Wshadow ;-(  I'd love to be able to turn it on;
> it catches real bugs.

Oh, we already can never use -Wshadow regardless of things like this.
That bridge hasn't just been burned, it never existed in the first
place.

The whole '-Wshadow' thing simply cannot work with local variables in
macros - something that we've used since day 1.

Try this (as a "p.c" file):

        #define min(a,b) ({                     \
                typeof(a) __a = (a);            \
                typeof(b) __b = (b);            \
                __a < __b ? __a : __b; })

        int min3(int a, int b, int c)
        {
                return min(a,min(b,c));
        }

and now do "gcc -O2 -S t.c".

Then try it with -Wshadow.

In other words, -Wshadow is simply not acceptable. Never has been,
never will be, and that has nothing to do with the

        typeof(pos) pos

kind of thing.

Your argument just isn't an argument.

              Linus
