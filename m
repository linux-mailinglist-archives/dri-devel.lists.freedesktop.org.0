Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F20661B00
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 00:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A862D10E21C;
	Sun,  8 Jan 2023 23:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 927D510E21C
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 23:12:46 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id cf42so10475820lfb.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 15:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uyFGGVLs/X6oL8cfpRetF9oZ4VlqVuFMXwGIYKkQRkI=;
 b=aG6LThJZqWRVweoJO0jwQRjFwKWagT5dK6iw1vNYa/3/jb36t7n28l4RiVNMMLp+TL
 V4vYPcOBkysP+/81wr9FLgC46uEDwyG+H9ov0vjKzenY25TODIePHBa47NTg57a/NeDb
 LYTs48iYMrtkGH4nrlZVI7opycnG8sFve32x+GwWkf0vas7KlbIA+4y6E7P6ymWt3e/t
 iphUJilhxSgyDbYf5z4om8VYBZ2+5TzgYJHV9d4zr+fkLRWbZhj5kyDhqCYp4E65EslW
 /v9SzJEENG7HYFRK/tG/Q3XsBUbvpP3AfaXQ40BPaNJtBoBFqlWGXIj1tJH6MLwymTWF
 JZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uyFGGVLs/X6oL8cfpRetF9oZ4VlqVuFMXwGIYKkQRkI=;
 b=g8/h7zh4GHGD+CSl3i4dSaClGRt+55cTmWy1N5MiWoI3GjZPo4JkDCE6VUCuCdQCpR
 VAMfkhCSWBbKJdt6h5qWO7xZU8j9xZyL6jL/ZW/ourCIx/6nbwroKhK3VH16T3/hfHPZ
 bTu1i6yRCtcI3VT3S+aTjnGIzqTjhhCopn3VgytyEelxDghj7202C7inn3a9vgXjSbWk
 KNl6FTMZnWwvzns/HGH5HD4OJvYDQN4B1/bt63UV2n04ym/iwt5CKKr+kKg2kfWyadwh
 FicOPqVx9Tu64u/vhJSveTEkM1Z71yRxrv5+6Hi4092TTgvlGRTf3ZsDwk8zwQEBSrlX
 Jpzw==
X-Gm-Message-State: AFqh2kr+3pKwVwogJXplfdA7Pw1qYMlmKubYpkiBvApQjG22pae5Jggi
 T/cLyT7WodIFepcQ2eg6U/L461mV7snO5jMz
X-Google-Smtp-Source: AMrXdXtBO07Ci/cm6XtwIo7+eG+FyzqM0WTNU0N/lz4hEY76r1feVjhiX6KA8dHnX1QRCX23G/Qjcw==
X-Received: by 2002:a19:f517:0:b0:4c3:35b3:9a0e with SMTP id
 j23-20020a19f517000000b004c335b39a0emr15285692lfb.56.1673219565005; 
 Sun, 08 Jan 2023 15:12:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 du3-20020a056512298300b00494978b0caesm1266728lfb.276.2023.01.08.15.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 15:12:44 -0800 (PST)
Message-ID: <dfb08b6b-af9a-e96c-fae7-386f70815455@linaro.org>
Date: Mon, 9 Jan 2023 01:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/6] drm/msm/dpu: add support for SM8550
Content-Language: en-GB
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-3-9ccd7e652fcd@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 11:08, Neil Armstrong wrote:
> Add definitions for the display hardware used on Qualcomm SM8550
> platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 197 +++++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |   1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |   1 +
>   4 files changed, 201 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

