Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9409B5731C9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 11:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9481D98909;
	Wed, 13 Jul 2022 09:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80B898908
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 09:00:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A58673200A54;
 Wed, 13 Jul 2022 05:00:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 13 Jul 2022 05:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657702840; x=
 1657789240; bh=ePsGGI5q5znkZQFlw6ktdAmLSmBNQWvAChjTmheq/P8=; b=Z
 whg47eyo4UmdASBBb6xdGp2kiMCwZYtlHuL7niXi12IPs8Pru6Q4Cv0Dw8ff88z2
 beQ0UNCZnhCiWXTUJV65vgMbtR5nGA60mTUy6CM+t/IECI7xJ2vSE0M+F1E/7Kpe
 6d5bCZlbIxsVsMRpSLtGAc5fSXRcI3t6DMtMW1J+dp4ENogL3LN86sSh3Ku3jPWf
 Sqq1ZN5+z5J9Sc+FdxQNOBJ3MK7VYXA4v6jHnklnBVkFGWaqRLLFqvBekI2S9vTt
 AuaJOI28GXorxyExwhFXJaYcFjNLfLlro28TaaH4wHPoOjesl7T7jA/sIqTzW1IY
 F9eIqZixPvEo0AYNy3pOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657702840; x=
 1657789240; bh=ePsGGI5q5znkZQFlw6ktdAmLSmBNQWvAChjTmheq/P8=; b=D
 upsqh1w3ajPi85C2JwYqrsn7n32hTVywdWAMeeSsJaazI1REOcqF+rbtZe9KE4Ad
 byXPxoYUyu4vTOAy/Th3c0d4n7CSsWB+sooX1Go24MQ4r+iVvz86NQin6b+k4uAF
 pTDqyH5opZCKdB34FKYi9WmKZYZsjFedcyQpw6X0qcwNu/0yAd6sKws/H5/rqprT
 4PnHhMIMLRtDbomvnoyshCShFGsHGhjzcE4aGygLskVOBTUS7s2EFGmQOJm1/7EL
 zD+x/5fDBkHFb/hXqGvP3GBLrxyPYdUwF1J7pbyxJPEF/Oy9mKUGfXwe0LQpI8uF
 eWWYrqolPFwpPZuPi/pyw==
X-ME-Sender: <xms:t4nOYqa31CxqY994JNcx7ATGY3mBCbTjqBsicOOxps0wng0ZJzdt7w>
 <xme:t4nOYtZxj7wIfxv8riSNb226kBOCrkagV2tw7IlGA9mtGd6wZTzgePGWw8wv7C0LT
 RSHFkmUki6S6TGEcLU>
X-ME-Received: <xmr:t4nOYk8UAqacIzits6-ajRUgCLxUT-KiC5Me3_g4bPlOF5CAaP7sCvTdm37dTT_k3CV8x93UH9IYWhvqu5QNYb0LPaIJ7fNrB63J_bE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfgggtgfesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeuieeggffhffffieefheduie
 euvdetgeeufeffvefgtedvffehheekffevudefieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:t4nOYsoL2Qx46Zp505YMPhh0IZgUQUE6dV90dgz_ZPWu3NamjlbqbA>
 <xmx:t4nOYlpFfb98JdNRVf3an4FwnUhcRNC4IQnTS5uW3txn63wOaszezA>
 <xmx:t4nOYqT_g5A9ioBI1FAnV_gzwqTf8ViEjDLIzjSRpyLZ6MGiDr5aVA>
 <xmx:uInOYmmCMAjxgVmx4lQyZcVTQPy72ca_kzSWlhd8vbnL9zlKQWKjpA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 13 Jul 2022 05:00:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: maarten.lankhorst@linux.intel.com, airlied@linux.ie, maxime@cerno.tech,
 tzimmermann@suse.de, daniel.vetter@intel.com
Subject: Re: [PATCH v5 00/69] drm/vc4: Fix hotplug for vc4
Date: Wed, 13 Jul 2022 11:00:32 +0200
Message-Id: <165770281119.1534506.13490778735257602500.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Jul 2022 19:38:30 +0200, Maxime Ripard wrote:
> Here is a series that address multiple issues when trying to unbind/rebind
> vc4-related devices to their drivers.
> 
> Most of these issues involve either use-after-free, improper resource
> liberation or similar.
> 
> It has been tested on the Pi3 and Pi4, with X and glxgears running and KASAN
> enabled to properly validate our memory accesses.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
