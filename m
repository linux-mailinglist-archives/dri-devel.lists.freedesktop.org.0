Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB1E6902D3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3F510E966;
	Thu,  9 Feb 2023 09:05:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8A910E966
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:05:54 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 24DF15C03B9;
 Thu,  9 Feb 2023 04:05:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 09 Feb 2023 04:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1675933554; x=
 1676019954; bh=vVA3cisDetLK3PI0T5Xx4xSQgmJ8XvJtmfPOpMFF/t8=; b=h
 YcDGGSnAQN/p+Vvoa8bkj/Pqn3DHNqXarmNUlZHp5+SnYYARggzcVmTY+YjaFIV2
 v2Nb4YRPbAfPAsXJYZGLg1O8rTirh0hq2Xk142Rpe/JRY2TnyVXPk33oXLq42VKB
 7RINduPaS3SMSjn0hpnC+cjipMkbSvfCS8Z7maBW93yABtfAfJXiNDzt6+nHUb6V
 HEc+IhrppjCScvsCNFMA5/DihFQxGtGfhMNbmST04fsAc/SvRYlTISU2qv/KYZ1r
 sflmiupktVvN8moRUjBcXP6udg1yN/4p3YuRFb6v72edL1cGRUClHgJvqDE+k+Ph
 jdbFNFauHS1vgfZOFfjPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675933554; x=
 1676019954; bh=vVA3cisDetLK3PI0T5Xx4xSQgmJ8XvJtmfPOpMFF/t8=; b=O
 PXG6rY72jdgrzBgF4dUrSrMT3FBzEFVESDGxDJ3WFatf0mZHR7XCoVUg0RU9o24s
 ORjxEu4rBy1rDoxTGhoMte1HmIphqwV++wHEEeofPAQ3mrMsDit9g0KAESvfhFNw
 011S/OXTrHTgbCi2AS7rHrGFWVrJkLA5u0LC8OPIMmwwkLf+s+G40kpYpUdjntKI
 z57g810bCCeYbzWyVE1xlbSH/Or2TLFhUpo0YePnCqg4erShSkthGbxyUtyZbPgP
 Na1XTM03oP1+WG28fni9XhBKHNiJvMbOk2Uytgse2NRRT2Dlt+Ofh7WQbe/ZwJKs
 skOwXsTdUY9YI4zX9HCmw==
X-ME-Sender: <xms:crfkYzi75v-jWH9MHY4zbxBPRBG1NEQK_oZVRRubEf2z8OiCqTYZIA>
 <xme:crfkYwAjCLEbSJV59VZp60SbobBGM1-jCh81e_cQwXnDZMadaxEw4eofMrAO3P12a
 xtAyBKq_1tjhqi8kKs>
X-ME-Received: <xmr:crfkYzE_SeueR9ML-PZcJrmLrmnMRUmdKq6O0QuC33f_YfqmyDCVRrKh3ZV6rHDuWwOuVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehvddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:crfkYwRaBQFc_UjWZ8lco1NHP3tgZFbc3_bVlSOX3_04xkfm39BQVg>
 <xmx:crfkYwywGu5CpNvpZ5vNZkYZXQGW8bLaLEC8jheY_TGQi3LM6o5-Jg>
 <xmx:crfkY25Zfo-t0a_27pG7x9Y84ueX7ZwBREkmSNX6rCYmwAmhwGSW3A>
 <xmx:crfkY7qIF6nnBhXQ_Fu62Re_NSCNJdimgHg2_O0noljHceJKZXniXQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 04:05:53 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20230127161219.457058-1-maxime@cerno.tech>
References: <20230127161219.457058-1-maxime@cerno.tech>
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: Always enable GCP with AVMUTE
 cleared
Message-Id: <167593352655.392369.8334000327918441815.b4-ty@cerno.tech>
Date: Thu, 09 Feb 2023 10:05:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.1
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Jan 2023 17:12:19 +0100, Maxime Ripard wrote:
> Issue is some displays go blank at the point of firmware to kms
> handover.  Plugging/unplugging hdmi cable, power cycling display, or
> switching standby off/on
> typically resolve this case.
> 
> Finally managed to find a display that suffers from this, and track down
> the issue.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

