Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP9+KlXGl2lg8QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8112C1643E0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 03:26:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FE110E765;
	Fri, 20 Feb 2026 02:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pgTnpWrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C62F10E34C;
 Fri, 20 Feb 2026 02:26:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0713F43E6F;
 Fri, 20 Feb 2026 02:26:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855D4C4CEF7;
 Fri, 20 Feb 2026 02:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771554383;
 bh=DHcpy+3t3n0jZl79hCY90lUh34so7m5K6sHuh95C6ME=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pgTnpWrMHEyOP0K4FUeE+bfKRi9mMZyMT44jfyK8GIBj4oFHZy7Ys1D/ZlnYljqAf
 VfPJcNaduC1ScCPsoU0isRhjhITHsQj1U7ZqLtH6UoKTzq2QDHDxCbWUS0cdg+MTFQ
 pmrCwKNSA6zmwMsI0YfTwM9Uhz13dfO6RGMXvErGzpbv7Yq9d2jOgfcDVuwoJUDyhU
 pAO8HAjuIlZnVTB5hX8BiZDQ8jURsN9uQPVEkLkX66FRoH/6iin1rnuu5cojxWEYMR
 bTsPmF58/ZnWlr1zW5Jcg9MDbVbPBqY7Yo5rXZemk1jEBZb6VN9iu9ASz4h9h4RodU
 ul6jvXFEjAc+A==
Message-ID: <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org>
Date: Thu, 19 Feb 2026 20:26:21 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
To: John The Cooling Fan <ivan8215145640@gmail.com>,
 amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, regressions@lists.linux.dev,
 mwen@igalia.com, mario.limonciello@amd.com, alex.hung@amd.com,
 daniel.wheeler@amd.com, rodrigo.siqueira@amd.com, alexander.deucher@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 huangalex409@gmail.com
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com>
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
X-Rspamd-Queue-Id: 8112C1643E0
X-Rspamd-Action: no action



On 2/19/26 4:33 PM, John The Cooling Fan wrote:
> Noticed a regression with VRR after updating the kernel. My main
> monitor's VRR stopped being recognized, I was no longer able to enable
> it in my desktop environment settings and
> /sys/kernel/debug/dri/0/DP-1/vrr_range showed a range of 0 to 0. I did
> a bisect on the linux kernel git tree, and found that the commit
> introducing this issue is 0159f88a99c9f5722dbe52ac42faf3446f371dea.
> 
> The monitor is connected via DisplayPort, no converters as far as I
> know. The GPU in use is AMD Radeon RX 6700XT. There is another
> monitor, connected over HDMI and it has VRR working in all the
> versions I've tested. Attached the DisplayPort monitor's edid copied
> from sysfs.
> 
> #regzbot introduced: 0159f88a99c9f5722dbe52ac42faf3446f371dea

Can you please share your bisect log?  There was a regression from that 
commit but it was already fixed a long time back.

commit 7f2b5237e313 ("drm/amd/display: restore invalid MSA timing check 
for freesync")

