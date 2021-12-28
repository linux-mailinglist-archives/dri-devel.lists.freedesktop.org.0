Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6697481E82
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B719810E225;
	Thu, 30 Dec 2021 17:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E395210E195
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 10:59:15 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BSA7EKX001769; 
 Tue, 28 Dec 2021 10:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=+zyW5i6OI8A0c4K6evToxyfQjjczj9uw2pn4yk+SR7k=;
 b=pcw/uW8v/HV23WBgD8ZjRm9IrGz2p+VZ7eZ+u7riAv1sjlkh+h/fLfwWDBmcM8Bo5Fmd
 vn06o8uNPnUykpdvcIzJGCUcxbVusEFVGbGJCxOI2w3cVP8BgXdd+7rXgMWhLHd9tk4B
 qaX3iPy47QzD/AksgaeEKLCOm5B0Od2H3vZiYm4Da/wXXuKa0wHf6VtFo3jZJ9tHo9bz
 4QM0w3Rfhwmg0FxtU5PvhecdlEqtQChCQN16voLmPq6XcU13mmExhXEotMvedJkJF+Ec
 BhezmLDMTIJnFjaOZoFLVJ8+zBpMGhyEygXU3bI3M2yzXFyCgrPaoeiU4DHSP2gn+gHY /Q== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7xdu3bv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 10:59:05 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BSAw4e4032318;
 Tue, 28 Dec 2021 10:59:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 3d5tx9xvnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Dec 2021 10:59:02 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BSAwxP843974984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Dec 2021 10:58:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 907CC42041;
 Tue, 28 Dec 2021 10:58:59 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8FF542042;
 Tue, 28 Dec 2021 10:58:55 +0000 (GMT)
Received: from sig-9-145-12-118.uk.ibm.com (unknown [9.145.12.118])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Dec 2021 10:58:55 +0000 (GMT)
Message-ID: <b1475f6aecb752a858941f44a957b2183cd68405.camel@linux.ibm.com>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Tue, 28 Dec 2021 11:58:55 +0100
In-Reply-To: <20211228101435.3a55b983@coco.lan>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-2-schnelle@linux.ibm.com>
 <YcrJAwsKIxxX18pW@kroah.com> <20211228101435.3a55b983@coco.lan>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HQH4aOLZAlr26uyO-kejW0wN9QQ_LAGG
X-Proofpoint-ORIG-GUID: HQH4aOLZAlr26uyO-kejW0wN9QQ_LAGG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_06,2021-12-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112280048
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
 netdev@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-wireless@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "David S. Miller" <davem@davemloft.net>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Forest Bond <forest@alittletooquiet.net>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tony Nguyen <anthony.l.nguyen@intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-12-28 at 10:15 +0100, Mauro Carvalho Chehab wrote:
> Em Tue, 28 Dec 2021 09:21:23 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> 
> > On Mon, Dec 27, 2021 at 05:42:46PM +0100, Niklas Schnelle wrote:
> > > --- a/drivers/pci/Kconfig
> > > +++ b/drivers/pci/Kconfig
> > > @@ -23,6 +23,17 @@ menuconfig PCI
> > >  
> > >  if PCI
> > >  
> > > +config LEGACY_PCI
> > > +	bool "Enable support for legacy PCI devices"
> > > +	depends on HAVE_PCI
> > > +	help
> > > +	   This option enables support for legacy PCI devices. This includes
> > > +	   PCI devices attached directly or via a bridge on a PCI Express bus.
> > > +	   It also includes compatibility features on PCI Express devices which
> > > +	   make use of legacy I/O spaces.  
> 
> This Kconfig doesn't seem what it is needed there, as this should be an 
> arch-dependent feature, and not something that the poor user should be
> aware if a given architecture supports it or not. Also, the above will keep
> causing warnings or errors with randconfigs.
> 
> Also, the "depends on HAVE_CPI" is bogus, as PCI already depends on 
> HAVE_PCI:

Ah yes you're right.

> 
> 	menuconfig PCI
> 	bool "PCI support"
> 	depends on HAVE_PCI
> 	help
> 	  This option enables support for the PCI local bus, including
> 	  support for PCI-X and the foundations for PCI Express support.
> 	  Say 'Y' here unless you know what you are doing.
> 
> So, instead, I would expect that a new HAVE_xxx option would be
> added at arch/*/Kconfig, like:
> 
> 	config X86
> 		...
> 		select HAVE_PCI_DIRECT_IO
> 
> It would also make sense to document it at Documentation/features/.

I'll look into that, thanks.

> 
> > All you really care about is the "legacy" I/O spaces here, this isn't
> > tied to PCI specifically at all, right?
> > 
> > So why not just have a OLD_STYLE_IO config option or something like
> > that, to show that it's the i/o functions we care about here, not PCI at
> > all?
> > 
> > And maybe not call it "old" or "legacy" as time constantly goes forward,
> > just describe it as it is, "DIRECT_IO"?
> 
> Agreed. HAVE_PCI_DIRECT_IO (or something similar) seems a more appropriate
> name for it.
> 
> Thanks,
> Mauro

Hmm, I might be missing something here but that sounds a lot like the
HAS_IOPORT option added in patch 02.

We add both LEGACY_PCI and HAS_IOPORT to differentiate between two
cases. HAS_IOPORT is for PC-style devices that are not on a PCI card
while LEGACY_PCI is for PCI drivers that require port I/O. This
includes pre-PCIe devices as well as PCIe devices which require
features like I/O spaces. The "legacy" naming is comes from the PCIe
spec which in section 2.1.1.2 says "PCI Express supports I/O Space for
compatibility with legacy devices which require their use. Future
revisions of this specification may deprecate the use of I/O Space."

These two separate config options allow us to compile without support
for these legacy PCI devices even on a system where inb()/outb() and
friends are required for some PC style devices and for example ACPI.

