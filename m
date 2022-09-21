Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 699B05C0102
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 17:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229AB10E8C2;
	Wed, 21 Sep 2022 15:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293B410E8C2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 15:21:22 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id k10so9793230lfm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 08:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zI0sKx0UEe070AULJ8R4m4a1MrYM/4BsYHYlCT/MqDc=;
 b=cJpHA3s+9m7nhbi6PP2RsS0p1UHF9JMHzerR2N2SehVm13m7h2K0WbYjd/O3LTB0ZO
 T3Y6YwcSQMw89WbKxxSCLyXR2o4FRtC3bngAOkSFUEd/X72nv/VfU68ZXsVTkWKJlTW+
 6JcbiNn65X1e1dPAI/KAUDNNm2Un1+/A0G7QTTLAezSXqFWa4VOOeg+yEluuXeEmpAKU
 rdvFz9YNDgO5Yz70uPRSI15vg3zGUqbSNEDVXWZcsnh6V5R61iPaxAyv8lgqNP7184rv
 7m0120wsh8ffjiF6VDqIPCNlN/wqDhIu6/Vz2Z++EY1Sph3wL90Tjxc1AosbRqxw1z7o
 pFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zI0sKx0UEe070AULJ8R4m4a1MrYM/4BsYHYlCT/MqDc=;
 b=rkNdTtG8v9jQPDkOCu8Rw8CbnjViD9RMpNUadYfZVIKAB3IWD5lhZ7AEx2GtJqkCTK
 MlBfAsB8u7F2LbvUqrTUYQaaOv6BFp8s1+XLdyFcvnCRVtJzRSluHAaR0rEtkyGUjwzU
 RubekT9tbMUXL8evCnW9H4lUsUXV+qKYjeRlPCuKfz8F48qSvB3HRovhB15Y6N1sh+nZ
 LOWfzEeiN+vIVuLQWq4TLMN5ZR1xAJYSYRE/OxZZIjnXkKUoVXrunCMsOXBxkEMpwt4j
 V2z0bL7Z0maSsJQyMww1hpzw94hpATOw7VdlUse018ZJ6CPp7xBKpjCFC5rCg0MjcoXu
 sDGQ==
X-Gm-Message-State: ACrzQf1TKr4teErkrMuqVzBz70n7FOQBdHF1VwM7AAibF83RovSTgr7m
 bz5Uwwa80BfTuzqSsNvWeFpKjw==
X-Google-Smtp-Source: AMsMyM5zbaCqzr/X1NNpLsOEjtmsn9LzPWp7Wz7OdNu9TNboh35NIhcQftkiqlUccdhVDxxxRz8CmA==
X-Received: by 2002:a05:6512:310:b0:496:a0ca:1613 with SMTP id
 t16-20020a056512031000b00496a0ca1613mr11289260lfp.394.1663773680473; 
 Wed, 21 Sep 2022 08:21:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 s10-20020a056512202a00b0049a148eb003sm471778lfs.178.2022.09.21.08.21.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 08:21:19 -0700 (PDT)
Message-ID: <ff2ee392-0f78-37d4-56b5-443e6e998443@linaro.org>
Date: Wed, 21 Sep 2022 17:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH V2 2/3] dt-bindings: display: panel: Add NewVision NV3051D
 bindings
Content-Language: en-US
To: Chris Morgan <macromorgan@hotmail.com>
References: <20220920145905.20595-1-macroalpha82@gmail.com>
 <20220920145905.20595-3-macroalpha82@gmail.com>
 <e5de0c74-3ece-56c6-6c31-042e1117c10a@linaro.org>
 <SN6PR06MB534220AB227AA3BC5DB58741A54F9@SN6PR06MB5342.namprd06.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SN6PR06MB534220AB227AA3BC5DB58741A54F9@SN6PR06MB5342.namprd06.prod.outlook.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/09/2022 16:38, Chris Morgan wrote:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - anbernic,rg353p-panel
>>
>> Are these vendor prefixs documented?
> 
> Yes, they are in another patch series referenced in the cover letter.
> They were added for the Anbernic devicetrees and should (I believe)
> land in 6.1.

OK... you still need to test your bindings. Your patch was clearly not
tested before sending. :(

Best regards,
Krzysztof

