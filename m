Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8A351A374
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 17:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EA110E10A;
	Wed,  4 May 2022 15:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A25610E10A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 15:13:46 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 53AC03200974;
 Wed,  4 May 2022 11:13:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 04 May 2022 11:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651677224; x=
 1651763624; bh=I4/TtV8TXkUuotX6uyhdJ9NA0EmBvtXR8CPEJNo87f0=; b=c
 n05BHUzXjpt6AQyDQxMzRnYmnvfRgmbL7Q68I2uF/cafm7bMFX8ypAwdMm8YLYk7
 yXubhJb0DEuedpUvJRy4s9CxLJDeFuM55fQrakupRmbxlCq/FZBcNL/fDoLkFpKV
 3MkJLKr3APyaQEqCXUqUy+IfFUJzMVGqSsNpWnoM+IMrxKlltFTfFthrRxJZf6+X
 pVGXk0XkkC0xP8pbP+9qE9qgC4IGoSidIFahABGYxeDRqGvOADu/se7PbKP5dRzn
 UPqcKMz2RDUbX2VSnsBZWnqW6nPvfrm8nIUgSH8Q/Clz7kbJxyrQe7NykscjBVV4
 a1iWeHWOT08ipTURUCCxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651677224; x=1651763624; bh=I4/TtV8TXkUuo
 tX6uyhdJ9NA0EmBvtXR8CPEJNo87f0=; b=hKOVZSH46KYIuFfa3U41tO7zBBJ6L
 gjcRWu/BhU6hZFvwhYJP+ovdaOMlaQ/b1oMtPx70/TmWEWbkd/G6pNqMlRl1Us31
 e0eqZIxr5uW5Nt2pcZJQNAuTlfxvI2yVwEliDQeixrQBp25mLp4eCXPrt5NbGgnS
 x+GXCDYHe1DR18pRMuuk5xLUgmIjBtymYvCnpP5x6c23q5iEiX2Mi8w5wZ6yRDYu
 H4mSABwLquibFm3bdK7hk3H9ZtVMOHEAJhWJDu5E+bivaLTuyZk9JhPkfaxuwmvB
 b5jmzTnEmZF6kSgqqiafg4IPDs6pRW8UzKv26/mDSom0jjc0HajhykCFQ==
X-ME-Sender: <xms:KJhyYgBEoQy_tTBwFcDUzpGGKafRyMZZEH2QzPVfZnGcozm9Mish0g>
 <xme:KJhyYigQuDtyOTN_uu7LxSNb3Czd1wLY1LUHxRVBRMl0v05g8cCD1-QdDuC2mHuoR
 y1EmzQr3Yk8UcJJMTU>
X-ME-Received: <xmr:KJhyYjkpI1gVb8-a-1bh_n2eTykNYdvStOu7Z6EOFxwrsepMi80uI6dWWR2K8LuRof8gGpNo886jPDSqNxD9Wfxzc_piAh7R3TI_nCQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:KJhyYmwvcdHR8mLu0T-O1f3yKQIhh_66dhrtoPAlUyMZmXIS1OEN3A>
 <xmx:KJhyYlT9n3mGQ8qQBwnjjAqwQ_OtohWHdZQIwJDAIanrLRvUpsCtPA>
 <xmx:KJhyYhbxDmkis-F6vdFLRVon5d2wq8rLSRsQYOF4TaGVxjThElDZAA>
 <xmx:KJhyYjOjs8TK2msdt6T7KEjMkQiIxzx90MvyMDo_BG6cUXJyiloSaA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 May 2022 11:13:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [RESEND 1/2] Revert "drm: bridge: mcde_dsi: Drop
 explicit bridge remove"
Date: Wed,  4 May 2022 17:13:35 +0200
Message-Id: <165167721216.1768345.4606882658231197944.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429085947.1699963-1-jagan@amarulasolutions.com>
References: <20220429085947.1699963-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 14:29:46 +0530, Jagan Teki wrote:
> commit <3730bc6147b0> ("drm: bridge: mcde_dsi: Drop explicit bridge
> remove") has removed downstream bridge as it's prior commit <3d7039e1e649>
> ("drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge") added
> devm_drm_of_get_bridge for looking up if child node has panel or bridge.
> 
> However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
> has panel or bridge") has reverted panel or bridge child node lookup
> from devm_drm_of_get_bridge as it breaks the non-trivial cases the
> first child node might not be a panel or bridge.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
