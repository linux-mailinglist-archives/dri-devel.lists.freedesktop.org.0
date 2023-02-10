Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91E5691DE2
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A0F10ECEB;
	Fri, 10 Feb 2023 11:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7445E10ECED
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 11:14:01 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id c1so662206edt.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 03:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=70vAhiupv9yMZP8MYL4Z5/w//H8J/qCxdLW4cuPyvw0=;
 b=qPskg7Fj7rU+NU7n4p7TIQTEJndpAkFpdo0SbmruEACpogsZ0rYXAxXgSyokU/Txpp
 spBnuPfhJU9t++QvpoiQuP5qLr9Y4a1JaMLv2UVL+NNZvlsiHTGYRnxwZ4ukHsEHhPf8
 I5SiEyiVGZk5OWOIqenzzpQJ6SiTvG53ROLbw+cXI+/1HOLnszLA+UebhQLe8OVL6WqR
 wHWuVQmyVaWriN+g8KzPJKwlDRdOeIyEkG9TrybUuePAbmVN5TDCO3Cf0PKH3hmBsj0l
 2TE/Xz1Yogt8uQCXBOwdbuTNmwMpnY5jiWQVd2yg+NU2GuXEPpoVhATVj+Qw/fA28lmz
 vbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=70vAhiupv9yMZP8MYL4Z5/w//H8J/qCxdLW4cuPyvw0=;
 b=27OEy50xpxrPaVOEBPiX962meO5EX0M+HScbD/hEKb2nBryQWGi0CxB6V2FRFQwQA2
 OGBpmb3Ehi83txIWZ2Ek0JN2R4zKIVju3d3LhznMq+SH1lQ1WkvdHr8ZGy6bDiVdodvz
 /CW85T4Cy+ZtkP1Qh4oqNNoJqv/30LC7YxJmveGw3A6XDJKJFure02Cq0BwXYeE7qdfc
 Acb7ES+pVhsHaNCA6FQI4+W5Jp7aZ7TQj6d8iv5EpvcXw6GEhrmGqBkEz4rjzllP78CZ
 e69+PJ5iHgryyd9nORpnW6FuGD3yvsnH2WUaDXT07BjSZz9OnnR7W9sN3JnKRuvsKOiB
 tK7Q==
X-Gm-Message-State: AO0yUKUbnjKrnXTiTiDM5M07qPabmPLuwHDbyIrfp4VYtf+34Ouayni1
 IIT/2g1xq5Fr8bmN0zl1Gp3ZJw==
X-Google-Smtp-Source: AK7set9pBvN0pwFN96tQH7oqaWGerfjL7VFYX2nOqefHZBD3lRjXDpbMnRlqEpzqFh8TzUdwGorprg==
X-Received: by 2002:a50:9b0d:0:b0:4ab:ec2:3cd1 with SMTP id
 o13-20020a509b0d000000b004ab0ec23cd1mr8354037edi.25.1676027639960; 
 Fri, 10 Feb 2023 03:13:59 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a50950c000000b004aac44175e7sm2033244eda.12.2023.02.10.03.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 03:13:59 -0800 (PST)
Message-ID: <84b657db-a129-fec2-2b67-32e125e116e9@linaro.org>
Date: Fri, 10 Feb 2023 12:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 4/6] arm64: dts: qcom: sm8350: finish reordering nodes
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <20230209133839.762631-5-dmitry.baryshkov@linaro.org>
 <a8bb4bf1-c4b6-ff02-d2e6-1407900bb006@linaro.org>
 <7f85af25-efc5-6907-70ac-b264f110918d@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <7f85af25-efc5-6907-70ac-b264f110918d@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10.02.2023 12:12, Dmitry Baryshkov wrote:
> On 10/02/2023 13:09, Konrad Dybcio wrote:
>>
>>
>> On 9.02.2023 14:38, Dmitry Baryshkov wrote:
>>> Finish reordering DT nodes by their address. Move PDC, tsens, AOSS,
>>> SRAM, SPMI and TLMM nodes to the proper position.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> [...]
>>
>>> +                phys = <&mdss_dsi1_phy>;
>>> +
>>> +                #address-cells = <1>;
>>> +                #size-cells = <0>;
>>> +
>>> +                status = "disabled";
>>> +
>>> +                dsi1_opp_table: opp-table {
>>> +                    compatible = "operating-points-v2";
>>> +
>>> +                    /* TODO: opp-187500000 should work with
>>> +                     * &rpmhpd_opp_low_svs, but one some of
>>> +                     * sm8350_hdk boards reboot using this
>>> +                     * opp.
>>> +                     */
>> It's not a part of this patch, but an idea came into my
>> head.. could you check with socid that your HDK has an
>> 8350v2.1?
> 
> I checked with the bootloader instead, if you don't mind:
> 
> Platform Init  [ 2701] BDS
> UEFI Ver   : 6.0.210914.BOOT.MXF.1.0-00848-LAHAINA-1
> Platform           : HDK
> Subtype            : 0
> Boot Device        : UFS
> Chip Name          : SMP_LAHAINA
> Chip Ver           : 2.1
Hm okay, perhaps it was something else..

Konrad
> 
