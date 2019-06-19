Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA394B401
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 10:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A31816E316;
	Wed, 19 Jun 2019 08:24:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9A86E2BE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 08:24:31 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n9so2375859wru.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 01:24:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/98dZl/QYDOPqWKKOl2HaSCiOXFKyFays/J24VboxLU=;
 b=Li8TaHWBe7cnxgQCMoWlNSiSlaaDmdYSy8BFC2pLgdnNiEZ+C1UyMwObXzCxXorByt
 B9ieFMWoMHX3oCsExcwUFpVaYYmH21FlgVyuysvos3rA9cusJEC0pUkZmHbEkA9GL0iU
 8lmhuO5JY1lIN6O1gyALBVeWAlBtjcpELihN0tt4Sr3gyo0OSPiekR/af+avsCmzSk+8
 FpGlSkB4iHGZ57aqoQ4UrdEKAjW4xwoPMWH61D+RIGoJYAK/wp9/eCW3ADgZ1zamclVz
 qy2y3KiKOJ//yjHIbMcTJnal9IWAAEu5H1eQzKRgwha1rdjHCqJofx9FjdThXLINWgsk
 4LqQ==
X-Gm-Message-State: APjAAAUBM3XtR8r+7qyvGDc7FO5w+EIJu8PIUgbrLzhrbI+somxXcjxO
 KUjEQuBucQ4biDh9kLkT9NU=
X-Google-Smtp-Source: APXvYqzxYVPAvy8Dt6ptkYtk9+znALGifqlNvIKr1C1dC6cBg0kQdYFadAZvYmsVqdHoWNM8ga8S0g==
X-Received: by 2002:a5d:5702:: with SMTP id a2mr42959389wrv.89.1560932670425; 
 Wed, 19 Jun 2019 01:24:30 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id x6sm20001561wru.0.2019.06.19.01.24.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 01:24:29 -0700 (PDT)
Date: Wed, 19 Jun 2019 10:24:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH v1 12/22] docs: driver-api: add .rst files from the main
 dir
Message-ID: <20190619082428.GK3187@ulmo>
References: <cover.1560890771.git.mchehab+samsung@kernel.org>
 <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b0d24e805d5368719cc64e8104d64ee9b5b89dd0.1560890772.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/98dZl/QYDOPqWKKOl2HaSCiOXFKyFays/J24VboxLU=;
 b=HiMjmVaijaGwuMSPz3atmX2vClH7S8/v+xsA7HSy2EtlJUUNSLiwqavkBgfjMmx9TB
 stjQ12IGFxZvS/vKabHXUd0lsjpqCceYDRJ9CIdytHaWz1GpLj9cXo4rggvsYryCohos
 XKzp5GSTUlEdNqW3qCe3WQRLGDMsfSMTlRVimIkMdSPiDjJbmuVKwkSIlFzUCJxUo5Js
 yxy0OOneR5zf6cmoDRn0naf7zm1XAMACXCSl3gXvDlOgHsD1U7HgL5RW7/h9A9cKjDcX
 c74xWAp2oOUqrs2c8Wg91mzrxDq6tgz2aWZ2UtDJdNdHozkvBbvo7eIUTG8nTKRupX2H
 agyA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel-hardening@lists.openwall.com, Farhan Ali <alifm@linux.ibm.com>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Evgeniy Polyakov <zbr@ioremap.net>,
 linux-arch@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>, Alan Stern <stern@rowland.harvard.edu>,
 Jiri Slaby <jslaby@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Ohad Ben-Cohen <ohad@wizery.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Boqun Feng <boqun.feng@gmail.com>, Nicholas Piggin <npiggin@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Harry Wei <harryxiyou@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-s390@vger.kernel.org, Alex Shi <alex.shi@linux.alibaba.com>,
 Corey Minyard <minyard@acm.org>, "David S. Miller" <davem@davemloft.net>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Daniel Lustig <dlustig@nvidia.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Eric Farman <farman@linux.ibm.com>, linux-watchdog@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>, linaro-mm-sig@lists.linaro.org,
 linux-gpio@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Johannes Thumshirn <morbidrsa@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Andrea Parri <andrea.parri@amarulasolutions.com>, linux-pci@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 platform-driver-x86@vger.kernel.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Emese Revfy <re.emese@gmail.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Darren Hart <dvhart@infradead.org>, Jade Alglave <j.alglave@ucl.ac.uk>,
 linux-pwm@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Luc Maranget <luc.maranget@inria.fr>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Stuart Hayes <stuart.w.hayes@gmail.com>, Logan Gunthorpe <logang@deltatee.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-remoteproc@vger.kernel.org,
 Jerry Hoemann <jerry.hoemann@hpe.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Ingo Molnar <mingo@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, netdev@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>,
 openipmi-developer@lists.sourceforge.net, Andy Shevchenko <andy@infradead.org>
Content-Type: multipart/mixed; boundary="===============1027878540=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1027878540==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x1F0m3RQhDZyj8sd"
Content-Disposition: inline


--x1F0m3RQhDZyj8sd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 05:53:17PM -0300, Mauro Carvalho Chehab wrote:
> Those files belong to the driver-api guide. Add them to the
> driver-api book.
>=20
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/ABI/removed/sysfs-class-rfkill  |  2 +-
>  Documentation/ABI/stable/sysfs-class-rfkill   |  2 +-
>  .../ABI/testing/sysfs-class-switchtec         |  2 +-
>  Documentation/PCI/pci.rst                     |  2 +-
>  Documentation/admin-guide/hw-vuln/l1tf.rst    |  2 +-
>  .../admin-guide/kernel-parameters.txt         |  4 +-
>  .../admin-guide/kernel-per-cpu-kthreads.rst   |  2 +-
>  .../{ =3D> driver-api}/atomic_bitops.rst        |  2 -
>  Documentation/{ =3D> driver-api}/bt8xxgpio.rst  |  2 -
>  .../bus-virt-phys-mapping.rst                 |  2 -
>  .../{connector =3D> driver-api}/connector.rst   |  2 -
>  .../{console =3D> driver-api}/console.rst       |  2 -
>  Documentation/{ =3D> driver-api}/crc32.rst      |  2 -
>  Documentation/{ =3D> driver-api}/dcdbas.rst     |  2 -
>  .../{ =3D> driver-api}/debugging-modules.rst    |  2 -
>  .../debugging-via-ohci1394.rst                |  2 -
>  Documentation/{ =3D> driver-api}/dell_rbu.rst   |  2 -
>  Documentation/{ =3D> driver-api}/digsig.rst     |  2 -
>  .../{EDID/howto.rst =3D> driver-api/edid.rst}   |  2 -
>  Documentation/{ =3D> driver-api}/eisa.rst       |  2 -
>  .../{ =3D> driver-api}/futex-requeue-pi.rst     |  2 -
>  .../{ =3D> driver-api}/gcc-plugins.rst          |  2 -
>  Documentation/{ =3D> driver-api}/hwspinlock.rst |  2 -
>  Documentation/driver-api/index.rst            | 66 +++++++++++++++++++
>  Documentation/{ =3D> driver-api}/io-mapping.rst |  2 -
>  .../{ =3D> driver-api}/io_ordering.rst          |  2 -
>  .../{IPMI.rst =3D> driver-api/ipmi.rst}         |  2 -
>  .../irq-affinity.rst}                         |  2 -
>  .../irq-domain.rst}                           |  2 -
>  Documentation/{IRQ.rst =3D> driver-api/irq.rst} |  2 -
>  .../{ =3D> driver-api}/irqflags-tracing.rst     |  2 -
>  Documentation/{ =3D> driver-api}/isa.rst        |  2 -
>  Documentation/{ =3D> driver-api}/isapnp.rst     |  2 -
>  Documentation/{ =3D> driver-api}/kobject.rst    |  4 +-
>  Documentation/{ =3D> driver-api}/kprobes.rst    |  2 -
>  Documentation/{ =3D> driver-api}/kref.rst       |  2 -
>  .../pblk.txt =3D> driver-api/lightnvm-pblk.rst} |  0
>  Documentation/{ =3D> driver-api}/lzo.rst        |  2 -
>  Documentation/{ =3D> driver-api}/mailbox.rst    |  2 -
>  .../{ =3D> driver-api}/men-chameleon-bus.rst    |  2 -
>  Documentation/{ =3D> driver-api}/nommu-mmap.rst |  2 -
>  Documentation/{ =3D> driver-api}/ntb.rst        |  2 -
>  Documentation/{nvmem =3D> driver-api}/nvmem.rst |  2 -
>  Documentation/{ =3D> driver-api}/padata.rst     |  2 -
>  .../{ =3D> driver-api}/parport-lowlevel.rst     |  2 -
>  .../{ =3D> driver-api}/percpu-rw-semaphore.rst  |  2 -
>  Documentation/{ =3D> driver-api}/pi-futex.rst   |  2 -
>  Documentation/driver-api/pps.rst              |  2 -
>  .../{ =3D> driver-api}/preempt-locking.rst      |  2 -
>  .../{pti =3D> driver-api}/pti_intel_mid.rst     |  2 -
>  Documentation/driver-api/ptp.rst              |  2 -
>  Documentation/{ =3D> driver-api}/pwm.rst        |  2 -
>  Documentation/{ =3D> driver-api}/rbtree.rst     |  2 -
>  Documentation/{ =3D> driver-api}/remoteproc.rst |  4 +-
>  Documentation/{ =3D> driver-api}/rfkill.rst     |  2 -
>  .../{ =3D> driver-api}/robust-futex-ABI.rst     |  2 -
>  .../{ =3D> driver-api}/robust-futexes.rst       |  2 -
>  Documentation/{ =3D> driver-api}/rpmsg.rst      |  2 -
>  Documentation/{ =3D> driver-api}/sgi-ioc4.rst   |  2 -
>  .../{SM501.rst =3D> driver-api/sm501.rst}       |  2 -
>  .../{ =3D> driver-api}/smsc_ece1099.rst         |  2 -
>  .../{ =3D> driver-api}/speculation.rst          |  8 +--
>  .../{ =3D> driver-api}/static-keys.rst          |  2 -
>  Documentation/{ =3D> driver-api}/switchtec.rst  |  4 +-
>  Documentation/{ =3D> driver-api}/sync_file.rst  |  2 -
>  Documentation/{ =3D> driver-api}/tee.rst        |  2 -
>  .../{ =3D> driver-api}/this_cpu_ops.rst         |  2 -
>  .../unaligned-memory-access.rst               |  2 -
>  .../{ =3D> driver-api}/vfio-mediated-device.rst |  4 +-
>  Documentation/{ =3D> driver-api}/vfio.rst       |  2 -
>  Documentation/{ =3D> driver-api}/xillybus.rst   |  2 -
>  Documentation/{ =3D> driver-api}/xz.rst         |  2 -
>  Documentation/{ =3D> driver-api}/zorro.rst      |  2 -
>  Documentation/driver-model/device.rst         |  2 +-
>  Documentation/fb/fbcon.rst                    |  4 +-
>  Documentation/filesystems/sysfs.txt           |  2 +-
>  Documentation/gpu/drm-mm.rst                  |  2 +-
>  Documentation/ia64/irq-redir.rst              |  2 +-
>  Documentation/laptops/thinkpad-acpi.rst       |  6 +-
>  Documentation/locking/rt-mutex.rst            |  2 +-
>  Documentation/networking/scaling.rst          |  4 +-
>  Documentation/s390/vfio-ccw.rst               |  6 +-
>  Documentation/sysctl/kernel.rst               |  2 +-
>  Documentation/sysctl/vm.rst                   |  2 +-
>  Documentation/trace/kprobetrace.rst           |  2 +-
>  Documentation/translations/zh_CN/IRQ.txt      |  4 +-
>  .../translations/zh_CN/filesystems/sysfs.txt  |  2 +-
>  .../translations/zh_CN/io_ordering.txt        |  4 +-
>  Documentation/w1/w1.netlink                   |  2 +-
>  Documentation/watchdog/hpwdt.rst              |  2 +-
>  MAINTAINERS                                   | 46 ++++++-------
>  arch/Kconfig                                  |  4 +-
>  arch/unicore32/include/asm/io.h               |  2 +-
>  drivers/base/core.c                           |  2 +-
>  drivers/char/ipmi/Kconfig                     |  2 +-
>  drivers/char/ipmi/ipmi_si_hotmod.c            |  2 +-
>  drivers/char/ipmi/ipmi_si_intf.c              |  2 +-
>  drivers/dma-buf/Kconfig                       |  2 +-
>  drivers/gpio/Kconfig                          |  2 +-
>  drivers/gpu/drm/Kconfig                       |  2 +-
>  drivers/pci/switch/Kconfig                    |  2 +-
>  drivers/platform/x86/Kconfig                  |  4 +-
>  drivers/platform/x86/dcdbas.c                 |  2 +-
>  drivers/platform/x86/dell_rbu.c               |  2 +-
>  drivers/pnp/isapnp/Kconfig                    |  2 +-
>  drivers/tty/Kconfig                           |  2 +-
>  drivers/vfio/Kconfig                          |  2 +-
>  drivers/vfio/mdev/Kconfig                     |  2 +-
>  drivers/w1/Kconfig                            |  2 +-
>  include/asm-generic/bitops/atomic.h           |  2 +-
>  include/linux/io-mapping.h                    |  2 +-
>  include/linux/jump_label.h                    |  2 +-
>  include/linux/kobject.h                       |  2 +-
>  include/linux/kobject_ns.h                    |  2 +-
>  include/linux/rbtree.h                        |  2 +-
>  include/linux/rbtree_augmented.h              |  2 +-
>  init/Kconfig                                  |  2 +-
>  kernel/padata.c                               |  2 +-
>  lib/Kconfig                                   |  2 +-
>  lib/Kconfig.debug                             |  2 +-
>  lib/crc32.c                                   |  2 +-
>  lib/kobject.c                                 |  4 +-
>  lib/lzo/lzo1x_decompress_safe.c               |  2 +-
>  lib/xz/Kconfig                                |  2 +-
>  mm/Kconfig                                    |  2 +-
>  mm/nommu.c                                    |  2 +-
>  samples/Kconfig                               |  2 +-
>  samples/kprobes/kprobe_example.c              |  2 +-
>  samples/kprobes/kretprobe_example.c           |  2 +-
>  scripts/gcc-plugins/Kconfig                   |  2 +-
>  tools/include/linux/rbtree.h                  |  2 +-
>  tools/include/linux/rbtree_augmented.h        |  2 +-
>  132 files changed, 173 insertions(+), 235 deletions(-)
>  rename Documentation/{ =3D> driver-api}/atomic_bitops.rst (99%)
>  rename Documentation/{ =3D> driver-api}/bt8xxgpio.rst (99%)
>  rename Documentation/{ =3D> driver-api}/bus-virt-phys-mapping.rst (99%)
>  rename Documentation/{connector =3D> driver-api}/connector.rst (99%)
>  rename Documentation/{console =3D> driver-api}/console.rst (99%)
>  rename Documentation/{ =3D> driver-api}/crc32.rst (99%)
>  rename Documentation/{ =3D> driver-api}/dcdbas.rst (99%)
>  rename Documentation/{ =3D> driver-api}/debugging-modules.rst (98%)
>  rename Documentation/{ =3D> driver-api}/debugging-via-ohci1394.rst (99%)
>  rename Documentation/{ =3D> driver-api}/dell_rbu.rst (99%)
>  rename Documentation/{ =3D> driver-api}/digsig.rst (99%)
>  rename Documentation/{EDID/howto.rst =3D> driver-api/edid.rst} (99%)
>  rename Documentation/{ =3D> driver-api}/eisa.rst (99%)
>  rename Documentation/{ =3D> driver-api}/futex-requeue-pi.rst (99%)
>  rename Documentation/{ =3D> driver-api}/gcc-plugins.rst (99%)
>  rename Documentation/{ =3D> driver-api}/hwspinlock.rst (99%)
>  rename Documentation/{ =3D> driver-api}/io-mapping.rst (99%)
>  rename Documentation/{ =3D> driver-api}/io_ordering.rst (99%)
>  rename Documentation/{IPMI.rst =3D> driver-api/ipmi.rst} (99%)
>  rename Documentation/{IRQ-affinity.rst =3D> driver-api/irq-affinity.rst}=
 (99%)
>  rename Documentation/{IRQ-domain.rst =3D> driver-api/irq-domain.rst} (99=
%)
>  rename Documentation/{IRQ.rst =3D> driver-api/irq.rst} (99%)
>  rename Documentation/{ =3D> driver-api}/irqflags-tracing.rst (99%)
>  rename Documentation/{ =3D> driver-api}/isa.rst (99%)
>  rename Documentation/{ =3D> driver-api}/isapnp.rst (98%)
>  rename Documentation/{ =3D> driver-api}/kobject.rst (99%)
>  rename Documentation/{ =3D> driver-api}/kprobes.rst (99%)
>  rename Documentation/{ =3D> driver-api}/kref.rst (99%)
>  rename Documentation/{lightnvm/pblk.txt =3D> driver-api/lightnvm-pblk.rs=
t} (100%)
>  rename Documentation/{ =3D> driver-api}/lzo.rst (99%)
>  rename Documentation/{ =3D> driver-api}/mailbox.rst (99%)
>  rename Documentation/{ =3D> driver-api}/men-chameleon-bus.rst (99%)
>  rename Documentation/{ =3D> driver-api}/nommu-mmap.rst (99%)
>  rename Documentation/{ =3D> driver-api}/ntb.rst (99%)
>  rename Documentation/{nvmem =3D> driver-api}/nvmem.rst (99%)
>  rename Documentation/{ =3D> driver-api}/padata.rst (99%)
>  rename Documentation/{ =3D> driver-api}/parport-lowlevel.rst (99%)
>  rename Documentation/{ =3D> driver-api}/percpu-rw-semaphore.rst (99%)
>  rename Documentation/{ =3D> driver-api}/pi-futex.rst (99%)
>  rename Documentation/{ =3D> driver-api}/preempt-locking.rst (99%)
>  rename Documentation/{pti =3D> driver-api}/pti_intel_mid.rst (99%)
>  rename Documentation/{ =3D> driver-api}/pwm.rst (99%)
>  rename Documentation/{ =3D> driver-api}/rbtree.rst (99%)
>  rename Documentation/{ =3D> driver-api}/remoteproc.rst (99%)
>  rename Documentation/{ =3D> driver-api}/rfkill.rst (99%)
>  rename Documentation/{ =3D> driver-api}/robust-futex-ABI.rst (99%)
>  rename Documentation/{ =3D> driver-api}/robust-futexes.rst (99%)
>  rename Documentation/{ =3D> driver-api}/rpmsg.rst (99%)
>  rename Documentation/{ =3D> driver-api}/sgi-ioc4.rst (99%)
>  rename Documentation/{SM501.rst =3D> driver-api/sm501.rst} (99%)
>  rename Documentation/{ =3D> driver-api}/smsc_ece1099.rst (99%)
>  rename Documentation/{ =3D> driver-api}/speculation.rst (99%)
>  rename Documentation/{ =3D> driver-api}/static-keys.rst (99%)
>  rename Documentation/{ =3D> driver-api}/switchtec.rst (97%)
>  rename Documentation/{ =3D> driver-api}/sync_file.rst (99%)
>  rename Documentation/{ =3D> driver-api}/tee.rst (99%)
>  rename Documentation/{ =3D> driver-api}/this_cpu_ops.rst (99%)
>  rename Documentation/{ =3D> driver-api}/unaligned-memory-access.rst (99%)
>  rename Documentation/{ =3D> driver-api}/vfio-mediated-device.rst (99%)
>  rename Documentation/{ =3D> driver-api}/vfio.rst (99%)
>  rename Documentation/{ =3D> driver-api}/xillybus.rst (99%)
>  rename Documentation/{ =3D> driver-api}/xz.rst (99%)
>  rename Documentation/{ =3D> driver-api}/zorro.rst (99%)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--x1F0m3RQhDZyj8sd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0J8TwACgkQ3SOs138+
s6FwnBAAgAw4Y4VTIu9fC7EKqGeq67QHb5tbw5DZb3z2ZbpFT2k82eX/X5PTclLE
yPDjKTqXPGwQ7MnAmYqcMZGlWdrkYXS0/n/nEQ7cpbpzVaOA7NJzs58dgr48qAb0
bWHbIpuKXs5LAQp/JjrW1bLYDZOSFf3QKpOYJ999lI6qo5peqP+Oi5kIZuob/RYe
MayT0gsMmjD39kEVWQny/DchbJj+oa4US5kw3mo3JgYdbIDGgj28urwUBCBOgBsH
IkWf/8NdCW0ypWrTonk0jxmEZy9MAhW8XkIQ/Xu5VzOWVomXOK8KF2SIczESlGSr
HpZSWhxgu1/sGitcWoPlQM6H2nFOOQIPRLAR53vzCc1KMeYfQ5uBDqsCw8im+lkw
qkXrljQ5mmFmFN0eVt38/hR/LzEofvCOF8LySe4+Ho5jZj0Fkr3istEObrFfks7l
CAhqy+UEYLxujLZ95dHPq3vvKSq56XQj4xmSZ3QCB2PJ9xAgGXywCURXN+euFk2r
JX6l+AVuQrNJy8sffyugZO1QX7AjcuDYScZsuKn6w/J1jih9NmpPe0UMbYXDHoJ/
ZSIYMZgi4RMjlmh71fAg4ClUsQ5G5UPwAlUm2CcmAfrFKZJfkUu1SnI406y0xe0Y
n/mzJsnMuPU8hgQkzfBGPpEInrOG3Bqr+G9L80TZR/7j+sBFBlA=
=iOMR
-----END PGP SIGNATURE-----

--x1F0m3RQhDZyj8sd--

--===============1027878540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1027878540==--
