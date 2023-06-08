Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EFC728474
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 18:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3326B10E5E0;
	Thu,  8 Jun 2023 16:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8AB410E5E0
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 16:01:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30aea656e36so592643f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 09:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686240086; x=1688832086;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7N0Me9LjM46FYnisAvuqmrgrl7WoCTNWh45Ff6Fxt+8=;
 b=gttB8sY1m+B86ejkha7nAJU1n0KqrIOK7/sE/rRK+25H1UZieT+zsdO+0rbQsLvd8c
 I5Wg1cN1mXR6dwl9pV1manGgh6gIXrJ5ejHXFmNhNlK/GwIbcCHiQ4Nol+lvAiZ3Nz/6
 IUIodkLs1oL6rJ1BrAJee2TSfDWhch7w+c/l6diK2u07lhMSpEMzoBn7zgHBxyNLbtVO
 9krXCIXohBCU0mTJKeVMEoeBhr5PZwHzxlx+2hTEK2V0qawxe5iorOerjQrPdYuT0POs
 ScbIiHt6M8pjMZUAiz8KlXmLcrq0QAoRHXzQb4VKx/QBUsUWp6OKjqBFlNaFdkGhEYf/
 dy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686240086; x=1688832086;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7N0Me9LjM46FYnisAvuqmrgrl7WoCTNWh45Ff6Fxt+8=;
 b=XlXvLbCHIcu4LOWCMoyxOgRMnr67xCghJSmC6pXiemvqYrdZGg2N7Kd1AkCKzRiDfi
 QmiSSekmPdyUMM8alGoBCveNI4t1oDEztuYyTVWJyoer5R8BDRk3bEtHQU/LxnxKoML2
 SvcchDWEjC+psWfHZb7kcCuf4IkAtFbUlfCPTyPOOZ2XiGhIHPsANANAoAusLLbz1HQW
 5GhRak22/r1X0GnfAlcr3Y/mgKPG3BST+ayS++wnsKtfeKSMUuHsSqHsrhVyFocNTvGU
 0GrnfDiYo9F2YPi22L8GqQZnkjWgTLSMP8FT0ii0VbY+VSUKfdrhC1zZ1StUM2xD8XVl
 U71Q==
X-Gm-Message-State: AC+VfDwehBhlgZUPql/ym+y4U0LS1qalyM2w+QxQgAVmRgIfucICqnD7
 ge2kYkElwcK26eVSPPIJeI3FwA==
X-Google-Smtp-Source: ACHHUZ7ANFpS9UIJc7E0g+O6KdyFemqSpysdX1P7hU2MvokU9kB5rChedkc1nVMugLJPuhTQdqxDUw==
X-Received: by 2002:a05:6000:108f:b0:306:2fab:1f81 with SMTP id
 y15-20020a056000108f00b003062fab1f81mr6925306wrw.21.1686240085766; 
 Thu, 08 Jun 2023 09:01:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1b90:b83e:29ce:beb6?
 ([2a01:e0a:982:cbb0:1b90:b83e:29ce:beb6])
 by smtp.gmail.com with ESMTPSA id
 t12-20020adfe10c000000b00307acec258esm1975127wrz.3.2023.06.08.09.01.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jun 2023 09:01:25 -0700 (PDT)
Message-ID: <817a8764-45ac-74a8-935f-69d32d68f5fc@linaro.org>
Date: Thu, 8 Jun 2023 18:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/2] Add support for Visionox R66451 AMOLED DSI panel
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230516-b4-r66451-panel-driver-v2-0-9c8d5eeef579@quicinc.com>
Organization: Linaro Developer Services
In-Reply-To: <20230516-b4-r66451-panel-driver-v2-0-9c8d5eeef579@quicinc.com>
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 31/05/2023 20:12, Jessica Zhang wrote:
> Add support for the 1080x2340 Visionox R66451 AMOLED DSI panel that
> comes with the Qualcomm HDK8350 display expansion pack.
> 
> The driver will come with display compression (DSC v1.2) enabled by
> default.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v2:
> - Reworded panel bindings commit message for brevity (Krzysztof)
> - Used corresponding *_set_column_address() and *_set_page_address() DCS
>    helper methods (Dmitry)
> - Moved *_set_display_[on|off]() and *_[exit|enter]_sleep_mode() calls
>    into _enable() and _disable(), respectively (Dmitry)
> - Dropped cpu_to_le16() conversion for
>    mipi_dsi_dcs_set_display_brightness() (Dmitry)
> - Unset LPM flag after DCS commands are sent in _on() (Dmitry)
> - Used real numbers for mode values (Dmitry)
> - Used drm_connector_helper_get_modes_fixed() in get_modes() (Dmitry)
> - Added BACKLIGHT_CLASS_DEVICE as a Kconfig dependency (Neil)
> - Added error handling for mipi_dsi_picture_parameter_set() (Marijn)
> - Dropped "0x" for dcs->bits_per_pixel value (Marijn)
> - Link to v1: https://lore.kernel.org/r/20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com
> 
> ---
> Jessica Zhang (2):
>        dt-bindings: display: panel: Add Visionox R66451 AMOLED DSI panel
>        drm/panel: Add driver for Visionox r66451 panel
> 
>   .../bindings/display/panel/visionox,r66451.yaml    |  59 ++++
>   drivers/gpu/drm/panel/Kconfig                      |   9 +
>   drivers/gpu/drm/panel/Makefile                     |   1 +
>   drivers/gpu/drm/panel/panel-visionox-r66451.c      | 390 +++++++++++++++++++++
>   4 files changed, 459 insertions(+)
> ---
> base-commit: a5abc0900af0cfb1b8093200a265d2791864f26b
> change-id: 20230516-b4-r66451-panel-driver-bf04b5fb3d52
> 
> Best regards,

Applied to drm-misc-next

Neil
