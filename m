Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F0E1A22D9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 15:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666E46EA5B;
	Wed,  8 Apr 2020 13:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCDA6EA5B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 13:23:30 +0000 (UTC)
Received: from mail-io1-f44.google.com ([209.85.166.44]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MOiPx-1jf4hj3YGF-00QCNe for <dri-devel@lists.freedesktop.org>; Wed, 08
 Apr 2020 15:23:29 +0200
Received: by mail-io1-f44.google.com with SMTP id f19so7818iog.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 06:23:28 -0700 (PDT)
X-Gm-Message-State: AGi0PuYobfVc0aSPV08E7vdqtg6byctuBh28PVr50SSMPlW4s35IG+6L
 jQs7kj6qA2RDvYyoAHe6skU8ptYiMQOJuI90hXY=
X-Google-Smtp-Source: APiQypIZqfyiKAf9iZweRfXbeG68flo58OpjYYdhdvQ5GWYcHF1GFWr0NIasaAFWu9U3CGPPywhiTEL6NA5dmjZoqSM=
X-Received: by 2002:a37:2714:: with SMTP id n20mr7421082qkn.138.1586352205739; 
 Wed, 08 Apr 2020 06:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <bac9af641140cf6df04e3532589a11c2f3bccd2f.camel@kernel.crashing.org>
 <87pncprwp9.fsf@mpe.ellerman.id.au>
 <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
 <871roykwu6.fsf@mpe.ellerman.id.au>
In-Reply-To: <871roykwu6.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Apr 2020 15:23:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
Message-ID: <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michael Ellerman <mpe@ellerman.id.au>
X-Provags-ID: V03:K1:3fuvfjHa3BjGZldR/XX8MC+ASwEe+WJ4eRioMrbOKTOIP3I0TpB
 H20ctguFAXyQNjl9GB8af+lqvv+uzpxhCtIw3BUoWSBT5Cns8GZZntDKgXNxUjzPNzFuGmF
 LyEQQh7fqrpe7zFY3pRSDr5SfDB7tAL/RVim+RD8V5OVDBcCDnOGA6aS1XpNPKLiMx69hwN
 0hFnXTWfBXs4ulTQAGazw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D4ktgXL7yFs=:N6lVjZkQrAV+v4m+FBQ8k3
 VJ3UNvvzwSbw0BahT5Qq7HEUWFH5A6rFdQo5QYc5GrMdxguCADgx38oMzGRdvfZPPZiT2U2UL
 CYcXURTb7Wu2350BsI+dRyMtLO4EpVgVcE2n5YiHFGD/D6qrSbF20nkVmpQcALNx1pyfGn/rb
 1XRQ10U6GFcEge7f248cmtr/vrpsfRdmgNLlIhLXAjdbNalemPFi6IyRWwMVSlrEqBe1cVw8A
 DmI+q3O2crQePpJOWQ1tXUbxjS/CQmd7ftGju+qN1oLMaSzLNIl2Q4jJapl+elQRYPhGjOYdH
 p03dbycrUSKp6P4INYtARwS1qzD/UPsqwVzXbnpbgaVDGbYTRhqP82MoPaM2kGAULvt9jRsKU
 5KEwyzw8R5asG7+WY8yJVLGJxhIkRo/KP8ISriRB9t9FFCJWiz7VoRdEuyGFtIwTXwNB4WrBp
 XhVKV3akJGq+3xS5BCF6iKFn+VtSUPQ6zRubwL8pBYq3P4WAQDXZjKD7FIIYc3JdN0jvwbMvz
 zpgjmJ2pdshlCK9AgrDoHZt7nOVaLt/PU1kagXXFfvvdGeQV83+D1G6KW6+A0XHDmUTzazrse
 ZDscWdos3R+tElgpjNjDVwM8m3NbWwTL3DzqGQ3v5zXiETZoT2ltMoqddWFEa5/XUVm6Q2iWb
 EXa66qzq6vggPecvHmJHAljcSqxJUb6zNUsTL1dqV00Ke29Ocz7K7oimu79JSgsoYXwAsjoip
 VS7VS+lS14zLEZt50YfJ19qcw5ibs/xPXGpCKfKSSYrbbvjXwB+4ZF+09lxZdw8YqnvYWExCw
 cd1ppdufw25bymybhckloN46AXKV6iB5tMipRTe8fCkUhDjVfA=
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+On Wed, Apr 8, 2020 at 2:04 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> > On Fri, 2020-04-03 at 15:59 +1100, Michael Ellerman wrote:
> >> Benjamin Herrenschmidt <benh@kernel.crashing.org> writes:
> > IBM still put 40x cores inside POWER chips no ?
>
> Oh yeah that's true. I guess most folks don't know that, or that they
> run RHEL on them.

Is there a reason for not having those dts files in mainline then?
If nothing else, it would document what machines are still being
used with future kernels.

Also, if that's the only 405 based product that is still relevant with
a 5.7+ kernel, it may be useful to know at which point they
move to a 476 core and stop updating kernels on the old ones.

          Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
