Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F1985BFA3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 16:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5533810E4AB;
	Tue, 20 Feb 2024 15:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxfgqlej";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4540110E4AB;
 Tue, 20 Feb 2024 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708442100; x=1739978100;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:from:subject:to:cc:message-id:date;
 bh=FJVIHXgtKBypbE6P5+3AVmeTnEED/4HbCWo1Rj/OuuI=;
 b=lxfgqlej1sm79odAqzv0Nr4bxLJXniwux81ufjhlS5ZHou0Feq4w/D7P
 uhmWyCs1kCdwCfX1fhEjsDDCC84MBtAYgCmsVUaszdShEv+ax1k17exfy
 Fd6XW335o9jRMf64s5/T0yX0SYbn1wXG1iUtT1CZgIYo6bqjPPmbS3IoL
 zkvCmbjdF6p60N8lE+29eY3l6BmFiC5E44Y1bSoMgMGd3gVoMJ3QhfTmt
 U/8k5DeAy5WKpC6zQwa1jqqcovKRNJ+MBzOKTPjLhPDIFqjrZWHm//9Kj
 S5op69QRAeKwepSixx6OVvYUHCMuDcviXMEO/xGuUJuVeyFCKMPKia3wc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="19984501"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="19984501"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 07:14:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; d="scan'208";a="27958155"
Received: from unknown (HELO localhost) ([10.245.244.30])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 07:14:52 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <170807650415.7927.1096375337645578148@jlahtine-mobl.ger.corp.intel.com>
References: <Zc3iIVsiAwo+bu10@tursulin-desk>
 <CAPM=9twPjYvnAZQKEWrc2zvjTC4W2rfn9TWsHE8_QSgVUiPbOg@mail.gmail.com>
 <170807650415.7927.1096375337645578148@jlahtine-mobl.ger.corp.intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PULL] drm-intel-gt-next
To: Dave Airlie <airlied@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170844208900.33312.12097770819490714416@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Tue, 20 Feb 2024 17:14:49 +0200
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Joonas Lahtinen (2024-02-16 11:41:44)
> (+ Jonathan)
>=20
> Quoting Dave Airlie (2024-02-16 04:58:03)
> > On Thu, 15 Feb 2024 at 20:06, Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> > >
> > > Hi Dave, Daniel,
> > >
> > > First pull request for 6.9 with probably one more coming in one to two
> > > weeks.
> > >
> > > Nothing to interesting in this one, mostly a sprinkle of small fixes =
in
> > > GuC, HuC, Perf/OA, a tiny bit of prep work for future platforms and s=
ome
> > > code cleanups.
> > >
> > > One new uapi in the form of a GuC submission version query which Mesa
> > > wants for implementing Vulkan async compute queues.
> > >
> > > Regards,
> > >
> > > Tvrtko
> > >
> > > drm-intel-gt-next-2024-02-15:
> > > UAPI Changes:
> > >
> > > - Add GuC submission interface version query (Tvrtko Ursulin)
> > >
> > > Driver Changes:
> > >
> > > Fixes/improvements/new stuff:
> > >
> > > - Atomically invalidate userptr on mmu-notifier (Jonathan Cavitt)
> >=20
> > I've pulled this, but the above patch is triggering my this seems
> > wrong spider sense.
> >=20
> > This and probably the preceeding patch that this references seem to
> > move i915 to a long term pinning of userptr in memory with what I can
> > see no accounting, and away from what the desired behaviour for
> > drivers should be.
>=20
> I asked Thomas to take a more detailed look. Jonathan, Thomas really shou=
ld
> have been Cc'd in the original patch as the patch was explicitly referred
> in the text even.
>=20
> > It also feels like the authorship on this might be lies which also worr=
ies me.
>=20
> Fear not. This can probably be blamed on the i915 maintainers.
>=20
> When we have an internal patch which has many revisions and is then
> essentially rewritten for upstreaming, we specifically asked NOT to keep
> the "From:" line intact, but instead swap in person who rewrote the patch=
[1].

Just to state the obvious for the public record:

This should never be done lightly or without reaching out to the
original author. This should only be for the exceptional cases where the
patch has significantly changed.

This was just the explanation why it's not an immediate red flag to see
such a patch. Based on the discussion around the topic we should be more
explicit if such a case has happened or if there simply has been an error
in the patch handling.

So we'll work on clarifying the instructions here.

Regards, Joonas

> To document credits/involvement of the original author we've recommended
> to keep the Signed-off-by line however. "Co-developed-by" does not really
> express the situation correctly. "Based on patch by" style pure textual
> credit reference was also discussed but is hard to grep.
>=20
> Discussed with Sima who suggested if we should consider something like
> "Original-patch-by:" tag to better express this situation?
>=20
> Regards, Joonas
>=20
> [1] If the "From: " line is not updated, it sometimes leads to
> situation where you can see a patch with "From:" pointing to you, that
> doesn't contain a single unmodified line anymore.
>=20
> >=20
> > Dave.
