Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FBA4F7694
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 08:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8322210E53B;
	Thu,  7 Apr 2022 06:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC1CB10E53B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 06:49:03 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id qh7so8721143ejb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 23:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ig1etyDF68tf5y4+B0bKhTRY5wsKZ9GD0NtPhkq4h5I=;
 b=xrLUcHHwKuNTh4APSk1UhhZeFKYx5/K1fJIzae4MIT/Bg1RYnwCOSqstuf/ZYismFz
 3CE2yBy2HCiEUJAT/uhluRStnRmtIzabcvauHCUnncDJ8Tef7BPXRE24Slg8eoVuPEed
 Gjt/OGqI/n7/B0coJmgJrd9Sxx2WmltbunSffJZ7Avw2PXYdaqFgGx6F1GEcu7Rd9r+i
 Fw3vnDg6Ki+RhIKBcblCZ0hVP5wkbBQBAwZTDUoZVPnkzJZad9y/K6Q/zJlo6TuTbnoe
 lrCllXvX3vtSI0HhWwYw6WHEmtKRUglMA43DnsjdHGD2e2igUDPwa5MqXOMJ5ezBnman
 /JbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ig1etyDF68tf5y4+B0bKhTRY5wsKZ9GD0NtPhkq4h5I=;
 b=17DRLA4mV3tuDdOLB114OciZSV0fp+vCRRlkJ1twhe3L81PYeJWBvjby7KjymIGEwv
 L0IMaHXIerNIQvm5zc6JbXxtHDRTmT4cdS/Gz/5lcffaXsioNK2bALajPn8QJUVtW1V+
 ZQj7QaWL/75mBBQSjlTPvThRb+4GJ/+FT4st1C0yVdkptoJa0TaYsfUqVX9liB8x/ayQ
 Zah1g7hkbKWBQ7Q150FO/U1zTnk19/WeG7TGqGnQrIuRBkw7Wcg8aNOSo4zPZJ9YI7Kn
 xndg8OYf446BXyScnkeVKw5pxePZxOlRJOoXJKZ4YykmGHcRD9rf1jihsJ2/E0Ay0Ujy
 V18w==
X-Gm-Message-State: AOAM532jGNVhuC0408kKzrWj3aSsglMCTJZHB4J3CD+cvS162w4OuOhH
 RMguBD4BBqGnT7tGPbhwdzjo2A==
X-Google-Smtp-Source: ABdhPJyI+a19I669vtBg9dpBsKeqt/6i1D7etaTUE8OFw7G4q33l4BRlM1qJgUjqaoH0PJSjKLZYdA==
X-Received: by 2002:a17:907:608d:b0:6e7:f1d1:ff42 with SMTP id
 ht13-20020a170907608d00b006e7f1d1ff42mr12405023ejc.620.1649314142185; 
 Wed, 06 Apr 2022 23:49:02 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 s10-20020a50daca000000b0041cc361b1c9sm5877690edj.68.2022.04.06.23.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 23:49:01 -0700 (PDT)
Message-ID: <594c124d-403f-56f1-b9fb-f48042d7056b@linaro.org>
Date: Thu, 7 Apr 2022 08:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
 <397e30c2-18c3-93d6-16f5-b113be77f51a@linaro.org>
 <c9a54f1c9350d63489a0f85443f5623fe5d7fe1d.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c9a54f1c9350d63489a0f85443f5623fe5d7fe1d.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/04/2022 08:22, Rex-BC Chen wrote:
> On Wed, 2022-04-06 at 16:44 +0200, Krzysztof Kozlowski wrote:
>> On 06/04/2022 11:46, Rex-BC Chen wrote:
>>> The driver data of MT8183 and MT8173 are different.
>>> The value of has_gamma for MT8173 is true while the value of MT8183
>>> is
>>> false. Therefore, the compatible of disp_aal for MT8183 is not
>>> suitable
>>> for the compatible for MT8173.
>>
>> Just because one feature is not supported, it does not mean they are
>> incompatible, which you claim in the patch below. Are you sure they
>> are
>> really incompatible and MT8173 fallback cannot be used?
>>
>>
>> Best regards,
>> Krzysztof
> 
> Hello Krzysztof,
> 
> Thanks for your review.
> 
> The difference of disp_aal for each MediaTek SoCs is "has_gamma".
> And we only control this variable for different MediaTek SoCs.
> 
> The value of has_gamma for MT8173 is true.
> The value of has_gamma for MT8183 is false. (Moreover, the driver data
> is null for MT8183)
> 
> From this situation, I think it's not compatible between MT8173 and
> MT8183.

You repeated the commit msg without bringing any new information... but
let it be, I assume setting gamma on MTT8183 is incorrect or produces
wrong results.


Best regards,
Krzysztof
