Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7855A76504
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 13:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6B210E3D9;
	Mon, 31 Mar 2025 11:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="uYzSHDLT";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="P9u4JZ/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E02D10E3D9
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 11:34:35 +0000 (UTC)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.phl.internal (Postfix) with ESMTP id 96243138440E;
 Mon, 31 Mar 2025 07:34:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Mon, 31 Mar 2025 07:34:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1743420874; x=1743507274; bh=9+6HfTUJJr
 4nmVrmFlGQYtIMuov7i8x90UU1hsBwAwk=; b=uYzSHDLTNm7iIL8QZLbp4HypKs
 Odui5y+2SuxJivh4Wz1s5I75GN0xYVZ0jyvEU7LnQW6J4MyEkRiGxGCh0DIgFZ6y
 7TgtwYYX7tMz9ax+VPOPZvWB6bywwjlcfVYtTFVAEBnuspipyX5WovK7bGK2t8Mf
 fNHIBS48xc/IIJT0NKsg/5cy4hoKsh/1kp7wy9YtX2IQnu/iVPLUlMoiya5E1FWe
 T3S8GU1Im1BsRBDlhTHmCRS0pr99f8QEoSellYWhXNmXQhLah8V+rxvsG00xUd4d
 P6AkjzL4hNZAyWfc9Pt3Y+dLkiy40C1KcLVEZLT7QRQ5sDXXfJClul2KGE1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1743420874; x=1743507274; bh=9+6HfTUJJr4nmVrmFlGQYtIMuov7i8x90UU
 1hsBwAwk=; b=P9u4JZ/E5p/LPH1RFQRw8EXo1cDPkWfohL2ndb+B1MPjjjjR+yV
 S/vKj2kDHwY4BPqng6nUUUKJ14UheqwI3fPZgVstqHjNQ3msEABvdhJmWKA1aeFv
 pUNuv6iYBjh4CDCfLeGlaGL81OImW4V4Cm/UmkInVS3vIryGpV6lpHvFRKQ1fAKY
 l/hEm8slosd1pKsL542stSe8LiZJ9ekKOD9SejMNtVe6QBXUBppP6g3y/GEQHRbt
 Z552Zx2GeaCIC2rTP4zSRTrFKWlG3ygsbvoKEthbJ14KxrNmulxolAcEzPKwU2k8
 xMPdkCKrifS/J+NDMLiA5rRCjunqHbtVcmg==
X-ME-Sender: <xms:yX3qZ2IrMtE4ziE3Sja65Kk0pOed8O-sgGh8PfKpDUk-uTUNOSHvWQ>
 <xme:yX3qZ-KgpGfK-C1CgD9v2QtUzRYvpFc2GHFYQto00qsGRcpdK3SmPDorgZm-OtZQh
 lUc6F6ZQLIQnO71wyw>
X-ME-Received: <xmr:yX3qZ2vkW01-yt-VhmdrSni9Kx8E5ue7BbKKwthaX20305tY_TemNyYwYRzqtwTavPh6qLH92KBjh9A-AhkC650jgPEuhA35dQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelkeduucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhf
 fvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfirhhunhgr
 uhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvffevleegud
 ejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpd
 hnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhh
 rghordhmihhnghihihhnseiithgvrdgtohhmrdgtnhdprhgtphhtthhopehlihhvihhurd
 guuhgurghusegrrhhmrdgtohhmpdhrtghpthhtoheptghhuhhnkhhurghnghdrhhhusehk
 vghrnhgvlhdrohhrghdprhgtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrd
 gtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidr
 ihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrgh
 dprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhi
 mhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsth
 hsrdhfrhgvvgguvghskhhtohhprdhorhhg
X-ME-Proxy: <xmx:yX3qZ7bP3yAWS1RmT2r2TKaytqtPfQv-xMlVxInmDbwjpXMOgHb70Q>
 <xmx:yX3qZ9a49J8_rETxv7LGlw8lP2qK5DfY2IrYtFtwOc13AR5xavNMew>
 <xmx:yX3qZ3CTcXMOO-rCFfY0in_eBkhsjAmcAtVwdgTbg0b2r2zu2u-M6A>
 <xmx:yX3qZzb4r68zmOoOC3u0IiJFMwt4_kc94suGi0814VWxAuG9RAmzcw>
 <xmx:yn3qZ7yANoCmkr3mCisPpjMqdzVKabDvQohhb3bqlP8t-Cv6FRI_PHc6>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Mar 2025 07:34:32 -0400 (EDT)
Date: Mon, 31 Mar 2025 13:34:31 +0200
From: Janne Grunau <j@jannau.net>
To: shao.mingyin@zte.com.cn
Cc: liviu.dudau@arm.com, chunkuang.hu@kernel.org, fnkl.kernel@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
 xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
 tang.dongxing@zte.com.cn, tzimmermann@suse.de
Subject: Re: [PATCH 1/4] drm: adp: =?utf-8?Q?Replac?=
 =?utf-8?Q?e_custom_compare=5Fdev_with=C2=A0component=5Fcompare=5Fof?=
Message-ID: <20250331113431.GB246397@robin.jannau.net>
References: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
 <202503311728456105AyS6yPwkx8Ccwv6GviVL@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202503311728456105AyS6yPwkx8Ccwv6GviVL@zte.com.cn>
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

On Mon, Mar 31, 2025 at 05:28:45PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Remove the custom device comparison function compare_dev and replace it
> with the existing kernel helper component_compare_of
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index c98c647f981d..32350c1a5c1f 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -551,11 +551,6 @@ static const struct component_master_ops adp_master_ops = {
>  	.unbind = adp_drm_unbind,
>  };
> 
> -static int compare_dev(struct device *dev, void *data)
> -{
> -	return dev->of_node == data;
> -}
> -
>  static int adp_probe(struct platform_device *pdev)
>  {
>  	struct device_node *port;
> @@ -579,7 +574,7 @@ static int adp_probe(struct platform_device *pdev)
>  	if (!port)
>  		return -ENODEV;
> 
> -	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
> +	drm_of_component_match_add(&pdev->dev, &match, component_compare_of, port);
>  	of_node_put(port);
> 
>  	return component_master_add_with_match(&pdev->dev, &adp_master_ops, match);

Reviewied-by: Janne Grunau <j@jannau.net>

thanks,
Janne
