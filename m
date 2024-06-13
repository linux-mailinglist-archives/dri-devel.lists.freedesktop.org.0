Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72AA90617F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 04:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8906910E94A;
	Thu, 13 Jun 2024 02:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="Yd63dsTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 603E710E1F9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:02:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-421f4d1c057so5168135e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 19:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1718244146; x=1718848946;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f/z8i6Pl4rEpgnkeFbeRNLbhhFTG+NJSS60yF/T/YdQ=;
 b=Yd63dsTkeS8OB2hOMhkOnVlkFXyDJb3bEfswXAm/hQsXzpBSW0nhLtpb/z3x2EFE8X
 seXywIjcuk+fpV31HQgF/5GstIs2ViL1h62VkKYfTwldVkLhQWRjxSC04uhCJ4ZifVDW
 AOinEpWKt5LEER0CPJVUHVz5l1FHMp+JXVcJ7kcqWGgiXS8W1O0BTnnG6WPblmfJ0hqx
 DdTUuu3YmLScNQEAlhZ3n3zt1AEcYRyEFi1alFsJxDVIqjogEuyYazt/5t9I0EMH+eCu
 TerXBV8LyLUBT6jHwDSZ5de0qLQQTBLGGK2Ol3WFUAVCPk83AqjT4+9/1xKtVSK8VNnc
 mB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718244146; x=1718848946;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f/z8i6Pl4rEpgnkeFbeRNLbhhFTG+NJSS60yF/T/YdQ=;
 b=k3at5OmQ4IaSEZnQ+jmyNPZ46JkuvFxg9vrwQSS6/nBGZlVwRt1OG50UH4hvOHD9xD
 5UQXNRJ+BuAygmhdIQ+6v5ClXbs5US90HnoWU1lqOMVLT9qYg6O2A1TprYwFAuwUcsro
 qFN63cdX4UvpgxZ8MZ7RnreCv/M25mmqNOzqCuI1Y2wK8uBr9UNkTgGo8szMLuyqw1bI
 CvHr8Pree9w0deY7dEz8uvpU56hbvCQeA7IAL5SKvC9F4RHqUjfhEIx6gy/dfkMIkKJe
 lLKwU48JB2TG9sHv+eNsF26ng5gh5ix+0waxfwRnNOamS9o3qyoTOuSdcs743gtvMhdG
 iZYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0DtOlajFeodNYrPN7aTszPSAOBBAY7DYJO1xjtAuIiGzT1dqtFwmMDSBniJ7rQXQA245MshEtxh80Rw+1+b4NJRAep2cBrxNrfVUyMvUD
X-Gm-Message-State: AOJu0Yzc88XxVEnyuWF0aHt5QWRoE4wBWaI3gGUmFfNo6P1gAhV77k9S
 mpGrZVDKDMhcSgsfBD7lYx+c4PevWNpnrDUj38iRMCPdO+u0p4L2HPa9PlCkzUI=
X-Google-Smtp-Source: AGHT+IH6TMZpM7WdFYZbCGBFJhgYHsC6JVCHyLOSB8U2qyBnIKYrH50ZszMxXRh1Ocr1UWGgsHDyFg==
X-Received: by 2002:a05:600c:1f89:b0:421:7476:6ba1 with SMTP id
 5b1f17b1804b1-422866c63e4mr26634975e9.38.1718244146199; 
 Wed, 12 Jun 2024 19:02:26 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ec24:52e0:4005:4e7a:f4d9:7f14?
 ([2a01:e34:ec24:52e0:4005:4e7a:f4d9:7f14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f641f522sm5550255e9.48.2024.06.12.19.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 19:02:25 -0700 (PDT)
Message-ID: <af3f71e5-6864-475d-aa90-74986d516bae@freebox.fr>
Date: Thu, 13 Jun 2024 04:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr> <Zmnejlkb869mN3eS@matsya>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <Zmnejlkb869mN3eS@matsya>
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

On 12/06/2024 19:44, Vinod Koul wrote:

> On 06-06-24, 18:07, Marc Gonzalez wrote:
>
>> HDMI TX block embedded in the APQ8098.
> 
> This one too

I assume this refers to:
"Why is the patch titled display/msm, this is phy patch and it should be
tagged as such."

I always copy what others have done before me:

$ git log --oneline Documentation/devicetree/bindings/display/msm/hdmi.yaml
27339d689d2f9 dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
6c04d89a6138a dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
e3c5ce88e8f93 dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
2f14bc38d88a4 dt-bindings: display/msm: hdmi: split and convert to yaml

Are you saying we should diverge from the previous nomenclature?

Regards.


