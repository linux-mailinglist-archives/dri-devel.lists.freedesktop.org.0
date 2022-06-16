Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470554DC2D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 09:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C286310F762;
	Thu, 16 Jun 2022 07:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9CE10F762
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 07:53:12 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 39F1B5C02F5;
 Thu, 16 Jun 2022 03:53:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 16 Jun 2022 03:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1655365992; x=
 1655452392; bh=wG8AKxotIC4hOqs7tLCZFx1yAYerGnafok9svmkMztY=; b=A
 t1KF5yYBildNv/cPjbipuAlP1QT1ynvD+gCjnrzazE/qWno7Q8cElZJhaS/QUF7g
 2DpO3joO/yBPXs3HoyJ09M9Xwu/kMs4ACokFazmPQBAzGYXTDCWlCN1e+9EFzVEl
 Q3anL4Fd8uYYL/LFXcgNSpxsC+R8n20NGVT0MLxpPXN8FdlR5eYPJMAv5e/11pOu
 pGKOxpikPNdOumkdRFMIBzmwyyFJK1B8KYQmgjDu/eY3aA772K2EKZWNgcppzSPv
 LcabTueTDKnWj6JIeFdErfkZLfzfawmoAsysTIu5+JUnNcrOfr58Hjkj5Umx0Q0X
 il1F+0cQXXYTiSJNPo2aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655365992; x=
 1655452392; bh=wG8AKxotIC4hOqs7tLCZFx1yAYerGnafok9svmkMztY=; b=I
 u0/ri7wBl8TnhW+xXSY9Lww5W7sWjep8d61JpS8QYqV1XvM+PukkizXdK3E7QQan
 gHmCuhMp0E0vjb0mjno2dz3iQsYiYT9AGY/KHpbr6ZstKce/KPk0jsQ561SXAeRH
 zKKKgD/Rit1d3cmSVM7pIoXH50ywUaolR/4ezmUr6N+bmJ1VqvmIe0VPEyEc1EbM
 laoVdZJLkHu8h15De/1+bPUI6I5AbuKLp2TDbRVOxR1PZw1dt6BKveKn3VDqgb4z
 7UgX5GkWBfEAHyWwlk1/dzVEOqJq2gojpBruRL2oEeeJo7GhfyYaKaOtdYIga74z
 gxkzuRZM6g3cBDAGzgirg==
X-ME-Sender: <xms:Z-GqYsVhp1Vk0wous0BFNtzgWTOtnyhGTS8BOdVOfQo7dIRZohBJ6A>
 <xme:Z-GqYgm7rRkcXsgDPWljk87RRf_xX_jbFc8MXzX1LynGPkJhlnBdDfQbt0M9CrXwg
 1VknAaZ6bEH7B5JxlY>
X-ME-Received: <xmr:Z-GqYgYRrzZVYdsZaKLwVwfGO9jukXLxjpZkurJfx8xPPO5IuJyYJkOYSSaFTpiwwIN7FaZ2-gb7JgFPjAEMJV1N2_5AIwEOjcmcNoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheek
 ffevudefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Z-GqYrUPQbyF0otCu17vCpGQiR0yzg8E48r8blP1qHqyQZmezzOPGw>
 <xmx:Z-GqYmkS8EhgTtyHNjkPxx0Jfss8h1jj-GgpMl1RvbS-zUqQ6qLCmQ>
 <xmx:Z-GqYgfJdEY1hxHUkdiNawozRLAn_tuJWqLmGSy7Qfb7wQPF_1VweQ>
 <xmx:aOGqYvcQFK3ScywFeot7yKTcfLXwf5Wj23Dj5o2Kqg9CpTzd-L1vXg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 03:53:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix crash during suspend after component bind
 failure
Date: Thu, 16 Jun 2022 09:53:06 +0200
Message-Id: <165536598378.1275350.14174129398362283973.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615054254.16352-1-samuel@sholland.org>
References: <20220615054254.16352-1-samuel@sholland.org>
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
Cc: Ondrej Jirman <megous@megous.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 00:42:53 -0500, Samuel Holland wrote:
> If the component driver fails to bind, or is unbound, the driver data
> for the top-level platform device points to a freed drm_device. If the
> system is then suspended, the driver passes this dangling pointer to
> drm_mode_config_helper_suspend(), which crashes.
> 
> Fix this by only setting the driver data while the platform driver holds
> a reference to the drm_device.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
