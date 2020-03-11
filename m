Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B1C181BA1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5532E6E441;
	Wed, 11 Mar 2020 14:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF82F6E432
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:46:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 07:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,541,1574150400"; d="scan'208";a="289403407"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 11 Mar 2020 07:46:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 11 Mar 2020 16:46:34 +0200
Date: Wed, 11 Mar 2020 16:46:34 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 01/33] drm/panel-novatek-nt35510: Fix dotclock
Message-ID: <20200311144634.GW13686@intel.com>
References: <20200302203452.17977-2-ville.syrjala@linux.intel.com>
 <20200309133644.32385-1-ville.syrjala@linux.intel.com>
 <CACRpkdaWKLhjqvFnkUJasKZmTqgPD7+btW7PiGyveCHJEa892Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdaWKLhjqvFnkUJasKZmTqgPD7+btW7PiGyveCHJEa892Q@mail.gmail.com>
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

On Mon, Mar 09, 2020 at 04:33:19PM +0100, Linus Walleij wrote:
> On Mon, Mar 9, 2020 at 2:36 PM Ville Syrjala
> <ville.syrjala@linux.intel.com> wrote:
> =

> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >
> > The dotclock is three orders of magnitude out. Fix it.
> >
> > v2: Just set it to 20MHz (Linus)
> >
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks. Pushed to drm-misc-next.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
