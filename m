Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D684653315
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 16:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB6A898F0;
	Wed, 21 Dec 2022 15:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF84898F0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 15:19:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id cf42so23987377lfb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 07:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bQ73qbFm6UCJeP4jhQYp+B0qUa7NcAt4luT99qxjzU4=;
 b=ON2Cs2nWCEQZOh2t/kPzh3ik2xLc3N1COsahZWqVrV+AwFPwCRqx3BX+9sf+0/0QR/
 WCdAIekO4VUIMUB6alGZrIVYyI+dbeFP/NvO8d7OO2QD06KLTV/aASRcy7rjIGN9MVlV
 fHHoOk7gb+BuDUMAuksiGC6pdluV3jVBon91zQFqlszHz2yySpvcgUQ8gxD5+6LJWmyJ
 fw28RCkLGg0noefUHQ2hMvzb+5kr7MwKb6HZMFa47z1BbNYCxp9FfoUOIrqjksFi/h6P
 EVeR6iq4fLXSsaiUOw77bdo9zxYUeZkAz182mTDkdt013CMg3RiZ5CetCs0MZBFzjZT9
 Z6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bQ73qbFm6UCJeP4jhQYp+B0qUa7NcAt4luT99qxjzU4=;
 b=OXPPatj1Av7MZ2z6y2AqepAuSGSjS0memarNSs7/h+5s42hkduYfYRB05rek/f0utj
 Ba8Pb7wZJn+POAVJuLEI2Ilq0RVrhLdt8kNOKlbYJDTa6Q5qmaMw1RD827y1Tm/RPVrs
 AtSdvqtl21iidYdrWIf/laJrWUKDkX19vlimbmBT+6bR18/8gbpniTWTwntRtyQFhT6M
 2kYEONzd9cDcdAkbocynGfYN8D3Kkqp1gWGvqJCeDBOX9lpOPnBacpKHp91WAH8rs6IU
 4qm2Azy0CM0mu+CxAsPwbB9bFhvrqXZH/VOeQz/0ln2eTYSriqXMUYHEwT9eDSzUDv3/
 YzPw==
X-Gm-Message-State: AFqh2kozlliIFT7eNg4vq1ccEnPExayQBzey/1xtt9zZ3iwrY0xn7MR1
 YGsKsDAw6FwrdKW//6x81fPY+w==
X-Google-Smtp-Source: AMrXdXtU+/ZUhZbu0zYB+63eEHjnu+1g+kiav0QKX0Q+Q2WfCnothw2l04vC4i9t9nKzQC6777WWlQ==
X-Received: by 2002:a05:6512:340a:b0:4b5:8fee:1d71 with SMTP id
 i10-20020a056512340a00b004b58fee1d71mr626877lfr.64.1671635962255; 
 Wed, 21 Dec 2022 07:19:22 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a05651236c700b004b5866f048csm1862025lfs.268.2022.12.21.07.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 07:19:21 -0800 (PST)
Message-ID: <bedc2750-100c-d3f7-cc11-0027d6b8e867@linaro.org>
Date: Wed, 21 Dec 2022 16:19:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RESEND] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>
References: <20221221132428.702-1-lujianhua000@gmail.com>
 <4c37d74d-aaa2-242f-a25f-bf5f92d50756@linaro.org> <Y6MjDxxi8CunFLmM@Gentoo>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y6MjDxxi8CunFLmM@Gentoo>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/12/2022 16:15, Jianhua Lu wrote:
> On Wed, Dec 21, 2022 at 04:03:44PM +0100, Krzysztof Kozlowski wrote:
>> On 21/12/2022 14:24, Jianhua Lu wrote:
>>> Add Kinetic KTZ8866 backlight binding documentation.
>>>
>>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
>>
>> Do not resend. You need to fix everything, test and send a new patchset
>> (entire) with the changelog.
> 
> Ok, I got it. I was just a bit confused about "Need to resend with proper
> thread".

But you did not thread it properly anyway.

Best regards,
Krzysztof

