Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D952A4070
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 10:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E566E898;
	Tue,  3 Nov 2020 09:36:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7CF6E894
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 09:36:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n18so17716130wrs.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 01:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y6lf9igQOuopXaJsW8bl6rvQoWNxewPFA+o+/f+Bszw=;
 b=1cFUvacvrbuyC61M+ZwvGvSGOW+N7423JCn6Y+nsRZ48JRauMMEZRkJrtICdEmV67G
 +obE5BIYeTI/EjCKFa8/1VdNFs4yMtVAPNqlcjuCKwMQ/ciTp10HoVLs7PhoHHPMAJ/f
 Oj2y9i5m3ai7FCNV0APfda/I6CIIaiml0D/SwNtitbomRjhSka2lk2bg8mMNPBNz0ZRT
 HR1OTExMCFVBgGV04lQ0uOjSQ3Zp9MwcG1P66ogdGyrofu8/Y/7mXB08AQhtp8acHBo5
 9iArvgAl0YqvP3tMrFUS7c+wc9j5bAEjpoibbGexAXnEL1pOTK6scgtRhwswJJeFsFxZ
 JAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Y6lf9igQOuopXaJsW8bl6rvQoWNxewPFA+o+/f+Bszw=;
 b=nmIX1NtNggsx1sGM0yOYuR428quFaaDL+Kzo9s2GWFZ8K3PLPYcOoR7IZusJ2FltCI
 GFo8Y1agYeMC8n3mbkRHmV8wumZUYCzy1fbsSHAt3K0fupVxkCuz0pMDyTXQlM1f2tyM
 E/ic6nTNDs7p2ZSqMO8G3rBdUQc2HT+bfDnsK7QiYE05ajgifIDarPJyPOy35txbCPeF
 4DzM6l5t7JDBnFEb9M/NMRyOIdFVjojOv9SX7vRzAnY7u4UYAhP2WOxsyfu7OjvD+oV6
 E5817q40YlGfbpVx4W7zBLfR3CfQ0egRyoQ+y/OfCoT0NqeYZGfKODhj3hgQciM/bzJi
 rVFg==
X-Gm-Message-State: AOAM531G76scxIoeT7KIWE0OGYVddGA+mHf0WicHwXxnd4AWnVWAdxX4
 ik1ELn7IEp+Th31+iHHmlvHc6SH+3hndAWhD
X-Google-Smtp-Source: ABdhPJzZejtrePtxd2tBkrSmmFx8cv49TO7H31nt2J9F71q4Qr927Xv5hCENDkiNLK2jIfe/8FA7ag==
X-Received: by 2002:a05:6000:104c:: with SMTP id
 c12mr24406285wrx.133.1604396215550; 
 Tue, 03 Nov 2020 01:36:55 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:3d8d:fb08:21c9:faa3?
 ([2a01:e35:2ec0:82b0:3d8d:fb08:21c9:faa3])
 by smtp.gmail.com with ESMTPSA id 90sm6615868wrl.30.2020.11.03.01.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2020 01:36:54 -0800 (PST)
Subject: Re: [PATCH v10 1/6] dt-bindings: display: Add support for Intel
 KeemBay Display
To: Rob Herring <robh@kernel.org>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
 <20201029222046.GA904738@ravnborg.org>
 <b30439f7-b77e-9ca8-57e9-16cf417da0cf@baylibre.com>
 <20201030211539.GB1003403@ravnborg.org>
 <CAL_JsqKFXDP921nGrO9o+RjMLnYLBiyagQmUUZFb10QJgu8kZQ@mail.gmail.com>
 <bcca48b9-5baa-2842-a6f0-23a2b668272a@baylibre.com>
 <CAL_JsqKek2WtQfBMhiX5qFTQJEVpYEXW7pHA3TZM-yjb550VqQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1d60eded-c151-72f6-9489-ec87c627d0a8@baylibre.com>
Date: Tue, 3 Nov 2020 10:36:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKek2WtQfBMhiX5qFTQJEVpYEXW7pHA3TZM-yjb550VqQ@mail.gmail.com>
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
 Edmund J" <edmund.j.dea@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/11/2020 03:02, Rob Herring wrote:
> On Mon, Nov 2, 2020 at 10:38 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 02/11/2020 16:16, Rob Herring wrote:
>>> On Fri, Oct 30, 2020 at 4:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>>>>
>>>> Hi Neil.
>>>>
>>>> On Fri, Oct 30, 2020 at 09:31:36AM +0100, Neil Armstrong wrote:
>>>>> Hi,
>>>>>
>>>>> On 29/10/2020 23:20, Sam Ravnborg wrote:
>>>>>> Hi Anitha.
>>>>>>
>>>>>> On Thu, Oct 29, 2020 at 02:27:52PM -0700, Anitha Chrisanthus wrote:
>>>>>>> This patch adds bindings for Intel KeemBay Display
>>>>>>>
>>>>>>> v2: review changes from Rob Herring
>>>>>>> v3: review changes from Sam Ravnborg (removed mipi dsi entries, and
>>>>>>>     encoder entry, connect port to dsi)
>>>>>>>     MSSCAM is part of the display submodule and its used to reset LCD
>>>>>>>     and MIPI DSI clocks, so its best to be on this device tree.
>>>>>>>
>>>>>>> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>>>>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
>>>>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>
>>>>>> Looks good - and the split betwwen the display and the mipi<->dsi parts
>>>>>> matches the understanding of the HW I have developed.
>>>>>>
>>>>>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>>>>>>
>>>>>>> ---
>>>>>>>  .../bindings/display/intel,keembay-display.yaml    | 75 ++++++++++++++++++++++
>>>>>>>  1 file changed, 75 insertions(+)
>>>>>>>  create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-display.yaml
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
>>>>>>> new file mode 100644
>>>>>>> index 0000000..8a8effe
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
>>>>>>> @@ -0,0 +1,75 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/display/intel,keembay-display.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Devicetree bindings for Intel Keem Bay display controller
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
>>>>>>> +  - Edmond J Dea <edmund.j.dea@intel.com>
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: intel,keembay-display
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    items:
>>>>>>> +      - description: LCD registers range
>>>>>>> +      - description: Msscam registers range
>>>>>>> +
>>>>>
>>>>> Indeed the split is much better, but as you replied on http://lore.kernel.org/r/BY5PR11MB41827DE07436DD0454E24E6E8C0A0@BY5PR11MB4182.namprd11.prod.outlook.com
>>>>> the msscam seems to be shared with the camera subsystem block, if this is the case it should be handled.
>>>>>
>>>>> If it's a shared register block, it could be defined as a "syscon" used by both subsystems.
>>>>
>>>> I think I got it now.
>>>>
>>>> msscam is used to enable clocks both for the display driver and the
>>>> mipi-dsi part.
>>>
>>> If just clocks, then the msscam should be a clock provider possibly.
>>> If not, then the below looks right.
>>
>> I agree
>>
>>>
>>>>
>>>> So it should be pulled in to a dedicated node - for example like this:
>>>>
>>>> mssscam: msscam@20910000 {
>>>>         compatible = "intel,keembay-msscam", "syscon";
>>>>         reg = <0x20910000, 0x30>;
>>>>         reg-io-width = <4>;
>>>> };
>>>>
>>>> And ofc we need a binding file for that.
>>>>
>>>>
>>>> And then we could have code like this in the display driver:
>>>>         regmap *msscam = syscon_regmap_lookup_by_compatible("intel,keembay-msscam");
>>>>         if (IS_ERR(msscam))
>>>>                 tell-and goto-out;
>>
>> It's better to use a phandle in the display node, instead of looking for compatible nodes.
> 
> No, you don't need it in DT unless there's more than one instance or
> other parameters needed like register offsets/masks. The above is
> actually faster too walking a list rather than a phandle look up
> (though the phandle cache now may make it faster).

A phandle makes the dependency explicit, anyway it's only an advice.

Neil

> 
> Rob
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
