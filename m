Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB5B521234
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 12:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4AD10F748;
	Tue, 10 May 2022 10:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ACE610F738
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 10:28:17 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id ba17so19445732edb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 03:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qB8tiSg9orpGv2oafVz+zb1jhV1wE750MfA0k2QQW9s=;
 b=rhth6SprFuXZRw9NUufEJzMkPofYa5+szGIs98AV0GVIbzsAA24w4QbdhAH0k6tNsm
 G9lbp93Qgq5wQy0+CFXT1fi5iMuYA4Cm9U/PxSd8amtshY1+WWPg3Zsj2ouQqfzpm3cT
 kgoHRoMvtjtr0hTCFuXrxFMAPcuVScNYCBHjhvwd+K12WtE868Zm28gTKB0PPjcHEMOT
 ul8LCqkXub36kGTu/xSmxsHDmFJH+vm3u7mGVS7NKOKyYshFVlM324rzPLNV2dHsG+Oh
 n0LVc+nwWpXvQhRwZyGWvq87SlHXW6mR5MmehPz78ndf2YvXFubXASGRbD0PBKSD9hJO
 nEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qB8tiSg9orpGv2oafVz+zb1jhV1wE750MfA0k2QQW9s=;
 b=rcld3gRb7vnL0Extx/KJgmnxleoPQkIMqGIxIk8KZWTuryU98yoaEHNxMtsnaJOz6z
 TC8syCC+FQb0lpugHmjtaE7oa8kJVai3Rvhn9xZIfSPT1srEi2o8b4wJVeL7JVOpbncY
 sV/OrrtjBVHZUhm/sJEyxko/10bhTKwIRD7Ae9c6YmavZmxQj+2Xw3LOoSk6ZRvrSYnW
 yFTrC9jMNig+KSGvxHAEb52Wa4SHaaJ5Aqj1mWIC9dRDbO7gk5yqpby5RXDjQWiZb5va
 9IT2vXFRlZ7+dS6fcyr5MMydrnCx7jWitYk08ew98hq3ioHsij0COgdXDG32AdcwMsh2
 8+ew==
X-Gm-Message-State: AOAM531Mjy1ZEhkiyniDk1rFbTH03/NiwzY1QTCgW8MTWAIPJDWKAsjh
 H1K9R9oDax6ohjptllnUBo84iw==
X-Google-Smtp-Source: ABdhPJw5CAaM7D9q3+CFzPibPNCbcA7gMgHTzab1tVA8q065CZ3vhqKEUGpu1+K0yDXGbet+UCoR+w==
X-Received: by 2002:a50:ed13:0:b0:426:4939:45a9 with SMTP id
 j19-20020a50ed13000000b00426493945a9mr22748001eds.303.1652178495995; 
 Tue, 10 May 2022 03:28:15 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 qr48-20020a1709068cb000b006f3ef214e13sm6051348ejc.121.2022.05.10.03.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 May 2022 03:28:15 -0700 (PDT)
Message-ID: <1c3fd336-1450-9b68-df81-2f01cc2ba32f@linaro.org>
Date: Tue, 10 May 2022 12:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: add vdosys1 RDMA definition
 for mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
References: <20220509044302.27878-1-rex-bc.chen@mediatek.com>
 <20220509044302.27878-2-rex-bc.chen@mediatek.com>
 <a5c9e7ad-c4b5-e757-cd6d-f79de47d1ff3@linaro.org>
 <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fbbbc7e6a951bdde648ddd896f1fa163dafa16f1.camel@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/05/2022 10:45, Rex-BC Chen wrote:
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        vdo1_rdma0: mdp-rdma@1c104000 {
>>
>> Generic node name. dma-controller (if it does not conflict with
>> dma-common.yaml schema)?
> 
> We don't understand what dma-controller you are referring to? Can you
> help explain more? Thanks!

Use a generic node name, as Devicetree spec asks:
"The name of a node should be somewhat generic, reflecting the function
of the device and not its precise programming

model. If appropriate, the name should be one of the following choices:"

I proposed dma-controller, but feel free to find better generic node name.

Best regards,
Krzysztof
