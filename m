Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B86546257
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 11:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A9711B973;
	Fri, 10 Jun 2022 09:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA2711B4A4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 09:30:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4F4485C003D;
 Fri, 10 Jun 2022 05:30:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 10 Jun 2022 05:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654853446; x=1654939846; bh=K7
 81LqqWmx7sd6XQnApW3+Bs0oei0X465OKAnis8txc=; b=bYIBURZbofVKklZ3Ov
 +BeyPJzqRuSyJ1K9sqWNJVg0zfdg23am9DLaiS8bOv6YXiOh9e/2nZZ6FNw76th5
 JcS2i1rukatYCZI00Go3FNoAVDQTW8hSfgnPSXvOaxaJiQiByLrlDrTRmZo63uEV
 0Z8OzuRiJjbA1IwrXmvQds5JdMmYxc8bfXawIM2nBRf6J7U3QDgYUbACTGeWQt0Z
 I8MsNai86DfKK/iWOcibckmT9oyFUKA6l/B9Jw2poK5sqWlXQ+bg4j4zUag9SH3i
 DCLcAfuJ8MCzY37XJb6x3bKr6Utd5ZztLL0mZ1pmYT3BXNGq5hlzMUNicBc/Iksl
 rZNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654853446; x=1654939846; bh=K781LqqWmx7sd
 6XQnApW3+Bs0oei0X465OKAnis8txc=; b=xDFCXa+EwCdcyeLlHIePSPIEF/FO9
 KVirF8P7uPp717GZ3l4LlwYqEVs/SplxuhWkNOFnwPocLYCTl3SGjX9HQxhhQYXk
 r+tgIY+Ge5W2jUp88Uq7G5p4yLdp/mzRCsPok5qlptem7+YuP+7pu9BPkTLOw5BE
 iTLbXr0oICf7LO1phQCjkg6NF3OXygIs7TJxdaGngigxb65pNChwrKsSmBer3un5
 DlAHb3cso+zFNpkSo057LmhDr5rDANnLizUsRaokXr/p9l2WWWlVN2CPZGJKvhzc
 6UP842WJP38I/Kon+PHsCC+sy5zNGhN7uXyW5DjfLT6IYCAa7v5jLOqRQ==
X-ME-Sender: <xms:Rg-jYhCumzvHgReHpPlDLPz8hOBFvJdpQV_H5uQlqbVI2m52C9YFGg>
 <xme:Rg-jYviYYd7DZiQJxh6C5Aib6R9OS3JlR3jn3u3VnA7KBemcfyBooIXdwH7tDrqT6
 XyUVq59TLjaJDbLdlA>
X-ME-Received: <xmr:Rg-jYslJ_WqK1vkmWfXeFkGhFd2DPCYIKxIeTQjud0D12zljhrFi3uo5Shi5qh4y1qLu_J6SFbnSEh34aM8FMNiiGg54U2abHTHmHsI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Rg-jYrxsUrZOdrC0ZpdWnINxIyNXjqGMmQnQpO_41f4TgNvDDtXMHQ>
 <xmx:Rg-jYmT4XDAbqqNQcJ7YNwlJ9uVDlqAadqUOAknP728T8ZY6d97Jrg>
 <xmx:Rg-jYuY21lOFjQIoD6Kr92NrZc3uKYJnLSuNQIQoVPqiXncOs2bafg>
 <xmx:Rg-jYsPeaDrXPM6edMP_fOpSgSiSLn-Nc4Jyn3XhTZfENt75wkzgoQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 05:30:45 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 44/64] drm/vc4: hdmi: Switch to devm_pm_runtime_enable
Date: Fri, 10 Jun 2022 11:29:04 +0200
Message-Id: <20220610092924.754942-45-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610092924.754942-1-maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
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

devm_pm_runtime_enable() simplifies the driver a bit since it will call
pm_runtime_disable() automatically through a device-managed action.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index b4fd581861ea..b31487547070 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -3225,7 +3225,12 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 	pm_runtime_get_noresume(dev);
 	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		vc4_hdmi_runtime_suspend(dev);
+		return ret;
+	}
 
 	if (vc4_hdmi->variant->reset)
 		vc4_hdmi->variant->reset(vc4_hdmi);
@@ -3270,20 +3275,12 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
 
 err_put_runtime_pm:
 	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
 
-static void vc4_hdmi_unbind(struct device *dev, struct device *master,
-			    void *data)
-{
-	pm_runtime_disable(dev);
-}
-
 static const struct component_ops vc4_hdmi_ops = {
 	.bind   = vc4_hdmi_bind,
-	.unbind = vc4_hdmi_unbind,
 };
 
 static int vc4_hdmi_dev_probe(struct platform_device *pdev)
-- 
2.36.1

