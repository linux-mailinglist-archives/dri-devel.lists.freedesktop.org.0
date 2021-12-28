Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC54805AD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 03:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4C210E152;
	Tue, 28 Dec 2021 02:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316BF10E152
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 02:10:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5464961152;
 Tue, 28 Dec 2021 02:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19A8C36AEA;
 Tue, 28 Dec 2021 02:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640657404;
 bh=SWYw07zmaaDNu+bU6UjWMUGttSEKl48ssAwYr917Irk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AP7PTZtlYcp1DDFFD9oOox44rlGILxnZhjrWGoppO9nx889cG994Anev93Fi8avnE
 QKDjPgXQd+0j5ryyJUZRF2fBwkLwO80XrnSF/7Fx+x50yneeRCMv+6NTewDTm+M3mY
 UmjlUI3lKpBa+eY+azArRNs2im3Ff4KiJ7Zi2yf5dhhdWeFi5sankCfKs3hH/NkcWY
 C3nDae4xyYfSY866Hl7iueZkbXg7sQjQFFHeioueEr+2zR+wkgXwGDiPuaIoio9xml
 rwSFGRLZ2Ry45efsPcHYEzY5Wj/FdpgdsOlVeG8/L54LBpew0o0F/pJgWb5CCAbMPX
 5d9alQgd1Ngqw==
Date: Tue, 28 Dec 2021 03:09:46 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <20211228030946.65932d2e@coco.lan>
In-Reply-To: <20211227164317.4146918-2-schnelle@linux.ibm.com>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 linux-ide@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
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
 "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, linux-input@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, linux-watchdog@vger.kernel.org,
 Jouni Malinen <j@w1.fi>,
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

Em Mon, 27 Dec 2021 17:42:46 +0100
Niklas Schnelle <schnelle@linux.ibm.com> escreveu:

> Introduce a new LEGACY_PCI Kconfig option which gates support for legacy
> PCI devices including those attached to a PCI-to-PCI Express bridge and
> PCI Express devices using legacy I/O spaces. Note that this is different
> from non PCI uses of I/O ports such as by ACPI.
> 
> Add dependencies on LEGACY_PCI for all PCI drivers which only target
> legacy PCI devices and ifdef legacy PCI specific functions in ata
> handling.
> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/ata/Kconfig                          | 34 ++++++++--------
>  drivers/ata/ata_generic.c                    |  3 +-
>  drivers/ata/libata-sff.c                     |  2 +
>  drivers/comedi/Kconfig                       | 42 +++++++++++++++++++
>  drivers/gpio/Kconfig                         |  2 +-
>  drivers/hwmon/Kconfig                        |  6 +--
>  drivers/i2c/busses/Kconfig                   | 24 +++++------
>  drivers/input/gameport/Kconfig               |  4 +-
>  drivers/isdn/hardware/mISDN/Kconfig          | 14 +++----

>  drivers/media/cec/platform/Kconfig           |  2 +-
>  drivers/media/pci/dm1105/Kconfig             |  2 +-
>  drivers/media/radio/Kconfig                  |  2 +-

Not sure what you meant by "legacy I/O spaces" on this patch. 
I mean, I would expect non-PCIe devices - like bttv and other
devices developed at the past millennium or so to be "legacy",
but at least on media, it is touching some drivers that aren't
that old, while keeping the really old ones untouched. Instead,
it is touching a driver developed in 2017 plus two other ones
that are a way newer than other drivers.

The support for the Bt8xx chipset, in particular, is really 
weird, as a sound driver for such chipset:

> @@ -172,6 +177,7 @@ config SND_AZT3328
>  
>  config SND_BT87X
>  	tristate "Bt87x Audio Capture"
> +	depends on LEGACY_PCI
>  	select SND_PCM
>  	help
>  	  If you want to record audio from TV cards based on

was marked as dependent of LEGACY_PCI, while the DVB and V4L2 ones 
weren't.

Sounds confusing to me, as the PCI bridge used by a Bt87x device 
should be the same for all three subdevices.

I'm confused...

Regards,
Mauro
