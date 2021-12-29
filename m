Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 116F1481E8B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 18:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B03110E2C5;
	Thu, 30 Dec 2021 17:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD5310E1FC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 16:56:02 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGGDG1021094; 
 Wed, 29 Dec 2021 16:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=HdnyGMrNQq5HwcD3rzBtNwXECdRLAC9GX9P+kQ/Hjcw=;
 b=oT2HFLoYLALLrgLRwtBRMZXCgWQFcfQjBbK0K+caJ77P7afo14raOJ1vW9Vweuu6XtCp
 wuQr1EpptRhTDBIoBrmICvNdhuaxhu1Fls7UFvGfjU1amV+wG1zlwhIozvnTs2F03voT
 WqTwe95fNNvSDJRbEVOoog7uhiLjj1JTCbS1iZ4wTARJpGR5/pGWDoNuKQ2sPmXRH6M/
 9+0TRklovx+KPOtfpBNyqnOAP/rcVRHKJnipmA6IDgCmhhZFwJBIDJuF/CjHM28/3JKq
 ZyHfd6RUYNESg9Su+bSyQf54G8QOgTFjc1UvOj0CmMcBXOsWbUSD/DoeJr6BQCxu/3kN 3w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d7uscu8mk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:55:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BTGmLTM006232;
 Wed, 29 Dec 2021 16:55:42 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3d5txayr16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Dec 2021 16:55:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BTGtedQ36241732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Dec 2021 16:55:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC9014203F;
 Wed, 29 Dec 2021 16:55:39 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B22942041;
 Wed, 29 Dec 2021 16:55:34 +0000 (GMT)
Received: from sig-9-145-13-177.uk.ibm.com (unknown [9.145.13.177])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Dec 2021 16:55:34 +0000 (GMT)
Message-ID: <e0877e91d7d50299ea5a3ffcee2cf1016458ce10.camel@linux.ibm.com>
Subject: Re: [RFC 01/32] Kconfig: introduce and depend on LEGACY_PCI
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Date: Wed, 29 Dec 2021 17:55:33 +0100
In-Reply-To: <20211229160317.GA1681139@bhelgaas>
References: <20211229160317.GA1681139@bhelgaas>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VatiC04_l2YsX43jEhVm7dn2C2d413bh
X-Proofpoint-ORIG-GUID: VatiC04_l2YsX43jEhVm7dn2C2d413bh
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-29_06,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112290088
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
 linux-serial@vger.kernel.org, GR-QLogic-Storage-Upstream@marvell.com,
 Jakub Kicinski <kuba@kernel.org>, MPT-FusionLinux.pdl@broadcom.com,
 "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-media@vger.kernel.org, linux-input@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-watchdog@vger.kernel.org, Jouni Malinen <j@w1.fi>,
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

On Wed, 2021-12-29 at 10:03 -0600, Bjorn Helgaas wrote:
> On Wed, Dec 29, 2021 at 01:12:07PM +0100, Mauro Carvalho Chehab wrote:
> > Em Wed, 29 Dec 2021 12:45:38 +0100
> > Niklas Schnelle <schnelle@linux.ibm.com> escreveu:
> > > ...
> > > I do think we agree that once done correctly there is value in
> > > such an option independent of HAS_IOPORT only gating inb() etc uses.
> 
> I'm not sure I'm convinced about this.  For s390, you could do this
> patch series, where you don't define inb() at all, and you add new
> dependencies to prevent compile errors.  Or you could define inb() to
> return ~0, which is what happens on other platforms when the device is
> not present.
> 
> > Personally, I don't see much value on a Kconfig var for legacy PCI I/O 
> > space. From maintenance PoV, bots won't be triggered if someone use
> > HAS_IOPORT instead of the PCI specific one - or vice-versa. So, we
> > could end having a mix of both at the wrong places, in long term.
> > 
> > Also, assuming that PCIe hardware will some day abandon support for 
> > "legacy" PCI I/O space, I guess some runtime logic would be needed, 
> > in order to work with both kinds of PCIe controllers. So, having a
> > Kconfig option won't help much, IMO.
> > 
> > So, my personal preference would be to have just one Kconfig var, but
> > I'm ok if the PCI maintainers decide otherwise.
> 
> I don't really like the "LEGACY_PCI" Kconfig option.  "Legacy" just
> means something old and out of favor; it doesn't say *what* that
> something is.
> 
> I think you're specifically interested in I/O port space usage, and it
> seems that you want all PCI drivers that *only* use I/O port space to
> depend on LEGACY_PCI?  Drivers that can use either I/O or memory
> space or both would not depend on LEGACY_PCI?  This seems a little
> murky and error-prone.

I'd like to hear Arnd's opinion on this but you're the PCI maintainer
so of course your buy-in would be quite important for such an option.

> 
> What if you used the approach from [1] but just dropped the warning?
> The inb() would return ~0 if the platform doesn't support I/O port
> space.  Drivers should be prepared to handle that because that's what
> happens if the device doesn't exist.

Hmm, in that mail Linus very clearly and specifically asked for this to
be a compile-time thing. So, if we do want to make it compile-time but
keep the potential errors to a minimum I guess just having HAS_IOPORT
might be valid compromise. It gets caught by bots through allyesconfig
or randconfig on HAS_IOPORT=n architectures. Also it has a nice
symmetry with the existing HAS_IOMEM. 

>  
> 
> HAS_IOPORT and LEGACY_PCI is a lot of Kconfiggery that basically just
> avoids building drivers that aren't useful on s390.  I'm not sure the
> benefit outweighs the complication.
> 
> Bjorn
> 
> [1] https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> 

Despite s390 I believe it would also affect nds32, um, h8300, nios2,
openrisc, hexagon, csky, and xtensa. But yes none of these is any less
niche than us. I do wonder if we will see a new drivers using I/O
ports?

