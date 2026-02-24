Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2L0jKMV/nWk/QQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:39:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36D61857DA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC9C10E26D;
	Tue, 24 Feb 2026 10:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="PIRF/U5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [46.38.247.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBDF10E26D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 10:38:54 +0000 (UTC)
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4fKvMv4n4gz84Ln;
 Tue, 24 Feb 2026 11:38:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1771929531;
 bh=LI1qhdSHC6P94gGeMsvMW9avooz+MTl1PYK6ymFbEh4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PIRF/U5OVmGGUEyLViesVk6tTqq1LBNvshBnzn82clNoJqXfrkPTz5mqkPSPlijz+
 EzkrRkJT9TEPsV3hkPH/LgHjJBQ5RxbFJ9M0d3Fy/LZFXVr+fHKGO6mvDktnMmuVtQ
 HISNvx1dmy8ZmP4rgXLdUsW3irOHM8wmm3V1sjkjoCAehuwh90WUkCsgG0TqEm7y/D
 tq2ThSXwwWdrkphCtr5zlUxvOTd6iuS2YClGVClxRnwV6VAjXWtHq20lMvCawTtloi
 jfQePZe9KQFaMmP9WOOMN1PdxI2M+m8NmVve+EZwLdXso/S0KUo+VoF6AtExnm8KKu
 uygTXvgPDpfeQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4fKvMv43wfz4xCl;
 Tue, 24 Feb 2026 11:38:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
X-Spam-Status: No, score=-2.898 required=6.31 tests=[ALL_TRUSTED=-1,
 BAYES_00=-1.9, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 URIBL_DBL_BLOCKED_OPENDNS=0.001, URIBL_ZEN_BLOCKED_OPENDNS=0.001]
 autolearn=ham autolearn_force=no
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fKvMr0yGPz8sf7;
 Tue, 24 Feb 2026 11:38:48 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id C17C6652C2;
 Tue, 24 Feb 2026 11:38:46 +0100 (CET)
Authentication-Results: mxe9fb;
 spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f)
 smtp.mailfrom=regressions@leemhuis.info
 smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9a8d24e9-94cf-481b-aa8e-f149fea47e9e@leemhuis.info>
Date: Tue, 24 Feb 2026 11:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Time from regression report to a merge of a fix (was Re: [git
 pull] drm fixes for 7.0-rc1)
To: Dave Airlie <airlied@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Simona Vetter <simona@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Imre Deak <imre.deak@intel.com>
References: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
 <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info>
 <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
 <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177192952721.2596460.14085883104283779396@mxe9fb.netcup.net>
X-NC-CID: EaVdUy8tk1T0DvQqeW/f2Fxuex19CPSGzsI/DUjDJn74XitvUYk=
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[leemhuis.info];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:alexander.deucher@amd.com,m:regressions@lists.linux.dev,m:rodrigo.vivi@intel.com,m:ville.syrjala@linux.intel.com,m:jani.nikula@linux.intel.com,m:imre.deak@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leemhuis.info:mid,leemhuis.info:dkim,leemhuis.info:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F36D61857DA
X-Rspamd-Action: no action

On 2/24/26 08:05, Dave Airlie wrote:
> On Tue, 24 Feb 2026 at 16:50, Dave Airlie <airlied@gmail.com> wrote:
>> On Mon, 23 Feb 2026 at 22:52, Thorsten Leemhuis
>> <regressions@leemhuis.info> wrote:
>>> On 2/20/26 21:53, Dave Airlie wrote:
>>>
>>> * One fix in here was for a amdgpu regression introduced in v6.19-rc6
>>> (and also affecting many stable series due to backports). The fix was
>>> ready within ~2 days and could even have made v6.19 -- but it only
>>> reached mainline through this PR on Friday. IOW: After two weeks. Which
>>> got me wondering, "Should we do something to merge fixes like that
>>> faster"? And yes, it's the merge window – but that's also when Arch
>>> Linux and openSUSE Tumbleweed usually jump to the latest mainline series
>>> and thus expose regressions like this to many users, so I guess it would
>>> be good to get them fixed at least as fast as outside of merge windows.
> 
> I think due to the patch pipeline depth and volume that amdgpu and
> i915/xe are dealing with we may need to consider some better
> regression revert pipelines,

Thx for your reply. And also for considering adjustments.

> The amdgpu one definitely should have been fixed in 6.19, Alex any
> idea how we can alleviate that sort of problem, 

FWIW, I see situations like these in various subsystems, and I think
there are two important factors at play here:

* The more important one: Some maintainers refrain from quickly picking
up and sending fixes upwards during merge windows, as they fear getting
yelled at by higher-level maintainers or Linus if those cause problems.

  And I can understand that, as Linus for good reasons has gotten quite
unhappy in the past when a big merge window PR contained late changes,
especially if those then caused things like build errors -- except when
the PR had stated explicitly that those were last-minute regression fixes.

  In fact, one lower-level maintainer in the arm64 dts space just told
me in private that this was one reason why he only picked up a revert
fixing a 6.18-rc1 regression yesterday after it sat on the list for
nearly two weeks.

* Some maintainers refrain from sending regression fixes upwards right
before a new mainline release, as they fear breaking something
important. Considering that outcome, of course, is something that must
be done, but it feels to me like many are a way more careful there then
Linus would like -- and forget that they could just send the last-minute
fixes to him to make him decide, as he is in the best position to do so,
as he when needed then could even delay the release.

Not sure how to improve all of this. Maybe some announcement from Linus
along the following lines would help:

"An open merge window should not delay picking up and upstreaming
regression fixes in any way; if needed, keep your fixes branch running
as before the release and send separate PRs for them. And as usual,
don't worry about conflicts unless they are complex. Ohh, and if you
have regression fixes where you are unsure if it is worth merging them
right before a new release, send them to me and let me decide".

Ciao, Thorsten
