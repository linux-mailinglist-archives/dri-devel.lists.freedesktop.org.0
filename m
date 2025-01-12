Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F63EA0ABB8
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 21:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5DCF10E232;
	Sun, 12 Jan 2025 20:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fhn141L+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A342610E232
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 20:03:04 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-ab2b29dfc65so571361566b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 12:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736712123; x=1737316923; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=24vtEXUXafY7Re8u3pp9OeLIw9fFnvJ67DsBpxoTqI0=;
 b=Fhn141L+ZQCvhJPwkctBGDYe+84fIcaZqakG8xXQi4nzC+F+pNnikColyw0nwGYoUz
 Nmf+UN8nKiPPULcrCE1jAZt9b6nIvZyrZKH+L4hv+QVBkXvS3cariHsqLyMwc1wo3zth
 G5AcKjs0gkmi5v03P2jNr/gPLYaeoPMjMRfvzI0a3Sa+e/e5BLGYPXkLY8cXM/QTOPwv
 pHvxu472deKHDIIz4JCflIuksRjVsU4SzZhhpDJBBgE6saLBnsONMS+2RqHIA+UhkoD0
 3Vs8K6Ja6JxPsECLgHyaS3dKSFbDU+Us8nAc8XUwdPYFTHlAKoLl8v3xAWWZTs0KPRTm
 sJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736712123; x=1737316923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=24vtEXUXafY7Re8u3pp9OeLIw9fFnvJ67DsBpxoTqI0=;
 b=wycRRruENUWGSjV4H2CLviND/uASH5uRj7Sg963s5TPd0WIrkXdNDOv/nmHYptnEWq
 4OyfOfIfmk548bL03ksVZHZwbT0FO4ejGw68gjOdoQjOQlIYpGcINz4cZv7u6ZXhiiLS
 idYoT99Y9ky8S/H3AkH36poxNrdb+VGMLVverxIDa4XHmX3cTu7Q6t4s98AzFJY68q5C
 5oEWQrascCQWMT13U7x8b0CEoC15aNM0iWfOat4/t8G1pET799tkTTzOAEhnk02Tnp9n
 h2F3kx1p8zydy3x6P6SWpPVXZ81xkrh0KqyvOPGbXmUOa2DzQW5hnOFKZv/NBBGaA2Nq
 BM6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU33dslnc9cv9cg69FltLko4T+ys/xwd/Bg1q/YAP5dq0BNVkIeBJTJKYLp4/dAvnOh8gNJICyvdlY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqOst6OlFKRZ8hLPWXztoZcS4/YNSOngs9a7LDQ7t/t2s8N7eK
 8unLD7aFCtgntcVb9RS8atxe8TRd1yk+UTZLKqfFAphRklcJd6zNw0gXFpc9mqTLMXUh0ZC8kqC
 M3a2nUhG6/aqPw+yGrueJvLnxd7XIhg==
X-Gm-Gg: ASbGncsMteD3suGWfB2TYTqzGH78OMe2FrbtmiGHqWIxU12vMHzl6mEWO8G98PbgslW
 uOHDrF+F0HHUN6clfUQi5xH9P+JuhnHnFuW0k
X-Google-Smtp-Source: AGHT+IHby0afkV/v10eb19sI9PIOWGJ7MGAbVtLTzN7zISyycHxAAyza1GqllKQgKc9yQOKMKZDFNP70/RFKyb2MKcY=
X-Received: by 2002:a17:907:6090:b0:aa6:94c0:f753 with SMTP id
 a640c23a62f3a-ab2ab74042bmr1826117066b.33.1736712122912; Sun, 12 Jan 2025
 12:02:02 -0800 (PST)
MIME-Version: 1.0
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
In-Reply-To: <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Jan 2025 06:01:51 +1000
X-Gm-Features: AbW1kvbQgOIwAFBVofsWBbX8rfnWl9fkseD6QT7FQOEEdZyOQjRUOvNm1-HXN7E
Message-ID: <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
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

On Mon, 13 Jan 2025 at 05:51, Dave Airlie <airlied@gmail.com> wrote:
>
> On Sun, 12 Jan 2025 at 22:19, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wrote:
> > > commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
> >
> > <snip>
> >
> > > Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA=
 stream close")
> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com=
>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> > > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Cc: stable@vger.kernel.org # 6.12+
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.57=
1528-2-umesh.nerlige.ramappa@intel.com
> > > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> > > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m>
> > > (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)
> >
> > Oh I see what you all did here.
> >
> > I give up.  You all need to stop it with the duplicated git commit ids
> > all over the place.  It's a major pain and hassle all the time and is
> > something that NO OTHER subsystem does.
> >
> > Yes, I know that DRM is special and unique and running at a zillion
> > times faster with more maintainers than any other subsystem and really,
> > it's bigger than the rest of the kernel combined, but hey, we ALL are a
> > common project here.  If each different subsystem decided to have their
> > own crazy workflows like this, we'd be in a world of hurt.  Right now
> > it's just you all that is causing this world of hurt, no one else, so
> > I'll complain to you.
>
> All subsystems that grow to having large teams (more than 2-4 people)
> working on a single driver will eventually hit the scaling problem,
> just be glad we find things first so everyone else knows how to deal
> with it later.
>
> >
> > We have commits that end up looking like they go back in time that are
> > backported to stable releases BEFORE they end up in Linus's tree and
> > future releases.  This causes major havoc and I get complaints from
> > external people when they see this as obviously, it makes no sense at
> > all.
>
> None of what you are saying makes any sense here. Explain how patches
> are backported to stable releases before they end up in Linus's tree
> to me like I'm 5, because there should be no possible workflow where
> that can happen, stable pulls from patches in Linus' tree, not from my
> tree or drm-next or anywhere else. Now it might appear that way
> because tooling isn't prepared or people don't know what they are
> looking at, but I still don't see the actual problem.
>
> >
> > And it easily breaks tools that tries to track where backports went and
> > if they are needed elsewhere, which ends up missing things because of
> > this crazy workflow.  So in the end, it's really only hurting YOUR
> > subsystem because of this.
>
> Fix the tools.
>
> >
> > And yes, there is a simple way to fix this, DO NOT TAG COMMITS THAT ARE
> > DUPLICATES AS FOR STABLE.  Don't know why you all don't do that, would
> > save a world of hurt.
>
> How do you recommend we do that, edit the immutable git history to
> remove the stable
> tag from the original commit?
>
> >
> > I'm tired of it, please, just stop.  I am _this_ close to just ignoring
> > ALL DRM patches for stable trees...
>
> If you have to do, go do it. The thing is the workflow is there for a
> reason, once you have a large enough team, having every single team
> member intimately aware of the rc schedule to decide where they need
> to land patches doesn't scale. If you can't land patches to a central
> -next tree and then pick those patches out to a -fixes tree after a
> maintainer realises they need to be backported to stable. Now I
> suppose we could just ban stable tags on the next tree and only put
> them on the cherry-picks but then how does it deal with the case where
> something needs to be fixes in -next but not really urgent enough for
> -fixes immediately. Would that be good enough, no stable tags in -next
> trees, like we could make the tooling block it? But it seems like
> overkill, to avoid fixing some shitty scripts someone is probably
> selling as a security application.

If you were to ignore stable tags on drm, could we then write a tool
that creates a new for-stable tree that just strips out all the
fixes/backports/commits and recreates it based on Linus commits to
you, or would future duplicate commits then break tools?

I just don't get what the ABI the tools expect is, and why everyone is
writing bespoke tools and getting it wrong, then blaming us for not
conforming. Fix the tools or write new ones when you realise the
situation is more complex than your initial ideas.

Dave.
