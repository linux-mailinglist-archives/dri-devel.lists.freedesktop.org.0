Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF72D7810
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 15:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753AB6E1F8;
	Fri, 11 Dec 2020 14:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64F96E0AF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 14:42:05 +0000 (UTC)
IronPort-SDR: 4S7nvjIjHkXAPE3tHV5PeqFlf2qDz2Blb8xLtFAPgKQGL35/hXXIi+ILN9vXm2mvCGtL3w7EM+
 qF9wmAGW9SfA==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="171874062"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="171874062"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 06:42:05 -0800
IronPort-SDR: 6vEAv0yhQPbXAvtPm9YL/3seFyQ9FvIJ9nqjtV98gpHIAbrYfZE2UmHxQe0WcpYtXwEk5ttVzF
 rdZF7UNM8c2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="376559567"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 11 Dec 2020 06:42:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Dec 2020 16:42:00 +0200
Date: Fri, 11 Dec 2020 16:42:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 2/2] drm: automatic legacy gamma support
Message-ID: <X9OFODh+xRWrFTcf@intel.com>
References: <20201208135759.451772-3-tomi.valkeinen@ti.com>
 <202012110104.ZPkkhoVT-lkp@intel.com>
 <8c0fa5f2-9751-ca11-686d-8876a3a9d633@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c0fa5f2-9751-ca11-686d-8876a3a9d633@ti.com>
X-Patchwork-Hint: comment
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
 kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Yannick Fertre <yannick.fertre@st.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 01:24:49PM +0200, Tomi Valkeinen wrote:
> On 10/12/2020 20:06, kernel test robot wrote:
> > Hi Tomi,
> > =

> > I love your patch! Perhaps something to improve:
> > =

> > [auto build test WARNING on drm-intel/for-linux-next]
> > [also build test WARNING on linus/master v5.10-rc7]
> > [cannot apply to drm-tip/drm-tip anholt/for-next next-20201210]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> > =

> > url:    https://github.com/0day-ci/linux/commits/Tomi-Valkeinen/drm-fix=
-and-cleanup-legacy-gamma-support/20201208-215917
> > base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> > config: i386-randconfig-m021-20201209 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > =

> > New smatch warnings:
> > drivers/gpu/drm/drm_color_mgmt.c:307 drm_crtc_legacy_gamma_set() error:=
 potential null dereference 'blob'.  (drm_property_create_blob returns null)
> =

> I don't see how this could happen. There's no code path I see where drm_p=
roperty_create_blob could
> return null...

IIRC we've received multiple similar nonsense reports from lkp, but
no explanation why it thinks it could ever be null. Hmm, maybe there
is a codepath somewhere that has a null check on the return value?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
