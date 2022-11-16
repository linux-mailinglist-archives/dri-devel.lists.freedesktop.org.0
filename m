Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F39262C20E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A500610E4C1;
	Wed, 16 Nov 2022 15:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAC810E4BF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 15:15:38 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 67DA93200564;
 Wed, 16 Nov 2022 10:15:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 16 Nov 2022 10:15:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668611736; x=
 1668698136; bh=KkWpPHhBleBOdOFoNClKky501Dw5RueAQxOsJX4uwQo=; b=E
 sjw2ZlJ0dR/vplS+LoeT3Dvqc5TwU8esDMhzBrUwqgsPWgQkk31yKd6TuQgqo6gp
 IgOJK3jOFMhEn/Gf9bREWehIZ26b7a6DyXJ4vRC+1YT/nLpM7dTXfn/o7LPVZ70f
 1uw1+IejClx5+lZ+KqVVHGCfVq4NkntjAFYkia90VvqA9ifNCaIs6QO8JoQRQOU/
 UBUGVY96UBkOF5wObzqVJ/QYW2xAOIxxbD3qWWIpqDkSNxBNN66x+rq7J11ahhnH
 O1CcRsVXyUs4WTxJRCBC13YP56SSZqRx8SdaIRS2sBaQ/thXOU1jXubPYayp+sWm
 ShTPpMJ4Iz4Bj4LjGbD/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668611736; x=
 1668698136; bh=KkWpPHhBleBOdOFoNClKky501Dw5RueAQxOsJX4uwQo=; b=d
 8jKsTp81On+7uRxUyk10dXdKbdC8Pti+XYbwNjeDBKREhTjeXrh0ZFP11o8gHI2z
 4Wl6abMFvP873MJ/IwfIrEGeU2m60a/ZDJK81W2VDGrh3bfFJHQzT5sVdhsmbha4
 MLpU2SUue3+CPKRKjYpz7C0NqBfQnBa2mRknAC2ZK2qWMdkL6NRW/JuX+bxE1riX
 sOQ8u3fqJeM85zUKXtXbD6vZybe41AFX8NNwVBZc023lJLzCTxadRuuq/FbvcSZv
 OaIsZIsKf3UDRAL4Pw2mPm8BawOpUTr6z41eQfZ9XwH+d7mH54QPsjQykt+uZ58x
 m8gj39KA+Ef5CiQuJhX7A==
X-ME-Sender: <xms:l_50Y5CcLmly1ECuCDVTGF11Qk7JqDCkJLBlIyoa9LRwe4nfy6M16Q>
 <xme:l_50Y3glOCawfO0rYEKlHeXVG25ZAbsRe4K74Adlc736YzjpOjCHcWiUa6-BsgRHQ
 jbiSAgKJc4A8pMTPp4>
X-ME-Received: <xmr:l_50Y0kckkms80szFcrmSONYnA5QjRgb4tRv01zkGZfajXI53LcVm7FDfIM6nRAKVZk9vmJXksnNVDmAJszEsB31s32T9JitBqOpnmYDrJgdcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:l_50YzwNzz6TpcU-mhsSO7bGcTcV1-hqn3imowLv1qPMqPuzR272pg>
 <xmx:l_50Y-ROoDskqm8U1ig1JYN3otqRm-b9bshEK-_pNnuPrgPaVNhMAw>
 <xmx:l_50Y2YLOV0vKzKgZNlmawbSwuV2pQVAFSN7x5H0u0vuKvcNfTU7ig>
 <xmx:mP50Y_KnEIpCSkunvhE5LgU7rmhFGXvCNPzNDmBwVaW71apSjX69wQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 10:15:35 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Vetter <daniel.vetter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20221116091712.1309651-2-maxime@cerno.tech>
References: <20221116091712.1309651-1-maxime@cerno.tech>
 <20221116091712.1309651-2-maxime@cerno.tech>
Subject: Re: (subset) [PATCH 2/3] drm/tests: helpers: Add module infos
Message-Id: <166861171045.1678679.16800704633519057790.b4-ty@cerno.tech>
Date: Wed, 16 Nov 2022 16:15:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Nov 2022 10:17:11 +0100, Maxime Ripard wrote:
> The MODULE_LICENSE macro is missing from the kunit helpers file, thus
> leading to a build error.
> 
> Let's introduce it along with MODULE_AUTHOR.
> 
> 

Applied to local tree (tmp).

Thanks!
Maxime
