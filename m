Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E850EB09
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 23:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E1E10E0E9;
	Mon, 25 Apr 2022 21:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDD510E0E9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 21:08:27 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id x33so28477103lfu.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 14:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HeAipw4zYNeia12j7XYVHYU9J94Bm4xqgnpreAQ+Qzk=;
 b=bJuLeSOBykWi8VGrKRwylfeefE2eR9q7qefiHN/24sOZYASDOB9zymZS0eZbwAsheU
 Gn4212dpt17MZcEosVxxHQ1QU71XN3nv/dW+3Sgz+L/ZmBsC+H8kYSSCGKgVux/H0RZJ
 OlHI/3SxclyA+rX2bf47Vrd+l8jqMnjmfHjFL8evdEp77DNfVFCA6pbb7dQy/DGPXKYD
 nwXorNKIEOk5/vOMCoxziHmqaFKWA8YpmSxLjZ6iywDpExXO33x6Yq1p/nXkMzvdwhtS
 +Gf4v9krns0rCYdVYEaZ+LAnv+gS0yE48Kitf0Icp0BbyPAXL+1aXCkrteqcXE8WlyRA
 ZNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HeAipw4zYNeia12j7XYVHYU9J94Bm4xqgnpreAQ+Qzk=;
 b=TmJgMVWmi4nZIHvls54d8KwhzhEcbzfIv3x8vYGlpyNxyqFbHzFshp5w8vR1iGDZAQ
 LeP2t5XlIe0WmQROtbX9a/UqJHDjV8ProZxwUnODiGesMlkZQ8S2+vnKKYtH4Znd1E5Q
 rLJo9eOzuY3R3+yT8BQEEOTIu4I4mFjE5yl898TzN/yYVbJAVy7Gu9RCGQBJx0PIVLu/
 UL+IMa8NkxfcbQU3XIbkD8hf2f/omo1eCK7Xj7lb6yiZ9eCpSL+He5QbuRIa9JMBsjIJ
 daa5MOUZ3emB0lN4Ya27/0YILQa7RdaVvgFetKmjPjA6aYqGC+gsrcwxgsgxMN/BTLxA
 4yWg==
X-Gm-Message-State: AOAM53088jVY4V1ZPLQJVDM0WU4WzDxilud0VtEnHQaon8nXZ+dLE0xF
 Z47z4gay0rJ4RFuVpb+fDDSt1g==
X-Google-Smtp-Source: ABdhPJwa4PWVY0l1RBVql9YpM5TgtmLWxVWf1CxtDSxCxju9pLQGfESguxQXkIRMvWAE98kugzeAgw==
X-Received: by 2002:a05:6512:239c:b0:472:3d5:7e77 with SMTP id
 c28-20020a056512239c00b0047203d57e77mr5600455lfv.448.1650920904365; 
 Mon, 25 Apr 2022 14:08:24 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a19f203000000b0044aef0e60d5sm1528696lfh.210.2022.04.25.14.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 14:08:23 -0700 (PDT)
Message-ID: <517db2b8-6be0-2f2b-f98e-ca5ca27d0603@linaro.org>
Date: Tue, 26 Apr 2022 00:08:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/msm/dpu: fix error check return value of
 irq_of_parse_and_map()
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, cgel.zte@gmail.com,
 robdclark@gmail.com, sean@poorly.run
References: <20220425090947.3498897-1-lv.ruyi@zte.com.cn>
 <CAE-0n50fs1fFQcwMCq_x_UG8ZJKprjcYKwcy1+1ckD--XE28+g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n50fs1fFQcwMCq_x_UG8ZJKprjcYKwcy1+1ckD--XE28+g@mail.gmail.com>
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
Cc: architt@codeaurora.org, linux-kernel@vger.kernel.org, ryadav@codeaurora.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, tiny.windzz@gmail.com,
 angelogioacchino.delregno@somainline.org, jsanka@codeaurora.org,
 freedreno@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 skolluku@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/04/2022 23:10, Stephen Boyd wrote:
> Quoting cgel.zte@gmail.com (2022-04-25 02:09:47)
>> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>>
>> The irq_of_parse_and_map() function returns 0 on failure, and does not
>> return a negative value anyhow, so never enter this conditional branch.
>>
>> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
>> Reported-by: Zeal Robot <zealci@zte.com.cn>
>> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
>> ---
> 
> Question still stands why we can't use platform device APIs.

Let's do a separate pass and replace all of functions with platform 
device API.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>


-- 
With best wishes
Dmitry
