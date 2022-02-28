Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DB24C64CE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 09:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3997210E4F0;
	Mon, 28 Feb 2022 08:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363F110E4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 08:22:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1D4283200E5D;
 Mon, 28 Feb 2022 03:22:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 28 Feb 2022 03:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=VPLYghddiUSX9R
 +LxV+NPLsTTvSHzyPDCnYSGQdPduc=; b=Ytkov/ctEw3ys3dT7YyF0bElkqgkDf
 Pyh5m14yzKUhS5YnXvimsSrEBN4tNeJJ+tmpntsb5joraBRVBaWs8EYHzWa2I+Qp
 RFA1LNCfO3IZ3mYlF3Lm/19nKtwgFzntNoTdYAL1zPavME7bXEkqGS56Y2g/kTwd
 VfmdCxYkTrOGl+vYZtOutOyPMo3D6ABb0ZkXMMHpbhAd4Is4P+IDflDo7hPl67wy
 SJSsc47+lrU8L7cuZ0uvIjxvYEvsBiPmjfBnFw8/01yuapAHu0KJBVoE5a0AVvTI
 IunxYK42GUMT451hmErYVNOQV//XHf5b8YdJ/QkmeZugv9eSXhYWulsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=VPLYghddiUSX9R+LxV+NPLsTTvSHzyPDCnYSGQdPd
 uc=; b=MkYQ3wmrrhaYW+XuY9XMcv/Rm/gIXTlugPTThbSz3g5QWqYOauTf/kPea
 Xnn0U4QPi0x2jgFEdstl7f0++TTULFszEYH2Gjmt4B12AKMqx4Z389CQN3ReG/51
 8d1lu5dc6E6lhORLaqtM3XT2hhmIf4k8sbwc8wUTegRUbbNuCJRHle8YWKVT+pTf
 JCCd+cergg5qXUIvKH405tnWSVhxLX3V9N6etrrXZt2bb9apopBISyHYHaYa9lKo
 bUyLK+jN5Pky8NQ5LLtXu88G3VbRHjc6VEdQPWyNHKkkuZwLrtXhHuhEGs7Y6wv/
 G3hVEjmFCL0ZQjWHgIaehMyAbJhHw==
X-ME-Sender: <xms:WoYcYmpqc6rrjV_rWHxc2_iAZ2D8VVg_yaqoydX34LWLpd0yaSwv1Q>
 <xme:WoYcYkqnbZIiciBRe6d0hNBgxla85GAbfRvgKsoVcZdzQDEH4C1CrS7K4OlK7YW7E
 RWq4GfUF2vtjaN413o>
X-ME-Received: <xmr:WoYcYrMOlTgFj_zad2cEwSpcF9gbiC05OpTgOIqySmvzDnJSjX3IMCWKyDjkSQKeCnrsbZ_WRL3YSWQICADFWXtgalAhV7-eMOVLzVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleelgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WoYcYl6Akw6Z6ZYb0i-4DcILqSwDuKwtQucEKNWkjSEHoIYBVldCvw>
 <xmx:WoYcYl7gDdHhTO_4hazeigq3oQ7PfCvip9sXbBqcDCh3Qi1zNf5Org>
 <xmx:WoYcYliYC1Y_vkYjLwDy9qMY-OrFIW0lCkoSCKG6jHXB8RePnbLtfQ>
 <xmx:WoYcYgaYF4mWvIhPXDK9or4mUHnhu7p1jBRkIsSbOfmDJBt3gFUUSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Feb 2022 03:22:49 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v6 4/5] drm/mipi-dbi: Add driver_private member
 to struct mipi_dbi_dev
Date: Mon, 28 Feb 2022 09:22:34 +0100
Message-Id: <164603650749.9024.11268761207006013829.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220227124713.39766-5-noralf@tronnes.org>
References: <20220227124713.39766-1-noralf@tronnes.org>
 <20220227124713.39766-5-noralf@tronnes.org>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, thierry.reding@gmail.com,
 Maxime Ripard <maxime@cerno.tech>, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 27 Feb 2022 13:47:12 +0100, Noralf Trønnes wrote:
> devm_drm_dev_alloc() can't allocate structures that embed a structure
> which then again embeds drm_device. Workaround this by adding a
> driver_private pointer to struct mipi_dbi_dev which the driver can use for
> its additional state.
> 
> v3:
> - Add documentation
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
