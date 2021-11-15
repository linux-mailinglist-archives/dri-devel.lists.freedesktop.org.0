Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 340094501C2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 10:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796E16ECA0;
	Mon, 15 Nov 2021 09:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 094466ECA0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 09:52:46 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id DD33D2B012F6;
 Mon, 15 Nov 2021 04:52:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 15 Nov 2021 04:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 3ThKSd0gqW4Pa/bRoS/H8v/D8qsxDWz8kI73Cf3+wQs=; b=ns/17SbdCR1hg2Wj
 8SfAJHvSkWrH1BYLrbiQYvgZJjSXti9ZIGUMi1dJn4Gui0qZ0UgVEP/YmxlnP0R6
 4Q/jhMZDBfi+lpq6mQpYbOCLNtbuUA8n1gMm5/RqG+6PHPInq5Fel4mS4z0TF+dV
 DtYq6Xlki9xOMrff7ksH6ciB6lJM6TCXrxpM9vAir7p3sce1Lt57m7IV2vBDOyaB
 ZPjnNHm433eJHDuJFoRnhCcN4cb94jKNrtUFQwAx5T8ymLZV5+qxoXkhbX5lNBFm
 1jNSnYTKhbLe8zUP3ORj53Un8St9+05Fvkw88Mtp98WESxd/IsRUWN/MrPhvxTB+
 HVMX4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=3ThKSd0gqW4Pa/bRoS/H8v/D8qsxDWz8kI73Cf3+w
 Qs=; b=eb0b+Mv0wTMs/NN/dk5C1NCZtYCFF1F3H+UA2MSODvxgja2iCLKaINRBL
 bjFPLchl+1nMNRAPxQJXP3w6aQdJoKTKtRlu+NamI3wkJATPWpkm9FXZlZKsvuRF
 2VMkcYl02raE7RjFnQzs3mjAI6JbMypaWVv69fryiKuthjLCSAQtpXELzZr5uLm9
 qF9HZ5pjNOQPiU82/pGg3ReTR+YV1jaAumPuMUa710lU6Qu8/RxKqmmyKysneMEW
 F2BMQ5gsYgkwLEMFJXHX+UEkk7jYkHm3YW4BASDmB+yB5t1Ee/Y0BdLUFa9JCUGH
 nO4FXWE+EynfVYnppQrEwzz/2WBMw==
X-ME-Sender: <xms:6i2SYSA3AyiuYBFbdfrhSZV9g7P2Uo4tIdtwZWk1G4Pg1Y7wSBUuJg>
 <xme:6i2SYchUW8bVZjPiNqPOdMJOCR-Ket4OvfBmzClt4Rc4s1GSNW_tHLwjiC17twfVl
 Oq2HoODIILpwSdvKT8>
X-ME-Received: <xmr:6i2SYVkhzxL9Y7RORtEFpAyTKhHBnPdumAS82-ez00tXz6QqAANcYlArAYHhiycWh6Jwr9N2ae1Fdsggr-4kd4oCsGqiB8azMuUXNhuP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvdelgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:6i2SYQyVFkszi2viszbUMrA6Dqft_42XsaOUnWdGqU16ZQ-vdpliqQ>
 <xmx:6i2SYXQC2k3WRXxFUXXAj_rmdtUDsCdF6UY9ss0YzkjMqr1w97KfRw>
 <xmx:6i2SYbbf3V8YfWHX6jSP2CSGvjRnpMMStqSrSLnE4R91qJ-A1X3OIA>
 <xmx:6y2SYcIZVqXKUBjeV8waSCct9fSrcIczfEZsREW-ChOWi853u0Ax0qb-7u8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 04:52:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: jernej.skrabec@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 Julian Braha <julianbraha@gmail.com>, wens@csie.org, mripard@kernel.org
Subject: Re: (subset) [PATCH] [PATCH v2] drm/sun4i: fix unmet dependency on
 RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
Date: Mon, 15 Nov 2021 10:52:38 +0100
Message-Id: <163696994488.38690.15132529754055054115.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211109032351.43322-1-julianbraha@gmail.com>
References: <20211109032351.43322-1-julianbraha@gmail.com>
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
Cc: fazilyildiran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 8 Nov 2021 22:23:51 -0500, Julian Braha wrote:
> When PHY_SUN6I_MIPI_DPHY is selected, and RESET_CONTROLLER
> is not selected, Kbuild gives the following warning:
> 
> WARNING: unmet direct dependencies detected for PHY_SUN6I_MIPI_DPHY
>   Depends on [n]: (ARCH_SUNXI [=n] || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && COMMON_CLK [=y] && RESET_CONTROLLER [=n]
>   Selected by [y]:
>   - DRM_SUN6I_DSI [=y] && HAS_IOMEM [=y] && DRM_SUN4I [=y]
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
