Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AFEA74968
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 12:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1308910E0A4;
	Fri, 28 Mar 2025 11:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="P4WfsX0h";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="J2mKnDhW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFD610E0A4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 11:44:47 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 717381382CF4;
 Fri, 28 Mar 2025 07:44:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Fri, 28 Mar 2025 07:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1743162286; x=1743248686; bh=bgXswIbMjn
 A/aMDEQsm4ZrPZ7vvhEhrgXQbINneJrC0=; b=P4WfsX0h8A4n3adLSi/2kD9Koc
 wzhiG4cf3L1B468n6wlttySyNW0Ukzv93z6De4Q+VdCbnC7xljJA5OogUhPlWXIf
 jzzC7bstIbmaGSdALz7W96Q9TPaV8GEqSOViDnAGS6fEA/xgJsVBgyFSPyo0KVtt
 RvQM+nnQe5EsYRZpFjhw9hej6rqBBJyCKqhrmt/HfnLgQ5I6+m1Dhdovh4grR5aU
 DfKYjinI//I5wG39t3etExZtj3eyZxSJTygyIJFKbv8lywzg0pmCluGjex+cm68Z
 Et/H9A1yh1LF2HhkDXDSoGtMshC5O0Yc0wm6n6cNh7emBlpFrW1byI3YGcdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1743162286; x=1743248686; bh=bgXswIbMjnA/aMDEQsm4ZrPZ7vvhEhrgXQb
 INneJrC0=; b=J2mKnDhWT6mc8281idWRL3K5oMqQXn/kVZJt40RAh4wI8LbNzbe
 AhrnQYU2dPGAeHCu4YMDJfbyUCrCrp2ovMfu0LWeB/Uhk06+BHuITS3OuF9LK24b
 6UKO58LDZDv8WOJxGoLuNrtWfVVJiRpw3iiu/bodAqUU1dKO+QMy5WCQ9fhuNwFI
 lnn9spCMmmJmj17t/SbC8OewzZ90ox935PTWXKdtrWCGsxfzVsIn/Cob4yfs8MUg
 zZW72sEmiwu+X0Q5+4tVymDayyNx23urK4HqquRsU4zrJfVTbRdtN180YjhAo3R4
 ZJaxy8WpY/BaAciQpKEcL7vDS7BxQeS5GBA==
X-ME-Sender: <xms:rYvmZ04NQjNpCjZCemWRMaKJUDQPQCXOgr36DbV-SOMxxE-25KMyhA>
 <xme:rYvmZ17a8Vo5ZbCt-RwJMHpFn5xuAxkG8Tw8qYb3Qgl0VJbeoVEQGUg4SMBSLWVBP
 T5GruRSQA2T9IfQR3U>
X-ME-Received: <xmr:rYvmZzfGMs0k07Jzh7UDCps4-U8RTXAabWkD75jzUZq3NLbvOkYv5f7lsuHTTXJyeEQ0eh8yx13GwOndi743bWfQpLguj1rAxA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeduvdduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
 fvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfirhhunhgr
 uhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvffevleegud
 ejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpd
 hnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehshhgr
 ohdrmhhinhhghihinhesiihtvgdrtghomhdrtghnpdhrtghpthhtohepfhhnkhhlrdhkvg
 hrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhs
 thhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheprghsrghhiheslhhish
 htshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
 vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeihrghnghdrhigrnhhgvdelseiith
 gvrdgtohhmrdgtnhdprhgtphhtthhopeiguhdrgihinhduieesiihtvgdrtghomhdrtghn
 pdhrtghpthhtohephigvrdigihhnghgthhgvnhesiihtvgdrtghomhdrtghnpdhrtghpth
 htohepthgrnhhgrdguohhnghigihhnghesiihtvgdrtghomhdrtghn
X-ME-Proxy: <xmx:rYvmZ5I7S65MjMkBPq8fRmm_CIFNFqNq8kjKgjDgAaJJHCp692T2Jg>
 <xmx:rYvmZ4JNaZAHANSovkUFtoiwk4NBlWub8Ompm9CmAmFusevv7Sge8g>
 <xmx:rYvmZ6xoN8lDdqEr3EQFgigCen7qYdE2U4vGxecy7MDT_PaibrLVjg>
 <xmx:rYvmZ8Kqz40ff1C47gaiZqgqAEvbJRzP_plgrRuRlO_SCCUImNJwoQ>
 <xmx:rovmZ9VkzrL-s7ymQgDaGvPISB-zXyx625B5ycTH1DYFcRGyBZ7VG-0O>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Mar 2025 07:44:45 -0400 (EDT)
Date: Fri, 28 Mar 2025 12:44:43 +0100
From: Janne Grunau <j@jannau.net>
To: shao.mingyin@zte.com.cn
Cc: fnkl.kernel@gmail.com, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
 tang.dongxing@zte.com.cn
Subject: Re: [PATCH] drm: adp: Use device_match_of_node()
Message-ID: <20250328114443.GA597674@robin.jannau.net>
References: <20250328170705401AXCIsIhOYGoIu8LDn_lj6@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328170705401AXCIsIhOYGoIu8LDn_lj6@zte.com.cn>
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

On Fri, Mar 28, 2025 at 05:07:05PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Replace the open-code with device_match_of_node().
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index c98c647f981d..0abb56ce2c34 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -553,7 +553,7 @@ static const struct component_master_ops adp_master_ops = {
> 
>  static int compare_dev(struct device *dev, void *data)
>  {
> -	return dev->of_node == data;
> +	return device_match_of_node(dev, data);
>  }

please remove compare_dev() completely and replace the argmunent in the
drm_of_component_match_add() call directly. Commonly
component_compare_of() is used but it is also just a wrapper around
device_match_of_node().

drivers/gpu/drm/arm/hdlcd_drv.c and drivers/gpu/drm/arm/malidp_drv.c
follow the same pattern so please fix those as well. One of them was
used as template for this driver.

Thanks,

Janne
