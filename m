Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA79A39BFE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 13:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295A710E69A;
	Tue, 18 Feb 2025 12:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nDmQUedW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A22410E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 12:18:39 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2f2f5e91393so1211872a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 04:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739881119; x=1740485919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rcOf/+mAe7HjVKdjr7yO9VSKEbj6DVv1uV/KGTc/++g=;
 b=nDmQUedWSVO7eLHnQxxHhaz7QG+45XGcaoHAyDx6eLgkUM+BM6atHHseLtik0wQwb7
 P1calOlkRgGmIUJhZq47DwZj8+QA2ZguL/hGYUU/RedGmPQvffkDI7vC5OUg3FVWdLwE
 8FutDWILZigqDuC5g2PKe48I5AuUm6HdZUcAhd5HBEf1W+2osed0ROwUfLHWkFVv9nEU
 9nnXXaNEPIG+IahkJR2CHm3/fcy8GniEpllfWsUQPSc/edjoUQBUyCZAHtngxg1ik5fW
 Rhw2HYfPAMOOXFcqbmHy3CBsZrWkrE3HFpBrJ329Ay6yPL5KW5KLf5RI4cOdDLBY0mSG
 HB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739881119; x=1740485919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rcOf/+mAe7HjVKdjr7yO9VSKEbj6DVv1uV/KGTc/++g=;
 b=aXd8095xRc3RrZ8NrCBAmCk8l5gGldHtnoCqdrPvzXp6LNs/tO3MKvmwvpCcU1ow20
 P+Cm3OHBNq6RLLKOnHLIJZXuu9QIo/Uo+5YP9BnnkSz4OlIsv6JsMNY2Wlip8zpZi5Iz
 Dd7HJWWgVQPjfsWNHpc5lHlwVKlDzRNpsZIZSnY3P0qLLbzR3rv4UGN7YoQeR2l7gVER
 i8Zp3N3AjpafWscp85FAcSTeXLOozh1wLojh+qntCzPLO0+YsRa8ylJquEzK1qRmaE41
 H+CYOiJerzcw6uH/98mDKizj/u4jSLHNnQg5u3nmi1ascnW3a6ZArm7RApbY17kthHj1
 QDpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL7fv34w6r9SfEuThhO8BQe7yFyM0s4qJAuPk7R7oPNGkK89g18oP5U4nEikM/4CpaJ1u65wSZ1sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUF1rQtBzz4UOWKHUjMNFvSLgaI5yjbIT9ls22rG3LeJpbU8vU
 U7T2ZpQhQRKgsCHMqJp8SnlYWJBvH2PZJ5bKssJBuuG+Mo+HGuEF
X-Gm-Gg: ASbGncsbhFh5u/NOJ8Wl6P9vp4tFS6fJV4n0V4/fmUGl/h9dpB5Lxp2rQe5wGw6QLli
 vNdPC25BqxHRTmePG7UwvE3p8s/fH3zgZu0evsDTJ0K0vNpvSIMtY8BctEcZlzfl0syCDwEOL6o
 a90G0iDcxe+odvcxbDCT+sjgXpN/JrX1JOmLFVsjNJFjj/Y/6gs6/vZ2uTeWEI2pKNF4+wxdAOE
 5HwUlkZ8GnChdtB8TYyhJOuzhb8ijHgk0yDEDwUfJV8zNhy1V0I71zwyWi8c/0meeQ6gkXzfYRE
 5+wPOpy79gP6mHktUf4p
X-Google-Smtp-Source: AGHT+IHPsPfeZPNuDFA8wzs+mlVOqsQ83YHZnd3qlJa4+vQqXKKzygw1wD0+aOsxjfqbOZCURGWEyg==
X-Received: by 2002:a17:90b:2250:b0:2fc:1370:9c2f with SMTP id
 98e67ed59e1d1-2fc4103cd0dmr8326098a91.4.1739881118858; 
 Tue, 18 Feb 2025 04:18:38 -0800 (PST)
Received: from rock-5b.. ([221.220.131.19]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fc13ac19aesm9896535a91.17.2025.02.18.04.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 04:18:38 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: heiko@sntech.de
Cc: airlied@gmail.com, andy.yan@rock-chips.com, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com, kernel@collabora.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 liujianfeng1994@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source
 to VOP2 on RK3588
Date: Tue, 18 Feb 2025 20:17:46 +0800
Message-ID: <20250218121749.1382322-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1919367.CQOukoFCf9@diego>
References: <1919367.CQOukoFCf9@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Heiko,

On Tue, 18 Feb 2025 11:00:57 +0100, Heiko Stübnerwrote:
>So I guess step1, check what error is actually returned.

I have checked that the return value is -517:

rockchip-drm display-subsystem: [drm] *ERROR* failed to get pll_hdmiphy1 with -517

>Step2 check if clk_get_optional need to be adapted or alternatively
>catch the error in the vop2 and set the clock to NULL ourself in that case.

I tried the following patch to set the clock to NULL when clk_get_optional
failed with value -517, and hdmi0 is working now. There are also some
boards like rock 5 itx which only use hdmi1, I think we should also add
this logic to vop2->pll_hdmiphy0.

@@ -3733,6 +3751,15 @@ static int vop2_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(vop2->pll_hdmiphy0);
 	}
 
+	vop2->pll_hdmiphy1 = devm_clk_get_optional(vop2->dev, "pll_hdmiphy1");
+	if (IS_ERR(vop2->pll_hdmiphy1)) {
+		drm_err(vop2->drm, "failed to get pll_hdmiphy1 with %d\n", vop2->pll_hdmiphy1);
+		if (vop2->pll_hdmiphy1 == -EPROBE_DEFER)
+			vop2->pll_hdmiphy1 = NULL;
+		else
+			return PTR_ERR(vop2->pll_hdmiphy1);
+	}
+
 	vop2->irq = platform_get_irq(pdev, 0);
 	if (vop2->irq < 0) {
 		drm_err(vop2->drm, "cannot find irq for vop2\n");

Best regards,
Jianfeng
