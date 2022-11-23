Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FFF635464
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:07:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E76F10E522;
	Wed, 23 Nov 2022 09:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F52C10E522;
 Wed, 23 Nov 2022 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669194451; x=1700730451;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/Skoz19PJJCG1olgFfMNfIZSMpXD+mC7AjzhsERWvDA=;
 b=LcALpfs2ngKsGQKaPB9iodFRH3lMAX1tmXb6ng9Xc8Vu0J3C7AmYAQ5e
 wBi496XwgJ72B1PMxAHf2xFOgNDTUufeo6Vg8B72S9BZsWyOh4aCmGs0R
 y/K8GNi6yH8undt98BsI0IYMzLEjID3ysSolQ8KBM8/9in87kLPZ6wI3D
 RgwN1Fu7+y7ZrHp/j8WZp+m44Ji/GHGxQUbbIB5FLphQJmpzKpv3U/aCn
 y3hXpDHAlfIA4E8HDWO//O0ccoiqPjIm+SG7obJFZYQx+0xBD29acIhTy
 loJ93e1YerhorY+QMBlfqH4MCg2c7aa0VIviViqyOS2aX40u5s8c0jNEo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315841441"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="315841441"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 01:07:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="641723528"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="641723528"
Received: from jgronski-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.16.163])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 01:07:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [MAINTAINER TOOLS] docs: updated rules for topic/core-for-CI
 commit management
In-Reply-To: <20221122215307.o3rg7x3a7r2sajby@ldmartin-desk2.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221122131714.3443238-1-jani.nikula@intel.com>
 <20221122215307.o3rg7x3a7r2sajby@ldmartin-desk2.lan>
Date: Wed, 23 Nov 2022 11:07:25 +0200
Message-ID: <87sfiavy2a.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Nov 2022, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Nov 22, 2022 at 03:17:14PM +0200, Jani Nikula wrote:
>>Introduce stricter rules for topic/core-for-CI management. Way too many
>>commits have been added over the years, with insufficient rationale
>>recorded in the commit message, and insufficient follow-up with removing
>>the commits from the topic branch.
>>
>>New rules:
>
> Why not make a list like this the actual text? It's easier to follow a
> bullet/numbered list than the free form text.

Gah, you want me to rewrite the text and get all acks again?!

>
>>
>>1. Require maintainer ack for rebase. Have better gating on when rebases
>>   happen and on which baselines.
>
> What maintainer? drm-intel-gt-next/drm-intel-next/drm-misc/drm? Any?

Basically any drm-intel maintainer. The branch is in drm-intel repo, and
it exists at all to hotfix CI stuff like the name says.

>
> I don't want fingers pointed, but just to know the context: was there
> any event recently that triggered this? Because the last updates I've
> seen on topic/core-for-CI were not from maintainers and
> looking at the branch I don't see any issue with the recent commits.
> The issue actually seems to be the very old ones.  I'm not sure such
> a measure will actually fix the problem.
>
> I myself pushed recently to topic/core-for-CI so I want to know if **I**
> caused any issue.

This is not related to any individual commit or developer, at all.

I've been meaning to do this for a very long time now.

>
>>
>>2. Require maintainer/committer ack for adding/removing commits. No
>>   single individual should decide.
>
> s@maintainers/committer @@? Or just let it have the same requirement as
> the drm-intel-* branches. It seems odd to raise the bar for
> topic/core-for-CI above the requirement for drm-intel-* branches (even
> though that latter is a r-b). From committer-drm-intel.rst:

The bar *should* be raised for topic/core-for-CI. Yes, it's for hotfixes
that can be added as well as removed, but it should never be the first
option. Or the "can we just put it in core-for-CI" option. I *want*
pushback to adding stuff there.

>
> 	* Reviewed-by/Acked-by/Tested-by must include the name and email of a real
> 	  person for transparency. Anyone can give these, and therefore you have to
> 	  value them according to the merits of the person. Quality matters, not
> 	  quantity. Be suspicious of rubber stamps.
>
> 	* Reviewed-by/Acked-by/Tested-by can be asked for and given informally (on the
> 	  list, IRC, in person, in a meeting) but must be added to the commit.
>
> 	* Reviewed-by. All patches must be reviewed, no exceptions. Please see
> 	  "Reviewer's statement of oversight" in `Documentation/process/submitting-patches
> 	  <https://01.org/linuxgraphics/gfx-docs/drm/process/submitting-patches.html>`_
> 	  and `review training
> 	  <http://blog.ffwll.ch/2014/08/review-training-slides.html>`_.
>
>>
>>3. Require gitlab issues for new commits added. Improve tracking for
>>   removing the commits.
>>
>>Also use the stronger "must" for commit message requiring the
>>justification for the commit being in topic/core-for-CI.
>>
>>Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>Cc: David Airlie <airlied@gmail.com>
>>Cc: Daniel Vetter <daniel@ffwll.ch>
>>Cc: intel-gfx@lists.freedesktop.org
>>Cc: dri-devel@lists.freedesktop.org
>>Cc: dim-tools@lists.freedesktop.org
>>Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>>---
>> drm-tip.rst | 27 ++++++++++++++++++++-------
>> 1 file changed, 20 insertions(+), 7 deletions(-)
>>
>>diff --git a/drm-tip.rst b/drm-tip.rst
>>index deae95cdd2fe..24036e2ef576 100644
>>--- a/drm-tip.rst
>>+++ b/drm-tip.rst
>>@@ -203,11 +203,13 @@ justified exception. The primary goal is to fix issues originating from Linus'
>> tree. Issues that would need drm-next or other DRM subsystem tree as baseline
>> should be fixed in the offending DRM subsystem tree.
>>
>>-Only rebase the branch if you really know what you're doing. When in doubt, ask
>>-the maintainers. You'll need to be able to handle any conflicts in non-drm code
>>-while rebasing.
>>+Only rebase the branch if you really know what you're doing. You'll need to be
>>+able to handle any conflicts in non-drm code while rebasing.
>>
>>-Simply drop fixes that are already available in the new baseline.
>>+Always ask for maintainer ack before rebasing. IRC ack is sufficient.
>>+
>>+Simply drop fixes that are already available in the new baseline. Close the
>>+associated gitlab issue when removing commits.
>>
>> Force pushing a rebased topic/core-for-CI requires passing the ``--force``
>> parameter to git::
>
> there is a main issue here that is not being fixed: testing the merged
> branch.  I think it would be much better to have the instruction here
> to rebuild drm-tip without pushing... This will use the local topic branch:
>
> 	dim -d rebuild-tip topic/core-for-CI
>
> It's the only way I ever update it because I don't want to push a branch
> and have a small window to potentially solve the merge conflicts (while
> leaving others wondering why the tip is broken).

This isn't strictly related to core-for-CI, is it? Can happen with any
branch.

>
>>@@ -225,11 +227,22 @@ judgement call.
>> Only add or remove commits if you really know what you're doing. When in doubt,
>> ask the maintainers.
>>
>>-Apply new commits on top with regular push. The commit message needs to explain
>>-why the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
>>+Always ask for maintainer/committer ack before adding/removing commits. IRC ack
>>+is sufficient. Record the ``Acked-by:`` in commits being added.
>>+
>>+Apply new commits on top with regular push. The commit message must explain why
>>+the patch has been applied to topic/core-for-CI. If it's a cherry-pick from
>> another subsystem, please reference the commit with ``git cherry-pick -x``
>> option. If it's a patch from another subsystem, please reference the patch on
>> the mailing list with ``Link:`` tag.
>>
>>+New commits always need an associated gitlab issue for tracking purposes. The
>>+goal is to have as few commits in topic/core-for-CI as possible, and we need to
>>+be able to track the progress in making that happen. Reference the issue with
>>+``References:`` tag. Add the ``core-for-CI`` label to the issue. (Note: Do not
>>+use ``Closes:`` because the logic here is backwards; the issue is having the
>>+commit in the branch in the first place.)
>>+
>> Instead of applying reverts, just remove the commit. This implies ``git rebase
>>--i`` on the current baseline; see directions above.
>>+-i`` on the current baseline; see directions above. Close the associated gitlab
>>+issue when removing commits.
>
> wouldn't it be better to apply the revert and only drop the commit on
> next rebase? This way it doesn't require the force push and it's easier
> to see what was done in the branch since we don't have to procure the
> right CI tag in which things got changed.

Mmh, I guess revert could be left in as an option.

> ... I actually came here to ask: wasn't gitlab supposed to be used for
> patches in maintainer-tools?

Was it? That's not what CONTRIBUTING.rst says. There's been talk about
it, but no decisions to do so. And in any case I wanted more attention
to this than gitlab pull requests would ever get.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
