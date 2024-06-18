Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B390C8A1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 13:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788EF10E63D;
	Tue, 18 Jun 2024 11:11:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VAsbEmSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C82A10E63B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 11:11:55 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52cc10b5978so1500672e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709113; x=1719313913; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tCJ1koSXaUSbG2q6a2DQFAstliIPSMU/Xsi5Jpzojx4=;
 b=VAsbEmSXBYRgf4VxBY8pegUgsLEkQrhQlA8QS++/3MT79zorlhkWjjQ2JQ/TsW2DXH
 pgX2i4KQBnoefbpZ9buG4UmaW0B/H5HefUnzRfFxDnn8XaYjDAIKmb3H+jYVRPUO3Vhy
 rLsaZXMwAqDd4fXIACDWJZbc8WO2A2Ctv4NsYzDyZYfVhE+6fAtGpZuokku79Pzm0z53
 xNn1+34nydxCKD80RWtWjHgDaejq+uny/XDCvJ/YAKJDlm2kGWmJFa62zBEnVL818NDa
 7s20wZ1d5Eu8xkkplXmcaq8TL4b3H+qIQ0kyp3PUphcKWRJnX5ApDsxuOTTpwv6mD5Sk
 zg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709113; x=1719313913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tCJ1koSXaUSbG2q6a2DQFAstliIPSMU/Xsi5Jpzojx4=;
 b=vSSvv84CHGEXdfZEvnhBVpypYgHaB0oKy23AS9pnXC8TQWcjuuzkEa5ClaDkIKbieO
 8wGRAlsSiXOgaFKJHI5NP7wamfrVGuuWwRKksUGHJSkConK32vEksYJGouaWonn9S211
 kfaoS+vDGcTiCupN8u/RsU2GIsBCkKSh21YpIdCAzHK2d62HyKlHauIgTzeRQdxq+9H9
 2nZhvEkEC2U5C+1eREY14CTnZcQLVrNjhHtIS/rmH/hieg5wD9n4C1q/PfmxGKHVGNOx
 c6lQXe3uckEDITLaU/rb+KLYlxm/IsnhxjQoqWj3giAS8Jb4JHA1ZAoMelxqW1AjcxpF
 qW8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP+J3azwBwbIvK8cuS6q/7vL5LMfSn2uKQUuZMBaAoRTSNl7kPY38+qK90+g3VBYUaO0xjYSfXTm6qGWelE0YdVDXo1c00m0B3hx+zFxB7
X-Gm-Message-State: AOJu0Yw19/9amfq/Wvtqyk0w3B6cZ7ODS4uyLe0n+FPG4Ik3DvXMsGw8
 QzXrf6/LqHJOFttfGcCWMpAKqTbgD5QftBxkOl8x+Ch/6PM2PCGLaa7E9OIuoODkrdDu+begVCi
 u
X-Google-Smtp-Source: AGHT+IG4NDeCUql9vT+yjYQb6VBnlvabxwjfMz1iCQArGCJOw0YSMVEKgJePGYR0dmojAmuJWyu8kQ==
X-Received: by 2002:ac2:490e:0:b0:52c:9413:d02f with SMTP id
 2adb3069b0e04-52ca6e659e9mr8585345e87.17.1718709113180; 
 Tue, 18 Jun 2024 04:11:53 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca282f2ddsm1467138e87.87.2024.06.18.04.11.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:11:52 -0700 (PDT)
Message-ID: <948d34a9-ff11-4ec0-ab6f-05e87533caa8@linaro.org>
Date: Tue, 18 Jun 2024 13:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/msm/adreno: Move hwcg regs to a6xx hw catalog
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-4-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-4-robdclark@gmail.com>
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
> Move the hwcg tables into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
