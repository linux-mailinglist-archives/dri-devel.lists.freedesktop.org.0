Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A5410598
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 11:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348FE6E0B9;
	Sat, 18 Sep 2021 09:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B606E06B;
 Sat, 18 Sep 2021 09:42:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 3B3CE2B011CB;
 Sat, 18 Sep 2021 05:42:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 18 Sep 2021 05:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=iQMJviYlb4ZEn676riwj+ykMcaY
 gM3Bpxtt9O2JGErE=; b=WDwHHQXezEJe3XzQX3Em61caD1JOywMykQAjQo9+FvS
 BAUw0ysziTYQHd2JcCD0Bk8z0AXCgaxpNkpKZQLKoYJ1OqQBcoFQ33Qgu5/ta31z
 DyByahRv0mE53Ony+dsf9vdzav7TkXvnoNMK9J+5jBpTqlb9TTjAdddlmlrRrTqr
 Yf6gJ7BLyxE0uyTPoJtiPyFjieupdONy4OEcmHP6qj5k/GfsUOqHapmuJhhnj03u
 aNQMVgCiAY4CTWJmetOTs/5AqGukMpQkXerlp7nEGlI0rsksg0Xiyj8h6lzqpt5F
 kGOaxLJK9jw+z2uqeAdy7jRYyyLk3cfoC3lOSyJK4ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iQMJvi
 Ylb4ZEn676riwj+ykMcaYgM3Bpxtt9O2JGErE=; b=NQPv4xozCXDNOuWW95l8r0
 wqgyyHyXfB+TEZFR29p5hrSTv1MyvPh8hK33MLJE8IkeC7FBi0cuYZiJYqFoOouk
 N1SMt7gdmUOFX7+6dS0zB2EDvB6PtfJ+RXPRE6Xm8Yv6zbnwvVa6/DoxXhlvqsiV
 DiPPdP8iqD22W7bL33bjydi/YElws4Ckpr/ugaxvRzvclMAOlkEEUlIc955FTNr+
 MRHnTWDFICCu6KCQ4D+EyAmzhwMruzmoz98VLdiUyE9IpnmcGdvH0hhH/n8X3vhI
 fEDavwtqAGgk1//zVUmRJDSgl5exPhNz4+P4Pt8zN7dvnYLXClZYKlaWnCVGwsuA
 ==
X-ME-Sender: <xms:lrRFYfbjRE-L4f3Nfyw9rN67HO9pJVZbRLl_BAWGbVpLMk1TuqfX0g>
 <xme:lrRFYeYv4mcID7VMTZfIPCn8tDGxqPm2ySOv1G-A0NKEFUBuK3A-ve84o5-867vr0
 mX6PcSXDWBC1Grk_A>
X-ME-Received: <xmr:lrRFYR9hvwXVM79X0a8T4DolehjhDAUODuSF4_ucBL_MRX00TWXEJTRAqvy--tKCLhHOxX8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehkedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpefhvghrnhgr
 nhguohcutfgrmhhoshcuoehgrhgvvghnfhhoohesuhelvddrvghuqeenucggtffrrghtth
 gvrhhnpedvjeeifeelhfetiefhhfdthfefkefhhfeutdetvdfgvefgveefheffgfekjeef
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrh
 gvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:lrRFYVqgNRMK_pamLceVRt2VyFRqwtZ2Qcb5LGQOAC_FeeRGMnNf5g>
 <xmx:lrRFYarmIXc0_KRWqyzkrnne4mGC_Rk6K5ND2K3AeQUIKytJ04dpkA>
 <xmx:lrRFYbSOSsDAnV7UWjB8L5nXiW3YpBe6JQMbwEeiJuzXn7eXbd_4lg>
 <xmx:lrRFYZ2Lu9EzyIqd7DyRxbU3UzqW3Goj4jk6MyoI0oEwokzv5BiUmX82bJc>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Sep 2021 05:42:43 -0400 (EDT)
Date: Sat, 18 Sep 2021 11:42:40 +0200
From: Fernando Ramos <greenfoo@u92.eu>
To: Sean Paul <sean@poorly.run>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 14/15] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <YUW0kJr1XoqCENhl@zacax395.localdomain>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-15-greenfoo@u92.eu>
 <20210917155548.GO2515@art_vandelay>
 <YUUh7X+Ft7vKHlcT@zacax395.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YUUh7X+Ft7vKHlcT@zacax395.localdomain>
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

On 21/09/18 01:17AM, Fernando Ramos wrote:

> > > +#include <drm/drm_drv.h>
> > 
> > Top-level headers generally come above the driver headers. Also, now that I think
> > about this a bit more, all of the new includes in this set should probably be
> > for 'drm_modeset_lock.h' instead of 'drm_drv.h'.
> 
> Ok. Let me try that.

Turns out that the DRM_MODESET_LOCK_ALL_*() macros expansion includes a call
to drm_drv_uses_atomic_modeset() which is defined in "drm_drv.h".

Thus, #include'ing <drm/drm_drv.h> cannot be avoided.

This makes me wonder...

  1. "drm_drv.h" includes "drm_device.h", which includes "drm_mode_config.h",
     which includes "drm_modeset_lock.h"

  2. "drm_modeset_lock.h" defines DRM_MODESET_LOCK_ALL_*() which expands into
     drm_drv_uses_atomic_modeset()

  3. drm_drv_uses_atomic_modeset() is declared in "drm_drv.h"

There seems to be a circular dependency here.

We can try to fix this, but I suggest to do it in a different patch series.

