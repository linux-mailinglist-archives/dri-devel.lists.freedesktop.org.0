Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECe2Nc0Bk2lr0wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 12:38:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468521430EF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 12:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E15110E040;
	Mon, 16 Feb 2026 11:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="P/BmG+T/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E993210E040
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 11:38:47 +0000 (UTC)
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fF14k3FmRz68Nl;
 Mon, 16 Feb 2026 12:38:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
 s=key2; t=1771241926;
 bh=TWtVYJwbVjTlf+TJ5trO4TAgIlhhHEYzkkPBbvmXQnM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=P/BmG+T/GT4PLid6DhaeP+t5dLYoxvJ8Nwok5nM6FoTWBj9HI8RHg+fXUl0zp0klm
 gvw+9Ho2PW0AUsg7ptdU4UGW7KYEdSy0b6yW3GMwnlxXjBZLtu38q2T9VicnpPQA4f
 8MIz9NOTOB5ghRR0AL7ET3cQhJQqxFfQdwBBoCnnGQ1aYpMvLH6IP/4yRgO06zfBIK
 Bk0fuzPLOXnxxWKfyiQhU5theU1T6jfV7MR4gFK5cX4lljig3HtAI0O2Sl+MP/oHxT
 jXMSgrS1HfoxTOi4MzQ3xz7OVS1DT/69faFqvEMi7ERyLTh4wLu1erw4qAyHYzTYdX
 effr3R6kVpa3g==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
 by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fF14k2T59z4xbB;
 Mon, 16 Feb 2026 12:38:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
X-Spam-Status: No, score=-2.901 required=6.31 tests=[ALL_TRUSTED=-1,
 BAYES_00=-1.9, SPF_PASS=-0.001] autolearn=ham autolearn_force=no
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fF14g6LlQz8tXF;
 Mon, 16 Feb 2026 12:38:43 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
 by mxe9fb.netcup.net (Postfix) with ESMTPSA id 98E526735E;
 Mon, 16 Feb 2026 12:38:42 +0100 (CET)
Authentication-Results: mxe9fb;
 spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f)
 smtp.mailfrom=regressions@leemhuis.info
 smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9c1b2671-3374-4d84-ad14-07dd499bb934@leemhuis.info>
Date: Mon, 16 Feb 2026 12:38:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imagination: Convert to
 dev_pm_domain_{at,de}tach_list()
To: Matt Coster <Matt.Coster@imgtec.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
 <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
 <b3b4f10e-1222-44f7-b308-db7199c67147@mailbox.org>
 <3e0def93-2f6c-4bcf-8ee5-bf607f2ca382@imgtec.com>
 <f5d3dde6-edec-42f4-93cb-459c8677245a@mailbox.org>
 <f82b7734-6ddc-4029-b38d-147e9a1de021@leemhuis.info>
 <fcf5ab75-029e-469e-8b2a-51fa5c2a2374@mailbox.org>
 <95fd3f52-c3ed-40c5-920f-11e8767f701d@leemhuis.info>
 <CAMuHMdV-g+3kTaG6Ost4iHo1Tdi_H=qscLBkBRWuR+6DG5c=SA@mail.gmail.com>
 <1e8e416e-e474-4288-9686-1ba2b88e4946@leemhuis.info>
 <21b1fd77-252e-4fb3-aa65-1c26043c5412@imgtec.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <21b1fd77-252e-4fb3-aa65-1c26043c5412@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177124192325.2523793.2427380843780218947@mxe9fb.netcup.net>
X-NC-CID: uzHQ5WUvJ493AhCLZM0rmC2igXGsPIiYg8dFR6+uXex9L+LvRrc=
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[leemhuis.info:s=key2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:geert@linux-m68k.org,m:marek.vasut@mailbox.org,m:Frank.Binns@imgtec.com,m:Brajesh.Gupta@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,s:lists@lfdr.de];
	DMARC_NA(0.00)[leemhuis.info];
	FORGED_SENDER(0.00)[regressions@leemhuis.info,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,imgtec.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[regressions@leemhuis.info,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[leemhuis.info:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leemhuis.info:mid,leemhuis.info:dkim]
X-Rspamd-Queue-Id: 468521430EF
X-Rspamd-Action: no action

On 2/16/26 11:58, Matt Coster wrote:
> On 16/02/2026 10:11, Thorsten Leemhuis wrote:
> 
> We're currently trying to force this issue to reproduce on hardware we
> have on hand; we'd like to see it fixed properly as much as anyone.

Yeah, no worries, I never doubted that. But getting things properly fixed
can mean "revert, fix, reapply" when it comes to regressions in Linux --
which is something that should not be seen as something bad, as Linus said
himself (see below)!

> From our side at least, I don't believe this is a regression at all.
In the end what matters is: some change afaics caused systems to not work
anymore that used to be working -- that makes it a regression my the Linux
kernels standards. And those by the same standards must be fixed, ideally
quickly. Find a few quotes on that from Linus below that explains this
better. 

Ciao, Thorsten
---


On how quickly regressions should be fixed
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* From `2026-01-22 <https://lore.kernel.org/all/CAHk-=wheQNiW_WtHGO7bKkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/>`_::

    But a user complaining should basically result in an immediate fix -
    possibly a "revert and rethink".

  With a later clarification on `2026-01-28 <https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.com/>`_::

    It's also worth noting that "immediate" obviously doesn't mean "right
    this *second* when the problem has been reported".

    But if it's a regression with a known commit that caused it, I think
    the rule of thumb should generally be "within a week", preferably
    before the next rc.

* From `2023-04-21 <https://lore.kernel.org/all/CAHk-=wgD98pmSK3ZyHk_d9kZ2bhgN6DuNZMAJaV0WTtbkf=RDw@mail.gmail.com/>`_::

    Known-broken commits either
     (a) get a timely fix that doesn't have other questions
    or
     (b) get reverted

* From `2021-09-20(2) <https://lore.kernel.org/all/CAHk-=wgOvmtRw1TNbMC1rn5YqyTKyn0hz+sc4k0DGNn++u9aYw@mail.gmail.com/>`_::

    [...] review shouldn't hold up reported regressions of existing code. That's
    just basic _testing_ - either the fix should be applied, or - if the fix is
    too invasive or too ugly - the problematic source of the regression should
    be reverted.

    Review should be about new code, it shouldn't be holding up "there's a
    bug report, here's the obvious fix".

* From `2023-05-08 <https://lore.kernel.org/all/CAHk-=wgzU8_dGn0Yg+DyX7ammTkDUCyEJ4C=NvnHRhxKWC7Wpw@mail.gmail.com/>`_::

    If something doesn't even build, it should damn well be fixed ASAP.


On how fixing regressions with reverts can help prevent maintainer burnout
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* From `2026-01-28 <https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.com/>`_::

    > So how can I/we make "immediate fixes" happen more often without
    > contributing to maintainer burnout?

    [...] the "revert and rethink" model [...] often a good idea in general
    unless there's just an obvious fix for an obvious bug [...]

    Exactly so that maintainers don't get stressed out over having a pending
    problem report that people keep pestering them about.

    I think people are sometimes a bit too bought into whatever changes
    they made, and reverting is seen as "too drastic", but I think it's
    often the quick and easy solution for when there isn't some obvious
    response to a regression report.


On why the "no regressions" rule exists
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* From `2026-01-22 <https://lore.kernel.org/all/CAHk-=wheQNiW_WtHGO7bKkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/>`_::

    But the basic rule is: be so good about backwards compatibility that
    users never have to worry about upgrading. They should absolutely feel
    confident that any kernel-reported problem will either be solved, or
    have an easy solution that is appropriate for *them* (ie a
    non-technical user shouldn't be expected to be able to do a lot).

    Because the last thing we want is people holding back from trying new
    kernels.

* From `2024-05-28 <https://lore.kernel.org/all/CAHk-=wgtb7y-bEh7tPDvDWru7ZKQ8-KMjZ53Tsk37zsPPdwXbA@mail.gmail.com/>`_::

    I introduced that "no regressions" rule something like two decades
    ago, because people need to be able to update their kernel without
    fear of something they relied on suddenly stopping to work.

* From `2018-08-03 <https://lore.kernel.org/all/CA+55aFwWZX=CXmWDTkDGb36kf12XmTehmQjbiMPCqCRG2hi9kw@mail.gmail.com/>`_::

    The whole point of "we do not regress" is so that people can upgrade
    the kernel and never have to worry about it.

    [...]

    Because the only thing that matters IS THE USER.

* From `2017-10-26(1) <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/>`_::

    If the kernel used to work for you, the rule is that it continues to work
    for you.

    [...]

    People should basically always feel like they can update their kernel
    and simply not have to worry about it.

    I refuse to introduce "you can only update the kernel if you also
    update that other program" kind of limitations. If the kernel used to
    work for you, the rule is that it continues to work for you.


On exceptions to the "no regressions" rule
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* From `2026-01-22 <https://lore.kernel.org/all/CAHk-=wheQNiW_WtHGO7bKkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/>`_::

    There are _very_ few exceptions to that rule, the main one being "the
    problem was a fundamental huge and gaping security issue and we *had* to
    make that change, and we couldn't even make your limited use-case just
    continue to work".

    The other exception is "the problem was reported years after it was
    introduced, and now most people rely on the new behavior".

    [...]

    Now, if it's one or two users and you can just get them to recompile,
    that's one thing. Niche hardware and odd use-cases can sometimes be
    solved that way, and regressions can sometimes be fixed by handholding
    every single reporter if the reporter is willing and able to change
    his or her workflow.

* From `2023-04-20 <https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/>`_::

    And yes, I do consider "regression in an earlier release" to be a
    regression that needs fixing.

    There's obviously a time limit: if that "regression in an earlier
    release" was a year or more ago, and just took forever for people to
    notice, and it had semantic changes that now mean that fixing the
    regression could cause a _new_ regression, then that can cause me to
    go "Oh, now the new semantics are what we have to live with".

* From `2021-09-20(3) <https://lore.kernel.org/all/CAHk-=wi7DB2SJ-wngVvsJ7Ak2cM556Q8437sOXo4EJt2BWPdEg@mail.gmail.com/>`_::

    Yes, we have situations where even regressions don't matter - like
    major security issues that simply cannot be fixed other ways, because
    the regression _was_ the security hole.

* From `2017-10-26(2) <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/>`_::

    There have been exceptions, but they are few and far between, and they
    generally have some major and fundamental reasons for having happened,
    that were basically entirely unavoidable, and people _tried_hard_ to
    avoid them. Maybe we can't practically support the hardware any more
    after it is decades old and nobody uses it with modern kernels any
    more. Maybe there's a serious security issue with how we did things,
    and people actually depended on that fundamentally broken model. Maybe
    there was some fundamental other breakage that just _had_ to have a
    flag day for very core and fundamental reasons.


On accepting when a regression occurred
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* From `2026-01-22 <https://lore.kernel.org/all/CAHk-=wheQNiW_WtHGO7bKkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/>`_::

    But starting to argue about users reporting breaking changes is
    basically the final line for me. I have a couple of people that I have
    in my spam block-list and refuse to have anything to do with, and they
    have generally been about exactly that.

    Note how it's not about making mistakes and _causing_ the regression.
    That's normal. That's development. But then arguing about it is a
    no-no.

* From `2024-06-23 <https://lore.kernel.org/all/CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com/>`_::

    We don't introduce regressions and then blame others.

    There's a very clear rule in kernel development: things that break
    other things ARE NOT FIXES.

    EVER.

    They get reverted, or the thing they broke gets fixed.

* From `2021-06-05 <https://lore.kernel.org/all/CAHk-=wiUVqHN76YUwhkjZzwTdjMMJf_zN4+u7vEJjmEGh3recw@mail.gmail.com/>`_::

    THERE ARE NO VALID ARGUMENTS FOR REGRESSIONS.

    Honestly, security people need to understand that "not working" is not
    a success case of security. It's a failure case.

    Yes, "not working" may be secure. But security in that case is *pointless*.

* From `2017-10-26(5) <https://lore.kernel.org/lkml/CA+55aFwiiQYJ+YoLKCXjN_beDVfu38mg=Ggg5LFOcqHE8Qi7Zw@mail.gmail.com/>`_::

    [...] when regressions *do* occur, we admit to them and fix them, instead of
    blaming user space.

    The fact that you have apparently been denying the regression now for
    three weeks means that I will revert, and I will stop pulling apparmor
    requests until the people involved understand how kernel development
    is done.


On back-and-forth
~~~~~~~~~~~~~~~~~

* From `2024-05-28 <https://lore.kernel.org/all/CAHk-=wgtb7y-bEh7tPDvDWru7ZKQ8-KMjZ53Tsk37zsPPdwXbA@mail.gmail.com/>`_::

    The "no regressions" rule is that we do not introduce NEW bugs.

    It *literally* came about because we had an endless dance of "fix two
    bugs, introduce one new one", and that then resulted in a system that
    you cannot TRUST.

* From `2021-09-20(1) <https://lore.kernel.org/all/CAHk-=wi7DB2SJ-wngVvsJ7Ak2cM556Q8437sOXo4EJt2BWPdEg@mail.gmail.com/>`_::


    And the thing that makes regressions special is that back when I
    wasn't so strict about these things, we'd end up in endless "seesaw
    situations" where somebody would fix something, it would break
    something else, then that something else would break, and it would
    never actually converge on anything reliable at all.

* From `2015-08-13 <https://lore.kernel.org/all/CA+55aFxk8-BsiKwr_S-c+4G6wihKPQVMLE34H9wOZpeua6W9+Q@mail.gmail.com/>`_::

    The strict policy of no regressions actually originally started mainly wrt
    suspend/resume issues, where the "fix one machine, break another" kind of
    back-and-forth caused endless problems, and meant that we didn't actually
    necessarily make any forward progress, just moving a problem around.


On regressions caused by bugfixes
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* From `2018-08-03 <https://lore.kernel.org/all/CA+55aFwWZX=CXmWDTkDGb36kf12XmTehmQjbiMPCqCRG2hi9kw@mail.gmail.com/>`_::

    > Kernel had a bug which has been fixed

    That is *ENTIRELY* immaterial.

    Guys, whether something was buggy or not DOES NOT MATTER.

    [...]

    It's basically saying "I took something that worked, and I broke it,
    but now it's better". Do you not see how f*cking insane that statement
    is?
