Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7756794EEED
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 15:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0DA10E223;
	Mon, 12 Aug 2024 13:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="Dj8DFXoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77F3D10E225
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 13:56:20 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so32380025e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1723470978; x=1724075778;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S8pPBKCtj1qMblogWbM7RgQzND2CLqVTOWooV2IgGeU=;
 b=Dj8DFXoRCPdcDnirreMCxLHDVtHSNNVpYhFDJFC9t0BZWd3wMDObU7Qjzjq0VnHaCX
 nlh6oq3kZrNDLAqE0W/7a3FX8YLDgM3NkvDfPHCcXXIScOVSDHlY+YZx84NeObq5aBLE
 Oaqb0Z8EErpoiutdwt8nNy/j1wnnCA1rqsOS3ldgfStUb/w6hB8nHcSDX7L5whUfDWCc
 LkiAEtGXNeHkGtBs+FdCpy/+C1GogUqAR0xMIbc2JAVMwb3eJm4lgyoxNReULFUzKGQ0
 B7gnt0tHeqhpt2b6sjUPM2Wq6dPWxbCwrvz6cbaTtmEaYgWW30BmsClKvT2Wem4yBzAE
 4Paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723470978; x=1724075778;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8pPBKCtj1qMblogWbM7RgQzND2CLqVTOWooV2IgGeU=;
 b=t+qZcJv7+UmNCZmXoj+gr+J0oYq0Ll2KVwKK5auRpHsCXSRFi3IYaLoCQwM7SjjQ2h
 p5qnvs/JFq+5ERHYlPto7DtiEOj6sDw2hHe27pVb+af6uCXSMkZXMcwMF8mu7DzMKERo
 PiOK5QOQ97FrOuJJzf3YKgWhcrOmuW/VzC3WNRLwB8Q0i2JzzjbnmQpqEBVhW18dEeci
 C7i978uEUyvo1kySWtV8HLK2Yk4Q3URFwwCoWYBavQhkF5Chq1r0mMwEPcAJ3KIWzd/1
 qvgVFg7zVGz+OvhufOxfK27L2MosMbt0rkYGxGQLpiLgJWSjBx1jingcCmNN2fO+r42o
 X74w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxMtGtCM/OCPfizWjunQqluwjz5V1LuBMSJS1uizHhKxqNpljj+g5M92D5xQKcDof/YLdNJ8koVcsF9DlFL1TcDwwJAgHzMqymlS08l3Qa
X-Gm-Message-State: AOJu0YwL/tFwu48YYH8/w6kSJDDFCKESzXHn4kvAAmVgv8xfKH7zXKU5
 h0qsvayoG4E/wuaAjeddP/T9sZUVkSh9xYodn/cVygSeNpjxQ5PlPhzounK8utg=
X-Google-Smtp-Source: AGHT+IGUCDDDJmPdkUeF51lGMXmc2B54eXkWDGs+ePmSEkQ87f4+LylylfieyVoH9qavVmYIfup6/A==
X-Received: by 2002:a5d:52c8:0:b0:368:460a:961d with SMTP id
 ffacd0b85a97d-3716ccd6f24mr267787f8f.3.1723470978233; 
 Mon, 12 Aug 2024 06:56:18 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4f0a66e8sm7602815f8f.114.2024.08.12.06.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Aug 2024 06:56:17 -0700 (PDT)
Message-ID: <0b2279f3-1591-4297-aae3-2b3b915b4a2b@freebox.fr>
Date: Mon, 12 Aug 2024 15:56:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/6] HDMI TX support in msm8998
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Conor Dooley <conor.dooley@microchip.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
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

Hello Rob, Abhinav, Dmitry,

This series might be ready this time?
Are all the patches supposed to go through
https://gitlab.freedesktop.org/drm/msm.git ?

(Probably not... patches 5 & 6 are probably
supposed to go through Bjorn's tree?)

Regards


On 24/07/2024 17:01, Marc Gonzalez wrote:

> DT bits required for HDMI TX support in qcom APQ8098 (MSM8998 cousin)
> 
> ---
> Changes in v7:
> - prefix the labels hdmi: and hdmi_phy: with mdss_ (Konrad)
> - DID NOT MODIFY patch 3, based on conversation between Conor & Dmitry
> - tested 40+40 boots with/without maxcpus=1 => no iommu panic witnessed
> - Collect tags from Konrad & Dmitry (hopefully b4 did the right thing)
> - Link to v6: https://lore.kernel.org/r/20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr
> 
> Changes in v6:
> - Fold HDMI PHY driver submission into this series
>   => [PATCH v2] drm/msm: add msm8998 hdmi phy/pll support
>   => Link to v2: https://lore.kernel.org/all/20240704-hdmi-phy-v2-1-a7f5af202cb5@freebox.fr/
>      - Rebase onto v6.10
>      - Move drivers/gpu/drm/msm/hdmi/hdmi.xml.h to drivers/gpu/drm/msm/registers/display/hdmi.xml
>      - Add copyright attribution
>      - Remove all dead/debug/temporary code
>   => Link to v1: https://lore.kernel.org/all/63337d63-67ef-4499-8a24-5f6e9285c36b@freebox.fr/
> - split HDMI PHY driver patch in 2 parts (PHY & TX)
> - Use same regulator names as msm8996 (Dmitry)
> - Remove printk statements
> - Add Vinod's Ack on patch 1
> - Expand commit message on patch 4 = HDMI PHY driver
> - Link to v5: https://lore.kernel.org/r/20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr
> 
> Changes in v5:
> - Fix property & property-names for TX pinctrl in DTSI (Konrad)
> - NOT CHANGED: clock trees for TX & PHY based on Dmitry & Jeffrey's remarks
> - Link to v4: https://lore.kernel.org/r/20240613-hdmi-tx-v4-0-4af17e468699@freebox.fr
> 
> Changes in v4:
> - Collect tags since v3
> - Reword patch 1 subject (Vinod)
> - Link to v3: https://lore.kernel.org/r/20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr
> 
> Changes in v3
> - Address Rob's comments on patch 2:
>   - 'maxItems: 5' for clocks in the 8996 if/then schema
>   - match the order of 8996 for the clock-names in common
> 
> ---
> Arnaud Vrac (2):
>       drm/msm: add msm8998 hdmi phy/pll support
>       arm64: dts: qcom: add HDMI nodes for msm8998
> 
> Marc Gonzalez (4):
>       dt-bindings: phy: add qcom,hdmi-phy-8998
>       dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
>       drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
>       arm64: dts: qcom: msm8998: add HDMI GPIOs
> 
>  .../devicetree/bindings/display/msm/hdmi.yaml      |  28 +-
>  .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |   1 +
>  arch/arm64/boot/dts/qcom/msm8998.dtsi              | 128 +++-
>  drivers/gpu/drm/msm/Makefile                       |   1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.c                    |   1 +
>  drivers/gpu/drm/msm/hdmi/hdmi.h                    |   8 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   5 +
>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c           | 779 +++++++++++++++++++++
>  drivers/gpu/drm/msm/registers/display/hdmi.xml     |  89 +++
>  9 files changed, 1037 insertions(+), 3 deletions(-)
> ---
> base-commit: 003a26f5074bfe024603cf76f8fd486a5344f307
> change-id: 20240606-hdmi-tx-00ee8e7ddbac


