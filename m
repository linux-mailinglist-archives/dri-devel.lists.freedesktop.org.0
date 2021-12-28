Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC64481E77
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3542810E203;
	Thu, 30 Dec 2021 17:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0447B10EC36
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 15:07:02 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BSECJcm008197; 
 Tue, 28 Dec 2021 15:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=kv/9MsxzrAL1HOwlhXTckibLYzdBhACAK/Lo6rhPS2g=;
 b=PEd05NFKBSQTMV+eMuNK5qNKFOQLlVaOGS0uOgw+PkR79Ycv8KvCBupVjjeuhIj+6iJb
 B4MH8Jl/byKU9XowseLvavfqkbEDmBTwi5YSyt9pg6Ss/fcnfnlfhMtsh8vcROBZn0C8
 oxYwtUNOwqfMNCRDsaE41ahvdUk6Oi++JPslOWelyO89X4O2kgqhdwRJvJ1YN/eyjMDi
 KEEFu48kqVxId1kYYRT6Pz2iK0+g9iXiKBY24iESH4osAWFpuPqGqYJA8yz+xDVi8A4v
 P/h3j8r9CMTkzsTl30kkqUJge08IU4ZgCocxxF/Xyg/E4HcMQ7wvAUO7gGDt++kqqgyO wQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d844q101h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 15:06:53 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BSF2Mqm006196;
 Tue, 28 Dec 2021 15:06:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3d5tjjh632-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 15:06:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BSF6nFq31130018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Dec 2021 15:06:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0EE8A404D;
 Tue, 28 Dec 2021 15:06:48 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5F37A4040;
 Tue, 28 Dec 2021 15:06:44 +0000 (GMT)
Received: from sig-9-145-12-118.uk.ibm.com (unknown [9.145.12.118])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Dec 2021 15:06:44 +0000 (GMT)
Message-ID: <4b630b7b87bd983291f628c42a1394fc0d2d86bd.camel@linux.ibm.com>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Bjorn Helgaas
 <helgaas@kernel.org>
Date: Tue, 28 Dec 2021 16:06:44 +0100
In-Reply-To: <20211228135425.0a69168c@coco.lan>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
 <YcrJAwsKIxxX18pW@kroah.com> <20211228101435.3a55b983@coco.lan>
 <b1475f6aecb752a858941f44a957b2183cd68405.camel@linux.ibm.com>
 <20211228135425.0a69168c@coco.lan>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aDtjwJ0yJYgJhEo1m1A3tQqPr1E90Ptg
X-Proofpoint-ORIG-GUID: aDtjwJ0yJYgJhEo1m1A3tQqPr1E90Ptg
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_08,2021-12-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280069
X-Mailman-Approved-At: Thu, 30 Dec 2021 17:17:01 +0000
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

On Tue, 2021-12-28 at 13:54 +0100, Mauro Carvalho Chehab wrote:
>
---8<---
>   
> > > > All you really care about is the "legacy" I/O spaces here, this isn't
> > > > tied to PCI specifically at all, right?
> > > > 
> > > > So why not just have a OLD_STYLE_IO config option or something like
> > > > that, to show that it's the i/o functions we care about here, not PCI at
> > > > all?
> > > > 
> > > > And maybe not call it "old" or "legacy" as time constantly goes forward,
> > > > just describe it as it is, "DIRECT_IO"?  
> > > 
> > > Agreed. HAVE_PCI_DIRECT_IO (or something similar) seems a more appropriate
> > > name for it.
> > > 
> > > Thanks,
> > > Mauro  
> > 
> > Hmm, I might be missing something here but that sounds a lot like the
> > HAS_IOPORT option added in patch 02.
> > 
> > We add both LEGACY_PCI and HAS_IOPORT to differentiate between two
> > cases. HAS_IOPORT is for PC-style devices that are not on a PCI card
> > while LEGACY_PCI is for PCI drivers that require port I/O. 
> 
> I didn't look at the other patches on this series, but why it is needed
> to deal with them on a separate way? Won't "PCI" and "HAS_IOPORT" be enough? 
> 
> I mean, are there any architecture where HAVE_PCI=y and HAS_IOPORT=y
> where LEGACY_PCI shall be "n"?

In the current patch set LEGACY_PCI is not currently selected by
architectures, though of course it could be if we know that an
architecture requires it. We should probably also set it in any
defconfig that has devices depending on it so as not to break these.

Other than that it would be set during kernel configuration if one
wants/needs support for legacy PCI devices. For testing I ran with
HAVE_PCI=y, HAS_IOPORT=y and LEGACY_PCI=n on both my local Ryzen 3990X
based workstation and Raspberry Pi 4 (DT). I guess at the moment it
would make most sense for special configs such as those tailored for
vitualization guets but in the end that would be something for
distributions to decide.

Arnd described the options here:
https://lore.kernel.org/lkml/CAK8P3a3HHeP+Gw_k2P7Qtig0OmErf0HN30G22+qHic_uZTh11Q@mail.gmail.com/

> 
> > This
> > includes pre-PCIe devices as well as PCIe devices which require
> > features like I/O spaces. The "legacy" naming is comes from the PCIe
> > spec which in section 2.1.1.2 says "PCI Express supports I/O Space for
> > compatibility with legacy devices which require their use. Future
> > revisions of this specification may deprecate the use of I/O Space."
> 
> I would still avoid calling it LEGACY_PCI, as this sounds too generic.
> 
> I didn't read the PCI/PCIe specs, but I suspect that are a lot more
> features that were/will be deprecated on PCI specs as time goes by.
> 
> So, I would, instead, use something like PCI_LEGACY_IO_SPACE or 
> HAVE_PCI_LEGACY_IO_SPACE, in order to let it clear what "legacy"
> means.

Hmm, I'd like to hear Bjorn's opinion on this. Personally I feel like
LEGACY_PCI is pretty clear since most devices are either pre-PCIe
devices or a compatibility feature allowing drivers for a pre-PCIe
device to work with a PCIe device.

> 
> > These two separate config options allow us to compile without support
> > for these legacy PCI devices even on a system where inb()/outb() and
> > friends are required for some PC style devices and for example ACPI.
> 
> Hmm... why this patch make SND_BT87X dependent on LEGACY_PCI?
> 
> > @@ -172,6 +177,7 @@ config SND_AZT3328
> >  
> >  config SND_BT87X
> >  	tristate "Bt87x Audio Capture"
> > +	depends on LEGACY_PCI
> >  	select SND_PCM
> >  	help
> >  	  If you want to record audio from TV cards based on
> 
> I couldn't find any usage of inb/outb & friends on it:
> 
> 	$ grep -E '(inb|outb|inw|outw|inl|outl)\b' ./sound/pci/bt87x.c
> 
> It uses, instead, readl/writel:
> 
> 	static inline u32 snd_bt87x_readl(struct snd_bt87x *chip, u32 reg)
> 	{
> 	        return readl(chip->mmio + reg);
> 	}
> 
> 	static inline void snd_bt87x_writel(struct snd_bt87x *chip, u32 reg, u32 value)
> 	{
> 	        writel(value, chip->mmio + reg);
> 	}
> 
> I failed to see what makes it different from VIDEO_BT848 and
> DVB_BT8XX drivers. They all support exactly the same chipset:
> Brooktree/Conexant BT8xx. On those devices, depending on the exact
> model, up to three separate interfaces are provided, each one with
> its own Kconfig var:
> 
> 	- audio I/O (SND_BT87X);
> 	- video I/O (VIDEO_BT848);
> 	- MPEG-TS I/O (DVB_BT8XX).
> 
> Thanks,
> Mauro

You're right, that makes no sense this doesn't seem to require
LEGACY_PCI. Maybe this was added by Arnd because it lacks a "depends on
PCI" which could have caused issues with HAVE_PCI=n rand configs.

