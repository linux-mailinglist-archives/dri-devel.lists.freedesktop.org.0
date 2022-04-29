Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FEF514DE0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 16:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E452B10E1E5;
	Fri, 29 Apr 2022 14:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA84310E1E5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 14:45:30 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 659AA32009AB;
 Fri, 29 Apr 2022 10:45:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Apr 2022 10:45:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651243526; x=
 1651329926; bh=yEAzQ6Fdq8oAhr4/huHbbcTaVuHf0e4I24vYyJuhdC4=; b=r
 vSmMP3ncPP4LPqBNTFUzjcqK0r4/dI7bh1nwQnQH2b2AgZz1XvZw1DgwxbvheWlY
 X5w4vpBvN0KAD8y6EmmL2P6JjB6kg/oec6DSw9/jG8P7x5QcRO0kGlrhGzPC3W6G
 3MnPZ/X4hG06JvaiUERVE5AZeOyD00LFEe7f7KPeZ5pBGvZRfdipurlx+aJEh0Vt
 kkaNaPkerw9t18Qb+HZr1gVJ+pHO2BZL0r0ez3UcBibbFa2TMf7WHnMDBXgi6Nhv
 FBJuosCzFbKy2D/aE1EwLOAWZv/OxiNrR4wdeoEBRa9oShJJC0x2LCq+bjCsRoKz
 ow16qMOv+NEfdVxfKP8Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651243526; x=1651329926; bh=yEAzQ6Fdq8oAh
 r4/huHbbcTaVuHf0e4I24vYyJuhdC4=; b=XYYAnTQWTKv3z/s836VnUqz09gFCS
 N71qbyNcLBsoPqE3MPmyWsX4BZKQURERdKSo5Tlg4m2O2tqFHJGERpkYYlHJXtrG
 7wOT4bLfhQD6AI2HU7kgZA03dQaNQa7zi1TooFKFiWi8Kv4wVLIDA/EtzNG4fCJC
 X+aGhJVpSCyx4ZVySw2wIjhF1lASGONlhwjilgtt6vq5yIrfYcR36yISFOpyCkCQ
 RB2u3IOkHU766WBE/kyXW0HrlXWuPTCNwyrfBW/WeyLFAlGAGWDB6Pky4dCJojcv
 EyRD1xfScKiUiQfkmVjRqif1nKmudCZcQf6Th1UWmGTBqkn6ks95SEhYw==
X-ME-Sender: <xms:BfprYruiV7EW5oU8t2QxIO9Lcp1npkVTmSZmPkXlns4U_vJrnzMgFw>
 <xme:BfprYsdn3rQRM3JDX-QylaXu7kmjlb71h31mylFUdcoMn2BxIU4trEEVyud-SQfSW
 3Eae4CPwZVqRAzmkSc>
X-ME-Received: <xmr:BfprYuxRwwiF-CnGZRfZFlJlcBDsJXIBFksqztDYxvwrUaNZ6-yB4ohvPiqoOoBMVnssR_maJr7BQKWQ7PkYuy0zvKNtpiMMPTPqiTc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BfprYqNVN6mq4LdLEehTnRDUbPBBgb1RQaVITV2vVZphdCAABXJX6g>
 <xmx:BfprYr-sB0ykmLWvzD5ybm5oTDOELNGf-I6MNFZju0yU7N-5sZI0mQ>
 <xmx:BfprYqXDcqfXclPH2qIUWIavWw5l237u2pxijWJdzOBvoQTECq-BEA>
 <xmx:BvprYnSN2pZQ8MY6V_dE6qyPnS2uBY8j1uqoMXR45J6ZEvj1sXPPyg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 10:45:25 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: emma@anholt.net,
	cgel.zte@gmail.com
Subject: Re: (subset) [PATCH] drm/vc4: simplify the return expression of
 vc4_grab_bin_bo()
Date: Fri, 29 Apr 2022 16:45:19 +0200
Message-Id: <165124351807.924095.3207550688077043465.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429090208.3852879-1-chi.minghao@zte.com.cn>
References: <20220429090208.3852879-1-chi.minghao@zte.com.cn>
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
Cc: airlied@linux.ie, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 09:02:08 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Simplify the return expression.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
