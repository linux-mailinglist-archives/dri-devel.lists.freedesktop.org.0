Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1EBAA9715
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 17:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742E410E2A3;
	Mon,  5 May 2025 15:14:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TUrzW7bv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB0410E2A3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 15:14:51 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43e9ccaa1ebso6053965e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 08:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746458090; x=1747062890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=d32GTanChrRQiIX2kw/78XA2TlMTohJ35wsLjmwnrpU=;
 b=TUrzW7bvTbfhx8w5lsqb1/Jc+47Bn1AxYQTblbPpYFNhxPMxlLpBUrfif8EjsQGpog
 aKtZyz11dAQ3YeOiSEkaEuCKnE3jhyAr6YWMZ2Vf2JVPdbWBKEf2djaLP6iQo6GgBrhL
 wGZbBVGR0Ycc88fhdLnZn9i8tDFz96jU6b4l3e/xtH80h1QKttuYJPsk6RLmzhlz5XYJ
 akJMSHGFJEVRdnUnh5vGM5uXb4ajLEdYBw/unl0grDIG0LAABKdgLT0N4Nm7GunvORJa
 VrBSxtY6QviEzQuGBcrIlmfKeNdSYBIimzrucnpNoGmMFWzX20Kk1j0G9TcOvPI+mMSF
 JYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746458090; x=1747062890;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d32GTanChrRQiIX2kw/78XA2TlMTohJ35wsLjmwnrpU=;
 b=aCvxI87sJO2ectB8pPr0XOrdX8pEVWsdI5LwuFqn0204RFcxuVHx8z4codcl67wvzY
 Bv6+rwMLLrBnqmpqm2Q9utN3xWSQXwMTEg7dZ/Lp7bTp26V2v89YrisaeXujmGD2K8cA
 Nw5zoPYbcui4EYHs90U/xee6uQeRP56WQH0Sjkk8e0VRy7S20I0ngAjDuEhADxueytB2
 5A+oESIa68fqojWg0WOV+8t6zMXZX/g1wTVziMSXRSPDsPv37NJk3I5ZuGWN0RWvXnpf
 EgOXqOP/q8efgI1gyxN110IpQ/OC1fuqNaFXWSlgftZ3AlUnCaMH5Nt7TZzep+zNe2tY
 pKsg==
X-Gm-Message-State: AOJu0Yymr7RiuVb8xwu7bVWqDYPuexd8W9Z0cFpW57lSEux1IChbG9d5
 OYqH1EPFV+TgG9ouGSgWpNC+9gei78OpHp1JlfbeKBJuxYgwySSo+9sCR4wW4zg=
X-Gm-Gg: ASbGnct9VL5/F0Ms/i7bllwpxUJxIqmR5/fTqhydz988njT4ZZB7yAatSZl9PZY6JZd
 9oDPfpqEjmBs6+q8e8vv5WDb0MDO7/2wPMR7RfOBKlaJihcsqB72yspcsKr51eKvRTDgDtonybt
 RmD3g1BTqEbJFYcMlrF0NDB/L4WlxgD77arKwp1T2J0VAb7cUugNNaKGEPYRmg9Ko6wQRDiMYBi
 qwhUC08ARJp3xTrIkD4+kKHpeiP6sPPhOpceUblJ2e6N2Ft9eSPhK+MymTRt0RrLahNoowSzEXg
 GGYeqnjgJhbWyLkf4ntqaE1ZtCDHLY1Xxn9uJAEP9oIc0bdb7NuDb26iCkdgdVHLp4BMdg==
X-Google-Smtp-Source: AGHT+IGcpN1WH+W1TOAguqrm2FpFHGatweK6lfRlcaT9gjRgYlUH82bX8IAOdPt8S2pz9M/xpfDWfg==
X-Received: by 2002:a05:6000:40dc:b0:3a0:6bd0:9771 with SMTP id
 ffacd0b85a97d-3a099adde6emr3159216f8f.7.1746458089886; 
 Mon, 05 May 2025 08:14:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b2aecc14sm182288875e9.12.2025.05.05.08.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 08:14:49 -0700 (PDT)
Message-ID: <4fe7a429-50d8-41a6-a63a-6294cc76d599@linaro.org>
Date: Mon, 5 May 2025 17:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: Add Novatek NT37801 panel driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
 <20250505-sm8750-display-panel-v1-2-e5b5398482cc@linaro.org>
 <2fb8cb05-8fd7-431d-87a9-134448125f06@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <2fb8cb05-8fd7-431d-87a9-134448125f06@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/05/2025 15:58, Neil Armstrong wrote:
>> +	dsi->lanes = 4;
>> +	dsi->format = MIPI_DSI_FMT_RGB888;
>> +	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_CLOCK_NON_CONTINUOUS;
>> +
>> +	drm_panel_init(&ctx->panel, dev, &novatek_nt37801_panel_funcs,
>> +		       DRM_MODE_CONNECTOR_DSI);
> 
> Please switch to devm_drm_panel_alloc()
Ack

Best regards,
Krzysztof
