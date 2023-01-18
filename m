Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0757467100F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 02:32:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064C710E605;
	Wed, 18 Jan 2023 01:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E5310E628
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 01:32:08 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id ss4so72415318ejb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 17:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WmuAGUEJgzr87EeXDQbFh57PgRhQGPH3NOHcW4zPvxY=;
 b=UexVHvSB6XQAhPAWIJ0nYTTqeXSJILVIecAUvV/QIXmQXyxnIaYUpT5VDv9iSoqDP0
 mje+pWNsM4Z34wVsqveK0S/QVYZYeappJ/qdLBsv2qMFI9HwZiGvxcK+F+fFddFa+2/T
 VsvlKILzGCFp/gabOfKM/YxTypADk6DognnFQjOS1EkykLl3pR+nynCuZjix9VEseBIq
 hEEc/hbMMPkeEEfycet8wQ22pDUxqIbvbTIWVSMISny0FRycs5Gx8sg4xulaAKPoPOI0
 Cvola1mE7+BQtSzYSIXUlsLoRz87731JJ61Pq1AApkeeUUR1RJ4cKP20mn616JpJ/GEb
 emsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WmuAGUEJgzr87EeXDQbFh57PgRhQGPH3NOHcW4zPvxY=;
 b=3gjCfTS/vNvY8HV6WKevnuMmzjhTcCVL/g7cW9j6ldu1LLhbUXg6vyoyuhCciqxvMD
 5QWpat4rcwA/BU59afcyW+hqL+Al2G4mot7n6dNtCSSDtKK2EVP9OrQuXVpYLHbA7HxV
 65WAE31XOi3Wl7MfPtTNjIBrw9n8dAvIxZPbghn5oWytlO5z0IP5se4noBjY8uh4dIbm
 aPvGFHs2eHQ1Z3E45Ml+Hb6ZsDpKXA0Zw4nr4NWHFE2si/BZ0DURWsCMa18K3NefFzFA
 ji932+m/HKWWx35GupiXeHRgMHBujxC5299L7glGIT8EnvgmlVejHZtp7X/NqHwjfEuq
 6ZBw==
X-Gm-Message-State: AFqh2kokm80iDPX8QjkBN4hCqNuHaweg+HLKqXmYx/2QoZuXW701DnWr
 kw7B3GZxxhwPLtJ4WxJDmmuPGw==
X-Google-Smtp-Source: AMrXdXsriPBC/u2WzPrwGYBCsosA0BsYTypVYoyxIusZ78gIkGgTQzrVWOsu/jmesepNcjchR4QWeQ==
X-Received: by 2002:a17:907:6f18:b0:7c1:98d:a8a3 with SMTP id
 sy24-20020a1709076f1800b007c1098da8a3mr5058276ejc.7.1674005527000; 
 Tue, 17 Jan 2023 17:32:07 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906311200b0084b89c66eb5sm13799464ejx.4.2023.01.17.17.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 17:32:06 -0800 (PST)
Message-ID: <40261e85-f501-7326-76b0-b19ca3aceae9@linaro.org>
Date: Wed, 18 Jan 2023 03:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] drm/msm/dsi: Drop the redundant fail label
Content-Language: en-GB
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, dianders@chromium.org
References: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230111011006.6238-1-jiasheng@iscas.ac.cn>
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/01/2023 03:10, Jiasheng Jiang wrote:
> Drop the redundant fail label and change the "goto fail" into "return ret"
> since they are the same.
> 
> Reviewed-by: Doug Anderson <dianders@chromium.org>
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
> 
> v1 -> v2:
> 
> 1. No change of the error handling of the irq_of_parse_and_map.
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 24 ++++++++----------------
>   1 file changed, 8 insertions(+), 16 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

