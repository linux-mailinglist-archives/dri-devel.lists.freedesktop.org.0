Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4685790F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 10:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1743B10EAD6;
	Fri, 16 Feb 2024 09:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9q/0V9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7874F10EACA;
 Fri, 16 Feb 2024 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708076512; x=1739612512;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:subject:from:to:message-id:date;
 bh=NQU9/lbKTmq6eTu4WCedhrcGkkEFuIXk/ao62+Zwlq0=;
 b=A9q/0V9FL3u0Dv8D5zi4eWnaGXj3NiflRxVVS7j5V58QQ8Izvj0MdliE
 b81tPhCiENIO8YSTNelTJgdp+ter1sJnZx+wvAmn2l9KAbHr/7KO1puaI
 fvpD6TwyTPjJWMHO35PA3qHdbBzrdulXZlGyLQNdTiMleDCzAVIqRCn+b
 9VFie65X25BYX3+5WZkmnlp5/fkli1fLH+w1uDcTJqPLRaM7QbB62hVLr
 z4098IRR+5E2gnvBjIRhH+vpbcQHd1GKWkMnwh3zzRxhstMUJJAu0iHIQ
 KvI2G9A8RTkeqSt8M4BaGmUTro6M2zQGiKj+IyCr+tV+oSD9kypIdypMx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2349696"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2349696"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 01:41:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="41286244"
Received: from unknown (HELO localhost) ([10.245.244.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 01:41:48 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAPM=9twPjYvnAZQKEWrc2zvjTC4W2rfn9TWsHE8_QSgVUiPbOg@mail.gmail.com>
References: <Zc3iIVsiAwo+bu10@tursulin-desk>
 <CAPM=9twPjYvnAZQKEWrc2zvjTC4W2rfn9TWsHE8_QSgVUiPbOg@mail.gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Hellström <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PULL] drm-intel-gt-next
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170807650415.7927.1096375337645578148@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Fri, 16 Feb 2024 11:41:44 +0200
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

(+ Jonathan)

Quoting Dave Airlie (2024-02-16 04:58:03)
> On Thu, 15 Feb 2024 at 20:06, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> > Hi Dave, Daniel,
> >
> > First pull request for 6.9 with probably one more coming in one to two
> > weeks.
> >
> > Nothing to interesting in this one, mostly a sprinkle of small fixes in
> > GuC, HuC, Perf/OA, a tiny bit of prep work for future platforms and some
> > code cleanups.
> >
> > One new uapi in the form of a GuC submission version query which Mesa
> > wants for implementing Vulkan async compute queues.
> >
> > Regards,
> >
> > Tvrtko
> >
> > drm-intel-gt-next-2024-02-15:
> > UAPI Changes:
> >
> > - Add GuC submission interface version query (Tvrtko Ursulin)
> >
> > Driver Changes:
> >
> > Fixes/improvements/new stuff:
> >
> > - Atomically invalidate userptr on mmu-notifier (Jonathan Cavitt)
>=20
> I've pulled this, but the above patch is triggering my this seems
> wrong spider sense.
>=20
> This and probably the preceeding patch that this references seem to
> move i915 to a long term pinning of userptr in memory with what I can
> see no accounting, and away from what the desired behaviour for
> drivers should be.

I asked Thomas to take a more detailed look. Jonathan, Thomas really should
have been Cc'd in the original patch as the patch was explicitly referred
in the text even.

> It also feels like the authorship on this might be lies which also worrie=
s me.

Fear not. This can probably be blamed on the i915 maintainers.

When we have an internal patch which has many revisions and is then
essentially rewritten for upstreaming, we specifically asked NOT to keep
the "From:" line intact, but instead swap in person who rewrote the patch[1=
].

To document credits/involvement of the original author we've recommended
to keep the Signed-off-by line however. "Co-developed-by" does not really
express the situation correctly. "Based on patch by" style pure textual
credit reference was also discussed but is hard to grep.

Discussed with Sima who suggested if we should consider something like
"Original-patch-by:" tag to better express this situation?

Regards, Joonas

[1] If the "From: " line is not updated, it sometimes leads to
situation where you can see a patch with "From:" pointing to you, that
doesn't contain a single unmodified line anymore.

>=20
> Dave.
