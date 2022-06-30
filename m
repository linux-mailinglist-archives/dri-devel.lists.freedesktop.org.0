Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC8F562CB8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC91810FC67;
	Fri,  1 Jul 2022 07:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5091121ED
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:49:06 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o4so110350wrh.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6tnKa6j0KUTAns+9a5hu7e9HMdmQnDavnOA9sl0AIJw=;
 b=njyHn6aTwltxlDIvONhFpvjWImdwFbcxV+4iHtUnmq17Z2D2qLtMXnUyw7I1zpOZX5
 DJxgodxX1pg57tqiCqKtVwDfitRIWbUeosHao0kCyMemcdLbpQ3gGXS60ftMr+swK8JJ
 XMbvAsyvlDTGVU90VTN5GrC6vkMNEYQ/q4mggitoR4nitzTuHo/T3rZP1vssev6UBIIU
 BKAyX9cpWILuv8wkR2dFcpXCgNnprozdL9dJlDrMYfu8fNOp0HKQa5Uxng1lC5nvpGn3
 cVRnQUfVNadjAkNMpjM/UY7fmJp9eqo+8jJ4lmupI90NHghoS7YhHqbbYZ5zWQbA/B/s
 LLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6tnKa6j0KUTAns+9a5hu7e9HMdmQnDavnOA9sl0AIJw=;
 b=4wsdnHgwjFoBRoFls39I7UNsZSBlsso10VyyftHxsquVh8fPjiqiLOhrJjvg1lJsBd
 NafTLMXZCCW274Y3BAmSxzjbAUGQ3/EWB8sfy6L8LM0KX8zP3HBUgzzzzM1WcQhwOxI9
 CaBhpDyhD8PeX8/3WWzyuk2gf/MZTsuod56VKZxDgl+l7oYVS6mYmYGnbVrLgKMfp3mF
 FXfX3t30HrZopnwu9LbdgtyKJFiRJoPGFPK/Ci1BMo9dLkSJGgANFOsKK30kkoWHNrX5
 B5vT+8dlS6NucXTlMgeKO86z2/XDdKm/7SWF65B8kL6GF0/HkmWCWMwT1jpQrmq0XKsS
 Au9g==
X-Gm-Message-State: AJIora9dPxuK7RtbypVgTrnqZBlr+8yvlbJrvxJEDIFm0LrlhZkm1xXw
 wy0CjGfrMoel0sq5KU2v9LMHzA==
X-Google-Smtp-Source: AGRyM1sZHMnJrHelAuAUGs13a3YkMH9sihf7xkfePW0UaKfmk8KPRg67Ro+MceNbycq1UCObq1QnZQ==
X-Received: by 2002:adf:e252:0:b0:21b:827e:4c63 with SMTP id
 bl18-20020adfe252000000b0021b827e4c63mr9834152wrb.307.1656618544868; 
 Thu, 30 Jun 2022 12:49:04 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a7bc4d4000000b0039c798b2dc5sm3634442wmk.8.2022.06.30.12.49.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:49:04 -0700 (PDT)
Message-ID: <054043a5-3643-aa5b-4204-8cacb7b3ae9a@linaro.org>
Date: Thu, 30 Jun 2022 20:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 3/7] dt-bindings: msm: dsi: Fix power-domains constraint
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 robdclark@gmail.com, quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-4-bryan.odonoghue@linaro.org>
 <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <225e70ec-553d-4d44-fc61-543128b2ad67@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 20:01, Krzysztof Kozlowski wrote:
> On 30/06/2022 14:08, Bryan O'Donoghue wrote:
>> The existing msm8916.dtsi does not depend on nor require power-domains.
>> Drop from the list of required.
> 
> That's not good reason. The bindings are about hardware so the question
> is whether being a part of power domain or toggling power domain on/off
> is considered required for the DSI.

AFAIK no but, I will check this again and if it is definitely not 
required, I'll churn the commit log to describe it better.

