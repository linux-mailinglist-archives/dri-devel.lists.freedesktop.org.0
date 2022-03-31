Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9554ED56A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 10:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB15110F63E;
	Thu, 31 Mar 2022 08:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7888210F63E
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 08:23:30 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B9E4E5C010F;
 Thu, 31 Mar 2022 04:23:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 31 Mar 2022 04:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=V0SmOvILPJupRa
 jtGf+KPfhu5gygOGNoKyTNawFdv/s=; b=p+zK1WBJOr1YHME5TaUqrZcLIzvnlr
 0ktrthxQ4X8WuI4iBJ4hA5wvrpcPly4xG9OsRHDwr1ZWaJW7e2WeVf3RID6gGGUA
 GSiAlZdVaHe3LiS0dv2Lod7cjNztQFbWwIsWNIlbyWSLKgp1E7mPVoRO9a1OmvoR
 tEHKKFZYi3NZ8KWY3FBBL/b3kU7ycVbOSAF2Lzn9gBXwKIzvGiLTqeJ4kFUmTkJK
 9bHg7haucBV93p9UGtvlHwu8axMO7HHvyEtWcZ3pqx4/DPGKqgMnTBtT2RcWCLaI
 vb4OW6Ro+KsvkdSCJpIR9eDmoj4i9/uX21jYrm6FN9WOK1ZQ5CLUlkAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=V0SmOvILPJupRajtGf+KPfhu5gygOGNoKyTNawFdv
 /s=; b=Q5h8WQyoMAJ59NGsS+fK6JfWRi7YcsWTaRIn8VN8/DBUiGcBQpQSLSQIs
 HJS+UyvVfoumEYxmDsYzUjfJvCsEnKtA5l7B4uJX/c5GUtSg9m8SBUhf7iwU5UA5
 TONNUWbudL/CSO887cXE6wej0KFkheia/NktJNP9gj/f3H7ZtgGUvM95fL/NfX5I
 ayJrkp5bSwR4k2c+n/a06RRjNVcvbbhuq4t8tCJTcKNZm7nTQEQ8xpxYaZ7td5i+
 91mWOj4i4sXgMJjVWdWE9yiO9qIW5lg0P4BfRqAWWYoP1UAo83/aDrIt5j9VMGnN
 k9PbZJ8YsTCkLHrznWtZtVMB958KA==
X-ME-Sender: <xms:AWVFYv3iUacPDtscYE8jrnu7arb_dUVrV0sz6JKhwLZ6BVci1A3YlA>
 <xme:AWVFYuEP_763dnNG1PSMsigxZr8aQjyAUlhHh8xLbmZmhDeJYYVokfqczoPVz3XJA
 Rqbb2kZx1AzW5VC4xc>
X-ME-Received: <xmr:AWVFYv5AqjPvTzcNvDVdY32_yBVt7vADGFY2f7YbVe93b_PMpIdhkoXzf1Zo7REAAaffKY3UI298N2Fj5YJ2S2Wc9g4CN8_exmwgN-0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AWVFYk1M7WhwHEMCiWk-keAte1x7Xpy_uAeSUIdfww0ZXzA37ZSW2Q>
 <xmx:AWVFYiFv1jid1T3SDdk7ojckpfqfjzat1xdSStrNAaN8JYqwJlrxNw>
 <xmx:AWVFYl-Td2xvIbla0WIWasI3Ik1F_QygW5DGPRgCyhlh2OpBrUHfDQ>
 <xmx:AWVFYug_99eyJaak7urz8-WWrTe49OCJcOkhtclYDfXAKztV9mEhmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 04:23:28 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 0/4] drm/atomic: Atomic Private State debugging
Date: Thu, 31 Mar 2022 10:23:26 +0200
Message-Id: <164871500195.436210.4718712043939110694.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328124304.2309418-1-maxime@cerno.tech>
References: <20220328124304.2309418-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Mar 2022 14:43:00 +0200, Maxime Ripard wrote:
> This series adds an atomic_print_state hook for drm_private_obj to ease the
> debugging of driver-specific sub-classes, and adds one for vc4.
> 
> It also changes the call site of drm_atomic_print_new_state to make it more
> consistent.
> 
> Let me know what you think,
> Maxime
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
