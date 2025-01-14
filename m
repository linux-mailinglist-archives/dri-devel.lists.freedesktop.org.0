Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B5DA0FDD8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 02:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AEF10E2A9;
	Tue, 14 Jan 2025 01:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GZ30C3gL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263D110E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 01:13:18 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aaf8f0ea963so967057966b.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:13:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736817137; x=1737421937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oWqPdJGeQo7PUO9WTDvJd72Uxz/7LJTMAQqHq6qP2wQ=;
 b=GZ30C3gLnzI+snJFjAF4KqDNmovB+H7/nxhpeI1s09gXtT3mGyMY4dKiZsWpwuO0gi
 a5HUVE8VlAhIljsoD9ckJSH+opLazDaj73/zPfdFAXvKtg3LiBYdYM5/d3dLR+fJt7Mv
 Kk2Yc5KfC7FN0zlIFkjT39kkFteoRU8TQdgSxkaOuuRFdafbhMOxEo1C9KDz5QarcLiK
 ScupwriDgEnXVwq/89A1IBGW8YKJR9dllnEWtqlP09Zg9D9Mn4S37Ppy+a/mDgN1VD8y
 ss/NRWjhLGxPQeQEIqTn/eQ7y/9BIfc7f+kY6TODpy1M4YMzMuebwxhgxvTJNeqpX3/c
 nYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736817137; x=1737421937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oWqPdJGeQo7PUO9WTDvJd72Uxz/7LJTMAQqHq6qP2wQ=;
 b=UMO+tazqhZcU5TyzpGW6Glwvj3B9m6dLvq1BwlcbaGsvK5Ei0/xOYyIui41WktyttP
 7SL7GgtFRafWKnQpireNR1Qsr0M0SeKuL55taIgbkF9/BeIccaMpNMJvJOPcK1Rqj35c
 shOZLTWLbcywqYPQJ+6k+BNk0SOZnzoomeL06Mm2SEeMTBMETNvKrKK/orIj+8XP0ynB
 ilLvhUWMLDz8c4D3T9qoX/Wa5ZkvFM2igtRts+tYTM8e9yhOMiDFyDSnoiv8Yks1nTqH
 qGnybs2zi6IlR0JD+qE+6ARed/BSNGei8OEOX5OtFITEQ5PU41jJQh4jaFSbtOMaiC14
 ebMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7cSRx5WaIiODHci4yP/q26mm3uojoVeeJtUNGiuD+xeWu6vVTCa1xFByLUtLDpf95FBPC8TW/Z3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxve3XJ3buks1NWpI3MGTsSRZWeVAu2ehNaW/zw21w1thTNRIBw
 eRzobGzIC8dmwiUkthuWq0PLsccxjI93GLcuMmi9jnL3XyMmoYvAV4Sj+YwgOa0RqAz2lwYKm5Y
 3LFxEpjkocFctskg/juE0rMrJaHs=
X-Gm-Gg: ASbGnctxEmqLL5Winbr9OahnHx+/0Xhv8+JlfntDf5e/fxtjFfAeO7t3g19dZkHVueh
 seDexU+ZfhWAFUPlX1enSk+SWYoS5NwCnPTtD
X-Google-Smtp-Source: AGHT+IGk1rLjbCwHpCrMJLg8GTQSpq28SjylCz+YVmJ1l/5tk2xH6hsQ4VBNdxmRiUZIHDFFoj5vs5J7fTnoTcKZWoA=
X-Received: by 2002:a17:907:3da1:b0:aaf:3f57:9d2e with SMTP id
 a640c23a62f3a-ab2aaaf6571mr2258973766b.0.1736817136400; Mon, 13 Jan 2025
 17:12:16 -0800 (PST)
MIME-Version: 1.0
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
In-Reply-To: <2025011215-agreeing-bonfire-97ae@gregkh>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 14 Jan 2025 11:12:05 +1000
X-Gm-Features: AbW1kvYyf9IyhJjapU_Vlu0qGyAzEWDRjPTCN40O24xjgHFZMvodugfzct7PJQg
Message-ID: <CAPM=9txHupDKRShZLe8FA2kJwov-ScDASqJouUdxbMZ3X=U1-Q@mail.gmail.com>
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
>
> Oh I see what you all did here.
>
> I give up.  You all need to stop it with the duplicated git commit ids
> all over the place.  It's a major pain and hassle all the time and is
> something that NO OTHER subsystem does.

Let me try and work out what you think is the problem with this
particular commit as I read your email and I don't get it.

This commit is in drm-next as  55039832f98c7e05f1cf9e0d8c12b2490abd0f16
and says Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset
OAC_CONTEXT_ENABLE on OA stream close)

It was pulled into drm-fixes a second time as a cherry-pick from next
as f0ed39830e6064d62f9c5393505677a26569bb56
(cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)

Now the commit it Fixes: 8135f1c09dd2 is also at
0c8650b09a365f4a31fca1d1d1e9d99c56071128

Now the above thing you wrote is your cherry-picked commit for stable?
since I don't see
(cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)
in my tree anywhere.

So this patch comes into stable previously as
f0ed39830e6064d62f9c5393505677a26569bb56 ? and then when it comes in
as 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 you didn't notice you
already had it, (there is where I think the extra step of searching in
git history for the patch (this seems easily automatable) should come
in.

Or is the concern with the Fixes: line referencing the wrong thing?

Dave.
>
> Yes, I know that DRM is special and unique and running at a zillion
> times faster with more maintainers than any other subsystem and really,
> it's bigger than the rest of the kernel combined, but hey, we ALL are a
> common project here.  If each different subsystem decided to have their
> own crazy workflows like this, we'd be in a world of hurt.  Right now
> it's just you all that is causing this world of hurt, no one else, so
> I'll complain to you.
>
> We have commits that end up looking like they go back in time that are
> backported to stable releases BEFORE they end up in Linus's tree and
> future releases.  This causes major havoc and I get complaints from
> external people when they see this as obviously, it makes no sense at
> all.
>
> And it easily breaks tools that tries to track where backports went and
> if they are needed elsewhere, which ends up missing things because of
> this crazy workflow.  So in the end, it's really only hurting YOUR
> subsystem because of this.
>
> And yes, there is a simple way to fix this, DO NOT TAG COMMITS THAT ARE
> DUPLICATES AS FOR STABLE.  Don't know why you all don't do that, would
> save a world of hurt.
>
> I'm tired of it, please, just stop.  I am _this_ close to just ignoring
> ALL DRM patches for stable trees...
>
> greg k-h
