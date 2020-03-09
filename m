Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE717E0F3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 14:18:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399F16E43B;
	Mon,  9 Mar 2020 13:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176916E43B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 13:18:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 06:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,533,1574150400"; d="scan'208";a="235687421"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 09 Mar 2020 06:18:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Mar 2020 15:18:43 +0200
Date: Mon, 9 Mar 2020 15:18:43 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH 15/33] drm/panel-simple: Fix dotclock for EDT ET035012DM6
Message-ID: <20200309131843.GW13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-16-ville.syrjala@linux.intel.com>
 <20200303073320.2udpokcs2ync4hpy@pengutronix.de>
 <20200303145251.GX13686@intel.com>
 <20200306080257.2v7knpjavace7jw4@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200306080257.2v7knpjavace7jw4@pengutronix.de>
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
Cc: Thierry Reding <treding@nvidia.com>, Andreas Pretzsch <apr@cn-eng.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 06, 2020 at 09:02:57AM +0100, Marco Felsch wrote:
> On 20-03-03 16:52, Ville Syrj=E4l=E4 wrote:
> > On Tue, Mar 03, 2020 at 08:33:20AM +0100, Marco Felsch wrote:
> > > Hi Ville,
> > > =

> > > On 20-03-02 22:34, Ville Syrjala wrote:
> > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > =

> > > > The currently listed dotclock disagrees with the currently
> > > > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > > > =

> > > > Someone tell me which (if either) of the dotclock or vreresh is
> > > > correct?
> > > =

> > > Pls, check the datasheet which is linked within the comment. We hit t=
he
> > > vrefresh exactly if we are in SYNC MODE.
> > =

> > It's too much work to start hunting datasheets for all these
> > and figuring out what's going on in each case. Pls just
> > inform me which way is correct if you know the details.
> =

> How do you know that the clock is wrong if it is to much work? As I said
> the clock is completely fine.

htotal*vtotal*vrefresh !=3D clock, so one or both are incorrect.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
