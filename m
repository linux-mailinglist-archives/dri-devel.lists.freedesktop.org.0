Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8983C63A6AD
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 12:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75C010E218;
	Mon, 28 Nov 2022 11:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC7410E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 11:05:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 691B35803D4;
 Mon, 28 Nov 2022 06:05:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 28 Nov 2022 06:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669633515; x=
 1669640715; bh=rhwIVol0Sw9gpOfzp/VchLhtTbcBkSg5YY1nD1OY/Y0=; b=I
 fAaNNf/Ef5obt1WjL1rcO0wkbnH5ou9NWy9lQ5vHpXIoFW51S2E795GfW3hLTURe
 WYMQJHqaBqdeFe4cRvAExACljwQFHM4Dj4aKWesxP/DhEkqKabCRKiIx8ITflCE3
 o+QT8OOzlXa1YO+B8D2yeXL6aXfTuOKgjHj0jJvD/K7MfmaDjlin9K07P9mx0GVy
 M46yvrP2EAJeZZIpiU8mhENrZD/f/VPiIoXKNDa5Rp4EoBH1h7xWewQd7jSsdw2t
 LgalR0h39AMEgtMoFhTERMNgRZOpqrYb3LrtL0divLBHrOg3GLb/wW1qlmJMB+Ow
 fD8sHJ30O5t49l0wco95A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669633515; x=
 1669640715; bh=rhwIVol0Sw9gpOfzp/VchLhtTbcBkSg5YY1nD1OY/Y0=; b=K
 FI4IYy/OCS2UJhwJPvZUAKfAIA1K+E6SuiUNpqIijQkdYq+jQU0cLBLRXii97iod
 sJWIb4PMVSLvjQIz/0B2J805pt46OLJy8gc57DaEpMj7MJDIM3jbz/6/zVxwbawc
 hKQ2hC3hTbmjYbwQUNMTwYKeWLTAPQ2zyA4NXdDnTSDlh3YxSfcOGnXPXg5mI8Hs
 aHo4yU1/413NOhQi4IR3MvAQkyVl9mKVzvNLGV//yuWKAkE79h6GwI4jKIdeFv6r
 ANJ79dneKZlwxDGwmcCPkhBzi0r9nW/2+naVaVCwfE7KdgEgfJh41Q8P3Ph0IClf
 8dn1W/UN0aUnxmelM1eng==
X-ME-Sender: <xms:65WEY8waubcY4rq4NYMJkogoZpmk5u5Bjt0Pd2y_w4zhiPybi9h1qA>
 <xme:65WEYwTN6WuE6HVuJxbcwJPyLjFHF6m6RDPJJQP3FCNI-EljYydsc4fbM-mL-5m5s
 vWf_rTjuezAnRy7178>
X-ME-Received: <xmr:65WEY-U6zm8aIYjyHN1CUHYYYfyOZpgRSN1M5Xz57tfG3fPgrUvqh7-KoFV7hEQl521mZYk9CE2vyfpMGDs3A3FoduF6rhEPbCtVVtlB0AOqtg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:65WEY6g9uAn8lwfasBHS8hFqkFhko5n_lG_J9v827hzf1mGjdhbkNA>
 <xmx:65WEY-D0-m3BtI9_6s4j5mktw7SCB14WM6CKnaXj6FOVWfE4PAcZ-A>
 <xmx:65WEY7IfQstyv8qxp1pUrQAStJki-qU_rLCneuBDLxWEBFy5xUBsTA>
 <xmx:65WEY2hZ9_WglFIzUlQnUBSdS2DnnvHVtIBt-eMOiBtog0NlZWrR1A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 06:05:14 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH 14/24] drm/vc4: txp: Reorder the variable
 assignments
Date: Mon, 28 Nov 2022 12:04:57 +0100
Message-Id: <166963342297.56696.10895622968661502205.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123-rpi-kunit-tests-v1-14-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-14-051a0bb60a16@cerno.tech>
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

On Wed, 23 Nov 2022 16:25:56 +0100, Maxime Ripard wrote:
> The current order of variable assignments is unneccessarily complex,
> let's make it simpler.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
