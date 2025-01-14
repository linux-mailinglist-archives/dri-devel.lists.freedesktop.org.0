Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794AEA0FDC2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 02:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02410E80F;
	Tue, 14 Jan 2025 01:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GlQ8qeoa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3727B10E80F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 01:02:47 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5d3e9a88793so8246624a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736816506; x=1737421306; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KR8x262wVRYayaz4U2ZgFqy9W7ibQPJchFlUBvgpUkk=;
 b=GlQ8qeoa+ajg/Z+jqzKmF/fDc/mnFFnYUFgyf/HCkdQQt1XH1Vu9/sV1tngjBf9uQ8
 wzR24xK9HV+eymL2exQiqYYR9QzBc/37jOjZjYr6nqV1sK+crAsrvhLKqaLOyz0M5v4t
 OBw+jE2AGclVVnZK3gA3ej2fX3CEWQG1Uv6LjotQ/3WC4wVvsPgofNgTesrnmWYl0hJL
 NKmW/lhJuQ6h0LW66yEs02XZk5M2d8HPAfbY+7zWQohPB8Nl2/XyBDIi0M0kZ5huq8vY
 57LysJOe3NP1UQScB+iW3SmTw0c0By4+ck1DtIbC04PKDrqB/2jtUZOPzIjmuF6aGt8v
 jXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736816506; x=1737421306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KR8x262wVRYayaz4U2ZgFqy9W7ibQPJchFlUBvgpUkk=;
 b=RH+b/p/msPJzkzy633Apg1VGR2YsOqhz/9Vzel3q13vHJobnpAqL7L0Y/zCNGtma19
 aHJE9XSD7q45nhcVAxGANWyuHyNc1gaTT8CvWEqHCBw0jMBVOeUQAWtPkSEX4jWql103
 iDEHz0Gxp28cUimhnolmjzyRKWwucpYOMBzj6BbKNKI/KhUGKVaEmN2X8pviN2c3Ah22
 RAABT5SaauREhaz+jbXpSVO0KNwgYWSkbN8Cz1WQ+9o80kIp5nsHIwxbiJtqGn8jvzUo
 rLLGFactYCt2AStyA5rWNwopi4vWMNgf5a1rAhyfVwtBeYvuxKWdiQ9ChzTNULi8VhCx
 cd9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5gULvbYwnSFi1um56JNRPnx3pd1fjDLEjWRBiqNsSCFz1g9ZA6Zx5SqxZmNeR0egFG6FI0lgm3FQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5V77njqHHBVXdteXnP8xaVxnTYctE/67nJJ3GuOE+GDR8/RVs
 x6Zo8/nBtgjENPgvSe8foCY9os4feBOUZFqyzRlms/j/DuaFQ4GvusJRS+CA3Vo6V8CTxQ6OG+7
 +LImXkmjr/IITQB0oEP/mlVlU+Xo=
X-Gm-Gg: ASbGncvhJbcJKMgEjWmv4z7Q0G8fFfXaF3rf9q6rZnoRV7D1VfAx5UX8D+150naCuMh
 CblF/pcXh3K2OahufnWQe6j9YD2jp/pwDy8ra
X-Google-Smtp-Source: AGHT+IG9OHjRVB5dxRB6vjb7ClexQSh4MMDqBXloIl743i+E/OfJn+NfmJ7bcb3UQcp2tS+54tAPWTGPOsxw7hp/3JQ=
X-Received: by 2002:a17:907:7f03:b0:aac:1b56:324a with SMTP id
 a640c23a62f3a-ab2ab6e3ce0mr1753586266b.26.1736816505566; Mon, 13 Jan 2025
 17:01:45 -0800 (PST)
MIME-Version: 1.0
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
 <CAPM=9twogjmTCc=UHBYkPPkrdHfm0PJ9VDoOg+X2jWZbdjVBww@mail.gmail.com>
 <2025011247-spoilage-hamster-28b2@gregkh>
 <CAPM=9tx1cFzhaZNz=gQOmP9Q0KEK5fMKZYSc-P0xA_f2sxoZ9w@mail.gmail.com>
 <2025011352-fox-wrangle-4d3f@gregkh>
In-Reply-To: <2025011352-fox-wrangle-4d3f@gregkh>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 14 Jan 2025 11:01:34 +1000
X-Gm-Features: AbW1kvaGwLvveXklTE7aevENmTbX0FOvCCXg2F4583PfDIdJlspnVErwlQzInhc
Message-ID: <CAPM=9tzkJ=dn2gq7GcvtN_C95ZzxwC7XMMXHBrwF6Ez6fYfU=g@mail.gmail.com>
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode of
 operation for OAR/OAC)
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, 
 ashutosh.dixit@intel.com, dri-devel@lists.freedesktop.org
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

> > > We create a "web" when we backport commits, and mark things for "Fixes:"
> > > When we get those ids wrong because you all have duplicate commits for
> > > the same thing, everything breaks.
> > >
> > > > I just don't get what the ABI the tools expect is, and why everyone is
> > > > writing bespoke tools and getting it wrong, then blaming us for not
> > > > conforming. Fix the tools or write new ones when you realise the
> > > > situation is more complex than your initial ideas.
> > >
> > > All I want to see and care about is:
> > >
> > >  - for a stable commit, the id that the commit is in Linus's tree.
> > >  - for a Fixes: tag, the id that matches the commit in Linus's tree AND
> > >    the commit that got backported to stable trees.
> > >
> > > That's it, that's the whole "ABI".  The issue is that you all, for any
> > > number of commits, have 2 unique ids for any single commit and how are
> > > we supposed to figure that mess out...
> >
> > Pretty sure we've explained how a few times now, not sure we can do much more.
>
> And the same for me.
>
> > If you see a commit with a cherry-pick link in it and don't have any
> > sight on that commit in Linus's tree, ignore the cherry-pick link in
> > it, assume it's a future placeholder for that commit id. You could if
> > you wanted to store that info somewhere, but there shouldn't be a
> > need.
>
> Ok, this is "fine", I can live with it.  BUT that's not the real issue
> (and your own developers get confused by this, again, look at the
> original email that started this all, they used an invalid git id to
> send to us thinking that was the correct id to use.)

I'm going to go back and look at the one you pointed out as I'm
missing the issue with it, I thought it was due to a future ID being
used.

> > When future tools are analysing things, they will see the patch from
> > the merge window, the cherry-picked patches in the fixes tree, and
> > stable will reference the fixes, and the fixes patch will reference
> > the merge window one?
>
>
> > but I think when we cherry-pick patches from -next that fix
> > other patches from -next maybe the fixes lines should be reworked to
> > reference the previous Linus tree timeline not the future one. not
> > 100% sure this happens? Sima might know more.
>
> Please fix this up, if you all can.  That is the issue here.  And again,
> same for reverts.
>
> I think between the two, this is causing many fixes and reverts to go
> unresolved in the stable trees.
>
> > Now previously I think we'd be requested to remove the cherry-picks
> > from the -fixes commits as they were referencing things not in Linus'
> > tree, we said it was a bad idea, I think we did it anyways, we got
> > shouted at, we put it back, we get shouted that we are referencing
> > commits that aren't in Linus tree. Either the link is useful
> > information and we just assume cherry-picks of something we can't see
> > are a future placeholder and ignore it until it shows up in our
> > timeline.
>
> I still think it's lunacy to have a "cherry pick" commit refer to a
> commit that is NOT IN THE TREE YET and shows up in history as "IN THE
> FUTURE".  But hey, that's just me.
>
> Why do you have these markings at all?  Who are they helping?  Me?
> Someone else?

They are for helping you. Again if the commit that goes into -next is immutable,
there is no way for it to reference the commit that goes into -fixes
ahead of it.

The commit in -fixes needs to add the link to the future commit in
-next, that link is the cherry-pick statement.

When you get the future commit into the stable queue, you look for the
commit id in stable history as a cherry-pick and drop it if it's
already there.

I can't see any other way to do this, the future commit id is a
placeholder in Linus/stable tree, the commit is immutable and 99.99%
of the time it will arrive at some future point in time.

I'm open to how you would make this work that isn't lunacy, but I
can't really see a way since git commits are immutable.

>
> > I think we could ask to not merge things into -next with stable cc'ed
> > but I think that will result in a loss of valuable fixes esp for
> > backporters.
>
> Again, it's the Fixes and Reverts id referencing that is all messed up
> here.  That needs to be resolved.  If it takes you all the effort to
> make up a special "stable tree only" branch/series/whatever, I'm all for
> it, but as it is now, what you all are doing is NOT working for me at
> all.

I'll have to see if anyone is willing to consider pulling this sort of
feat off, it's not a small task, and it would have to be 99% automated
I think to be not too burdensome.

Dave.
