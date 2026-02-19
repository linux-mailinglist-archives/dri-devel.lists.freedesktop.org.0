Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCiQJ4A1l2kCvwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179DE16083B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 17:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BACC10E708;
	Thu, 19 Feb 2026 16:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BDAyRH0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBE510E708
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 16:08:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so885160f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 08:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771517307; x=1772122107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fOYnxIyNPPSNbIMpYulGVtIoiRB9WNbtlfaoiBTGyz0=;
 b=BDAyRH0Oau9NYQCj0GuAPNJN4j1WndMZXreLtXZPI1mhE+bHSOf6avU76z4Fl6M/RI
 1DwDdJHr8xtCC279AyHoqqOv9n5Puc4R1gGriytBWyr41fHseV2pxKEWBLKLNBO+nMXJ
 PJNB1Ju2U74tesaJlzQ2km2Bgqkmlb+nWYRotWNGmBmzMyzUiAuci/CpZ4xbJfWpqnat
 7zs3Wdu2aRLpJw2etPKxUMhIfD87WAMyRCZc900FYzDWNJZ/yabDtOy/tQDrgvC/Ostn
 kKc28JSRMs9o2/FyX8Fz0rGCOB55E/x81lvNJLUqh2piEKpYejAX8dEFPzk8vHvDWbYW
 kLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771517307; x=1772122107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fOYnxIyNPPSNbIMpYulGVtIoiRB9WNbtlfaoiBTGyz0=;
 b=ipinpdX6K2GtbGDGLL05yjy40+V/Hw36ajiZjcg6WMfmCMHE3umSR6PFV7OkgU759P
 7Elweh9y5twRB6XEVCz4K05N5icaTE6ylSmTIjs0d3qR/SaG2Zht3lQksl6jmVuAViPC
 MLyWN0YfQwZc8hUc5UiGJ45qWcXUoH6PEwPXUuLS8ky4R8R/oITwmY5iIt6fVu5FtmE9
 kJ9psNgqM2N5J7sIY9u1Eu0i7e7GoKjP0609BeRNbr0NitTA7frp/HuFnAvPV0xe34nG
 cZsusT4/GRa4FCPsSqXUC9JB9BZPUCficzUeB95ISg7KBh4IxlEOvemQj8OnxX1FcJ8f
 ng8Q==
X-Gm-Message-State: AOJu0YxU6Ur8f3jnFaB2fEQLksvNfkAgU5AlsU84SJ2TXG0RVTykvoMA
 FQxg5Sr22p14gDHGOw8JkG3PVvaGa8OrleI7OBqJyZzwG8FVvhW/3nXe
X-Gm-Gg: AZuq6aKUgEgS6t4MKAVOG1baHMxmj9u3x1Qb2RStwbySG2Gk9HQ4dHGc1G13TmgJM5F
 Tq8r+xXEUWPiu2nC0iRQXN8iXRNGMc1tGEjqa18MLnUp7WZhdhP3cQt4SZ4EjH2h2sfpkVj2fiJ
 F7ugb9WbpzkGYCcK8rZrd4ZvWT+bTij7V/NE688eY4MRgbzUT9vyDGT++8xSkQ+RVy4IDAT8zdx
 9eLZBJD57P2ACHhcpRwsY7TielE6oYreXiF/yJE/2jsLXW9VcrQ5GZdqupeASs1vRIOqjs2TKuu
 tkOvSEi8xByqLAWhkUu05wjPg0VUHJ1IXhLNf3QwwnJ/9+lDUhOs166ZT2Pz0PXJnZEwAy3iWpG
 SefH9GxECE8FlzGwcfJhEUdpbFMJ3wIj8jG/Sk6KJPB4CtKoU71Vqd9ZPlpyvBmY1uunkJjli1a
 7RaISOORsz5yYObhVL8nV+CAzJrC4dwR4ZgZya
X-Received: by 2002:a05:600c:314c:b0:477:54f9:6ac2 with SMTP id
 5b1f17b1804b1-48379b318f6mr277051255e9.0.1771517306694; 
 Thu, 19 Feb 2026 08:08:26 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:1503:b900:9c42:5977:662a:d02d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac82f7sm54580031f8f.28.2026.02.19.08.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 08:08:26 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org,
	matthew.brost@intel.com,
	sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: 
Date: Thu, 19 Feb 2026 17:07:03 +0100
Message-ID: <20260219160822.1529-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	R_MIXED_CHARSET(1.25)[subject];
	EMPTY_SUBJECT(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@mailbox.org,m:matthew.brost@intel.com,m:sumit.semwal@linaro.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 179DE16083B
X-Rspamd-Action: no action

Hi everyone,

dma_fences have ever lived under the tyranny dictated by the module
lifetime of their issuer, leading to crashes should anybody still holding
a reference to a dma_fence when the module of the issuer was unloaded.

The basic problem is that when buffer are shared between drivers
dma_fence objects can leak into external drivers and stay there even
after they are signaled. The dma_resv object for example only lazy releases
dma_fences.

So what happens is that when the module who originally created the dma_fence
unloads the dma_fence_ops function table becomes unavailable as well and so
any attempt to release the fence crashes the system.

Previously various approaches have been discussed, including changing the
locking semantics of the dma_fence callbacks (by me) as well as using the
drm scheduler as intermediate layer (by Sima) to disconnect dma_fences
from their actual users, but none of them are actually solving all problems.

Tvrtko did some really nice prerequisite work by protecting the returned
strings of the dma_fence_ops by RCU. This way dma_fence creators where
able to just wait for an RCU grace period after fence signaling before
they could be save to free those data structures.

Now this patch set here goes a step further and protects the whole
dma_fence_ops structure by RCU, so that after the fence signals the
pointer to the dma_fence_ops is set to NULL when there is no wait nor
release callback given. All functionality which use the dma_fence_ops
reference are put inside an RCU critical section, except for the
deprecated issuer specific wait and of course the optional release
callback.

Additional to the RCU changes the lock protecting the dma_fence state
previously had to be allocated external. This set here now changes the
functionality to make that external lock optional and allows dma_fences
to use an inline lock and be self contained.

v4:

Rebases the whole set on upstream changes, especially the cleanup
from Philip in patch "drm/amdgpu: independence for the amdkfd_fence!".

Adding two patches which brings the DMA-fence self tests up to date.
The first selftest changes removes the mock_wait and so actually starts
testing the default behavior instead of some hacky implementation in the
test. This one got upstreamed independent of this set.
The second drops the mock_fence as well and tests the new RCU and inline
spinlock functionality.

v5:

Rebase on top of drm-misc-next instead of drm-tip, leave out all driver
changes for now since those should go through the driver specific paths
anyway.

Address a few more review comments, especially some rebase mess and
typos. And finally fix one more bug found by AMDs CI system.

v6:

Minor style changes, re-ordered patch #1, dropped the scheduler fence
change for now

v7:

The patch adding the dma_fence_was_initialized() function was pushed
upstream individually since that is really an independent cleanup.

Fixed some missing i915 bits in patch "dma-buf: abstract fence locking".

v8:

Cleaned up commit messages and code comments some more, added missing
rbs.

Last call to add an rb or comment before I'm going to push this to
drm-misc-next.

Please review and comment,
Christian.

