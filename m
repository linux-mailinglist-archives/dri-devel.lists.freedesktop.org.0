Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F81C69FE23
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 23:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE76210E445;
	Wed, 22 Feb 2023 22:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4189D10E46E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 22:10:47 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id r27so9835069lfe.10
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 14:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u4mYbzQ9cgwTl+69pCWin73Y2hlI6/ouh6GkkcpHJEs=;
 b=pGRGa8VHaQVYRZl+HXCExMLMBiULJptfRc2lr3kNFPsIf8JUa36WV+Xpf6lZS/l3vx
 yRPqSjVBUE9kMQEYWcpUUkNbys1JXsxmKoLRejio5ACOa5uT5AqMGx/VkSDq29Y0+AsY
 VUu0EN//vB6TBijnhOyeGkkuSbXwkYexekJgnOhf848VpyQR3HtSBsPfrHZqxFH60CP6
 ANq32REb17kzxwK8nS8UW6xxbS3PEiZr4fnJpoP4z9MrdjmkifAl4xHSwQ71dojEpwrJ
 9mmCs5X2cfnd1/LYCEoqMQRWxTICzqrADTrqkAGCBCJU7r/jvX0NxTg5xdKBchPiXv+5
 PjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u4mYbzQ9cgwTl+69pCWin73Y2hlI6/ouh6GkkcpHJEs=;
 b=RiKS+1nWCcnrgbszGg87KzgRjJCLvEuHyqhl/ySR6zcWJM3hJXNEG71haEO7UFG/A1
 BnpUk8pb72ZOTBjZmVLbIRwyq0Dsh1seSUyUT/Xo0TdbYLzjqN+J/myhdiM+zPnu6tuY
 Myg/B5nV18//mRCSn51ScVKYgqXy7GDHUbwksddPZ9pr6jtuUqmib79gwrHurrwwCQu1
 XgeGj6NvTdIFJlYdmtyZ08Ryb1gbLK6nRzsfHhUeHx7Fs5LYA6H+wHSq/PxTNoSxuG1r
 UC/mT9SZjczb6jneB4rsYGERenKRHvVMgucTFPmid8qJGx4eNLDROB7OqyNJK+kLyf+D
 GIcQ==
X-Gm-Message-State: AO0yUKUoEbNnNWGgZuTGWkctM3CBT56jhkenSU8pBNRWOLeGOBKjo5Hb
 W6uKhIPJxdHPodrTS1DX1HBNVw==
X-Google-Smtp-Source: AK7set/IjvGyF7xyCv2RYJe+CEGvQ2ntC7MMr1iIO9quNinHmQlwonGSpH/aP8ZV6jHrfpSv8T4MqA==
X-Received: by 2002:a05:6512:7c:b0:4ca:faa4:af15 with SMTP id
 i28-20020a056512007c00b004cafaa4af15mr3016648lfo.66.1677103845348; 
 Wed, 22 Feb 2023 14:10:45 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 q3-20020a19a403000000b004d869c1861esm2280873lfc.192.2023.02.22.14.10.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:10:44 -0800 (PST)
Message-ID: <628b480e-caa8-6230-6fe8-4cd582372afa@linaro.org>
Date: Thu, 23 Feb 2023 00:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 3/5] drm/msm/a3xx: Implement .gpu_busy
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-3-01021425781b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230222-konrad-longbois-next-v1-3-01021425781b@linaro.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/02/2023 23:47, Konrad Dybcio wrote:
> Add support for gpu_busy on a3xx, which is required for devfreq
> support.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #ifc6410
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

