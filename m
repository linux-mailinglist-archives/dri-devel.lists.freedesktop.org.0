Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438274A6E37
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C6610E476;
	Wed,  2 Feb 2022 09:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3431610E4A5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:56:09 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id C460F2B00960;
 Wed,  2 Feb 2022 04:56:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 02 Feb 2022 04:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=BMNTBUbITcyY1t
 HRIQ8pPnuvBE2aEE21EUQWnUzzWHU=; b=bHEHVyEUBkl9wGmw6beg/PXTVreHdq
 6FY6Fsm0P+r4HVvmhnXwMKkh6dfndrVILf9/jnCNiyDLgImuASzjFUBGFBiaxKb4
 CJZzVXrflRSGCqYh5KYHLZFOgNPvPgXBDPxY8+aCty9+Ropz4OAH8IZln/7vb15W
 yXXPvC/juuKOL1OBKxu3wIFPT/FRU6VZFBpxJfhqEOE6Y0W4+NtFRmB9bcWu7U0j
 KmCnXHuj0ijUgroQafTxsH+Avlqwf/AelqYnosCsQwfo+kvAy5YXwdY9LY0vRQ21
 v+CmZDJxH0MmOKiR/jYctubY7TYT30ie60IiLZqPyRjsPd7DGlLsaNrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=BMNTBUbITcyY1tHRIQ8pPnuvBE2aEE21EUQWnUzzW
 HU=; b=bOng5vL/WBRkkVokyohffCDdb+rOgqVejnvflOdDmFCJz6tmjRbQ3Ybbk
 0gIPp+5zmJmV47qnFw4GPL9LNYhVt4JfDC+olmNlDbYkf9s2K/BhPs8UW7t83d5a
 f3B1Q69Jn8+GEcFsOfnB1aF4dEAP40KFqohCX8Gq4CPmwnQcBZBEd2n/3KuIU880
 RUlRmDuY6z0EYQmHu/WB5P9Dv92+p8D5848laJnZDlQ1mTfLuNvyHYTsQsyLttzM
 9+EK8e4s21RYJuxbdfyI9v2qEBou66HHrKQdG6XvyIbKVLsHlXaW5bB/QO8C7lqi
 zIGKVJLzaAlAUagCW/w8Q9VVrsubg==
X-ME-Sender: <xms:N1X6YVpOvpuSbNvvUO5-j0e4nYO5rquo9yHCI8NmLuLcv4lhwu4GTw>
 <xme:N1X6YXpUWtmGx5eu2Bp4RwZQ1Ob5tMoLXzRUu8DRL6-GbzWrmu0Bo9NTB87izEeMk
 C4aPwwPIwmGaL5GeoM>
X-ME-Received: <xmr:N1X6YSPsM1eN6qYruG3zSmSPFXF2Maql1Dt-QORqENaBRHoj79AxkLO5OqXs0eyRt9gbXvvkpKF-LHPE62dvLJN0zvkRoE4_1qi41ro>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeehgddutdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:N1X6YQ5pahY7mc_BYGpGHPo0tLke9BpFfZvG_y6Ij5Xfdy_le2MTPQ>
 <xmx:N1X6YU4T3V5uTG-6fPoLi-B589VI8q61KxnFjG0zPZqKmv52a8ZtLQ>
 <xmx:N1X6YYjoR_QucgCdIxivj3akJopH8T6qv5OtKyIr13dXghZ-GtVw8g>
 <xmx:N1X6YVHpQ30xAQS5RqU6ZyLhMpgaGv8i0G47L17mrwLFJ2Wtg0OjWX4IOqY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 04:56:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: Re: (subset) [PATCH v3 2/2] dt-bindings: panel: Introduce a
 panel-lvds binding
Date: Wed,  2 Feb 2022 10:55:59 +0100
Message-Id: <164379573891.876896.16153204787533367742.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111110635.804371-2-maxime@cerno.tech>
References: <20220111110635.804371-1-maxime@cerno.tech>
 <20220111110635.804371-2-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 11 Jan 2022 12:06:35 +0100, Maxime Ripard wrote:
> Following the previous patch, let's introduce a generic panel-lvds
> binding that documents the panels that don't have any particular
> constraint documented.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
