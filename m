Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A4B79A596
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 10:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5727E10E16B;
	Mon, 11 Sep 2023 08:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C229B10E16B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 08:09:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-401d24f1f27so47202605e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 01:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694419750; x=1695024550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EbUzjiy4o1vK6+eGTRCo3FmI8I3JuBmYotzF+QEDbUg=;
 b=QrEO1uQdBLlbvhfnoJ+E02sH0EOF+/9kilYgOXy2RMlDAEtCZVRRTYXOrGy+RtJkLZ
 aExYKskmONmPysFN+ddHp5KxmR9J6kjIWxFLm2GYGon7z+slGyjj211sU3sHIugRkrpB
 VMyH0s0p4tQ9DLViLpqGYVEoK4GCodWKfuo/RmZJDX8+NaSrE0TKssI8/9kd942yMRIB
 sDnAgn4I0wtHocecR3iI+Rr83Q0U8cD+/mcwe85u44qs0b23ehwt1mNipRA4bNHgMHRo
 lzjQfuitjOpgW/c/DCpnJr23xwTVnm3mZ82wWpEb+ES4V1YXn3n/oUZ4DFBe31rSsQ/9
 0t1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694419750; x=1695024550;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EbUzjiy4o1vK6+eGTRCo3FmI8I3JuBmYotzF+QEDbUg=;
 b=IBJk5T/rIkMNUN8Fwvu+d3s7mPDti2ffBP5Waz/7rmca1yaArmdbu39MA0DebP3p/2
 PKfzYeYV8b0ycZzKM+wlYXthFqqbKahC5MRhN8a3Hr2JIrlBCnvhwhCdgaHVRCPI3fcW
 WXpEmmR8kVWQYb8mMoFLALOUVQnxBjlPSOgdHgU1a5GNeOL3JD62Prg6akFXlmzcb0M9
 PndS6nJ91SDju8Vjuzkj3KF95Chd3NfrqYJPKqYS8Qz7GEop8LTzgSbvGANFzwH/bCLM
 pSfrFc81Aanb0FF96RcjhTMBNNC6292rQfe5LIlyCt0lpgxxwwfvSZFIUIGKNA1YZL6a
 YCmw==
X-Gm-Message-State: AOJu0YxTzyStlpfrOXWtEZQ/eIe9y5Th8xDpo1t4YsqyKh8w8dAkqyZG
 mOKxuPMxO7nXLN7HjCaQVXCXKQ==
X-Google-Smtp-Source: AGHT+IH17NjBNGmOzEesnEW9tcv/zDzsg0kaDQGZfVp6yr4OvabsTsarBsJUqtBSDTS43yE6uYtPtQ==
X-Received: by 2002:a05:600c:b5a:b0:3fe:15f0:dfbc with SMTP id
 k26-20020a05600c0b5a00b003fe15f0dfbcmr7767575wmr.12.1694419750151; 
 Mon, 11 Sep 2023 01:09:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
 by smtp.gmail.com with ESMTPSA id
 w18-20020a5d6092000000b0031c52e81490sm9359869wrt.72.2023.09.11.01.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Sep 2023 01:09:09 -0700 (PDT)
Message-ID: <9476d20e-a0f2-e8cf-db4f-d07dda86bb28@linaro.org>
Date: Mon, 11 Sep 2023 10:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/9] arm64: dts: qcom: apq8016-sbc: Add overlay for usb
 host mode
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-3-vignesh.raman@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230908152225.432139-3-vignesh.raman@collabora.com>
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
Cc: emma@anholt.net, virtualization@lists.linux-foundation.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@google.com,
 david.heidelberg@collabora.com, sergi.blanch.torne@collabora.com,
 gustavo.padovan@collabora.com, agross@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, daniels@collabora.com, linux-arm-msm@vger.kernel.org,
 mripard@kernel.org, helen.koike@collabora.com, anholt@google.com,
 linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
 robh+dt@kernel.org, dmitry.baryshkov@linaro.org, guilherme.gallo@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2023 17:22, Vignesh Raman wrote:
> Due to the presence of the fastboot micro cable in the CI farm,
> it causes the hardware to remain in gadget mode instead of host mode.
> So it doesn't find the network, which results in failure to mount root
> fs via NFS.
> 
> Add an overlay dtso file that sets the dr_mode to host, allowing
> the USB controllers to work in host mode. This dtso file will be used
> in drm-ci, mesa-ci.
> 
> Overlay DT file uses the sugar syntax [suggested by Dmitry Baryshkov and Maxime Ripard]
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v3:
>   - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
> 
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso | 8 ++++++++
>  1 file changed, 8 insertions(+)

Split unrelated patches to separate patchsets. This has nothing to do
with DRM CI system.

Best regards,
Krzysztof

