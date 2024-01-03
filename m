Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DDE822EF0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 14:51:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C327910E2A2;
	Wed,  3 Jan 2024 13:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D3410E06D;
 Wed,  3 Jan 2024 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704289862; x=1735825862;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LTBkXiOfp9Khm+3rmA58SwWGwZMDcSI9d4gjsYYDGGk=;
 b=UQvl9lp6OzLkr70/OJEz1eK7+Ldef1szk5aQ842gNf/0pV7p4koHMvhw
 ePi6gXySEDrOfP8rvzU3KoCcqTHBzxgOmwwt5kRVxm28WCmIF47PmEi8m
 +AWZK4xGV8NgyEbHOld4VFjpGc6Tvk+IbvEjeDZVnVBi5cUhCc8d0EMUC
 sBPWoOO6LqBVvDpSZBUmvk8AcpZqS2HNHw+welI6z8P3U5eAN+Kq+7vWk
 KiAvLC8GT12knsnbuz02aGNq4zMBY4E0r/3pEnMrfk0aFTmOxGp+N4mAv
 4JRgfxdQ+DQccAqqoEdihDJRh4nYsg30qn6z0z86jg5ZVs9ebUPkfvS4l g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="428179405"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="428179405"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 05:51:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="22101580"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.243])
 ([10.249.254.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 05:51:00 -0800
Message-ID: <9541c844440e8b0fc5686e19850a04c7a55745ba.camel@linux.intel.com>
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Wed, 03 Jan 2024 14:50:57 +0100
In-Reply-To: <ZYsb09nsERQFDCQl@intel.com>
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
 <ZYsb09nsERQFDCQl@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2023-12-26 at 13:30 -0500, Rodrigo Vivi wrote:
> On Fri, Dec 22, 2023 at 12:36:39PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Add the xe repo to drm-tip and the dim tools.
> > For now use the sha1 of the first drm-xe-next pull request for drm-
> > tip,
> > since that branch tip is currently adapted for our CI testing.
> >=20
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Oded Gabbay <ogabbay@kernel.org>
> > Cc: daniel.vetter@ffwll.ch
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: dim-tools@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: intel-gfx@lists.freedesktop.org
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > =C2=A0nightly.conf | 7 +++++++
> > =C2=A01 file changed, 7 insertions(+)
> >=20
> > diff --git a/nightly.conf b/nightly.conf
> > index 24126b61b797..accd3ff2cc39 100644
> > --- a/nightly.conf
> > +++ b/nightly.conf
> > @@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
> > =C2=A0https://anongit.freedesktop.org/git/drm/drm-tip
> > =C2=A0https://anongit.freedesktop.org/git/drm/drm-tip.git
> > =C2=A0"
> > +drm_tip_repos[drm-xe]=3D"
> > +ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
> > +https://gitlab.freedesktop.org/drm/xe/kernel.git
> > +"
> > =C2=A0drm_tip_repos[drm-intel]=3D"
> > =C2=A0ssh://git.freedesktop.org/git/drm/drm-intel
> > =C2=A0ssh://git.freedesktop.org/git/drm-intel
> > @@ -65,14 +69,17 @@ drm_tip_config=3D(
> > =C2=A0	"drm			drm-fixes"
> > =C2=A0	"drm-misc		drm-misc-fixes"
> > =C2=A0	"drm-intel		drm-intel-fixes"
> > +	"drm-xe			drm-xe-fixes"
> > =C2=A0
> > =C2=A0	"drm			drm-next"
> > =C2=A0	"drm-misc		drm-misc-next-fixes"
> > =C2=A0	"drm-intel		drm-intel-next-fixes"
> > +	"drm-xe			drm-xe-next-fixes"
> > =C2=A0
> > =C2=A0	"drm-misc		drm-misc-next"
> > =C2=A0	"drm-intel		drm-intel-next"
> > =C2=A0	"drm-intel		drm-intel-gt-next"
> > +	"drm-xe			drm-xe-next b6e1b7081768"
>=20
> yeap, up to this commit nothing else should change, but
> then we will need an extra rebase of the rest on top of drm/drm-next.
>=20
> But then we need to decide where these following patches will live:
> 880277f31cc69 drm/xe/guc: define LNL FW
> 2cfc5ae1b8267 drm/xe/guc: define PVC FW
> 52383b58eb8cf mei/hdcp: Also enable for XE
> bea27d7369855 mei: gsc: add support for auxiliary device created by
> Xe driver
> fcb3410197f05 fault-inject: Include linux/types.h by default.
> 8ebd9cd71f8ac drm/xe: Add PVC's PCI device IDs
>=20
>=20
> Will it be the topic/core-for-CI?
> or topic/xe-extras?
> or what?

This sounds to me like topic/core-for-CI? Or is there any drawback with
that?

>=20
> Anyway, for the inclusion like this, after our CI is ready:

Could we merge this patch already at this point, considering it will,
at least for now, only update drm-tip with our fixes?

Thanks,

/Thomas


>=20
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>=20
> > =C2=A0
> > =C2=A0	"drm-intel		topic/core-for-CI"
> > =C2=A0	"drm-misc		topic/i915-ttm"
> > --=20
> > 2.42.0
> >=20

