Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1D4804C39
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 09:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4294F10E4A1;
	Tue,  5 Dec 2023 08:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E45710E48D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 08:26:55 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c09f5a7cfso23546105e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 00:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701764813; x=1702369613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2xo+/EwDShXw+0ErTm/Pk49sbvWBMtU3LMyMVMefHxA=;
 b=EMInkHq6dlpW9tlvWRlIgeQIJZi6BBCJ2G3DCpfPwGAK7EtYt+xXXSudou81aQ39C9
 F5yRs2u2GhNnjUPZikD4f3K8z9bpWzcXaHKEXY+GDuKqjWJjf6cWQdbPYyboRiWgJxWm
 cpUVywQKgMlC4blAnuDyxtLEIrQj6Rd+Z0P7jzOBeobGGmyw0F5cUa5Ic5scNq+2aTM6
 w1PORZNMDTDkKzwR3VcIpwd+t5Dzpjtu7AnaaRJX39x3x41KMllEMuj5A8OgqUp8sbQU
 RVmPPH00OFKZMxOhfqrMiZ3Il9c0r3rQYECHWjFJnwhdlwaVGyaNXQDaAvdiHXHTBGhP
 rwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701764813; x=1702369613;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2xo+/EwDShXw+0ErTm/Pk49sbvWBMtU3LMyMVMefHxA=;
 b=IyEmo9R5rIgxa1yPSDLxtT+NWSrujevA5xupIIB82y8bER6cf1zb5lf4i+LJJARygH
 +siEwg9oXTvHoK/jI0hTjTYou7IifVkusTrt+zrH1fTZdwb0CrUXD8jyyGW0IeLGxixx
 OsJjHtrjUI2A+CKRfc33oi3r4Ok7kUqz5pQV8QrfXs58l7cRQrAovZabBlrxC87Yw7Hu
 4lwxWDAXufFNGArUMeaxkFMLXNTKH1icmijG0Ndsnx74WCI1TExaE+2643V3FFehXaT5
 RleWz8yZaowvtJsm211PWX4hwgbfUwQv8R9wRNX9BB2IKy+xqjX2tn8x1hBwT6fFaoFc
 6kOA==
X-Gm-Message-State: AOJu0Yx6iAUeDM/DgJYnAM2yJInne/oWtwjs+LF1AqbVXsOzLoUr5/yQ
 Z/QqFYF2MfphC2UMgP2KGSlMzg==
X-Google-Smtp-Source: AGHT+IHm8d3BCfIGqE69y8jUoy6J3Kzb+QtEPPQ+oGlTFuH/rWCx6J2gokcJ9ngcoHN+c1BW732iPw==
X-Received: by 2002:a05:600c:4655:b0:40b:5e1c:5c1f with SMTP id
 n21-20020a05600c465500b0040b5e1c5c1fmr234872wmo.52.1701764813586; 
 Tue, 05 Dec 2023 00:26:53 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a05600c3ac400b0040b538047b4sm21329282wms.3.2023.12.05.00.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 00:26:53 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-rockchip@lists.infradead.org, Chris Morgan <macroalpha82@gmail.com>
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
Subject: Re: [PATCH V2 00/10] rockchip: Add Powkiddy X55
Message-Id: <170176481258.4073725.14793788958228896320.b4-ty@linaro.org>
Date: Tue, 05 Dec 2023 09:26:52 +0100
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
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 sboyd@kernel.org, sam@ravnborg.org, mturquette@baylibre.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, quic_jesszhan@quicinc.com,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, 04 Dec 2023 12:57:09 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Rockchip RK3566 based Powkiddy X55 handheld gaming
> console.
> 
> Changes since V1:
>  - Corrected a bug with the DRM mode flags for the video driver.
>  - Adjusted panel front and back porch and pixel clock to fix
>    issues with display that occurred after correcting DRM mode
>    flag bug.
>  - Add a new clk frequency for PLL_VPLL to get panel to run at ~60hz.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[01/10] drm/panel: himax-hx8394: Drop prepare/unprepare tracking
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=8c2c5d1d33f0725b7995f44f87a81311d13a441d
[02/10] drm/panel: himax-hx8394: Drop shutdown logic
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=e4f53a4d921eba6187a2599cf184a3beeb604fe2
[03/10] dt-bindings: display: Document Himax HX8394 panel rotation
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=be478bc7ab08127473ce9ed893378cc2a8762611
[04/10] drm/panel: himax-hx8394: Add Panel Rotation Support
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=a695a5009c8fd239a98d98209489997ff5397d2b
[05/10] dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=00830a0d8f0d820335e7beb26e251069d90f2574
[06/10] drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
        https://cgit.freedesktop.org/drm/drm-misc/commit/?id=38db985966d2f0f89f7e1891253489a16936fc5e
[07/10] clk: rockchip: Mark pclk_usb as critical on rk3568
        (no commit info)
[08/10] clk: rockchip: rk3568: Add PLL rate for 126.4MHz
        (no commit info)
[09/10] dt-bindings: arm: rockchip: Add Powkiddy X55
        (no commit info)
[10/10] arm64: dts: rockchip: Add Powkiddy X55
        (no commit info)

-- 
Neil

