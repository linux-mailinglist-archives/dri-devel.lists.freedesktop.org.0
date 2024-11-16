Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ECA9CFCD1
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 07:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F5410E08A;
	Sat, 16 Nov 2024 06:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="mL98MjzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr
 [80.12.242.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C5510E08A
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 06:06:04 +0000 (UTC)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id CBwItlkEVyQmhCBwItrt0n; Sat, 16 Nov 2024 07:06:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1731737162;
 bh=1GOO379j5kHelQgT13xeDCIW+pFPJCeiM7WSIuvag78=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=mL98MjzVZSShtzisX9zbjDjIb7KE72buAzIx9jorkgCEIlxacBGBiKDqnznYupede
 vEhaEvssP8Otw+abSwd4UipThVl5qw3v6w8RixuAXgrl/p9FBRiYmldRfZZljgK0OD
 FX0UB9px2S9OjhfpAHnQggpK1elWNH8UBNVIvO5x+AsAiYtyf4oGwInz8jFtqh7DDu
 OMNwG4GURPpChqfcVzLVhpacwz+NEqWf9xIvmwF/gxmCGy7nRrRkaf4TeGrlu6c0Ll
 o9NHONgP90fIf7c6ZsyFFLJ/v2i9NFywx5+jxHfxBiA3eBfpU5DKAu5obNXbrUQywu
 rI95zY+eQlUcg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Nov 2024 07:06:02 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: eahariha@linux.microsoft.com
Cc: James.Bottomley@HansenPartnership.com, Julia.Lawall@inria.fr,
 agordeev@linux.ibm.com, airlied@gmail.com, akpm@linux-foundation.org,
 andrew+netdev@lunn.ch, anna-maria@linutronix.de,
 ath11k@lists.infradead.org, axboe@kernel.dk,
 bcm-kernel-feedback-list@broadcom.com, borntraeger@linux.ibm.com,
 catalin.marinas@arm.com, ceph-devel@vger.kernel.org,
 christian.gmeiner@gmail.com, christophe.leroy@csgroup.eu, cocci@inria.fr,
 coreteam@netfilter.org, daniel@zonque.org, davem@davemloft.net,
 dick.kennedy@broadcom.com, dri-devel@lists.freedesktop.org,
 edumazet@google.com, etnaviv@lists.freedesktop.org,
 florian.fainelli@broadcom.com, gor@linux.ibm.com,
 gregkh@linuxfoundation.org, haojian.zhuang@gmail.com, hca@linux.ibm.com,
 horms@kernel.org, idryomov@gmail.com, intel-xe@lists.freedesktop.org,
 james.smart@broadcom.com, jeroendb@google.com, jikos@kernel.org,
 jinpu.wang@cloud.ionos.com, jjohnson@kernel.org, joe.lawrence@redhat.com,
 johan.hedberg@gmail.com, jpoimboe@kernel.org, kadlec@netfilter.org,
 kuba@kernel.org, kvalo@kernel.org, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
 linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-rpi-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org,
 linux@armlinux.org.uk, linuxppc-dev@lists.ozlabs.org,
 live-patching@vger.kernel.org, louis.peens@corigine.com,
 lucas.demarchi@intel.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, maddy@linux.ibm.com,
 marcel@holtmann.org, martin.petersen@oracle.com, mbenes@suse.cz,
 mpe@ellerman.id.au, mripard@kernel.org, naveen@kernel.org,
 netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
 nicolas.palix@imag.fr, npiggin@gmail.com, obitton@habana.ai,
 ogabbay@kernel.org, oss-drivers@corigine.com, pabeni@redhat.com,
 pablo@netfilter.org, perex@perex.cz, pkaligineedi@google.com,
 pmladek@suse.com, rjui@broadcom.com, robert.jarzmik@free.fr,
 rodrigo.vivi@intel.com, roger.pau@citrix.com, sbranden@broadcom.com,
 shailend@google.com, simona@ffwll.ch, svens@linux.ibm.com,
 thomas.hellstrom@linux.intel.com, tiwai@suse.com, tzimmermann@suse.de,
 xen-devel@lists.xenproject.org, xiubli@redhat.com
Subject: Re: [PATCH v2 02/21] coccinelle: misc: Add secs_to_jiffies script
Date: Sat, 16 Nov 2024 07:05:40 +0100
Message-ID: <20241116060541.5798-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> Suggested-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   scripts/coccinelle/misc/secs_to_jiffies.cocci | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> new file mode 100644
> index 0000000000000000000000000000000000000000..af762b1c0aac8f044f21150bfaafd9efc834ee87
> --- /dev/null
> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// Find usages of:
> +/// - msecs_to_jiffies(value*1000)
> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)
> +///
> +// Confidence: High
> +// Copyright: (C) 2024 Easwar Hariharan Microsoft
> +//
> +// Keywords: secs, seconds, jiffies
> +//
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * 1000)
> ++ secs_to_jiffies(C)
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * MSEC_PER_SEC)
> ++ secs_to_jiffies(C)
> 
Hi,

	@@ constant C =~ "000"; @@

	* msecs_to_jiffies(C)

also spots things like msecs_to_jiffies(1000)

I'm not sure that coccinelle is enable to capture part of the regex to automate the removal of the 000 when converting from ms to s.

Just my 2c,

CJ
