Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1B4574935
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 11:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2B710F4EE;
	Thu, 14 Jul 2022 09:38:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34302112D65
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 09:38:32 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id e28so1880959lfj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 02:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TLtLAzqKjh0PR2hCiXTpWedWr6UZ/eh69O/Av6dFIUQ=;
 b=OrBeTbStBItEd8xp+RbyOHCOHfiOQOJrv5ANEz6qxRGixDOxMAJ5IzUuiOQejXwRyZ
 GMkAV6A+Rweq3b6Zxv0mjMm0eoJjr5PRDAQoZco1jCPPb6IAeQSgEB2x3wySZxwH92CG
 v7eIrrSCr/lzKx0racL0bqV858CJVvFs+RCUV9Iz1I0MBxltwBK4evG6S/Rrl/H7V2lq
 Ly6NpupvlRiBmGyepoRqeTavRvkISkRMGu8PAVRfuuZ3Oo+jFfV9oe/nSZlU3EbSClps
 DnYZKmYZJgdiBMW09JWHhs4cqCCLdFQrr5ck858Ixns9msDblNZPtZkKYbuhOiwYqNSY
 /OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TLtLAzqKjh0PR2hCiXTpWedWr6UZ/eh69O/Av6dFIUQ=;
 b=7zlBqRClVkaoTBxFVZXwNSeyrzfas1hCUWIEnKN3ETI01NX9yo2VKT/K2Yk4Ae7zPG
 g1dtt4/yvGcONnCpWPM7rNPyIk2iC3TOLcdQDmOFWbB1YkM94N5v2MYLRIYPGU2FPYbU
 BqyNYRZ64Z61CzswvFGo3DvVBPLtPBEkAu7wdsSvQr0ELKdq5sF5aEvOQes2FekP/wBx
 HDpaRhkn1R+SR/3nYFhUAjBRFeG/c2vSRBhrn9UZc02kC1frdfAKRnpprZfdA74Bwyq7
 c+oCHi07rJFZx1jH1ZXdwkGatWcKdTKri2t7ez0svaD9yLAj7jX7PGEvX2evSExQO2R/
 LuNg==
X-Gm-Message-State: AJIora8tdvI9oZi3YKMUFvBGwfwTONSZs/628pJV1dLb3URULVH0BqRx
 IwVB7sl7R95cjlF3QnVay26GNIQmnuQYRw==
X-Google-Smtp-Source: AGRyM1tc/J/ECeZYTPp1hWc06zGMIdJAwt8bxeNi6BFWllabpCBNba0Lt2QRG5hj0HKnx9MN0GD8zQ==
X-Received: by 2002:a05:6512:2308:b0:48a:f9d:7389 with SMTP id
 o8-20020a056512230800b0048a0f9d7389mr3812939lfu.235.1657791510561; 
 Thu, 14 Jul 2022 02:38:30 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a056512214200b0047960b50c26sm262242lfr.78.2022.07.14.02.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 02:38:30 -0700 (PDT)
Message-ID: <bd84ef20-e6e1-74e5-5681-7aa273d5255c@linaro.org>
Date: Thu, 14 Jul 2022 11:38:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 7/9] dt-bindings: msm/dp: mark vdda supplies as
 deprecated
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710084133.30976-8-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2022 10:41, Dmitry Baryshkov wrote:
> The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
> functions from eDP/DP controller") removed support for VDDA supplies

No such commit exists in next. Do not reference unpublished commits. If
this is your tree, be sure that it is in next.

> from the DP controller driver. These supplies are now handled by the eDP
> or QMP PHYs. Mark these properties as deprecated and drop them from the
> example.

Right now I cannot judge whether this is correct or not. I don't know
what's in that commit, but in general driver implementation changes do
not warrant changes in the binding.

Best regards,
Krzysztof
