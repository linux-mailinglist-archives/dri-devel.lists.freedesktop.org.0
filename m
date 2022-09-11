Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74145B4F3E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 15:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A704610E46E;
	Sun, 11 Sep 2022 13:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3278910E46E
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 13:57:30 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id a8so10677526lff.13
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Sep 2022 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=sUy2r7OpYbVTxjP66h3aOfUcbCczz3Xb2QL907aFIfY=;
 b=EeEQNO20u/AcC8mN1VXzTnmX4WBQlRAKnxPq0MFZyt6FjMvOtn61bEaHA3Ql1a87DO
 hQ0L0yl1Z5BZ+RQvJ+gAhBK2YRSZANff6Yc76SMzARAE9ef2IOg8WZUkLrEIjvWfdH0h
 g46zfTFzuwyeeToN/o+JSLgxk0QmCfbm01PYtWXUhvME4sAXg+Mbm70tUpeSCyyyEO4D
 rpr8+1gF7e1XO2SvCYDEpGqbwGPvtqfcQw11+Jcf7py3rJXV0Qm6DyVO3mvLeBWLL+5q
 Y9UqhYLR/CeIhOsOMd1IP05kCq/nfMjPOV/tocyCjb2jxqOoB/lGyjAELH8oJSUCfGj1
 Lyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=sUy2r7OpYbVTxjP66h3aOfUcbCczz3Xb2QL907aFIfY=;
 b=CEoGmYiDXu93OHx1llFYxlqtkG851BiaWJojmNRW1pmrTVXT/ziLqnmWmQjji+lhwA
 uTtHO/OGa/bzcUHbRuad9n8sX+NakYFVqD4pTqmsOVBZ9VU3DJPmLKHJbUx4jrazh3hz
 RNz4LBfAtYalXs8A+KPQ/HXuV5K1CWZOn9S3Wn9PiUotcdkNvfHXw2EixVUXfxeYgaDA
 GR5UwbRexFT0hQ9bbtk9yGnOtEMzZy3pmcIXBwoeo/FnKv7LGhCxpq9BBeBekZ6stdHg
 aGtwnnfL3eVMlfWAEvk3xr7j1bctN+la6LrpA+Z/qN5AnC6iPoJcrFPo87rW9W389Gq/
 v1eQ==
X-Gm-Message-State: ACgBeo3h+LNnB7VIbEnAiw+zk6+xUk4oMjFM8VNoCetduVvZcxGgNpk5
 Wgab7zIegbWwEDXG0EcwRpzbH3heQeec7A==
X-Google-Smtp-Source: AA6agR6k3QkKGyQsoo4V+rbvrB3g6fJSbouAlVs4pVeVAPh5/JHC7Aw11e1/EuJMHp+jP5VGi1CLMA==
X-Received: by 2002:a19:5505:0:b0:497:ad71:39f4 with SMTP id
 n5-20020a195505000000b00497ad7139f4mr6224530lfe.226.1662904648482; 
 Sun, 11 Sep 2022 06:57:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o5-20020ac25e25000000b00492b0d23d24sm615623lfg.247.2022.09.11.06.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 06:57:27 -0700 (PDT)
Message-ID: <f013accb-96f7-a025-1d41-e2e97f8b2aa8@linaro.org>
Date: Sun, 11 Sep 2022 15:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
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

On 11/09/2022 15:45, Dmitry Baryshkov wrote:
> On Sun, 11 Sept 2022 at 14:27, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 10/09/2022 14:54, Dmitry Baryshkov wrote:
>>>>
>>>> However I think there is no such problem, as Dmitry said, that ref
>>>> changes anything. There will be always failure - either from parent
>>>> schema (using $ref) or from device child schema (the one which actually
>>>> misses the property).
>>>
>>> Initially I stumbled upon this issue with the dsi and dsi_phy nodes
>>> for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
>>> emit warnings regarding the missing -supply properties despite nodes
>>> being disabled. If I use `compatible' here, the schema checks pass.
>>> Thus I'd prefer to leave `compatible' here. Not to mention that it
>>> also allows specifying a tighter binding than just using the $ref.
>>
>> I don't think we understood each other. I claim that error will be there
>> anyway, just from different schema. So your change fixes nothing in
>> total schema check...
> 
> If the node is disabled, there will be no different schema check.

As I wrote before, there was.

Best regards,
Krzysztof
