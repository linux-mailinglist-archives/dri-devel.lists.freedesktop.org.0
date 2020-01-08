Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1851134145
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 12:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA68C6E1BC;
	Wed,  8 Jan 2020 11:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4ED6E1BC;
 Wed,  8 Jan 2020 11:55:59 +0000 (UTC)
Received: from mail-lj1-f176.google.com ([209.85.208.176]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M3VAI-1iphuB2d62-000dJk; Wed, 08 Jan 2020 12:55:57 +0100
Received: by mail-lj1-f176.google.com with SMTP id l2so3013473lja.6;
 Wed, 08 Jan 2020 03:55:57 -0800 (PST)
X-Gm-Message-State: APjAAAXtpk+eU8G/XidDm1NhiBX5iI5vQzRD5Doqo3WjPpQss9/6tF4/
 lO0Z/6KcADBCunW1KGzqtJqfaQ5H+0Nocb/I6FQ=
X-Google-Smtp-Source: APXvYqx76A/E4Ch8oNBJvonZ2jianfqelDGhZdcoyIiElnwI+5tX58xf2+wQq15Hqyr3lM5AXUWKqh7e7QV64xZG5mc=
X-Received: by 2002:a2e:9095:: with SMTP id l21mr2608508ljg.175.1578484556968; 
 Wed, 08 Jan 2020 03:55:56 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
 <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
 <2355489c-a207-1927-54cf-85c04b62f18f@c-s.fr>
 <CAK8P3a21yPrmp4ik3Ei1BZfeqZNf0wL5NZNF3uXqb4FLRDyUPw@mail.gmail.com>
 <20200108091549.GB10145@pi3>
In-Reply-To: <20200108091549.GB10145@pi3>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 12:55:39 +0100
X-Gmail-Original-Message-ID: <CAK8P3a19ZgLhKJ016Mt_FyZrqnKaWwJyiaauMiUDAHV=DB9_2w@mail.gmail.com>
Message-ID: <CAK8P3a19ZgLhKJ016Mt_FyZrqnKaWwJyiaauMiUDAHV=DB9_2w@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:OLXxgklWfaLMhKuV8Wm8W39kUcHf4a+JyIfGa7uJ3yUjlTzpkyq
 eUd43K01aWA0i0ihiEp0mFdU1+/TaTZ/mvHEN/LvbjMgj+pw8G3G130nvwrLwWWZ9rkwc9y
 kIqJX9t0G2fM4p+HKuF78v7pt07b490bIVjM/G5rXC1PfGFIuGJzrH6CtWhepiGwo3n8FoV
 f9mNGXU4LtPGfMjnCSQHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k1T+yO7/AYI=:wC3ZSi6xX/4CO8QldrMdvY
 JOzpZSuOnyZeuROZmx2xIAHn/3tJjCqCfl+D7wo1n9saXZ2eUIm4HLndFSGzDVvvm01nRYsjX
 IhkaQf/a/tlicda2eH8CmWenZ2z0oi/Hg/5SpWBa5XCdmHaH5aqWvz1hNijlmfPJVpNmRiEek
 gf5E0EauCFUo/eHgBERs1Zx+fhkyqOx3wpS/tKnKDyjA3loKbKczpoAxPMiNfxwX39n+J8R05
 n98+jXAUURpGT8fBQH71ucrLqI5inC9FWvQrPaVlAXy3ggQjmlTPnOo0fHqDPhKw+mZWhHwrZ
 5R8mE9dgM9gd4rVAGDqevM8kYL9VweOFm1aCRHDRH0X9Db7Ta2w9bOgrEBTOYqnSgCR4Yx0cE
 SPsAEmWWFWdwVNgAob7EgVNz67ZPHdvxPoDMbBXbLcWm1tLZoRRqLS6Gx08MLqOQCJI5ufBaf
 TdlqSWo5wgYc5Istd7nU3/JfFsXK26QdgGERofOrDvUk7v7LQgR/SD12YeuqiXMGEHeLW2ZEs
 w51Brg7z9ATxU9rc3lrFTyXAgdGg0qc+v/ua2ztsQf0r2bS+boy6Dsd6JtERtyetIsqIZj3eE
 a0ry8Opmz4QUO47vFtYuTfDq2VSyI7uoro1845lHmn9/OQpQq4ZLJ1e+wFQLKT9wWQIHHxQKY
 X0CbsTm4C/pg/ATi7nvKDXtHO+WNsRmYXxt6h97uVxYUVHs/0eNGuZ9t9B6MS6sg0aLiwXz0S
 aUn97u2vvRkanwYSEh6N4l8qIlPXGc+W5Ia4gHR4ScnqV6FYWCudsdFdL0NjFKkf/7mZQ8Kaw
 dsqRye3wNWFASPvIud6fqJKCLOITeL5k8vAftrql30E4S2C4niX9a1scUQyxGYgjyw5KkQ2sI
 4pcaTkoVVB8VBrmP+Xlw==
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>, Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Helge Deller <deller@gmx.de>, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Jon Mason <jdmason@kudzu.us>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Parisc List <linux-parisc@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 8, 2020 at 10:15 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> > The __force-cast that removes the __iomem here also means that
> > the 'volatile' keyword could be dropped from the argument list,
> > as it has no real effect any more, but then there are a few drivers
> > that mark their iomem pointers as either 'volatile void __iomem*' or
> > (worse) 'volatile void *', so we keep it in the argument list to not
> > add warnings for those drivers.
> >
> > It may be time to change these drivers to not use volatile for __iomem
> > pointers, but that seems out of scope for what Krzysztof is trying
> > to do. Ideally we would be consistent here though, either using volatile
> > all the time or never.
>
> Indeed. I guess there are no objections around const so let me send v2
> for const only.

Ok, sounds good. Maybe mention in the changelog then that the
'volatile' in the interface is intentionally left out, and that only users
of readl/writel still have it to deal with existing drivers.

    Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
