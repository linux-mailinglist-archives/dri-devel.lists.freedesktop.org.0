Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B09361A8D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 09:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB1C6E128;
	Fri, 16 Apr 2021 07:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616786E128
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:31:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDDDC6101B;
 Fri, 16 Apr 2021 07:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618558273;
 bh=spgJ/KMOc4d8eiog9zRsZ7WW404gLjnTfxQjL9agoIo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aNTwh+//3BQ+3izHpEyUUN6ZjvmAEymvE2PvOK/acHqtScRI9RkSNPmty5eVLGuOA
 5LEVSQ8XUrZME6EjnWu2nnFqVgw9KM400jhBkizWWxoVo3TYALqAmzKLUODv7cVfRD
 HEPZPD7JvroVHnF+/W8f92rfFp0zwxc5OxIaQjb4=
Date: Fri, 16 Apr 2021 09:31:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: Re: [PATCH 00/57] Rid W=1 warnings from Staging
Message-ID: <YHk9Pw1almEsimVW@kroah.com>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
 <20210416072749.GA1394@agape.jhs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416072749.GA1394@agape.jhs>
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
Cc: Michael Straube <straube.linux@gmail.com>,
 "John B. Wyatt IV" <jbwyatt4@gmail.com>, linux-iio@vger.kernel.org,
 karthik alapati <mail@karthek.com>,
 Anders Blomdell <anders.blomdell@control.lth.se>,
 dri-devel@lists.freedesktop.org, Marc Dietrich <marvin24@gmx.de>,
 Pierre-Hugues Husson <phhusson@free.fr>,
 =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@protonmail.com>,
 Joel Fernandes <joel@joelfernandes.org>, Lee Jones <lee.jones@linaro.org>,
 ac100@lists.launchpad.net, Andrey Shvetsov <andrey.shvetsov@k2l.de>,
 Mori Hess <fmhess@users.sourceforge.net>, Martijn Coenen <maco@android.com>,
 linux-staging@lists.linux.dev, Klaas.Gadeyne@mech.kuleuven.ac.be,
 Comedi <comedi@comedi.org>, Stanley@bb.sd3,
 "J.P. Mellor" <jpmellor@rose-hulman.edu>,
 Christian Brauner <christian@brauner.io>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Herman.Bruyninckx@mech.kuleuven.ac.be, Ross Schmidt <ross.schm.dev@gmail.com>,
 Marco Cesati <marcocesati@gmail.com>, linux-pwm@vger.kernel.org,
 Robert Love <rlove@google.com>, Todd Kjos <tkjos@android.com>,
 Kees Cook <keescook@chromium.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Andres Klode <jak@jak-linux.org>, Kernel Team <ac100@lists.lauchpad.net>,
 "David A. Schleef" <ds@schleef.org>, Wim.Meeussen@mech.kuleuven.ac.be,
 Suren Baghdasaryan <surenb@google.com>, Ian Abbott <abbotti@mev.co.uk>,
 "Spencer E. Olson" <olsonse@umich.edu>, linux-fbdev@vger.kernel.org,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Allen Pais <apais@linux.microsoft.com>, Jacob Feder <jacobsfeder@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Peter Hurley <peter@hurleysoftware.com>,
 Andrea Merello <andrea.merello@gmail.com>, Truxton Fulton <trux@truxton.com>,
 linux-kernel@vger.kernel.org, Ilya Petrov <ilya.muromec@gmail.com>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Forest Bond <forest@alittletooquiet.net>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Hridya Valsaraju <hridya@google.com>, Jerry chuang <wlanfae@realtek.com>,
 Romain Perier <romain.perier@gmail.com>,
 Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Larry Finger <Larry.Finger@lwfinger.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 16, 2021 at 09:27:51AM +0200, Fabio Aiuto wrote:
> On Wed, Apr 14, 2021 at 07:10:32PM +0100, Lee Jones wrote:
> > This set is part of a larger effort attempting to clean-up W=3D1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > =

> > Lee Jones (57):
> >   staging: r8192U_core: Remove two unused variables 'ret' and
> >     'reset_status'
> >   staging: android: ashmem: Supply description for 'new_range'
> >   staging: comedi_8254: Fix descriptions for 'i8254' and 'iobase'
> >   staging: r8192U_core: Do not use kernel-doc formatting for !kernel-doc
> >     headers
> >   staging: r819xU_phy: Remove some local variables from the stack
> >   staging: r819xU_cmdpkt: Remove functionless method
> >     'cmpk_handle_query_config_rx'
> >   staging: wlan-ng: cfg80211: Move large struct onto the heap
> >   staging: rtw_ioctl_set: Move 'channel_table' to the only place it's
> >     used
> >   staging: rtl8188eu: core: rtw_ieee80211: Fix incorrectly documented
> >     function
> >   staging: rtl8723bs: core: rtw_mlme: Remove a bunch of unused variables
> >   staging: rtl8723bs: core: rtw_mlme_ext: Deal with a bunch of unused
> >     variables
> >   staging: rtl8712: rtl871x_mp_ioctl: Remove a bunch of unused tables
> >   staging: rtl8723bs: core: rtw_recv: Mark debug variable as
> >     __maybe_unused
> >   staging: rtl8188eu: core: rtw_security: Fix some formatting and
> >     misdocumentation
> >   staging: rtl8723bs: core: rtw_security: Demote non-conformant
> >     kernel-doc header
> >   staging: rtl8723bs: core: rtw_sta_mgt: Remove unused variable 'psta'
> >   staging: rtl8723bs: core: rtw_sta_mgt: Return error value directly
> >   staging: octeon: ethernet-tx: Fix formatting issue in function header
> >   staging: rtl8723bs: core: rtw_wlan_util: Remove unused variable
> >     'start_seq'
> >   staging: rtl8712: rtl871x_mp_ioctl: Move a large data struct onto the
> >     heap
> >   staging: iio: frequency: ad9834: Provide missing description for
> >     'devid'
> >   staging: nvec: Fix a bunch of kernel-doc issues
> >   staging: ks7010: ks_hostif: Remove a bunch of unused variables
> >   staging: fwserial: Demote a whole host of kernel-doc abuses
> >   staging: sm750fb: sm750_accel: Provide description for 'accel' and fix
> >     function naming
> >   staging: most: net: Fix some kernel-doc formatting issues
> >   staging: vt6655: upc: Suppress set but not used warning in macro
> >   staging: rtl8192u: ieee80211_softmac: Move a large data struct onto
> >     the heap
> >   staging: most: dim2: Provide missing descriptions and fix doc-rot
> >   staging: rtl8723bs: core: rtw_ieee80211: Remove seemingly pointless
> >     copy
> >   staging: rtl8723bs: core: rtw_mlme: 'retry' is only used if REJOIN is
> >     set
> >   staging: rtl8723bs: core: rtw_mlme_ext: 'evt_seq' is only used if
> >     CHECK_EVENT_SEQ is set
> >   staging: most: i2c: Fix a little doc-rot
> >   staging: most: dim2: hal: Fix one kernel-doc header and demote two
> >     non-conforming ones
> >   staging: most: dim2: hal: Demote non-conformant kernel-doc headers
> >   staging: axis-fifo: axis-fifo: Fix some formatting issues
> >   staging: rtl8188eu: os_dep: ioctl_linux: Move 2 large data buffers
> >     into the heap
> >   staging: fbtft: fb_ili9320: Remove unused variable 'ret'
> >   staging: rtl8723bs: core: rtw_ieee80211: Fix incorrectly named
> >     function
> >   staging: rtl8723bs: hal: odm_NoiseMonitor: Remove unused variable and
> >     dead code
> >   staging: rtl8188eu: os_dep: mon: Demote non-conforming kernel-doc
> >     headers
> >   staging: rtl8188eu: os_dep: rtw_android: Demote kernel-doc abuse
> >   staging: rtl8723bs: hal: rtl8723b_hal_init: Remove unused variable and
> >     dead code
> >   staging: rtl8723bs: hal: rtl8723b_phycfg: Fix a bunch of misnamed
> >     functions
> >   staging: rtl8723bs: hal: sdio_halinit: 'start' is only used if debug
> >     is enabled
> >   staging: rtl8723bs: hal: sdio_ops: Mark used 'err' as __maybe_unused
> >     and remove another
> >   staging: rtl8723bs: os_dep: ioctl_cfg80211: 'ack' is used when debug
> >     is enabled
> >   staging: comedi: drivers: jr3_pci: Remove set but unused variable
> >     'min_full_scale'
> >   staging: comedi: drivers: ni_tio: Fix slightly broken kernel-doc and
> >     demote others
> >   staging: comedi: drivers: ni_routes: Demote non-conforming kernel-doc
> >     headers
> >   staging: axis-fifo: axis-fifo: Fix function naming in the
> >     documentation
> >   staging: rtl8723bs: hal: odm_NoiseMonitor: Remove unused variable
> >     'func_start'
> >   staging: rtl8723bs: core: rtw_mlme_ext: Move very large data buffer
> >     onto the heap
> >   staging: rtl8723bs: hal: rtl8723b_hal_init: Mark a bunch of debug
> >     variables as __maybe_unused
> >   staging: comedi: drivers: ni_mio_common: Move 'range_ni_E_ao_ext' to
> >     where it is used
> >   staging: comedi: drivers: comedi_isadma: Fix misspelling of
> >     'dma_chan1'
> >   staging: rtl8723bs: hal: sdio_halinit: Remove unused variable 'ret'
> > =

> >  drivers/staging/android/ashmem.c              |   1 +
> >  drivers/staging/axis-fifo/axis-fifo.c         |  18 +--
> >  drivers/staging/comedi/drivers/comedi_8254.c  |   3 +-
> >  .../staging/comedi/drivers/comedi_isadma.c    |   2 +-
> >  drivers/staging/comedi/drivers/jr3_pci.c      |   3 +-
> >  .../staging/comedi/drivers/ni_mio_common.c    |   9 --
> >  drivers/staging/comedi/drivers/ni_routes.c    |   6 +-
> >  drivers/staging/comedi/drivers/ni_stc.h       |   9 +-
> >  drivers/staging/comedi/drivers/ni_tio.c       |  12 +-
> >  drivers/staging/fbtft/fb_ili9320.c            |   3 +-
> >  drivers/staging/fwserial/fwserial.c           |  46 +++----
> >  drivers/staging/iio/frequency/ad9834.c        |   5 +-
> >  drivers/staging/ks7010/ks_hostif.c            |  14 +-
> >  drivers/staging/most/dim2/dim2.c              |  23 ++--
> >  drivers/staging/most/dim2/hal.c               |  10 +-
> >  drivers/staging/most/i2c/i2c.c                |  12 +-
> >  drivers/staging/most/net/net.c                |   6 +-
> >  drivers/staging/nvec/nvec.c                   |   7 +-
> >  drivers/staging/octeon/ethernet-tx.c          |   1 -
> >  drivers/staging/qlge/qlge_main.c              |   4 +-
> >  .../staging/rtl8188eu/core/rtw_ieee80211.c    |   2 +-
> >  .../staging/rtl8188eu/core/rtw_ioctl_set.c    |   8 ++
> >  drivers/staging/rtl8188eu/core/rtw_security.c |  10 +-
> >  .../staging/rtl8188eu/include/rtw_mlme_ext.h  |   8 --
> >  .../staging/rtl8188eu/os_dep/ioctl_linux.c    |  12 +-
> >  drivers/staging/rtl8188eu/os_dep/mon.c        |   6 +-
> >  .../staging/rtl8188eu/os_dep/rtw_android.c    |   2 +-
> >  .../rtl8192u/ieee80211/ieee80211_softmac.c    |   9 +-
> >  drivers/staging/rtl8192u/r8192U_core.c        |  11 +-
> >  drivers/staging/rtl8192u/r819xU_cmdpkt.c      |  41 ------
> >  drivers/staging/rtl8192u/r819xU_phy.c         |  48 +++++--
> >  drivers/staging/rtl8712/rtl871x_mp_ioctl.c    |  29 ++--
> >  drivers/staging/rtl8712/rtl871x_mp_ioctl.h    | 127 ------------------
> >  .../staging/rtl8723bs/core/rtw_ieee80211.c    |   6 +-
> >  drivers/staging/rtl8723bs/core/rtw_mlme.c     |  17 +--
> >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  19 +--
> >  drivers/staging/rtl8723bs/core/rtw_recv.c     |   2 +-
> >  drivers/staging/rtl8723bs/core/rtw_security.c |   2 +-
> >  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  10 +-
> >  .../staging/rtl8723bs/core/rtw_wlan_util.c    |   4 +-
> >  .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  |   9 +-
> >  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  21 +--
> >  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  10 +-
> >  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |   8 +-
> >  drivers/staging/rtl8723bs/hal/sdio_ops.c      |   7 +-
> >  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |   2 +-
> >  drivers/staging/sm750fb/sm750_accel.c         |   4 +-
> >  drivers/staging/vt6655/upc.h                  |   2 +-
> >  drivers/staging/wlan-ng/cfg80211.c            |  30 +++--
> >  49 files changed, 256 insertions(+), 404 deletions(-)
> > =

> > Cc: ac100@lists.launchpad.net
> > Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
> > Cc: Allen Pais <apais@linux.microsoft.com>
> > Cc: Anders Blomdell <anders.blomdell@control.lth.se>
> > Cc: Andrea Merello <andrea.merello@gmail.com>
> > Cc: Andres Klode <jak@jak-linux.org>
> > Cc: Andrey Shvetsov <andrey.shvetsov@k2l.de>
> > Cc: "Arve Hj=F8nnev=E5g" <arve@android.com>
> > Cc: Christian Brauner <christian@brauner.io>
> > Cc: Comedi <comedi@comedi.org>
> > Cc: "David A. Schleef" <ds@schleef.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
> > Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>
> > Cc: Forest Bond <forest@alittletooquiet.net>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Herman.Bruyninckx@mech.kuleuven.ac.be
> > Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
> > Cc: Hridya Valsaraju <hridya@google.com>
> > Cc: Ian Abbott <abbotti@mev.co.uk>
> > Cc: Ilya Petrov <ilya.muromec@gmail.com>
> > Cc: Jacob Feder <jacobsfeder@gmail.com>
> > Cc: Jerry chuang <wlanfae@realtek.com>
> > Cc: Joel Fernandes <joel@joelfernandes.org>
> > Cc: "John B. Wyatt IV" <jbwyatt4@gmail.com>
> > Cc: Jonathan Cameron <jic23@kernel.org>
> > Cc: "J.P. Mellor" <jpmellor@rose-hulman.edu>
> > Cc: karthik alapati <mail@karthek.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Kernel Team <ac100@lists.lauchpad.net>
> > Cc: Klaas.Gadeyne@mech.kuleuven.ac.be
> > Cc: Larry Finger <Larry.Finger@lwfinger.net>
> > Cc: Lars-Peter Clausen <lars@metafoo.de>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: linux-fbdev@vger.kernel.org
> > Cc: linux-iio@vger.kernel.org
> > Cc: linux-pwm@vger.kernel.org
> > Cc: linux-staging@lists.linux.dev
> > Cc: linux-tegra@vger.kernel.org
> > Cc: Marc Dietrich <marvin24@gmx.de>
> > Cc: Marco Cesati <marcocesati@gmail.com>
> > Cc: Martijn Coenen <maco@android.com>
> > Cc: Michael Hennerich <Michael.Hennerich@analog.com>
> > Cc: Michael Straube <straube.linux@gmail.com>
> > Cc: Mori Hess <fmhess@users.sourceforge.net>
> > Cc: "N=EDcolas F. R. A. Prado" <nfraprado@protonmail.com>
> > Cc: Peter Hurley <peter@hurleysoftware.com>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: Pierre-Hugues Husson <phhusson@free.fr>
> > Cc: Robert Love <rlove@google.com>
> > Cc: Romain Perier <romain.perier@gmail.com>
> > Cc: Ross Schmidt <ross.schm.dev@gmail.com>
> > Cc: "Spencer E. Olson" <olsonse@umich.edu>
> > Cc: Stanley@BB.SD3
> > Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > Cc: Sumera Priyadarsini <sylphrenadin@gmail.com>
> > Cc: Suren Baghdasaryan <surenb@google.com>
> > Cc: Teddy Wang <teddy.wang@siliconmotion.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Todd Kjos <tkjos@android.com>
> > Cc: Truxton Fulton <trux@truxton.com>
> > Cc: "Uwe Kleine-K=F6nig" <u.kleine-koenig@pengutronix.de>
> > Cc: Wim.Meeussen@mech.kuleuven.ac.be
> > Cc: WLAN FAE <wlanfae@realtek.com>
> > Cc: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
> > -- =

> > 2.27.0
> > =

> =

> Hi,
> =

> what about splitting this series in smaller per driver series?

No real need to, I can handle patch series this big easily.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
