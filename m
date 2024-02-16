Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74948579FA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 11:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923C210E536;
	Fri, 16 Feb 2024 10:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="tNjjRu14";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001A010EAD8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 10:10:56 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-563d56ee65cso703857a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 02:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1708078254; x=1708683054; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=revdL7g1oAcERXcWT0jDr3geYXgL8Ugw/vEWapN0s+4=;
 b=tNjjRu1409cFSiLSETUeW8iUNFcENRHpgbarWQsonZC4KTumEbBbRVCLzNkh35kFra
 urTvzdiqqkgqHVW+1cV1nk4ws7kEswbpvqDCguwprfY5VlVHRGGn2xHu7pIheMjrnhg5
 qE2RXSZm7KxaCu/5kzewKAfsWEcrtV011jzXcEmZfm/DJ2YLOAd0QH7y+ZHCvOcARhXU
 EQT2jQHFaazokuF7zx7zB6onmU+iWZmoPxCRmJlxeZZ/VmZdkswvClgmZq7gvMj5AjWR
 wp7sPFQz9bJGs4hj3XfAt3A+9l1aJs5lEKkq7GSRJTCCoGfMuLTD/16XI9Ya+4g4R5UX
 Njqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708078254; x=1708683054;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=revdL7g1oAcERXcWT0jDr3geYXgL8Ugw/vEWapN0s+4=;
 b=SDW6MWOqE3pHn4u5XU+XyTY3pmGmJaCsVhmR22rtInQVJmLnZdvMuO0/y5eKXGtxbH
 8Ym+CCuKtu0d8Rw8tc46elAKXSE8TlBHC3rIlTu5pFzM29hf1QVeoldX77RmxpgXUMTx
 AmcdtSlF4WKwoG1VJTd5MuysIlvUQvjhhZ1TfH+MroGVGHRsA/SlsAk4uV5mJMBPA2vF
 YTIslCQb0Ke3lGS3iNDlr3Ne8xdfQ09M6e0Bm701i9mW+FOZInhL4RXyNi/VF4xwW3Qg
 eSiYaKf/8E/DEgexZxKBqyQHrwY0DWvGL3neQtiMr8gYoqk8d+p1FhtZX6jhIi8sG5xu
 9isg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpy7mUY0rtOdh9t3bpMBFIIW4PQNidlJiK8KjuKbfRdIF9QvpxsPRtJg7aHQ36NliB0NWOCGNVCz04d3KOpp2SLCBSDTs2WUnh65JooWnJ
X-Gm-Message-State: AOJu0YzqYYjDirN3HR30Bmvls1S/k7LkLQKYUdC99iGfWgbtxLeeiBxv
 tzgFI56vHki0vyhxkabip5TkAhK5aMdcYcP9LVWfY96AGgn59ysh6iKUO3yvS/vgthFBJJ4lxyO
 Q
X-Google-Smtp-Source: AGHT+IHvVyi01m5WRubx/2LzMcgOYA+L1JCpSnOZwUbC6zufjujFQB6IyuxF+9dIEw7v0O3P2l7c/w==
X-Received: by 2002:a17:906:719b:b0:a3d:a773:b9be with SMTP id
 h27-20020a170906719b00b00a3da773b9bemr2526010ejk.76.1708078254638; 
 Fri, 16 Feb 2024 02:10:54 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a170906169200b00a3d1897ab68sm1398019ejd.113.2024.02.16.02.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 02:10:53 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Feb 2024 11:10:50 +0100
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm6350: Remove "disabled" state
 of GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-fp4-panel-v3-3-a556e4b79640@fairphone.com>
References: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
In-Reply-To: <20240216-fp4-panel-v3-0-a556e4b79640@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4
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

The GMU won't probe without GPU being enabled, so we can remove the
disabled status so we don't have to explicitly enable the GMU in all the
devices that enable GPU.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 43cffe8e1247..5a05f14669be 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1439,8 +1439,6 @@ gmu: gmu@3d6a000 {
 
 			operating-points-v2 = <&gmu_opp_table>;
 
-			status = "disabled";
-
 			gmu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.43.2

