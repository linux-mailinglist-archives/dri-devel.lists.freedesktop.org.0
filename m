Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C0C2D854A
	for <lists+dri-devel@lfdr.de>; Sat, 12 Dec 2020 09:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767886E57E;
	Sat, 12 Dec 2020 08:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA6E6E57E
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 08:58:45 +0000 (UTC)
IronPort-SDR: Iky8FagirBf1jVd7Uij4S2KDo1z/r/UiwwI97GEUTCvDyXdzZdNG0Wf3uw7jaYziqr44U8TyBL
 NDG3y7f6wbAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9832"; a="174649556"
X-IronPort-AV: E=Sophos;i="5.78,414,1599548400"; d="scan'208";a="174649556"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 00:58:44 -0800
IronPort-SDR: zqCSggY39wFyVeUQ8EBlacJ4VgeY+cPIvPzXuhxbosMUKYit5bdSqtwx9QM4dvczKVCihVCd12
 2OfoIt9YM+gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,414,1599548400"; d="scan'208";a="366003557"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
 by orsmga008.jf.intel.com with ESMTP; 12 Dec 2020 00:58:41 -0800
Date: Sat, 12 Dec 2020 16:54:45 +0800
From: Philip Li <philip.li@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [kbuild-all] Re: [PATCH v2 2/2] drm: automatic legacy gamma
 support
Message-ID: <20201212085445.GC31899@intel.com>
References: <20201208135759.451772-3-tomi.valkeinen@ti.com>
 <202012110104.ZPkkhoVT-lkp@intel.com>
 <8c0fa5f2-9751-ca11-686d-8876a3a9d633@ti.com>
 <X9OFODh+xRWrFTcf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9OFODh+xRWrFTcf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Paul Cercueil <paul@crapouillou.net>, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Sandy Huang <hjc@rock-chips.com>,
 David Airlie <airlied@linux.ie>, Philippe Cornu <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Yannick Fertre <yannick.fertre@st.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 04:42:00PM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Dec 11, 2020 at 01:24:49PM +0200, Tomi Valkeinen wrote:
> > On 10/12/2020 20:06, kernel test robot wrote:
> > > Hi Tomi,
> > > =

> > > I love your patch! Perhaps something to improve:
> > > =

> > > [auto build test WARNING on drm-intel/for-linux-next]
> > > [also build test WARNING on linus/master v5.10-rc7]
> > > [cannot apply to drm-tip/drm-tip anholt/for-next next-20201210]
> > > [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> > > And when submitting patch, we suggest to use '--base' as documented in
> > > https://git-scm.com/docs/git-format-patch]
> > > =

> > > url:    https://github.com/0day-ci/linux/commits/Tomi-Valkeinen/drm-f=
ix-and-cleanup-legacy-gamma-support/20201208-215917
> > > base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> > > config: i386-randconfig-m021-20201209 (attached as .config)
> > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > > =

> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > =

> > > New smatch warnings:
> > > drivers/gpu/drm/drm_color_mgmt.c:307 drm_crtc_legacy_gamma_set() erro=
r: potential null dereference 'blob'.  (drm_property_create_blob returns nu=
ll)
> > =

> > I don't see how this could happen. There's no code path I see where drm=
_property_create_blob could
> > return null...
> =

> IIRC we've received multiple similar nonsense reports from lkp, but
> no explanation why it thinks it could ever be null. Hmm, maybe there
> is a codepath somewhere that has a null check on the return value?
hi Dan, can you help on this to share some idea?

The original report is at
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/F3MVBRG=
F2R4URBNLNY3GMTSDZUCBX6RF/

Thanks


> =

> -- =

> Ville Syrj=E4l=E4
> Intel
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
