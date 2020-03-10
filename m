Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F217F6B7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 12:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AE06E1BD;
	Tue, 10 Mar 2020 11:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD476E1BD
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 11:51:54 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 04:51:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,536,1574150400"; d="scan'208";a="276923704"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 10 Mar 2020 04:51:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 Mar 2020 13:51:50 +0200
Date: Tue, 10 Mar 2020 13:51:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm: panel: Set connector type for OrtusTech
 COM43H4M85ULC panel
Message-ID: <20200310115150.GA13686@intel.com>
References: <20200309184210.10042-1-laurent.pinchart@ideasonboard.com>
 <20200309190047.GA7543@ravnborg.org>
 <20200309190127.GB4916@pendragon.ideasonboard.com>
 <20200309194541.GA8617@ravnborg.org>
 <20200309202942.GD4916@pendragon.ideasonboard.com>
 <20200309212251.GZ13686@intel.com>
 <20200309214333.GI4916@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309214333.GI4916@pendragon.ideasonboard.com>
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

On Mon, Mar 09, 2020 at 11:43:33PM +0200, Laurent Pinchart wrote:
> Hi Ville,
> =

> On Mon, Mar 09, 2020 at 11:22:51PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Mon, Mar 09, 2020 at 10:29:42PM +0200, Laurent Pinchart wrote:
> > > On Mon, Mar 09, 2020 at 08:45:41PM +0100, Sam Ravnborg wrote:
> > > > On Mon, Mar 09, 2020 at 09:01:27PM +0200, Laurent Pinchart wrote:
> > > > > On Mon, Mar 09, 2020 at 08:00:47PM +0100, Sam Ravnborg wrote:
> > > > > > On Mon, Mar 09, 2020 at 08:42:10PM +0200, Laurent Pinchart wrot=
e:
> > > > > > > The OrtusTech COM43H4M85ULC is a DPI panel, set the connector=
 type
> > > > > > > accordingly.
> > > > > > > =

> > > > > > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboar=
d.com>
> > > > > >
> > > > > > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> > > > > > =

> > > > > > I assume you will apply to drm-misc-next - OK?
> > > > > =

> > > > > I still haven't got around to using dim :-)
> > > > =

> > > > I can manage - so the entry level is pretty low.
> > > > =

> > > > My lame and simple workflow
> > > > =

> > > > dim update-branches
> > > > # save patch from mutt
> > > > cat mbox | dim apply
> > =

> > Why don't you just pipe the thing into dim straight from mutt?
> > That's what I do. Followed by some amount of dim extract-tag
> > also piped in from mutt.
> > =

> > > > git rebase etc.
> > > > dim checkpatch <=3D if I make changes while applying
> > > > #build testing
> > > > dim push
> > > > =

> > > > =

> > > > And when I do my own stuff:
> > > > dim update-branches
> > > > git checkout -b sam-my-stuff
> > > > hacking-hacking
> > > > commit, commit
> > > > git rebase --exec "dim add-missing-cc" HEAD~5
> > > > =

> > > > =

> > > > dim can do much more than that - but the above is
> > > > the few dim commands I use.
> > > > This help me to do things remotely correct.
> > > > =

> > > > So maybe this is as good as any time to try out dim?
> > > =

> > > As good as any, and as bad as any I suppose :-)
> > > =

> > > There are a few things I don't like with dim, and I haven't found time
> > > yet to see how to fix (how live with :-) them yet. Among those issues
> > > are
> > > =

> > > - dim requires the kernel tree to be under $DIM_PREFIX. This is my ma=
in
> > >   issue, as I have one kernel tree per project, with and develop for
> > >   different subsystems in each. I would like dim to instead handle any
> > >   kernel tree regardless of where it is located on the disk, without
> > >   requiring me to add another DRM-specific tree to my workflow.
> > > =

> > > - The script auto-updates itself, and I find that to be a security is=
sue
> > >   that I'm not comfortable with.
> > =

> > What do you mean it auto updates? Never seen anything like that.
> =

> Unless I'm mistaken,
> =

> function dim_uptodate
> {
> 	local using
> =

> 	using=3D"${BASH_SOURCE[0]}"
> =

> 	if [[ ! -e "$using" ]]; then
> 		echoerr "could not figure out the version being used ($using)."
> 		return 1
> 	fi
> =

> 	if [[ ! -e "$DIM_PREFIX/maintainer-tools/.git" ]]; then
> 		echoerr "could not find the upstream repo for $dim."
> 		return 1
> 	fi
> =

> 	git --git-dir=3D$DIM_PREFIX/maintainer-tools/.git fetch -q
> =

> 	if ! git --git-dir=3D$DIM_PREFIX/maintainer-tools/.git show "@{upstream}=
:dim" |\
> 			diff "$using" - >& /dev/null; then
> 		echoerr "not running upstream version of the script."
> 		return 1
> 	fi
> }
> =

> function check_for_updates
> {
> 	local stamp stampfile
> =

> 	stampfile=3D$HOME/.dim-update-check-timestamp
> =

> 	# daily check for updates based on file timestamp
> 	stamp=3D$(stat --printf=3D%Y $stampfile 2>/dev/null || echo -n 0)
> 	if [[ $((stamp + 24*60*60)) -lt $(date +%s) ]]; then
> 		dim_uptodate || true
> 		touch $stampfile
> 	fi
> }
> =

> And check_for_updates is called for all commands not listed by
> list_developer_commands.

It checks if your dim is up to date. It doesn't automagically update it
for you.

> =

> > > - The dim script makes a special case of intel repositories internall=
y,
> > >   which I don't find very fair. Maybe that can be considered as a
> > >   compensation for Intel's efforts in DRM development, but a model wh=
ere
> > >   the community maintaining drm-misc has to resolve conflicts with
> > >   drm-intel before it reaches drm-next bothers me.
> > =

> > It doesn't special case Intel repos. It just merges all the repos listed
> > in the config file to create a new drm-tip. There are Intel repos,
> > AMD repos, and various other repos.
> =

> drm-amd has indeed been added and is taken into accout in
> dim_push_branch, with drm-misc and drm-intel, but there's still lots of
> Intel-specific code in other places.

All I really see are a few subcommands which I think are only used by
i915 maintainers so there hasn't been any real need to abstract away
any hardcoded references to intel repos etc. So can't really see "lots
of code" like this.

> =

> > The point is to keep drm-tip always up to date and working (*). And if
> > you manage to create a conflict you can't solve you can always ping
> > someone who can. Also hoefully no one should be seeing all that many
> > conflicts due to rerere (unless you actually created a new conflict
> > that is).
> =

> What happens is that drm-misc is competing with drm-intel and drm-amd to
> get in drm-next, with everything merged in drm-tip. It effectively
> conveys a message that there's Intel, AMD, and the community, which
> means that Intel and AMD are considered higher priority than any other
> single vendor, when we came from a situation where, *in theory*, all
> vendors were of equal importance. This can be justified by the fact that
> the amount of patches generated by Intel and AMD are significantly
> higher than what any other vendor produces, but it's still a significant
> change in how the contributors to the DRM subsystem are treated.

Anyone working on drm-intel/drm-arm/drm-any-other-repo-we-decide-to-have
have to equally deal with the fallout from all the other repos as well.
So everyone is treated exactly the same AFAICS.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
