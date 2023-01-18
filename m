Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266506723AB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081A310E7A1;
	Wed, 18 Jan 2023 16:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8849410E79A;
 Wed, 18 Jan 2023 16:41:01 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 b10-20020a4a9fca000000b004e6f734c6b4so8901606oom.9; 
 Wed, 18 Jan 2023 08:41:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9wKMQGGFU1eDeX8/jjd9sz0V6MAyY1fPhZwcj43WxgQ=;
 b=L5fwTpWmpglC1ygf/lipSUBm4Ktxmgar/l2w53vbAJGPUzE7E8jkdUG0p8/oLyJL/F
 +c+iBcOHlxZy+0PQGT8MIGOY4GZBRuLCvWXtdLWu9KWu5tH9FuZjA0V5AM+UJH9QBDgp
 CREeA2toNaQ861UC4b+pJi332ERWTN1lpX3Y2378zLl51yzUcVt+MVnZ8+yAlpPqqvRX
 YksKjrPzqtm4TxuocIZmihmdJstIKSFdDb9cRVNvrjY0SVKmhTnDm6WnFH+ViGv/x5S8
 0ggnQt8g69PEtJV9jjL29LOzn2v3Q/TDGMGVreAggIqOzusDOByWPhL3cMDvPrzKTrpS
 IeJg==
X-Gm-Message-State: AFqh2kqZLJMn/s7PlML3pTGnyJDS896gIkZpgTND2tei/Elapz0EiNqg
 39xdAeu+fDv9D8HsZhuyWg==
X-Google-Smtp-Source: AMrXdXv21zuVYxlMQ03/7MY98M38etX9IZNwquD4snNv+52kcYs0MYyLe7bGSngYF2QI5Pp3Ghb1pA==
X-Received: by 2002:a05:6820:171:b0:4f1:f5ae:6b5f with SMTP id
 k17-20020a056820017100b004f1f5ae6b5fmr3373188ood.2.1674060060828; 
 Wed, 18 Jan 2023 08:41:00 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a4ae557000000b0049f5ce88583sm16728716oot.7.2023.01.18.08.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:41:00 -0800 (PST)
Received: (nullmailer pid 137661 invoked by uid 1000);
 Wed, 18 Jan 2023 16:40:59 -0000
Date: Wed, 18 Jan 2023 10:40:59 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 4/4] dt-binbings: display/msm: dsi-controller-main: add
 missing supplies
Message-ID: <167406005824.137582.10336637561777246237.robh@kernel.org>
References: <20230118032432.1716616-1-dmitry.baryshkov@linaro.org>
 <20230118032432.1716616-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118032432.1716616-5-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 05:24:32 +0200, Dmitry Baryshkov wrote:
> Describe DSI supplies used on apq8064 (vdda-supply) and msm8994/96
> (vcca-supply).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
