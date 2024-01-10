Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B02829825
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:58:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165E110E5AA;
	Wed, 10 Jan 2024 10:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9FC10E5AA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:58:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50e6ee8e911so4217697e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 02:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704884308; x=1705489108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KQl3ayL9sqF0LP6sySgVGCkUNXjL2bpTn4VJ6Si9uJw=;
 b=YMEIF6QR83b/X+UWqClveVKJ3jnaWTrbyNJ6a9iQWV9IvAIY/7isFWkE7YnMZ3fmbL
 UyXGfS3sx0Dq4Km9s+BK4aqw1saoywaJX7ADtUegUsj1CPJFLva1podkibEWa5sPMDsu
 j21lM3HXand+J36qNrZaNIeRQYViVhI8b1RWAwaLORbOJDe2DXBI++nrn+ibbfIDyt1A
 eW8PjdkSvB3hgRlxhSZg3bfvTgLz+dO+wKC3DIBtKmzpOdKPNM2mKgP91aiYy9apRSft
 VPVsJ3UAX83y2U5N3AYa+79sFtuZcN3RNRUT9BY3OJsHPpjCXzgHCRiG07d4p7pjUnEc
 eOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704884308; x=1705489108;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KQl3ayL9sqF0LP6sySgVGCkUNXjL2bpTn4VJ6Si9uJw=;
 b=YKJ99ZueQlMik8eXQM9sWCrpYfoBQ6sMG9hPVrCpzRSrp0aXmhmdupY5pL6RXAVtLC
 102aMgwhz1tRntLGcqbiWjRx8eXI57w0HA0Jvig/2iGjbNZyoADzwHQA7uGNvNty0wy9
 Lr8l6XphhNgWfPy1QV2oISxiuSNBCOTwAvEq7XQp5TpJrLhEDpBN9c8PytEhQ07eVCjL
 fNn9YLQDrqqjmXv7UbBvhpisMmXwHN2Mw7JDclUOAcNwbjRyu1d+CcIpK+JfSD7oSRme
 djllWrXASfUK8jbuMzKz6BcuKfePitL3yNdw+ujkHAHxToeIfwT8tMnR99S8HggTUp63
 FQSA==
X-Gm-Message-State: AOJu0YyMZPjotTL2q83n14iLJ4oEAipNvcUfOgYCpJ4wHGK4Le/Jn5/e
 Tpb1W8/8S5PhExYcxO84ZSctzAsOvIiNcA==
X-Google-Smtp-Source: AGHT+IGQgra7b8A3guiBeFlLtpRtNPD7srNEqn1+qqwRBRSmoYj0FHlUHQUVTHZRC0a4Jj7cAmxmog==
X-Received: by 2002:a05:6512:4811:b0:50e:cbf1:d2f8 with SMTP id
 eo17-20020a056512481100b0050ecbf1d2f8mr256193lfb.134.1704884308105; 
 Wed, 10 Jan 2024 02:58:28 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 b13-20020ac2562d000000b0050e7f5cffa6sm617421lff.273.2024.01.10.02.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 02:58:27 -0800 (PST)
Message-ID: <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>
Date: Wed, 10 Jan 2024 11:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
 <20240105-fp4-panel-v1-3-1afbabc55276@fairphone.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240105-fp4-panel-v1-3-1afbabc55276@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/24 15:29, Luca Weiss wrote:
> Add the description for the display panel found on this phone and remove
> the simple-framebuffer that was in place until now

Why? They should be able to coexist with a smooth-ish handoff

[...]

>   
> +&gmu {
> +	status = "okay";

Please kick the disablement from the SoC dtsi instead, it won't
probe without the GPU being enabled

Konrad
