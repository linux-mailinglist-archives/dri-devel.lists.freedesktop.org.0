Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 576813D4DE8
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 15:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCCE6E2BC;
	Sun, 25 Jul 2021 13:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ABAA6E2BC
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 13:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627221537;
 bh=9JOWuUIENdIuSyDGKKcT4bIsyOiev+WVf9ryeJ+imdE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=P6kt0i8XF6A0F0yygNB/gkp3bZnqqKKLvcORcR84uwwllPD3flVNmjpKkILWIj4AL
 BrR8dbxa6sBhhfL9WF743xKu8l6DASgU9KqByPyBQSrv7BgPhsin0oy8iJ6VCzvJY8
 Gw1vCtrKEtsOc78viDkj2mB3KVosfhBXtZedag6s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from titan ([83.52.228.41]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MxDou-1lAKwS3Ptw-00xcK1; Sun, 25
 Jul 2021 15:58:56 +0200
Date: Sun, 25 Jul 2021 15:58:44 +0200
From: Len Baker <len.baker@gmx.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/3] staging/fbtft: Remove all strcpy() uses
Message-ID: <20210725135844.GA1953@titan>
References: <20210724151411.9531-1-len.baker@gmx.com>
 <20210724151411.9531-2-len.baker@gmx.com>
 <CAHp75Vd+ZM_yO6CU_6oJieePMt00Sp6oKEU2+QEyZxLDg5PN8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd+ZM_yO6CU_6oJieePMt00Sp6oKEU2+QEyZxLDg5PN8A@mail.gmail.com>
X-Provags-ID: V03:K1:iAqHZEABVjEHSpYT/IzYlVIkOHoMdCujwMQ6INd7zOiseMdT/st
 3LaYh3CImBe0kCexfi/eaHk7hTgIeSRAU/TjzYC71zay9UXyybrY1rx0XdBv8eGVWcK0jOy
 nFWo6knPP/H5sFodeL6Vk3flzYR8u8geyXI7qve4eXBNpFhfQ52KBpsXAyzgQqPWib0K5y/
 FDueNX/Pn/Lh5KkmYLPHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MEWIDFz4tLM=:Bl8LVt8MUnomMU2m6J980r
 dJxwSdOTDwOnyKoXm1xwlsvvQi+HKAIuK2yCFGliWF2Ppk79ZeJz0gsgqkFnRqmfrA2UQ8gr2
 q/mXYnabD4L6t+dALHYG7/RdFKBCieuSBw262oChGCA11oGTTIuaE7suH/Q0ibK+32rExXVsw
 TaarFA1KLbuP5H6IUNej9s1p5wrGPtsPgAWz4tk5rFkQNiV2afGIaGMLubMcVUaaLFqTS6s1G
 Iu0E92mUoGSY2nO6Q+AaPE2cS0S0hdOXqouekXLlXe7RPqA3+J2Y5GGdP8l1C4IiUziL3+oYY
 EFSGlfL5ZcyynwRNyHORqCwmMVKHZY4oTF0HNSczZBgKllrRC/4RhEzrK00FxDFn6xvf3a+B4
 Ox6zAJC/qUhEBRxXBm83GY8SUKuf84/C15BA3R2J23buHp1rx+aWzj4r0TXe2aXasrpls6DMi
 SWJkz5VdInaMy9iTrAbBIxJTteQ8j5XdLY3b0C8qMhKMJaKRYDQkuzsMUTJTQKeXAOcFDJkuj
 uB6FIm49j/zFPasxaRO3jBfJJE0dxoMhP2X/zj7uq7wroT5zW7EAAQBojxPT7wQ2r/dMbPRjf
 osqq8o6ulHRaIcwgs2o/hMTOqCvcR4HBsz00TzZFohuLBwp+zJ+Y0iZ6l9QbQwMvyELlr7wcm
 43psQVZwrYohLN8/l94HHVL36f/h+YqJFEgMwmQeD22CymYesK8ZDZKeqvXSyEbwImCyLcJv5
 elt5XydXm03aO3g8mHedThErBwjX8oS/tFL+ocPp6KZdJuzum4M+MxUgtNoK2jW7vGNDxbLQz
 XJsxbB2m1atmbgHX71J8HP/BKIb3X+MPcd7mYTJ9zD/MS8iBHbNFhei9vLYl/gcsZM6VuRiKQ
 XSp1IwlGGUv0SsRuGH47p6jhcAqvDpnE3eBl2/Zsxw0bqQ9P4i7zzhbfLVBk3lfc/IaawVOjX
 o7EjGQ++1eNsj4F75gJ1lQEl8V+HXT5bkpOx3CpFLidDb9aqEY48rCKovyLuD4mVat+giicB7
 6dHr4fpldjq7dB5rCHNuYEYZ1Q9RKeoZiMsgoEopx6wXwRoUroDhyYsCtVjuzlEj5mSYtc8Pu
 2YaxZ1q7RPTuicbfJGfxcMxtj7a+l+WFnhd
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Len Baker <len.baker@gmx.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Phil Reid <preid@electromag.com.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jul 24, 2021 at 11:21:04PM +0300, Andy Shevchenko wrote:
> On Sat, Jul 24, 2021 at 7:05 PM Len Baker <len.baker@gmx.com> wrote:
> >
> > strcpy() performs no bounds checking on the destination buffer. This
> > could result in linear overflows beyond the end of the buffer, leading
> > to all kinds of misbehaviors. The safe replacement is strscpy() but in
> > this case it is simpler to use the "%*ph" format specifier.
>
> ...
>
> > -       char msg[128];
>
> 128 / 4 =3D 32. So, this buffer is enough to debug print only up to 32
> bytes. Hence %*ph replacement won't cut output earlier than requested.

I'm sorry, but I don't understand what you are trying to explain. Moreover=
,
with the "0x%02X " in the sprintf followed by the strcat, the msg buffer c=
an
print 128/5 values (25 hex values).

The %*ph replacement can print up to 64 bytes, so I don't see any problem
here.

>
> ...
>
> > +                       for (j =3D i + 1; par->init_sequence[j] >=3D 0=
; j++);
>
> Why is i + 1 initial for the j? You may rather access the 'i + 1 +
> j'th element in the array...
>
> ...
>
> > +                                     par->init_sequence[i], j - i - 1=
,
>
> ...and get rid of the ' - i -1' part here.

Yes, it was the first idea but I prefer this method since we save aritmeth=
ic
operations. In other words, if I use what you suggest, the index for
par->init_sequence is calculated as a "sum" every iteration. But if the
performance is not an issue and you believe that the above is more clear, =
I
have no problem. What do you prefer?

Thanks,
Len
