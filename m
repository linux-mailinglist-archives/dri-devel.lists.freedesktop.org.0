Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1D4E7A12
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 18:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5553410E445;
	Fri, 25 Mar 2022 17:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B5010E445
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 17:46:03 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id qx21so16759829ejb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 10:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T3ZMNixaLJElkzcw1+eEB0m28rN9ABVv9LlORr52Gis=;
 b=ylTG6Q2o9iFAuo6iijH7ax4lbaeFDg/+BOPlxtFWFfN75d85s0O4lsiqaFQddOb8gZ
 wv1SOwraEbAe7o6116V+AQKTTYbqGGoS4sewqyIBm4oU8S4ODhBoh4iFvosRzoeSt9zu
 fRD2dCm3Rrsj9bggJo2wynYfiQKXkSBAEPQBohZkw8sOv8eNIgNbRnqE0pSbjObi0JO/
 l4duratBG7T12ypPTTrZx1sm/M2JSk4DFwWLwvP1h50OlHaWRf4OKCCy7KBZ6UvzsYkz
 N4p2bHyfnluGYgLZYWgLUz6V2FTZu4otH6kTKP0quSYYenj6FOb1jfmE1mMGLTzV85bI
 NfRQ==
X-Gm-Message-State: AOAM530QMjY3zBlu/ml6fIpsYdfNORXHlcKllHVwwU2ZuaN9qQbDdI9C
 HhDGwW9+9jpNn8ZC73Zrw3w=
X-Google-Smtp-Source: ABdhPJxzhvYxQoq+OEFG3ywwQ643UpdmE/aW2fDwOBXfrMtLACv55jBSXSPboOkX/8x59n4J/6WaDQ==
X-Received: by 2002:a17:907:2dac:b0:6db:e1e8:c66f with SMTP id
 gt44-20020a1709072dac00b006dbe1e8c66fmr12992334ejc.382.1648230362374; 
 Fri, 25 Mar 2022 10:46:02 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 bd12-20020a056402206c00b00418c9bf71cbsm3079365edb.68.2022.03.25.10.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 10:46:01 -0700 (PDT)
Message-ID: <5f864d33-3370-7a1b-d796-908ff49d3e3b@kernel.org>
Date: Fri, 25 Mar 2022 18:45:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 01/22] dt-bindings: mediatek,dpi: Add DP_INTF compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 angelogioacchino.delregno@collabora.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220325171511.23493-1-granquet@baylibre.com>
 <20220325171511.23493-2-granquet@baylibre.com>
 <8baedbe6-eb60-02b4-a6b8-fe3abc566335@kernel.org>
 <CABnWg9s3vmpCFFai_BMjagqHehk2vbP0ST_tfWvOxmtubPm14g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CABnWg9s3vmpCFFai_BMjagqHehk2vbP0ST_tfWvOxmtubPm14g@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/03/2022 18:43, Guillaume Ranquet wrote:
> On Fri, 25 Mar 2022 18:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 25/03/2022 18:14, Guillaume Ranquet wrote:
>>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>>
>>> DP_INTF is similar to DPI but does not have the exact same feature set
>>> or register layouts.
>>>
>>> DP_INTF is the sink of the display pipeline that is connected to the
>>> DisplayPort controller and encoder unit. It takes the same clocks as
>>> DPI.
>>>
>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> This is v1, how did you get Rob's review already?
>>
> 
> Because this is not v1... I'm not really good at this... 

Don't worry, I made many more mistakes...

> this is actually v9...
> I just didn't pay attention enough before sending the series.
> 
> What's the standard thing to do? resend with the proper versionning?

Yes, please resend as v1 with cover-letter containing changelog. Anyway
someone might scream that you spam his box (immediate resends are also
not welcomed), but what to do. :)


Best regards,
Krzysztof
