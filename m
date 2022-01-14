Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ACE48EA6F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 14:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D5810E2A7;
	Fri, 14 Jan 2022 13:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBC210E2A7
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 13:15:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A14385C00F7;
 Fri, 14 Jan 2022 08:15:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 14 Jan 2022 08:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 s5NFdGeraYGYTX3ECjtHqze22e4ZVJLmziZZwnrxWWM=; b=GGN2/Gvz4mBeyZjM
 vjwimBFMpu4PtmKqqjU+o3wIQaWlHGWWuvDLjKXBvTngtWyzUJPHbbTpdGfaXCCy
 4gnE48eqkq+phV7VfGYB/A57ZFojatRPmPKE9Fh1PRFzbQGLGcrtkDmlvh03KJuI
 gDHKnIdtjFTALtC66IyriL0DLpuBFVQL5ICeHrHdeRrm8PRvj/r8GPzfzsu5w7/u
 Cp1kTZE6CgQqamNyBZY44ZLnDtCLtziNtsHfJC/t02hYt3gY76todU68iZvmR2SV
 mqi1YAkjN06FPdXW5iSlCSFizxxgH0KwBYrFpz27AChN4ja+50ID66lq04oxI0rZ
 CRWg1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=s5NFdGeraYGYTX3ECjtHqze22e4ZVJLmziZZwnrxW
 WM=; b=HXb+LuFjDml9IjOqxx2b0V0UO6VA23X9lx3HUjXQLZbnYjHEwC8IQMeHk
 9hyyc74cC9t0p/s7jGxraxrkD+mi6IwR2rM22RNz6eN+WjyOOxwI/RORzlg85ISs
 YKFLqh8FdRu3S8jFTzlMpIgC8Pkf/1KqIt2BLMLY6uZ2JUXbpEBRj3T5dWu6PwBk
 T1IjuAaOAalCEa3NfUUCIhZi4QuaWskes+V+r3MKyUoFfSiuek3hr32MueekS98W
 Zlr0d1FAZvk+v9Us1HZ48Z0VJXM6kSABN4LCm503clcnjXHbEpve7utvjmW1Z1CD
 Jfizu05ABQYm5fl3TyOc2qUz6hHYw==
X-ME-Sender: <xms:gnfhYR7NwbZ0CTHeNs2lZUNrp_5gL0kPTcZpXHPtsQKNLkM-q7J5nw>
 <xme:gnfhYe5la1LUv18QPQeCxt5IWEmwi4f-GLhi4f5aZ1r-DLZBSRH_ZrDTBlu8JEBA3
 Hsyw-lGBIVBTsg2WaM>
X-ME-Received: <xmr:gnfhYYeSFugeAdIdFy_AmTOm-7AwKCLjuJELyRVhT8cgiH8kJ1WAy8t_T_faQB5VOQQbU_HND91vvy7uoncsBLLarEXKt2MYY_OqJ5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdehgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gnfhYaIZmYQXwzmixXpeGkZBD-37ZscbQHEK4VlLwhpjlXpQgcpbfA>
 <xmx:gnfhYVI601t0OKv85yuKIGioKXjDl9X3J6uVCg4ajGM0dyLXZlBpPg>
 <xmx:gnfhYTwd1D_ETMsl190ge5AGlkkALdaH_i6DRkCXvsn6Yqwq_WgEZg>
 <xmx:gnfhYc8qu1dYTSLag23s-JnP_eDpLuroYvbHQoZy-qvjRW2mXkaSoQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jan 2022 08:15:45 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@linux.ie>, Colin Ian King <colin.i.king@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH] drm/vc4: remove redundant assignment of variable
 size
Date: Fri, 14 Jan 2022 14:15:43 +0100
Message-Id: <164216613944.47574.10826927845700954933.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112232036.1182846-1-colin.i.king@gmail.com>
References: <20220112232036.1182846-1-colin.i.king@gmail.com>
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
Cc: llvm@lists.linux.dev, kernel-janitors@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jan 2022 23:20:36 +0000, Colin Ian King wrote:
> The variable 'size' is being assigned a value that is never read,
> the assignment is redundant and can be removed. Cleans up clang-scan
> warning:
> 
> drivers/gpu/drm/vc4/vc4_bo.c:358:2: warning: Value stored to 'size'
> is never read [deadcode.DeadStores]
>         size = roundup(size, PAGE_SIZE);
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
