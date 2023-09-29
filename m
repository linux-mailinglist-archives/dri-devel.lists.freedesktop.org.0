Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD07B2AD8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 06:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE29A10E093;
	Fri, 29 Sep 2023 04:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5A610E093
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 04:03:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40651a726acso14794115e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 21:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695960232; x=1696565032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KReiWERwDDfiOU1SSbt/KZ2zRQc3dweGFkFBIgCq5Io=;
 b=SCl+S261ag4ZtxlfvlqLUeaS5md5/YVSJGo21W7XtP9Zi6YIRSd9jMCp7Dz+dob8VS
 FLrgYrk/OwZNVyap2i+bEQdbXln0XmXgMSi1lQ3qlGypBO0ElbCfk70FGsXgEXQZkRTF
 7oWgXQ3Uc2CUDObr5wQtxyAUbSbLupmswIwO0OprE1Y9HjsxxSmVFJaffTFAUC5ANcj/
 v7sREbhPZevZDlxKzbV8XCDvFB+7uIvYaNinZeTYGheFcH5kDAcinso+kzniyT4z8vi9
 nhjzs2kF8V+3xh1z8Yz1gz1CpXyxGroVq9ramzTYuqsRb9sMxgPtkWivTrVxbQMQ7P+T
 8Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695960232; x=1696565032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KReiWERwDDfiOU1SSbt/KZ2zRQc3dweGFkFBIgCq5Io=;
 b=YmHIt3sFpVEEwKCNdFciZ6pUhk/Bw49/8+r2hjwY+9IilVma+xLG9hzB0ilZvAQTP3
 u852VM1tvihXKoB1M/BG8pWrKkBFGVyVrK3yPtjpoUWrUZnPcyEsSkG/b1mpm1Kw5YLi
 Xcl3NwZR0vgrwU8iFlPH2zS2fdXu/FXD1JuCBbVRy09Mz0L0W9+n9rhS9eh+zlr8F/5g
 mHND7RqnahykpuVVavMK9xfaKEEABW6Lt9z5BWZAFkJRATKqFiJ+wVb60qZuGlx2lBsn
 FXDiSzJphukgjr2T61lr25mEODcbGVqRe2OWAeH2WwdkoQyYxbfUUdoxBGDnBveTFHdL
 YhlA==
X-Gm-Message-State: AOJu0YzQR14chhepWolbKDFRbruseXPLF2sP4XWvWgDWKWGGexEtqv/s
 V1RhZEqXN+t4vtofJaav9UpyZA==
X-Google-Smtp-Source: AGHT+IFha5fQ5Dsn15Q0JlswasGvdh0fDuykfF/SAMMAFDWRI8o1Qqykm+j6nnjKX1aQ0UqbTubwog==
X-Received: by 2002:a05:600c:2318:b0:401:be77:9a50 with SMTP id
 24-20020a05600c231800b00401be779a50mr2644151wmo.8.1695960231668; 
 Thu, 28 Sep 2023 21:03:51 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a5d50c1000000b003142e438e8csm20651397wrt.26.2023.09.28.21.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 21:03:51 -0700 (PDT)
Message-ID: <480a3b0b-f6fd-8300-804b-36f390f2f36b@linaro.org>
Date: Fri, 29 Sep 2023 06:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 2/2] drm/panel: Add driver for BOE RM692E5 AMOLED panel
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
References: <20230927-topic-fp5_disp-v1-0-a6aabd68199f@linaro.org>
 <20230927-topic-fp5_disp-v1-2-a6aabd68199f@linaro.org>
 <000416ca-3bbe-4913-9fe5-0993b90b2829@quicinc.com>
 <9febcacd-675f-4d91-9338-f8b3fad4cf62@linaro.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <9febcacd-675f-4d91-9338-f8b3fad4cf62@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 29/09/2023 à 02:02, Konrad Dybcio a écrit :
> On 29.09.2023 00:00, Jessica Zhang wrote:
>> Hi Konrad,
>>
>> On 9/27/2023 6:19 AM, Konrad Dybcio wrote:
>>> Add support for the 2700x1224 AMOLED BOE panel bundled with a RM692E5
>>> driver IC, as found on the Fairphone 5 smartphone.
>>>
>>> Co-developed-by: Luca Weiss <luca.weiss@fairphone.com>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
> [...]
> 
>>> +static int rm692e5_on(struct rm692e5_panel *ctx)
>>> +{
>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>> +    struct device *dev = &dsi->dev;
>>> +    int ret;
>>> +
>>> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>>> +
>>> +    mipi_dsi_generic_write_seq(dsi, 0xfe, 0x41);
>>> +    usleep_range(1000, 2000);
>>
>> I'm not familiar with this panel, but is calling usleep() after almost every single DCS command necessary or specified by the spec?
> Removing them doesn't seem to cause adverse effects, so I'm willing to
> do that :)
> 
> [...]
> 
>> Are these generic DCS commands? If so, can you use the MIPI_DCS_* command macros/helpers when applicable?
> Unfortunately, it doesn't seem so.
> 
> [...]
> 
>> Just to check my understanding of the comment here.. so the above DCS command will set the panel to 90Hz, and if we change the parameter to 0x00, it will be set to 60Hz instead?
> Yes. Since the commands differ, I was reluctant to introduce
> a second, identical-except-60hz mode for now. Though I can
> define a driver-specific struct like this:
> 
> struct rm69e25_panel_desc {
> 	drm_display_mode drm_mode;
> 	u8 framerate_magic;
> };
> 
> and then define both a 60 and a 90 mode.
> 
> 
> I also moved DCS calls from .unprepare to .disable so that they
> are not sent to a DSI host that's powered off and will include
> that in v2. LMK if you have more comments.

Those changes would be great,

Thanks,
Neil

> 
> Konrad

