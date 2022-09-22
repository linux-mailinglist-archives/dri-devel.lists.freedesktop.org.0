Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9955E5BC5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 09:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B8310E2E1;
	Thu, 22 Sep 2022 07:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14EBF10E309
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 07:02:10 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id s6so13127074lfo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 00:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=pdMpDMokcwVOJqnQpimhWe/RXCV/4GAZ3Xwilz2fB5Y=;
 b=lWG2vlw+HbUs+e4cvoL4X3kEe1EFLH5TjKPiwExcWmnMPfiIopTwlJqZNIMzg7o+Tw
 2z6cLr92oF7Z8T3wkLCnr8RVdE2aCCGe3lgWuGOiAHMBiSnqgEha2GEgiUjl2lsIRu61
 rW90vZkvZXvZi3txZ9GsJWn5tZ0Ijwlgi42DoojriprBGeAt1nB8gLyUehi+vNKZ8Cs6
 5271ZZmBVxC8mcg+iKzX3ukrzFrIPbIaqUoHFYykNamYQWTmyjJIkiqUBFVUtSLF70pf
 YUWANbIboMHHpG1kTavvGtY32fHWijbJdB6qGRze/eG8dGKZH1MqMXriKZid+ESjI3tG
 vZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=pdMpDMokcwVOJqnQpimhWe/RXCV/4GAZ3Xwilz2fB5Y=;
 b=WeD2eYVHx0C+e8v2Nku2k5X2uKau+ew/z2AM86+4fAshbge4C1faVcKeve9EPrTYB/
 dYLf8pHj9gKqv+toxaRoZgQGF4JZwcx2LCe/Q8OMK+EN0TnOfevtiAMWlTK3UINoQf5i
 9v5DfCTKSYIRuOEWunEkA6i2m4tONp41+RtYlMlU+KQOYsb2/W1NjHE9xi2C8ncJy+mZ
 SVSPEM7jmnOqPMZYXBoHh/kKNgjUz4g6S+r118Cn44FJAB52+pE+0jN2t3fa3ZwoktGy
 Fy4izt72dApQn8Mw0yWjLqpx0SYjYSH0ZR0Ni6bnRhkCX1e9vFDnk/3AA+TBQ3l+AH8J
 C5RQ==
X-Gm-Message-State: ACrzQf00pYASHcP0MgxOGDVgOh4LyPXDSgyxxjEqPFnW0i1WqzKhabIO
 ZS/ED9OCoj7XH6UVL6jtoL+Q7w==
X-Google-Smtp-Source: AMsMyM6CpVDXap4dA+dZGTLSih1+Z+piapgXEG1uJt14bvEIdGHamdIEjDjUC/yehg0wh2pWuZD+gg==
X-Received: by 2002:ac2:4ecd:0:b0:49b:ecd4:2d1a with SMTP id
 p13-20020ac24ecd000000b0049becd42d1amr644439lfr.528.1663830128400; 
 Thu, 22 Sep 2022 00:02:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 b10-20020a2eb90a000000b00261d619fb16sm757257ljb.82.2022.09.22.00.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 00:02:07 -0700 (PDT)
Message-ID: <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
Date: Thu, 22 Sep 2022 09:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-5-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915133742.115218-5-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/09/2022 15:37, Dmitry Baryshkov wrote:
> Move properties common to all DPU DT nodes to the dpu-common.yaml.
> 
> Note, this removes description of individual DPU port@ nodes. However
> such definitions add no additional value. The reg values do not
> correspond to hardware INTF indices. The driver discovers and binds
> these ports not paying any care for the order of these items. Thus just
> leave the reference to graph.yaml#/properties/ports and the description.

This is okay, but you loose required:ports@[01].

Best regards,
Krzysztof

