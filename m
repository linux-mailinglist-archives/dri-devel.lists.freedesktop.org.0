Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD82E7F0DB3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 09:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D442210E240;
	Mon, 20 Nov 2023 08:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F8910E240
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 08:40:25 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so16526485e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 00:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700469624; x=1701074424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ITTlts2FMAHsu8yiJvG2iiuD8q4hyDHNB8Yd0fE8j4A=;
 b=EnI91kDFajqBviY06Np1NJ/zw3Ae/aMwl0G2FPI4QXONe/ElmehKQLkwZJlrtqcZf7
 kKkh5yMDv1Ph9/BVPb8cSEZto3iWUeGKaQVKEDcyjGJow/7E739Y446YEBuWBps3T8By
 00A/6pvVccmjSWSmmlizoEMdQLXijrLhOT7pHT0ETZFuCDpCgyge+w/zNCjh7WOM2VDT
 ao6hiNvnSOVAetxdEt1+hn2vvDoRaXCbisXrU151XbnIQwbhBH/oDyKYd/THYQ5UXNsx
 XphPcG/euWPMfOlCR3D5xBoXRccM0Df2GveqwZrKTcoUr9dngHLzC2SgutW33BSJ0etT
 FoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700469624; x=1701074424;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ITTlts2FMAHsu8yiJvG2iiuD8q4hyDHNB8Yd0fE8j4A=;
 b=GXS5MWW2JT2qsvxgqnmZ2EmF9R7ZTnz1YOC2YxnWcikx0n3TJ1gadmqqXefSBFqyBs
 3o40UIrQGtdN2rB+W0B/v1Wfg/S1116+XaWrD5ixMCuRpQJiz+92sWFbeHgJaVSOfDdB
 AEJ/wdzq62mBAPKVZkP4WuUtCVXFJH4QF01laVm7AQ1e/6SPhp3e3ID57+uzJl1Bv5XR
 t7niTp64TAeVixAGJ+EBCqgT0NuWMf4xFw55nHfh4+3p903SAZkBfXwQGbwuU4nytS9L
 ZegOY02G/VY77tdSz/xSje8cfutYFkf28P2+/vREUIwcIl1tX4lA3EMbh4z55frSVUJc
 W77Q==
X-Gm-Message-State: AOJu0YzfQifJaKP1u3P4cJSYGwfX43AXqOFk4vapVyEfSUV3reylDmF3
 NIhTHg41rNIQEvn2+n/gmBULuw==
X-Google-Smtp-Source: AGHT+IG//wixe+QsViWThUQ8nC1JWJAiQgbIKXGNz5qbnCz1AkTvk72ZCJXZVHyHW1cqX31G8TUDPw==
X-Received: by 2002:a05:600c:3109:b0:40a:3e41:7df1 with SMTP id
 g9-20020a05600c310900b0040a3e417df1mr5565578wmo.37.1700469624315; 
 Mon, 20 Nov 2023 00:40:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b0040472ad9a3dsm12386618wml.14.2023.11.20.00.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 00:40:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
In-Reply-To: <20231117202536.1387815-1-macroalpha82@gmail.com>
References: <20231117202536.1387815-1-macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH V4 0/6] rockchip: Add Powkiddy RK2023
Message-Id: <170046962348.1110472.9022953040371276101.b4-ty@linaro.org>
Date: Mon, 20 Nov 2023 09:40:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 17 Nov 2023 14:25:30 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Powkiddy RK2023, which is extremely similar to
> existing Powkiddy RGB30 device.
> 
> Changes since V3:
>  - Corrected commit subject lines.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/6] dt-bindings: display: nv3051d: Update NewVision NV3051D compatibles
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8bcac1be55e188e5bac3353b550c9cddb70fbbed
[2/6] drm/panel: nv3051d: Hold panel in reset for unprepare
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=697ebc319b942403a6fee894607fd2cd47cca069
[3/6] drm/panel: nv3051d: Add Powkiddy RK2023 Panel Support
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0aa1cfa3d287930cbecc52cd2b38683a4bf98463

-- 
Neil

