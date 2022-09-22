Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECA5E6165
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 13:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5466110EAC9;
	Thu, 22 Sep 2022 11:42:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE4B10EAC9
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:42:01 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id g20so9415658ljg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+1WSPKWPrsc/qCB3+vUopjI5nZ0YDPu4pJY+FLQ9d2g=;
 b=MFSvPboCRq4R6FIggkWWQ3DXdLdL9n5qZDgoEkrudLezY2MDKnJP4wtJs7ttGBOZSc
 BcdF0QP+wa6Flm4LNfPX3OZBlIlLdLWhJx4s5tb0gNyTDo0/xMRuI4cf7EOMULCWT8aO
 lqtu4MCYdNwM3f6e3vI5RjMCTyVE/e5u7MXcIP9LlzTxFdL+1KwnDby1EQznZJ+kRDUl
 0SyGrD4Mw2fjA99PNwqxVkcfKqY0g/0ul9z6SO3MhKPlEnfC26Hy+6waB8P0a+ruU77y
 QxCiDdSN/WPOVNDjIwRB9dhBf7Y2V/cV8+FsolgnsRUuLuP/FOlcir5kLI5xK1c2M8lH
 jH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+1WSPKWPrsc/qCB3+vUopjI5nZ0YDPu4pJY+FLQ9d2g=;
 b=bFol26nkAh0sz1rOQnjkMUkM0VUePNgjYFGhnv+MEfUO+Z2KH4sM8Kd3eLdkkp0OwJ
 jhegHQ/EZnNTgb+mZYJKLpEHu0xK8z6LcnSv3sV0dMwpwUy7MCCuO/jZ0MrKuh/VGV+l
 Z7wVZQIRT5hj6lCXiK7QMRn3dlULCemU5mo7w9A/2c7tytMjZptN+5NDd3pHzqNstDxe
 gYd25M9WsU38CDybTru2R8f3dhOdB3G6AI8ulXEO5+7eGPlPC8Ja80U+sR3wMfd8sKXa
 QK1EsvdFFmBvXO9IXOjP+aTS1q93IOreNOctIHnDaA1ZFC9w266baz28cXtelPNXgQg1
 2AEw==
X-Gm-Message-State: ACrzQf3CbAUjpfgByCDznSUltvmGk7+Vaihc1wKZ5ML+USnusXGQFcu6
 oISZL1On/DjlzHpodWjdww+YAQ==
X-Google-Smtp-Source: AMsMyM6zHeMHrlIuqY4/28l8FLxG/78F98uMeprX3YAgBNuR2l6PU1cveCKQz16copA4pZIFLZZisw==
X-Received: by 2002:a2e:940f:0:b0:261:b9ca:6207 with SMTP id
 i15-20020a2e940f000000b00261b9ca6207mr955616ljh.192.1663846920252; 
 Thu, 22 Sep 2022 04:42:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056512368200b00494a603953dsm902628lfs.89.2022.09.22.04.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 04:41:59 -0700 (PDT)
Message-ID: <4841c705-0944-9e94-1ade-47ad2f462303@linaro.org>
Date: Thu, 22 Sep 2022 13:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v7 04/12] dt-bindings: display/msm: move common DPU
 properties to dpu-common.yaml
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-5-dmitry.baryshkov@linaro.org>
 <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
 <CAA8EJppRdrfy5vPuLxH0+=DAELdadK4h6X0xmHA01rySoBFN7g@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJppRdrfy5vPuLxH0+=DAELdadK4h6X0xmHA01rySoBFN7g@mail.gmail.com>
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
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/09/2022 09:50, Dmitry Baryshkov wrote:
> On Thu, 22 Sept 2022 at 10:02, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
>>> Move properties common to all DPU DT nodes to the dpu-common.yaml.
>>>
>>> Note, this removes description of individual DPU port@ nodes. However
>>> such definitions add no additional value. The reg values do not
>>> correspond to hardware INTF indices. The driver discovers and binds
>>> these ports not paying any care for the order of these items. Thus just
>>> leave the reference to graph.yaml#/properties/ports and the description.
>>
>> This is okay, but you loose required:ports@[01].
> 
> This is fine for me. The ports do not have 1:1 correspondence to
> intfs. Usually platforms add ports as new sinks are added. For example
> a platform can start with a single DSI node and later get second DSI,
> DP, eDP, etc. as they are receiving support/required by end-user
> devices.

Then at least port@0 would be required. Node without ports does not look
correct.

Best regards,
Krzysztof

