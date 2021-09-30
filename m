Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BDA41DBE8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 16:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113A76EC03;
	Thu, 30 Sep 2021 14:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83366EBFD
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 14:05:14 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 313925C009E;
 Thu, 30 Sep 2021 10:05:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 30 Sep 2021 10:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 O0njLhd/0R2BntcIlLH/p4YJbTn7vhtKqMqYVhOjmw4=; b=Bb3FFzkPW+osrEt6
 ejrVbXcIQpkgRttOEFZStamDfjisapUGlBQIgkMnz5HCPV5Qw2YNnDAxDR7SBOae
 /ZC0H3j0nUXtKqLkRblSpPPlJEkT+FefmIbNBqpV1yR2hj1CRYHmdvODtRIkB+pd
 jLwBldtQzLg1WoWCR2/dxd/sOjdCyk+NxuEXn3ULNjhZOYjY+EkeO0c0PKUcvFRi
 Qm0Js75nEcXoymrA04abE5UBIgejsyRR+3Q8frwoucYP7aNgsDPPY8qOAO6W2eoT
 SZMzUSoZkmcrg564LkUET+y3C0ZDdgla8CzTSWupQzpJZ6lKJ7EvqjswM7eEmsKc
 Dn67Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=O0njLhd/0R2BntcIlLH/p4YJbTn7vhtKqMqYVhOjm
 w4=; b=SkU1WbOkcwm2LaEfoktDEsimWWwn5M4gTqQ85K1665Te98ZP8L7KwmWjl
 cJ1rabF2LujmOxNPOKrmrCmWyHJr1HUBHotYDEU3XCyBEjZ/JxjzX/q23BJ4gpeX
 zW2e+cm6pmypuKCisHE6oiblnEmpUpjkS7Bu03HAq587MEbgcDxnkIdlmKlgPnnA
 Z70/VKtPYyKP5iiWApfxFZ4jsVjS93BabzeZ8kKVyguU9XEXOvG1jJ8uRwPhfDBS
 fMku4vxqqnNt/IUAgEqNCAnSW+glVBG5PwvcIvlOgpMFC5GqDIkQtNKkUfY5hY+B
 ac15FqDNN9L2Hx+lrodMEYEGT8wKw==
X-ME-Sender: <xms:FsRVYazX1TtOTnPCMeF0-kDr2r0bfGyKtLAdlUOPABFeMn05i89OCw>
 <xme:FsRVYWR4V9yrRT_fPyYjZW9tREYl7AYCuKIgu9Af5I5DSRJlnvXyUstTSIqGfrJw9
 KSLNmTSCzs-86aJCAs>
X-ME-Received: <xmr:FsRVYcVy-BJUjk6xUwQshl4Vx-7Tguvs9rg-fM0iKJai59ot_E_qxVjvHINzDTV7oTLq2KJwlhXEbjMIhE2JVVuAeFYrNp-bhIm6_jYJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekgedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FsRVYQhIZTPb4mM2SRPmu0muhoNd1Ifpu0tMvdKD_o76GrwL4hVTFw>
 <xmx:FsRVYcCfenRHcxjPYoHTYKQKTPlI5Q2ei-uUttLOV5e8w4fyRS-LlA>
 <xmx:FsRVYRIhowm3vaHmV4G53zQvoFTx9iDGerH5RXQn0ltRWNUGpXuZKg>
 <xmx:GMRVYb66QJwPjNLVdn1wvR_qHM0NEpKs152YKu2KIXV3wONb1i3PUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Sep 2021 10:05:10 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH] drm/bridge: Add stubs for devm_drm_of_get_bridge
 when OF is disabled
Date: Thu, 30 Sep 2021 16:05:02 +0200
Message-Id: <163301060013.1505901.16940873865960676513.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928181333.1176840-1-maxime@cerno.tech>
References: <20210928181333.1176840-1-maxime@cerno.tech>
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

On Tue, 28 Sep 2021 20:13:33 +0200, Maxime Ripard wrote:
> If CONFIG_OF is disabled, devm_drm_of_get_bridge won't be compiled in
> and drivers using that function will fail to build.
> 
> Add an inline stub so that we can still build-test those cases.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
