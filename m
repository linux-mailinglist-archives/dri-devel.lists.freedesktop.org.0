Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F408D51A373
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 17:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A0310E0C9;
	Wed,  4 May 2022 15:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4D910E0C9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 15:13:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1EBB0320092B;
 Wed,  4 May 2022 11:13:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 04 May 2022 11:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651677220; x=
 1651763620; bh=fIoAAcc2aZTyQjXEcHCSf7xWXQ5rD9/5/FnFBK6DL4o=; b=o
 nD5SEycK2tkErMp+L9a54Rh30KOI0VqokQtIUlnoA5eou0mK2jxinf8Vn4jvjLI4
 YAONusj0WONunGR1XpdEv5LSFdfa5M0WMmvYIB7Pc6N8S4fo3MUNVKZxgFFT8PJo
 dibpy8yBfa7j4fKV8KnODNeYxG1S7ka0Wkc+6GM+xqdeiDTH7x6VEQiAB6QgZhL9
 FKEeS6GP5qfNU2wXAnTYJQts9SdlCdGyrebPKJUpWVYGbw2PAVdtTtgwqyXyiBGZ
 3MlNVmEczRflaX8nvPKSRSO+kmFJdynpiabTEqpa8UwAvmSE2msGTKS8m35YlDB0
 4nVbr1pfiHK5MDu6/CgVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651677220; x=1651763620; bh=fIoAAcc2aZTyQ
 jXEcHCSf7xWXQ5rD9/5/FnFBK6DL4o=; b=vjfnHo5qTPRBwsZ8EYQKggu14A6ir
 KMtTdJ89pBGmq79CJOLsJf0TS3B1u8iNrWwIXCNwuxkYCXkA+36AoIPFBFcI1HqJ
 dEqL1ZjclfeKR3N2YWmGgTXqrMcyno3ndZYBP11cdu7VC6bfN4RVIgXIT3cjJ4vJ
 mdV+HEoj3WWRywD5z62h9KmKhaAvvnzvKqyeCjS9dYhqvf7T+8sOoE20O19qeNqw
 CGDEkXj4VOR1k9a8rumsfigQxNMRVaKiLW61VhDTzFSGptu34XKitmoYp1fdArjg
 YhH1cA0xzeBWyKViMn3ZEvzYw4/1fJueSy1oJ88+PUnJ54cheAsSqzdfw==
X-ME-Sender: <xms:JJhyYuf7C_rlyzUQ0sc-WoOznILTmQLjwrygpzIi2CoPMDfRIhQsEw>
 <xme:JJhyYoPnVQ4JQDgom8R58fE7Q33sZp2UZ_VMsWGeYj2znY_oZ5-KzMnuiZwwSDlIk
 VWPI8MAwGpqcQs_SpM>
X-ME-Received: <xmr:JJhyYvict0amtznFk1ocKvsdPAuP6ZjQkcmWp4f7d8paqq94H7AiHlg741CG8nrnlZf4ZRJVQx46K3AsUz1bO0Qvf8YHDtpbIS9WfJY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JJhyYr8RuBz6QWkw22wioS4WqPhiEoCZkCUS-j4d1Rwq7QFHy9DZKA>
 <xmx:JJhyYqvsqNTpn26cL5q-070K5yF_19dRnk6WZX_GuLRkqAxDF_z3Mw>
 <xmx:JJhyYiEDGUlMhliHYTTtuHhNLgUia-Hw_Ya5Lf_izR2CURYxVXbVkQ>
 <xmx:JJhyYsUGBrFjt_bUzPyHKZEsS1MCXfbqsYrCFjiA83ZgfcQoNIY1Og>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 May 2022 11:13:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: linux-samsung-soc@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH] drm: exynos: dsi: Use child panel or bridge find
 helpers
Date: Wed,  4 May 2022 17:13:34 +0200
Message-Id: <165167721217.1768345.1175055884818234568.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428094808.782938-1-jagan@amarulasolutions.com>
References: <20220428094808.782938-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Apr 2022 15:18:08 +0530, Jagan Teki wrote:
> commit <711c7adc4687> ("drm: exynos: dsi: Use drm panel_bridge API")
> added devm_drm_of_get_bridge for looking up if child node has panel
> or bridge.
> 
> However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
> has panel or bridge") has reverted panel or bridge child node lookup
> from devm_drm_of_get_bridge which eventually failed to find the DSI
> devices in exynos drm dsi driver.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
