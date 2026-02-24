Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMNhHE9KnWmhOQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:50:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D8A1828A0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 07:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C850610E4B6;
	Tue, 24 Feb 2026 06:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QzWpe2Ek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D7410E4B6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 06:50:50 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-896ff127650so88314496d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 22:50:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771915849; cv=none;
 d=google.com; s=arc-20240605;
 b=SkLA1t/q7F5ygqdAEtiDSeBb+JW6nPUx7caK5qH2T4Vs/QZtS6nKKbxVOlCTdVPGqi
 rYXe8t+82hTNX2NKmWEMguKvB7ZVz3LXCL249vKCEf/zFxkt0oAntvNvbovoONnf+Dpa
 0sFIrKDp53Etirw2U8O8HU+LK+EIv3uOxXAoSuIgfWjlzTnqtedsScA0ZDjBwBA4WYQz
 cY7kyliQmdw1XrmmDsLrGz6G0HcBu+Izh3UkVOqdE9DDyQYRrfClXJOeHqIBfFkAmC2A
 8zTaGsrfBqKIYnuFV7dv03ESZYTrHsy79CIcSEr/UH7jBSZfKWhnX4fvvlBhNz5Hnui4
 foAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=l48zkvQjzWejaQ5lJesqZp5/iKNkUkKZtjQkbUOoCVA=;
 fh=h02w4AAC6JO9X820pYmFZmbDgxt02cXJVokpoJUo7E8=;
 b=L5yrj5iz5EFi8RFp+evktB0PlM+yq0MQ1SCN4SDX6oLEvwO7Bc3uqgrQ4UjvQ7mNHg
 y1dUlrar39iLSZmt8IOFVGyfamWACnm9BuVbF3nR5w0217q8c7cSrOE6ApJjYamQ64Q9
 Kt9O1/I4RIluGpzJrh8+OyiACJjZmkOfxe/U51tikmA0y5B4x6l01K/t5SVTfb9FEtz8
 LSmxOgUpfZU0HWtBY/4Wy7Q6w/Jn2ueJCJ2h0cI/0PRw+56RIftm0axR3Mwoc0Vm1E0o
 NNROFdNdXZZySaEQk8jZH0+tXcC9SbA5fiKmCvusZMhP4o3cNPPnBPxIFYuMkr8f5VSN
 Kd2A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771915849; x=1772520649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l48zkvQjzWejaQ5lJesqZp5/iKNkUkKZtjQkbUOoCVA=;
 b=QzWpe2EkJRf/sV0NNAYGrvVlOLJhbnOK+8rAalgcuB1759wqc9uwuetan/tcA/w6iL
 rIQ45Wc+E/Jq2OkASU49bmWkERPLsctXzLY7yl85WSe98dCrzlRY5oqBSnSBcI+mFqBt
 QS+9+K/LxII87GBr0ugpmVOM9KEaSiPsswne4/M/ASLYs/8SgAuplNUGbt6ugFVmvoFX
 YI+kk2KQSM3c+nnt0bRix1jXMlk5oBBIcXJjR8e60pqbb+tTsZLfiQnV/qJBNxAD14YM
 047dhe+A7ZduBuIB1wM6+OorwldRMWE6IYE4TynIoYURoqFAhkW0uQIWFN+QjxPiwW4S
 2agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771915849; x=1772520649;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=l48zkvQjzWejaQ5lJesqZp5/iKNkUkKZtjQkbUOoCVA=;
 b=NiYapEUiM7domVhrhK8Z7SfJyIwxbymKTgDNN7aGQ+hdm5Bpj9SbXCMSdz9oo0WOzl
 y6YiSLA2SgOLsjvgVi2a3BYCb5dvtFgoVPgtOjPZNeiUsV1X8T7n5VtrcnGOYveASsuy
 SHaOTGl5P3+S9wCLDpdByUjOwqP75X5zjsT/4rgpDQaqMfBocwzupsPN8XcZicdjh6o5
 ToK8YSZ2Dp+Ear0E/A6jWKiwIkpDul7KuU7ULoSSiLQfY4wGivnSqWdBmct6tB09p7Kq
 Mf+jWll0lH5gbWa9jiyfxV7HZrDY7WhOqFTiKXZYm/IEYgVfKdXDPUpqzs8/gneUYrpr
 +Y/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWI9d87QgPGGQHDOZi3OdSoLVYrOMQkf1jSO2uvlrCuvFNczCfsEBxShEEU0BzdcCvheicXSzNzrsM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTa5d615pqT4O+nwQP3DCX5fAaQcXcTndojHqu3HOsaS6oxVXd
 R6jBnbObPlbVYKEiT3gcYZ4LvvCWtgB0tOhrBlSwHApmlnj9TqLRC2e31NY4+LuucCAemj+0sDj
 rsTjviXpmyyv5Q2QmuAjGbVcv4pxaCeQ=
X-Gm-Gg: ATEYQzwaxkHeVI1epgRSQ2yAVqfN9qOwXsn59m/JWAk/rmDH1RswXfz2AlJwcH2oXoh
 Tn+9sreMSQUBz4JWT35HHcwGQxa8ytVaxT6vInBoo/tDdycOlerC/UrTBZo7SWNdUwjdCB//VS7
 NepA+MzKKKCsNhkzEZiXtdUJqUIKrTCgI/268WkRTDoq2rYYdSEjs5htO61a6ig020wtbVlJ9/x
 rl2RLNjpsjoNbvI/0AdCl4VBYRUYKYJqmzjLiPxVcv8tZaj75PEz4VSH4ugMis2y6dqmKlPntyv
 au3CjCkRV28wWSWqFZVO0LA0gOAOZ8mM/3WBfZaHmUnL4Seg+pPT3oEThKDSZViLxCc=
X-Received: by 2002:a05:6214:c4b:b0:87f:fecf:17b2 with SMTP id
 6a1803df08f44-89979db90eamr167613206d6.64.1771915849329; Mon, 23 Feb 2026
 22:50:49 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
 <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info>
In-Reply-To: <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 24 Feb 2026 16:50:37 +1000
X-Gm-Features: AaiRm52NKlBolnZJjiM5rJmEDD4FT4DQhk6y6nizcSKcUGYofwPklsp4ZTnfwYE
Message-ID: <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:regressions@leemhuis.info,m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:alexander.deucher@amd.com,m:regressions@lists.linux.dev,m:rodrigo.vivi@intel.com,m:ville.syrjala@linux.intel.com,m:jani.nikula@linux.intel.com,m:imre.deak@intel.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[airlied@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: D0D8A1828A0
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 22:52, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Lo!
>
> On 2/20/26 21:53, Dave Airlie wrote:
> >
> > This is the fixes and cleanups for the end of the merge window, it's
> > nearly all amdgpu, with some amdkfd, then a pagemap core fix, i915/xe
> > display fixes, and some xe driver fixes. Nothing seems out of the
> > ordinary, except amdgpu is a little more volume than usual.
> >
> > Let me know if there are any issues,
>
> Well, there were two fixes in here that made me wonder if our processes
> need some optimization to get regressions fixed at least somewhat as
> fast as Linus wants them to be fixed[1]:
>
> * One fix in here was for a amdgpu regression introduced in v6.19-rc6
> (and also affecting many stable series due to backports). The fix was
> ready within ~2 days and could even have made v6.19 -- but it only
> reached mainline through this PR on Friday. IOW: After two weeks. Which
> got me wondering, "Should we do something to merge fixes like that
> faster"? And yes, it's the merge window =E2=80=93 but that's also when Ar=
ch
> Linux and openSUSE Tumbleweed usually jump to the latest mainline series
> and thus expose regressions like this to many users, so I guess it would
> be good to get them fixed at least as fast as outside of merge windows.
>
> * One fix in here was for a i915/xe regression introduced in v6.18-rc1.
> Once reported, it took about six weeks to get fixed =E2=80=93 and then ne=
arly 10
> days for the fix to reach mainline. Looking at this, I once more
> wondered if this could have been merged faster. But even more I wondered
> why the culprit wasn't reverted, as that's what Linus afaics wants when
> it takes this long.
>
> Note, these are examples of problems that happen in other subsystems as
> well; I chose to bring it up here just because they were good examples,
> as both regressions were also reported at least three times, so those
> are not really corner cases. See below for all the details.
>
> [1] "But if it's a regression with a known commit that caused it, I
> think the rule of thumb [to fix it] should generally be "within a week",
> preferably before the next rc."
> https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2=
BLsMyJmcuMSA@mail.gmail.com/
>
>
> > Mario Limonciello (2):
> >       [...]
> >       drm/amd: Fix hang on amdgpu unload by using pci_dev_is_disconnect=
ed()
>
> This is f7afda7fcd169a ("drm/amd: Fix hang on amdgpu unload by using
> pci_dev_is_disconnected()") [authored: 2026-02-05 17:42:54 GMT+1;
> committed: 2026-02-05 23:25:57 GMT+1 by Alex; next arrival:
> next-20260209; merged: 2026-02-21 00:36:38 GMT+1; v6.19-post].
>
> It fixes a regression that has been reported at least three times:
>
> * On Tue, 3 Feb 2026 17:27:00 -0500 (EST):
> https://lore.kernel.org/all/b0c22deb-c0fa-3343-33cf-fd9a77d7db99@absolute=
digital.net/
>
> * On February 5, 2026 at 1:30:12 PM GMT+1:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4944
>
> * February 18, 2026 at 9:30:39 PM GMT+1:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4984
>
> And likely a fourth time on February 7, 2026 at 7:25:40 PM GMT+1:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4953
>
> The culprit is 28695ca09d3264 ("drm/amd: Clean up kfd node on surprise
> disconnect") [also known as 6a23e7b4332c10; authored: 2026-01-07
> 22:37:28; committed: 2026-01-14 20:51:36; next arrival: next-20260119;
> merged: 2026-01-16 22:48:18; v6.19-rc6 (2026-01-19 00:42:45), v6.18.7
> (2026-01-23 11:21:37), v6.12.67 (2026-01-23 11:18:52), v6.6.122
> (2026-01-30 10:27:43)]
>
> Mario and Alex thus had a fix ready and committed within about two days
> after it was first reported. It thus is an "immediate fix" (yeah!), just
> how Linus wants it (see [1] above).
>
> But then it took two weeks to get it mainlined -- and will now take a
> few days more to reach all those stable trees where it is needed, too.
>
> Give the dates above it could have reached 6.19 (released 2026-02-08
> 22:03:27 GMT+1) if we really had wanted to.
>
> That fix could also have made the main drm PR this merge window (send
> Wed, 11 Feb 2026 17:26:03 +1000:), as Alex already asked for merging on
> Fri, 6 Feb 2026 14:27:06 -0500:
> https://lore.kernel.org/all/CAPM=3D9tzgmO1PWeuxjAxqOmS5PTsOe8jHP9Poy23q6t=
vY66B1KQ@mail.gmail.com/
> https://lore.kernel.org/all/20260206192706.59396-1-alexander.deucher@amd.=
com/
>
> If it made that pull, the fix could be in stable already by now. Maybe
> Alex PR just fell through the cracks. Happens, but overall this still
> made me wonder:
>
> (1) Should there maybe have been an additional PR this merge window to
> speed things up? Or some fast track for regressions?
>
> (2) Or should the fix (or a revert of the culprit) maybe even have been
> sent to Linus for 6.19? That would have saved at least one user from
> bisecting and reporting the regression (and likely a few others that
> never reported it).
>
> From Linus' mail I linked above, I'd assume he would have preferred the
> second option here, even if it would have been a last minute fix. If so:
> how could we make that happen more often in the future?
>
> Side note: yes, unbinding a module is likely something only a few users
> do -- but given those three or four reports, it seems it's not that
> unusual. And I don't care too much about this specific fix anyway, as
> it's just an example for the "time it takes fixes for recent regressions
> to reach mainline" aspect that I see all the time in many subsystems. To
> elaborate on that, let me give another example:
>
> > Imre Deak (2):
> >       drm/i915/dp: Fix pipe BPP clamping due to HDR
>
> This is now fe26ae6ac8b88f ("drm/i915/dp: Fix pipe BPP clamping due to
> HDR") [authored: 2026-02-09 14:38:16 GMT+1; committed: 2026-02-12
> 07:03:08 GMT+1; next arrival: next-20260212; merged: 2026-02-21 00:36:38
> GMT+1; v6.19-post].
>
> That commit fixes a regressions that has been reported at least three tim=
es:
>
> * On December 30, 2025 at 5:07:48 PM GMT+1
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15503
>
> * On January 13, 2026 at 11:51:11 PM GMT+1
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7052
>
> * On February 15, 2026 at 10:13:48 PM GMT+1
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7269
>
> That regression is caused by ba49a4643cf53c ("drm/i915/dp: Set min_bpp
> limit to 30 in HDR mode") [authored: 2025-07-30 07:55:23 GMT+;
> committed: 2025-08-19 08:32:40 GMT+; next arrival: next-20250820;
> merged: 2025-10-02 21:47:25 GMT+; v6.18-rc1 (2025-10-12 22:42:36 GMT+)].
>
> The regression took way longer to get resolved than the first example,
> which makes me wonder:
>
> (1) Should the culprit have been reverted weeks ago to get closer to the
> "immediate fix" target that Linus wants?
>
> (2) This fix also took nine days from being committed to reaching
> mainline. It came a bit too late for the first drm PR this cycle. So
> again: Would more frequent PRs help here? Or some fast-track path for
> regression fixes?
>
> Ciao, Thorsten
