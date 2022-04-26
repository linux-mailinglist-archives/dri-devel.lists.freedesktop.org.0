Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C753E50FD60
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED8710E926;
	Tue, 26 Apr 2022 12:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC92F10E70B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:42:02 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4A1575C0181;
 Tue, 26 Apr 2022 08:42:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 26 Apr 2022 08:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976922; x=
 1651063322; bh=5TNW38hCxzg7WdlOn392YteiUTV/VdH0KTzWM27AcVY=; b=g
 t08gYX90pYbZNX6tjcFV7cgHjXpzedU1rLS4HxGGlhWFsegpEIROPyawCu+SnKLy
 zV84QyVutHBcwxWiJUL76lnNyGlqJFCuj8floaQPBr8/8SmrFyzZSWJ+PhzsnSKo
 gpuUz5w1CZjkLxXFV8u1cbSd5B14KsAN2QlWgf4mzOUm9Q1GoD1MrBMyTpbO7kYz
 FY3yUqqDeIYQCIRwa4Qcw2/F4M8j7XirB91D65p+xFQRB8yGa4CnNIfiMwXYqDOr
 Fy2/ESkq3emcBXlcS5STsWn0/i5FgcYFQGwcolqPZCqEITZwYdn0I0d7ay0qcMS/
 Ov6fZqM9gZWAryNxMnpqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976922; x=1651063322; bh=5TNW38hCxzg7W
 dlOn392YteiUTV/VdH0KTzWM27AcVY=; b=GNh+w+lCSix8oM9nkRW65iHOBYK2M
 EllR4hRgKIkY7L1yOm5fNVfAeDOnpG2hTkg07IgTsj45quE3eqrlwekKaMdH12fQ
 z8KEgBPJNEZCxlsMnRnRuLWrP7elis6XfwPrb6ntBJbdeMs/LqYl8izxjDObCNR5
 HVRVUy7Y6tQw2usjCga8SVQuJNlLq/BWnKX5Xw2Am4HXTLMpAss3BKVlvm3/txNm
 5MJ/4ITbACjXwNPvRBY9oZPuYrF10JnvJ9+FXCYaDDIaakmQexKXCAr6If8ZbJBv
 LS/zb7SyfhoBj9UFo3wlBDK3jxdwCe3gyQNR1x8xZSm6Nz0JslVaTkyBQ==
X-ME-Sender: <xms:muhnYgI5Xef0aAl5SxJyKIdtzxUggtlhJvOf8nKB6Pbk09msoIhZkA>
 <xme:muhnYgIut9Vw6k0sEcuJW5UmNje3fu1pY-WKK3XmUv3hI-i3K4vXNhP7lSUhgiTbs
 a7sbFsuPEH236seyMY>
X-ME-Received: <xmr:muhnYgu7jK9gTyvGQDQYhv6DCzMaeuBdB0alOtkRsHjdNHUY5h4rkBH0h4uxjruL6hnLLOnL2Bd2p6vBiw7KCKUw8632JPTr7NTpjzc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:muhnYtbx_msdtKCwJnZmX9gPWNnB8yIr87ayKOpFla7JQgTm7Dm6Ig>
 <xmx:muhnYnYAX8rLUirTRgpWkOjMlDZuVlsyo-mxywbU_DzRWXHmrSjC-Q>
 <xmx:muhnYpDSi8Zyqdw3gPILEls_zBH1c7N0sO0RYxIkbEA6qnnVFxEdUA>
 <xmx:muhnYrR6z-uJQj7_FsXh6emIMZeTiArjuoY3tllUpMVTMBvnwG4QPQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:42:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 10/14] drm/sun4i: csc: Add support for the new
 MMIO layout
Date: Tue, 26 Apr 2022 14:41:39 +0200
Message-Id: <165097689886.514433.4736876690350493557.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-11-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-11-samuel@sholland.org>
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

On Sun, 24 Apr 2022 11:26:28 -0500, Samuel Holland wrote:
> D1 changes the MMIO offsets for the CSC blocks in the first mixer. The
> mixers' ccsc property is used as an index into the ccsc_base array. Use
> an enumeration to describe this index, and add the new set of offsets.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
