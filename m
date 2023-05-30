Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654847166BD
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A6F210E39D;
	Tue, 30 May 2023 15:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E2410E3AC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 15:13:28 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f3edc05aa5so5098741e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 08:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685459603; x=1688051603;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q0/z84vpwzDI0aF57Cc6ksVNfZpqpUHT2FEMjJzlh94=;
 b=DLZkgFZOM1gND9DmdiaAJM9g+tCWyWEsy1rkK9h2UTsv0Xf9cVeV39g4AF38Q4a/Hw
 N6HHkBeepqYGI9sL+Ukzk6jnP7mAPiRveUI36F787m14Px3yeYH7NzwNJF/AZafarbVq
 XHnNv5dQTUQ6/m4RGdrYDAW0Dqd2mWwiyd2xjia9Q+oZsYiMigwHxBusSGdfTTZBdIna
 z+TYxlrWo8LbxJFUjuv79mi5xPR7boJfEpvpRTpFXH6APgKufjExoZ68nUzFXjBhlQjJ
 xYhGnSOM33ER6+mwu5KyqFhFGrvaKyrkH+KNckfje7ENSrETpl2ps6DKAk1ZUm/dqRj3
 E2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685459603; x=1688051603;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q0/z84vpwzDI0aF57Cc6ksVNfZpqpUHT2FEMjJzlh94=;
 b=gLANIHjjeKFTbeNFUJAkfykJHRAMgg5knWUEbrp/S0qcaI2n++WRQcUi8qL4PuF8Dw
 +eSlL+foV5gbF/rFJ2EJgFWRqbzPL9tUQSLD68MVZDsKj4gy8xCuqIDHzzcovYSOAZoZ
 rsNcW3vks09QY4fecHlTvvaodzdfD/E3Ym6vFOyxqu/61UD84jBfpK2vAbwmB7sFQVOI
 P/rSlNsr9qTTx9vVgFYFuQj034knsdGyLQt4i9xLQU3W1gJ/DtkysyMHzChrS217L9YG
 FDB0dFDPSJtJJ03dlPJK2saDSjBt7xTY0Ec2IyyEnJxIS9rBFDcIsTkIEBBVvxvHejBq
 MZHA==
X-Gm-Message-State: AC+VfDzQVvJM/B4ivrYLdwnukbERlmOD6kF7RCbLm90PC4X/T4UrFKSC
 w7RBK+4SYbVFnyFqlr2LMWbngg==
X-Google-Smtp-Source: ACHHUZ7SvKJbZWJPmeT0C+ABZU3yfrSxqfz3eGl3iFFeZe4ORHtBEQZ2gfN0Dz9DmIpJ5trb7iGK5w==
X-Received: by 2002:a2e:9e59:0:b0:2af:1119:8c77 with SMTP id
 g25-20020a2e9e59000000b002af11198c77mr972198ljk.49.1685459603419; 
 Tue, 30 May 2023 08:13:23 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 q26-20020a17090622da00b0096f7cf96525sm7578171eja.146.2023.05.30.08.13.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 08:13:23 -0700 (PDT)
Message-ID: <bf204c54-a51b-21d0-9fbf-3729d277ef76@linaro.org>
Date: Tue, 30 May 2023 17:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/4] dt-bindings: display: st,stm32-dsi: Remove
 unnecessary fields
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>
References: <20230529091359.71987-1-raphael.gallais-pou@foss.st.com>
 <20230529091359.71987-3-raphael.gallais-pou@foss.st.com>
 <20230530122736.tflfu5cugbd7ooup@krzk-bin>
 <92d5a699-9f5d-2e40-ca73-4604f3e5a657@foss.st.com>
 <af31ae21-2711-2fac-e885-b3bbbcb12be8@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <af31ae21-2711-2fac-e885-b3bbbcb12be8@foss.st.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>, kernel@dh-electronics.com,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 15:38, Raphael Gallais-Pou wrote:
> 
> On 5/30/23 15:30, Alexandre TORGUE wrote:
>> On 5/30/23 14:27, Krzysztof Kozlowski wrote:
>>> On Mon, 29 May 2023 11:13:57 +0200, Raphael Gallais-Pou wrote:
>>>> "#address-cells" and "#size-cells" are two properties that are not
>>>> mandatory. For instance, the DSI could refer to a bridge outside the scope
>>>> of the node rather than include a 'panel@0' subnode. By doing so, address
>>>> and size fields become then unnecessary, creating a warning at build time.
>>>>
>>>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>>> Reviewed-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>>   Documentation/devicetree/bindings/display/st,stm32-dsi.yaml | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>
>>> Running 'make dtbs_check' with the schema in this patch gives the
>>> following warnings. Consider if they are expected or the schema is
>>> incorrect. These may not be new warnings
>> I checked it before merging the series on stm32-next tree. I didn't get this
>> error. I didn't check commit per commit.
>>
>> Do you get this error after merging the whole series ?
> 
> 
> I think this is because of the order of the patches within the serie. The patch
> correcting the yaml is before those modifying the device-trees. This could
> explain warnings rise up when checking patch per patch. However I did not get
> any errors on top of  the whole serie.

Yeah. Ignore the report if you tested it by yourself.

Best regards,
Krzysztof

