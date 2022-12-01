Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A7A63ED75
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 11:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B916D10E065;
	Thu,  1 Dec 2022 10:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 633C110E065
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 10:18:19 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C1BE55C0156;
 Thu,  1 Dec 2022 05:18:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 05:18:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669889896; x=
 1669976296; bh=fiXCymFhNjzmrkdIhYcZhW03quMWub5ZpHzLVxZFxYY=; b=K
 exarGnu5QqoTOaLdxwvHQ79o6nYGog9YYhqhWkGJW9keCXjKAgUqlwzdvxPEPP9d
 7fJ5SWsdkga96bNLvpZgj8yJ2iqOULngB689iXEc1YuuxbY0Xhm8YHYGWFYOLgFx
 lPEip7sjh1gG4RL+PfcAg2HPx4UV7I0tNKQXZTifEwidMLBD4o1ezeYKrz6Pvzbn
 uHdggpwjo2NZ/9bKv5a3/BLkwFJYgNYJ72sIl9N0OMGksLlNge5MC3lBEHjTVQi6
 0GcX4e1x16rZ3b+OuagjIuMzWhhEPHJOXcX9/d1X1Efciukl98GWwQMB/+EGdgUi
 qReXGOOP72gob7x041+kQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669889896; x=
 1669976296; bh=fiXCymFhNjzmrkdIhYcZhW03quMWub5ZpHzLVxZFxYY=; b=A
 ze6UxQ0azf4DmbrjoGmkWi+xtkmx5YRKK2FyVq50rnA7W6vS2NWw6jR+gsZy/aNn
 AiYE1Itzo5xW5UGrE5rVCrqiJnS2uwlzCJZtbC7D/4L1xUizfC5wGqq6buH9HZIf
 8/c9hFnwkJeGA1CewjioZMHEN8GzH9InBGs84ONDmgRY7RHaxP2G3qg1J3VH36hg
 zOWfIo+B2dBuebaGav4YpPQF5d837TlG7zeLfClZgOG0/bD/4QfAbAbczSlOJxlN
 XqegOVRM9SgmgFVeTHfLnBo+nEEOm2BUfN7eRenoVwZFydaVp7wiWQ+IabeGypCi
 xCypuVkpv0z30uYx6xKpQ==
X-ME-Sender: <xms:aH-IYxH_pM0LhwQkU-PC4s9OlU2Dw_8t-N69QMxSiOWmjWc2AdZjRQ>
 <xme:aH-IY2X8C_Y3lCh5lzmTvNTkHhEYPCFegTyQVQkSrmD2O8cyPwqxc3dVutEwuAbZt
 0658I_axzqBEr01s74>
X-ME-Received: <xmr:aH-IYzKNWcLhN7hl5muBrLytDIW3VwB7BX3IL_JYbpeeB4fwnHIt_NbQR_QLkVMprGLiYH2BGGu-XWXXhHKTYSlH7wAzGhUgCiEDBOZLVOrkuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdehgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:aH-IY3F29_-nprL7DMcYdNaMFc6LYPSv3bPy64LTxluvv3CINpo_Yw>
 <xmx:aH-IY3W4Nrs6_mUmuOW65mRhBEynwOOv7G5xtB7OX4ESsZo878znlA>
 <xmx:aH-IYyNEyOJd6ecoE6U82wKWA85PqcikCxhiVHz6rAMJWazvuj4yTw>
 <xmx:aH-IYwt8_JyehTuNAVO9DV3CvVBNlBtm8hfrnfP7x6ldUwHetwtCdQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 05:18:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: [PATCH 1/3] drm/doc: Fix title underline length
Date: Thu,  1 Dec 2022 11:18:09 +0100
Message-Id: <166988985774.410916.4221632200827516227.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128081938.742410-1-maxime@cerno.tech>
References: <20221128081938.742410-1-maxime@cerno.tech>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Nov 2022 09:19:36 +0100, Maxime Ripard wrote:
> The underline length for the new Analog TV properties section doesn't
> match the title length, resulting in a warning.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
