Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDF0694CDC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 17:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EAE10E62F;
	Mon, 13 Feb 2023 16:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
 [130.133.4.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5077C10E61E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 16:31:00 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.95) with esmtps (TLS1.3)
 tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1pRbiw-0043kT-S2; Mon, 13 Feb 2023 17:30:38 +0100
Received: from p5b13aa49.dip0.t-ipconnect.de ([91.19.170.73]
 helo=[192.168.178.81]) by inpost2.zedat.fu-berlin.de (Exim 4.95)
 with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1pRbiw-0046cc-HY; Mon, 13 Feb 2023 17:30:38 +0100
Message-ID: <dbda1f6e1c280c13d963ad6e7f68a853a7741199.camel@physik.fu-berlin.de>
Subject: Re: remove arch/sh
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 13 Feb 2023 17:30:36 +0100
In-Reply-To: <20230206100856.603a0f8f@canb.auug.org.au>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de> <20230206100856.603a0f8f@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.73
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steve!

On Mon, 2023-02-06 at 10:08 +1100, Stephen Rothwell wrote:
> Hi,
>=20
> On Fri, 3 Feb 2023 09:30:37 +0100 Christoph Hellwig <hch@lst.de> wrote:
> >=20
> > On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wro=
te:
> > > Since this is my very first time stepping up as a kernel maintainer, =
I was hoping
> > > to get some pointers on what to do to make this happen.
> > >=20
> > > So far, we have set up a new kernel tree and I have set up a local de=
velopment and
> > > test environment for SH kernels using my SH7785LCR board as the targe=
t platform.
> > >=20
> > > Do I just need to send a patch asking to change the corresponding ent=
ry in the
> > > MAINTAINERS file? =20
> >=20
> > I'm not sure a there is a document, but:
> >=20
> >  - add the MAINTAINERS change to your tree
> >  - ask Stephen to get your tree included in linux-next
>=20
> And by "Stephen", Christoph means me.  When you are ready, please send
> me a request to include your tree/branch in linux-next (usually the
> branch is called something like "for-next" or just "next") telling me
> the git URL, and the contacts I should send email to if there are
> conflicts/build issues with the branch.  I will then fetch the branch
> every time I create a new linux-next release (most work days), so all
> you need to do is update that branch each time you are ready to publish
> more commits.

I'm in the MAINTAINERS now in Linus' tree. I have requested a kernel.org
account now and will hopefully have my trees set up later this week.

I'll let you know about the URLs as soon as possible.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
