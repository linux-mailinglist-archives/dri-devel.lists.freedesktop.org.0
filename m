Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97456F219B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 02:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77A7010E279;
	Sat, 29 Apr 2023 00:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468B510E279
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 00:29:57 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so2854215e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Apr 2023 17:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682728193; x=1685320193;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iiCF4OnwxjmLf3NeMqtDogKkBQycEZ1KKUyCMRH1bAQ=;
 b=Yyz+/IjOdagk+9PlvWN88UlEn1X1/vrQb3GBPQTuvSIot2K9jCdkdOnEE7Ay8UJoqb
 b4BWOAlwfhAM33VX0MvIBFSfgC0R2sPyIS3gVm8zfuPLIJeTfA01+eoTvIyChSYKa2Zr
 mrWiPyTC75fEVUNSs5S9idlkaKiG6XbqXUmlSJr/2oZKijf94dW+g/A1yffpRKSGGlv0
 eVd2epif3fsb+okfFBjTSdbdDD268zSkmf907eq9Pf2gyaprgQtyqQZR7M0Wazx72ZXE
 7025XgUWg/8YAXFMPn+eg8xV2aI5BtKJXE38jkd9Vetdx/RmiSjm0SsVPX2WIFIWuN3Z
 l4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682728193; x=1685320193;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iiCF4OnwxjmLf3NeMqtDogKkBQycEZ1KKUyCMRH1bAQ=;
 b=ShuM7Yy+I6yCPVux03oFayUGUA6+swPz3fXTdqB1mJ24owCglBlsR8sUzyOo5riNVK
 VrZGAPB2S6c5lj02y/frnSx46DGoLLmXLpvT7XWcDVW5wakcP7HbHvf10giIoAApd0fS
 yfKRTR7HtSFGGqWP6jw1Mmh5yFyVGhqD+ff5A0kHebhVcdsvW2UsQX5IutU0f7w3zX/K
 822Ud+AE/DMAsVbPG/dpeCF+Y3gXQ65XWDDr2aZpiMSnrhi1lYP76Dx2JcFr6KrR+E4Z
 3RwU9nWhmI25HwSPGG0oelkULElcQXErMKsL7EaOhxni3Lu2oxOo8zoq1KYuIJm9Lyl5
 +D7g==
X-Gm-Message-State: AC+VfDxrTSpztbcB0iyOVuIaga2jEMux1cZN1l9z4rCYRxP1VgYW2cmr
 IZDSHIWaRxDuwrrsbT8/uNHinw==
X-Google-Smtp-Source: ACHHUZ6tC3OMzhsDU9xiKI+1LEOh6A9DsBYjRaeBqbDzEVQj9IGhTX6w7rY7JBvYO9jf4eb3gjKujQ==
X-Received: by 2002:a5d:5222:0:b0:2cf:f01f:ed89 with SMTP id
 i2-20020a5d5222000000b002cff01fed89mr5766079wra.24.1682728193374; 
 Fri, 28 Apr 2023 17:29:53 -0700 (PDT)
Received: from [10.6.147.212] ([212.140.138.218])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a5d4dc8000000b002f9e04459desm22133933wru.109.2023.04.28.17.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 17:29:52 -0700 (PDT)
Message-ID: <5089956f-a5ee-5b18-ce83-edce6999d583@linaro.org>
Date: Sat, 29 Apr 2023 03:29:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 0/7] add DSC 1.2 dpu supports
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682725511-18185-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/04/2023 02:45, Kuogee Hsieh wrote:
> This series adds the DPU side changes to support DSC 1.2 encoder. This
> was validated with both DSI DSC 1.2 panel and DP DSC 1.2 monitor.
> The DSI and DP parts will be pushed later on top of this change.
> This seriel is rebase on [1], [2] and catalog fixes from [3].
> 
> [1]: https://patchwork.freedesktop.org/series/116851/
> [2]: https://patchwork.freedesktop.org/series/116615/
> [3]: https://patchwork.freedesktop.org/series/112332/

Changelogs? There must be one, either in the cover letter or in the 
patch commit messages (following the DRM subsystem custom).

-- 
With best wishes
Dmitry

