Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877E1E788F
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 10:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A92E6E8A5;
	Fri, 29 May 2020 08:43:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D906E8A5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 08:43:45 +0000 (UTC)
IronPort-SDR: hsw4KO4urlXWSU/hccXRRpLnjfx4BXWmZ3pTv+C5LDkZ3ZW59B7mVnC3dnlNkna0PciQPM1tuo
 09/Fs5Sz1yvQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 01:43:44 -0700
IronPort-SDR: t7ZaEPSmD2wb8Bht+VsXhBeIShu3zYq8vv8aNGADdkQk1f0JTS6aL8ahV2UPCVLZYwMvpKlEvy
 lkyrxhb245Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="257283009"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 29 May 2020 01:43:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 29 May 2020 11:43:41 +0300
Date: Fri, 29 May 2020 11:43:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: chenxb_99091@126.com
Subject: Re: Re:[PATCH] drm: fix setting of plane_mask in
 pan_display_atomic() function for linux-4.4
Message-ID: <20200529084341.GI6112@intel.com>
References: <1590586407-4109-1-git-send-email-chenxb_99091@126.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590586407-4109-1-git-send-email-chenxb_99091@126.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 09:33:27PM +0800, chenxb_99091@126.com wrote:
> From: Xuebing Chen <chenxb_99091@126.com>
> =

> On Mon, May 25, 2020 at 04:34:28PM +0200, Daniel Vetter wrote:
> > On Sat, May 23, 2020 at 11:49:07AM +0800, chenxb_99091@126.com wrote:
> > > From: Xuebing Chen <chenxb_99091@126.com>
> > > =

> > > The <include/drm/drm_crtc.h> provides drm_for_each_plane_mask macro a=
nd
> > > plane_mask is defined as bitmask of plane indices, such as
> > > 1<<drm_plane_index(plane). This patch fixes error setting of plane_ma=
sk
> > > in pan_display_atomic() function.
> > > =

> > > Signed-off-by: Xuebing Chen <chenxb_99091@126.com>
> > =

> > What kernel is this patch against? Latest upstream doesn't have any such
> > code anymore ... I'm assuming that Ville fixed this in one of his patch=
es,
> > but I can't find the right one just now.
> =

> This bug is still present in the longterm-supported versions of kernel 4.=
4.y, =

> including the latest kernel v4.4.224,
> See https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree=
/?h=3Dv4.4.224

See Documentation/process/stable-kernel-rules.rst on how to request
a stable backport.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
