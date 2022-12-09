Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE7648472
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 15:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AE310E535;
	Fri,  9 Dec 2022 14:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13B910E535
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 14:59:32 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id cf42so7459409lfb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Dec 2022 06:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NmUjgK6FRZP94VzXlEtRsOKP6XhurDo3G4diN6JCplI=;
 b=P8OnmuYZn6zJLbKrlsyvKSV9tB35MUH5ctJxAmFnSNvn0KUTWbxJdmhVBTw1BgS93i
 x770KSz59P6Uo/5f8buDoSrOejFOOoBC5waY9P/hnB+BZtwZqNlbG46/0srjzEQEZMZW
 vHiX0HTGon/Z0tgiO52+J2gSp9DhIZQGSA50DBdeCkQ0wp2MKYgk+cv6Y6iEdaMSjIDI
 eU95bFy3CO9Wjwh+XzE2+wPw9NegXtBmxw71hp9yVQpEOVkHARivNXgl+EK2YaYRSubY
 fBt6PaInWybgAgqa3YzEk3grxkTSnoi4olLnlhKbrgwjtcWloZ2kLes9mK40we0kvByZ
 c5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NmUjgK6FRZP94VzXlEtRsOKP6XhurDo3G4diN6JCplI=;
 b=nVERNev/7cvou0Y9LORQhrkpXc/yBtRw8KQbgImjHDkJjD5Vq4T9sGf0xRlOBaLSQ1
 4C61qewq3wFhbd/VKm8n408bLbF6mjd23eJC3Ivix70QFsCQuq3tzJv1hFOldJ8KnOqh
 fQ4ePI3fyyGTPn3MNWUe5+Pg1daik41K2zhs0fEsktMG3CvPKhZuhZ+hNab+XHcmaI+9
 2za0xqFCi6PcACcaQ5Rr/+na0o9LKx526cC+tt2nuxW9aCYp1w15ZNgB8ANjSZgtg2l5
 WV1NOcYRGlLuQUJ1O/9a8Y44+p91dvr5W2oyJZHriP19mmk41NjG2yorjUVPm68e2QD1
 G62Q==
X-Gm-Message-State: ANoB5pk+GS5R5kOhbzMwTxW0GIpDqsNZJkfhNXGcH8CttE+vMRjCUbDa
 pM4mkXN5ZuYyPolV/JfU5B8ZMQ==
X-Google-Smtp-Source: AA0mqf6EqdK2TYO+O/G2pbCffiYehV+tErEFWtMasQhx6QhqtEcO7WPCkUlL0TWrsKOSCnZJv+emBA==
X-Received: by 2002:a05:6512:ba0:b0:4b1:44a4:a717 with SMTP id
 b32-20020a0565120ba000b004b144a4a717mr2003791lfv.61.1670597971148; 
 Fri, 09 Dec 2022 06:59:31 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a056512348c00b004b5b4126237sm154851lfr.67.2022.12.09.06.59.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 06:59:30 -0800 (PST)
Message-ID: <0fb1b2e4-6e07-f976-0103-d04d89677576@linaro.org>
Date: Fri, 9 Dec 2022 15:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 airlied@gmail.com
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
 <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
 <5a3865ed-8847-db04-3d60-f35438250bef@linaro.org>
 <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5aa16223-dbf6-996c-1985-794302dcce91@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/12/2022 00:38, Kuogee Hsieh wrote:
> 
> On 12/8/2022 3:33 PM, Dmitry Baryshkov wrote:
>> On 09/12/2022 00:36, Kuogee Hsieh wrote:
>>> Add both data-lanes and link-frequencies property into endpoint
>>>
>>> Changes in v7:
>>> -- split yaml out of dtsi patch
>>> -- link-frequencies from link rate to symbol rate
>>> -- deprecation of old data-lanes property
>>>
>>> Changes in v8:
>>> -- correct Bjorn mail address to kernel.org
>>>
>>> Changes in v10:
>>> -- add menu item to data-lanes and link-frequecnis
>>>
>>> Changes in v11:
>>> -- add endpoint property at port@1
>>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
>>
>> Applying: dt-bindings: msm/dp: add data-lanes and link-frequencies 
>> property
>> .git/rebase-apply/patch:47: trailing whitespace.
>>
>> .git/rebase-apply/patch:51: trailing whitespace.
>>
>>
>> Also the dt_binding_check fails with an error for this schema. And 
>> after fixing the error in the schema I faced an example validation 
>> error. Did you check that the schema is correct and that the example 
>> validates against the schema?
> 
> yes, but i run "make dt_binding_check 
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/msm/dp-controller.yaml" 
> at mu v5.15 branch since

v5.15 branch is not correct branch to work on a kernel. Please do not
send patches based on this. You must work on mainline, maintainer's next
branch or linux-next.

> 
> "make dt_binding_check" does not work at msm-next branch.

Why would it not work there? I doubt that msm-next broke anything...


Best regards,
Krzysztof

