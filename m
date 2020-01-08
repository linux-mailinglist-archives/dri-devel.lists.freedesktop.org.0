Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B0134E07
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 21:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B550A6E339;
	Wed,  8 Jan 2020 20:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004106E339
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 20:54:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com ([209.85.214.180]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MOzGc-1j3YT40rQy-00PNKf; Wed, 08 Jan 2020 21:54:14 +0100
Received: by mail-pl1-f180.google.com with SMTP id ay11so1582367plb.0;
 Wed, 08 Jan 2020 12:54:13 -0800 (PST)
X-Gm-Message-State: APjAAAW55FakGbrpalHABAQiRPjpJ9RqiyYJY4wTsjvk/r8OK4X+TT+O
 uaULWYRlFfIKhnXEwrHeVRoNwT5r3ylhUVaPwvg=
X-Google-Smtp-Source: APXvYqyt7qWPMbb6m9h/4PQhRs0y159Kx6Uivm6Z+B5Q5nxhhZUKK+jBierZEh41gZgxiLkvgkWmKuzOcUQAJHTJ9Lg=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr5946876qvg.197.1578516850954; 
 Wed, 08 Jan 2020 12:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20200108200528.4614-1-krzk@kernel.org>
 <20200108200528.4614-2-krzk@kernel.org>
In-Reply-To: <20200108200528.4614-2-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jan 2020 21:53:54 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
Message-ID: <CAK8P3a2ieH2G5GJvWMev39QkmSFvWSb0sYZ_0L5McR6AZFiayA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] iomap: Constify ioreadX() iomem argument (as in
 generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:g9E/DHYDerAF765D9ZGSli8tbMiChFQuFhlsvtTeCrPpgvB+6fL
 qedf72XEgWTu9gdhgUl/LpAdjTZi065iUEFnyjGMjoUB4EXuS1R1FbkO/AedQ4b0BbktzOc
 bo/A5UqQEtN8C+O8YhB5npqaTICaPCae88zOplIiph5QyZmxKH+V5iWYZNTvtF80xvzZp0+
 aOeKLRjMYO5vLPjAKT5EQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kScDZSuIRDw=:7LezEQURE3nwTRh3egLb1J
 Qov4rhDaHk7Q28HOdThfiI68NG21sYxKMXTUKAl6mouLh4UTKyOvsc+nvEeNER07jTwGHIfoq
 kc8fQm/9I0kQ7HZRWJP5XDaSxH4sf8hd4gHRQkZXFAeyevSP0CzBcY9BZ1vE0k9Q3vAoANPxA
 TtUNx7PCEWZxQX96Rvt4CHIDsU0Nmau8UzpimT1PBbsWQ5yVyyxfaBj87rJEfDSq6dE+83ggc
 uKFuBYVcis3eCsZdCjc2ShrWYgleI3HOuSaGLUZt3NKrBmFs01/7B7ZqCdM51boIBtrvSsaKR
 ApF+pny+xJnoSz82osydB6qn+T9CJWhHOdDbBDuvYHZFRHXIIUYsHZDsZUTDCoZRt7/bCVz1+
 mS+vhjbZT5CUpzz9QyZKdr3trwEj1Zls4LPRo6NJ9R5ADyhecQlA7rpkZMI/MSdikAgvG3HGh
 FLTFcohR+pkgVHJXKIdKrZ214ejRqwGIfSiqqTkEiMlda3V/sFfwCvZIhOwbSeqWitjotiI0s
 VEVx7lbPeLUxr0VSZ9bzFqIlIYrLY/7gOp4ZA7xgLa9tLAZQ1PQf4bAbrCT5ttLJaMmPQa4/8
 Xr7/a3nxRfB1NrhrwU7w+svC3D6TjOoVe/WRJVYfdku86QRSYkU3Ny287ZQ0dXGmLDzhexmdV
 SSE7wt4yg2T+ONcaYU0u0HHH2vpg5oKnoWWvS+3REKg3E5Ia5tsko4PQwHMLwlYQZXeCQUVbB
 XXDbttfpLE06ZUBpd75CvCm+O+7+dbfLFX0RS+jHZA1b/UtU8igLRegtkXK9rX+oHtUYrnRQm
 lP8+llPiy/CAYP9+zDbp9qF18vTHWxQ4VY/l7hScxf/F7mmAZoOCgzFGWBd7iLbeaj5eH6GZC
 0/zKwGwy4HL2N4XDIEsg==
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jon Mason <jdmason@kudzu.us>,
 linux-ntb@googlegroups.com,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 8, 2020 at 9:05 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() and ioreadX_rep() helpers have inconsistent interface.  On
> some architectures void *__iomem address argument is a pointer to const,
> on some not.
>
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for getting this done!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

> Changes since v1:
> 1. Constify also ioreadX_rep() and mmio_insX(),
> 2. Squash lib+alpha+powerpc+parisc+sh into one patch for bisectability,

The alpha and parisc versions should be independent, I was thinking
you leave them as separate patches, but this work for me too.

I have no real opinion on the other 8 patches, I would have left
them out completely, but they don't hurt either.

         Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
