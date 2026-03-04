Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH1cMYy3qGm8wgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:51:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7B208C59
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D8210EAD8;
	Wed,  4 Mar 2026 22:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="V/ZPEn4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E323D10EAD6
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 22:51:50 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-64ca4dfdd88so7192964d50.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 14:51:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772664710; cv=none;
 d=google.com; s=arc-20240605;
 b=a2QfWyGFwrbGG634XN1QIxG1a5fSTjv4LQ8kl9Ic+V3DbzoR+wVhqmrH4GfdvjCMSp
 CDmTy6w5++8dIfDPogOUcGxDfA3OpgbhnYs4+iwbjKIlyABQPkSa1kEIqLgKC96PMpqY
 sz8sKQtsJrxGfD7VmzAhflBJQCtVEwQjaf2fAniqMOz5W+hr5cBcFzmSLOBLF+dmqBjW
 SQLdtaGKKyn6qKmNZ3MKuhZnFOmyBp+4qgWkrBINswC8WpQII8bF4mfiGSnmVC0MvPA0
 dru3IAJ6mXnQ0zdKpT+w0u2c6hAqYbHgGMK6sO2xE6wiwidOUV3NGYSu8zSLWffEBGVQ
 RfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=AZRBBVuMgMsyFlTtVgZJVCUIxol7v2VYFfBvQwr+WEs=;
 fh=t+N65GYPm7s1W8bzoSSBW/5U3FQ6Rd+t3ZgeAV0kNyE=;
 b=McYKW71ZTAFYdGX2BWTvbf1rRfQB2Uj7fErBg8hJihqlxvrM1GCYk64G+RQ4tgtE7B
 0lgmM6/eh4K+s2bBtZqiYKmneM5VkrwAjyr2H7zpUT8AVlpDuVsRiD+Nrf85/OVxXvgc
 0/FsWDPs+cYFTRRb+YvvW3387KlahXd3pDp6YMZ2IFZOykJ5XYxV3xetCTvbDrCS7DZq
 crSDAYXXJO2MrnnvAqNU4GvEm/x0604OPOYXr84oRr9VVv367q0L61wv8GkYlbIsyWOv
 /WR0NuXyUY5gWB65+wBNnLmtoquM/DSVdaK/vHJoqxu8rxXxgMzKXh5B1ij+XalUZfY5
 GfqA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772664710; x=1773269510; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AZRBBVuMgMsyFlTtVgZJVCUIxol7v2VYFfBvQwr+WEs=;
 b=V/ZPEn4nielQ5fZwpeJpJ+A65iqxlX99RomZV55EAczgWY4oD4jHWsMCE/H4jfPh+g
 /wGW32hRgq0ctoWBq99xyYZ/SFKHpbzF+6usqJHyOMjg/2K1VkNTFRusi74f/tth26ai
 fTsbUdESId88UZiqaWj7vVh4Yp2NewBEaFm9yAG53r7lJ+D+jVfCRS257l8WHuXheZ7u
 J1a2xCqwqbSSemx76v49WsETGVtEqejxUIZZHUFoQK5hHcrcKoHFXrJiCKhU012+qssg
 ERDX8pk/f8eKnmkGJV2VsqOIC8g22wAQhuV9aL0gouW9K6gZ7hdoRZYHNIuD203YzmjH
 HpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772664710; x=1773269510;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AZRBBVuMgMsyFlTtVgZJVCUIxol7v2VYFfBvQwr+WEs=;
 b=nFRHCR0MkQd8db78Fg9oFNrskuY8kcXZKOqO8Ok/Ch2IXeambTKSBVzLZVUbt9imCY
 9SRnHsy99q9+X7Yl3E0qzh065jjq0CUvYbFfDJIo7DcpYyGixGOeqx8tLUtpWbZ6NTlH
 m0Ft6qhnneOKqj9i2OIlR5IB8kaRhOl4C7NCMsC2JJAzSEx8KNEPgZyK/QbeTfRLO+Ep
 M2WdRmJGJyfdD98xtP3NodzoeRxZ2jwqzBs93MrSqO2wscmmXCF1pyVOcdIYeHRbFx0A
 8iyt0kPXrHyXY/ofp/egM7wOPuHv2ctuWpSpT2rBmLnzzaDxA1y5bT/GCRGQlauU5dM2
 Z0nQ==
X-Gm-Message-State: AOJu0YyBUgIDQlJsH3iLqu+wJkJ0TS+jYzFkj8z9b1dSA2stZgOCZxCy
 nHZWVaIdNs+DvM3EEp7jMu2DY2aoqHfeOlXvQLdORm5TGYW322pYcdhUp0Ep0sCWltK1D5It7cA
 W/cGgyPe0MEePO40ZVirJuAZ/s/7Q/NdunspVM2w=
X-Gm-Gg: ATEYQzylTqFlyZ1aNnNsJPJE6H5wWdtMtEZtCK1SWycqZodqja5/bKgJsp403xmSpgk
 bG6Lh7XAmApeXi88XwrEMbLu1Y2jVoCdXlXJHv3SG7+hfGKKzUUmYeKGr+nKqSvC6V6b0puS56/
 EGbcfLQWsymGujLsFlz9S+HIc7vD1W/If1Z5Uk3Lg9Z1ZIo1u6rtwP8kTC0FdLbwdTAoyn8Sg6Y
 hBj5md6uL13pOM4f6weCaFkUJ8F92Ji8pa5A2kS9CDaLoAEXyssgNwLoMclwHMWXgur6Q39lP60
 9xaG8pPkb3BcIeu7Vahq4i6tk0nwln2z+qW1W/nuD06khvpgWL+LvflZeTWZlHMDx8rw5yzhtg=
 =
X-Received: by 2002:a53:e194:0:b0:63f:b952:dfef with SMTP id
 956f58d0204a3-64cf9a744f4mr2369613d50.0.1772664709667; Wed, 04 Mar 2026
 14:51:49 -0800 (PST)
MIME-Version: 1.0
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 4 Mar 2026 14:51:39 -0800
X-Gm-Features: AaiRm50s-gj2fSMuGOm2TLbhSzJpwZLU-fGSVWEqiKUN9ws-Ey9SPJFltDHNheQ
Message-ID: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
Subject: drm_sched run_job and scheduling latency
To: ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-Rspamd-Queue-Id: 17C7B208C59
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi,

Our system compositor (surfaceflinger on android) submits gpu jobs
from a SCHED_FIFO thread to an RT gpu queue. However, because
workqueue threads are SCHED_NORMAL, the scheduling latency from submit
to run_job can sometimes cause frame misses. We are seeing this on
panthor and xe, but the issue should be common to all drm_sched users.

Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
meet future android requirements). It seems either workqueue needs to
gain RT support, or drm_sched needs to support kthread_worker.

I know drm_sched switched from kthread_worker to workqueue for better
scaling when xe was introduced. But if drm_sched can support either
workqueue or kthread_worker during drm_sched_init, drivers can
selectively use kthread_worker only for RT gpu queues. And because
drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
scaling issues.

Thoughts? Or perhaps this becomes less of an issue if all drm_sched
users have concrete plans for userspace submissions..
