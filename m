Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 094A77455ED
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 09:24:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C3210E0A6;
	Mon,  3 Jul 2023 07:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC04410E0A6
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 07:24:31 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbc77e76abso35620175e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688369068; x=1690961068;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=KgMnJ8CKfBislhp1HG0z8FmS5BLcV5+cmaj4jvnhxWQ=;
 b=lKrkHVcsQngHENPpMshxYINgAv/o3G4zjF9clGaCwoFrRmttkUWr4CBrogdvxNzMS3
 VBP86BoCy3AKClMFDF9HKPnJtmGpdmiipRLgTXgdGNS4e85wXCTHXgQTmURXCy5fNf5m
 LxexEPRA7cwPlrcsXz+F1rXEQI1sP8laktduTFkvWEbrgg/jMuTHCuPebIqG1ozPUTdZ
 IUYsdmpolDS8JvoAktsNi9dCycog7boyCBWaDP3PYwLu4lolTKdY5ehvy7aTMVfkLHfK
 R07BeDK6M+Dv1Kr+KwncWpguMs+6Gv792dGNu4Jf1DKoHce2DPoWYH74hji1yCmqMA4W
 sEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688369068; x=1690961068;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KgMnJ8CKfBislhp1HG0z8FmS5BLcV5+cmaj4jvnhxWQ=;
 b=J/0u1dgS1lYfFPy0SxgzMuDFm9F9dnpK3ypPU3Qx+3v0ztGOitT3r7+l03jznC2epC
 IZbaQ7bsezWhjfw5OlKwaOvBqMb9w4AgtlcGYSUq2sU5NBz38CzEwULBCbX9Zi7x60jC
 gOHah8GHvDqB08a/7R/vYlPMX1YO8f5OrznSrHVTTsdy7IuaD8TTwJlildA5c0jIyIPu
 O3oKseUtiH87Mq2Ol0MpKuszec7HtMk2aBWg1KlS+XSNQMpT/Klieb/2XGjgTXO/eCOs
 ybUBKvOldD7EH9yLG5SKJGaU3GQX7BiyJr2vwDBmL0vxtQ/046OlfQ/HxDnG2YTMb2wJ
 tlHg==
X-Gm-Message-State: ABy/qLbxrkc5QRMvtOTayrohZVJT6t8ZGsy62vovfxORe9RQJQb+e8c7
 xS/v80qSSsLSNJJFe58Su+h+xQ==
X-Google-Smtp-Source: APBJJlErVoF0iApuPq86HVOvO0iLKPOR8uT2faeOcndYld3NEwBM2GZKbdz/+srhnFDYERI4fgA7tQ==
X-Received: by 2002:a5d:6349:0:b0:313:e48a:d173 with SMTP id
 b9-20020a5d6349000000b00313e48ad173mr6657516wrw.68.1688369068512; 
 Mon, 03 Jul 2023 00:24:28 -0700 (PDT)
Received: from [192.168.7.21] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 u11-20020adfdd4b000000b003143765e207sm1899030wrm.49.2023.07.03.00.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jul 2023 00:24:27 -0700 (PDT)
Message-ID: <65d78d07-be4f-8ea0-b322-353b5c23fcb0@linaro.org>
Date: Mon, 3 Jul 2023 09:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 5/9] drm/meson: gate px_clk when setting rate
Content-Language: en-US
To: George Stark <gnstark@sberdevices.ru>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Nicolas Belin <nbelin@baylibre.com>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-5-fd2ac9845472@linaro.org>
 <c487ed03-0ab2-74fb-91bc-4a773bfdfc5b@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <c487ed03-0ab2-74fb-91bc-4a773bfdfc5b@sberdevices.ru>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2023 20:10, George Stark wrote:
> Hello Neil
> 
> On 6/30/23 19:29, Neil Armstrong wrote:
>> Disable the px_clk when setting the rate to recover a fully
>> configured and correctly reset VCLK clock tree after the rate
>> is set.
>>
>> Fixes: 77d9e1e6b846 ("drm/meson: add support for MIPI-DSI transceiver")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>> index 57447abf1a29..dc63d2d813a9 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>> @@ -94,6 +94,7 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>>           return ret;
>>       }
>> +    clk_disable_unprepare(mipi_dsi->px_clk);
>>       ret = clk_set_rate(mipi_dsi->px_clk, mipi_dsi->mode->clock * 1000);
>>       if (ret) {
>> @@ -102,6 +103,12 @@ static int dw_mipi_dsi_phy_init(void *priv_data)
>>           return ret;
>>       }
>> +    clk_prepare_enable(mipi_dsi->px_clk);
> probably should be:
> ret = clk_prepare_enable(mipi_dsi->px_clk);

Indeed, thx for noticing :-)

>> +    if (ret) {
>> +        dev_err(mipi_dsi->dev, "Failed to enable DSI Pixel clock (ret %d)\n", ret);
>> +        return ret;
>> +    }
>> +
>>       switch (mipi_dsi->dsi_device->format) {
>>       case MIPI_DSI_FMT_RGB888:
>>           dpi_data_format = DPI_COLOR_24BIT;
>>

