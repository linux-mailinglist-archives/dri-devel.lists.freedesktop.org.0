Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B9C17798F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B465D6EA7D;
	Tue,  3 Mar 2020 14:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD896EA7D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:50:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 06:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="233771567"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 03 Mar 2020 06:50:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Mar 2020 16:50:38 +0200
Date: Tue, 3 Mar 2020 16:50:38 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 00/33] drm/panel: Fix dotclocks
Message-ID: <20200303145038.GV13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302214713.GA948@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302214713.GA948@ravnborg.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 10:47:13PM +0100, Sam Ravnborg wrote:
> Hi Ville.
> =

> On Mon, Mar 02, 2020 at 10:34:19PM +0200, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > A lot of the panel drivers put bogus looking values into
> > mode.clock. This series replaces the bogus values with
> > mode.vrefresh*mode.htotal*mode.vtotal.
> =

> I think you got it wrong....
> The few I sampled I would rather say that the clock
> specified was the one that was possible with the present
> HW and the refresh rate was then set to what was attempted.
> =

> Example:
> chunghwa_claa101wb01_mode
> =

> clock is 69300 - which looks like a value you could configure
> in HW. It not not a nive round value.
> refresh is 60, which looks like the refresh value that was attempted.
> =

> So unless there is a big difference between the
> calcualted refresh (based on the specifed clock),
> and the specified clock it should be assumed that clock is OK.
> And it is OK to drop refresh.
> =

> This is my take on it - but you based your patches on refresh.
> So maybe you have a better rationale to do so?

No. I just blindly converted everything and posted the patches
so people can tell me which way to go.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
