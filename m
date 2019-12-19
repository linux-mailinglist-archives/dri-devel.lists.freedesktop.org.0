Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B521E1262F7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 14:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB5E6EB62;
	Thu, 19 Dec 2019 13:11:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720416E340;
 Thu, 19 Dec 2019 13:11:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 05:11:11 -0800
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; d="scan'208";a="210456279"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.11.180])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 05:11:08 -0800
MIME-Version: 1.0
In-Reply-To: <875zicxzip.fsf@intel.com>
References: <20191219223030.1747f04b@canb.auug.org.au>
 <875zicxzip.fsf@intel.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the
 drm-intel-fixes tree
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: DRI <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 19 Dec 2019 15:11:06 +0200
Message-ID: <157676106618.16538.6275487528140541951@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jani Nikula (2019-12-19 14:37:02)
> On Thu, 19 Dec 2019, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Commits
> >
> >   987e379d7500 ("Revert "devtmpfs: use do_mount() instead of ksys_mount()"")
> >   9bd5ba4fe25a ("Revert "initrd: use do_mount() instead of ksys_mount()"")
> >   fa31001c96ad ("Revert "init: use do_mount() instead of ksys_mount()"")
> >
> > are missing a Signed-off-by from their author and committer.
> >
> > Reverts are commits too and should have reasonable commit messages.
> 
> Confused. I can't find said commits. And can't fathom why they'd be in
> any drm-intel tree.

Sorry. A glitch in the matrix, as our CI farm is hit by -rc2
regressions. I did the usual trick of pushing the reverts/fixes on top
of drm-intel-fixes to get CI pick them up for a run to get results, and
then proceeded to immediately remove them.

I imagine that if the commit messages got scanned, they get propagated
somewhere else too? Feel free to drop that HEAD completely.

If this is a big inconvenience, we can look into other ways of adding
the patches on top of drm-intel-fixes to get CI working when there
are regressions during -rc1/-rc2.

Regards, Joonas
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
