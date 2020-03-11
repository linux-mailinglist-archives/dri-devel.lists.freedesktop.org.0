Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053DD181BA5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE5DE6E995;
	Wed, 11 Mar 2020 14:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0502D6E995
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:47:00 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 07:47:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="261162835"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 11 Mar 2020 07:46:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Mar 2020 16:46:55 +0200
Date: Wed, 11 Mar 2020 16:46:55 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/33] drm/panel-sony-acx424akp: Fix dotclocks
Message-ID: <20200311144655.GY13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-9-ville.syrjala@linux.intel.com>
 <CACRpkda-F4wN7dXVK6GrqPqf9EycLo0+=m7Ty5HXFnLmRUFkFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkda-F4wN7dXVK6GrqPqf9EycLo0+=m7Ty5HXFnLmRUFkFQ@mail.gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 07, 2020 at 03:40:11PM +0100, Linus Walleij wrote:
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
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> These are better than what is currently in the driver
> at least, we don't know the real dotclocks. (No datasheet.)
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks. Pushed to drm-misc-next.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
