Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681655006F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 01:13:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D9E10E1D0;
	Fri, 17 Jun 2022 23:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCDE610E1D0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 23:13:47 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id cv13so2719671pjb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 16:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=10mVd//XJbMVb3Cy5Pks+pC6niMtAwguM0D0PFkeb/0=;
 b=ftsgA9iCXVg14SM3UhGJNZroNcKteQOV8fhn/TQ4qmubLGEYc9goTyY9cqxWv/Vujz
 vvqm9Hc1xj1CilJkuFjGUkxiPQmxIGRA6ZWY937f+DBGH4jZKoO1kMpGaa8atsr2iy+c
 jInXea+ezAu5ezkR5e9DqoDPRxhK80c23I0Rxem6Hv76djU0l3rMSkohW6NtZA/wT8Xq
 kkbN94pT99l5RfQhhgeyyK0XqowM7S3hyzY9US2HlPGSSPmBn1VE+8RMyrvOvwk/qSQO
 VuNIIi8ERnbIixzMX8MQ/LZDa52WzzLDJSlri5vEF8FF0NVgt/kmQO5wufOCoypheUaN
 mQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=10mVd//XJbMVb3Cy5Pks+pC6niMtAwguM0D0PFkeb/0=;
 b=BhigMpNTTuy6egKBFMntbzmdCttzjQRPR//okQt/J4t+zk8Y7+kieUUa2pDUsX2Q79
 N2HeCHRIiqs0a1wqG468bNWpVilXEROXXi6UL3uSrxBiR+uLjz2Ml6Xfoor8Rldb9Hop
 9KgKObA+p3AQ5IsjFPRVOEJJfl+qgIvVSB+Nig6TMbAtjC6uatl2HNtuFdMqhaBUZUva
 Gdrd/8R86tFZIr5iCBgGY5roImc8EdnUyTgUymXkoJ9xpyHZfSBx0REDDfjRoBVf2yae
 I8K3Aevb0LV63NylGXwA5wAfjl//4S8NZHGEcb9r7jt9LXB/C9qMBgu3zGdGTZc2lJ+C
 5zsw==
X-Gm-Message-State: AJIora968FUrdoGrBcVFzKzkLexesDAYhPK6fvoTM5xip9K7IpxZX3d7
 SEv6qSap+DqmwDlLxUB8o/yryA==
X-Google-Smtp-Source: AGRyM1t/dM7EAh0Y7mmMWaeiTHeXaEw5ea7tY/IXesEX0mn/1dH62oUOXAC46KuZhDOj2XfNQPbrog==
X-Received: by 2002:a17:90b:3701:b0:1ea:9f82:59ef with SMTP id
 mg1-20020a17090b370100b001ea9f8259efmr13153806pjb.239.1655507627413; 
 Fri, 17 Jun 2022 16:13:47 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170903028100b0016784c93f23sm4054315plr.197.2022.06.17.16.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 16:13:46 -0700 (PDT)
Message-ID: <9b567f78-e12b-d665-2f11-96436fe9ed08@linaro.org>
Date: Fri, 17 Jun 2022 16:13:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 05/15] dt-bindings: backlight: Add Mediatek MT6370
 backlight
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-6-peterwu.pub@gmail.com>
 <9c38f708-1376-aa89-2c56-c08d320bcf2b@linaro.org>
 <CABtFH5KhijZDRA+K=stpOV0t8K3cqCMoLXpLShcdm9F8emrKCA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABtFH5KhijZDRA+K=stpOV0t8K3cqCMoLXpLShcdm9F8emrKCA@mail.gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 szunichen@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pavel@ucw.cz, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/06/2022 03:35, ChiaEn Wu wrote:
> +        - 3: 6
>>
>> Nope, I said last time:
>> "In any case you cannot have values mapping"
>>
>> Please use proper real world value, not some register bits. The property
>> name also needs fixing.
> 
> I so apologized for misunderstanding your meaning...
> I try to modify it like below.
> --------
> mediatek,bled-pwm-hys-input-threshold-steps:
>   $ref: /schemas/types.yaml#/definitions/uint8
>   enum: [1, 4, 16, 64]
>   description: |
>     The selection of the upper and lower bounds threshold of backlight
>     PWM resolution. If we choose selection 64, the variation of PWM
>     resolution needs over 64 steps.
> --------
> If these changes meet your expectations, I will try to modify
> "bled-ovp-microvolt" and "bled-ocp-microamp" in the same way.
> Thank you so much.
> 

This looks good. Thank you.


Best regards,
Krzysztof
