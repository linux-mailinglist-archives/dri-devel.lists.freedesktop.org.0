Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1323E2E9C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 18:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C889F6EBAC;
	Fri,  6 Aug 2021 16:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8DD6EBAA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628268800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ZEpSENegGTKcl94DPkyLII32ucBoa1l7fktBHRnpnpg=;
 b=LZv3AXzf2Lx/s6KnAU91uqKPg2B1Dx5KXM9gHqr+nbVWSmy5ecpsCGJ9AlaS5EvT0QJPL8
 wFM0DTfPGN3+2QuJl+xDtN+sA8Qwo5MJ/FaFBnT+O4k+Ox1mFq/3JOZaIgEq3CoBq5JTE3
 XU/PeVLpOgk0mzBkrzEt59SgCol/3iY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-smEGuMblPtyrQkRR4qwgOQ-1; Fri, 06 Aug 2021 12:53:18 -0400
X-MC-Unique: smEGuMblPtyrQkRR4qwgOQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 j16-20020a5d44900000b02901549fdfd4fcso3358638wrq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Aug 2021 09:53:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZEpSENegGTKcl94DPkyLII32ucBoa1l7fktBHRnpnpg=;
 b=ModtyeZ/ZIgU36TmxWmPkpb18KwBhI1QXoZlT84j1sIPAbek71jlKO4J2Mljz0YpIy
 NAAQs7yq/NGnVZALKj0l3gGtYEZulrb3CKnhYR8pYga+BYJ4JUmWvxu/osb3J0NnLiYs
 kwfouMZHbXYY9bVZR8YM+pOoG9oGXWIWrHcy5lRxO5toBT0RVCyp++n2sgCZ82WVqY1F
 bnev5uS864/RJYLP0YGDnJItHBQBulVfubMf7d68r5b/HVqkMeZRcFu2BO/eCLdB43wY
 IM4GunHJYzQiggEkNaMx97iKH9SXJPx6h2D3JxiRtUg5U9G5UcWaP4cv+HbLE4m+DkN5
 Qy2Q==
X-Gm-Message-State: AOAM530aALtIEwQKsSpeKLTVP37M3JzBxnFl660omBsE6NbQrg4ranLN
 icIdpaRorD0nDH26fR16IOrWlf4V+qkLs7Nuw9MAVcRZuhx+khEabLHVpjY3UOO30csuEBvpfgz
 ZSctV3fK//qHnV9T5Pmi/lGhO7gqaQpwbL6JdbrlMCctV
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr4257469wmq.1.1628268797368; 
 Fri, 06 Aug 2021 09:53:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxM1Xcmg0OD97kmQLRFS5wI8PoB/N4HGJ76QUbsdIJ0jkmu8Bgpnkdetr7TVSc21mu2BIaap7ZBZDoDE2qZGfE=
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr4257451wmq.1.1628268797075; 
 Fri, 06 Aug 2021 09:53:17 -0700 (PDT)
MIME-Version: 1.0
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 6 Aug 2021 18:53:06 +0200
Message-ID: <CACO55ttigE42t+gmPvTtZ1QD6a9=5v3Mo9r6CMsOpDYo61Jj-g@mail.gmail.com>
Subject: Proposal for allowing more Nouveau contributors to merge patches
To: nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Hey everybody,

so, here is a proposal of what we could change in order to allow
patches to land faster, more reliably and to increase the overall bus
factor in terms of nouveau kernel maintenance.

But let's start with the current situation:

At the moment contributors have to send patches to the nouveau mailing
list in order to submit them for inclusion into Bens nouveau tree.
Then Ben has to look at them and either respond with a comment on what
needs to change or merge it. At some point Ben submits all new changes
to nouveau for inclusion into the drm-next tree.

Practically there are a few problems here:
1. Not all patch submissions get a response
2. Patch submitters usually don't get to know if their patches are
accepted unless they appear in drm-next or linus' tree.
3. A lot of trivial patches never make it into the tree.
4. Depending on how overloaded Ben is, even bigger patch series adding
new features never get any responses at all.
5. Patch series might get stale for any other reason and there is no
good tool to track open patch submissions (no, patchwork isn't good
and it sucks and not even in the mood to explain this to people
thinking otherwise as this should just be obvious)

This usually ends up discouraging new contributors from making more
contributions to nouveau as they see that some or all of their patches
never get any reaction and it's even annoying to current contributors
if they see their patches being stuck as well.

And here I want to stress that none of this is Ben's fault and has his
own things to work on and none of this should just depend on one
person finding enough time. So the solution shouldn't be a simple
"let's find a different tool and everything should be perfect" but the
solution should be "how can we change the process so it's less time
consuming for Ben to accept patches". And while working on this, I'd
also want to tackle the problem that contributing to nouveau shouldn't
be frustrating for new contributors and the process should be more
lively overall.

So for this I want to propose a new workflow, which would also spread
some responsibilities around active members of the nouveau community:

1. We should have a public nouveau tree (which could be
https://gitlab.freedesktop.org/drm/nouveau or something else) with a
nouveau-next branch collecting all patches for the next kernel major
kernel release.
At the moment the "official" nouveau tree is kind of
https://github.com/skeggsb/nouveau but there is
https://github.com/skeggsb/linux as well. The main problem is, it's a
repository tight to a person. We already have
https://gitlab.freedesktop.org/drm/nouveau as a bug tracker, but it
also contains a full linux git tree which is updated automatically
through a CI job.

2. A chosen group of people should have push rights to this repository
in order to accept patches sent in via emails to the nouveau Mailing
List or fancy UIs (like gitlabs MRs) or other ways.
Trusted contributors should be allowed to review and accept submitted
patches in order to reduce the workload on Ben. Those patches will be
collected on the nouveau-next branch. Patches from a mailing list
could e.g. be submitted through a MR on gitlab or just pushed to the
branch directly.

3. We should ensure through CI that submitted patches are at least
passing basic quality control (checkpatch, compile testing, sparse,
etc...)
I already worked on this and one example can be seen here:
https://gitlab.freedesktop.org/drm/nouveau/-/merge_requests/3
There are more things we could add to it, like checking if sparse is
happy or add additional checks. Adding tests against hw is something
we want to target for the future as well.

4. patches from nouveau-next should be included into a "higher" git
tree (drm-next or drm-misc-next) by authorized people after getting a
final review by Ben or somebody else.
The idea is to post all collected patches for final review to the
mailing list as Ben wanted to have a final possibility to nack it in
case something stands out. We could then depend on Ben including those
patches, but we could also use commit rights to drm-next or
drm-misc-next from other people as well. I have commit access to the
drm-misc repository, and I would assume that Lyude would be able to
get it as well or already has it.

5. Urgent fixes should land via drm-fixes or drm-misc-fixes.
We kind of already do this already though. We could spin up a
nouveau-fixes branch in the future, but the amount of such fixes is so
low it's not really worth the effort at the moment. And we have access
to drm-misc.

Once we decide to start and agree to some process, we should try it
out with trivial patches, we already get enough of. Like Typo fixes,
patches adding docs or removing dead code and can expand this to more
"serious" work once we agree that it actually works and does have
benefits to nouveau overall.

Any thoughts on this?

