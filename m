Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A973E4814D1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 17:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BC910E1DF;
	Wed, 29 Dec 2021 16:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830D810E1DF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 16:03:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C5F876150C;
 Wed, 29 Dec 2021 16:03:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8504C36AE7;
 Wed, 29 Dec 2021 16:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640793799;
 bh=JjpeFlX1D08ft528esGQ/Dmp3d8gak2dGxLVU5277kI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=JpP2t1WEsiIyRq1md3yeDJqKD5b+v6vPK3dQL5KYtPRU6IzcCE2hfeoejuHeG11gd
 lC8IFpViEh+GNBkNBx4n5nW244Tql53dIjOETTsQ8i+5UfJvW9Ilc8EhjCT4Q4lOA4
 QM42sYWxI3kXC/do4dsN3O/F/5QTnKyWIH4D+TjWyd3Qv8ZelIjD6sZhRig841ypqR
 mTWsO71n3E7t2fJyuxqamjyrcVx+C0YBZwG9aCQStF11NC5RlZEPgKB5Mk28JwNuWp
 wwR/on9msDkJi5KBJfEq5mX9Wm2DfRpIzk3oUTTCtQJyiHOzO2W6s1m8x+iPToCIeX
 pL3LlEJMF3ouw==
Date: Wed, 29 Dec 2021 10:03:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <20211229160317.GA1681139@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211229131207.1ac25424@coco.lan>
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
Cc: linux-fbdev@vger.kernel.org, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ettore Chimenti <ek5.chimenti@gmail.com>,
 linux-ide@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, linux-i2c@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Hannes Reinecke <hare@suse.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, linux-scsi@vger.kernel.org,
 Sumit Saxena <sumit.saxena@broadcom.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>, linux-csky@vger.kernel.org,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 Jakub Kicinski <kuba@kernel.org>, MPT-FusionLinux.pdl@broadcom.com,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 linux-input@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Jean Delvare <jdelvare@suse.com>, linux-watchdog@vger.kernel.org,
 Niklas Schnelle <schnelle@linux.ibm.com>, Jouni Malinen <j@w1.fi>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, John Garry <john.garry@huawei.com>,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ian Abbott <abbotti@mev.co.uk>, Mark Brown <broonie@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 megaraidlinux.pdl@broadcom.com, Teddy Wang <teddy.wang@siliconmotion.com>,
 linux-hwmon@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nick Hu <nickhu@andestech.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "David S. Miller" <davem@davemloft.net>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Forest Bond <forest@alittletooquiet.net>,
 netdev@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 29, 2021 at 01:12:07PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 29 Dec 2021 12:45:38 +0100
> Niklas Schnelle <schnelle@linux.ibm.com> escreveu:
> > ...

> > I do think we agree that once done correctly there is value in
> > such an option independent of HAS_IOPORT only gating inb() etc uses.

I'm not sure I'm convinced about this.  For s390, you could do this
patch series, where you don't define inb() at all, and you add new
dependencies to prevent compile errors.  Or you could define inb() to
return ~0, which is what happens on other platforms when the device is
not present.

> Personally, I don't see much value on a Kconfig var for legacy PCI I/O 
> space. From maintenance PoV, bots won't be triggered if someone use
> HAS_IOPORT instead of the PCI specific one - or vice-versa. So, we
> could end having a mix of both at the wrong places, in long term.
> 
> Also, assuming that PCIe hardware will some day abandon support for 
> "legacy" PCI I/O space, I guess some runtime logic would be needed, 
> in order to work with both kinds of PCIe controllers. So, having a
> Kconfig option won't help much, IMO.
> 
> So, my personal preference would be to have just one Kconfig var, but
> I'm ok if the PCI maintainers decide otherwise.

I don't really like the "LEGACY_PCI" Kconfig option.  "Legacy" just
means something old and out of favor; it doesn't say *what* that
something is.

I think you're specifically interested in I/O port space usage, and it
seems that you want all PCI drivers that *only* use I/O port space to
depend on LEGACY_PCI?  Drivers that can use either I/O or memory
space or both would not depend on LEGACY_PCI?  This seems a little
murky and error-prone.

What if you used the approach from [1] but just dropped the warning?
The inb() would return ~0 if the platform doesn't support I/O port
space.  Drivers should be prepared to handle that because that's what
happens if the device doesn't exist.  

HAS_IOPORT and LEGACY_PCI is a lot of Kconfiggery that basically just
avoids building drivers that aren't useful on s390.  I'm not sure the
benefit outweighs the complication.

Bjorn

[1] https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/

