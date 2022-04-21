Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF465098B8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5203910F50B;
	Thu, 21 Apr 2022 07:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D82910F510
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:17:54 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C5C283202148;
 Thu, 21 Apr 2022 03:17:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 21 Apr 2022 03:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650525472; x=
 1650611872; bh=oh+lVDVP/+27nOibF7WypJ0chLiLYDN0nl1H1n9lLY4=; b=d
 m77TTH1JWJj7vIQaF6775W/n2C3zNfwTPA4k1KzdGZ/s/z9MWZTo+eQt5AAvOf0X
 KM/i2AI78xvPMfO2Xgtxwin1fRGcfQtvuVQyqbTU1ZDsbU4kDhIhCTAJ4DbvCTHl
 nsQnH7gT1NKPaY78oy1kxwA+x8e+8wt0M9Gk+85bXZJ858iodaVNA45RXShgTmxX
 B1WJL/60OCFk1h4vAm2rVBaA/A9f+IWKOEdH3d9xC++biOvt3lkKA3EzLftXmqS9
 gL5rJldx7+6fuytSy9ELE9lqxxhTrmfPjt8QWK+dsQ4fwjjzPPpqIxy/PrphHz3I
 diYpbvG8gpGQ4yfWt49yw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650525472; x=1650611872; bh=oh+lVDVP/+27n
 OibF7WypJ0chLiLYDN0nl1H1n9lLY4=; b=TUXHqZmxiybHQlG5Re/yiFFXKW5Ne
 ayAp8vpntOwyFfhnaIyjEZn316OP7J94SfOrd6yfcNbBNSBYIU3VgxIIO2rcundV
 C4gojKFbBI41pqE7WbC7lowTUqvttE6WFGPAXx6ZScTOsDfAYd6H2nJ03jvVVvQY
 vIRTcIPLGzvCn/p+xQofJS6Phbxe4B6aA2slIge9GIs8d7FiCPQJ8qbWf4gTScd/
 /1/A2BguGhF+vf2lLgdR16uBtByKnpVeSHpde+e3y02mmmd+ZilfkGmWgWByPRXK
 /KUXlUSzIgUN4L3uw5CmgLrWC5oLjIRxpJYFq/MB1+QrpH1Mv9jGMdihw==
X-ME-Sender: <xms:IAVhYmVD3wqlDBDL4noa9nFVnCNc7s54_mGJV9G3Rhqex_poVpVaQg>
 <xme:IAVhYimMrjarDNVWZOJw0MianACWyazj22IWpgDnPzq0426Y7lIFa2pwAYNlQjg49
 fZ7zbeX6IMqC3Fvd5Q>
X-ME-Received: <xmr:IAVhYqbbatVz6ZMk33APCLJqqVKz0Hy8yHFfs8OGHTRjOfg0o9raKiBfU0dQaJ6_xr1VuCdFPqWhYAfLRuWwEIUNv6flJuSkyvIEYFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepueeigefghfffffeifeehudeiuedvteegueefffevgfetvdffheehkeff
 vedufeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IAVhYtUVwpVmwVSik2PzA9CsjBHtcr70uX5t6vkPLLv56a3Eg6KoAw>
 <xmx:IAVhYglu4DXVGVXV_B2tBpCcTfsFmPzP-yP6jN-kovfSkvwRjeJyiA>
 <xmx:IAVhYieMnVKY424ui8T_ckFxUddF6VhNtYgfnSvgLRdH8Q4FGh1LlQ>
 <xmx:IAVhYqVyZxTByrIBeveoLcvvoGT7OSddT89AjZR2CKGnCdJAlJBN1g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Apr 2022 03:17:51 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Miaoqian Lin <linmq006@gmail.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>
Subject: Re: (subset) [PATCH v3] drm/vc4: Use pm_runtime_resume_and_get to fix
 pm_runtime_get_sync() usage
Date: Thu, 21 Apr 2022 09:17:49 +0200
Message-Id: <165052546651.683267.17613165683277248005.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420135008.2757-1-linmq006@gmail.com>
References: <20220420132814.3sy2ojw3dxnd5tcz@houat>
 <20220420135008.2757-1-linmq006@gmail.com>
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
Cc: Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Apr 2022 21:50:07 +0800, Miaoqian Lin wrote:
> If the device is already in a runtime PM enabled state
> pm_runtime_get_sync() will return 1.
> 
> Also, we need to call pm_runtime_put_noidle() when pm_runtime_get_sync()
> fails, so use pm_runtime_resume_and_get() instead. this function
> will handle this.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
