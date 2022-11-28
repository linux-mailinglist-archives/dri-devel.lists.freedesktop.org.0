Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF363A6AB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 12:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F203210E1FF;
	Mon, 28 Nov 2022 11:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7612189FCE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 11:05:27 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CFF4D5C0144;
 Mon, 28 Nov 2022 06:05:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Nov 2022 06:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669633525; x=
 1669719925; bh=Rf3ZjGEGKA5kHa7eXOEzkwH+9SzSyay2x/tWTtN2v8o=; b=V
 xLjlwbcdPxxHHCyoRYJA2o5P5MyNz9b0mTHtfpmEg/+WcDRodcCkYEPCRk+SaPno
 Hn+BF9LsfDFh9doydrW3pXkKYdbxtzlGqnpL6nrWQ4/JS3bzCzhISrQUS2UMPa1X
 BEXIabO6AyVeNCnSn8ND5KnmSqThg0pwTuO6DRuI71wHqdxYTN44l30F5oJ6xo11
 +n37C9eW+by1wB1p8hl8jRzbHrOnv1SdzGZW2MxRzKZvsyk87iCRwAaQdJzaGvlk
 brRIq2fEkCnXODUeU7bfHQpzXKKKSxNYyG43HvMYN9ZfgmSmmcXNFwwG2wHoJGXY
 R69KVG3X+h/ANS4C7l8QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669633525; x=
 1669719925; bh=Rf3ZjGEGKA5kHa7eXOEzkwH+9SzSyay2x/tWTtN2v8o=; b=M
 sA3rjo84o7MdDBM1E8JHcxOKh+ZiPAi1HqkC5CZ0Xb4qeGueP2JeQznqQksrcn7P
 yTfA2qZwWVjk/zcWjqDDy7OJWG/dUbqgDyALnXyGcKYQAwqFRzl/t8jOTVu4qis1
 erUQLprdODVrLdzL0U9x+1z6uWKxYDs9ul6p1tPkOXai8mCjm2OWYYaYGQZH54dS
 RKSOrCAoIKLkhhMlixSAKLlDc8PBqkvdEBdKOBOXs55TbLpiS/wjPteMg2KmwBY9
 fj6KghJVC2grzrWilgcBka3hNt7MMjxyzu8cNZoSZi/krJuO4+tRMP5KROeMb61J
 V52+gLH3HSeGNGb/i965w==
X-ME-Sender: <xms:9ZWEY_rJW7zSDbVdp7JSZ2vAYUihjL-HT6seIHNfvYUm9p0ODJtJvw>
 <xme:9ZWEY5q3-fDDHUJyNUrdH4VKc4Z9MpciNrq-hpPllaY2pUTtWJKt3vtrHFOciGQJP
 Z9eieG0IdlU4CDWdQo>
X-ME-Received: <xmr:9ZWEY8Pgn7pflpkAVj4ZP2AfYnifv_4bSBz7cthDsV83eVjOVaNbqwmmDb8Ofy0o8AJEWyZNBLAp6PX4RrY3tIvqGDvDF1jEqpMeOKvIOEceLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrjedvgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeuieeggffhffffieefheduieeuvdetgeeufeffvefgtedvffehheekffev
 udefieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9ZWEYy5RqaxveMi8fQZODDs_TuvTtc0uqgeKc32792yhWM7nal1ryQ>
 <xmx:9ZWEY-6ospmVe0gwlTi0opybCLUPXkJSoCCNirAqoXSyQASOGYPkGA>
 <xmx:9ZWEY6hdJpW--CaP3Ym8GMo32NQv_rLhQAP8hOsAkGMdtRNsrK2hCw>
 <xmx:9ZWEY6rAuEKsXmwIqY-C5-ove4aXjS7sGiOoTFlBFLlB8o0fFJaZOQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Nov 2022 06:05:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, eric@anholt.net, airlied@gmail.com,
 bbrezillon@kernel.org, Shang XiaoJing <shangxiaojing@huawei.com>,
 mripard@kernel.org, emma@anholt.net, daniel@ffwll.ch
Subject: Re: (subset) [PATCH] drm/vc4: vec: Use pm_runtime_resume_and_get() in
 vc4_vec_encoder_enable()
Date: Mon, 28 Nov 2022 12:05:02 +0100
Message-Id: <166963342298.56696.1107537656293826180.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124015113.18540-1-shangxiaojing@huawei.com>
References: <20221124015113.18540-1-shangxiaojing@huawei.com>
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

On Thu, 24 Nov 2022 09:51:13 +0800, Shang XiaoJing wrote:
> Commit f0601ef8631c ("drm/vc4: vec: Protect device resources after
> removal") add fail path for vc4_vec_encoder_enable(), and will put
> usage_counter only when pm_runtime_get_sync() succeeds. However,
> pm_runtime_get_sync() will increment usage_counter even it failed. Fix
> it by replacing it with pm_runtime_resume_and_get() to keep usage
> counter balanced.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
