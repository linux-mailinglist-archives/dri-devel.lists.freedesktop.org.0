Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8262747C5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 19:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 595098937C;
	Tue, 22 Sep 2020 17:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAA98937C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 17:52:13 +0000 (UTC)
IronPort-SDR: JY6T6kLKCVg2o1HClJ5SGYUT2bIJPiqXA4LRoaNvZrBqhlLzMH0AVbuvjOcageMriTYq1O0P3F
 2/KXqTSRSiyA==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="140153336"
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="140153336"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 10:52:12 -0700
IronPort-SDR: hzGM7ZD/TLaivxNqob4cD0Y2BbYb0rbiuqA54mVS/DQldSC8tI27QcHr3AkXn3MwS/VtAnY3kk
 teMxcet2SI5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="290475502"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 22 Sep 2020 10:52:06 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Sep 2020 20:52:06 +0300
Date: Tue, 22 Sep 2020 20:52:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/3] Fix Kernel-doc warnings introduced on next-20200921
Message-ID: <20200922175206.GY6112@intel.com>
References: <cover.1600773619.git.mchehab+huawei@kernel.org>
 <a2c0d1ac02fb4bef142196d837323bcde41e9427.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2c0d1ac02fb4bef142196d837323bcde41e9427.camel@redhat.com>
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
Cc: Francesco Ruggeri <fruggeri@arista.com>, Jiri Pirko <jiri@mellanox.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, netdev@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Jakub Kicinski <kuba@kernel.org>,
 Cong Wang <xiyou.wangcong@gmail.com>, Andrii Nakryiko <andriin@fb.com>,
 "David S. Miller" <davem@davemloft.net>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 22, 2020 at 01:39:41PM -0400, Lyude Paul wrote:
> For patches 2 and 3:
> =

> Reviewed-by: Lyude Paul <lyude@redhat.com>
> =

> I'll go ahead and push these to drm-intel-next-queued (since drm-misc-next
> doesn't have these patches in yet, and the commits these fix were origina=
lly
> merged through drm-intel-next-queued anyway). thanks!

Mea culpa. My doc test build was foiled by the sphinx 2 vs. 3
regression and I was too lazy to start downgrading things.
Any ETA for getting that fixed btw?

> =

> On Tue, 2020-09-22 at 13:22 +0200, Mauro Carvalho Chehab wrote:
> > A few new warnings were added at linux-next. Address them, in order for=
 us
> > to keep zero warnings at the docs.
> > =

> > The entire patchset fixing all kernel-doc warnings is at:
> > 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=3Ddoc-fixes
> > =

> > Mauro Carvalho Chehab (3):
> >   net: fix a new kernel-doc warning at dev.c
> >   drm/dp: fix kernel-doc warnings at drm_dp_helper.c
> >   drm/dp: fix a kernel-doc issue at drm_edid.c
> > =

> >  drivers/gpu/drm/drm_dp_helper.c | 5 +++++
> >  drivers/gpu/drm/drm_edid.c      | 2 +-
> >  net/core/dev.c                  | 4 ++--
> >  3 files changed, 8 insertions(+), 3 deletions(-)
> > =

> -- =

> Cheers,
> 	Lyude Paul (she/her)
> 	Software Engineer at Red Hat

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
