Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D641BFF44
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 16:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78086E91A;
	Thu, 30 Apr 2020 14:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784616E91A
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 14:53:14 +0000 (UTC)
IronPort-SDR: SQnDJej59Eq/XtIa6M6kS5owKI/oh1T8MdUleuQyeHd/rafpnY502/2Uxax0Ff95JE+n6A8Kv5
 fsLkUmC0sJ7Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 07:53:13 -0700
IronPort-SDR: qIOXnQfzcHhEnh7dJBCtXOoyHuJ407IWwtfIW1jwI2yYfAPuzBN5aYnB4GZ5/vfTybOYBiK7wk
 6FpBCsSwG8sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,336,1583222400"; d="scan'208";a="249767392"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 30 Apr 2020 07:53:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 30 Apr 2020 17:52:50 +0300
Date: Thu, 30 Apr 2020 17:52:50 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH resend] drm: Add DRM_MODE_TYPE_USERDEF flag to probed
 modes matching a video= argument
Message-ID: <20200430145250.GX6112@intel.com>
References: <20200221173313.510235-1-hdegoede@redhat.com>
 <20200221173313.510235-2-hdegoede@redhat.com>
 <CACvgo51i8_Xyp4=RVfcft9FsasMh4G9ze1jrc0Mg8ObOZCHn5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo51i8_Xyp4=RVfcft9FsasMh4G9ze1jrc0Mg8ObOZCHn5g@mail.gmail.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 Hans de Goede <hdegoede@redhat.com>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 02:47:00PM +0100, Emil Velikov wrote:
> Hi Hans,
> =

> On Fri, 21 Feb 2020 at 17:33, Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > drm_helper_probe_add_cmdline_mode() prefers using a probed mode matching
> > a video=3D argument over calculating our own timings for the user speci=
fied
> > mode using CVT or GTF.
> >
> > But userspace code which is auto-configuring the mode may want to know =
that
> > the user has specified that mode on the kernel commandline so that it c=
an
> > pick that mode over the mode which is marked as DRM_MODE_TYPE_PREFERRED.
> >
> > This commit sets the DRM_MODE_TYPE_USERDEF flag on the matching mode, j=
ust
> > as we would do on the user-specified mode when no matching probed mode =
is
> > found.
> >
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> =

> I was skimming around wrt Ville's compact drm_display_mode series and
> noticed that this never landed.
> =

> The commit brings extra consistency when dealing with user defined
> modes, and is:
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
> =

> Ville this may trivially conflict with your work. I suspect you can do
> the honours, and apply on top of your series?
> That is if you agree with the patch.

Quick glance at the original thread says maybe there were still some
userspace issues unresolved? Not sure.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
