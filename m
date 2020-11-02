Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1C82A2FF0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 17:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251CE89C88;
	Mon,  2 Nov 2020 16:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB01B89C88
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 16:38:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c18so10037121wme.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 08:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nae684Se9cjKKM5dSoq6QvLSfun+FaGzkfYQZUOVJhc=;
 b=ki+fHT3uouzGlm0oLUvfrjpI/dxuT0A/3gdlMfoUGfH2/vAe0vD3p/tWUP7agaSGYL
 /891T0DB53TqdY2QlCSJYH0Eg3GxOHF0tbzcPalXcIB4xdBDcFQ49VbgfkiyirSmwZ3Z
 YuMtu3bHf3Ykt9mt53nLxIQB7bE0idSDaTlAU1uizajeXu0x7qiG6E35JFYtk9OJcidF
 Bus+ZFDE/fFNcpQvH3prLnvScmQbWEl6elQ9PyV/4l20TRmAwg5xyAMK3ZjmsPlq5AaD
 1OQKLhr9XXEZSODLPMvnqiyrl0l1v8nRRWODCRSZkFXhhf1UYin3Mav1SSZz+NIsv2RL
 BF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Nae684Se9cjKKM5dSoq6QvLSfun+FaGzkfYQZUOVJhc=;
 b=kRur51S4IjtXWbvnwLRYQlnqVeD+5HCiXblzveVYyCrQzIr7jFqER8zvDw8NffIkKL
 RLP1A2Mqsuz6PsU5g3uUdBr1SNXFaEGkbKf8BDIoQ1p5aLeY1QnPSfXdV7EIUXrxDJ/O
 Zd2pU9iYQ68f+RO8Rrok1GUviF+c457v/4MM5ZD90ara2gaVsRfXGEfvlGcfJKQYaGPa
 2Yf97i5nL6X94e1fOk7NfV5PsCJV12gq7o2ZSXObSTBRCFfcFPcr9pG4vo9AHcR3/e2F
 EpWiP2+bXR18dg7dlB8TA3/w9zstvVfuaEPnerePqADiklh3xuATO8tZNForCzN/KyBo
 K35A==
X-Gm-Message-State: AOAM533Dd+QSgOZpZLIHBtKQWspgBojwPI7h5olenBxcCs0+rltluORr
 SCPZW3SGOVsiscu50Tvy3rzUxW/hYrzRs3CW
X-Google-Smtp-Source: ABdhPJz1DGp71/V6BBPMkbp6Y2Ln7BpTDBBvlU3P7C6GGJs4t3yjPllp4TLB65f7OfY7GcP+Uh1CRg==
X-Received: by 2002:a1c:2ed3:: with SMTP id u202mr18779773wmu.85.1604335090834; 
 Mon, 02 Nov 2020 08:38:10 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:2573:f01e:ffc9:2ee5?
 ([2a01:e35:2ec0:82b0:2573:f01e:ffc9:2ee5])
 by smtp.gmail.com with ESMTPSA id z191sm16455317wme.30.2020.11.02.08.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Nov 2020 08:38:09 -0800 (PST)
Subject: Re: [PATCH v10 1/6] dt-bindings: display: Add support for Intel
 KeemBay Display
To: Rob Herring <robh@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
 <20201029222046.GA904738@ravnborg.org>
 <b30439f7-b77e-9ca8-57e9-16cf417da0cf@baylibre.com>
 <20201030211539.GB1003403@ravnborg.org>
 <CAL_JsqKFXDP921nGrO9o+RjMLnYLBiyagQmUUZFb10QJgu8kZQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <bcca48b9-5baa-2842-a6f0-23a2b668272a@baylibre.com>
Date: Mon, 2 Nov 2020 17:38:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKFXDP921nGrO9o+RjMLnYLBiyagQmUUZFb10QJgu8kZQ@mail.gmail.com>
Content-Language: en-US
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/11/2020 16:16, Rob Herring wrote:
> On Fri, Oct 30, 2020 at 4:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>>
>> Hi Neil.
>>
>> On Fri, Oct 30, 2020 at 09:31:36AM +0100, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 29/10/2020 23:20, Sam Ravnborg wrote:
>>>> Hi Anitha.
>>>>
>>>> On Thu, Oct 29, 2020 at 02:27:52PM -0700, Anitha Chrisanthus wrote:
>>>>> This patch adds bindings for Intel KeemBay Display
>>>>>
>>>>> v2: review changes from Rob Herring
>>>>> v3: review changes from Sam Ravnborg (removed mipi dsi entries, and
>>>>>     encoder entry, connect port to dsi)
>>>>>     MSSCAM is part of the display submodule and its used to reset LCD
>>>>>     and MIPI DSI clocks, so its best to be on this device tree.
>>>>>
>>>>> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>
>>>> Looks good - and the split betwwen the display and the mipi<->dsi parts
>>>> matches the understanding of the HW I have developed.
>>>>
>>>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>>>>
>>>>> ---
>>>>>  .../bindings/display/intel,keembay-display.yaml    | 75 ++++++++++++++++++++++
>>>>>  1 file changed, 75 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-display.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
>>>>> new file mode 100644
>>>>> index 0000000..8a8effe
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
>>>>> @@ -0,0 +1,75 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/display/intel,keembay-display.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Devicetree bindings for Intel Keem Bay display controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>>>>> +  - Edmond J Dea <edmund.j.dea@intel.com>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: intel,keembay-display
>>>>> +
>>>>> +  reg:
>>>>> +    items:
>>>>> +      - description: LCD registers range
>>>>> +      - description: Msscam registers range
>>>>> +
>>>
>>> Indeed the split is much better, but as you replied on http://lore.kernel.org/r/BY5PR11MB41827DE07436DD0454E24E6E8C0A0@BY5PR11MB4182.namprd11.prod.outlook.com
>>> the msscam seems to be shared with the camera subsystem block, if this is the case it should be handled.
>>>
>>> If it's a shared register block, it could be defined as a "syscon" used by both subsystems.
>>
>> I think I got it now.
>>
>> msscam is used to enable clocks both for the display driver and the
>> mipi-dsi part.
> 
> If just clocks, then the msscam should be a clock provider possibly.
> If not, then the below looks right.

I agree

> 
>>
>> So it should be pulled in to a dedicated node - for example like this:
>>
>> mssscam: msscam@20910000 {
>>         compatible = "intel,keembay-msscam", "syscon";
>>         reg = <0x20910000, 0x30>;
>>         reg-io-width = <4>;
>> };
>>
>> And ofc we need a binding file for that.
>>
>>
>> And then we could have code like this in the display driver:
>>         regmap *msscam = syscon_regmap_lookup_by_compatible("intel,keembay-msscam");
>>         if (IS_ERR(msscam))
>>                 tell-and goto-out;

It's better to use a phandle in the display node, instead of looking for compatible nodes.

>>
>>         regmap_write(msscam, MSS_LCD_MIPI_CFG, 1);
>>         regmap_write(msscam, MSS_LOOPBACK_CFG, 0);
>>
>> And then in the kmb_dsi part:
>>         regmap *msscam = syscon_regmap_lookup_by_compatible("intel,keembay-msscam");
>>         if (IS_ERR(msscam))
>>                 tell-and goto-out;
>>
>>         regmap_write(msscam, MSS_MIPI_CIF_CFG, 1);
>>
>>
>> Did I finally get it?

Yes, this is what I was thinking about, thanks

Neil

>>
>>         Sam
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
