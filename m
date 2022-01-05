Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A646248615E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 09:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389B61135E2;
	Thu,  6 Jan 2022 08:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 944 seconds by postgrey-1.36 at gabe;
 Wed, 05 Jan 2022 17:58:19 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A62A10E433
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jan 2022 17:58:19 +0000 (UTC)
Received: from fraeml707-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JTcDP1FRwz67w73;
 Thu,  6 Jan 2022 01:39:17 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml707-chm.china.huawei.com (10.206.15.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 5 Jan 2022 18:42:31 +0100
Received: from [10.47.27.56] (10.47.27.56) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 5 Jan
 2022 17:42:28 +0000
From: John Garry <john.garry@huawei.com>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
To: Niklas Schnelle <schnelle@linux.ibm.com>, Bjorn Helgaas
 <helgaas@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>
References: <20211229160317.GA1681139@bhelgaas>
 <e0877e91d7d50299ea5a3ffcee2cf1016458ce10.camel@linux.ibm.com>
Message-ID: <3f39d8a2-2e57-a671-2926-eb4f2bf20c76@huawei.com>
Date: Wed, 5 Jan 2022 17:42:16 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <e0877e91d7d50299ea5a3ffcee2cf1016458ce10.camel@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.27.56]
X-ClientProxiedBy: lhreml736-chm.china.huawei.com (10.201.108.87) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 06 Jan 2022 08:23:58 +0000
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
 linux-serial@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com, Jakub
 Kicinski <kuba@kernel.org>, MPT-FusionLinux.pdl@broadcom.com,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-watchdog@vger.kernel.org, Jouni Malinen <j@w1.fi>,
 Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
 Kalle Valo <kvalo@kernel.org>, linux-input@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, Ian
 Abbott <abbotti@mev.co.uk>, Mark Brown <broonie@kernel.org>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, megaraidlinux.pdl@broadcom.com, Teddy
 Wang <teddy.wang@siliconmotion.com>, linux-hwmon@vger.kernel.org,
 Arnd Bergmann <arnd@kernel.org>, Karsten Keil <isdn@linux-pingi.de>,
 Sreekanth Reddy <sreekanth.reddy@broadcom.com>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Nick Hu <nickhu@andestech.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "David S. Miller" <davem@davemloft.net>,
 H Hartley Sweeten <hsweeten@visionengravers.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Forest Bond <forest@alittletooquiet.net>,
 netdev@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/12/2021 16:55, Niklas Schnelle wrote:
> On Wed, 2021-12-29 at 10:03 -0600, Bjorn Helgaas wrote:
>> On Wed, Dec 29, 2021 at 01:12:07PM +0100, Mauro Carvalho Chehab wrote:
>>> Em Wed, 29 Dec 2021 12:45:38 +0100
>>> Niklas Schnelle<schnelle@linux.ibm.com>  escreveu:
>>>> ...
>>>> I do think we agree that once done correctly there is value in
>>>> such an option independent of HAS_IOPORT only gating inb() etc uses.
>> I'm not sure I'm convinced about this.  For s390, you could do this
>> patch series, where you don't define inb() at all, and you add new
>> dependencies to prevent compile errors.  Or you could define inb() to
>> return ~0, which is what happens on other platforms when the device is
>> not present.
>>
>>> Personally, I don't see much value on a Kconfig var for legacy PCI I/O
>>> space. From maintenance PoV, bots won't be triggered if someone use
>>> HAS_IOPORT instead of the PCI specific one - or vice-versa. So, we
>>> could end having a mix of both at the wrong places, in long term.
>>>
>>> Also, assuming that PCIe hardware will some day abandon support for
>>> "legacy" PCI I/O space, I guess some runtime logic would be needed,
>>> in order to work with both kinds of PCIe controllers. So, having a
>>> Kconfig option won't help much, IMO.
>>>
>>> So, my personal preference would be to have just one Kconfig var, but
>>> I'm ok if the PCI maintainers decide otherwise.
>> I don't really like the "LEGACY_PCI" Kconfig option.  "Legacy" just
>> means something old and out of favor; it doesn't say*what*  that
>> something is.
>>
>> I think you're specifically interested in I/O port space usage, and it
>> seems that you want all PCI drivers that*only*  use I/O port space to
>> depend on LEGACY_PCI?  Drivers that can use either I/O or memory
>> space or both would not depend on LEGACY_PCI?  This seems a little
>> murky and error-prone.
> I'd like to hear Arnd's opinion on this but you're the PCI maintainer
> so of course your buy-in would be quite important for such an option.
> 

Hi Niklas,

I can't see the value in the LEGACY_PCI config - however I don't really 
understand Arnd's original intention.

It was written that it would allow us to control "whether we have any 
pre-PCIe devices or those PCIe drivers that need PIO accessors other 
than ioport_map()/pci_iomap()".

However I just don't see why CONFIG_PCI=y and CONFIG_HAS_IOPORT=y aren't 
always the gating factor here. Arnd?

Thanks,
John
