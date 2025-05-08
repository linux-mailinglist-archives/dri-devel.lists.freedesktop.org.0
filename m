Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6DAAFC1F
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 15:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487F010E918;
	Thu,  8 May 2025 13:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nnpKJ/fa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 859D710E3BC
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 13:54:35 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3a0b4907a28so141471f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 May 2025 06:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746712474; x=1747317274; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=OE2XfGjW9rbiEGA9DoJIt4ipIusyoB7R0P16CBqgBPM=;
 b=nnpKJ/fal2Sy9eCIFktFuVvaF+fyph5lSBbz9V7lW0MlZJlmnTYFp3z1LMiemG5hPS
 fix+HleD3z5DlJnpnSocupXfS5wOGKvTxmFolEnI7kFwY7MTlCIw0cAEammng3c5m3Gn
 LiBon/3KTkWYWgXFsWemquANkfKQCHf6+wsXjws8t8qvrRN15lLjpEF6eHQL1Sb+/GVU
 3p75/mq/ziaUw8whoHBu/4srhS8NiM4lbXS5Rhngj5x+mZ0IZ3lq+PHO9ys9jOYRMeuj
 t1RdyRGEdG93R32XWxYECNgmyNkVV8f816ozlTHaSAypmq8oASHHIqjIdsH+eTFtahYn
 Rjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746712474; x=1747317274;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OE2XfGjW9rbiEGA9DoJIt4ipIusyoB7R0P16CBqgBPM=;
 b=MtJzmIqVlpc6lhx1NE3gpKLAzgJlH+MC7okRxtYZCLSeO0CMBfFz8a3t3tcNE9Rl0l
 Xbm/rrhuyiEX0M4OVr1Bj3w6HTsK5e90tByYSfrXAjpldPWJDLyo8+Qw+b1YmbzhmHqe
 6GQC9/RzJ8U0QFSkTZWC7eJgiJjqo1jTcTSuWDxSOsA32FdzqOdaxC7O5fakFmAUHH0s
 m8TCLAbbNkiXME4tOEdYTJFYnM1L6wkVS2GKbTz1JWri4Ok9ahctMYrF3pEbmR46PNgT
 btdX4+I1Ca39TtKyLaUOCfWXUY2Q2PbN8fTv/flxxarWkl39zbowtvYQAQGyBKGgspbt
 6zuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrSMrL+eA4qLfJ+UCM18sPrTNT9nhK0jN9cwzJZKsdzBxYJO3xdm0fSmK442bCoqgv2UGGaVriM4w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw6qLl4lRR7MK9tBGy0Q0l5WmoDUs8VzfXRHydy6BQKRTiVmjw
 gtbJ701FgGDAo09tvybFUYyjndiSUa1Py3wSYQAcyD+Hsmx3T9T+rhqdGyLLDbA=
X-Gm-Gg: ASbGncvXJUL8rhm9eguAWnvfZ08+eu41nz78G+OyV1TbKutwztd2cUIU50uSD3LwqFY
 ZgwQaEqw1nUxDQNO6dqFQ32WPlzB2xfJmRhvB0mtNxTtitpeFGCEeC7U1Z+nOXU/NIf2yJ0wZXZ
 unGxEr67QZjZr5TwhoD12UyEkUXYBIIW/uH/OZk9XZ9PWgIIoF77vBVXMzXecbjxn65xZq14ATA
 gLbEJG16xFcatnuSGPzOlpjCeobQJP+V3Akf4IFJblD0QBcdZswbq8CJsob8xSAnE5PMgP4B5Zw
 SipvyDLEzUOBLts5wYPMVCCZT1tm+IVIfR5XRQawQj04AEvT6Bl1TjHoTkVpUPK8nu2BUg==
X-Google-Smtp-Source: AGHT+IGFsswoZdi7bBzt6mldCknC7FapGsMM1Gttk1zZwwuSCaJhWziPOOq27/+/xll1dWJ7kbC78Q==
X-Received: by 2002:a05:6000:2703:b0:3a0:bd7a:7bab with SMTP id
 ffacd0b85a97d-3a0bd7a7d1fmr539248f8f.12.1746712473884; 
 Thu, 08 May 2025 06:54:33 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32b0a9sm38507795e9.2.2025.05.08.06.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 May 2025 06:54:33 -0700 (PDT)
Message-ID: <809ff3f7-612f-4e0b-8f81-59290d4bd0aa@linaro.org>
Date: Thu, 8 May 2025 15:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panel: Add Novatek NT37801 panel driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505-sm8750-display-panel-v1-0-e5b5398482cc@linaro.org>
 <20250505-sm8750-display-panel-v1-2-e5b5398482cc@linaro.org>
 <CACRpkdZi3ryJ_D6NYaLS1Cmevp-Pmbdq6zTL5+a=cmXNq42N5g@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CACRpkdZi3ryJ_D6NYaLS1Cmevp-Pmbdq6zTL5+a=cmXNq42N5g@mail.gmail.com>
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

On 08/05/2025 14:54, Linus Walleij wrote:
> (...)
>> +static int novatek_nt37801_on(struct novatek_nt37801 *ctx)
>> +{
>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>> +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>> +
>> +       dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>> +
>> +       mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0,
>> +                                    0x55, 0xaa, 0x52, 0x08, 0x01);
> 
> The above is obviously some kind of unlocking
> sequence to open page 1 of some vendor registers.
> 
> We know this because the exact same sequence appear in
> panel-innolux-p079zca.c  and panel-sony-tulip-truly-nt35521.c
> and the last argument is the page, so there we added
> a switch page macro making it clear what is going on.
> Could you do the same here?

I don't have docs and this is auto-generated panel driver based on
downstream DTS, but sure, I can prepare something similar based on above
assumption.

> 
> With this addressed:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij


Best regards,
Krzysztof
