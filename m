Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737D4A0ABB3
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 20:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C26010E012;
	Sun, 12 Jan 2025 19:52:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UnaYdPLH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B840510E012
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 19:52:43 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso653671266b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 11:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736711502; x=1737316302; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jqoj+LVFeljDEZ9wmZBYUohOcDraiuy5uzmq7gbdpmQ=;
 b=UnaYdPLHecg3nQP894Es7azcM3ChAWRZw1kpjaJLi++XAdSBetOCyVXMTUCIC9Ix2p
 KDhYQZ6OYcVkC6rs9BdWFN/60KGcxspXEZjpDkjyrzROb3i4JwaCGVxsE71Ju7kjt8cA
 0Z4/rqrJxPp5pVqHvzD1re9+sSJrgfLWqE+LmQFcdY/Qb2KCV0XyvaWA+yuEGPmTvkW2
 xcYYHBdOm+vRxM0MSbwudUTmT/WBTyTxEnID2kPtuYrCrrX8x/jcTt4vVMz1avHlpYAO
 Myr4dvMUuKYH8FqJsUBdD07l1i8AtHaCRFo5o6/NTNXEP2V9OYSjmDvmMIwfpoId2S48
 5Z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736711502; x=1737316302;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jqoj+LVFeljDEZ9wmZBYUohOcDraiuy5uzmq7gbdpmQ=;
 b=CJ58Bgwp2pJZyhNWFVg1M14kcn3uKA661mAorO0TLjCObpWCXrfIFV2oSskqJ7xfR4
 xZWba3O3wBGGEXeuI+MDc5W4B9LKMvPSG60bG334KHLsERqdIUvWOP0Xr8KGjJIefkdu
 WXrpsV4ApH/HmADZe6RTA79uG9nzm0ehntEoOTlSBVEcdriLjdSBVsMB9NLJY2kV9Hc4
 n7S9tQa/ziasz0j6kQ/YVp8NUnssogAln765D06UpHrnLqVi1nFd+5ifW0P2V14q3I9j
 4BclD+n5KQ9RIBBB0/rXGoZu055rZrBZJpAw8B0ZPMhBBiQZRkCou4V0X3E8O34h4RUg
 BpIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsrbwWPgRc1i+3i5O+FUnS5ywZPFe6DgJ2klcj+J/sZgpBJqvrgdIcOlQEQMtn2gzv+owT8OVE/HI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6yJFAKlgz48g1B69XE6lqihbThM7cQHYlttuYiwBFFRRfxANS
 /PrXWugjxEDQdKcjZtkmCcMoI66UskEutC9nMU/sXNI86EY2cC1xT/j0encShdNja2iBbG82sBh
 zTTLQcVErpY/a/D5Kx2dSodtsdVE=
X-Gm-Gg: ASbGncsCmYHszX3MtdXTIi5x0ETVT4mwvEQllY6ZGgk7r4gaxRt+C/jIZ6FT+w4MGDH
 p2i6zf4LcNGgbe+k/sZ0+ZwzQrXgKww2zsH8B
X-Google-Smtp-Source: AGHT+IHXZ5qLhl39esDy0/pbwRi5e4+RVMT3cpj7huONOyCSzq2iZdIJl3yahjMR7BVkbFfemwK5TWaWMJksp2mve7I=
X-Received: by 2002:a17:907:781:b0:aa6:995d:9ef1 with SMTP id
 a640c23a62f3a-ab2ab6a84d3mr1724087466b.12.1736711501851; Sun, 12 Jan 2025
 11:51:41 -0800 (PST)
MIME-Version: 1.0
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
In-Reply-To: <2025011215-agreeing-bonfire-97ae@gregkh>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 13 Jan 2025 05:51:30 +1000
X-Gm-Features: AbW1kvatlKEHF8E1md2dmbmZbsJItcE13h58uxanXtWre8LbEZm8I2szFyLGARU
Message-ID: <CAPM=9txn1x5A7xt+9YQ+nvLaQ3ycekC1Oj4J2PUpWCJwyQEL9w@mail.gmail.com>
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

On Sun, 12 Jan 2025 at 22:19, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wrote:
> > commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
>
> <snip>
>
> > Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA s=
tream close")
> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: stable@vger.kernel.org # 6.12+
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.5715=
28-2-umesh.nerlige.ramappa@intel.com
> > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)
>
> Oh I see what you all did here.
>
> I give up.  You all need to stop it with the duplicated git commit ids
> all over the place.  It's a major pain and hassle all the time and is
> something that NO OTHER subsystem does.
>
> Yes, I know that DRM is special and unique and running at a zillion
> times faster with more maintainers than any other subsystem and really,
> it's bigger than the rest of the kernel combined, but hey, we ALL are a
> common project here.  If each different subsystem decided to have their
> own crazy workflows like this, we'd be in a world of hurt.  Right now
> it's just you all that is causing this world of hurt, no one else, so
> I'll complain to you.

All subsystems that grow to having large teams (more than 2-4 people)
working on a single driver will eventually hit the scaling problem,
just be glad we find things first so everyone else knows how to deal
with it later.

>
> We have commits that end up looking like they go back in time that are
> backported to stable releases BEFORE they end up in Linus's tree and
> future releases.  This causes major havoc and I get complaints from
> external people when they see this as obviously, it makes no sense at
> all.

None of what you are saying makes any sense here. Explain how patches
are backported to stable releases before they end up in Linus's tree
to me like I'm 5, because there should be no possible workflow where
that can happen, stable pulls from patches in Linus' tree, not from my
tree or drm-next or anywhere else. Now it might appear that way
because tooling isn't prepared or people don't know what they are
looking at, but I still don't see the actual problem.

>
> And it easily breaks tools that tries to track where backports went and
> if they are needed elsewhere, which ends up missing things because of
> this crazy workflow.  So in the end, it's really only hurting YOUR
> subsystem because of this.

Fix the tools.

>
> And yes, there is a simple way to fix this, DO NOT TAG COMMITS THAT ARE
> DUPLICATES AS FOR STABLE.  Don't know why you all don't do that, would
> save a world of hurt.

How do you recommend we do that, edit the immutable git history to
remove the stable
tag from the original commit?

>
> I'm tired of it, please, just stop.  I am _this_ close to just ignoring
> ALL DRM patches for stable trees...

If you have to do, go do it. The thing is the workflow is there for a
reason, once you have a large enough team, having every single team
member intimately aware of the rc schedule to decide where they need
to land patches doesn't scale. If you can't land patches to a central
-next tree and then pick those patches out to a -fixes tree after a
maintainer realises they need to be backported to stable. Now I
suppose we could just ban stable tags on the next tree and only put
them on the cherry-picks but then how does it deal with the case where
something needs to be fixes in -next but not really urgent enough for
-fixes immediately. Would that be good enough, no stable tags in -next
trees, like we could make the tooling block it? But it seems like
overkill, to avoid fixing some shitty scripts someone is probably
selling as a security application.

Dave.
