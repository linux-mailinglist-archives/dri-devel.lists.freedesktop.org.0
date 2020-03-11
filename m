Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6136C181B9F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836E689973;
	Wed, 11 Mar 2020 14:46:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9990989973
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:46:21 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 07:46:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,541,1574150400"; d="scan'208";a="236303084"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 11 Mar 2020 07:46:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Mar 2020 16:46:16 +0200
Date: Wed, 11 Mar 2020 16:46:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Heiko Schocher <hs@denx.de>
Subject: Re: [PATCH 06/33] drm/panel-lg-lg4573: Fix dotclock
Message-ID: <20200311144616.GV13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-7-ville.syrjala@linux.intel.com>
 <7c69898d-76d7-ff6d-a58c-cd64a3448f4c@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c69898d-76d7-ff6d-a58c-cd64a3448f4c@denx.de>
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
Cc: Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 06:24:25AM +0100, Heiko Schocher wrote:
> Hello Ville Syrjala,
> =

> Am 02.03.2020 um 21:34 schrieb Ville Syrjala:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > The currently listed dotclock disagrees with the currently
> > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > =

> > Someone tell me which (if either) of the dotclock or vreresh is
> > correct?
> =

> Your clock fix is correct, thanks!
> =

> > =

> > Cc: Heiko Schocher <hs@denx.de>
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >   drivers/gpu/drm/panel/panel-lg-lg4573.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> =

> Reviewed-by: Heiko Schocher <hs@denx.de>

Thanks. Pushed to drm-misc-next.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
