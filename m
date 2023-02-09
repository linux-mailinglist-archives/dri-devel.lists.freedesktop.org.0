Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514DD6902D2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CCB10E96C;
	Thu,  9 Feb 2023 09:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3569510E966
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:05:53 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 244E25C03A3;
 Thu,  9 Feb 2023 04:05:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 09 Feb 2023 04:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1675933552; x=
 1676019952; bh=K3Ccm9AoQ9V3oK5AOE67tnDx1QOhiibLyzXDZQRjB7w=; b=g
 ziz36BjtY+ZFNlQVeMTvGQNMw6oUae9wFgGzf7gBN/0tu7/HZxRc8Y5ERMT1i1pK
 7QFRbKnG50UaEEeLh0TtJY+7FhKx3zaYEzCwfObI7qc7dHWVZmofie7odffJGy3y
 GccjqKAbd6LukgGK+JXIqhf1eoJY/MpAIAbS6meZCqpPodL/zNf9FqIIj5fKH623
 NTWdEwB9+2ENNOVsqa6c34DZfot32fmzmWLX/qtTGxkx/QWceeWfRzBFSwMNqPmC
 yxyx+gQEQS0d/MgXNsrmqAKsItsnRtKoCgyk+905otVk3hTdkj0DsqUC91XzxJeH
 DTkAqZvDdC+kDyKQ24njw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675933552; x=
 1676019952; bh=K3Ccm9AoQ9V3oK5AOE67tnDx1QOhiibLyzXDZQRjB7w=; b=X
 zva4PQLO0yQbZo/N4VrwqGbviCFer+k00mdexcfr4h5GQQQJZ2gsKN721c78FBe/
 7k243DwvMG9EzzZe+V4o6F9myaU5o7/skIXZ+qxWOn4Jz0ckrRMcOFZ9llfozwqC
 /dmORpdTIhy7Yx4OdheL2zoECQyHRPu5x5mqDVbSi8sPKZhCokPP8VjqWU6RF15E
 ZXP+oYWECN5tkbyplFIRXX7C8a5E8qwkkBzhp5neTUy9wGN39U89ZLohhcfAPY21
 pE5uILlC+XBgFMUUcJ9dV4Qo4/fnIyvR8I+f/mKthQJvx9sw/r2XFUyXkesNCIoW
 NQg7crjnRkxaFSxXk2opQ==
X-ME-Sender: <xms:b7fkY4SNc5i7u4MpCDyK-oX1h9-HBgXodpBrDPE1WdOgyf4Fmg0QBg>
 <xme:b7fkY1z1_e-BGEftDV6_aJKnbhYrj6rYxlgzskNot3Bl5ziQSwfVI8VPsXz20RkzP
 m0ikoQtLfOsZR0GLVE>
X-ME-Received: <xmr:b7fkY114wknBX4n5LkOrWLvKpfwg389mkFv8cThF99aqW64SaZVkNdBUYm17NXk8fUhdxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehvddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:b7fkY8A5kAAAhm5gZqlfAXEAt7xQb769HJu-flB3b7s4ptrvkGWJ0A>
 <xmx:b7fkYxjbjspm5AFyfoM0sQlcNMUYDH2-7_dThueveM7cD6RWyDAXAw>
 <xmx:b7fkY4p1seJEUyAJcXtiXQt3tEX6OpDt_6bhffJJwsKUBuTVVE4Ehw>
 <xmx:cLfkY6Z7I0dAPgIcGmPYBntM8pEkLfptZzj5bhiVNLHwAjR92sSWRg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 04:05:51 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
In-Reply-To: <20230127155708.454704-1-maxime@cerno.tech>
References: <20230127155708.454704-1-maxime@cerno.tech>
Subject: Re: (subset) [PATCH] drm/vc4: Fix YUV plane handling when planes
 are in different buffers
Message-Id: <167593351940.392369.16266469865808611040.b4-ty@cerno.tech>
Date: Thu, 09 Feb 2023 10:05:19 +0100
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
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Jan 2023 16:57:08 +0100, Maxime Ripard wrote:
> YUV images can either be presented as one allocation with offsets
> for the different planes, or multiple allocations with 0 offsets.
> 
> The driver only ever calls drm_fb_[dma|cma]_get_gem_obj with plane
> index 0, therefore any application using the second approach was
> incorrectly rendered.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime

