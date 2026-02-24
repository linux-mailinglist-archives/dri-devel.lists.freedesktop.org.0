Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id g9kYAjCynWnURAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:14:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4880418838C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 15:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E132C10E587;
	Tue, 24 Feb 2026 14:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wwz/ZXvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com
 [74.125.82.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37F910E587
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 14:14:03 +0000 (UTC)
Received: by mail-dy1-f174.google.com with SMTP id
 5a478bee46e88-2baa1ed79b0so189148eec.3
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:14:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771942443; cv=none;
 d=google.com; s=arc-20240605;
 b=Gllsjq+nU1qrAjjiCjcxt9wPxr1m7okeVRZeb3AG82/Vjg0v+YpJomuNSH561QC76E
 xAVZTod0+j1TjDzY8MqmW7qJrwk19b8FP9PAAe0sHtpUJgjazi+8TjK9uhDeVMkUAupy
 Kmlm5ZC1sWOshfSzGl8Y+BrA0SVzE7FL+qGhvumdSsSpF4or4uEYv2F5kw/i4cvLIVlz
 Dc8ia43dpS1y75ItgfK6wcp/MV55Y3OZ2XOlI2HEMGiymZ5Fz6Hb72P2/XQBKwbVWmim
 5MvbDf1DxJdtyDYPWeC2tMAd84sgvIxv3qhpvVt23yl6aUZiBathKT+ghia0toeSO0Fc
 FJMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=X2u1sa8cXw7f3fhCTsjaFodXR3TO0s3l+pgy2+3Z0AY=;
 fh=I3aSfq3V4vAd63k+SFr/AXw6D1xHdStNjyoZfQ9jAfI=;
 b=fXCtZzWfAzMkuPn60V4liKXCfN+XbJPqloZmnwDpQWPcNZ2mfUYcyEhGVWNVo/Z7HF
 dx1zveFcb3M7yIoQab0IbXi7tyEXCtf/nsc6by8e+b5mMtEetwpEYOlJR7Qarrzx1b8Y
 J2HZuQOL+rtohhpIr3gyr9j1vZ9ZRm2rEps5cUiFkUYMBLSAh0CI3ARFjMO6yhq6u8LF
 d7zAKXo4Ax0sStdjUwRwK57GoorRiwXNYGPbgWTt6G+ZjNl7tnnhpA4ewmGCNqRu1Io3
 B+PgTVJ7Jx21CHrybZzRSOJTWoZCplqeUeMbSxTNV0/5Frl8KH/eP+7ajFJFy6s0gbmh
 VJmw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771942443; x=1772547243; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X2u1sa8cXw7f3fhCTsjaFodXR3TO0s3l+pgy2+3Z0AY=;
 b=Wwz/ZXvznC6yuthDatthZsT6Bvecjbb46xhhHWbe4zwc9B61/FcbsYXrCDWEkxlea2
 V202ipBU+GJ8pADeAKR+tNPMsJ1t13OM+NCmhTU+opdkqSLNCUGmG4bEkJXvbF7AdYBV
 Jl+OiqOLNWtaCTJhc+pJgdV3O4nidanAhEjFl3nC58zoz4U3NioHq1W5GeodF+MQqMb0
 QimvfAEFwNGuddz+8JQZGHiXI3Bxx8rVOSdjK+eC+3ZLomSlFsyxvWNpB8U0/oIjFrIf
 uEPIpHZ2fgXavM10A2P+Y7mBLgldR3sRiKihk1iCWDdnMmeAZymT8NX9iJLXws8+3KVQ
 IvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771942443; x=1772547243;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X2u1sa8cXw7f3fhCTsjaFodXR3TO0s3l+pgy2+3Z0AY=;
 b=oejIlYK6TVvyS7IRwRgj1W1IhHPItAy5rDYvl6qHrIHuZ6kFNbEqCm1quNsRloY61o
 1aBgXDOy9ZY6TOYLo6lVkx9V4DvY0poTPzgrzW6Ue0HtlJi+YeA5P8KXZQ3QncnjQW9o
 fkLzOF1LghDIHELyE3inn9y2rNWvnTzb+Oeo9ibEAO00KjdxJzt4GSpaR3POc4+Xv+V4
 swEPgJsrG0SzaazhmMI4tYFihk03mbgvqwH5KMbYIzwQY0rWPxj9zbZ/I8h4snVcW6ci
 Pvtydz/P+B9iMnXXtFtSSDGQoSCzQTQrJeHHYtwZp9uwzLyfH66XmOaSLOxyN6rRh4CG
 KXjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxiC+jcjzZSibQTeAKnBF9NH1eDkkSdIGRtnwX4C135yTSJTupOosQ2VAZ7vRW0oLFA/ZGypbweXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztEc0OVrYZ0bqlx3w7Qts5daRi392JMvlGaDLm9k37SpSofIM9
 sKnae0eq3s2ybVVAklvexBhagdOrvUpDsVvWfZVN3gyZllMzuStdCAlCSpbWiHPUOObIw4QkFmp
 +8wNkx0UcCjq7fQRB1ZHEw+zUeC5QEHg=
X-Gm-Gg: AZuq6aL7navYSwCfhXOSD5Z6qxqpyBpW9dOr+yBSjPQVBc1FoMYrSe15hGgA5Uui+Yw
 OJB63cQUGajiFtRcI02xzg1RKkCDWsD7OAwBySsXMfxQuWauCfwnL0UAFR7LKNpLEAR7Hf1b3Dh
 oK/4e6fygizEJjk15Btbtr3taP2hcZ1dimTSqqj4WI9bc0dxktZ/EKjJMOpbddzFpRlirokUlD2
 pgBazMDXVHpnN6hd1xSgjkW4nrew9CFqebBLjF8CZTNwKjS7U7o0sblOwAZbpMGkMWgyNSqJ0XJ
 OerefMnriQM2Y38ECpNOaAhR1/Ac+JDyS/N3mQjudIIVu/waRE3m/7CbmfjUttXDToVpjZ/uS/3
 OFerd
X-Received: by 2002:a05:7022:6713:b0:124:af80:9d0c with SMTP id
 a92af1059eb24-1276ac5e868mr2364261c88.0.1771942442816; Tue, 24 Feb 2026
 06:14:02 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
 <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info>
 <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
 <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
In-Reply-To: <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 24 Feb 2026 09:13:51 -0500
X-Gm-Features: AaiRm51EbOro9HI59W14g0qXUGJ50oTIbGZguxl6JG5x_VcuGjQElINW7NxLpTc
Message-ID: <CADnq5_N_ktiuYTHskkpVkWD60t_YMUrXpQPhPE+Zo_wiJ5sAgg@mail.gmail.com>
Subject: Re: Time from regression report to a merge of a fix (was Re: [git
 pull] drm fixes for 7.0-rc1)
To: Dave Airlie <airlied@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
 Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>,
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:regressions@leemhuis.info,m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:alexander.deucher@amd.com,m:regressions@lists.linux.dev,m:rodrigo.vivi@intel.com,m:ville.syrjala@linux.intel.com,m:jani.nikula@linux.intel.com,m:imre.deak@intel.com,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 4880418838C
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 2:24=E2=80=AFAM Dave Airlie <airlied@gmail.com> wro=
te:
>
> On Tue, 24 Feb 2026 at 16:50, Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Mon, 23 Feb 2026 at 22:52, Thorsten Leemhuis
> > <regressions@leemhuis.info> wrote:
> > >
> > > Lo!
> > >
> > > On 2/20/26 21:53, Dave Airlie wrote:
> > > >
> > > > This is the fixes and cleanups for the end of the merge window, it'=
s
> > > > nearly all amdgpu, with some amdkfd, then a pagemap core fix, i915/=
xe
> > > > display fixes, and some xe driver fixes. Nothing seems out of the
> > > > ordinary, except amdgpu is a little more volume than usual.
> > > >
> > > > Let me know if there are any issues,
> > >
> > > Well, there were two fixes in here that made me wonder if our process=
es
> > > need some optimization to get regressions fixed at least somewhat as
> > > fast as Linus wants them to be fixed[1]:
> > >
> > > * One fix in here was for a amdgpu regression introduced in v6.19-rc6
> > > (and also affecting many stable series due to backports). The fix was
> > > ready within ~2 days and could even have made v6.19 -- but it only
> > > reached mainline through this PR on Friday. IOW: After two weeks. Whi=
ch
> > > got me wondering, "Should we do something to merge fixes like that
> > > faster"? And yes, it's the merge window =E2=80=93 but that's also whe=
n Arch
> > > Linux and openSUSE Tumbleweed usually jump to the latest mainline ser=
ies
> > > and thus expose regressions like this to many users, so I guess it wo=
uld
> > > be good to get them fixed at least as fast as outside of merge window=
s.
>
> I think due to the patch pipeline depth and volume that amdgpu and
> i915/xe are dealing with we may need to consider some better
> regression revert pipelines,
>
> The problem is most patches get fed into the start of their -next
> pipelines, where CI etc picks up on them, but there isn't enough
> urgency to create separate trees or pulls outside the regular fixes
> ones.
>
> The amdgpu one definitely should have been fixed in 6.19, Alex any
> idea how we can alleviate that sort of problem, esp if a bug has
> multiple regression reports.

I guess I should have done an additional -fixes PR that week.
Normally I would have been sure to include in the following weeks
-fixes PR, but this was the last one of the cycle.

Alex

>
> > >
> > > * One fix in here was for a i915/xe regression introduced in v6.18-rc=
1.
> > > Once reported, it took about six weeks to get fixed =E2=80=93 and the=
n nearly 10
> > > days for the fix to reach mainline. Looking at this, I once more
> > > wondered if this could have been merged faster. But even more I wonde=
red
> > > why the culprit wasn't reverted, as that's what Linus afaics wants wh=
en
> > > it takes this long.
>
> I think for the i915 one the problem patch should have been reverted
> asap, but I just don't think there was a responsible person to do it,
> maintainers need to be in the loop for these sort of problems, but if
> they aren't in the loop and the regression sits in the bug tracker
> without them being looped on it, we rely on the reporter or developer
> to find it and do the right thing. Esp when developers are head down
> on fixing it, but then it doesn't get flagged as urgent once it goes
> into the -next pipeline and so on. We don't usually break the weekly
> fixes cycles for drm, because CI backlogs and other things it just
> fits nicely, if we do have regressions like this it might be that we
> need to start having urgent PRs out of cycle, which I don't object to,
> it's just a matter of whether maintainers can have this sort of
> insight into patches in the pipeline when there is quite a long
> backlog.
>
> Thanks for the detailed analysis, I've cc'ed some more Intel people.
>
> Dave.
