Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE09609B52
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6148310E2A6;
	Mon, 24 Oct 2022 07:31:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C0710E2A6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:31:09 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7075332002F9;
 Mon, 24 Oct 2022 03:31:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 24 Oct 2022 03:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666596666; x=
 1666683066; bh=Jjbu9JpIyS5CWKze1H/WOBDw+6BrnxDllrzE32pyM2A=; b=V
 8buIz1jixNkr35PMRGseRhW44dRYrPEwOxEYO9BX2M4O9X8EBWP80wZUAPdzIhTS
 6Z3ODm20WXMWoVDbbat6zBwSjdwOLag4fCoeoqUOwHrVvmTOvlhmftovFpDwWa+A
 p1ci8MsyqQWs56tfrQ9xIIha5co9nOr1kVqjf0dXBdBN5x+Xu2a8d9g7tOo07FYP
 U1gZfm7MosCZW2BNe6bYdeIF0rbH81NsOIfL7ihwlZDGr+hO3wt9DGtCDPv8h2BX
 yzy9GfT6wfXHoWrdMGd6rXu8vxwT5qsS50pChylVtk0EiAtnwZX3jHJQnXP4as92
 5Gppmo9kBmr2n53teijcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666596666; x=
 1666683066; bh=Jjbu9JpIyS5CWKze1H/WOBDw+6BrnxDllrzE32pyM2A=; b=e
 xqIxGFS54BYZ0dII9pSZBFttWOx9RNcCB63ydbcRqXmKBv2TM6zy0bbyAnhH1CUO
 g3cSFmuAWmCQ0Q0iBDKvWA+6xdZp15Rv5aSf5jVL/BEVRYKxNtH/n17dPaQ1rL/0
 9frOxLW8vGAUqbKRX4eTl5ggIOGXF8xty+9B6kvTC4+pi5dA8svuZslfQrgcUV43
 d6od4y5GdaHsJCTeYdjqJIWCxkBNOX7PcA4IXNQHzOEsDXOzTjfXiAOa2bzFsIV9
 zzgsbs4RRO9EsFKWOnfYa+F70U4kk3U127wFzYxoZUFv1oFMl06q8uudBhdpFjdl
 VcE6Y1q3tOc1DeS9g3fjA==
X-ME-Sender: <xms:OT9WY7p9AJwVQEmqn5ZXnIPgt-smgsXb5avN3HyEEYeyIyIu_if8WA>
 <xme:OT9WY1rAmFitzlJIvgew2I13Lacg-JkZ0IqEsB5nUc_7cI1wvJo9jP6AC7XYFIspV
 Bxw-9zc38VI4JlZLEw>
X-ME-Received: <xmr:OT9WY4MaM0xUrkmVVKz43JUcFssysOEz7n5RSPxhNAFuATdcQMtf7STAfur48bK4fel-6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtfedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevjghfuffkffggtgfgofesthekredtredtjeenucfhrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeetfeehfefgueejud
 fhueegffelteeuuedvhfelhfefjeetjefhtdfftdfgvdejleenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrth
 gvtghh
X-ME-Proxy: <xmx:OT9WY-5nO6tFm5SivglfFrYHBt0iUdGKW9Sf0SKgBPf4PbnkacQ_pg>
 <xmx:OT9WY67YVrfPNNn-QH2hxcmL4ZV5qVkOS-8ebT7z0ZchPKNb22TTnw>
 <xmx:OT9WY2gy9TuqChiVkvAWP3QL0Aq3Sa3kvL5KUD7sVz_6jvgkrA1_ZA>
 <xmx:Oj9WY5TBSuMD22MflRmdFav_7arvBkIZ8u8G3268iypECFgAQjEj-g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 03:31:05 -0400 (EDT)
From: maxime@cerno.tech
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Colin Ian King <colin.i.king@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>
In-Reply-To: <20221021084035.65367-1-colin.i.king@gmail.com>
References: <20221021084035.65367-1-colin.i.king@gmail.com>
Subject: Re: (subset) [PATCH] drm/vc4: Fix spelling mistake "mmaping" ->
 "mmapping"
Message-Id: <166659662709.12501.1270368575435453931.b4-ty@cerno.tech>
Date: Mon, 24 Oct 2022 09:30:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 21 Oct 2022 09:40:35 +0100, Colin Ian King wrote:
> There are a couple of spelling mistakes in DRM_DEBUG messages. Fix them.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
