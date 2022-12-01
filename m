Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0468763FAD2
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 23:47:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1F310E189;
	Thu,  1 Dec 2022 22:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8BC910E189
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 22:46:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A78115C0131;
 Thu,  1 Dec 2022 17:46:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 01 Dec 2022 17:46:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1669934814; x=
 1670021214; bh=JWI3q/Uef+C/z5qB54q7E2tP70oFne25sE+hmm9bXDM=; b=V
 PvcBu1nbDxTLJBxnGsfGDiCZGHk8ld2jOaU/6bYqD6pI5hsbhJo0vS/rs0csHAZU
 WJ47AVMbyjpkDsAoGY3FHLZu1G0yXfiAyZrpMYFWgyGjGPjWY+p1ZxmIT4+WSONg
 Ick4lFVxpQ2Yu8yF1WwhJXizeG6PP3f+YL8gsIvpTKlGNjMmAbiP7AyUBnN2Jrrn
 hhVlwCtlk3cT2KIh3uZfsL6YL5YtUROUel/Vuq849pDh9GvK0sOPzFlI96GJE3Iq
 kI5D7yRdujSr7hlpN/+Iyhhy0cQUFOdWYA5hJMCpxrUi8pxc7IQhWtLcfxXYTwox
 mCUUnZGF+Kvb71vkHO2eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669934814; x=
 1670021214; bh=JWI3q/Uef+C/z5qB54q7E2tP70oFne25sE+hmm9bXDM=; b=i
 Y4/c7Hyo/f0UVe/casVuQl83VDx13MX5Qbn7k+inDIV7wO++DTKl3piOm1VCboiM
 jorf5krxmDu8lpKkUowIB27Gve15pcKGg5yY9qybGaFuYeNPaqw8TXZf0Qeayo9o
 ZXicPyRFmfZ6qArRipIwoNv/ijHrVClwCWPuQv57phI6btQoBcp551Qzjz/gH2JA
 lNC8/sfWInsyQYDLThOmF5ogNRESx4vOmmWr7mIppylAEJFfIow9XqxUdOpyBpn5
 5saie7mAQWqUPwNqnWuHl/FdBkCaUJ83BPMzR7k17LunCWyptKKqzR9e307u1spn
 BdVO+2NkZVo4IaASqMztg==
X-ME-Sender: <xms:3i6JY2CISHnzGDmAASSe2eckC-8WkEA7jJ1HRTqaeVJLgl6yOQZiYQ>
 <xme:3i6JYwht3g6U40wYG7nJ6DXMW7A-aIvKlv1fG8bbolLyvYg2eOBUTJXuCFkPFB2Gw
 rvRxTnYvyrqK2Yj2wM>
X-ME-Received: <xmr:3i6JY5n0aZVy9k2HDUSCsSqz0cosWis007WHpoQqFmeSAcJ6zImwcVG0PUVU-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeigddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepfdgmfdfo
 rggriicuofhomhgsrghsrgifrghlrgculdggofifrghrvgdmfdcuoehmrggriihmsehfrg
 hsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepteffhfegvddvgfeutdetheff
 jeelhffgudefudeujedvveehveeuhfethfdtjeffnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrgiimhesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:3i6JY0wHzj-WWxfNPFSwPyCpKhzBNla79l0BLfAxCHPL0Fo_Yoh7HQ>
 <xmx:3i6JY7QnmyNzs_VkBIQYiBBR9Nu_M7QbGZPNl4dDYLW5FSZNsuexHQ>
 <xmx:3i6JY_Y7ksG6QdjwLEfl7cW-3oYwd5VKOZeYY4hQizgfja8jgW9VzA>
 <xmx:3i6JY5OQfoHbjwagQH9xv00DKIByWl6TUXEEds_Q5t4fAinWeWap9g>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 17:46:53 -0500 (EST)
Message-ID: <9422089e-69d7-e8b5-a54f-427b6d699104@fastmail.com>
Date: Thu, 1 Dec 2022 14:46:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] drm/vmwgfx: Don't use screen objects when SEV is active
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20221201175341.491884-1-zack@kde.org>
From: "\"Maaz Mombasawala (VMware)" <maazm@fastmail.com>
In-Reply-To: <20221201175341.491884-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com, banackm@vmware.com,
 Nicholas Hunt <nhunt@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/1/22 09:53, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> When SEV is enabled gmr's and mob's are explicitly disabled because
> the encrypted system memory can not be used by the hypervisor.
> 
> The driver was disabling GMR's but the presentation code, which depends
> on GMR's, wasn't honoring it which lead to black screen on hosts
> with SEV enabled.
> 
> Make sure screen objects presentation is not used when guest memory
> regions have been disabled to fix presentation on SEV enabled hosts.
> 
> Fixes: 3b0d6458c705 ("drm/vmwgfx: Refuse DMA operation when SEV encryption is active")
> Cc: <stable@vger.kernel.org> # v5.7+
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Reported-by: Nicholas Hunt <nhunt@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> index 8db61c541a80..e1f36a09c59c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> @@ -926,6 +926,10 @@ int vmw_kms_sou_init_display(struct vmw_private *dev_priv)
>  	struct drm_device *dev = &dev_priv->drm;
>  	int i;
>  
> +	/* Screen objects won't work if GMR's aren't available */
> +	if (!dev_priv->has_gmr)
> +		return -ENOSYS;
> +
>  	if (!(dev_priv->capabilities & SVGA_CAP_SCREEN_OBJECT_2)) {
>  		return -ENOSYS;
>  	}

LGTM

-- 
Maaz Mombasawala (VMware) <maazm@fastmail.com>

