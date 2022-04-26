Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C24150FD5D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C397F10E8E7;
	Tue, 26 Apr 2022 12:42:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 667F310E893
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:42:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B70EC5C0179;
 Tue, 26 Apr 2022 08:42:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 26 Apr 2022 08:42:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650976929; x=
 1651063329; bh=Wb+25M7xx2p2SmeIdQwbkpvz636pV7/mTVUJPzyS+Po=; b=X
 CwdTWP4xEv+ypybCM2kUm3obTHGWQ5rJBAJAW+ZAxaU1A/BDl+3laeEd+LtDHSHQ
 teYu8V2/nvHg+OAT6JmpU+2Tqz/SQ6tKsQ8baQTxAx930PS6onRbbKsP8odxqwdM
 hrt82dBgSuk546/wjyLq3A/Iy9YbiPtIhEHbylln4Z9GAJJpMHFOtL+FhvD8VcSc
 CfwqG9sZfkXbNBY7uTLxIgopDDe6xtH4MICgzWgd7fM2d8/2HKqaL99nVscPz4sf
 mdyOiwh6+4C6kyvBbmqF88tidILRr7WxdUqVT+L2+qsWHJYrgVQ8nquS3BJTzfJJ
 RdS4B50gABUuw/NoyG2Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650976929; x=1651063329; bh=Wb+25M7xx2p2S
 meIdQwbkpvz636pV7/mTVUJPzyS+Po=; b=NGo9Lv01NdmncPtJ4qzak6Gv3X2ts
 yKGLjKzUzWIA/jo4QyJdU+v9yDMVdT+hYynv472i3Ox0gHcOfuEae8ZvVdKrWsA0
 0GVKmvh/HsFnisBzm0sgV7Fz5M0rof9EKNRNau6GSNTBKRBABfJ8Z18AswMfVmH6
 0QGmO8mMbz3R9bxXtByDPrZrwnwlEZR8cEzupDg2CtIKUXNn1qYoU7sB53ycY3k5
 OIJ2bO2mkIugO3CMxuYy8iX6gBAEMJ9QyVbNwBIo50D8Bt5K05dR1/OldrqcBXNL
 PNdTteckD/0dAocqoy5oBtq69cwt6OjJHtAG6n9we2DpEVl3iJUQe0aew==
X-ME-Sender: <xms:oehnYouPhN80lOT6fhcuz_38FtC7R1ngoB4_J8wSLZOgMmCmyExszw>
 <xme:oehnYlccgmpN4Ff3nAmecA3iCGwOCHSzcNdlBCHS_ToXkf8HxQU225e3-uOK9GqOU
 iB1p2mEUTZd8Ny0rBI>
X-ME-Received: <xmr:oehnYjyTcMhRlQ0F48Ka-CzmRm5Dq1726a8yNNgSS6XL8dO9u5au6yr8osrPDXIKbhBwCbgzxuFAUE0V2DuJp51tw7IXUb2QUzXdy3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:oehnYrMEaoRFrkd_VbEp9CcFuHe2mjW3eg0NAwTwPl-JQCjo9-wZKA>
 <xmx:oehnYo-WpGz294-KVmcTAlLS5OTS128wWkeQ9cXmc2VQkcieB9p1Dw>
 <xmx:oehnYjUxE3BAfYId7ikrOGKXlsYFjep317oEPdAJ1GlgUghGUMoQjA>
 <xmx:oehnYjUXApa2d7Q0tuOqT8FcuV_o5vuTF3Y5IJfZ5X-BUPGEZS0rxA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:42:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: (subset) [PATCH v3 14/14] drm/sun4i: Add compatible for D1
 display engine
Date: Tue, 26 Apr 2022 14:41:43 +0200
Message-Id: <165097689886.514433.18208103148925115786.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424162633.12369-15-samuel@sholland.org>
References: <20220424162633.12369-1-samuel@sholland.org>
 <20220424162633.12369-15-samuel@sholland.org>
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

On Sun, 24 Apr 2022 11:26:32 -0500, Samuel Holland wrote:
> Now that the various blocks in the D1 display engine pipeline are
> supported, we can enable the overall engine.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
