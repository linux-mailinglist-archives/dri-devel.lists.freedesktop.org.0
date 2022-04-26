Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD950FD5A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB05710E87C;
	Tue, 26 Apr 2022 12:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2050510E70B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:42:01 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6F6C15C0178;
 Tue, 26 Apr 2022 08:42:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 26 Apr 2022 08:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976920; x=
 1651063320; bh=70dJ9hZuyR9Xk4fCrjvLr+vGjma3GtE6ImfrUIwQo4A=; b=j
 Z+vUWxi26PP1tzNIAlLt9sw8IFO4LnqtZQfre4XdphDf6Iu6JNR77LzEwRSFZRgf
 pAfoxEeMm0QsHVnYYqjt9lcH8yJ1+gNCPL97+TJPW4O3NXZdg1fRWkRouyfDMq+V
 MmONB7TxNGwZm8IJEkq+ogqPuZKcELLs8T4inaSa76SZVDvIqMFK95ERNre7ChgV
 1yUI8wRHGB0YbixdGDcv3zaLS1tIyj4MlSosHl4D2lmkeQCaCoRXLz2IdR/7h/Tr
 XN44pvA4K9JKpOzhy/NivYYbmnYUGLYvtGwlPOaIULYqMwY98p/EtRKVEBkhnM6U
 Li/iv2sJ9IqZiyN148/WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976920; x=1651063320; bh=70dJ9hZuyR9Xk
 4fCrjvLr+vGjma3GtE6ImfrUIwQo4A=; b=sWNLjFi2gW3Kvb3RFB42GJHTL8PV2
 fsR2/Lzuk9chIPUhZzgTNKPHGwR3hce3cA/abNZDXjLC8MuaYOdu0LkMDancnhVP
 5L0KZ8x82V0/YBRVs0SVCvASlevubhVKLBnUXMCzy5Ph6bp3gKgVuCDhGEnHjPHk
 mYJlmyYhhxN1qjNOvaVUmCqwSieGHEe8qFcXeSapYsP4KoCaHkvsEHPw73tRIxOe
 Ff7aJh3b9Sz7opYX1wNR0hp4OWOK1GuizsJH5DS5ONz/QRZLAe3YuOLChYCFKaEO
 AiCnbYvhWHKj9yk/3xnJ+L6p1Mmzjp22elgDKO+P8BUvGrXpGYkRQYZmg==
X-ME-Sender: <xms:mOhnYqZCuUYBujVh_UYvK_foKXRHJ83SM-QMqzh-RfHvEv9sV1aPLA>
 <xme:mOhnYtagwDvaF7Ut6CUj7-YsJ87mCIqnjqsUk0QoO-dBXTQpkRS8hJ8f3jCdKXo3p
 gt3BO6p9OUfWaSYks0>
X-ME-Received: <xmr:mOhnYk8XLVIFtnF3B1tLoyxQDUVyQjKsb9d9Wo0qeXf8GUHDb9W4AmCLvGP9OPpueSaHXoGG16k9qH7qJHzfQr5Ss058dgVl-jMuflY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:mOhnYspS28O9rAul2v7MCK6ZHJCFhlYxa6XTVBfX_XM1SwkIUBnh0A>
 <xmx:mOhnYlqAPyvRH7YwQ9y3mG4Dz0c4DUPQmKDnx2NIFnzb6Aff2yS7SA>
 <xmx:mOhnYqQeOVeohhmxR0fMMFktkJuJNAFAfQ-WufvCL5tTBFjZeGM3Yg>
 <xmx:mOhnYjgAw-mO4_o7V5_CEzpu5cc59fS0uz4Xv_gKs7_OjJZHGCJXBw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:41:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 09/14] drm/sun4i: Allow VI layers to be
 primary planes
Date: Tue, 26 Apr 2022 14:41:38 +0200
Message-Id: <165097689886.514433.12919234723505791740.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-10-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-10-samuel@sholland.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 24 Apr 2022 11:26:27 -0500, Samuel Holland wrote:
> D1's mixer 1 has no UI layers, only a single VI layer. That means the
> mixer can only be used if the primary plane comes from this VI layer.
> Add the code to handle this case.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
