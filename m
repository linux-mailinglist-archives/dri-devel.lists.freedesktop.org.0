Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMkJA8p9nWk/QQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:30:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927C1855D3
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 11:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B57210E25B;
	Tue, 24 Feb 2026 10:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NzU5WxnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1739A10E25B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771929028; x=1803465028;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xoDr2sS+MJN+W5vs8Eg6wabvaXJrloYoEgoow58tp6s=;
 b=NzU5WxnP7mBTN3aUMpFM/nPZ7xCqm6xqpc5Ft+MTBbMxT202XPJ14pB6
 6qodcbzFjEBGMAm5tRM3AVlsKPBSEEMI4nVumdoGa5yutQjHPa2tS6EBN
 l6TMsi1xGM0Qde/ld3MbRL8NBuhzS7UJ2my3EbqWBcOBF5wOzULUtSpPf
 Blsnevv/soe/+dVrReHBUy/k1K1Zc9F0UvdUWWPYF8SnYzPOAzidDhNX1
 ZpBXLEKIrpOgFWPOO3Nm72SbSEUD7syQS0av+bOpqa20PU0WzVdGTi6hR
 Jf51TFmlCvW3qvMB0HklUckKmKyp/k1NpjEPQQfR9j7iEOT8Ic/pUTG58 g==;
X-CSE-ConnectionGUID: Ywhlng6GS5+gAoIoF1FVVg==
X-CSE-MsgGUID: luRtxPTQRtaKQMCzdvgYDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73046391"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="73046391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:28 -0800
X-CSE-ConnectionGUID: HTnFtGc3RneTp9qgHVpCww==
X-CSE-MsgGUID: vDLA6ETHSIez4LJheKaDUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="220437948"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 02:30:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter
 <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Imre Deak <imre.deak@intel.com>
Subject: Re: Time from regression report to a merge of a fix (was Re: [git
 pull] drm fixes for 7.0-rc1)
In-Reply-To: <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
 <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info>
 <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
 <CAPM=9ty9T5uC6YiU73G3Y7cEeTpxh4TafmJB=QB+fvcgTvK2BA@mail.gmail.com>
Date: Tue, 24 Feb 2026 12:30:20 +0200
Message-ID: <f2fa0822c735456facd43013a7205f9187caf738@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:regressions@leemhuis.info,m:torvalds@linux-foundation.org,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:alexander.deucher@amd.com,m:regressions@lists.linux.dev,m:rodrigo.vivi@intel.com,m:ville.syrjala@linux.intel.com,m:imre.deak@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_ALL(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,leemhuis.info];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,leemhuis.info:email]
X-Rspamd-Queue-Id: 4927C1855D3
X-Rspamd-Action: no action

On Tue, 24 Feb 2026, Dave Airlie <airlied@gmail.com> wrote:
> On Tue, 24 Feb 2026 at 16:50, Dave Airlie <airlied@gmail.com> wrote:
>>
>> On Mon, 23 Feb 2026 at 22:52, Thorsten Leemhuis
>> <regressions@leemhuis.info> wrote:
>> > * One fix in here was for a i915/xe regression introduced in v6.18-rc1.
>> > Once reported, it took about six weeks to get fixed =E2=80=93 and then=
 nearly 10
>> > days for the fix to reach mainline. Looking at this, I once more
>> > wondered if this could have been merged faster. But even more I wonder=
ed
>> > why the culprit wasn't reverted, as that's what Linus afaics wants when
>> > it takes this long.
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

I think it's pretty natural for developers to err on the side of trying
to fix things instead of reverting, and the responsibility to make the
call to revert usually lands on maintainers.

I'll remind people about considering reverts earlier if the fix isn't
obvious, and looping in maintainers when in doubt.

As to the 10 days from fix to mainline, it's down to unfortunate
timing. The fix landed right after the v6.19 release during the merge
window. It was part of the drm pull request for v7.0-rc1. There's no
faster path at that time.

BR,
Jani.

--=20
Jani Nikula, Intel
