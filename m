Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA30C4DC872
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 15:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D50610E04A;
	Thu, 17 Mar 2022 14:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FE110E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 14:12:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 96D2B5C0152;
 Thu, 17 Mar 2022 10:12:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 17 Mar 2022 10:12:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=HxgHF4M3Ba/f98
 ib2DzKmJmeea1CNubhnXG2BHGLKGY=; b=LKQmH3GnMnqrbU2CQITQ++5pyPVAj7
 qw8wu1sdwzR5u9sW6likJrE2tqCyO0T7dL+ynXn8R4wNPAWAY4jC5FTZL+P+2Gls
 lo/QI7reQAOROt2ZQ7YqTR2dAKrrBzC3pZLviFIoEZDToWl/kg76WpR6JsZnuATE
 uw9h5oWOrbq+qzwnDBYVSyzb2IWQIc2Bjqs4GAla7/0XpvfA+Z72HpSqehTrNQ4U
 kRkYkNBqiPnzFsD3RO+aRqx646Kn4lhUkNc35YJjRybMuciptjU723nVCSTKVHrH
 lFvrZo+6CRdoJs6MI9miNSl1DW8AJO8llrI6z5SgGb74s92DMo/SUldg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=HxgHF4M3Ba/f98ib2DzKmJmeea1CNubhnXG2BHGLK
 GY=; b=Txg0kZuD9K2hp3XZnOJQ7dfPWFcZjKRATA1VIYBvnA46ft/P1M/CtYEY+
 zHMysuTxxv6soMtVJz6AfZsLLoBetY2LoW9MJhbuiwzGlrGytOYWYL9yHuI/xITN
 d3eHuOqXawUhuDuAHhLzzj85n6jDXFK4jzBc39/JEIx/mdkecCmcHIsaoH3o4gTl
 jEJ0K1u+BG0c+4DjSLS51j0LlOrcgo+ej8/DcHotu64EdjHkRzkQuJsNV+WP9fG6
 GNvRCUyi7kRhZOCaTrStzYCePiVR2/X4G/VpPxFm5SAOQXjDefhgIGEASrkfOFEi
 sUQRoAdnHrkLLV5GvNJHdyGBxGzzg==
X-ME-Sender: <xms:2kEzYsQnlbUoZx4FdNMn_NOmf2RZ8LA6jDFDX2FQOjbQyzUiZWj8OA>
 <xme:2kEzYpwi4jqKKMaPPF1eLumrjLJSA5AItpWx6bqc9A-TE0fuouxC1-0jqVVk8hkV0
 1K5-rjxpEcaGqsSh8g>
X-ME-Received: <xmr:2kEzYp08kWTRKTk_Sg9DL1mTzTrAtqC2yrarqVwnign3S9xapnoj17afSKxwEjf2BpuBiQI_U7U5HsD9GS9ECmvAI251LrxlJVY4q9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudefgedgheelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:2kEzYgBJ65nKtZSiQG9BOmYv6Epkoqwgx9jQ4nVOcbnS81Fuix6vig>
 <xmx:2kEzYljZB3V8yRjzw8pHLJWqo3-zOqBe2G-GWuGLweOGLa2eCe7BCQ>
 <xmx:2kEzYso2ow-JRLPz6nIJZ77ZWWgLfXG3Qlv_DTLfqiYD7eB8HZyxbQ>
 <xmx:20EzYqvr66m8reRlVROEkjt-pDNgMNOb6R_fNLC23dTO8YKs5kS1Kw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Mar 2022 10:12:42 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
	Melissa Wen <mwen@igalia.com>
Subject: Re: (subset) [PATCH] drm/vc4: add tracepoints for CL submissions
Date: Thu, 17 Mar 2022 15:12:39 +0100
Message-Id: <164752635582.3758656.2417379768866246810.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220201212651.zhltjmaokisffq3x@mail.igalia.com>
References: <20220201212651.zhltjmaokisffq3x@mail.igalia.com>
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 1 Feb 2022 20:26:51 -0100, Melissa Wen wrote:
> Trace submit_cl_ioctl and related IRQs for CL submission and bin/render
> jobs execution. It might be helpful to get a rendering timeline and
> track job throttling.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
