Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8E41AD19
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 12:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8046E0FE;
	Tue, 28 Sep 2021 10:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928EC6E0FE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 10:36:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5C0832B01640;
 Tue, 28 Sep 2021 06:36:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Sep 2021 06:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 9CAzBpCk+Fgho6BP/hd1j78abxONOZuq+e3u0oP/sKM=; b=CpQmwhQZnprzB6b/
 o8ZN+M7BWCrkZcThaC13gyDe4ZO3cKHNmVBoK5YZI4G9QMYhzA4LTAOhCdZP47Ql
 NFtVgHtJtQr5wPSJG6BHarEkyhd5vbxbTqrYUrlG+Kzpg94SjTJiczgbLvVYJbAU
 iCxFw9l+G9DFcTYZomhKK6Nib6ibpAQIcuVQf8Onhu0f2hgXxn2fHvvR7NxjXU4G
 42wmn8o6AchnQnZd/t/uTV0+33WsT2giZIodsBDWBaOgDFBkVTB76AENwrpM5DpM
 WAKZJyR1OPPLTIL/TVtA99Fn2GB5jDf8N0C6Lmd9SiOtbinSa3yRkhjuqQmKMzVy
 HqNX3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=9CAzBpCk+Fgho6BP/hd1j78abxONOZuq+e3u0oP/s
 KM=; b=kFb9crZmxH4yCHNF5KtbM772OXJsUhIAI28di4l12c8LjIAibzmClXvGh
 SH9bJkKbvIyJzvP4hIY5MNYm7I1eHS/2rBkWPhC3hWRWnXtmOS9j43Y8a0J1tTK6
 73ZlJIcteVT3IL54+aoVUc1TwdpolJDfm7e98RagMb5Fi8OwMhm+WlBzlvLM0kbE
 mIsjVYxGHL8/Fw/OQcQ+cD09L+TroSzRzs1s8RLaCXKaMEmdba+0YQF0Dy7x1Y5Z
 UKSNB3z7HfTs+Z47VTvnEVsprbg0DFCxTtIQC4WTrN+YS+KZj23alA4BMyQqZHM1
 g0flyxOtp8Ti7GodTb4zqUGjCmQAQ==
X-ME-Sender: <xms:FvBSYbCcfYRlK6g2nRd7QcI32QE0JXltMMvzKCw_j3vh888EoM0rjQ>
 <xme:FvBSYRjzd54YlnIWi1zSOnx_jBQWBVKpeEGYHT28QIVFPVK1uOJUMKqRPIbrxTvw3
 s8fqZoiVkO3YtkA08k>
X-ME-Received: <xmr:FvBSYWlp-h4LEgCO-HCk5chVKF2sONYEIEzai3LyZGVCYovOBjBwZyHigxT6BupKN1d60pyko4mvyCdXoqhsaLYwERKFfX6rF_mKoX3L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudektddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:FvBSYdyjAqugcTwZ_Ufr_QbKCZBQ7OCA1t_r0HT2yG2GSPhZygaSlA>
 <xmx:FvBSYQQxa0Ll490CjOFrdQVMPNf4gS-BodA10Fvyhoa5F6xmq1IS7Q>
 <xmx:FvBSYQYTRL4moJ8ppCCm3ua-6KF4gpKMV2kAAAtCiIu03h5GDo2DxQ>
 <xmx:FvBSYcrireFDtLy9PrY0VPCizzatYDBOQbmFl5LSs3JvLql1ylaRQRdHA8g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Sep 2021 06:36:05 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>
Cc: Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com, Dom Cobley <dom@raspberrypi.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emma Anholt <emma@anholt.net>,
 linux-kernel@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-rpi-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 1/3] drm/probe-helper: Document
 drm_helper_hpd_irq_event() return value
Date: Tue, 28 Sep 2021 12:36:00 +0200
Message-Id: <163282429896.583318.14263562633625523087.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914101724.266570-1-maxime@cerno.tech>
References: <20210914101724.266570-1-maxime@cerno.tech>
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

On Tue, 14 Sep 2021 12:17:22 +0200, Maxime Ripard wrote:
> The documentation of the drm_helper_hpd_irq_event() function didn't
> document the value that function was returning. Add that part as well.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
