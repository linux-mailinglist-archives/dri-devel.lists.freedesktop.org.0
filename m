Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6662EEF06
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 10:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECECD6E7D9;
	Fri,  8 Jan 2021 09:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B551189A8B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 09:02:31 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id c124so7165587wma.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 01:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=rhHmk1Jt127gFn9DL1VOi4FkTJ6o63akHHQiFvKW4eI=;
 b=VtlcgfDKyAnlxSCo6VBeCCX0m9OSVOtKb973ZpZUOjJ2Nil1cCFo1K3xOXchAWLaYA
 6bDfL6Z9u3QI5TMaFcWmJYIgd1q6gBsH11Pwhw5G/9/ygdXY1nyO2yfIMcoaW1FT8Ofc
 QNS/7yL1joBwyOYA6iE/uBLdLtCLkUVVU90U8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=rhHmk1Jt127gFn9DL1VOi4FkTJ6o63akHHQiFvKW4eI=;
 b=Encc6PwUBLY1k9bgfZBQAYLexYp2orQC85hyfELGeMwVlDHWFB3ggy5Dq7RLY3efxR
 1gwLVh95Q4mN3J7OoJOCTZPVMKxjMf4wR5P+EH++54I1XX2vUyppLnPyRVGT4a+C0aPL
 xOzBkoC81jkndizbw2K55kkfl+ca37D38Lm0Gyc1GhbV59r3Bgb7JvvEDbMLncJ9Kohw
 6XrVWVXsvfHo0ySTjUBRH3a4os8caqcJSseQMRcXbUFSQFJ8DmOT8tNHFxZHgdLZHF3e
 EwHZ6er1NHT3zfC3eJP+4MA22j1Q+I3VRJCA+lM3gwMVU/D8ppm6ZbNMwILwLmMvEXEZ
 eCuw==
X-Gm-Message-State: AOAM5313p3VxQKcF4+b6M1iX/+Vj/DF9XyIQQ3K9pdZNfXDLchZeKmMe
 7o3yKGuSczbhjDx87V8Lnyej/w==
X-Google-Smtp-Source: ABdhPJy/p7X7aYxCd/i8Xy3D4MlYaQofbCzSWaoK0uJSWyYGljmd7G0FumkPkXRhk3oy1URfi9TOJQ==
X-Received: by 2002:a1c:220a:: with SMTP id i10mr2096957wmi.93.1610096550348; 
 Fri, 08 Jan 2021 01:02:30 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o3sm11796707wrc.93.2021.01.08.01.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 01:02:29 -0800 (PST)
Date: Fri, 8 Jan 2021 10:02:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [kbuild-all] Re: [PATCH v3 8/8] drm: Upcast struct
 drm_device.dev to struct pci_device; replace pdev
Message-ID: <X/gfo5k0efFhxP/I@phenom.ffwll.local>
References: <20210107080748.4768-9-tzimmermann@suse.de>
 <202101071706.J19283ri-lkp@intel.com>
 <3c496f96-5efa-41d2-5911-1495619fab68@suse.de>
 <7486aeef-9fa4-91cb-8e95-383990cf3567@intel.com>
 <5ea2a270-2664-fad4-0048-ef498137e985@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ea2a270-2664-fad4-0048-ef498137e985@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: amd-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Rong Chen <rong.a.chen@intel.com>,
 airlied@linux.ie, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 08, 2021 at 09:04:44AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 08.01.21 um 02:25 schrieb Rong Chen:
> > Hi Thomas,
> > =

> > Thanks for the feedback, do you mean the patch was applied to a wrong b=
ase?
> =

> I'm on drm-tip, which already has the patches that fix these issues. I th=
ink
> I should start using git's --base option when sending out patchsets.

From today all the patches should also be in linux-next. Our maintainer
script didn't push the branches to the right tags because drm-misc-fixes
wasn't rolled forward yet (there's some trickery to make sure we don't
push patches to linux-next for the subsequent merge window before -rc1 is
tagged).
-Daniel

> =

> Best regards
> Thomas
> =

> > =

> > Best Regards,
> > Rong Chen
> > =

> > On 1/7/21 6:45 PM, Thomas Zimmermann wrote:
> > > AFAICT these are false positives. The instances have been fixed alrea=
dy.
> > > =

> > > Am 07.01.21 um 10:45 schrieb kernel test robot:
> > > > Hi Thomas,
> > > > =

> > > > I love your patch! Yet something to improve:
> > > > =

> > > > [auto build test ERROR on drm-tip/drm-tip]
> > > > [cannot apply to drm-intel/for-linux-next linus/master v5.11-rc2
> > > > next-20210104]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a n=
ote.
> > > > And when submitting patch, we suggest to use '--base' as documented=
 in
> > > > https://git-scm.com/docs/git-format-patch]
> > > > =

> > > > url: https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm=
-Move-struct-drm_device-pdev-to-legacy/20210107-161007
> > > > =

> > > > base:=A0=A0 git://anongit.freedesktop.org/drm/drm-tip drm-tip
> > > > config: x86_64-randconfig-s021-20210107 (attached as .config)
> > > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > > > reproduce:
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 # apt-get install sparse
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 # sparse version: v0.6.3-208-g46a52ca4-dir=
ty
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 # https://github.com/0day-ci/linux/commit/=
380912f7b62c23322562c40e19efd7ad84d57e9c
> > > > =

> > > > =A0=A0=A0=A0=A0=A0=A0=A0 git remote add linux-review https://github=
.com/0day-ci/linux
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 git fetch --no-tags linux-review Thomas-Zi=
mmermann/drm-Move-struct-drm_device-pdev-to-legacy/20210107-161007
> > > > =

> > > > =A0=A0=A0=A0=A0=A0=A0=A0 git checkout 380912f7b62c23322562c40e19efd=
7ad84d57e9c
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 # save the attached .config to linux build=
 tree
> > > > =A0=A0=A0=A0=A0=A0=A0=A0 make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix
> > > > -D__CHECK_ENDIAN__' ARCH=3Dx86_64
> > > > =

> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > =

> > > > All errors (new ones prefixed by >>):
> > > > =

> > > > =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_device.c: In function
> > > > 'oaktrail_chip_setup':
> > > > > > drivers/gpu/drm/gma500/oaktrail_device.c:509:26: error:
> > > > > > 'struct drm_device' has no member named 'pdev'; did you
> > > > > > mean 'dev'?
> > > > =A0=A0=A0=A0=A0 509 |=A0 if (pci_enable_msi(dev->pdev))
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > -- =

> > > > =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds.c: In function
> > > > 'oaktrail_lvds_set_power':
> > > > > > drivers/gpu/drm/gma500/oaktrail_lvds.c:63:25: error:
> > > > > > 'struct drm_device' has no member named 'pdev'; did you
> > > > > > mean 'dev'?
> > > > =A0=A0=A0=A0=A0=A0 63 |=A0=A0 pm_request_idle(&dev->pdev->dev);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > -- =

> > > > =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function '=
get_clock':
> > > > =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:69:11: warning:
> > > > variable 'tmp' set but not used [-Wunused-but-set-variable]
> > > > =A0=A0=A0=A0=A0=A0 69 |=A0 u32 val, tmp;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~
> > > > =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function '=
get_data':
> > > > =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:83:11: warning:
> > > > variable 'tmp' set but not used [-Wunused-but-set-variable]
> > > > =A0=A0=A0=A0=A0=A0 83 |=A0 u32 val, tmp;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~
> > > > =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function
> > > > 'oaktrail_lvds_i2c_init':
> > > > > > drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:148:35:
> > > > > > error: 'struct drm_device' has no member named 'pdev';
> > > > > > did you mean 'dev'?
> > > > =A0=A0=A0=A0=A0 148 |=A0 chan->adapter.dev.parent =3D &dev->pdev->d=
ev;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > -- =

> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_dri=
ver_load':
> > > > > > drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:661:22: error:
> > > > > > 'struct drm_device' has no member named 'pdev'; did you
> > > > > > mean 'dev'?
> > > > =A0=A0=A0=A0=A0 661 |=A0 pci_set_master(dev->pdev);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 In file included from drivers/gpu/drm/vmwgfx/vmwgfx_drv.c=
:31:
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:47: error: 'struct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0=A0 690 |=A0 dev_priv->io_start =3D pci_resource_start(=
dev->pdev, 0);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0 include/linux/pci.h:1854:40: note: in definition of macro
> > > > 'pci_resource_start'
> > > > =A0=A0=A0=A0 1854 | #define pci_resource_start(dev, bar)
> > > > ((dev)->resource[(bar)].start)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ^~~
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:691:49: error: 'struct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0=A0 691 |=A0 dev_priv->vram_start =3D pci_resource_star=
t(dev->pdev, 1);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0 include/linux/pci.h:1854:40: note: in definition of macro
> > > > 'pci_resource_start'
> > > > =A0=A0=A0=A0 1854 | #define pci_resource_start(dev, bar)
> > > > ((dev)->resource[(bar)].start)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ^~~
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:692:49: error: 'struct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0=A0 692 |=A0 dev_priv->mmio_start =3D pci_resource_star=
t(dev->pdev, 2);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0 include/linux/pci.h:1854:40: note: in definition of macro
> > > > 'pci_resource_start'
> > > > =A0=A0=A0=A0 1854 | #define pci_resource_start(dev, bar)
> > > > ((dev)->resource[(bar)].start)
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ^~~
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:842:33: error: 'struct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0=A0 842 |=A0 ret =3D pci_request_regions(dev->pdev, "vm=
wgfx probe");
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:851:33: error: 'struct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0=A0 851 |=A0=A0 ret =3D pci_request_region(dev->pdev, 2=
, "vmwgfx
> > > > stealth probe");
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:859:35: error: 'struct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0=A0 859 |=A0=A0 ret =3D vmw_irq_install(dev, dev->pdev-=
>irq);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1005:27: error: 'stru=
ct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0 1005 |=A0=A0 pci_release_region(dev->pdev, 2);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1007:28: error: 'stru=
ct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0 1007 |=A0=A0 pci_release_regions(dev->pdev);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function
> > > > 'vmw_driver_unload':
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1056:27: error: 'stru=
ct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0 1056 |=A0=A0 pci_release_region(dev->pdev, 2);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1058:28: error: 'stru=
ct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0 1058 |=A0=A0 pci_release_regions(dev->pdev);
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_pro=
be':
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1522:7: error: 'struct
> > > > drm_device' has no member named 'pdev'; did you mean 'dev'?
> > > > =A0=A0=A0=A0 1522 |=A0 dev->pdev =3D pdev;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 dev
> > > > -- =

> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c: In function 'vmw_fb_i=
nit':
> > > > > > drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:641:42: error:
> > > > > > 'struct drm_device' has no member named 'pdev'; did you
> > > > > > mean 'dev'?
> > > > =A0=A0=A0=A0=A0 641 |=A0 struct device *device =3D &vmw_priv->dev->=
pdev->dev;
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 In file included from drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:=
35:
> > > > =A0=A0=A0 At top level:
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:256:23: warning:
> > > > 'vmw_cursor_plane_formats' defined but not used
> > > > [-Wunused-const-variable=3D]
> > > > =A0=A0=A0=A0=A0 256 | static const uint32_t vmw_cursor_plane_format=
s[] =3D {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:248:23: warning:
> > > > 'vmw_primary_plane_formats' defined but not used
> > > > [-Wunused-const-variable=3D]
> > > > =A0=A0=A0=A0=A0 248 | static const uint32_t vmw_primary_plane_forma=
ts[] =3D {
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > > -- =

> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function
> > > > 'vmw_cmdbuf_set_pool_size':
> > > > > > drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1233:48: error:
> > > > > > 'struct drm_device' has no member named 'pdev'; did you
> > > > > > mean 'dev'?
> > > > =A0=A0=A0=A0 1233 |=A0 man->map =3D
> > > > dma_alloc_coherent(&dev_priv->dev->pdev->dev, size,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function
> > > > 'vmw_cmdbuf_man_create':
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1316:28: error:
> > > > 'struct drm_device' has no member named 'pdev'; did you mean
> > > > 'dev'?
> > > > =A0=A0=A0=A0 1316 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &dev_priv->dev=
->pdev->dev,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1325:22: error:
> > > > 'struct drm_device' has no member named 'pdev'; did you mean
> > > > 'dev'?
> > > > =A0=A0=A0=A0 1325 |=A0=A0=A0=A0=A0 &dev_priv->dev->pdev->dev,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function
> > > > 'vmw_cmdbuf_remove_pool':
> > > > =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1390:42: error:
> > > > 'struct drm_device' has no member named 'pdev'; did you mean
> > > > 'dev'?
> > > > =A0=A0=A0=A0 1390 | dma_free_coherent(&man->dev_priv->dev->pdev->de=
v,
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 ^~~~
> > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 dev
> > > > =

> > > > =

> > > > vim +509 drivers/gpu/drm/gma500/oaktrail_device.c
> > > > =

> > > > 1b082ccf5901108 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-03=
=A0 503
> > > > 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 504=A0 static int
> > > > oaktrail_chip_setup(struct drm_device *dev)
> > > > aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 505=A0 {
> > > > 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 506=A0=A0=A0=A0=A0 struct
> > > > drm_psb_private *dev_priv =3D dev->dev_private;
> > > > 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 507=A0=A0=A0=A0=A0 int ret;
> > > > 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 508
> > > > 9c0b6fcdc9faee5 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11 @=
509=A0=A0=A0=A0=A0 if
> > > > (pci_enable_msi(dev->pdev))
> > > > 9c0b6fcdc9faee5 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11=
=A0 510
> > > > dev_warn(dev->dev, "Enabling MSI failed!\n");
> > > > 9c0b6fcdc9faee5 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11=
=A0 511
> > > > 8512e0748729a49 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11=
=A0 512
> > > > dev_priv->regmap =3D oaktrail_regmap;
> > > > 8512e0748729a49 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11=
=A0 513
> > > > 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 514=A0=A0=A0=A0=A0 ret =3D
> > > > mid_chip_setup(dev);
> > > > aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 515=A0=A0=A0=A0=A0 if (ret < 0)
> > > > aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 516 return ret;
> > > > 4086b1e2b19729e Kirill A. Shutemov 2012-05-03=A0 517=A0=A0=A0=A0=A0=
 if
> > > > (!dev_priv->has_gct) {
> > > > aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 518=A0=A0=A0=A0=A0=A0=A0=A0=A0 /*
> > > > Now pull the BIOS data */
> > > > d839ede47a56ff5 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-03=
=A0 519
> > > > psb_intel_opregion_init(dev);
> > > > aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 520
> > > > psb_intel_init_bios(dev);
> > > > aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 521=A0=A0=A0=A0=A0 }
> > > > 6528c897966c7d5 Patrik Jakobsson=A0=A0 2013-11-07=A0 522
> > > > gma_intel_setup_gmbus(dev);
> > > > 5f503148efdda26 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-03=
=A0 523
> > > > oaktrail_hdmi_setup(dev);
> > > > aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 524=A0=A0=A0=A0=A0 return 0;
> > > > aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 525=A0 }
> > > > aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=
=A0 526
> > > > =

> > > > ---
> > > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> > > > =

> > > =

> > > =

> > > _______________________________________________
> > > kbuild-all mailing list -- kbuild-all@lists.01.org
> > > To unsubscribe send an email to kbuild-all-leave@lists.01.org
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
