Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F7563A6B9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 12:06:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F26B10E217;
	Mon, 28 Nov 2022 11:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1087F89FCE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 11:05:14 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 681995803DB;
 Mon, 28 Nov 2022 06:05:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 28 Nov 2022 06:05:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669633513; x=
 1669640713; bh=7n/L8sWWtvZxkpRnLozsoGpUrXbwPv7SGpNu6V+FytI=; b=e
 z9KKqfFXWDtG8FSHcwfr+kZHFeYwRjX/68NYRhAEJQsJVcsrZpioKEsiovSa2MCo
 BC5dFy/SBSQwNEVK2QMU5Zr+yFNRzlxFfFRbH614QHDVqLH7HQxKpV81HiWdJZVr
 YnYPF2I1YAryBHCusoPG0JsT7X8vUa7uujcF9qa56i+evi5+AR0zADBsNKGEy1Kq
 ief/L0PL5Ymj8keLYIPtW1PaOz9DhYb1xFMcdyAsx3zM9C70UO+ya51cFU/9OYea
 2amXw/BbaWfZNu09wVm+gjSTjoL6PesUwxqeYVKR/iwpAWV8DjATwnx0VLbgdNxu
 EA5MwGCIcT9knCV7ft/Jw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669633513; x=
 1669640713; bh=7n/L8sWWtvZxkpRnLozsoGpUrXbwPv7SGpNu6V+FytI=; b=M
 mrCSqaMry1j9O8Whe7oSZG/aOEqQJcJoLwontsT+GmXvUMeCDpT7ive+uP7waaS7
 VRi180tGjQ/GbQZlMsFUz2A3qWrMzqZh/iCG1oSRS/F/YBTEyredONDctMpKR0Ps
 0esZ/K1kdIDsSGQtBah3rcphq/1xmpdCtoT3S8VQLSV6wZqa5ibZ9TqCizGPk5aP
 tyR/1hAHVoY0TWazkplKmn7DzimA7q/BNriVkSX9xH8YyMCiHnGZMw8KWHfoeAWE
 XBWKWBwbZkKrONpcP6kcLJalYXI5zMVu03lz0WuboGJ7xaZ4QDyK1FL9iW6G4noT
 yzQINtaI8IgoSIe8fTViw==
X-ME-Sender: <xms:6ZWEYwgS7QrjOc0CGIm04crmYnZxApclp6Q8AB3JU90xnq0Dv--chg>
 <xme:6ZWEY5D5eXxzbwTTv3yr8i_3eBMSiY33ivNqPKAriKlDWUNpxF-fONuVaCw5uWFcA
 h1H9-Ji853o-D9dfw4>
X-ME-Received: <xmr:6ZWEY4H6Rn6i34orQ4DJzWkQMakUTeZC2Eznauw9qDU_C96ZrplkOMAJD18Rt5LquPk_u6OP3ro_YCyXDYoH8h5bCnHndHKUI1HglYf8w8FHww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:6ZWEYxT7F5v1OHfM7XC3AGKlPsixR-KL9er9bzEh729XLVICiOj0hA>
 <xmx:6ZWEY9yjfZ_WStJ8Zem86bx_may0YGJFWDEm742S7CVPwnDB0rSPjQ>
 <xmx:6ZWEY_4IbSE2wRuZdikzUJuWuIKPC_44AYwQD8dQEYr5WR0Le_VK3w>
 <xmx:6ZWEY-RZsbyAfDcpp_5tvyHX4_AEs3KSotyzxj1eGsCPXPuJ2qjk3Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 06:05:12 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>
Subject: Re: (subset) [PATCH 13/24] drm/vc4: kms: Constify the HVS old/new
 state helpers
Date: Mon, 28 Nov 2022 12:04:56 +0100
Message-Id: <166963342297.56696.17736510274348505115.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221123-rpi-kunit-tests-v1-13-051a0bb60a16@cerno.tech>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-13-051a0bb60a16@cerno.tech>
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

On Wed, 23 Nov 2022 16:25:55 +0100, Maxime Ripard wrote:
> The vc4_hvs_get_(old|new)_global_state functions don't modify the
> drm_atomic_state passed as an argument, so let's make it const.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
