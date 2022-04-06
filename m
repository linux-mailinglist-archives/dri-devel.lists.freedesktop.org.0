Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CBD4F5F02
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 15:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E36810E257;
	Wed,  6 Apr 2022 13:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467410E257
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 13:26:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3BB385C0101;
 Wed,  6 Apr 2022 09:26:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 06 Apr 2022 09:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=P3m/wle+zCqkTn
 Q2LsPonLaq4rJxOMD+5SCFJhySlqE=; b=TrRjehic15v/CX3lDxIOQUinSCSeZi
 JIvndbbp0QbrLc0y2XjWwitDJ+FvSNkncr2g/uJXIT3NiIQ19Nv32kSOFGoOMOkw
 bzJx6feyD5QwtZ0h63Nj5Ng0cGsDA/zoMoMkLEtIjniA343zA5EINJp3D5tFwaAQ
 4j2P0dso0cx6XF/3/5x9F6a9QoBN6GLR7SQBu32oDsHix36FY82bLnxeYNRobGpu
 ptgRjZl9cU5Z1uNjkny2C6ngqewg83L/tVCaRowE6fYxO/GKqiJroAj/Z52dKiYD
 rJP8yZlOdyNw2+sB2dR/wfMbSeMWzrFD424ZPDwEg1zgNEvvsALqIu8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=P3m/wle+zCqkTnQ2LsPonLaq4rJxOMD+5SCFJhySl
 qE=; b=ZCAdKSKgJgyS4lTmscX0tFw6OV1e+lXII8Fnusj6151B5QvkA1tvCcjfQ
 EqMq/X5a5B3P4UuiXSR+whJQgnHE/43KyRMIZkl4+yccqpyfUTlC8J2qAQ59cDiw
 k2DKS2LqZlEgY1FaULEQTyStRa+aV9Od6FJtYdK3LPN3e4X5IKlG0JSUThDPwOTT
 Xy07IGkzYg7T9zwE4vm+3sZ39hKwb5Yurb8Yu0sM3bNOK44kQYDzUOBMNEyJML8S
 qhmjQFC+yR8933eYF/YYIEEnJICAr0wFztGXJZnue6ymewWSSTWXCcPHvmkiawWu
 dgR8hjyOsDzGK/hfL5ZBwvwe2hsBg==
X-ME-Sender: <xms:BpVNYpVfXPiQZP4wFU0UPZuIpzSh9nH8EL6IF342QnhBblo2aC1bSg>
 <xme:BpVNYpmshljiBC2_eRCe1VMurca_EUEM9dzW2fwvhn469wKFzaQBe33oZh6Z1gfjw
 qI_jX-jdGKmGdKg4h8>
X-ME-Received: <xmr:BpVNYlZL1XKM-BTahI-6VI4KsU1QWWuasy1mr9JV6vBXzRLCOulESlSFDiNH4K_P03tqMpc4Zi7rXYbelAkaxCL1sKmwG8OBRnwbmbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejiedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelteejleefvdejffetjeehfffhtdeugeffleejfeekffelteektefgveet
 vdekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:BpVNYsXDq9IcoDpsEQIUI41xaqyUSsK-O5ytQt22IjR_gg155CGYrA>
 <xmx:BpVNYjkd5ZCOJCtMJt1lh8nN8CPQHBwHeZeWcjDO5pHaY-a4rnbyJg>
 <xmx:BpVNYpdDQWkC5ESfj7YeoS0UpQ9iDc0sMyS1fuyWxBOYzNrY_VBAIw>
 <xmx:B5VNYhjl343MrKh_nfFnzMyVjO5ulSQmIjWhcnHr1QazQQ90WXvePA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Apr 2022 09:26:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 0/7] drm/vc4: hvs: Various improvements
Date: Wed,  6 Apr 2022 15:26:28 +0200
Message-Id: <164925158504.1310811.6236787289249011628.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331143744.777652-1-maxime@cerno.tech>
References: <20220331143744.777652-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 16:37:37 +0200, Maxime Ripard wrote:
> These patches used to be part of the series:
> https://lore.kernel.org/all/20220221134155.125447-1-maxime@cerno.tech/
> 
> but since the main patch got superseded by another core patch, I've split the
> cleanup patches out into their own series.
> 
> Let me know what you think,
> Maxime
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
