Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB76E48697D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 19:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE4210E750;
	Thu,  6 Jan 2022 18:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449F010E750
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 18:14:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E4BAFB822E4;
 Thu,  6 Jan 2022 18:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A780C36AEB;
 Thu,  6 Jan 2022 18:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641492850;
 bh=pk9c3vFsS24A9H9YRNmuoLU04tTgveyiSfxz/RguLrg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=tWL9ah320xPJ7ZLvQrLFkjIeV1LTlPrJ2qSY/t0fKFbU+5MxnpWBBUesVfIjO0xOO
 l+Yvi8TANgRjNK2vReZYRlLqehfzP4qE2oNJarfvWixIS0OfQkuKWpI6rrQEfWGn25
 oroVHI/IQA8JEpMkHqxWMkHxAKg+IVXn/Zqji7RoVtpWyymeRt5WcM4qay0A7EFOWe
 jnI4JpbaAmAttF9a/Yhl/wWUUgx6A1s8zF9Wpc8ft5Y9hFSMLv91rRujQQ/od6scnA
 LsHiF+8iYMGoQ6RcvIn/+ZU8WqHN0Y3LnsXMJdYHRbXi/+K/WGfnGi+pM9zExj10bs
 +smYL/+iBYHZg==
Date: Thu, 6 Jan 2022 12:14:09 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
Message-ID: <20220106181409.GA297735@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74bf4fde-3972-1c36-ca04-58089da0d82b@huawei.com>
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
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Ettore Chimenti <ek5.chimenti@gmail.com>, linux-ide@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Hannes Reinecke <hare@suse.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>, linux-scsi@vger.kernel.org,
 Sumit Saxena <sumit.saxena@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sathya Prakash <sathya.prakash@broadcom.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>, linux-csky@vger.kernel.org,
 Kashyap Desai <kashyap.desai@broadcom.com>,
 Nilesh Javali <njavali@marvell.com>, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 Jakub Kicinski <kuba@kernel.org>, MPT-FusionLinux.pdl@broadcom.com,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Jean Delvare <jdelvare@suse.com>,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Jouni Malinen <j@w1.fi>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, linux-input@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ian Abbott <abbotti@mev.co.uk>, Mark Brown <broonie@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, megaraidlinux.pdl@broadcom.com,
 Teddy Wang <teddy.wang@siliconmotion.com>, linux-hwmon@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Karsten Keil <isdn@linux-pingi.de>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Nick Hu <nickhu@andestech.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-wireless@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "David S. Miller" <davem@davemloft.net>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Forest Bond <forest@alittletooquiet.net>,
 netdev@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 06, 2022 at 05:41:00PM +0000, John Garry wrote:
> On 05/01/2022 19:47, Bjorn Helgaas wrote:

> > IMO inb() should
> > be present but do something innocuous like return ~0, as it would if
> > I/O port space is supported but there's no device at that address.
> > 
> > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/scsi/megaraid.c?id=v5.15#n4210
> > 
> 
> That driver would prob not be used on systems which does not support PIO,
> and so could have a HAS_IOPORT dependency. But it is not strictly necessary.

I don't want the path of "this driver isn't needed because the device
is unlikely to be used on this arch."

Maybe it's not _always_ possible, but if the device can be plugged
into the platform, I think we should be able to build the driver for
it.

If the device requires I/O port space and the platform doesn't support
it, the PCI core or the driver should detect that and give a useful
diagnostic.

Bjorn
