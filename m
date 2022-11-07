Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7355261F0C3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 11:34:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B7210E2BE;
	Mon,  7 Nov 2022 10:34:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F1610E2BE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 10:34:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 89FC2320093C;
 Mon,  7 Nov 2022 05:34:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Nov 2022 05:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667817257; x=
 1667903657; bh=IYxlHqoP9Bx/py7vlk3J000jbwGAbLCrg5awkhudSFY=; b=n
 4dufC3wXaF+29uEfUf0zvL7zy2kh9ZqJ/4ZXI7Gl/SCI38AkAp09PJA3k5eD4Gj3
 SfhlfbUUg4mxwsHtevL0JGJIM1XHUenKfQONOgyF/NmTqGFLTvmEmy58SVqqwgLL
 avzy9Hr4I+iPPu3Mr5vy86NHhGh1vVbc08TPHibSg6in7dn7Yu9iAr9tbfPPo73F
 3f2RT+LG6YQ9vH51knfcVzn+bnzNdSxJ7v96WimDDLhTWwZzHA1XGyUq/Rlef+dd
 hhpbfBEQNUxE1VHDfRhqOlFKtCqnrv9fDmWXC1iAbkpnqnO5DUKr+86b4jAp86ry
 j848c8QcS0XdeHPTVvmYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1667817257; x=1667903657; bh=I
 YxlHqoP9Bx/py7vlk3J000jbwGAbLCrg5awkhudSFY=; b=frd5ccb7hTH5sx5kX
 44v69wTrmDo0/H7LeogKuacff1L5a5dNZtwVmpJ0dz84s7wOmo6SG3G3BUvmMhaw
 II2yO3hNOss2Ni3Bg0JhhXiUD+WEggb4nnfGyhCbCO3wNctOh34/2MaHTJfI5V30
 C4/u5/+1sLoZmcFO0zfOpRXpynLfZ1j8mK1+8BC1zORV3PrN/erX1NAVj9pBziAP
 +W0Ad7aaXAPA4qqfPEGWGYuSEk12GSVUhlYOv7hoQRm9rWIc4oxtHJF4XfsDp5Hk
 s/6k22n+PGb63AZG+Wg0pwq1Om7cIqpK6HlQaXin2JvXWuVG94Rv54QpN+bi+I5k
 28y+g==
X-ME-Sender: <xms:KN9oY6WAEUZrOWYEivOg_qHUU7SZ-s07VDxmXqF-oU3RqX9lxlQBaQ>
 <xme:KN9oY2kgGoVwacW_ifxYWACQjUS4UfvBlG5BqMIffzrKFdPUZyveyKK-JAWxRTBUx
 eITR9p9TJekE4qBk7A>
X-ME-Received: <xmr:KN9oY-Z6agsk1mnA6xVK9bUQrF2LmBkXrjo6muV2Pq3F1NNH5YZDygUhCXrFQ5IHNbHWRZIj-w1iMS68ol4iUVE67ffi5iaUmM-Aqjqh-aiMHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfgjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptefhlefgheduiedtfefhjeejhfehlefgieduueegtefhtdehueejgfeiveej
 geelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KN9oYxVkrItQd_VA0Lpgm9zxnIrugz3htWQKAX3kLCgRCOdeeJXVzg>
 <xmx:KN9oY0k_8Q_uCxQMRjXF_WErntvh4WvM5Co6NuWmnTijFpxqxXRzRA>
 <xmx:KN9oY2ckxq7HvjMO4568Ja9hvpRXz5X_d22MFQvxOlUaXdjCKPHW5Q>
 <xmx:Kd9oY_81YSG1qTvBWF1FqtkSYCg1t0KZCJXNEHFb-LEUXAh1HmB6gg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 05:34:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: mripard@kernel.org, airlied@gmail.com, emma@anholt.net, daniel@ffwll.ch,
 eric@anholt.net, 
 Yuan Can <yuancan@huawei.com>, dri-devel@lists.freedesktop.org
In-Reply-To: <20221103014705.109322-1-yuancan@huawei.com>
References: <20221103014705.109322-1-yuancan@huawei.com>
Subject: Re: (subset) [PATCH] drm/vc4: Fix missing
 platform_unregister_drivers() call in vc4_drm_register()
Message-Id: <166781723834.2586907.11883659656401092903.b4-ty@cerno.tech>
Date: Mon, 07 Nov 2022 11:33:58 +0100
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Nov 2022 01:47:05 +0000, Yuan Can wrote:
> A problem about modprobe vc4 failed is triggered with the following log
> given:
> 
>  [  420.327987] Error: Driver 'vc4_hvs' is already registered, aborting...
>  [  420.333904] failed to register platform driver vc4_hvs_driver [vc4]: -16
>  modprobe: ERROR: could not insert 'vc4': Device or resource busy
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
