Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6903A32F2D4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FF46EC11;
	Fri,  5 Mar 2021 18:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255186EC0E
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 18:39:39 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id bm21so5399457ejb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 10:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aHERaCb1u1sNTTmIBcxgTpCWC+DW/pRIiKz9xPLnHbA=;
 b=FTYBdkvIe0gUlyOUXdCKjyz0cfOOEzyotpGqU4K/vnTzQXLbKkwZUrm8a+0yBpotKV
 MwcBNU6M+09RdiGjGOj3DVHefrM6ZWjxkCvwJy4ONCp5ZDeKZL6s6iBS9xiGP0qMjgPt
 OIb84AAumaTSau//1ZwWkO7/5K9eF7qPCnhXpuLuGSN6xJIEPahEMXWI/iUCV+bvF53B
 2q25CVaRXVwfBOr7pBBtnYGuODJYojX6X5xoyBRBljuqwbpRAqV1/WytVntn04sFH9LY
 7QaclC+h6xbJgCbSXd0Uxc05KGYCo++IHsy7W/SXcIxtynav2gwySEop7rnhKtvK919p
 mmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHERaCb1u1sNTTmIBcxgTpCWC+DW/pRIiKz9xPLnHbA=;
 b=blnwQRuMiQivkSEEG/z7KNov64alE6+VFYrnwzKLksdDm/bs98QBqA6AHGHb1c74ym
 G/z/E0Iex+qaSeWX/AteCN5sS/T0MxO+0uODJMv/jVkvirq+gjKMXkhJCajsZMe06Biu
 T0jtqv/Rfyr0+IAaUgGreNMDHdtW617gCStlnbctlxFkLZKaf2mkBwqbRa4wTFhU46XK
 ajAD+TSS1DuvOfXAU4e4Z2M0r83DeeBIv/1z65bP8jPneAwuZd4InmdYXWY30liU69oM
 mHWrLFLf1yBTPI2tVqW9AyqGfxbMj0xvJSK7PLwC8lUtAVWq3FLmHMYYVPPi7KhCkTCh
 zfmQ==
X-Gm-Message-State: AOAM5326gwlQ+leFvbPFuuzVazrThKoiBzdbR/mSjCCf0Gy/BYTLSFTF
 Dg/a6xpc8ar8Z6A7Vq9zHLTentJ+ysPRyQ==
X-Google-Smtp-Source: ABdhPJwFcoYQW+23vhO3nVr0t4cUdcT+S+48ptXSA7tC1DlvVT2VavzFhF92Lg4XXmGSijqw0a5Qfg==
X-Received: by 2002:a17:906:1754:: with SMTP id
 d20mr3541915eje.221.1614969577562; 
 Fri, 05 Mar 2021 10:39:37 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:39:36 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] media: hantro: imx: reuse MB_DIM define
Date: Fri,  5 Mar 2021 18:39:19 +0000
Message-Id: <20210305183924.1754026-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
References: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Swap the hardcoded 16 with MB_DIM define.

Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
index c222de075ef4..1f48c1956cd2 100644
--- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
+++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
@@ -109,10 +109,10 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
 		.frmsize = {
 			.min_width = 48,
 			.max_width = 3840,
-			.step_width = 16,
+			.step_width = MB_DIM,
 			.min_height = 48,
 			.max_height = 2160,
-			.step_height = 16,
+			.step_height = MB_DIM,
 		},
 	},
 	{
-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
