Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D997B1779A2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 15:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85FB6EA85;
	Tue,  3 Mar 2020 14:54:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11146EA85
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 14:54:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Mar 2020 06:54:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,511,1574150400"; d="scan'208";a="258394529"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 03 Mar 2020 06:54:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 03 Mar 2020 16:54:01 +0200
Date: Tue, 3 Mar 2020 16:54:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 02/33] drm/panel-arm-versatile: Fix dotclock
Message-ID: <20200303145401.GY13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-3-ville.syrjala@linux.intel.com>
 <CACRpkdbXrtQ65jgkWNoNQPiZy3sV-xtVGhu-=Kz-Ch5Zz9gmPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdbXrtQ65jgkWNoNQPiZy3sV-xtVGhu-=Kz-Ch5Zz9gmPA@mail.gmail.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 01:10:26PM +0100, Linus Walleij wrote:
> On Mon, Mar 2, 2020 at 9:35 PM Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> =

> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > The currently listed dotclocks disagree with the currently
> > listed vrefresh rates. Change the dotclocks to match the vrefresh.
> >
> > Someone tell me which (if either) of the dotclock or vreresh is
> > correct?
> =

> I actually answered this in the mail thread where refresh was
> deleted:

Sorry for the dupe. The thread turned into a mess so I just
decided to start from a clean slate.

> =

> These dotclocks are correct. Delete the incorrect vrefresh instead.
> =

> So please drop this patch.

Will do. Thanks.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
