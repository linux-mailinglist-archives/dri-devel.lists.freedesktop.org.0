Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895F650B57F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 12:45:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E82410E36A;
	Fri, 22 Apr 2022 10:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 600 seconds by postgrey-1.36 at gabe;
 Fri, 22 Apr 2022 10:45:45 UTC
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEE610E36A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 10:45:45 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 34867580055;
 Fri, 22 Apr 2022 06:35:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 22 Apr 2022 06:35:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650623744; x=
 1650630944; bh=sialgZLQyO92Jzz731mhx4P39e8kWtOeqoXhw0cCtXY=; b=W
 xTSy59TGhUVrDTR5ZZ9AihUZQI4ztc0COij2niyKHFseYaXY1k1iijFElgMlbzjj
 IgW79/RwLv6Fp4X6u1RNldYGUTYXAc3mckrXYDpkxLD8Z0+bSam6DaOQn6RH8JJV
 Qurrb/7pXjRhV6hrBlyosxRCFXsVsKBzWSBUFBCKC76wZdJrkGNy/PnPSeGc6ESL
 uS9PQ4Df7oGGULaYujEqbEX0gkpBXi38nCiC253MjtXIcEU+DlXgHhcSk5SLyWR8
 DMCfpqY0+5d3saPZJOXn8wIeAiyRKjBJE3kBwqEP2fTi0gJ5AUl4LXi/x+9R7+KU
 HwyrBchREXwkM8JuhkQ5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650623744; x=1650630944; bh=sialgZLQyO92J
 zz731mhx4P39e8kWtOeqoXhw0cCtXY=; b=xCGQhbzjwFiulmF6LlwEI2cPB3bBF
 0ZqiYsKEqcIu5ZJxYH0mF7KEYuIof1NLNHoW4TtCBHWDqwK+z2RZi+HgbfH1FOpb
 5nEg/us+9DLek/Br6MvB1IWNoskzsjdYAysFTHU1OckKOZaOQbqHZyDf//HLon6T
 d7mcQhAcY1FFLvkEiygt802ZKh7zDfaBMBxNldjoO4kRqUQb6whLZwd8ZmEBlIhp
 ctpWULiSYUe0CMhkaloAbV6hB/Gu4jw3+6LjXHWnZntyvDNrP/WiB1ZJOf9x6Xwc
 3WHrccx3rtfbAlPOI3TziqtZIPUOpSkUOAhqS5u+rspah0ghgnBo8a+Ew==
X-ME-Sender: <xms:_oRiYlIPkSce9J_iB2dx7YVzLXKxS60W4-Vyw3zmLO4U1aLiaFmmbg>
 <xme:_oRiYhJOFbCsPLyYHVGGL4uD5HM-gey6IrG0BNy0SHfJOB4Q2dzZGy0EfuD4xixYV
 3YhQ9CUuNJWy7-W19Q>
X-ME-Received: <xmr:_oRiYtvBLqnHwVb37WFesVwZ0PMShNb6BvWXvV8Vm7Y4HetLslo-SvwCRTZi3P3Uu5oZYU4g5GlpHVUV0fb323r_rgqp4WPTvpHVZpo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdeggddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_oRiYma42u8bFsyuaEoHigJkGAD8rHqS6b6IrkpHQB1N2nS1P6TckQ>
 <xmx:_oRiYsbrF1C3QRv8Y5kK58OXIM5reFvVFe9fVe3wBCRWdmYHf-Yu9g>
 <xmx:_oRiYqDjcSeHlAIkkqXF6PNc-gW-JT9Geogu1FY8mL5VO4njDgDJWQ>
 <xmx:AIViYlRpbFTOma7kkn3FGWD0v6WQLAHvvXHX_xxmOtMZ2RMdHubTSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Apr 2022 06:35:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 inki.dae@samsung.com
Subject: Re: (subset) [PATCH 5/5] drm/sun4i: hdmi: Replace
 drm_detect_hdmi_monitor() with is_hdmi
Date: Fri, 22 Apr 2022 12:35:38 +0200
Message-Id: <165062373584.1462930.6032469942386231983.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421170725.903361-6-jose.exposito89@gmail.com>
References: <20220421170725.903361-1-jose.exposito89@gmail.com>
 <20220421170725.903361-6-jose.exposito89@gmail.com>
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
Cc: jernej.skrabec@gmail.com, lgirdwood@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, alim.akhtar@samsung.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 samuel@sholland.org, krzk@kernel.org, linux-rockchip@lists.infradead.org,
 wens@csie.org, alain.volmat@foss.st.com, linux-sunxi@lists.linux.dev,
 broonie@kernel.org, Maxime Ripard <maxime@cerno.tech>,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 hjc@rock-chips.com, kyungmin.park@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Apr 2022 19:07:25 +0200, José Expósito wrote:
> Once EDID is parsed, the monitor HDMI support information is available
> through drm_display_info.is_hdmi.
> 
> This driver calls drm_detect_hdmi_monitor() to receive the same
> information and stores its own cached value, which is less efficient.
> 
> Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
> instead and also remove sun4i_hdmi.hdmi_monitor as it is no longer
> necessary.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
