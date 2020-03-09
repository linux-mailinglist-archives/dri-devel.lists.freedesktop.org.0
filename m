Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EA017EB1D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 22:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C89899F0;
	Mon,  9 Mar 2020 21:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D25899F0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 21:22:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 14:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="353453370"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 09 Mar 2020 14:22:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Mar 2020 23:22:51 +0200
Date: Mon, 9 Mar 2020 23:22:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: panel: Set connector type for OrtusTech
 COM43H4M85ULC panel
Message-ID: <20200309212251.GZ13686@intel.com>
References: <20200309184210.10042-1-laurent.pinchart@ideasonboard.com>
 <20200309190047.GA7543@ravnborg.org>
 <20200309190127.GB4916@pendragon.ideasonboard.com>
 <20200309194541.GA8617@ravnborg.org>
 <20200309202942.GD4916@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309202942.GD4916@pendragon.ideasonboard.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 10:29:42PM +0200, Laurent Pinchart wrote:
> Hi Sam,
> =

> On Mon, Mar 09, 2020 at 08:45:41PM +0100, Sam Ravnborg wrote:
> > On Mon, Mar 09, 2020 at 09:01:27PM +0200, Laurent Pinchart wrote:
> > > On Mon, Mar 09, 2020 at 08:00:47PM +0100, Sam Ravnborg wrote:
> > > > On Mon, Mar 09, 2020 at 08:42:10PM +0200, Laurent Pinchart wrote:
> > > > > The OrtusTech COM43H4M85ULC is a DPI panel, set the connector type
> > > > > accordingly.
> > > > > =

> > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> > > >
> > > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > > =

> > > > I assume you will apply to drm-misc-next - OK?
> > > =

> > > I still haven't got around to using dim :-)
> > =

> > I can manage - so the entry level is pretty low.
> > =

> > My lame and simple workflow
> > =

> > dim update-branches
> > # save patch from mutt
> > cat mbox | dim apply

Why don't you just pipe the thing into dim straight from mutt?
That's what I do. Followed by some amount of dim extract-tag
also piped in from mutt.

> > git rebase etc.
> > dim checkpatch <=3D if I make changes while applying
> > #build testing
> > dim push
> > =

> > =

> > And when I do my own stuff:
> > dim update-branches
> > git checkout -b sam-my-stuff
> > hacking-hacking
> > commit, commit
> > git rebase --exec "dim add-missing-cc" HEAD~5
> > =

> > =

> > dim can do much more than that - but the above is
> > the few dim commands I use.
> > This help me to do things remotely correct.
> > =

> > So maybe this is as good as any time to try out dim?
> =

> As good as any, and as bad as any I suppose :-)
> =

> There are a few things I don't like with dim, and I haven't found time
> yet to see how to fix (how live with :-) them yet. Among those issues
> are
> =

> - dim requires the kernel tree to be under $DIM_PREFIX. This is my main
>   issue, as I have one kernel tree per project, with and develop for
>   different subsystems in each. I would like dim to instead handle any
>   kernel tree regardless of where it is located on the disk, without
>   requiring me to add another DRM-specific tree to my workflow.
> =

> - The script auto-updates itself, and I find that to be a security issue
>   that I'm not comfortable with.

What do you mean it auto updates? Never seen anything like that.

> - The dim script makes a special case of intel repositories internally,
>   which I don't find very fair. Maybe that can be considered as a
>   compensation for Intel's efforts in DRM development, but a model where
>   the community maintaining drm-misc has to resolve conflicts with
>   drm-intel before it reaches drm-next bothers me.

It doesn't special case Intel repos. It just merges all the repos listed
in the config file to create a new drm-tip. There are Intel repos,
AMD repos, and various other repos. The point is to keep drm-tip always
up to date and working (*). And if you manage to create a conflict you
can't solve you can always ping someone who can. Also hoefully no one
should be seeing all that many conflicts due to rerere (unless you
actually created a new conflict that is).

* why would anyone run anything else but drm-tip anyway? ;)

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
