Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C927022DFF0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A401689F43;
	Sun, 26 Jul 2020 15:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C095894DD;
 Sun, 26 Jul 2020 11:14:47 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id y10so14267451eje.1;
 Sun, 26 Jul 2020 04:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9EGFqYKJoHtN1vttGMeBEPR4ruaGTsfRMrn5QGqgiw=;
 b=aDW8egOYbAVz8osrTWCLY3P8ADzpkz3hIg1mOiA/H7TNust0BnPHOssdUnI1Pt1h75
 GOBdDv3Iu6H7lqjhIW8FYLTWeFHo+475OvfJUVG1ulq+kYrRbU743jzJDTidJLS/mvAw
 m0OuK8JdT1iieR2kWtaen3xT8WoqTsC6yIw2I+ViNiEcdfNwTXUgJf7omtp6yASm71Zd
 gdeOzbA7RMczK+91LvdK6Z/lThOaJCTVh7iY1QDKL+NIMfJ+bOVnxvRG/iuD89xbZocz
 akYj1cVgbVefz8VHi/CspmFC/voH2IAOYY0+wzOO5fvALTQP9nU7lCMqKyS/vhFDUMjC
 I35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9EGFqYKJoHtN1vttGMeBEPR4ruaGTsfRMrn5QGqgiw=;
 b=DBfr4pC+M8Lhv89RnU+FG9xZ4shKrtkgvPjlMkNEvQGrzEzUL4GbVpvJ+218B9/UcN
 19wEdPguniuCke9qsdF2snvH+tEDE/z+0MJkFihZd0QsUrWL5LLwkOGQn3DNHtOW5INT
 BEPvumViXlp0Yly0dIEeZTt9HB9xVhVfkehvsJukGxefeU/5IGOkj+oMWfwdvxtMzgQG
 jNAKK6QzkIiE42WV0Ph/mOFX8xNcifXuSZYzD7YzxeO4AUgkhf/yvrL2vVcLqf1Sd7QG
 bz6bshZMIc46aaFpew2QuQTFswcs5vDd8kQ8RT5oJ4MhX7RiPVPQPUwQGOP0eLKv5Xpr
 hiwA==
X-Gm-Message-State: AOAM5313wqQJAUOSy4RVBMtOmC2W8agU4BTf/zUB04vX7KyL8VER00b5
 p7XrYXYoLIoQFKCDxFSoKNE=
X-Google-Smtp-Source: ABdhPJxSxwiSj+5a2uWaGNSlVTdNUs66Zu5uEa23SsoImBiEOoez2f61gt80TRSbu75LHe82bcTkUA==
X-Received: by 2002:a17:906:6bd9:: with SMTP id
 t25mr5077049ejs.250.1595762085690; 
 Sun, 26 Jul 2020 04:14:45 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:14:45 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 8/9] clk: qcom: gcc-sdm660: Fix up gcc_mss_mnoc_bimc_axi_clk
Date: Sun, 26 Jul 2020 13:12:05 +0200
Message-Id: <20200726111215.22361-9-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing halt_check, hwcg_reg and hwcg_bit properties.
These were likely omitted when porting the driver upstream.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/clk/qcom/gcc-sdm660.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index a85283786278..f0b47b7d50ca 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -1715,6 +1715,9 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 
 static struct clk_branch gcc_mss_mnoc_bimc_axi_clk = {
 	.halt_reg = 0x8a004,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x8a004,
+	.hwcg_bit = 1,
 	.clkr = {
 		.enable_reg = 0x8a004,
 		.enable_mask = BIT(0),
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
