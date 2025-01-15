Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DF1A11DEB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE29C10E0B4;
	Wed, 15 Jan 2025 09:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DDMxrIqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B66910E0B4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:31:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4363ae65100so67876795e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 01:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1736933422; x=1737538222; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aUvTAUuK+vE10J1nLZZBp9eFGzFCe1s5alimZzVlJt4=;
 b=DDMxrIqTbV8U5/HcL1rAmblK1VDgYGJJf160ywI/Bha55ld/W1+G2jyJZIYKTN7Uez
 1BaOaxW/9rRcHu3hk9ht/wbukqhzF48qewqt6B9Uth/fOLszQH3UIHorz9pkaj0qA8bh
 YkIYkW7S2jXOMkpu81592v7h7ZKuiCrpBS33o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736933422; x=1737538222;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aUvTAUuK+vE10J1nLZZBp9eFGzFCe1s5alimZzVlJt4=;
 b=VszkDOTko5I4anY1QlRBGexloWjAWRsRn918bPbeib9t1fjQ5/xlqAngbvc0lIxKKX
 wVfgzuVwEB7UjXn6u5tzhhal7SrR5prmCB1MZMdL9Mj+N6fgxhCaxIKKWqnsvBpz+P5I
 X0qatnZF8ulIlxDF7R5TDZCGnjzpDv8sntCgezf5zyR/QZnqGXENUxpudrPF8i4P3tqy
 z/wa7ddTJc3RM6jN0tPB4D5HPUTMv8uMpW5T211pHzV6zhT1mdgktmg7tulojQ57PdFG
 nuvDKLR4+iYNp4IePcRmASxIilSyxW7drxutRyIXWHCnRA2/ZGKKu7ZGhe+2BEEHX3Vy
 M5uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGjFj/HYeDnaeroEqNtgJcbX+NgndPlhWcHxq8urwNerpnA0lgll1aDyCGr0cvaYWorRYFFCmWZ1U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBViAdtS44v5gcRzsRRqlgjXhhD284KsGC4AZE+OuK203Lvqu8
 i3nSlwUq1VynR720VOLSiSZyUTtfmZXZxtlqV4H3ppaVkNJOvStds6VShhoMHKo=
X-Gm-Gg: ASbGncuogTVR4aG8Ag4ihbi0XzhQJcyJ3xM0xDSSOl0ljqMeY6itREYtjq53+tGHzsn
 85AQeWeGvyjf+NJRouYMNHF/wbskXhcupTAhISx8aVO8JiMsx1rQeT9s+hvNZqTzyIAq9WN+QrO
 1J1LZ75SC55PuVmXiw4Ez7uRP7OrB/EAS49xztm1OtA6E13TDS/K7Gcz+EBAVEi/EzmtpawTIyW
 ChkrN3MQZHP09PjCF/g8yrdkY3FjPnRHPxr0JEpBH5aUXpprePNDl6Hpq2sid5b6KXN
X-Google-Smtp-Source: AGHT+IGtldPQMqTNqi9uHaVCsMWaiGg1PqZfK+gt9wwMVCogFlQaUNx7qGV0JPnGS4gfh1zxsjxG3Q==
X-Received: by 2002:adf:9799:0:b0:38a:888c:7df0 with SMTP id
 ffacd0b85a97d-38a888c8017mr20207223f8f.1.1736933421232; 
 Wed, 15 Jan 2025 01:30:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e383df8sm17410830f8f.38.2025.01.15.01.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 01:30:20 -0800 (PST)
Date: Wed, 15 Jan 2025 10:30:18 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 stable@vger.kernel.org, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: AAARRRGGGHHH!!!! (was Re: [PATCH 6.12.y] xe/oa: Fix query mode
 of operation for OAR/OAC)
Message-ID: <Z4eAKvX1A3-sV1XE@phenom.ffwll.local>
References: <2025010650-tuesday-motivate-5cbb@gregkh>
 <20250110205341.199539-1-umesh.nerlige.ramappa@intel.com>
 <2025011215-agreeing-bonfire-97ae@gregkh>
 <CAPM=9txHupDKRShZLe8FA2kJwov-ScDASqJouUdxbMZ3X=U1-Q@mail.gmail.com>
 <871px5iwbx.fsf@intel.com>
 <2025011551-volatile-turbofan-52ab@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025011551-volatile-turbofan-52ab@gregkh>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Wed, Jan 15, 2025 at 10:11:00AM +0100, Greg KH wrote:
> On Tue, Jan 14, 2025 at 11:22:26AM +0200, Jani Nikula wrote:
> > On Tue, 14 Jan 2025, Dave Airlie <airlied@gmail.com> wrote:
> > > On Sun, 12 Jan 2025 at 22:19, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >>
> > >> On Fri, Jan 10, 2025 at 12:53:41PM -0800, Umesh Nerlige Ramappa wrote:
> > >> > commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16 upstream
> > >>
> > >> <snip>
> > >>
> > >> > Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset OAC_CONTEXT_ENABLE on OA stream close")
> > >> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > >> > Reviewed-by: Matthew Brost <matthew.brost@intel.com> # commit 1
> > >> > Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > >> > Cc: stable@vger.kernel.org # 6.12+
> > >> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > >> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > >> > Link: https://patchwork.freedesktop.org/patch/msgid/20241220171919.571528-2-umesh.nerlige.ramappa@intel.com
> > >> > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> > >> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > >>
> > >> Oh I see what you all did here.
> > >>
> > >> I give up.  You all need to stop it with the duplicated git commit ids
> > >> all over the place.  It's a major pain and hassle all the time and is
> > >> something that NO OTHER subsystem does.
> > >
> > > Let me try and work out what you think is the problem with this
> > > particular commit as I read your email and I don't get it.
> > >
> > > This commit is in drm-next as  55039832f98c7e05f1cf9e0d8c12b2490abd0f16
> > > and says Fixes: 8135f1c09dd2 ("drm/xe/oa: Don't reset
> > > OAC_CONTEXT_ENABLE on OA stream close)
> > >
> > > It was pulled into drm-fixes a second time as a cherry-pick from next
> > > as f0ed39830e6064d62f9c5393505677a26569bb56
> > > (cherry picked from commit 55039832f98c7e05f1cf9e0d8c12b2490abd0f16)
> > >
> > > Now the commit it Fixes: 8135f1c09dd2 is also at
> > > 0c8650b09a365f4a31fca1d1d1e9d99c56071128
> > >
> > > Now the above thing you wrote is your cherry-picked commit for stable?
> > > since I don't see
> > > (cherry picked from commit f0ed39830e6064d62f9c5393505677a26569bb56)
> > > in my tree anywhere.
> > 
> > The automatic cherry-pick for 6.12 stable failed, and Umesh provided the
> > manually cherry-picked patch for it, apparently using -x in the process,
> > adding the second cherry-pick annotation. The duplicate annotation
> > hasn't been merged to any tree, it's not part of the process, it's just
> > what happened with this manual stable backport. I think it would be wise
> > to ignore that part of the whole discussion. It's really not that
> > relevant.
> 
> On the contrary, this commit shows the whole problem very well.  It is
> trivial for people to get confused, the author submitted a backport of a
> commit that is NOT in Linus's tree because they got an email telling of
> a failure and didn't use the correct id because they looked in the
> drm-next branch, NOT in Linus's branch.
> 
> Which is why I flagged it, as the commit id used here was not a valid
> one at this point in time.  Yes, after -rc1 it would be valid, but
> again, totally confusing.
> 
> You all are seeing confusion with this development model.  That's the
> issue.  Whether or not it's intentional, that's the result.  And because
> of it, I am telling you all, the kernel is less secure as it allows us
> all to get confused and mis backports and drop fixes incorrectly.
> 
> So either you all change the process, or just live with it and the
> consequences of having total confusion at times and grumpy stable
> developers because of it, and less secure users due to missed bug and
> security fixes.

We won't change our process, because I couldn't find the maintainer
volunteers to make that happen. And I don't think you can find them for
me.

Full answer here:

https://lore.kernel.org/dri-devel/Z4d6406b82Pu1PRV@phenom.ffwll.local/

And all we need to sort out the fallout is that
- drm maintainers consistently add cherry-picked from lines (which means
  you need to stop shouting about them)
- downstream consumers look at cherry-picked from lines to figure out all
  the sha1 aliases a commit has, which with the dumbest git log script
  here takes less than a second here to check

I've tried to explain this here in a reply to Sasha:

https://lore.kernel.org/dri-devel/Z4aNwGys3epVzf7G@phenom.ffwll.local/

And yes I'm aware this breaks your workflow, we've had these discussions
at regularly scheduled intervals for as long as we've been doing the
committer model. And I've been trying for as long to explain what you need
to adjust to cope, purely using scripts.

This shit is easy, except somehow here we are almost a decade later.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
