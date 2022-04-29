Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31D7514DE6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 16:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E462910E47D;
	Fri, 29 Apr 2022 14:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1886710E3B5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 14:45:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6077B3200977;
 Fri, 29 Apr 2022 10:45:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Apr 2022 10:45:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1651243534; x=
 1651329934; bh=m4Mix+xZ0LdIgRpgPju9F38NAOYS+36zubs6DlYrG3U=; b=t
 0tE6t1OzJOp2y+C9k8GoqRFShTkEGmj/49UvQjHYeMJxVThuNRm430iQot/mMpY5
 lc8wKwoHX2zzRzPxow7X99ZZdQEscWK1djTsTkTdSrtJKFnr9ybSpC343gFoQvmG
 YXT8txuScHEgZSh3glgNJ5IAYw1r3S+ciep+TEwjgrHH+ahwbDHToA6BaerrAmLZ
 SHDQTLlGDZ1o1L5ohWeekfl5rU5y7leXn5iCcvI4jMUBOQI8BM05gf/krgQB7GmX
 g7JrPcagw0PA1N5jKI/YD4gpSCr5V2S2zSPJBNNvzvn3ycSVrNKrwBAuGhI9X2Ck
 0i0gqLd4Hbp0MeorQDuzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1651243534; x=1651329934; bh=m4Mix+xZ0LdIg
 RpgPju9F38NAOYS+36zubs6DlYrG3U=; b=clLB1Tej7fW4TQQIyLaVFcTmZ4HYn
 HX3FkmQ585wTjqbg+d08DBaK40wjgJR3LtPy3sC85HmVaUxoQeGn0krpGhlL5xSM
 hgZJmmjwJHzULZA+g1aN75yl2vbh3HQGXUZU5kp3JhQR2yC6JPXv5In2eG+faPm8
 Pc16ZNe6HTryUZNXlibj9aNvNm4F9OFWwcYYvLaWNbr2rEIWjCNTcFgFgkBnxYN1
 9fR2b768ntlzjjBSL6//Q2b9qjjnU0o6h/tP1+HMJ4ALqk0vQaWi1/wHF/hOqLUo
 lPLYh+KAIm6VNcN2AO6Nd3kjRYMLab82qOQzjvFNAYp6p4gigVmsrXZOQ==
X-ME-Sender: <xms:DvprYr5kUmEmHwLGVbWpiqi1QktLz8pAYWFhFflEAsP-hUC6PD7Oxg>
 <xme:DvprYg61tWHICTg3yFmmYlSIMbGKqIYHfVUTKx0Au8qyn8eHboQFegqvbaOONL2W3
 C27hQe_tOTzqtyvONg>
X-ME-Received: <xmr:DvprYicDUd9wGZrIfaDycj4oDcJYjgLuotkBfpOVhQiZEpD9C4-gjtPQz8SQQEKnjsArwKq0ZXrE6tXgVsOnQ_XmvQtAIAhjBgMFjTY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelgdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DvprYsLNKt0MzZMT9Dr2rQ8Puoll-qBkeQKoNfgbNsOYFNQx49PyTw>
 <xmx:DvprYvKrMccN04OPsP2pG02iGOFsGesaWv8nyc-z8yTSwey4Al5Mxg>
 <xmx:DvprYlw-oFAJNW-sKr6kprVqS_w8NbpRpu5pEA7LGsUbvrIy3KDUBA>
 <xmx:DvprYgXjdpYxvFVd9lkqyceUkPmwNN2CoPwOumV7NpWk5FM6x6Bc8w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 10:45:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: (subset) [PATCH] drm/sun4i: dsi: delete unnecessary IS_ERR()
 checks
Date: Fri, 29 Apr 2022 16:45:21 +0200
Message-Id: <165124351807.924095.4917503236588048711.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <YmqH71MtoGn2AXUg@kili>
References: <YmqH71MtoGn2AXUg@kili>
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
Cc: Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-sunxi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 28 Apr 2022 15:26:23 +0300, Dan Carpenter wrote:
> The "dsi->bus_clk" pointer cannot be an error pointer at this point.
> The check is confusing and unnecessary.  Delete it.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
