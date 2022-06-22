Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB25554D6E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525701133D5;
	Wed, 22 Jun 2022 14:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E061133BD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:35:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 54F4332009A4;
 Wed, 22 Jun 2022 10:35:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 22 Jun 2022 10:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655908537; x=1655994937; bh=4s
 Vqd7AV8l+4SVYUHYOcKLLXYc6h79Z3o2JgT9v//AI=; b=pcLUQlYXhSm8bmF0Xd
 PAcLmm9wni18hgxdCZuxU9IJIXqbBSWkT/s2yoyuWRdV0sefdM0cxLY+g1AiGJps
 EeeqSpXkSdCWiRQ6RniXlgT4BSD0P8KRYBrgHHoPBnyvNGvSOxYsdO9nS9ID2dPa
 Ayj5O12Kpr9I52ONE+g7rXgzuTFvkwmyHEAsXQaJX38wOVIvDujYVAYd7hgiJOhF
 sMw/PrA1wSHsR7l9y4bnl7gAkRcwRMI3+wlJhNvfv+//i+8grRzp5GzaJ+5QXaor
 QUNmMLh9W3qoRZcSG/EqJj5Wx7X6lQJPYU88+Y13Zi54HlX1NqG4iU/tcPpwY6py
 fITA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655908537; x=1655994937; bh=4sVqd7AV8l+4S
 VYUHYOcKLLXYc6h79Z3o2JgT9v//AI=; b=fl4KSpwh7NQh5F7BjGz1Kh18gOxUw
 y99bwZE067GrjXBWtVqpMCofi6yJ0Fn1D8PQ3iNQjOPIUpBrZ3MLIytCvlrKPxkk
 i2b6D7ijXBwczrmbhtl98Xj5cvh4QWGEIYQMdO0K79PzYcRVB8MOIy0I4hCU5YPx
 t7Tt6N5f9cTXwS7YkGk6BAhUTIdINzJxIn3e49DoqR72KcHQtO5bQ0OmCXiXvNQ3
 aKSZPhwDHua1srV6SGLp3nxrYjAww2FsaRdMBd/tf8YKoyggR8M3aZbRg+1PnB1W
 YIVMY53XE15a/Go9PiXSoconQfRv7XUEsKj6jnefpr4pg8OAf1FS4PwnA==
X-ME-Sender: <xms:uSizYtZZRM6EOBye5fn8-ZrhLm8D2XQGdl-luOTf_u8jcOmWGV8M7w>
 <xme:uSizYkagDul9lbkFUxA9M7PM0UWrZgWa6rtf6Y3PhuV2P41zLAv93TU8bqwHSxw8Z
 1uchu56yrxvRR9Dwas>
X-ME-Received: <xmr:uSizYv95IcsVWGDmT7lj15ZmIeY4v2rP6hdHgnOhFguj8miJwMv3f_B4-dmi896gEuk5bzwr3i6gR-6fNRrdkodR8cQlxbBfnU_LPe8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefhedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uSizYrp30253SmOufGj7mlEWEQkAfNs9xoEczXcK4672px-if1jq9A>
 <xmx:uSizYoraVhU2jGESHHCtU5bo_ftiZnOeuEQIc4UUMGz-2XhBJRclqQ>
 <xmx:uSizYhSlccKQZbCxwJH7knGSMipoNTkKQ9Rlgjo6RIFzmnDNI80QJg>
 <xmx:uSizYhn5UWR5DNwQkgSuorAfAeZ76CZBkzt6ICz9pQpQ6j9Wb4uDHg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jun 2022 10:35:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 65/68] drm/vc4: perfmon: Add missing mutex_destroy
Date: Wed, 22 Jun 2022 16:32:06 +0200
Message-Id: <20220622143209.600298-66-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622143209.600298-1-maxime@cerno.tech>
References: <20220622143209.600298-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_perfmon_open_file() will instantiate a mutex for that file instance,
but we never call mutex_destroy () in vc4_perfmon_close_file().

Let's add that missing call.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_perfmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index c7f5adb6bcf8..da2d2cee5da2 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -130,6 +130,7 @@ void vc4_perfmon_close_file(struct vc4_file *vc4file)
 	idr_for_each(&vc4file->perfmon.idr, vc4_perfmon_idr_del, NULL);
 	idr_destroy(&vc4file->perfmon.idr);
 	mutex_unlock(&vc4file->perfmon.lock);
+	mutex_destroy(&vc4file->perfmon.lock);
 }
 
 int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
-- 
2.36.1

