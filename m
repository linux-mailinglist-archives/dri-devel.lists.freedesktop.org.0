Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4FA592AE1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 10:07:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3206CB2A70;
	Mon, 15 Aug 2022 08:06:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4403B2767
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 08:06:08 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A96A5C0092;
 Mon, 15 Aug 2022 04:06:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 15 Aug 2022 04:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1660550767; x=
 1660637167; bh=knwRU+bLBZ3g4CQ8zAEuXBbOAgpnVyopGPc5P1G0sDM=; b=W
 zzb+5XOS7rNUJupliXv9e9czReYE8D2Qaph1L4zme+A4HT6c+oRl481iLa2od272
 hzW9cumMhKtrQsMS9Q184LWPWNcfSW/ziueDreMOQJ3uzRTaPciW7INNaTMAFNl5
 crzsrcr998k6GhNAVNqcRR2hgxoxd5SmvfhLCn1/eEDoNOwsSrdhkQLaTYN1/WkI
 Aehe9UcI9l2OU7vkDbPHYOPKDurmlhLUjjUSc2w0dm+dABQhaJopdynKzg0CufAY
 2Qns26LuUl2e4en9jvY3kl1iXJ7fBO63AsX4ZFLTI1Y7LmVc5R6tSLFrkpq2pkFA
 yOACAf8s48Ox4QqQ/CbWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660550767; x=
 1660637167; bh=knwRU+bLBZ3g4CQ8zAEuXBbOAgpnVyopGPc5P1G0sDM=; b=V
 mhGD3oSN/qv5uwOxZKmj0Cat2IozNBYgqAMG2041fIKT8luwHzte43bRc0jr2Lbt
 TnM5PMRWsjZvTw9J+khsAykBdzt8rrxZZR1r0LTrymGefC3DWiOyK89EVRR2ZnE2
 lAITsSEXeHjLF/3NN+cil9jZr51E2ooqny+eKdVwKZS81+LmIP4qzZRsqM/EINnC
 ByvUvA6KP2WFvxEHP2zciBnHmHFc7TwetB9RX8Ux7DsRFNLeoee3FoDFW3mfkVOl
 XqgfwPX2qpWsktk9CYrbCMWEAgTj/eMwBoOwPi5n9PbvJ430iKbsV8BWCwc2SWOB
 eDBDYVjvufsfCoGRzTbDw==
X-ME-Sender: <xms:b_75Ypfa897JPT4SvxVmAh667wKPXT8mcDdGVNdz945JYLcuD44xzg>
 <xme:b_75YnPYYcGtzpmCnDunBOR1NP9gLsWM1EL64Nyg0cR9GPwpVmqOpBcuxdX3v1Slc
 gbPNBTI4vjIZF4hOHo>
X-ME-Received: <xmr:b_75YijThHr5EZZJjhGL2ybUa5RCKEMioSW09uU3Cujqxq49QgWO0IhFbPW4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvdcutefuodetggdotefrodftvfcurf
 hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertd
 ertdejnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghr
 nhhordhtvggthheqnecuggftrfgrthhtvghrnhepueeigefghfffffeifeehudeiuedvte
 egueefffevgfetvdffheehkeffvedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:b_75Yi9EBx4f9GsJ-2kFCUtSRhTjU4lqsivBxXzVXnNofdLvNxyy-w>
 <xmx:b_75YlsG8ikAx7sPs4vYU991cU9gbZODtC7Xmm2tDukm6_G5LkUBWQ>
 <xmx:b_75YhETjZTbzykWxSGf5rd2LVdAf0a7hs50b0eniauAEhFoZbnTvg>
 <xmx:b_75YpgTedu0r4eu4hMZL7Ve7Jn6NwiNhdS2qyyd-G6yzkrKf0AECg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 04:06:06 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: mairacanal@riseup.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: Re: [PATCH 5/5] drm/vc4: Drop of_gpio header
Date: Mon, 15 Aug 2022 10:06:03 +0200
Message-Id: <166055075108.287804.18132829696518528327.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812205746.609107-6-mairacanal@riseup.net>
References: <20220812205746.609107-1-mairacanal@riseup.net>
 <20220812205746.609107-6-mairacanal@riseup.net>
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 emma@anholt.net, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Aug 2022 17:57:46 -0300, Maíra Canal wrote:
> This driver includes the deprecated OF GPIO header <linux/of_gpio.h>
> yet fail to use symbols from it, so drop the include.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
