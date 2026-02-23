Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKj/BnRPnGktDwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:00:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D34D176812
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 14:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1E110E2F3;
	Mon, 23 Feb 2026 13:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="I3bFgT2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 485 seconds by postgrey-1.36 at gabe;
 Mon, 23 Feb 2026 13:00:28 UTC
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [46.38.247.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34A010E2F3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 13:00:28 +0000 (UTC)
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4fKLNQ35qxz88w2;
 Mon, 23 Feb 2026 13:52:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1771851142;
 bh=mdtAPt1u+G474DblEe+23KFM0HhOnWGgYfp1KftsXRs=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=I3bFgT2y9LPnCCOPaotswFyOaXR9XbMFe/T568GuLEpAsa85n2yENXGCsA4bqq6E7
 mKB1bXCxBevo1dqc7809o0YnoYEhvpAZl2IUEfBgUzrzF5BV9Jd6imBXBjjQMp1xRl
 1kpR/fTMQrot4TsXhHh0Eo2gdXOw4vvpwbq8jJw3FtePM7ZDg0/Meh+mIxkPqBlIww
 bWdh2hCEpNrTF3ZqwcpoD6EKWjK2keUvFBpOFjS4w406mNTw12jCo1MhX9kYOyk1Rd
 RFU6imGALJo+qA4gOssUSMGt7GR3oA6bqYprnamtZlVUcIqj5bDXr7c3UrppF4LkUG
 Z7hsKRm2jKr+Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4fKLNQ2MJ1z4xMh;
 Mon, 23 Feb 2026 13:52:22 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fKLNP2j6Xz8sbC;
 Mon, 23 Feb 2026 13:52:21 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id 12D8F66F54;
 Mon, 23 Feb 2026 13:52:20 +0100 (CET)
Authentication-Results: mxe9fb;
 spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f)
 smtp.mailfrom=regressions@leemhuis.info
 smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info>
Date: Mon, 23 Feb 2026 13:52:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Time from regression report to a merge of a fix (was Re: [git pull]
 drm fixes for 7.0-rc1)
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Alex Deucher
 <alexander.deucher@amd.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
Content-Language: de-DE, en-US
In-Reply-To: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177185114042.2019614.14186409466347414161@mxe9fb.netcup.net>
X-NC-CID: x30qopvKun9vn/QR/x+byNHbWOc83WU2jyoWB7Te+eSVhp8cy2c=
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:alexander.deucher@amd.com,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	DMARC_NA(0.00)[leemhuis.info];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-foundation.org,ffwll.ch];
	FORGED_SENDER(0.00)[regressions@leemhuis.info,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0D34D176812
X-Rspamd-Action: no action

Lo!

On 2/20/26 21:53, Dave Airlie wrote:
>
> This is the fixes and cleanups for the end of the merge window, it's
> nearly all amdgpu, with some amdkfd, then a pagemap core fix, i915/xe
> display fixes, and some xe driver fixes. Nothing seems out of the
> ordinary, except amdgpu is a little more volume than usual.
> 
> Let me know if there are any issues,

Well, there were two fixes in here that made me wonder if our processes
need some optimization to get regressions fixed at least somewhat as
fast as Linus wants them to be fixed[1]:

* One fix in here was for a amdgpu regression introduced in v6.19-rc6
(and also affecting many stable series due to backports). The fix was
ready within ~2 days and could even have made v6.19 -- but it only
reached mainline through this PR on Friday. IOW: After two weeks. Which
got me wondering, "Should we do something to merge fixes like that
faster"? And yes, it's the merge window – but that's also when Arch
Linux and openSUSE Tumbleweed usually jump to the latest mainline series
and thus expose regressions like this to many users, so I guess it would
be good to get them fixed at least as fast as outside of merge windows.

* One fix in here was for a i915/xe regression introduced in v6.18-rc1.
Once reported, it took about six weeks to get fixed – and then nearly 10
days for the fix to reach mainline. Looking at this, I once more
wondered if this could have been merged faster. But even more I wondered
why the culprit wasn't reverted, as that's what Linus afaics wants when
it takes this long.

Note, these are examples of problems that happen in other subsystems as
well; I chose to bring it up here just because they were good examples,
as both regressions were also reported at least three times, so those
are not really corner cases. See below for all the details.

[1] "But if it's a regression with a known commit that caused it, I
think the rule of thumb [to fix it] should generally be "within a week",
preferably before the next rc."
https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.com/


> Mario Limonciello (2):
>       [...]
>       drm/amd: Fix hang on amdgpu unload by using pci_dev_is_disconnected()

This is f7afda7fcd169a ("drm/amd: Fix hang on amdgpu unload by using
pci_dev_is_disconnected()") [authored: 2026-02-05 17:42:54 GMT+1;
committed: 2026-02-05 23:25:57 GMT+1 by Alex; next arrival:
next-20260209; merged: 2026-02-21 00:36:38 GMT+1; v6.19-post].

It fixes a regression that has been reported at least three times:

* On Tue, 3 Feb 2026 17:27:00 -0500 (EST):
https://lore.kernel.org/all/b0c22deb-c0fa-3343-33cf-fd9a77d7db99@absolutedigital.net/

* On February 5, 2026 at 1:30:12 PM GMT+1:
https://gitlab.freedesktop.org/drm/amd/-/issues/4944

* February 18, 2026 at 9:30:39 PM GMT+1:
https://gitlab.freedesktop.org/drm/amd/-/issues/4984

And likely a fourth time on February 7, 2026 at 7:25:40 PM GMT+1:
https://gitlab.freedesktop.org/drm/amd/-/issues/4953

The culprit is 28695ca09d3264 ("drm/amd: Clean up kfd node on surprise
disconnect") [also known as 6a23e7b4332c10; authored: 2026-01-07
22:37:28; committed: 2026-01-14 20:51:36; next arrival: next-20260119;
merged: 2026-01-16 22:48:18; v6.19-rc6 (2026-01-19 00:42:45), v6.18.7
(2026-01-23 11:21:37), v6.12.67 (2026-01-23 11:18:52), v6.6.122
(2026-01-30 10:27:43)]

Mario and Alex thus had a fix ready and committed within about two days
after it was first reported. It thus is an "immediate fix" (yeah!), just
how Linus wants it (see [1] above).

But then it took two weeks to get it mainlined -- and will now take a
few days more to reach all those stable trees where it is needed, too.

Give the dates above it could have reached 6.19 (released 2026-02-08
22:03:27 GMT+1) if we really had wanted to.

That fix could also have made the main drm PR this merge window (send
Wed, 11 Feb 2026 17:26:03 +1000:), as Alex already asked for merging on
Fri, 6 Feb 2026 14:27:06 -0500:
https://lore.kernel.org/all/CAPM=9tzgmO1PWeuxjAxqOmS5PTsOe8jHP9Poy23q6tvY66B1KQ@mail.gmail.com/
https://lore.kernel.org/all/20260206192706.59396-1-alexander.deucher@amd.com/

If it made that pull, the fix could be in stable already by now. Maybe
Alex PR just fell through the cracks. Happens, but overall this still
made me wonder:

(1) Should there maybe have been an additional PR this merge window to
speed things up? Or some fast track for regressions?

(2) Or should the fix (or a revert of the culprit) maybe even have been
sent to Linus for 6.19? That would have saved at least one user from
bisecting and reporting the regression (and likely a few others that
never reported it).

From Linus' mail I linked above, I'd assume he would have preferred the
second option here, even if it would have been a last minute fix. If so:
how could we make that happen more often in the future?

Side note: yes, unbinding a module is likely something only a few users
do -- but given those three or four reports, it seems it's not that
unusual. And I don't care too much about this specific fix anyway, as
it's just an example for the "time it takes fixes for recent regressions
to reach mainline" aspect that I see all the time in many subsystems. To
elaborate on that, let me give another example:

> Imre Deak (2):
>       drm/i915/dp: Fix pipe BPP clamping due to HDR

This is now fe26ae6ac8b88f ("drm/i915/dp: Fix pipe BPP clamping due to
HDR") [authored: 2026-02-09 14:38:16 GMT+1; committed: 2026-02-12
07:03:08 GMT+1; next arrival: next-20260212; merged: 2026-02-21 00:36:38
GMT+1; v6.19-post].

That commit fixes a regressions that has been reported at least three times:

* On December 30, 2025 at 5:07:48 PM GMT+1
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15503

* On January 13, 2026 at 11:51:11 PM GMT+1
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7052

* On February 15, 2026 at 10:13:48 PM GMT+1
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7269

That regression is caused by ba49a4643cf53c ("drm/i915/dp: Set min_bpp
limit to 30 in HDR mode") [authored: 2025-07-30 07:55:23 GMT+;
committed: 2025-08-19 08:32:40 GMT+; next arrival: next-20250820;
merged: 2025-10-02 21:47:25 GMT+; v6.18-rc1 (2025-10-12 22:42:36 GMT+)].

The regression took way longer to get resolved than the first example,
which makes me wonder:

(1) Should the culprit have been reverted weeks ago to get closer to the
"immediate fix" target that Linus wants?

(2) This fix also took nine days from being committed to reaching
mainline. It came a bit too late for the first drm PR this cycle. So
again: Would more frequent PRs help here? Or some fast-track path for
regression fixes?

Ciao, Thorsten
