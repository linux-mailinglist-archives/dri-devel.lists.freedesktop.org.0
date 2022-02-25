Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9594C4BD7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 18:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B67B10E865;
	Fri, 25 Feb 2022 17:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909BF10E89B
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 17:15:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F00DE5C01A1;
 Fri, 25 Feb 2022 12:15:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 25 Feb 2022 12:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=C8u8F6f8OEyPQC
 Zgg1pJD2jAXXsaNDEls631sgzlHDs=; b=V7bOqKwaDSdnIBL2Pc88YLe/HUVWGu
 P1G3fsYKLe3i9T2rmW6DGhVqK2wUot7WFraPWNTYnuFqaFTn2L5xPAQvhG387s6M
 uZTBS9JxUCUBps1Tnfcq4TFh+FN/5dgXidCKWiOdQVad69UsTbtQRg5iqmzaDtyk
 lwXOzk90lNvfTbYrd6iPACwFRDeAJVWk0kefb3k7gvri+WX//zS9H7McchgneGpH
 6+xrwZc32EAt0OJMqoqF+dAquXmKtH2xWLi95GHqMjuNU1s3hpSuZ4pHMvKXgyDr
 s1YrFIi72YFv/x8NAeRiauNhat6/d+UuRsilN+0CGiLvX5jZhEijmyUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=C8u8F6f8OEyPQCZgg1pJD2jAXXsaNDEls631sgzlH
 Ds=; b=OfWJ0Xp/wG/3ntGBbkBw3bMyJ47ZOGnwM0ynfqmoQc2lEYEVslc+l3Ayy
 PAbGrBFjt6Ni3lAoByJweqS1PWhQOcqBgkGKXNSNOxbC4tSOmJbrogM401twwApm
 2092OMFbjT1PwuERNgFaBZZ9QBTDzv9MR1Ym1bI/t7DivRVsj+tYLn9awlC7eiA9
 3NGhBDmXJqjvgsOai1/eBiRjBPYgeWKibBd9YyB4bN3WW7L8vGSaij/SZNfKf1bt
 UmVv4aln3ZiTmg+L2EYnb+4k44/NyMhE7ot4qL7M6tlg0DrlYji3uTTmC87qpqNF
 TsfS/uwPUbkw6cViRnlSbsmdt4e1A==
X-ME-Sender: <xms:ow4ZYn8iXtSRd8TI8oFoOpOGNHDE1_Ys1Nn7Z7z7YlatHwTXC9t4gA>
 <xme:ow4ZYjvmHDYyVH-J4vCom4EwxULPGmjGRBbRP2G2uKNH7sp1lT4E2gx6CUUtpKAKJ
 rHDS9zXYFd0eGD9AGY>
X-ME-Received: <xmr:ow4ZYlBh62DjqdjuUzWbeGJj5hNainQbd19h0T92yiakvJEeVicyAxtp0Z0xe2uL4kgQblMWhJnaLPGaUYKku1eCZTJFOQQFlxA6AIM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ow4ZYje7SRhBlgvr-ZNqiQAtdv31y8DBVO84LR8N-j20pRcaiHQqWw>
 <xmx:ow4ZYsPkjxr8n8ShM6h1oZVqtq3BkHoomOQ1LomfZ0cAbdnBTUhGRQ>
 <xmx:ow4ZYlk1dhXiiP5sMCOFoWXrWjYXFzsBgAYb0TBIdy-dq0N3mmC4-w>
 <xmx:ow4ZYtg9dcLN_LDk3VOFKoIgomd9zRhJE9GN5S5IGGvHxLNqRcYlaw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:15 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v2 22/22] drm/omap: plane: Remove redundant color
 encoding and range initialisation
Date: Fri, 25 Feb 2022 18:14:49 +0100
Message-Id: <164580928298.726994.16830947576876821160.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-23-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
 <20220221095918.18763-23-maxime@cerno.tech>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Feb 2022 10:59:18 +0100, Maxime Ripard wrote:
> The omap KMS driver will call drm_plane_create_color_properties() with
> a default encoding and range values of BT601 and Full Range,
> respectively.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in omap_plane_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
