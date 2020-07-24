Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5522CF00
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 22:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC2C6E867;
	Fri, 24 Jul 2020 20:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DE16E867
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 20:04:15 +0000 (UTC)
IronPort-SDR: iTI5ItBPYlwFy7eep6a8Z+5ruGqMiki6+XcxCVpnqUvK0Z79OSVdGDuUOY6nhIBJsAGu29Va43
 7Q3F6WA8++6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9692"; a="148687604"
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="148687604"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2020 13:04:14 -0700
IronPort-SDR: tuV93hYXp8aAJnwvOfbHgbOdYEClh1XvLi21Q6DrmXz+oxPtV/mRmyxycMZb6hWofxxWT4MtCm
 /+wIDSS1cTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,391,1589266800"; d="scan'208";a="289092601"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 24 Jul 2020 13:04:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 24 Jul 2020 23:04:10 +0300
Date: Fri, 24 Jul 2020 23:04:10 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/omap: Use {} to zero initialize the mode
Message-ID: <20200724200410.GH6112@intel.com>
References: <20200724190718.23567-1-ville.syrjala@linux.intel.com>
 <CAKMK7uHBGj-fE17htHOKghsAG15CC_S8vMErPwy0RycM+8Mr7g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHBGj-fE17htHOKghsAG15CC_S8vMErPwy0RycM+8Mr7g@mail.gmail.com>
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
Cc: Dave Airlie <airlied@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 24, 2020 at 09:43:45PM +0200, Daniel Vetter wrote:
> On Fri, Jul 24, 2020 at 9:07 PM Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> >
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > The first member of drm_display_mode is no longer a structure, but
> > the code is still using {{0}} to zero initialize it. Make that just
> > {} so it works regardless of what lies inside.
> >
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Fixes: 42acb06b01b1 ("drm: pahole struct drm_display_mode")
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch.ch>
> =

> This needs to go into drm-misc-next-fixes, looks like Maarten has
> already forward it so you can push it there.

Thanks for the review. Pushed.

-> vacation

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
