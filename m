Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2342528E6
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A13C89EA6;
	Wed, 26 Aug 2020 08:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D80CD6E934
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 13:38:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CED13C54;
 Tue, 25 Aug 2020 09:38:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:38:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=3
 wcQjRGLShGm1raIEqom+OIeoVvNYM8FsgyvofszE5w=; b=qoiOtbO8nKNuIebt7
 lZ3tzQ7kTQlasHD7jkcHbi91fx7bBi7ciVmaZlfRwE0LWxUcWEjNvSCdKqD1dwtS
 GFEi6yLlnyg41ljtamRinQhSo3dQnp3+sUmzHE/YWqoMS3cH3ZK4jVlCZKIW5i2X
 0dS8wz5NaJ8MR7av5XFrNWytbVLYeNlq3LvktvRjEoij3nzojMi+gXWBWOkxrvFv
 Br4mk0Jb1SMMdyFuAUxOuwhY2Dri6lSSgnQpXKlotcVXOXfnVRPRyUtRIypdrsh2
 fmkWByOV//ZROGVX/KjY1cqpJjhgVnFaUZ/avOd6AEDku19ekHw9yBhkT+4cgEyo
 i/SHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=3wcQjRGLShGm1raIEqom+OIeoVvNYM8FsgyvofszE
 5w=; b=D7ngUbdpoK8pQbd/pOzYVnTrDDkDyr8RrhXel5K3DyxwqzKpAHZ8Aigbg
 VGUTA8KB0fSPddxekGaZfObspFRG3JaIuW501aZGxO+3FM4pSSw+T5A3BR7oW1m8
 aMeeJCOs/5VejoDzzjXPtgnfARm/fllV8wjFJ3ZjEJPq6sZTkOx1eB3OR0W4CkXI
 nfUOe1foL9N80DnR7B2RQ8FNhjgVdQyqLa2+p0MuXZWX04LW5D90saTJY6RQUmi/
 L+petd5c26fgBN2xWYlxwNRafqY8bGG7Qc16TYqna9AGJa0lhPKqD5sd88ybeWYO
 nqWjAB4ByHzu2vTOO9J75GPglp2Hw==
X-ME-Sender: <xms:bBRFX-KxFYOIKEZNN5nnwp6km6ManfuGBk2BG0xlVp-1T-wO8dp96g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefgjeettdejgffgffdvteeutdehtdehgeehueetkeefgefhtdetjeekledu
 gedvudenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bBRFX2LlW47bPGlCTPrOjWUen5TrgfLzYOJ8Bvp52o04zJ_RFa2xbA>
 <xmx:bBRFX-sO75bnHnKL8oxU4gZhAE8m7UrH35FQ1BKBQmBrD6u2QrFthg>
 <xmx:bBRFXzbot9puVUGQpLQXHy3ArJ7BCAnL3C8Yw9EN-VvVSLV68Yzc9Q>
 <xmx:bRRFX4zDRt_FELksFLXW-Mq5_53bCncecCyz0NXI5vcyR1y_Mg8hyQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 33FEE30600A9;
 Tue, 25 Aug 2020 09:38:52 -0400 (EDT)
Date: Tue, 25 Aug 2020 15:38:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Yu Kuai <yukuai3@huawei.com>
Subject: Re: [PATCH] drm/sun4i: add missing put_device() call in
 sun8i_r40_tcon_tv_set_mux()
Message-ID: <20200825133851.scnipngfpm6jyje5@gilmour.lan>
References: <20200825114403.1392369-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200825114403.1392369-1-yukuai3@huawei.com>
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
Cc: jernej.skrabec@siol.net, yi.zhang@huawei.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Aug 25, 2020 at 07:44:03PM +0800, Yu Kuai wrote:
> If sun8i_r40_tcon_tv_set_mux() succeed, at_dma_xlate() doesn't have a
> corresponding put_device(). Thus add put_device() to fix the exception
> handling for this function implementation.
> 
> Fixes: 0305189afb32 ("drm/sun4i: tcon: Add support for R40 TCON")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>

That doesn't sound right, we're not using at_dma_xlate at all in that
driver?

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
