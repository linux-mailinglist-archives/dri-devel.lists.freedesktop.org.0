Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A18209A84
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E02F6E4AA;
	Thu, 25 Jun 2020 07:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA07089F97;
 Wed, 24 Jun 2020 09:42:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0DFCC58011A;
 Wed, 24 Jun 2020 05:42:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 24 Jun 2020 05:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=a
 mJwSW8hZ/p5gW9pWhHia2npnDp0E1YNvRlmKyJTzpU=; b=OjdEHyGPok0GtFpVH
 TaXHefbzGqqm769WcR8yufTXGbUrVJpxmeHDFVH/z540Ug3LJYuUPGF2aomx1tYI
 aTZm/vPwS9vD712vuki25WCCa0PuHWz39FRnAxh1tXHZ0fi9LxE7h78Qxqr2aa+F
 OG1vog1Flu8iY3NEDs1CdkJSmDrrZj71rb60k1zNTSfVoK/EbvH9/6S9DtujH/d1
 5i1oiq0YwChvY2VuMdMut0KAt2nJ9G66VIYt+h3q5yZt/MA/bvhmbivQ7kk8rg5Y
 bXwsOU052QhpknROhZuusOY90X/Prd7bgIvAPT7RxTBUPlKCvG79Er6t1BeH2hQn
 m74Hw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=amJwSW8hZ/p5gW9pWhHia2npnDp0E1YNvRlmKyJTz
 pU=; b=E2zHziMMzyfPrx6/sMzTtz+syKX+3Jcqa/JJZpQnvq5Xirhw12P/pbMEH
 Gqj/NvgGpxegh5KpiBZ2kNONiW/znyxStPmW2qx9uWmVRZe27nYBTZl2Fe5QK4H/
 aLORCv5yiivOsxDphzYrtQduw6MkUvhpaPBBpc4p1R5QnQfii6PFUmTovXyotdJ6
 eeTCSvvJNNwwllnFstglr1ObD9w3cOcIvKPvdLoSrE2lx215dZuLMj1oWoIK1K4z
 QxD0NuyuXTvn7xZPCjUgLGeBkLyyZWGXcw2dXvrGAu9ayWpr3D0T/1HgA0IgqgDv
 nzke67GjrCS2ki3o72nVMJK0+WEfw==
X-ME-Sender: <xms:7R_zXpI039l9hkAGDVXwTHJd9okaQpJIdp9veCr1smA_vmvj8FSd7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudekjedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 goufhushhpvggtthffohhmrghinhculdegledmnecujfgurhepfffhvffukfhfgggtugfg
 jgesthhqredttddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigih
 hmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeegteevtdehtdduleff
 ffeuveffvdevveejueegueduffeiudekteffteefieeufeenucffohhmrghinheprghpph
 hsphhothdrtghomhenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrth
 gvtghh
X-ME-Proxy: <xmx:7R_zXlKq0qdMz9bXY92ogjyr8L7USIlitivS7OoeLHB9SFRoOB7brQ>
 <xmx:7R_zXhuJsNBv5cTTrByrAfW_r2kPSW15tB8NEbn4Nf2wiaP3WlM7Vw>
 <xmx:7R_zXqYOIIpdfFPJ8F38WUBCx7eFvGkcJ55zKWUzkJcjo3oFAVtfvw>
 <xmx:8R_zXlz8lSR9RSDlXK7eZtzRNs2DKlfmCU1OtM-UT7EXWAYAkESc7A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 15AD43280066;
 Wed, 24 Jun 2020 05:42:05 -0400 (EDT)
Date: Wed, 24 Jun 2020 11:42:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 1/8] drm/atomic-helper: reset vblank on crtc reset
Message-ID: <20200624094203.5dw267lb4c7ongvy@gilmour.lan>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>, linux-renesas-soc@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Thierry Reding <treding@nvidia.com>,
 syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jyri Sarha <jsarha@ti.com>, Sean Paul <seanpaul@chromium.org>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, zhengbin <zhengbin13@huawei.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 12, 2020 at 06:00:49PM +0200, Daniel Vetter wrote:
> Only when vblanks are supported ofc.
> 
> Some drivers do this already, but most unfortunately missed it. This
> opens up bugs after driver load, before the crtc is enabled for the
> first time. syzbot spotted this when loading vkms as a secondary
> output. Given how many drivers are buggy it's best to solve this once
> and for all in shared helper code.
> 
> Aside from moving the few existing calls to drm_crtc_vblank_reset into
> helpers (i915 doesn't use helpers, so keeps its own) I think the
> regression risk is minimal: atomic helpers already rely on drivers
> calling drm_crtc_vblank_on/off correctly in their hooks when they
> support vblanks. And driver that's failing to handle vblanks after
> this is missing those calls already, and vblanks could only work by
> accident when enabling a CRTC for the first time right after boot.
> 
> Big thanks to Tetsuo for helping track down what's going wrong here.
> 
> There's only a few drivers which already had the necessary call and
> needed some updating:
> - komeda, atmel and tidss also needed to be changed to call
>   __drm_atomic_helper_crtc_reset() intead of open coding it
> - tegra and msm even had it in the same place already, just code
>   motion, and malidp already uses __drm_atomic_helper_crtc_reset().
> 
> Only call left is in i915, which doesn't use drm_mode_config_reset,
> but has its own fastboot infrastructure. So that's the only case where
> we actually want this in the driver still.
> 
> I've also reviewed all other drivers which set up vblank support with
> drm_vblank_init. After the previous patch fixing mxsfb all atomic
> drivers do call drm_crtc_vblank_on/off as they should, the remaining
> drivers are either legacy kms or legacy dri1 drivers, so not affected
> by this change to atomic helpers.
> 
> v2: Use the drm_dev_has_vblank() helper.
> 
> v3: Laurent pointed out that omap and rcar-du used drm_crtc_vblank_off
> instead of drm_crtc_vblank_reset. Adjust them too.
> 
> v4: Laurent noticed that rcar-du and omap open-code their crtc reset
> and hence would actually be broken by this patch now. So fix them up
> by reusing the helpers, which brings the drm_crtc_vblank_reset() back.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Link: https://syzkaller.appspot.com/bug?id=0ba17d70d062b2595e1f061231474800f076c7cb
> Reported-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Reported-by: syzbot+0871b14ca2e2fb64f6e3@syzkaller.appspotmail.com
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Mihail Atanassov <mihail.atanassov@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Brian Masney <masneyb@onstation.org>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: zhengbin <zhengbin13@huawei.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: linux-tegra@vger.kernel.org
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
