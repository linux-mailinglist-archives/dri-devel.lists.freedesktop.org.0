Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B1690C873
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6BE10E53C;
	Tue, 18 Jun 2024 11:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ic3G01ER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3E310E108
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:08:31 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52bc274f438so5654448e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718708909; x=1719313709; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rx8LaT2iJCWh9sAWiRO7uFEZyjt/OGNDwxdgEioegZI=;
 b=ic3G01ERieDDMx5VXCTJ9lWZHhibsewfLgnEluC2TBLXJX8eQc3VN+ZjbsAsBwvSsg
 spOXePCyE19CScBRDOSbd/n+hzsLypDdRN1WFf1g+Z6q84PkGSBagdzWf0cZZfdtWhso
 ZcMh26++fZGnIwlclLBJShrSeSoOlajqmI8gR6riMjImwesFMkd7Y+4Yg+OeejaOB8xP
 G/TEWRzeQxtPnARAqS2I/EB0EdgQlefbUsKINHlUNWek8+D2ekY+hfOk3YKxhYJPTZLc
 tj7wxuP+iq8liLP6pV3Ss1gEj4DYJrkDDtht6a3hXKOAURUNcuuyvXCVquGXwfL3x0UE
 4TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718708909; x=1719313709;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rx8LaT2iJCWh9sAWiRO7uFEZyjt/OGNDwxdgEioegZI=;
 b=P4/FRpDJf1kXV5DruqVFR9ZRhHmo9Na3v7flofzXUBt0yTP7eEdZd2MvPh/I+frqQx
 kLj0PKnrYN2SWsQswgxqFyohYfcJbY95MvIQ/6UY+O2Zyq8L6l1IKWvzJYg+3In9nSSQ
 VYfqBz7yAmqJsHscw+FhHo8VIF67yXUGOMjAgZBK0SZ2BUk2S2J431JoG1whNz7lzW4I
 i7of+8O3kW537VTmJVF3fFredly4Tt9E0r0BSQHXqfUOJePDxJEAHF+tbWytSf/16t5W
 B3gyNACr2cr1IcUX5Fo4AkI3rXeaoKWE/QbYI7HxTojJCDBe3x4pmmMVAd+7T1WOjmkq
 8JyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRcawWZ3V3MoxCrpqZ/vrLeW8pwFs07com+9vTvdOcK8fNkIMCdUr0pxatBhUN0ksSTp3nPOQyDp0mtWjriS3HVmuC1IZoF/GTttywqAij
X-Gm-Message-State: AOJu0YwGuX6GGcohKNGYw4xjNQqS6Zm3FoDsE6Y70G09APqEqZ3dSBG0
 vWg0E/Gbbr+s47g99vw+YuInXQB7AfjYxFrWoBXGeNIzWb47OAULc+R/isrzMBc=
X-Google-Smtp-Source: AGHT+IE8iLnoe7evxfTRQ3fUk5EMJX78UOkrfeDZUvup0x80fKNJfWmM6oYILoqiwu1riUTXQrFZ3g==
X-Received: by 2002:a19:f703:0:b0:51b:214c:5239 with SMTP id
 2adb3069b0e04-52ca6e9f465mr7402205e87.62.1718708909384; 
 Tue, 18 Jun 2024 04:08:29 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca288858asm1485694e87.289.2024.06.18.04.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:08:29 -0700 (PDT)
Message-ID: <f074d638-ac47-4324-84f7-b7723f18ba8b@linaro.org>
Date: Tue, 18 Jun 2024 13:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/msm/adreno: Split up giant device table
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-2-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-2-robdclark@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Split into a separate table per generation, in preparation to move each
> gen's device table to it's own file.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
