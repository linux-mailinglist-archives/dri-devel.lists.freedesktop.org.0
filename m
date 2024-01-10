Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA41829900
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C652610E5C7;
	Wed, 10 Jan 2024 11:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02410E75A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:27:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e4e3323a6so4668316e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 03:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704886032; x=1705490832; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z8fqLJGB4BORM/e+032bZk6rSSH31yu0kVoWo4ILNqA=;
 b=ZVvjmBFuodxUe4Gl74JFbo0FOwY2IyqYMBzTJn1xExdrBJW3kxPgSDoIh3TH6yzD5E
 MxS5XQVfWGc1jtyAE//qLmj/HdoR7w6CslhrNrDUlDDnTuoXCNL+ktELEpfOLPoz5fbr
 W8iO5uXDPeUtKDxCbo0BaRJ7n1dIzRq/v+vIOV19cmz/COixb2wlkw03jdZpPEecyefs
 /TUU7srgIDTK1ols2X2yHvOW7iHA1wmvG87lr275KARofwkPFIumDz1tjRBBWuJAyek1
 4pa/aPXeum8U19P+gjSuKAxc4W5MoiY0m5PqQ1iBmLzrD4O7Rhe7kDW7Uef8VtR0XmSL
 GWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704886032; x=1705490832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8fqLJGB4BORM/e+032bZk6rSSH31yu0kVoWo4ILNqA=;
 b=gVZDgnW+H/7VJesOmHbZB4YWZNU/9hsyeDbk43rZfclhfyyjGEijznp2iXdzYIZM9N
 uK1rH5iWEIpR80jO7926onA1rKExU90g0Z3Ezq/zPGEPq9/PA46ws70wsYPS8687fYlo
 ZEzFdo7oBA6xhSuSH7oUosRt1ZFJg+VH5jg8VuUyZLzPLIR50vkJ9asfoqnW01/PrP4u
 9iRfIP6U7spdGgl91FzndHqIllwkH1qDYxpmIy10zYsO5tGi7NVYz4eaPobMCmd32LYy
 /WHu1xbhImUD9J7vJxKNhOpesePaHOKy+5ZZi6QuUwY1PuG036zlBq/8TvoxLyOlqOxe
 u49g==
X-Gm-Message-State: AOJu0YwmBjaUApeGG2sXbXpbWvT8GB/rqEq5H2/aJ+XSPNoBM7KN8ry2
 eQpXJElTUbKRi6er7xezt0JlqEVmCIUD3Q==
X-Google-Smtp-Source: AGHT+IFMzQJGktOuWmBl23WHZe2kgD5663wQfDGQ9NlnRH8dRYMaZKwgzVMCv8dUK8l/Na8BqMxgrg==
X-Received: by 2002:a19:6453:0:b0:50e:a436:aafc with SMTP id
 b19-20020a196453000000b0050ea436aafcmr333897lfj.9.1704886031779; 
 Wed, 10 Jan 2024 03:27:11 -0800 (PST)
Received: from [172.30.205.119] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 x8-20020a056512046800b0050eb7941041sm632908lfd.297.2024.01.10.03.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 03:27:11 -0800 (PST)
Message-ID: <0c77e014-9f08-44ac-9495-eb2a8afaac80@linaro.org>
Date: Wed, 10 Jan 2024 12:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] drm/msm/dp: drop dp_parser
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
 <20231231-dp-power-parser-cleanup-v2-15-fc3e902a6f5b@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-15-fc3e902a6f5b@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/31/23 01:44, Dmitry Baryshkov wrote:
> Finally drop separate "parsing" submodule. There is no need in it
> anymore. All submodules handle DT properties directly rather than
> passing them via the separate structure pointer.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
