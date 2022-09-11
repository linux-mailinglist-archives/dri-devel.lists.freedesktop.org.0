Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9565B50D8
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 21:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6418510E522;
	Sun, 11 Sep 2022 19:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EFE10E522
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 19:19:37 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id q21so11620524lfo.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=apzG3xku8I3ZdvmAyq4e50tGVV+Ky/wz//4vHO1DJgc=;
 b=uHlWNh9ubEWHL2dHypDQKfqR1vRoY/u3L3VnE52MFf9bJn5LGd5ehhYXJt4m/PlbkA
 CtfIVcb3pu57WkiF8DjEesF+PUeUqeqypzKQv9x/xL0alQnOgPA6+9E6iMqbuzmIP/vR
 hpc0sh2T/OoVBKPl6RqUDE2cYXhJOVZ5Yl37F103A5WJxwE+lAY/EpDBLvt8uaHYVx4c
 ZBp4gmvoNaCkEVgaBlB3H1Om6APfYRccQwZvrjsdULChjMmqfF6ECNwGKTElkN0m3jbF
 XUx1Zth+D30LLZucO386T9b+3KJF6q1A5w7HnBpc39zXCVtUOu4NBN0ZeVCXnqoRWfj0
 UM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=apzG3xku8I3ZdvmAyq4e50tGVV+Ky/wz//4vHO1DJgc=;
 b=5d/w7zGWpWXV+Ofwl4J7MLA4Ocq/3q9fGTBgmlMRkUd1iiUyEXMOYAogryG7WPAVbQ
 U95ZG/bVBtFDxk/eI0+OqVHowOwjSb0GwxlNi+Be8x1+zyX/hlwBZeb7sl5TEhYOGy42
 XvRagu7ucTCAjPWaXJwyL2I4NEVi67QF9KTM5qyAjZYjgOBi+WvZuLrGc/DhtiDfhO8v
 dLU0YJ435236WQRwvQ0PvAekslrv5ZqpPAfOqCywtSZWM2ETNgxHJ/SWqzNiy1SoOvVT
 3RU+K4XtfQsZWOh8CrJ0oYF+AWb2zDydEYEW+igbMQ/XybUr+/o1qhfXZBVNbxe4UCuf
 dbnw==
X-Gm-Message-State: ACgBeo2JA1cdqLkoy+JxU4grNyjO+E807kwH8RNxuSJcVhoMmLVgr0lS
 IIedcPIyDV+pZMChXNiRXNNdJg==
X-Google-Smtp-Source: AA6agR7HkDM6NL+ZQ3n6KFtN5GzDUUVIGgl3PFqUw1Fy7FX4FxHrVRhX6lvmxFhkZYmEKyoUD/zzow==
X-Received: by 2002:a05:6512:15a5:b0:49a:84f4:9284 with SMTP id
 bp37-20020a05651215a500b0049a84f49284mr1115466lfb.477.1662923975359; 
 Sun, 11 Sep 2022 12:19:35 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 h6-20020ac25966000000b004949ea5480fsm703756lfp.97.2022.09.11.12.19.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 12:19:34 -0700 (PDT)
Message-ID: <2b4ab827-28aa-5e3f-951a-0bf43d1eb7b9@linaro.org>
Date: Sun, 11 Sep 2022 21:19:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
 <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
 <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
 <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
 <f013accb-96f7-a025-1d41-e2e97f8b2aa8@linaro.org>
 <CAA8EJprnrKP9Ze__KTTNGDs8sj3QhqpiHnnhf1=ipq+CFCoXsQ@mail.gmail.com>
 <272413e3-73d4-8e0d-7b5d-93007e419f76@linaro.org>
 <6e3bca5a-8b01-af12-ae69-b0044a8790f6@linaro.org>
In-Reply-To: <6e3bca5a-8b01-af12-ae69-b0044a8790f6@linaro.org>
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
Cc: Loic Poulain <loic.poulain@linaro.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2022 20:36, Krzysztof Kozlowski wrote:

>> If your child schema fails, the referencing schema fails as well...
> 
> 
> Although now with DSI-PHY I cannot reproduce it and I am pretty sure I
> reproduced it with DPU controllers after modifying the DTS to lack a
> property... Hmmm

https://github.com/devicetree-org/dt-schema/pull/82


Best regards,
Krzysztof
