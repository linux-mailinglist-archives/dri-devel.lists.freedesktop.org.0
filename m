Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A9fAMLel2nW9gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 05:10:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1F4164804
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 05:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0614210E77C;
	Fri, 20 Feb 2026 04:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VlSJ+SBe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD0E10E77C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 04:10:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 562A86187D;
 Fri, 20 Feb 2026 04:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2047BC116D0;
 Fri, 20 Feb 2026 04:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771560638;
 bh=GmIn9ZeGRzlEikXjbn7PLITSKNkbNMHLY/Yf0fqF/IU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=VlSJ+SBeeAPfhnON1ZyXqzphBgx4V3bgTvauvu85YeiI5mlTREBkb61m+04o3wIWh
 6Pno9LXCnhI8nC/hRuhMd+fgshIq0F1mAH/DEcZO4aKOqExOeYtnuKxBzsIJIvpQze
 kdL6hhYvFuStENEHeFVIsSx0Au5ENsZWIX8atJWOiOnN2444grbOsGlgPysnVsmu9E
 V8116kPklhvS6giKFOfwBSN9DJyoDX0edjy80ThUYXR7VyxfB9IkYX0z/CHc2Wnpsg
 m5FnCTC63lZ+rp27A0NoXGnjEIsJQjZpptu6p3QNXtBcuAzBXZ7aD+CXrcMpktT189
 t7CzKaZ1g1AUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 B9FD93809A88; Fri, 20 Feb 2026 04:10:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/9] arch,sysfb,efi: Support EDID on non-x86 EFI systems
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156064628.189817.770597310770698604.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:46 +0000
References: <20251126160854.553077-1-tzimmermann@suse.de>
In-Reply-To: <20251126160854.553077-1-tzimmermann@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-riscv@lists.infradead.org, ardb@kernel.org, javierm@redhat.com,
 arnd@arndb.de, richard.lyu@suse.com, helgaas@kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[linux-riscv];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:linux-riscv@lists.infradead.org,m:ardb@kernel.org,m:javierm@redhat.com,m:arnd@arndb.de,m:richard.lyu@suse.com,m:helgaas@kernel.org,m:x86@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-efi@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AC1F4164804
X-Rspamd-Action: no action

Hello:

This series was applied to riscv/linux.git (fixes)
by Ard Biesheuvel <ardb@kernel.org>:

On Wed, 26 Nov 2025 17:03:17 +0100 you wrote:
> Replace screen_info and edid_info with sysfb_primary_device of type
> struct sysfb_display_info. Update all users. Then implement EDID support
> in the kernel EFI code.
> 
> Sysfb DRM drivers currently fetch the global edid_info directly, when
> they should get that information together with the screen_info from their
> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> passing this to drivers enables this.
> 
> [...]

Here is the summary with links:
  - [v3,1/9] efi: earlycon: Reduce number of references to global screen_info
    https://git.kernel.org/riscv/c/b868070fbc02
  - [v3,2/9] efi: sysfb_efi: Reduce number of references to global screen_info
    (no matching commit)
  - [v3,3/9] sysfb: Add struct sysfb_display_info
    https://git.kernel.org/riscv/c/b945922619b7
  - [v3,4/9] sysfb: Replace screen_info with sysfb_primary_display
    (no matching commit)
  - [v3,5/9] sysfb: Pass sysfb_primary_display to devices
    https://git.kernel.org/riscv/c/08e583ad6857
  - [v3,6/9] sysfb: Move edid_info into sysfb_primary_display
    https://git.kernel.org/riscv/c/4fcae6358871
  - [v3,7/9] efi: Refactor init_primary_display() helpers
    (no matching commit)
  - [v3,8/9] efi: Support EDID information
    (no matching commit)
  - [v3,9/9] efi: libstub: Simplify interfaces for primary_display
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


