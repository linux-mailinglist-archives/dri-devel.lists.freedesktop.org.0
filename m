Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F116218A35D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 20:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E25D6E953;
	Wed, 18 Mar 2020 19:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8666E953;
 Wed, 18 Mar 2020 19:51:56 +0000 (UTC)
IronPort-SDR: +Z7xpeu4IBOswIScaE+t4bxoLfr30um6vYAdSbCFj5HrrxgjhAUv0kis3h25UGHwtKYLjCir+g
 LTPiy92EDOkw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 12:51:55 -0700
IronPort-SDR: K7dmFh3nj1DvflmWFzMKWtXtDdD8Xma+Uenm5dYlmfigNg1QX/ZjozGHWqAtsVXrByrIjtuyaX
 OoOWZHW2VFZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="233947240"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 18 Mar 2020 12:51:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Mar 2020 21:51:52 +0200
Date: Wed, 18 Mar 2020 21:51:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm: Skip drm_mode_config_validate() for !modeset
Message-ID: <20200318195152.GF13686@intel.com>
References: <20200318182518.31618-1-ville.syrjala@linux.intel.com>
 <158455627665.6873.13693628810443739641@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158455627665.6873.13693628810443739641@build.alporthouse.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 06:31:16PM +0000, Chris Wilson wrote:
> Quoting Ville Syrjala (2020-03-18 18:25:18)
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > drm_mode_config_init() may not have been called when the driver/device
> > doesn't support modeset. That will cause drm_mode_config_validate()
> > to oops. Skip the validation for !modeset.
> > =

> > TODO: We may want to consider calling drm_mode_config_init()
> > unconditionally to avoid similar issues elsewhere...
> > =

> > Fixes: 74d2aacbe840 ("drm: Validate encoder->possible_clones")
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks. Looks like this gets BAT up and running again so pushing w/o
waiting for shards.

Sorry about the mess everyone. CI had turned a blind eye on the
regressing series and I didn't notice that fact. I need to adjust my
brain regex to look for *all* CI mails, not just the failures.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
