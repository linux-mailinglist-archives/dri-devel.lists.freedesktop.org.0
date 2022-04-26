Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE7C50FD5B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1160710E8A5;
	Tue, 26 Apr 2022 12:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D602710E70B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:42:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3393B5C0184;
 Tue, 26 Apr 2022 08:42:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 26 Apr 2022 08:42:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976924; x=
 1651063324; bh=glIYpIyn6EIl7cNbt5z9ydxJv3xzQa3lTK0ud44eM0g=; b=W
 UupoJ+OzElq+xwTFs4JXe02APWf1A7/295RtX5cCongk7SY5JjbcLu+p9LwOt9iL
 s0iY0jmcDCmd8IAqWrnkwWXPEgbZXOiJXUqrkk7TGKfSnAELvNLHbr6TcaDjj5al
 3uz7O0rV+42vVg12N7/x4ZxjL2bm0wf0eoXU06oOZ1Gmn9TLNFttd7Z4wZ5mB3FC
 4ph5MGqHiG5/r3N66dkNTDr/wEYd/9dOcjJCvB5CN7jvQFjnnQadMksKPer1v6AC
 148UH44aSMZRv1VN/9vl/CmPUjbqv8Ii8imEwY8fX/926d+08h+Escd6lsyFuJZL
 /cvKl6RzR4T2XnmPfNXIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976924; x=1651063324; bh=glIYpIyn6EIl7
 cNbt5z9ydxJv3xzQa3lTK0ud44eM0g=; b=ElYUfnMLi24qHuP7mUjLG56OV5DUu
 V5FlRJ7y/e5Xsrd+7BVTHr/Ls1z1rnZHRWwMQem2y9bRT5bftajyM0y68wrcrFn7
 +9HDE5OK4h0J5+FYmwzLOtbcXM91cmNHoT/lEzRI0ZNEHk9A2EZDxjbV3Y2bK7WT
 cLgFU5vVsTW8gBHJaRU6ETJwxHnHWme8hTnELcNognvKwFUZxeQqD7wHnFHNlNmi
 ok5eW8LWhQZ7ctE1/1X6WE338sAM6LtBgcE24sVRNqFv2YC5f8/WmTuJzqxXjStx
 WOi1dNYvl08GDlKta6aaQOcFe/Hg+NED8lA2OCcsl8eQUDJzDEU3dfaFg==
X-ME-Sender: <xms:nOhnYlO6T43SvmI-8GnUQfsZ0sK77VtpPOwhE63LC2KtZIqnNV91MA>
 <xme:nOhnYn8D09LAkhGuz8hWgpK6BLeG9o3lnupMDMDUHqMIjrNb2k6LqaNdj6bXbUheP
 PZ6pYlQMYF5X5EGiMo>
X-ME-Received: <xmr:nOhnYkTvcKtj6faYAYhfVITt3kpFzIHO7XjXCpEOObQFeUPPxosHjXdC2dxrlfivO_7q7jmv3Rzwn2Pl5T_xA9Hzksu1P-uBLdHDHmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:nOhnYhtkoEUnp9DVFcNEBIuk2zOg3ubTEhpsTwW0cqDgImtexo-R2w>
 <xmx:nOhnYtelYq6ykg_hGBCUTZw82cZxIeC9_mAhJ6NsdLhu6w4-vvsLng>
 <xmx:nOhnYt1iGrZDs0U6E6Oo7vToiaZHM3ZXtL8rgB9Ghd2Nv7GLalf_xQ>
 <xmx:nOhnYr1dnV8jRaS78NDiNhrOsQPEpJt6M4M7A6Toqje8GX5s4Foc_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:42:03 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 11/14] drm/sun4i: Add support for D1 mixers
Date: Tue, 26 Apr 2022 14:41:40 +0200
Message-Id: <165097689886.514433.12585444376028528668.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-12-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-12-samuel@sholland.org>
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

On Sun, 24 Apr 2022 11:26:29 -0500, Samuel Holland wrote:
> D1 has a display engine with the usual pair of mixers, albeit with
> relatively few layers. In fact, D1 appears to be the first SoC to have
> a mixer without any UI layers. Add support for these new variants.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
