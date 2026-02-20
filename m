Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gD4AAIfRl2nk8wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:14:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C66461645A3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE168876A;
	Fri, 20 Feb 2026 03:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VpBNfBQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC45910E771;
 Fri, 20 Feb 2026 03:14:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E11DC60054;
 Fri, 20 Feb 2026 03:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25C18C4CEF7;
 Fri, 20 Feb 2026 03:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771557248;
 bh=IVN7r0xifPkdyJXi/FO57cCcO7FR6lu7aoviGEL/TIU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VpBNfBQKAQHyHko8NqxvqnEC46v6jYRrZ/qHUzqjgYvFiANO7oipkHFjHYM/o5SOS
 6FLKeUTEGUZLJqlwnoNer2FNAYZ9CSBi6HfBp6LPhYkABJALwFVy+BHCJdqFhHt3yX
 whh9PdXTTsUQhHBnDZpKHyfEi1A8tOHFX7AGuw/Wk8kc2cOCSB/FjhDKaysfYE2Vmt
 UmtL6X6y/s13xee7y19AC1aNFxQLblg/ttFBli9JtpmMPBLzgfaB3Oiju+TUSdX+S9
 Yz72ypRl+GS1QdUChjrsq5czaSNEAuXlEm10W37iTHjj/zl9hYJK77+jOkV9iA7/Er
 2qlgOnYFO6WyA==
Message-ID: <c70fe261-7fb0-4af5-b755-f02b193c8c5f@kernel.org>
Date: Thu, 19 Feb 2026 21:14:05 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
To: Ivan Sergeev <ivan8215145640@gmail.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, regressions@lists.linux.dev,
 mwen@igalia.com, mario.limonciello@amd.com, alex.hung@amd.com,
 daniel.wheeler@amd.com, rodrigo.siqueira@amd.com, alexander.deucher@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 huangalex409@gmail.com
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
 <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
 <DGJFVPAQJA15.378GMU7XZXLU@gmail.com> <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <DGJGDIRQWDG7.XHHKF6UQP0HG@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,igalia.com,amd.com,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[superm1@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C66461645A3
X-Rspamd-Action: no action



On 2/19/26 9:02 PM, Ivan Sergeev wrote:
> On Fri Feb 20, 2026 at 5:38 AM MSK, Ivan Sergeev wrote:
>>
>> I've done the bisect using the v6.12.68 tag as good and v6.18.8 tag as bad
> 
> Sorry, those are not the tags I've used for the bisect. Before doing a
> bisect in git I first checked versions from 6.18 to 6.13, and could
> reproduce the issue in all of them, so after that I went for the git
> bisect between 6.12.68 and 6.13.6.

I'm wondering if you actually have a second regression manifesting 
similarly.

Can you check out at your bad commit and apply just 7f2b5237e313 at the 
bad commit?  Confirm that fixes it.

If it does, then redo your bisect applying 7f2b5237e313 where applicable.
