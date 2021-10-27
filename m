Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745DC43D286
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1211A6E8F8;
	Wed, 27 Oct 2021 20:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB7E6E8F1;
 Wed, 27 Oct 2021 20:11:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 23A3A2B0145E;
 Wed, 27 Oct 2021 16:11:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 16:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 dEH+48NnYpdtL5JL9l0poNkvtH8Ouiwk557d7ziA8c8=; b=POTFtTRD2oeJkeVv
 PU7V4i98DA2GjMfJT+cWQ8XmRzZIy7Q2sXtwGwnvCwvNnWYjcFuE70mbaKy0+a3w
 v68hHk8j2Ra8PQuc+fWPEJTOZrkFjghL75QUX5ehdIXlV5H5P0P5YiBcu7hSUFP2
 t3DJvm6zoB+ggLtSkv6ATvlytq9S823pbEtegr845BXPXfPM0qeRUMROfdNUABrM
 axFQXUyOA2TDcLjo5c627sX6v+uS4AqxrX8PM5Jo3SMuTT9WDbDmgX6/PSWzLg7E
 Ri0F8H02d4EL0gCtuBko9MmkcTCtj2tvZZKEA8iLTvz7pTzN5AuY2E5dhs0jeL6v
 tMsh8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=dEH+48NnYpdtL5JL9l0poNkvtH8Ouiwk557d7ziA8
 c8=; b=UQdoBvWcqo7RhGURWXmWhsf22TZlC4VVy1z9AASzM+3hUCP0flBd691R3
 V0Cj9cdxZZlIAGg741mO+pAfEAZF7tA8dSE64j8PPCgh+GdO3tEIoKP7douwduqh
 3ENT1M2I0yAuDCB2Tt2tN2kaVRxuvretigOhY3AEHvq6WxxFiKTNFDpZRaSVM/Nz
 f7CS5MWTVGrm2GDGbcoZYrDfCDypZx8ijX0EOxoO4QAEAi33TRC6+fVZ1ujzYmN4
 LOtpuTviD2CY4r5huUEHtVZP/z8TBMaoowTnH64tAOHG2ecQV0aiJHjOaMl2KkTa
 1HOGGOM9DGs+P8X/Qzqy+Tps1qigA==
X-ME-Sender: <xms:gLJ5YQuf2llcJFQlx0_SuOUAtz-u_V_DeuUuhPDjkkVFY_cSFJMebg>
 <xme:gLJ5Yde1Ex0dsi0rRImbYFT9wpDuCjaV1O9Zae96a-tpnThbRF7BLKBY_MfhU3CRD
 jhp5NENnh_0pA0D_U0>
X-ME-Received: <xmr:gLJ5YbzuVyJ0AMAnsF1nptsAVPypActnbGBxjscOHHUmVSOKMPqnxNiOgU0OrL1zWyymqF1Ae3O3RrQEMaSEtfYOmdueFeIjnVx2kYbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
 geeikeeknecuvehluhhsthgvrhfuihiivgepieenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gLJ5YTP6IAKN5Vt2DFtee_vW5MSM2erQXYqtS3Bp9TEVdgJUMgHMSA>
 <xmx:gLJ5YQ8eHKb_o6pxCWQlAjcdtgMPN3rC4DNwtfZzDX5WtXiUoIzvYA>
 <xmx:gLJ5YbXitDXFgp0awX7jYZuY9aqMZmEzrGmU8TfiPIhs1KlT42AfPw>
 <xmx:gLJ5YVKEK0bqUDvlKIxjG9QlJ2DIAvTPQaHDQTg1zG7VqvKJJX6IusJKV2Y>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:11:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Thierry Reding <thierry.reding@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Tian Tao <tiantao6@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Inki Dae <inki.dae@samsung.com>, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rob Clark <robdclark@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Amit Pundir <amit.pundir@linaro.org>
Subject: Re: (subset) [PATCH v6 21/21] drm/msm/dsi: Adjust probe order
Date: Wed, 27 Oct 2021 22:09:52 +0200
Message-Id: <163532324665.18245.10729198650633132372.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-22-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech>
 <20211025151536.1048186-22-maxime@cerno.tech>
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

On Mon, 25 Oct 2021 17:15:36 +0200, Maxime Ripard wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Switch to the documented order dsi-host vs bridge probe.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
