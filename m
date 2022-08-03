Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF37A588777
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 08:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7D410F91B;
	Wed,  3 Aug 2022 06:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFBF10FECC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 06:37:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id d14so13159292lfl.13
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 23:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3C/lNt77+qlJDztrS8WVjy6lbQy6qfEyINiYOOYnU18=;
 b=OkTTeDdgE1wq3JFHiRmbjgpyqJF9kC+95jnwwzwrKilHNWflwBySJidfMTBFuX1US3
 JLlom3TZgEzsdoeqoGjWDbLUUs/wzgFAasq1I/3bubb/U3cA+rKmxQqyjFFm6Goml4Kd
 yL4A1YBkBsHnJ5jm/nuf9kXHpK+/Wh/bXGqfyfPkqHdEjzw69+Co4UoPHz1VMgo2gXTQ
 n0GGainzh8Hw+TW+JVZ9ockkmlKNfPaTYHI2oNT/mHU4J9H03QGZhyxvdaY0z6pejV3B
 UVlfzuHuwgOOoVEZDOtR0K6eVjW6IEUuWpk30GlQNTScVwvI6zi1tmQlxysqusRscnZk
 PhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3C/lNt77+qlJDztrS8WVjy6lbQy6qfEyINiYOOYnU18=;
 b=0WzW6IwBMeWfdUlwQathGLXqfqog1+aSAQw6R/EGs2A6HeQwCB1R5IwHAlsmbJi1L2
 vNRXIBOQIlfuFccL+e1QQ0SQOyqKyBLu6yjBDbtSeZKkArtcQRvdXxctbt3gI9QdHC3m
 zoab+Lp2rTym5B7C09LUKjKKdR4FnHefy+/k6WiYsVwVsDoC/Sq7P6cYa28UqSXqb5If
 vjEEDdcSBmeICSOeTufU2nOuvV51dPDoyVtvNwMdUYFlhNZo+i1BizVxcXRQRwBL6Zdt
 YnVkKT+PLZm7JcowJ5//AgtJRYSByWrT/O3bXY62npKhhd2lmE1tpYoYkIFMuM0cXLQG
 oIjg==
X-Gm-Message-State: AJIora+yNdHEVjIQx5yqte8rV87GAf+hnwmtbwUsw6ccsvVUQRmkuBBd
 fRX43SvcOLyEPn3SbdaguQkWTQ==
X-Google-Smtp-Source: AGRyM1s5ZskGPA3x2RfGUG+ZddgaBOYCr+PGg5vqJBsdELbLJDGDQFIGpzGmtTAa7OvrGnkfkkU8OQ==
X-Received: by 2002:a05:6512:3f0c:b0:48a:433:6d3b with SMTP id
 y12-20020a0565123f0c00b0048a04336d3bmr8447107lfa.570.1659508649004; 
 Tue, 02 Aug 2022 23:37:29 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a19f80b000000b0048af437ce87sm1246604lff.183.2022.08.02.23.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 23:37:27 -0700 (PDT)
Message-ID: <f2453080-d71b-3c33-ba8e-d2ed15e06927@linaro.org>
Date: Wed, 3 Aug 2022 08:37:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/5] dt-bindings: clk: qcom: Support gpu cx gdsc reset
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220730144713.1.I68b749219741db01356a42d782f74265d29a2ac3@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220730144713.1.I68b749219741db01356a42d782f74265d29a2ac3@changeid>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Andy Gross <agross@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/07/2022 11:17, Akhil P Oommen wrote:
> Add necessary definitions in gpucc bindings to ensure gpu cx gdsc collapse
> through 'reset' framework for SC7280.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Assuming discussion in cover letter sorts out:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
