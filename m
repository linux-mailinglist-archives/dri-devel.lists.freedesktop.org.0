Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8E862C20D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 16:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD2510E4BF;
	Wed, 16 Nov 2022 15:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D00B10E4BF
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 15:15:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 65958320099C;
 Wed, 16 Nov 2022 10:15:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 16 Nov 2022 10:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668611732; x=
 1668698132; bh=LqVmHp/apI+BGLUGcl/Vi+CgxwGVOWrAtjt7XZWQzWQ=; b=k
 93ixCkPdcad65L0ui6ZnafS3RkEyKbD+5bjDfmL5MBJ49AOyAwMCddF9JKkaNsC/
 op7tpj13w65mqN4PW3rWYowMmifm6OFP3EGEM5aUj2vit2jzgK3g1/cHVZk5wwCl
 DlqzSCxbl3KgOauLQIwa3CHaPj9P+8L6auOiaSSTLUmJ3gZdQRWvcqTfRtnkdsKA
 5v3j8KGzbaRK020f2MvUU2esx3si4IvTk7/1WxsnOZD9W44Q4shXaALRNvcfYsvE
 xDPOX5mhy1fVMSur/ZuYRXP8V4TgaFu4lJllS5dV5lBnMdgJT2jxsYl4QCyV+nRu
 alLc14LAfnRP+bYl+ySLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668611732; x=
 1668698132; bh=LqVmHp/apI+BGLUGcl/Vi+CgxwGVOWrAtjt7XZWQzWQ=; b=o
 9/Y0GyaSKb7dlKkoSFjX7TXg/GaRdI5uvW63ZhbyIpThSHh275hZ9+QCfq38ynqJ
 Ola2XVX1pgmPDZdioXhSsV77ZdSSSEWpr+pbpavEPyZGZELgd+9ZJvrTnP139aG6
 VSYeXVYCFL6HpzcMpBbRzDkOpyrHOG5zu4afWv7iJYU65GdIi2rxbSA6vM5FncQD
 9IwBhm2CM7aU0AGgRrq9I9FbY0ipp/yhw0DxBJ4ZWD1eQ1jhbUC9baaIRYwrTgsY
 5so/rrzwLK5Kor0zK8B4YtQ9a6bNdv2GWd+yFQ4MPGfpPb8KvkFqVdhghT2xQgki
 5yGxW5t0MykO17EtiIaLA==
X-ME-Sender: <xms:k_50Y5b6ezuhM1d888EQ2e4pPciPIce57SKjK0a3jv_1JsxEzVSBnA>
 <xme:k_50YwaSKhUFeZXRYt4rT64kjpwvp2NDaHA-86wykPQUHwL-GjCIQ2Zw6TuIO9mBN
 13TMnYlSoM4RiY2Bbw>
X-ME-Received: <xmr:k_50Y7_oOQsvh5F4FDqBsYXoZyr5l-mK2tF2KMsAXtkYl3u8EgadxEK5s1p-i5S3FqEWzwhV5C_bt7X4c7--8V4IpC-kDwIDo6jDdO4JflGoiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdejfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeifeeigeelhfehkeeltdetjeetueelteeuveekueevffduhefffefhhfeh
 gfehieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k_50Y3ofu0Vy2r9XAK3A_4UxrFvMxEct-Pm2U7jnk4U3xBsDUlBcxQ>
 <xmx:k_50Y0rHr9txO6NY-S60cbh07JQfgxPJwAMfqzkvDDBa3d6QPckCTg>
 <xmx:k_50Y9TyAtw55VoS5fDkT3xVgfvZNI6IXBnMlpX4A9mPsreTl5x7oQ>
 <xmx:lP50Y5icgo5EmKYf1M69rfXjsDhnPm_mvE-JHeZFR6SobUHzM8CYXg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 10:15:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, 
 Daniel Vetter <daniel.vetter@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20221116091712.1309651-1-maxime@cerno.tech>
References: <20221116091712.1309651-1-maxime@cerno.tech>
Subject: Re: (subset) [PATCH 1/3] drm/tests: Include helpers header
Message-Id: <166861170429.1678679.4295005647415703922.b4-ty@cerno.tech>
Date: Wed, 16 Nov 2022 16:15:04 +0100
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
Cc: bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Nov 2022 10:17:10 +0100, Maxime Ripard wrote:
> The kunit helpers code weren't including its header, leading to a
> warning that no previous prototype had been defined for public
> functions.
> 
> Include the matching header to fix the warning.
> 
> 
> [...]

Applied to local tree (tmp).

Thanks!
Maxime
