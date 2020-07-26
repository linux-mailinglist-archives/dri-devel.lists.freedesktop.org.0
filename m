Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8554E22DFF2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EFF89DE5;
	Sun, 26 Jul 2020 15:03:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3EBB89DEC;
 Sun, 26 Jul 2020 11:13:47 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id z17so10057758edr.9;
 Sun, 26 Jul 2020 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UbgBtdsZGIemXshDXMwmxf8DoQcpEbxLRUMayd/h/0g=;
 b=GkEdKGdFtTYQj/wFf/bU8fnqXSKDhM5E0FjRRZJL84pEHDMtWyOnAXT6OdfN3bhReH
 sKyk7syptobl4TxxsRCJ2Bn7k/nQuTFBkLv3Gii5l6BaMg/RiOg8rhssAI8l8Z9aTqwO
 n47zSWet0TK8BesjiHOnq7Yj/MN1tg9VGJX0gvgtHpC7YnDsU6MKf0d5rnh9gF6SkJa+
 GvjFgW++sRaGks9UYMNByvlEGD7rXzJyPc6XZpQfkwn98nPPzwgt6W6jjnl8lJbL6577
 vQEq6d5cWTmTzNBS10zqJ+6xWqFgtofWSJ6KOOVBHMwcGRl3OOqeo/2HPU/HwPzsDy2l
 icVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UbgBtdsZGIemXshDXMwmxf8DoQcpEbxLRUMayd/h/0g=;
 b=eCqqMAeZ9ZH3j58c9+Iniz5oHSGPzY1Cc/NvffpAw3whAwH22Ag2a4vCc4OJ5vyBn5
 WQaOm5H33obj31kXjf+NQ0KMfwO4aNw98DD6+fgAul6YgP2NbTg1s2/Fl55CW28fYcfc
 UgVpcXQGozEwaB4fsJ3cFERN8cBI//xeJyraO1RyLW1CAX9/Cu7GoSQ/aDk0hRAjnT/N
 X7JXqxTbR8tQUGn+z+edFyBr0Mfa8CLSiV88brPeIDCvXCWFaWpA3jr6qFBLv2BLFyOT
 MGRi50RLv/Q6a/mso1bwulekm/EgPKu6JIZsPnj9GZWAFWLQYq9mIhQ8XF6ja92ugttP
 0+dQ==
X-Gm-Message-State: AOAM533r74/8HxT7oQwKD264Oi+vB9PVw6CWmb4WSKiAwmJv/o16Lf81
 qfa3CZ37U69ZaX9ASgm400M=
X-Google-Smtp-Source: ABdhPJzOyixNGF0EsoqZKZkm/6+YqgQs81jjv0P0Oa8ZJNnWeDK79k8NR0e7xq+4mLzEswwNytYdaA==
X-Received: by 2002:a05:6402:308e:: with SMTP id
 de14mr1187894edb.344.1595762026436; 
 Sun, 26 Jul 2020 04:13:46 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:13:46 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 3/9] drivers: usb: dwc3-qcom: Add sdm660 compatible
Date: Sun, 26 Jul 2020 13:12:00 +0200
Message-Id: <20200726111215.22361-4-konradybcio@gmail.com>
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

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 1 +
 drivers/usb/dwc3/dwc3-qcom.c                         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index dac10848dd7f..c5280d6406ec 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -16,6 +16,7 @@ properties:
           - qcom,msm8996-dwc3
           - qcom,msm8998-dwc3
           - qcom,sc7180-dwc3
+          - qcom,sdm660-dwc3
           - qcom,sdm845-dwc3
       - const: qcom,dwc3
 
diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 1dfd024cd06b..d6b3e1bb550a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -753,6 +753,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
 	{ .compatible = "qcom,dwc3" },
 	{ .compatible = "qcom,msm8996-dwc3" },
 	{ .compatible = "qcom,msm8998-dwc3" },
+	{ .compatible = "qcom,sdm660-dwc3" },
 	{ .compatible = "qcom,sdm845-dwc3" },
 	{ }
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
