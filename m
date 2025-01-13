Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E35A0ACDE
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 01:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEB710E0DC;
	Mon, 13 Jan 2025 00:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lhGF8EAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B354210E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 00:45:52 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so716004066b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 16:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736729091; x=1737333891; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ed6yu2Btta8uP5wYCLy/XIFrufLqp2ZZTNzoMZ0tWl0=;
 b=lhGF8EAoHLQkvxvwZFbGJni6j992oEXJ9Q6usTyEVCKWKoUU4mS6s0qTy2HxMwFU+N
 haiYPVMsVx6Hf8djdPRo7v2RDbmvZStgKq+pr3q0RIbdDUN8SkvAS9bzDPXqX+lH4OV2
 ObvwEGTFgUPyQyYw9E/yHtipW2K5a0KgMB8v453XhniECAxzFZqXGk+qVQweGyQWJEZv
 7023nhLdFctnr06UoS9aaMOQAyAl5tUED2Q9rXai1mEY02UlEyGXIo5HuvY24BFaTTul
 OZdiKPnpjqoa7oCAefRDj2DboJ+jpC3oDFnhlEbZQhuqtHRcSNLlX7dvbBvQihuEQJ/B
 F4Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736729091; x=1737333891;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ed6yu2Btta8uP5wYCLy/XIFrufLqp2ZZTNzoMZ0tWl0=;
 b=Nq3qiBfdPwLkuk7o7Ut3OaI5mqppAsV28ghwi73tqPs3V5PIlf5sQRDrrrlBcbW76/
 qGn7HtF6RCxtLWxgm3E5e1b+Qe2HXoBAr3iDDttdQ8hs0nbekCMjRliqPhktiXd2j5Z/
 v1VhN9XJ8754i6Jv6mOiY+CibARkCTCa+vMvgVRVhejEBn7LwNpskX5oLSjkCOFNkCiL
 18KzxW5zQ3qB0Qv0Q/uy2j/ZbZuMgHnLA8tgWn9mhyzZqSWa9ywi8Dh8tXHu1JqyecZy
 BkjPJm5AyRZbbAq7S307MRrdtjnaQahz8PtYcouvzW0a2L3kPTwcwm53WkU6ZuFf5g40
 zmag==
X-Forwarded-Encrypted: i=1;
 AJvYcCViol1VJXUW4WYakXu14Gu9nQWsPB8f2WpPru2JK17wYFOUdfKgRMMm2ChQJmf5J9q/IPyaItXVvu8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzK1yn92Y9a9QAt/OW0epI2Gf860TNxe25Blmq8ZNEg8xg51GTd
 qktBzs8BeAGDtwS5ic7LHo5e9IBjYvCsOkdNZu31Jn7d+94iZQVsRbpij0GrWbygawhEgj0lqH+
 gI9DjWoExqc5yxgVDhe10n1tQQ+4=
X-Gm-Gg: ASbGncvThwgFMSkq7SsybE8YIu9vXqOTEI+w6xPcaS3ncJaAmy56Yzi55GytGwq/F48
 1rrgAV6IhMDq425ZBQuaLy6JFlf4+WtKN5EZpRw==
X-Google-Smtp-Source: AGHT+IHADxkVijX1SDXR/BdC961tQo7xkFTqgVAf31KMP0gAmMQXk5WLx9VDoC7t4S1tqOFG9trHI/khKgzptxwy/+I=
X-Received: by 2002:a17:906:d555:b0:aa6:8d51:8fdb with SMTP id
 a640c23a62f3a-ab2ab703ef6mr1630615666b.19.1736729090868; Sun, 12 Jan 2025
 16:44:50 -0800 (PST)
MIME-Version: 1.0
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
In-Reply-To: <2025011247-spoilage-hamster-28b2@gregkh>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Jan 2025 10:44:41 +1000
X-Gm-Features: AbW1kvbdLKwykGc27KCJQu_69YzqdxTNa4wGRT1Ri3yglteUcswsn0Ew4zBHKWc
Message-ID: <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode of
 operation for OAR/OAC)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, 
 ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, 13 Jan 2025 at 07:09, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jan 13, 2025 at 06:01:51AM +1000, Dave Airlie wrote:
> > On Mon, 13 Jan 2025 at 05:51, Dave Airlie <airlied@gmail.com> wrote:
> > >
> > > On Sun, 12 Jan 2025 at 22:19, Greg KH <gregkh@linuxfoundation.org> wr=
ote:
> > > >
> > > > On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wro=
te:
> > > > > commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
> > > >
> > > > <snip>
> > > >
> > > > > Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE o=
n OA stream close")
> > > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel=
.com>
> > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> > > > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > Cc: stable@vger.kernel.org # 6.12+
> > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > Link: https://patchwork.freedesktop.org/patch/msgid/2024122017191=
9.571528-2-umesh.nerlige.ramappa@intel.com
> > > > > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f=
16)
> > > > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.inte=
l.com>
> > > > > (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb=
56)
> > > >
> > > > Oh I see what you all did here.
> > > >
> > > > I give up.  You all need to stop it with the duplicated git commit =
ids
> > > > all over the place.  It's a major pain and hassle all the time and =
is
> > > > something that NO OTHER subsystem does.
> > > >
> > > > Yes, I know that DRM is special and unique and running at a zillion
> > > > times faster with more maintainers than any other subsystem and rea=
lly,
> > > > it's bigger than the rest of the kernel combined, but hey, we ALL a=
re a
> > > > common project here.  If each different subsystem decided to have t=
heir
> > > > own crazy workflows like this, we'd be in a world of hurt.  Right n=
ow
> > > > it's just you all that is causing this world of hurt, no one else, =
so
> > > > I'll complain to you.
> > >
> > > All subsystems that grow to having large teams (more than 2-4 people)
> > > working on a single driver will eventually hit the scaling problem,
> > > just be glad we find things first so everyone else knows how to deal
> > > with it later.
> > >
> > > >
> > > > We have commits that end up looking like they go back in time that =
are
> > > > backported to stable releases BEFORE they end up in Linus's tree an=
d
> > > > future releases.  This causes major havoc and I get complaints from
> > > > external people when they see this as obviously, it makes no sense =
at
> > > > all.
> > >
> > > None of what you are saying makes any sense here. Explain how patches
> > > are backported to stable releases before they end up in Linus's tree
> > > to me like I'm 5, because there should be no possible workflow where
> > > that can happen, stable pulls from patches in Linus' tree, not from m=
y
> > > tree or drm-next or anywhere else. Now it might appear that way
> > > because tooling isn't prepared or people don't know what they are
> > > looking at, but I still don't see the actual problem.
> > >
> > > >
> > > > And it easily breaks tools that tries to track where backports went=
 and
> > > > if they are needed elsewhere, which ends up missing things because =
of
> > > > this crazy workflow.  So in the end, it's really only hurting YOUR
> > > > subsystem because of this.
> > >
> > > Fix the tools.
> > >
> > > >
> > > > And yes, there is a simple way to fix this, DO NOT TAG COMMITS THAT=
 ARE
> > > > DUPLICATES AS FOR STABLE.  Don't know why you all don't do that, wo=
uld
> > > > save a world of hurt.
> > >
> > > How do you recommend we do that, edit the immutable git history to
> > > remove the stable
> > > tag from the original commit?
> > >
> > > >
> > > > I'm tired of it, please, just stop.  I am _this_ close to just igno=
ring
> > > > ALL DRM patches for stable trees...
> > >
> > > If you have to do, go do it. The thing is the workflow is there for a
> > > reason, once you have a large enough team, having every single team
> > > member intimately aware of the rc schedule to decide where they need
> > > to land patches doesn't scale. If you can't land patches to a central
> > > -next tree and then pick those patches out to a -fixes tree after a
> > > maintainer realises they need to be backported to stable. Now I
> > > suppose we could just ban stable tags on the next tree and only put
> > > them on the cherry-picks but then how does it deal with the case wher=
e
> > > something needs to be fixes in -next but not really urgent enough for
> > > -fixes immediately. Would that be good enough, no stable tags in -nex=
t
> > > trees, like we could make the tooling block it? But it seems like
> > > overkill, to avoid fixing some shitty scripts someone is probably
> > > selling as a security application.
> >
> > If you were to ignore stable tags on drm, could we then write a tool
> > that creates a new for-stable tree that just strips out all the
> > fixes/backports/commits and recreates it based on Linus commits to
> > you, or would future duplicate commits then break tools?
>
> That would be great, just pick which commit id to reference (i.e. the
> one that shows up in Linus's tree first.)
>
> But then, be careful with the "Fixes:" tags as well, those need to line
> up and match the correct ones.
>
> We create a "web" when we backport commits, and mark things for "Fixes:"
> When we get those ids wrong because you all have duplicate commits for
> the same thing, everything breaks.
>
> > I just don't get what the ABI the tools expect is, and why everyone is
> > writing bespoke tools and getting it wrong, then blaming us for not
> > conforming. Fix the tools or write new ones when you realise the
> > situation is more complex than your initial ideas.
>
> All I want to see and care about is:
>
>  - for a stable commit, the id that the commit is in Linus's tree.
>  - for a Fixes: tag, the id that matches the commit in Linus's tree AND
>    the commit that got backported to stable trees.
>
> That's it, that's the whole "ABI".  The issue is that you all, for any
> number of commits, have 2 unique ids for any single commit and how are
> we supposed to figure that mess out...

Pretty sure we've explained how a few times now, not sure we can do much mo=
re.

If you see a commit with a cherry-pick link in it and don't have any
sight on that commit in Linus's tree, ignore the cherry-pick link in
it, assume it's a future placeholder for that commit id. You could if
you wanted to store that info somewhere, but there shouldn't be a
need.

When the initial commit enters during the next merge window, you look
for that subject or commit id in the stable tree already, if it
exists, dump the latest Linus patch on the floor, it's already in
stable your job is done.

When future tools are analysing things, they will see the patch from
the merge window, the cherry-picked patches in the fixes tree, and
stable will reference the fixes, and the fixes patch will reference
the merge window one?

I'm just not seeing what I'm missing here, fixes tags should work
fine, but I think when we cherry-pick patches from -next that fix
other patches from -next maybe the fixes lines should be reworked to
reference the previous Linus tree timeline not the future one. not
100% sure this happens? Sima might know more.

Now previously I think we'd be requested to remove the cherry-picks
from the -fixes commits as they were referencing things not in Linus'
tree, we said it was a bad idea, I think we did it anyways, we got
shouted at, we put it back, we get shouted that we are referencing
commits that aren't in Linus tree. Either the link is useful
information and we just assume cherry-picks of something we can't see
are a future placeholder and ignore it until it shows up in our
timeline.

I think we could ask to not merge things into -next with stable cc'ed
but I think that will result in a loss of valuable fixes esp for
backporters.

Dave.
