Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5C727CD99
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 14:45:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A21389DB4;
	Tue, 29 Sep 2020 12:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420DF89DB4;
 Tue, 29 Sep 2020 12:45:45 +0000 (UTC)
IronPort-SDR: Ebjyyo63EHIKT8lnvhuo1Nt2a69nDoMURGeoz3Pm5Eh2xCeG69Np//lPklD9lK9W2bwuYkS8w7
 u153iyaINkpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="246913839"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="246913839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 05:45:39 -0700
IronPort-SDR: rZhR3i5skYFkZcM9FFfgas+U+VZ9dwCKWT248BkK49LNgGZa8irsoqJFwZlTdmerXWBtuY/y3N
 lq1j76NU3nbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="312203472"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 29 Sep 2020 05:45:34 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Sep 2020 15:45:33 +0300
Date: Tue, 29 Sep 2020 15:45:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/edp/jsl: Update vswing table
 for HBR and HBR2
Message-ID: <20200929124533.GX6112@intel.com>
References: <20200928080931.246347-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20200928080931.246347-3-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <87a6xaow40.fsf@intel.com>
 <20200928141543.GG5197@jausmus-gentoo-dev6>
 <20200928150257.GW6112@intel.com> <87y2ktom10.fsf@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y2ktom10.fsf@intel.com>
X-Patchwork-Hint: comment
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
Cc: hariom.pandey@intel.com, James Ausmus <james.ausmus@intel.com>,
 airlied@linux.ie, intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jose.souza@intel.com, rodrigo.vivi@intel.com,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 08:20:59PM +0300, Jani Nikula wrote:
> On Mon, 28 Sep 2020, Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com> wr=
ote:
> > On Mon, Sep 28, 2020 at 07:15:43AM -0700, James Ausmus wrote:
> >> On Mon, Sep 28, 2020 at 04:43:11PM +0300, Jani Nikula wrote:
> >> > On Mon, 28 Sep 2020, Tejas Upadhyay <tejaskumarx.surendrakumar.upadh=
yay@intel.com> wrote:
> >> > > JSL has update in vswing table for eDP
> >> > =

> >> > I've thought the TLA for Jasper Lake is JSP, not JSL. At least we ha=
ve
> >> > PCH_JSP for Jasper Lake PCH.
> >> =

> >> JSP =3D=3D Point (the PCH), JSL =3D=3D Lake
> >
> > .PT was "<something> Point", ..P stands just for "<something> PCH" IIRC.
> =

> Yeah, nowadays it doesn't have "Point", however bspec agrees on the JSL
> acronym for Jasper Lake.

Bspec uses ..P for "<platform> PCH", when it acknowledges the existence
of said PCH (see eg. CNP,ICP,TGP). JSP is not among that select crowd
however, neither really is MCC (although it is mentioned by name in the
JSL section).

I kinda want to nuke the JSP and MCC types entirely. I believe we should
be able to treat them as just ICP and TGP variants respectively. But
theres's still a bit of work left to do before we can get there.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
