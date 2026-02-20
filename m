Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL8GDb/el2nW9gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 05:10:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088A01647EF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 05:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE1210E77B;
	Fri, 20 Feb 2026 04:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bAm4gV2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD7910E779;
 Fri, 20 Feb 2026 04:10:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D92A961856;
 Fri, 20 Feb 2026 04:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05E8C2BC9E;
 Fri, 20 Feb 2026 04:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771560632;
 bh=72mBwftCl+P66JkWk2D3tPM6F5W5fqiLlxhFDPCaeZk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=bAm4gV2cKvjN5GuYeDqOqnWaOQJnwWiubm5cPxzG0b1Sls51+3jb0M5jPJ1+SGZTp
 BNMGuKF+rHUZyZkSemcZ7VP/pg7JHj2ZcfuVFKpEER40qLLDnHc+EVOwAimnPx17DQ
 /jDJhzaTZP/JOxp36YKfDTewflsvr8lV3YbUHfUAOw4uyWsvqfoKgWsWEaQXJWPeS0
 7yQWORIx1F33RSW37fCo4RiS84fyL5mrOB1bDmofqalUb0Xx4bXIumnN+Z2lzvlWAZ
 8a+Io+IXkFA3DZOs/NEEJxN4KV44owP83FsMWAyt+2OmNLolEZfWlAR2gjA0OmJimN
 kkoQWYIwgr7TQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 3FD913809A88; Fri, 20 Feb 2026 04:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/4] PCI/MSI: Generalize no_64bit_msi into msi_addr_mask
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156064078.189817.10457864568127488431.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:40 +0000
References: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
In-Reply-To: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mpe@ellerman.id.au, 
 npiggin@gmail.com, chleroy@kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, bhelgaas@google.com, perex@perex.cz,
 tiwai@suse.com, brett.creeley@amd.com, gaohan@iscas.ac.cn, tglx@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, sophgo@lists.linux.dev, tiwai@suse.de
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[linux-riscv];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com,iscas.ac.cn,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 088A01647EF
X-Rspamd-Action: no action

Hello:

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@kernel.org>:

On Thu, 29 Jan 2026 09:56:05 +0800 you wrote:
> The Sophgo SG2042 is a cursed machine in more ways than one.
> 
> The one way relevant to this patch series is that its PCIe controller
> has neither INTx nor a low-address MSI doorbell wired up. Instead, the
> only usable MSI doorbell is a SoC one at 0x7030010300, which is above
> the 32-bit limit.
> 
> [...]

Here is the summary with links:
  - [v4,1/4] PCI/MSI: Conservatively generalize no_64bit_msi into msi_addr_mask
    https://git.kernel.org/riscv/c/386ced19e9a3
  - [v4,2/4] PCI/MSI: Check msi_addr_mask in msi_verify_entries()
    https://git.kernel.org/riscv/c/52f0d862f595
  - [v4,3/4] drm/radeon: Raise msi_addr_mask to dma_bits
    https://git.kernel.org/riscv/c/617562bbe12d
  - [v4,4/4] ALSA: hda/intel: Raise msi_addr_mask to dma_bits
    https://git.kernel.org/riscv/c/cb9b6f9d2be6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


