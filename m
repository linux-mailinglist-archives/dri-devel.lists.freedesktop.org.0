Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB24B41AD1C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 12:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9046E105;
	Tue, 28 Sep 2021 10:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4100F6E104
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 10:36:15 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id E975D2B01640;
 Tue, 28 Sep 2021 06:36:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 28 Sep 2021 06:36:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 oWGyVHLDdLFF5riIKLBpEtDz7YA1ItB/e5YTpp16hnA=; b=UWO5BUmKLcY+3jjE
 vs4rj/f26wtU0U+0cy2j6tv6fYzAf7gkLWb8Y/Vm9hV0DSpiOS49OF3IVa5FlGW2
 nDRc5iYgCm8B1dop6bOzrzwlF6IRk/YKtNFyhE+ieRyg32m8JAzyEjoDoWg2JgOP
 3nhbb7X8/A5FdiDZL2Fvs1HnPAGorWwZzwnsEuINhH1ZJDMOxMAQ4Qqwo94Q338M
 w9wANNdW75AA+sWwhebmdNngAMMAi4iWL3FNq1Y7ZDEdu3/N4VjOtWdYmHAtMOVb
 /oUIqitsrUi2meSlEU0Kvsuva2jIEnjI6n/v5K8RsLylcPT2xqAwk6GTAXd5ma8E
 UGfQPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=oWGyVHLDdLFF5riIKLBpEtDz7YA1ItB/e5YTpp16h
 nA=; b=GvadQKjeaeexE8rDEZORz89VynRyr9QWdoAz1jxbnmvBOX1MK6hbx8IG/
 lWfrxA9LD8Xomso3o0mutyfWboB7OEh2GV1ueOc3G0WdNWFLRWWLM0K93R7X39t0
 SXQfWqeeEP2/lmViqSVYVuEz39GBzqDYvT/XCcGYMlN56W42U3kLT5BUQG0+/889
 LKjHkSw7A8Gtks5hHaO/+ckJE/0to/lsas7toxiM/8IZLAz3r/H1fsu9NsizILro
 qe03Ps4Owi7mBFuIqlquLgYxiPbrnj7R+aDki5Asj4j7TJcTK8zxfOBv+jL8zvwY
 M47yZzU+evGbLkuar27QgDZhHN6Rw==
X-ME-Sender: <xms:HfBSYZiLMYpMEU1D2ukLraxTF-bJo7tMm9iM6iK7U4LSS_Ji1HiOdw>
 <xme:HfBSYeAbmSK0C2lAlQmMT8_4-sBEqI65E-g9N5_Dq6Z-wf8ZRsS5U6dP6U48eQMps
 l5OXj4EahfY-aCNEm0>
X-ME-Received: <xmr:HfBSYZF2HDS5iaRsCuft6gLbmT4Sy8sZd5SfFzjR-kHwgsSTJcTMuhcRv_qsmTcFYozRMkQtf0Le_RN7QvXm0Bqm_c5KXSD2sRiZ1yhN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HfBSYeQtNBMhHV8HbFabd8ddlF3JyucLYXpCmA5XTGIBPmeME_hNPA>
 <xmx:HfBSYWwm5lCzDCXbnOg7Se_ValBW0it3pk3lHxJT9PbCjFC776rjQw>
 <xmx:HfBSYU4A-szO41GJ-5Q3gx_w6Pq46mmiPw9Zj8866129wBvLeyd6nA>
 <xmx:HfBSYbKQqsJHan-pVPUGOUaOFhx7NJvlOV-vOvHAC1m-52sP-d8cy-pqvPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 06:36:13 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>
Cc: Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, Dom Cobley <dom@raspberrypi.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-rpi-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 3/3] drm/vc4: hdmi: Actually check for the
 connector status in hotplug
Date: Tue, 28 Sep 2021 12:36:02 +0200
Message-Id: <163282429897.583318.5265128549780162156.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914101724.266570-3-maxime@cerno.tech>
References: <20210914101724.266570-1-maxime@cerno.tech>
 <20210914101724.266570-3-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Tue, 14 Sep 2021 12:17:24 +0200, Maxime Ripard wrote:
> The drm_helper_hpd_irq_event() documentation states that this function
> is "useful for drivers which can't or don't track hotplug interrupts for
> each connector." and that "Drivers which support hotplug interrupts for
> each connector individually and which have a more fine-grained detect
> logic should bypass this code and directly call
> drm_kms_helper_hotplug_event()". This is thus what we ended-up doing.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
