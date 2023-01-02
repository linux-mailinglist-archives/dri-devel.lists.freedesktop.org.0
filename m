Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA52865AFB3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEA710E2FB;
	Mon,  2 Jan 2023 10:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8537110E2FB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:40:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 80D0F32008FC;
 Mon,  2 Jan 2023 05:40:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 02 Jan 2023 05:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672656022; x=
 1672742422; bh=oQNmiZs+lxOjtmSo7HfzHjO8S8CzxpfTKAw+Zpl1GqE=; b=B
 NjYe1ug0jfoGXUABDrMQWtPDKWNrhu461bBF6/1M+ox/ZIgSn2mSjdYAltl+AzHt
 80zsY1ksG5nWtnM3jqoTqe15T1qeHi6iH2I3pSWaB7ixvL/4DFnLzJqb4BWFp7tB
 dbyVjUgx5bRomIGZJo2RPOoLQb0WaGrxejbisWBzym5396yo94JKkd8At2PPtvJl
 qR1vJich/laNubOx3SuY6Ia/v3DtGojs4IEdI0UA/NVMTD5nSbqs6Rdp0XX9NYhM
 gYFiDWxY4+gzQCZPnQDKxoQ0GdNDaeATi0Tw8mA8qukjrFuwlj2igcodZ5TbTEml
 z2/01lvZWKuGXJm0CzcBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672656022; x=
 1672742422; bh=oQNmiZs+lxOjtmSo7HfzHjO8S8CzxpfTKAw+Zpl1GqE=; b=n
 kMO9p7P24DTryC2nWgiFjszCh8jItvEDsmKuIWrKjMJJyWqNbh55cGS0p/Hi1zJg
 FmQW/g6hPuZJgVVxgRc8yS7hc3ox/cd3yBN/DIntjlECAffy/JUXmK91aK9UOUcY
 RZy60QFPjFnTcGb0COVbtOWu6HoKFNUkXLfRZNloJmW/d+5eZ3g1hVJIw7kWGiYF
 jiHx9+6mD4Lr3dIS4eUaCqznvPQOyqJiUUWH6uIOmr0gxnjnEmzyYSxG2kXXCG58
 bKoSXFF6BPVJS2722T68vCvra75xz1Wm8q7yXB5CrwHWP03D0gGiAkFr4+497HtO
 Hi5WzXBbBApyme/RDMu5g==
X-ME-Sender: <xms:lbSyY23RAAxRb0BrZUo2eNsz_k_7bjwY5D8cgBKEvIV9QrOCk8N8_w>
 <xme:lbSyY5E187YqN51VVhEB4FJQY1XeqqDlgPBnwkiRoZhFhPPrjTQ3AXJr8FC6KLOrk
 iD4-4cQTB6Ei3e-SJk>
X-ME-Received: <xmr:lbSyY-5sun5Ak0LJAgmPm0UltMqWp_NUJW5SF_1vZbElFuTpgEHjv-cipHnTk0kCVQ68drsPsvzLq_21zuZI9H82ItdC0vKrQDUkUrnc712CUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:lbSyY32hiYda6lv6Dgg1_PMUl52y60ApS8N5DX2tCTLg24vXNRjvJA>
 <xmx:lbSyY5HUL94Q93UbXn5rbjeQFPY9ZmMCLfehT_0rw8CIKD7_u-TmLQ>
 <xmx:lbSyYw9k6scHFPt3874B1GQwF_OcnGeB2yIhjKcXH7K-6IltCdB89w>
 <xmx:lrSyY_U_ZWVRgtKhzHKsFrAqRVkkiEre-Tsj-_tE4R8_5OWfpr-ASg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jan 2023 05:40:21 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Maíra Canal <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>
In-Reply-To: <20221229194638.178712-1-mcanal@igalia.com>
References: <20221229194638.178712-1-mcanal@igalia.com>
Subject: Re: (subset) [PATCH] drm/vc4: drop all currently held locks if
 deadlock happens
Message-Id: <167265599737.7906.15803690746659540288.b4-ty@cerno.tech>
Date: Mon, 02 Jan 2023 11:39:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Melissa Wen <mwen@igalia.com>, Stefan Wahren <stefan.wahren@i2se.com>, André Almeida <andrealmeid@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Dec 2022 16:46:38 -0300, Maíra Canal wrote:
> If vc4_hdmi_reset_link() returns -EDEADLK, it means that a deadlock
> happened in the locking context. This situation should be addressed by
> dropping all currently held locks and block until the contended lock
> becomes available. Currently, vc4 is not dealing with the deadlock
> properly, producing the following output when PROVE_LOCKING is enabled:
> 
> [  825.612809] ------------[ cut here ]------------
> [  825.612852] WARNING: CPU: 1 PID: 116 at drivers/gpu/drm/drm_modeset_lock.c:276 drm_modeset_drop_locks+0x60/0x68 [drm]
> [  825.613458] Modules linked in: 8021q mrp garp stp llc
> raspberrypi_cpufreq brcmfmac brcmutil crct10dif_ce hci_uart cfg80211
> btqca btbcm bluetooth vc4 raspberrypi_hwmon snd_soc_hdmi_codec cec
> clk_raspberrypi ecdh_generic drm_display_helper ecc rfkill
> drm_dma_helper drm_kms_helper pwm_bcm2835 bcm2835_thermal bcm2835_rng
> rng_core i2c_bcm2835 drm fuse ip_tables x_tables ipv6
> [  825.613735] CPU: 1 PID: 116 Comm: kworker/1:2 Tainted: G        W 6.1.0-rc6-01399-g941aae326315 #3
> [  825.613759] Hardware name: Raspberry Pi 3 Model B Rev 1.2 (DT)
> [  825.613777] Workqueue: events output_poll_execute [drm_kms_helper]
> [  825.614038] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  825.614063] pc : drm_modeset_drop_locks+0x60/0x68 [drm]
> [  825.614603] lr : drm_helper_probe_detect+0x120/0x1b4 [drm_kms_helper]
> [  825.614829] sp : ffff800008313bf0
> [  825.614844] x29: ffff800008313bf0 x28: ffffcd7778b8b000 x27: 0000000000000000
> [  825.614883] x26: 0000000000000001 x25: 0000000000000001 x24: ffff677cc35c2758
> [  825.614920] x23: ffffcd7707d01430 x22: ffffcd7707c3edc7 x21: 0000000000000001
> [  825.614958] x20: 0000000000000000 x19: ffff800008313c10 x18: 000000000000b6d3
> [  825.614995] x17: ffffcd777835e214 x16: ffffcd7777cef870 x15: fffff81000000000
> [  825.615033] x14: 0000000000000000 x13: 0000000000000099 x12: 0000000000000002
> [  825.615070] x11: 72917988020af800 x10: 72917988020af800 x9 : 72917988020af800
> [  825.615108] x8 : ffff677cc665e0a8 x7 : d00a8c180000110c x6 : ffffcd77774c0054
> [  825.615145] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
> [  825.615181] x2 : ffff677cc55e1880 x1 : ffffcd7777cef8ec x0 : ffff800008313c10
> [  825.615219] Call trace:
> [  825.615232]  drm_modeset_drop_locks+0x60/0x68 [drm]
> [  825.615773]  drm_helper_probe_detect+0x120/0x1b4 [drm_kms_helper]
> [  825.616003]  output_poll_execute+0xe4/0x224 [drm_kms_helper]
> [  825.616233]  process_one_work+0x2b4/0x618
> [  825.616264]  worker_thread+0x24c/0x464
> [  825.616288]  kthread+0xec/0x110
> [  825.616310]  ret_from_fork+0x10/0x20
> [  825.616335] irq event stamp: 7634
> [  825.616349] hardirqs last  enabled at (7633): [<ffffcd777831ee90>] _raw_spin_unlock_irq+0x3c/0x78
> [  825.616384] hardirqs last disabled at (7634): [<ffffcd7778315a78>] __schedule+0x134/0x9f0
> [  825.616411] softirqs last  enabled at (7630): [<ffffcd7707aacea0>] local_bh_enable+0x4/0x30 [ipv6]
> [  825.617019] softirqs last disabled at (7618): [<ffffcd7707aace70>] local_bh_disable+0x4/0x30 [ipv6]
> [  825.617586] ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
