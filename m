Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062963A6BD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 12:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D8110E2DA;
	Mon, 28 Nov 2022 11:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FBB10E1FF
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 11:05:22 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id A60545803D8;
 Mon, 28 Nov 2022 06:05:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 28 Nov 2022 06:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669633521; x=
 1669640721; bh=qsrWX3Nsc6xrZmfvFqVcrxeyHOkj7NwZOz92SRZBu4E=; b=Y
 Yxl8Rrsbsbbgmo3rbA3077oUI+KHyEJ8pU9edXTkfRXV7g7Y3TCkmBcaIuWE0abb
 hCWgrIZDpLx8r7SUBMdB77paUDuzLl3oMG8Dq5XUNCXTNkSHa5cDuP4PCP7zNgUa
 ACV/Jt1xeNs+Ops3vkxwp+7qrUD+rwXKNtMuGOJykO6IKRi1oOZYvANvVNmp2Nd6
 7dLkLRPV2hqcbRHBIXtdvmCp608QDUV9cTBpUrte8HEVNlaCxqjDDn8DAVrdxEBe
 rVlWqsWTZjTElgekW3nAnqngbUqjBdFF2EDZW8uBChWvktwRLHUewY9HwAb1T7ju
 UYfRM4ArNKoRIAWPl07Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669633521; x=
 1669640721; bh=qsrWX3Nsc6xrZmfvFqVcrxeyHOkj7NwZOz92SRZBu4E=; b=J
 a9VcjoR9rAf5y1unYux2VUW5o0M97nPQbnvTvCm+zMmOoDJpt9UTWzmPCM0tFBEF
 qb7qEAl4L6YxVzOhtlDYt+fhXJR9Kdsh0G62IE4OacT8+sNagoAr5E1nBxYH1xLe
 joN3FxSljhQNdz7EONgKBLw2gmktRBeknbrEvXRBP0gHYNwbOWfOXFi8GJnia+bv
 JCgliRI716WvbvJayjR08pjafSjV3rmoNq47wvOCSBpLLhBKQsQSZ+r+beQ05PN9
 VnE3DC88jD+JJg4OR64cD8oEKgSzC/OmTqBRRqRXVoWeaIrvOwsW68SD7xbKcyMY
 AKoPSDk+OdOgQy+8eQ3bQ==
X-ME-Sender: <xms:8ZWEY6YjfL2XxVNkhaqyEjyISvQ0SdT0Ox-X2QJRrjFlca4JNUFohg>
 <xme:8ZWEY9Zt4E5uOtwPj0NGYMKJQ01P4SoYT32Rw0JQhUkW58ql0f4qY5cmsaLPyxfQZ
 M6G8j17RCvBHmBmtl8>
X-ME-Received: <xmr:8ZWEY09g5QQMyS4EKbs50NAX4e9E8nkasZ4BlSZAN1U_IuEjPALE_5-dGnqhDjvP17dKgVqNZsk7pvxlfbCknx_dJJ5DYNL8mbhl5qVjca-0Bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:8ZWEY8pn6LnL2i3J6DRnTZlSFI3s_dJLIlQ9oAzAm90A5F3VWE-oXA>
 <xmx:8ZWEY1pxrwt-gdlEB8kRw_voHaGDQ8ytqJN011lUtz-hwQiYjqZykA>
 <xmx:8ZWEY6S7aKXM07rNqJFzP5B2oRvd2d1cf8nCjKVLCn8TpAsbAadpvQ>
 <xmx:8ZWEYyKQquNyewlWlrgaCQxgRydfwh9c6lCG7Mf0JemdKqcw6mrv_Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 06:05:20 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH 17/24] drm/vc4: crtc: Pass the device and data in
 vc4_crtc_init
Date: Mon, 28 Nov 2022 12:05:00 +0100
Message-Id: <166963342298.56696.8558903264811333945.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123-rpi-kunit-tests-v1-17-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-17-051a0bb60a16@cerno.tech>
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
Cc: linux-kselftest@vger.kernel.org,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Ma=EF=BF=BD=EF=BF=BDra=20Canal?= <mairacanal@riseup.net>,
 David Gow <davidgow@google.com>, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Nov 2022 16:25:59 +0100, Maxime Ripard wrote:
> Both users of vc4_crtc_init need the same extra initialization to set
> the pointer to the platform_device and the CRTC data. Since it's
> mandatory, let's make them both arguments of vc4_crtc_init().
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
