Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B98621E52
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 22:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F88510E03C;
	Tue,  8 Nov 2022 21:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3EB910E03C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 21:12:58 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a15so22956906ljb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 13:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wIdfbTng+tTAaILuDn9NZccChxnc1mAMEr243g5AE5Q=;
 b=iTjLTbcG99SbapGUPOpT8KcxRneAH8zYd4dQyMRXYtlti+glhDtRyLgvP5+CzzyfRv
 Fih/uqwNJ1eDGMVCFWx2tx9LCobMHtTd94MqkpcvGko+pS70kYfkZ5uLWF3idV8s7PRG
 8ArTY6mX7/cnjb50OcQITOrV5KZSXqA8SJW5meeudaev/T54y3GQSjc26MAdnhMxr6go
 lV4Bltmxy9zViJM0YWctiK9UUHGgSxycoWy2hNdiOVj/qUBqzTIEm0AqWF2J6eRao15n
 PmieweREvx7OVbDwwuRX6ynqXrpdbyr7uIlGVBQPlL1B+lItiFP1rblnW3Dv1aNKfFyt
 2qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wIdfbTng+tTAaILuDn9NZccChxnc1mAMEr243g5AE5Q=;
 b=DLxUOyMptvheZFXZkoPCoY7GJtMJexoZLAyOibFgyUnGGRvjI3r3TqKhhCRTa/Au2k
 fO1X2TfZ9JZ1l7XiW0G7yFbDuGZ22uB6hQpynX1U13CwB8f8OkYODGkFRwdK+wBykkP2
 qDkjty8GOrh0cuV6qmUcUnbcTBdNt5j7PGdJL3YwY6g8d9JojwEKKTCIPchjxBnWY7nR
 209Jb/6Lj7Mb6joj1q7nYcqjuiySEVzaBpBARRmLVTtiML94nlcczNja9S39LY0RhYF1
 mPcvJNdjB3g1/ZjAavP2wPrIm4IHne2SvFMa3OXHBP9W3jCrSCNJNQp9isiUXMFwXERM
 +gGg==
X-Gm-Message-State: ACrzQf29D/f1wVe6iV5gBp53qZXdeKWWYBAlWEvspoilaGjxhi5Qlrdq
 Kp2TZjwJht8MkPmY8EQtUkNHIQ==
X-Google-Smtp-Source: AMsMyM6SgLmkxRFWJTxBTWSWRlGO/aMwDi/n44UGoH2/Rnkq8C6kWntqL+Y/9AfeOxEM2rY1scJwOA==
X-Received: by 2002:a2e:b94a:0:b0:277:91a:737 with SMTP id
 10-20020a2eb94a000000b00277091a0737mr18825127ljs.25.1667941977231; 
 Tue, 08 Nov 2022 13:12:57 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25f70000000b00492dba3c85asm1935745lfc.220.2022.11.08.13.12.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 13:12:56 -0800 (PST)
Message-ID: <6d671b6f-517d-54b5-23ac-49ba62c64701@linaro.org>
Date: Tue, 8 Nov 2022 22:12:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/18] dt-bindings: msm: dsi-controller-main: Fix
 description of core clock
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-6-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107235654.1769462-6-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 00:56, Bryan O'Donoghue wrote:
> There's a typo in describing the core clock as an 'escape' clock. The
> accurate description is 'core'.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Cc: Rob Clark <robdclark@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

