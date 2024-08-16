Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E0195521C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 22:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB11C10E044;
	Fri, 16 Aug 2024 20:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZVNv2GD7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8899210E044;
 Fri, 16 Aug 2024 20:57:21 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-710ec581999so2103840b3a.2; 
 Fri, 16 Aug 2024 13:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723841841; x=1724446641; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OsIivMm/44noRoy/gkZcdnVTe5dyE8L520DECYextvY=;
 b=ZVNv2GD7B414zUKS/CiK2UH704f9/yXyjXvbEDGz5TOSeE1Dyet0SHmkkbvHZaMeaX
 om3+Ejgtv7K2Y2ADZxnQNr53wel2pCwWtIf4y/lLUfBc6vGJq3SzHk0RjfbllhgMETld
 cHshuYae2gK+LdRJceSvgB//AGCzYdARRCrwV3RM+i/zmf8XqUjEOPBrUHOXNU+KhmvI
 NxoC6MGRpoJf26aMNtDGCBGxKh7HJckh7WtZJLxUe6g8E9IollKz1buHtb3YYvrGPAyf
 u95jtY69muEL9tDK9PLB/01eJvHs+Iqkmq2xmogEXf/YNLrUil8ZuWWiHQhygcbbhNAY
 gzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723841841; x=1724446641;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OsIivMm/44noRoy/gkZcdnVTe5dyE8L520DECYextvY=;
 b=Zs6Pj1X05NBRPLTQGSjLiO/qkWfdEhcZqOs2J6wlJz4gEkEdh59Yyfx8uFqA8cULUZ
 87knQqpd9UlT8d9+qm8o0VdBCDsdCWHBHbyQI+0+HG5G+5AjlGGBGFUCrrMKfS75r2pd
 Wz9O2oqA0uUZ9Qof423SBuQXsyvnXPs/5nOW3wKWyB22ubxUfL6dsaf9UnXHWHxoqkVz
 W8RRoDa0+/PxBlzs/938ZDdr6CUAgAB23THXbIrLPJ0tSEc5iLBXd0bsXMEy2ntUosKk
 6g+MOoShspsHlc91pEF4EqleeGlxkiAoAkv4i2Fe0vf8sHK/y4h+3jMtyQF9l5HrpxGW
 q+sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxul+yQuSrhLRQ2yEtZlYxl8AFWNvFvUosDlllWeEbRdfC5wxdlu4FbsqlwIjzNApUFZpNMatkwpcmyPX52D1RFUKKYekOKpRMz3fZEIXBVxsxi6S814pVHhR0Sc/apL4J8bG+U9NLSfj7UgmPSeIhW0FHl0yPcZQvgUgfydlb2SXxpmFbOSM2EhetO8Ynpg==
X-Gm-Message-State: AOJu0YzUMOL/93kdI1YCC99NFjNwNdpiz8+IC1S5Hjba0QgyD+g3sneX
 6SCTbRN7AtBxhbJv1CBP70pllojB92zJeapsdeh+u8J92aoTYg2CiCODyZvOzwSiIMOnS3t/Cqg
 Rk4mS8ZizjAMPsCb7SvfI/gwcQtc=
X-Google-Smtp-Source: AGHT+IHoJOQTzqfb2dX42ndnbhiCwYWlaSqh3MOp7ckz4PAyV7UzPO/MMniS0UAlRLhYKkyGF87KLMkSXx3UN7HFtik=
X-Received: by 2002:a05:6a20:bd1d:b0:1c8:a0c4:2286 with SMTP id
 adf61e73a8af0-1c90507506bmr3555008637.51.1723841840710; Fri, 16 Aug 2024
 13:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240809150327.2485848-1-alexander.deucher@amd.com>
 <202408101951.tXyqYOzv-lkp@intel.com>
 <1c77f913-4707-4300-b84a-36fcf99942f4@suse.de>
In-Reply-To: <1c77f913-4707-4300-b84a-36fcf99942f4@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Aug 2024 16:57:09 -0400
Message-ID: <CADnq5_NjCFyy+bQY+uyijcZwvwXYkvVLLUQdtzN_ODvHAj193Q@mail.gmail.com>
Subject: Re: [PATCH] video/aperture: match the pci device when calling
 sysfb_disable()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel test robot <lkp@intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 oe-kbuild-all@lists.linux.dev, intel-gfx@lists.freedesktop.org, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 12, 2024 at 8:10=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
> Am 10.08.24 um 13:44 schrieb kernel test robot:
> > Hi Alex,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on drm-misc/drm-misc-next]
> > [also build test ERROR on linus/master v6.11-rc2 next-20240809]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Deucher/vid=
eo-aperture-match-the-pci-device-when-calling-sysfb_disable/20240810-021357
> > base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> > patch link:    https://lore.kernel.org/r/20240809150327.2485848-1-alexa=
nder.deucher%40amd.com
> > patch subject: [PATCH] video/aperture: match the pci device when callin=
g sysfb_disable()
> > config: csky-randconfig-001-20240810 (https://download.01.org/0day-ci/a=
rchive/20240810/202408101951.tXyqYOzv-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 14.1.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240810/202408101951.tXyqYOzv-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408101951.tXyqYOzv-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >     csky-linux-ld: drivers/video/aperture.o: in function `aperture_remo=
ve_conflicting_pci_devices':
> >>> aperture.c:(.text+0x222): undefined reference to `screen_info_pci_dev=
'
>
> Strange. There's a already placeholder [1] for architectures without
> PCI. Otherwise the source file is listed at [2].

So I dug into this, and the problem seems to be that
CONFIG_SCREEN_INFO is not defined in that config.  I can't figure out
how this should work in that case or why this is not a problem in
drivers/firmware/sysfb.c.

Something like this works:
diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 56a5a0bc2b1af..50e98210c9fe5 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -347,7 +347,9 @@ EXPORT_SYMBOL(__aperture_remove_legacy_vga_devices);
  */
 int aperture_remove_conflicting_pci_devices(struct pci_dev *pdev,
const char *name)
 {
+#if defined(CONFIG_SCREEN_INFO)
        struct screen_info *si =3D &screen_info;
+#endif
        bool primary =3D false;
        resource_size_t base, size;
        int bar, ret =3D 0;
@@ -355,8 +357,10 @@ int
aperture_remove_conflicting_pci_devices(struct pci_dev *pdev, const
char *na
        if (pdev =3D=3D vga_default_device())
                primary =3D true;

+#if defined(CONFIG_SCREEN_INFO)
        if (pdev =3D=3D screen_info_pci_dev(si))
                sysfb_disable();
+#endif

        for (bar =3D 0; bar < PCI_STD_NUM_BARS; ++bar) {
                if (!(pci_resource_flags(pdev, bar) & IORESOURCE_MEM))

But that can't be the right fix...  Any ideas?

Alex

>
> [1]
> https://elixir.bootlin.com/linux/v6.10/source/include/linux/screen_info.h=
#L127
> [2] https://elixir.bootlin.com/linux/v6.10/source/drivers/video/Makefile#=
L11
>
> Best regards
> Thomas
>
> >     csky-linux-ld: drivers/video/aperture.o: in function `devm_aperture=
_acquire_release':
> >>> aperture.c:(.text+0x2c0): undefined reference to `screen_info'
> >>> csky-linux-ld: aperture.c:(.text+0x2c4): undefined reference to `scre=
en_info_pci_dev'
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
