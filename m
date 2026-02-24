Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGQnENpNnWkBOgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:06:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBE9182B9B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 08:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41F010E185;
	Tue, 24 Feb 2026 07:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DigtrAfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB8E10E185
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 07:05:58 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-896fa834290so58263956d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 23:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771916757; cv=none;
 d=google.com; s=arc-20240605;
 b=Y67/phJo/NXKJ4sX6rufbypi/tBGBvkSywH0Kt2MM7LDw4DpsIALqAlKAYk+BdHyqz
 d13WQHUESYeMcsZs/c0aBSNX1Doj/CM6iCwB51ElzVYdPWiY5ZP4J4Cgqd6kCXXV0lZ5
 /CjGTn9VZSBnlXdorYBhdgHRfoPpTowyeDbeL9j9T8ocVDdz8YWocUI4pP1bWoJV+9Si
 u5vFkFdzr9GgBiaF8F7TjHMsqC5IyJEScCT0Le1Dy5QFwN8LpJtZ6VlsL/uRcwdyFoEe
 0kigx97whq631oCKZhJurIbJNNiy6nvJA2A1l2vHvPQKffVwQkRLnyS4yrgUJ/pQESOm
 Oc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=W/oTXro1YXhmybSFyR2RhCuOX+slA3JE6hCX+t4KmPA=;
 fh=kZKvwlMKW4JCNv9VCBHyOylP0V5Xxj8JJ1kNXTaZVx8=;
 b=kaPrKjeYI++Qa0PIu7w2aiyzkva32smDSLVrN1SRlmeqI6LuDG5U3Rnb26M0pjhujN
 cW3TTQCq4/BiIfpA6gC91rPc01Z64yxqwS7toF9zu3yMWcfMrj/8gJa/4SYkmbCqeHZi
 iMKhzxnQgguA26CnScmffga5wk4Vqdkm3XUaJj0ubV6irStto/jwliVPeWHc+uABtVSu
 ajrmQae+8pMI++ltau0FkS0YP7fw6OggSg0qXoI0u9p3A1cLSY37MtsCgS5xw3GMwWsW
 4z9L9PklDMYXCdzFipzlFYlrMKBZ+w8OwkXi6FFJnwg+3y3V5mG6DF7p/mEnRJUIU+Uh
 h8Qg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771916757; x=1772521557; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W/oTXro1YXhmybSFyR2RhCuOX+slA3JE6hCX+t4KmPA=;
 b=DigtrAfX9gdgWOWDpSVwJMh68phrMCB2v2qL7nCAjUzLPOlzdr5gOZUuBi1azSMtnW
 t16C1qvzs+mvDORoM3O+HgMTuyjGHomTBfeMq74GDrLYwQWONPu1vkR1xFZEP6zaipPY
 krLUa8e/LLo9NiWdS/z99qDYD31vYIzXW5Blv0fvvetdLC043FJqrEXEdAWtfjvq3rLa
 kNz/IxRocoBi8FJHKoa61X6SQAGUcCEy37+2eddKnP+D2zMSyD4PfW6kJ7MCwSGM0JjW
 Z1oKmDnpAmAgkQahZxTX2bbn6n/FQMZN41GwAZ488FxOEENJkq6sZc8PFnlj6nbfrTuF
 c+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771916757; x=1772521557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W/oTXro1YXhmybSFyR2RhCuOX+slA3JE6hCX+t4KmPA=;
 b=BFF4i+2t7efCK3o9xv4+JYHVtemZjAtL2i2nA2CyvmOaAx9kFGUGQWfwQ26Ry/fbDe
 wTyYeUzxe/9etyRLjIsIepKaCFAOFB5LrmE9r8IOc9UgxlELzNYTQv8sY0yDlHfgS1oK
 pJL4E+EVHwxqrFNxS2Epj5O5q4ab+9kJ/S8ZNnTaZ6LhXYOJsDvu1eOPU0iYulJJw0sF
 XYpLvykdArLhRhiHt+e26wgcQ+ML4D/J518LaM/oBLsRD4c5lLkVv4ylZgPmHRbMrEtq
 t0Uc/sbbHuy/AURUKR4BHSytc2WhVguCiezbFMNRDVcLMMy3zJnZBBpZLcOzjHNIq42C
 yjmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcHkHfpwXN5zvqApseloyHROVgVjgXqYo7jde8N1kN0lvhneYxEHP3TmOZpAqqrkY4Dzta2iVa8SY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6U3embIneOioKWecPBZ+DrFxhnvznwgZpRjAYEuOY2a3duo+o
 0wX5O6QcDfZjqozKntB/eQXGRvnMAQVzFbLooXaKyXv4PixX7s3woHzDrSqt0gZsOWgM+K9BcIO
 579Ys4G+FWDHu9eK/FMEWHypGCqffLo/5g6Ou
X-Gm-Gg: ATEYQzwy4Z+pxwEJcjfbH7PmIUAJqRAOakJ+FtAXOYuyzeSyvnZb6pvIyIEW2seu8Y0
 LdBp9hS0CfVgUq1zJPicB14R6eDhE6qNuzBJaQdLuRQe3Tqoz/cPTTQTWmzDgeVuDQu/dEJbmLh
 4ctF2HwQBG8uyVodXUV/hfYVFtSFEcwkjCRoTTcSLoC7zf3/ZMEuZQ7XATWXvmPUx6Bb2VEMlKn
 0WwJAvjqOYHT4H24t+cObJJus0izHNFOm8fuhN7fbPYTSYJGx6/LtDDiGutXCEkL5Z2kEyiXvgb
 8NOap9H92CvxqKGjbaBugZChcSkTvozAMTIVlUsZGqN9o6/hIE+CpUzghTVwJ5FCMiY=
X-Received: by 2002:a05:6214:1bcf:b0:88a:31e5:80fa with SMTP id
 6a1803df08f44-89965b0dc7cmr242060706d6.16.1771916757086; Mon, 23 Feb 2026
 23:05:57 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
 <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info>
 <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
In-Reply-To: <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 24 Feb 2026 17:05:45 +1000
X-Gm-Features: AaiRm51R70KjFTh7wa8zEsBJxwdqC6EDhAe99m3KuEjog0yTvukpXbhfeIOKYr8
Message-ID: <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
Subject: Re: Time from regression report to a merge of a fix (was Re: [git
 pull] drm fixes for 7.0-rc1)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Imre Deak <imre.deak@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:alexander.deucher@amd.com,m:regressions@lists.linux.dev,m:rodrigo.vivi@intel.com,m:ville.syrjala@linux.intel.com,m:jani.nikula@linux.intel.com,m:imre.deak@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,leemhuis.info:email]
X-Rspamd-Queue-Id: 9FBE9182B9B
X-Rspamd-Action: no action

On Tue, 24 Feb 2026 at 16:50, Dave Airlie <airlied@gmail.com> wrote:
>
> On Mon, 23 Feb 2026 at 22:52, Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > Lo!
> >
> > On 2/20/26 21:53, Dave Airlie wrote:
> > >
> > > This is the fixes and cleanups for the end of the merge window, it's
> > > nearly all amdgpu, with some amdkfd, then a pagemap core fix, i915/xe
> > > display fixes, and some xe driver fixes. Nothing seems out of the
> > > ordinary, except amdgpu is a little more volume than usual.
> > >
> > > Let me know if there are any issues,
> >
> > Well, there were two fixes in here that made me wonder if our processes
> > need some optimization to get regressions fixed at least somewhat as
> > fast as Linus wants them to be fixed[1]:
> >
> > * One fix in here was for a amdgpu regression introduced in v6.19-rc6
> > (and also affecting many stable series due to backports). The fix was
> > ready within ~2 days and could even have made v6.19 -- but it only
> > reached mainline through this PR on Friday. IOW: After two weeks. Which
> > got me wondering, "Should we do something to merge fixes like that
> > faster"? And yes, it's the merge window =E2=80=93 but that's also when =
Arch
> > Linux and openSUSE Tumbleweed usually jump to the latest mainline serie=
s
> > and thus expose regressions like this to many users, so I guess it woul=
d
> > be good to get them fixed at least as fast as outside of merge windows.

I think due to the patch pipeline depth and volume that amdgpu and
i915/xe are dealing with we may need to consider some better
regression revert pipelines,

The problem is most patches get fed into the start of their -next
pipelines, where CI etc picks up on them, but there isn't enough
urgency to create separate trees or pulls outside the regular fixes
ones.

The amdgpu one definitely should have been fixed in 6.19, Alex any
idea how we can alleviate that sort of problem, esp if a bug has
multiple regression reports.

> >
> > * One fix in here was for a i915/xe regression introduced in v6.18-rc1.
> > Once reported, it took about six weeks to get fixed =E2=80=93 and then =
nearly 10
> > days for the fix to reach mainline. Looking at this, I once more
> > wondered if this could have been merged faster. But even more I wondere=
d
> > why the culprit wasn't reverted, as that's what Linus afaics wants when
> > it takes this long.

I think for the i915 one the problem patch should have been reverted
asap, but I just don't think there was a responsible person to do it,
maintainers need to be in the loop for these sort of problems, but if
they aren't in the loop and the regression sits in the bug tracker
without them being looped on it, we rely on the reporter or developer
to find it and do the right thing. Esp when developers are head down
on fixing it, but then it doesn't get flagged as urgent once it goes
into the -next pipeline and so on. We don't usually break the weekly
fixes cycles for drm, because CI backlogs and other things it just
fits nicely, if we do have regressions like this it might be that we
need to start having urgent PRs out of cycle, which I don't object to,
it's just a matter of whether maintainers can have this sort of
insight into patches in the pipeline when there is quite a long
backlog.

Thanks for the detailed analysis, I've cc'ed some more Intel people.

Dave.
