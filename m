Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82FD6B5A49
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 11:05:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2906A10E099;
	Sat, 11 Mar 2023 10:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EA210E099
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 10:05:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso4917063wms.5
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 02:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678529146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ciFroiEJcPCf1IcNM4Oy4MInn1VtQ6qbpV3yMFcCzXc=;
 b=bXoj40nIICUGmqpLuoYZkYyZ3eI1jvBtOnrUizE4q5FSvmvB5V6XKjaQIjIn/K4RAD
 YG/Yy9xDyLtzuREY+xUphpPJTOWG1eFoji9vDNCAniLttDeONIj9tIRDgWLZ1Cf40zpR
 b/RKl1dVBshh/xoXbru8cKano9n5bnp3QKU0PV53SFT1gsQ2twK2XvBLdIKj6LE6xvJM
 6A9h4v7nU2K+0MxrCf+MFDwjq5i8q1WjzlmsLzG4G8bXR4aMyl0mUagsw5m+hvfN1mIH
 /gSuilOgJ6Gifhmro4r8vIoSoQF0DiQKjO9e+GaFN8lgreefLqfQkjhwpYdbTamSAqK3
 cEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678529146;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ciFroiEJcPCf1IcNM4Oy4MInn1VtQ6qbpV3yMFcCzXc=;
 b=4SQWjZLr3p5yCSoT5omCN43wk99MwsaCMr4uiyKbHMS+TlTCK8oZN3r3193TmGqAmS
 gLm6crs5kL9/pviPLBkuiy5ekWvnZfF7XTO9jwnMd2y3Ub+etlBj2kRCmIu9IEGk/dEY
 o47KC+pEAJLkPF5vUUjc2eS6kX0NF4u2dcAPG2TZxyxW65EB0gGhFLImmwFHs5FQ3Yd8
 m2fpEkkSXuBihKUMkXuvuEISRurUtkMFwVBvDdE/3HQTPTySWNKewgm90KWn4p9xGzH4
 u75Xd/5D1cw3LKOVCV0SvpeKtZAtwGN1BvhxM0RNFcg90/z4cvT3VEkPPe+iLkD+iCT3
 XuAQ==
X-Gm-Message-State: AO0yUKVEdg8A7yTjKh5S4lBjwjAfwr/KhlqA3ZRzafi72wJNyOukN5zS
 dO9trNrzdj1IiIclDaLGhN45Yg==
X-Google-Smtp-Source: AK7set8zoDvWWEIFn13DW0itfJK1PANtvoXCqkiW5qigJfdhRgGaFsfi9mqjxqBQBIxpQJm1HRWahQ==
X-Received: by 2002:a05:600c:3491:b0:3eb:2e19:ff3a with SMTP id
 a17-20020a05600c349100b003eb2e19ff3amr5293547wmq.7.1678529145902; 
 Sat, 11 Mar 2023 02:05:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:fc3e:aa04:e32d:cc69?
 ([2a01:e0a:982:cbb0:fc3e:aa04:e32d:cc69])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1c7417000000b003e11f280b8bsm2334725wmc.44.2023.03.11.02.05.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Mar 2023 02:05:45 -0800 (PST)
Message-ID: <7765365e-2bde-4ccc-3251-d4bb38c34ecb@linaro.org>
Date: Sat, 11 Mar 2023 11:05:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Novatek NT36523
To: Linus Walleij <linus.walleij@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>
References: <20230310132144.2241-1-lujianhua000@gmail.com>
 <20230310132144.2241-2-lujianhua000@gmail.com>
 <6539f132-c740-b9b6-8810-0affd6ab91ba@linaro.org> <ZAt4fTNEnyLteaas@Gentoo>
 <CACRpkdavjBPaNq1sRfi-FYiT7T3W19fU-mjha0pAtooUyf-8XQ@mail.gmail.com>
Content-Language: en-GB
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <CACRpkdavjBPaNq1sRfi-FYiT7T3W19fU-mjha0pAtooUyf-8XQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 10/03/2023 à 23:50, Linus Walleij a écrit :
> On Fri, Mar 10, 2023 at 7:35 PM Jianhua Lu <lujianhua000@gmail.com> wrote:
>> On Fri, Mar 10, 2023 at 07:10:21PM +0100, Konrad Dybcio wrote:
>>>
>>>> +#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
>>>> +           do {                                                 \
>>>> +                   mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
>>>> +                   mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
>>>> +           } while (0)
>>> This should be in the same file as mipi_dsi_dcs_write_seq, imo
>> I have sent a patch to do it, upstream don't think this wrapper is a proper
>> approach to deal with dual dsi and wrap all of mipi_dsi_* function is
>> useless.
>> https://lore.kernel.org/lkml/20230310110542.6649-1-lujianhua000@gmail.com/
> 
> We can keep it locally if the fight isn't worthwhile, but I will try to enter
> the discussion.

It's ok to keep it in the driver until we find a way to move it in the generic includes.

Neil


> 
> Yours,
> Linus Walleij

