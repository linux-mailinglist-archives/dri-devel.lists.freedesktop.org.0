Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06363888A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E695110E730;
	Fri, 25 Nov 2022 11:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA5010E736;
 Fri, 25 Nov 2022 11:19:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id n7so6255107wrr.13;
 Fri, 25 Nov 2022 03:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/wAlj9+lbLEBeIqsdF+yfeUS1s2V84+JTVk1VCdcTE=;
 b=Q67PhOoPndCW0Ur1I4yEyXtV4bG9hnF8ZFZhsbiWnN6QRVw7MJRorO/s2l05wgYoXC
 5+oumRoP2SxEVQBrgGblHyNxtrSSX7HXHOU2GfMSYbIKplAnchCWiLMDigQRJwsxqj+P
 doALLtIgkISCNPoju1ONitsepzU/n7ZqyZTJp4M9YHbW1u5t1GLvnvbAxTspHE5HgArW
 9v4I3j5F6ktF8IYtwVMgC16QrZNSK8z2RGQ/jyex7CElzFweOWjnYRtQHkj3DGqPAGev
 LPLxg9AZ1Y+Mm0IUeAE7RWPZbqCdaqQl6SGn/Si2uTDAkB1ZOl2NlDB6K2jVwI9v9yqH
 x3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j/wAlj9+lbLEBeIqsdF+yfeUS1s2V84+JTVk1VCdcTE=;
 b=7G5qvz7WNswq2AOyzJBuqILiTL854F5izaTo0LjOEyDdYVYtjnIlP/C0ixu6iwplLB
 DHDDQSLxh1l75uNhaJxm3GDBw+VM5cd61v/jJe5xDna0b95S5YunLu003z182kdLbWu/
 pKY/CIKw/Suh7GdtNfVfXyUrEJOxgwHYYXh9y1GNsBidV0qXjb2l7mEa2BhNHXz86DRk
 o70bZQYngJcUM9RLiGXsT+iVMWyBtFY9ZE/3E0u4p9IFe5gzzNik7GLYnB+pb9JDZCr8
 r4WMRgPWn6U0zd9AkDmOvUoxDvydndvC3TwI7iPRmnHWUuboOEadj/2O5LqOQN932XTo
 xgbg==
X-Gm-Message-State: ANoB5pkOdOXhZ2cLaIfa7y41zfqA5NKREFBcRsAGSkUSEDmpqcsXGKTv
 WCBtju2QmN8ACUXasAmNtHQ=
X-Google-Smtp-Source: AA0mqf41IczvcYEEjnQ92VLNt+h2TfLiSNOWSuNTPlKkYS1mAN/uznxuKMcUS5lmC6J0jAIwK6d0qw==
X-Received: by 2002:adf:fb0e:0:b0:241:87cb:6e0c with SMTP id
 c14-20020adffb0e000000b0024187cb6e0cmr12875298wrr.166.1669375187088; 
 Fri, 25 Nov 2022 03:19:47 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d4b0b000000b002368f6b56desm4207406wrq.18.2022.11.25.03.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:19:46 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH 6/6] drm/etnaviv: add HWDB entry for VIPNano-QI.7120.0055
Date: Fri, 25 Nov 2022 12:19:19 +0100
Message-Id: <20221125111921.37261-7-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
References: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a compute-only module marketed towards AI and vision
acceleration. This particular version can be found on the Amlogic A311D
SoC.

The feature bits are taken from the Khadas downstream kernel driver
6.4.4.3.310723AAA.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index f2fc645c7956..3f6fd9a3c088 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -130,6 +130,37 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.minor_features10 = 0x90044250,
 		.minor_features11 = 0x00000024,
 	},
+	{
+		.model = 0x8000,
+		.revision = 0x7120,
+		.product_id = 0x45080009,
+		.customer_id = 0x88,
+		.eco_id = 0,
+		.stream_count = 8,
+		.register_max = 64,
+		.thread_count = 256,
+		.shader_core_count = 1,
+		.vertex_cache_size = 16,
+		.vertex_output_buffer_size = 1024,
+		.pixel_pipes = 1,
+		.instruction_count = 512,
+		.num_constants = 320,
+		.buffer_size = 0,
+		.varyings_count = 16,
+		.features = 0xe0287cac,
+		.minor_features0 = 0xc1799eff,
+		.minor_features1 = 0xfefbfadb,
+		.minor_features2 = 0xeb9d6fbf,
+		.minor_features3 = 0xedfffced,
+		.minor_features4 = 0xd30dafc7,
+		.minor_features5 = 0x7b5ac333,
+		.minor_features6 = 0xfc8ee200,
+		.minor_features7 = 0x03fffa6f,
+		.minor_features8 = 0x00fe0ef0,
+		.minor_features9 = 0x0088003c,
+		.minor_features10 = 0x108048c0,
+		.minor_features11 = 0x00000010,
+	},
 };
 
 bool etnaviv_fill_identity_from_hwdb(struct etnaviv_gpu *gpu)
-- 
2.38.1

