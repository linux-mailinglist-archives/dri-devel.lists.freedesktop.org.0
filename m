Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9C0544B55
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A0011315D;
	Thu,  9 Jun 2022 12:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1231130F4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:09:55 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id b12so14930763ljq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rim2Ki2Eu3BjQABgKkl/x6ZfzcgX4FO+4AS4UaRphF8=;
 b=CL9aPDC4zmgstdQlhsmmruoiv+PY/kyMtM3oki+NCEWjfAVUT8tz9cQYJBkg14i46V
 bugl+IasUsJzAcG+g38guZkPwTknRSwoptaGsFHq5tmsagVmQa9ULVO5tsU6Nu6N5boQ
 KJvpg0GIT/13DMWfWfMe/Mcun2xTKE7uo3vkPzDVu54UA3t8f1EZ3zsLx0SjugKTGlXu
 OH1uiYMEYf7y/QyG9WQnG8J+sswMf6rmCZyI6/mFZcSUhQrv8B/OAET54vlu5x6xuFZc
 lJN7+hqbKvXFT7VbJo5OZsZIfI2PEO3fQ/fjEt2hPEsPa69+V/g8YO1FyvJMWZ8vXwlm
 x6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rim2Ki2Eu3BjQABgKkl/x6ZfzcgX4FO+4AS4UaRphF8=;
 b=b7CjmXsAnUvGJ7zWZRC79fIddxE/iZsjQOcX6vazpcu6t4Uvyw3bLI5e8N3i5V/YZJ
 ns0hqhcQrLU4d3Jqwfj1nYvZME19p1mMOSKWcVauwNRDBJ3PFR0GZ1MYt20N0SwPNixn
 8h+2Mg6rDehu4ufUMhKxcb00AFoKgnJXb7zJ4DiDqhyKFVlxt6PJlFcuZMxfL544XNXm
 4N0F2t+YdhQj9uW+l4pgZGRD9LgMm/iAjZ0tnHKCT0Xze8TT6h2L+ZHJbZpozKyFZWY7
 cqk6uC+O+fBEGNr7d77Hsdr4zgYq/VreXsAXhnZmTGbdC5Uxp66K+E7x6OddvtBm8qIs
 DE4A==
X-Gm-Message-State: AOAM530T13k6N8TMP0okruQoGyeueGGpdMTVIuU6x9M+5sa/lHwtSuaM
 KgrewSpCQmwIbFFjuLSKE2aU/g==
X-Google-Smtp-Source: ABdhPJxwGatgo+iZBh1zUEHAJkUUpucUDp/+0VK2xI554y8QFcDYLe4X7kHwkCGa0+lfZasdCHoJSQ==
X-Received: by 2002:a2e:908b:0:b0:255:68b4:4085 with SMTP id
 l11-20020a2e908b000000b0025568b44085mr23175357ljg.369.1654776594036; 
 Thu, 09 Jun 2022 05:09:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05651203eb00b0047255d211e9sm4202581lfq.280.2022.06.09.05.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 05:09:53 -0700 (PDT)
Message-ID: <58811796-1a27-b159-28a4-e9b507fa5869@linaro.org>
Date: Thu, 9 Jun 2022 15:09:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 01/12] dt-bindings: display/msm: hdmi: split and
 convert to yaml
Content-Language: en-GB
To: David Heidelberg <david@ixit.cz>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-2-dmitry.baryshkov@linaro.org>
 <e9918d06-1b53-d847-016f-2310c4fa9866@linaro.org>
 <f1489ae9-268a-5e35-2223-e8ee95cbd206@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f1489ae9-268a-5e35-2223-e8ee95cbd206@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2022 01:45, David Heidelberg wrote:
> On 08/06/2022 14:37, Krzysztof Kozlowski wrote:
>> On 08/06/2022 14:07, Dmitry Baryshkov wrote:
>>> Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.
>>>
>>> Changes to schema:
>>> HDMI:
>>>   - fixed reg-names numbering to match 0..3 instead 0,1,3,4
>>>   - dropped qcom,tx-ddc-* from example, they were not documented
>>>
>>> PHY:
>>>   - moved into phy/ directory
>>>   - split into QMP and non-QMP PHY schemas
>>>
>>> Co-developed-by: David Heidelberg <david@ixit.cz>
>> David also needs to SoB here.
> 
> no problem, for this or any later version of patches developed by me:
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Thanks!

-- 
With best wishes
Dmitry
