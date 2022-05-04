Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4519151A375
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 17:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3194310E2BF;
	Wed,  4 May 2022 15:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C67110E2BF
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 15:13:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CB2133200974;
 Wed,  4 May 2022 11:13:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 04 May 2022 11:13:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651677228; x=
 1651763628; bh=raamyTqDiZrWF7f5h2dGquHP6BFk7I4wQkW0fwgyS/E=; b=t
 9CTVlTRxuULXb85IEnmsvh1qapEOmdVZBsvZwUFkmYrW+RZMUzt+fUQMCkQRa4Rd
 C5BuF+XdD4/i7VcVtPCOJnc/jp1kVV6E+0SWAOczXFhIJa1yDZsXyUrb1PE0K2Qa
 6vvXfRwG0UEafknOQP90mW6IO63LTYPThnPvBHizgV6m+F4XUnNriDzvCzc8RBHz
 mzvk2ppYeRhPdq8mKdrOuc6DhBMnf59erQciTwjdGL5I53HbX2t44gBGlu1jR88/
 ppeRsx44oxsrJRvL0VfOmf+hXopg3V0SlHhfx6d4s0ghW4nk62GG2CO4E7iXz80f
 UXZ+O8H7Gi+wbkr1I7GdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651677228; x=1651763628; bh=raamyTqDiZrWF
 7f5h2dGquHP6BFk7I4wQkW0fwgyS/E=; b=Tco50aAFbrdmSG0L5yi1YgLTzUTD9
 OVExiYV2qWepER+pA5GFwqAZyt+quOa9lnN6bzW80diPYaUIgExByUaNw3mtrVJ5
 wXbWK87p8O4qCyWpegIT44e3Ovo/YtSMy1hFvwQuyf5F7QACCT9ekXgCUylW2Sk9
 mhf8vn4BeFqBxfl/LEiD1X++jUfQNR33RllHwGm8X5nxIv/iTyEVW+ZPCyqKb82I
 ZBFzARFYsH3VWfSeWLQrCMsSMjfP8ADHtSzioDbraVm6H5pSoc9A59bLnBt6h45J
 nMbLNur1Ts2TpAGMnSsC8UeVvAp8HqzQRPEVZMm3yxSivNP70oCMq75GQ==
X-ME-Sender: <xms:LJhyYvtaQ0gYSdaonnXDgDwwKUiF-Q7FRvYqlI_oFBVKkHXfS4qqjQ>
 <xme:LJhyYgdbxRm_FRQ1Y4Eephk6FEf2bjP4HhPabhKvu4Y208HVBTI7RcE6I-aFJEzqU
 7o1Na_l7IsCYRErP5k>
X-ME-Received: <xmr:LJhyYixkpDzisZ2eSatvJZ32g8AtmxkVxFC-MqCd7Vj7JDQxmMCN4qQE5WB1zdsq_gd2YO8MJUT05GHjqGYryhc7B3LuJCr--WsPzfc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:LJhyYuOacUl9_NAskWLeZPoqVn8Fi3groHypK5XO2mvyKQfO9F7MNA>
 <xmx:LJhyYv-oDjYPTId45A_sxGFXhBXleDOUV9M6WZDsx6sml7WkCHCSRw>
 <xmx:LJhyYuWqDZ56uUCvdY4yioOOlMWlhKVNnrhwioSiYCGx1LUiGey89g>
 <xmx:LJhyYrZbfY4UhdRqcahNJ7spQxlIQSyls4TdQW_tt1FITDUgvSV2vQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 May 2022 11:13:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: (subset) [RESEND 2/2] Revert "drm: bridge: mcde_dsi: Switch to
 devm_drm_of_get_bridge"
Date: Wed,  4 May 2022 17:13:36 +0200
Message-Id: <165167721216.1768345.4146663730009447596.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429085947.1699963-2-jagan@amarulasolutions.com>
References: <20220429085947.1699963-1-jagan@amarulasolutions.com>
 <20220429085947.1699963-2-jagan@amarulasolutions.com>
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

On Fri, 29 Apr 2022 14:29:47 +0530, Jagan Teki wrote:
> commit <3d7039e1e649> ("drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge")
> switched to devm_drm_of_get_bridge for looking up if child node has panel
> or bridge.
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
