Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E94D1596
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 12:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EF910E06F;
	Tue,  8 Mar 2022 11:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C224810E06F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 11:04:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 436073200D60;
 Tue,  8 Mar 2022 06:04:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 08 Mar 2022 06:04:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=fpsi7Lk835XPpK
 31v0iifOTDB+8I9LcrDFM2jAces8o=; b=guVScMCtldxRsMppOEQHZN+hVJKIof
 DnqtuDXEFxrQ3BnfXq6MvCbnSSMDgMg907HCRQo4BoD2qsx0mQC3ZHOKpXVyCi0S
 5apEVQ5mH4XkNR0nRhhoEVmVK+Q6V2XVAlCil+YFR31JMBRJHQybhEt0j42+p8DH
 FIScdAZC/V+kMm4lQQt9ks8TEySOShbQYNPUT5mFXoM3dAQnWoYtrov3xyXe9nBM
 MenIoT9DuC2GxqfupU5aNHjdv3Gdfmkb5aykYoTDvVVJCJyHsvTRUsGCMJq7o1Rj
 1ZneyCQu7f9jtS4oP5Aei+6up2gbeZ/mIHbsHJ1A+cx7X3pKiGouA9Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=fpsi7Lk835XPpK31v0iifOTDB+8I9LcrDFM2jAces
 8o=; b=E8qfkMGeesd5okEUbd7ccZXsXV4pSCHM0Fc0sNkLh7Uvkm/HjXbHj30sW
 hCOCeViiWSF/LoYyAMGArgrIcvTiOfODMlaLSGk3rx5ShnMAEK+hjO8kpRUxIrL/
 bWQF/eEL9Kcp/r5vHPCke+2vVIOtlO0/NicZdSllOKK2UkuM3NSm1pMi65Gr07GB
 1G54793PCyp2W5RY0NHnXaxKIrsNLdgRNnzUG2nWuHSIaBcvU/lseMPBnzxwCjXX
 2loYGkOB1SW5jrnCgEWirithXSNdm47jOdABhW3j3R9ndHzrdzxPuyttpbC9QPCt
 I+ERUgZWu5xQesCiIc9pm7US9Yjkw==
X-ME-Sender: <xms:VzgnYlILOL_c7w7ac7JW4JHGJENld5UXFdduoj_Ky4_p3CdiGuy6EA>
 <xme:VzgnYhKalpj5MK7OcKGEvb1DCVVc6ktqUQDiTWe0qmLlsS__Qgrt25BHl-W3He-Wg
 cstI3SQOCQoAwTetQI>
X-ME-Received: <xmr:VzgnYtsdhOLmLRGcpgaxTYtBVAPG5HGD98h0R8WAfrP-O0q00qO-yZ3ILfsG66vkU5LSoI2N1thOIh36Sytz1BNbqvoAjZlvu0hpEiI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:VzgnYmbk2tlyQV7FjFkvBBBAP--Huo-GHJIktKZJpntz9_96QQ2MWQ>
 <xmx:VzgnYsansqnnf5Bxnb73T1C38-e_KVV5Rbxj_sWYhwYCCGKLPSQl5A>
 <xmx:VzgnYqDvO6OXqluztH_L-XlcKD1yKGVEC5-cJmTLK3S0lQp0F1WrXg>
 <xmx:VzgnYpS3ylFePRzkkA4vwM6zgQEniAkceUTWst7JLao5nj8i5rCiuQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 06:04:55 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: (subset) [PATCH v2 01/22] drm/komeda: plane: switch to plane
 reset helper
Date: Tue,  8 Mar 2022 12:04:50 +0100
Message-Id: <164673748849.2320194.7330701107878363151.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-2-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-2-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:58:57 +0100, Maxime Ripard wrote:
> komeda_plane_reset() does the state initialisation by copying a lot of
> the code found in the __drm_atomic_helper_plane_reset(). Let's switch to
> that helper and reduce the boilerplate.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
