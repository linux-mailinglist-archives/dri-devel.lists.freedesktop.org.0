Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D995083EC
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 10:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3092510E61A;
	Wed, 20 Apr 2022 08:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7F710E61A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 08:44:18 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B70663200953;
 Wed, 20 Apr 2022 04:44:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 20 Apr 2022 04:44:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650444256; x=
 1650530656; bh=t7DoobfDMY7dUicjX+qlluqPD7Zao8qnodbFi7wyI5A=; b=t
 ygCaxN0wtkpwICLP3YBCcWZFOQ4IbeDTJ8em3/45AGOJ6ytwCMYqq/oG24e0QZHQ
 549yvDtJMZgSjAvEV9MHcf7kN8tTO0Kh4dNGmrXOEcbzdu9cm2Me7iPKjBSfc0Mq
 r6zLomXir+eHc0dCBaKgC4XtiY4QRke/BF7JHUQQJF4pYVl31V4Np895UBik6753
 HrhSuPYG9x7SYY6rCGoPp2r+qQ6AJAsmcPr39gy3ELrmEoqmhntiHT9vPKFDiEvW
 qsLpPo3hQ5vCwT3BBQhwEs3rsFzjii90Ap7s/8cfg8tY0pgMXATz51rVqHYQO8VN
 hdMx+U3dqQ3Snhq0lYurw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650444256; x=1650530656; bh=t7DoobfDMY7dU
 icjX+qlluqPD7Zao8qnodbFi7wyI5A=; b=DQczOr0mdxvfH63u3aRSvK33yUvkg
 hwVbbAnAuu6w71U03yBmgffc5IPBWtEWYaqFWIIpYcBI5gFRfYcxxz3IvpAabkZp
 BRSCYNaHOjdylO6Nit0AfRBpUxqgiJkAbyAk9cZSl841k5QXDSL8MkPXh6p9Muui
 h6VG5/zm4gGr8A0rYKfZdnI31WUiaxIvNxUivA4c0jb8kv43g7X+q4w+1SZiORJZ
 HWx9qyxkxJZ4JdS2ayxEkQN+/lhSZrKrjC02hq1xeo21uvj5bmo7CMHjlFZnuDl8
 Ux0FvlppZhBiL0FQ0ysyNunFaTfM1g03gHiupkqO4q8sG7FEKr+iPsC3A==
X-ME-Sender: <xms:4MdfYrIMOf7vpJZ6IzW6U5gk0MbuYJ-apbWZY8i_1_cu7yCvsBk2ow>
 <xme:4MdfYvJvwNfQXpTgDqqES-TroPLS1t6QdhnHmMd-li4hm97Hapt4kUI39EsDAocuK
 tI365fdUBKRHhy8hgc>
X-ME-Received: <xmr:4MdfYjtu-8dtpKX3Xr2T7ZCN73WjGcNifmV0f2_6bLijrK_mODM7zJYV-5mhdFSHAQHRsjkrHehz2IyCooDQwcDEsQlIOWe8CRGsYN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddthedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:4MdfYkZdXhgiPBHJe1laeM8vkDWI63we8zrIoe3Dpn8oLgQkM7Y-1w>
 <xmx:4MdfYiZfxhSel47962QfHcz05I3V0iuPfT-dpHJcIbvREVj88ssr9w>
 <xmx:4MdfYoBD4T0JUPARMGR5f15Shu6XU6f2pWg7DUJDHdNk1RferhAjfw>
 <xmx:4MdfYq7azbT0uE5736JSIsiMJfWp3EO8iPivYieFh11DLk5Ygpt8Cg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 04:44:15 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: mripard@kernel.org, emma@anholt.net, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, Zheng Bin <zhengbin13@huawei.com>,
 airlied@linux.ie, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 -next] drm/vc4: Fix build error when
 CONFIG_DRM_VC4=y && CONFIG_RASPBERRYPI_FIRMWARE=m
Date: Wed, 20 Apr 2022 10:44:13 +0200
Message-Id: <165044423683.307255.11242921417617655496.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411024325.3968413-1-zhengbin13@huawei.com>
References: <20220411024325.3968413-1-zhengbin13@huawei.com>
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
Cc: tangyizhou@huawei.com, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022 10:43:25 +0800, Zheng Bin wrote:
> If CONFIG_DRM_VC4=y, CONFIG_RASPBERRYPI_FIRMWARE=m, CONFIG_COMPILE_TEST=n,
> bulding fails:
> 
> drivers/gpu/drm/vc4/vc4_drv.o: In function `vc4_drm_bind':
> vc4_drv.c:(.text+0x320): undefined reference to `rpi_firmware_get'
> vc4_drv.c:(.text+0x320): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rpi_firmware_get'
> vc4_drv.c:(.text+0x34c): undefined reference to `rpi_firmware_property'
> vc4_drv.c:(.text+0x34c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rpi_firmware_property'
> vc4_drv.c:(.text+0x354): undefined reference to `rpi_firmware_put'
> vc4_drv.c:(.text+0x354): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `rpi_firmware_put'
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
