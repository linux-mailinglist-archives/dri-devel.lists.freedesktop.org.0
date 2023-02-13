Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7833694480
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 12:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C283410E56A;
	Mon, 13 Feb 2023 11:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ACC910E522
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 11:29:57 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so11886964pjp.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 03:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oMRBalgZt1NhHh8/Xj4aw6RZFRl8clPnr6APpPegkDM=;
 b=b6nIXh4NtKTVI7klAL8x/JZYRUQ9nCmCP3D/V3sGKRlJI5Vrxj9NWj+0WtcqtsozCK
 PB6SrNhDvcEfWMrW/+Z0pO9A3Enik17aM5yPyvVp2hSv3FEm86PhRTOXhgAiVd2MFd/5
 KH/pGJLqFxcS2CWs1BPuUNcwmm3Qifct73kfwMDtpJlYCgYRh7a7GXTAfoWw1kcd8r+B
 lEq35qAG8wsXgi+QNO4FgPTDy6Y/oUzzH0bjghJds60o88NyalrjVpfsj941lDPGzj7F
 p2sq4KXu001+jZWqOa9ZjGCZsDa1sq1uC9t3G1o6e6Ft9iClX2X2ozJ5enyDqd+CyGQ8
 ci0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oMRBalgZt1NhHh8/Xj4aw6RZFRl8clPnr6APpPegkDM=;
 b=3+C9RsLs+s3P6BbAYLi6VBMiZeQBWMmUVbr6lfI+FzamkrNDQPqmoNqf/cam2gtt09
 COwz3JnFGCxjL22U9CkeQYBgWImDuGCls6iCq/idvbNLo29Op1+5dPRn6AlZV0pEbFHv
 9pALXcz3zEf1KhHavvZOaXYOi1TXHWev320lA1W4tMIJqXAyDRcdcYbQ72Al8VNbTE08
 dncy302V9o15mKLQrS4bwVR/x3g4ziM7P6ad2OE1rCMf0hYt+wtqJqPL1KHztfGco01F
 SZxJQMXJHtWyxG67pWJ3Li0zfwp6W1J/bbkuPx1Q61z93zeEdfE9YdokEIKReIVJym37
 cM5w==
X-Gm-Message-State: AO0yUKUYp7rHyicnZXvoYPQgHIXS17z25UROV167lzeREp71K/PJUKEF
 KziMPOJP8nQ3QlQ7cnJMq38=
X-Google-Smtp-Source: AK7set99jyM6Gb47HIlRmf7V9ovJaH9x+Thw2GqdneoMwhS/APNGfF70ujPMMWpzvr1jMvle1JCtmQ==
X-Received: by 2002:a17:903:3015:b0:19a:8316:6b51 with SMTP id
 o21-20020a170903301500b0019a83166b51mr6026012pla.4.1676287796620; 
 Mon, 13 Feb 2023 03:29:56 -0800 (PST)
Received: from Gentoo (n220246252084.netvigator.com. [220.246.252.84])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a170903120300b00186c3afb49esm7956540plh.209.2023.02.13.03.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 03:29:56 -0800 (PST)
Date: Mon, 13 Feb 2023 19:29:48 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Novatek NT36523
 bindings
Message-ID: <Y+ofLDV1nsQ/WUJs@Gentoo>
References: <20230210161925.32343-1-lujianhua000@gmail.com>
 <6cffa875-d8cc-a4fe-e18d-2e24c28a49d8@linaro.org>
 <Y+oZOXyE8/a+vreS@Gentoo>
 <ad5dd369-842f-7301-e57d-d0445f0a5268@linaro.org>
 <Y+oc+kEDoiMsebWF@Gentoo>
 <4055b041-c012-3be6-0aef-085ec389aabd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4055b041-c012-3be6-0aef-085ec389aabd@linaro.org>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 13, 2023 at 12:23:04PM +0100, Krzysztof Kozlowski wrote:
> On 13/02/2023 12:20, Jianhua Lu wrote:
> > On Mon, Feb 13, 2023 at 12:08:27PM +0100, Krzysztof Kozlowski wrote:
> >> On 13/02/2023 12:04, Jianhua Lu wrote:
> >>> On Mon, Feb 13, 2023 at 11:45:23AM +0100, Krzysztof Kozlowski wrote:
> >>>> On 10/02/2023 17:19, Jianhua Lu wrote:
> >>>>> Novatek NT36523 is a display driver IC that can drive DSI panel. It
> >>>>> is also present in the csot and boe video mode panels. It is found
> >>>>> in Xiaomi Mi Pad 5 series.
> >>>>>
> >>>>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> >>>>> ---
> >>>>>  .../display/panel/novatek,nt36523.yaml        | 101 ++++++++++++++++++
> >>>>>  1 file changed, 101 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> >>>>> new file mode 100644
> >>>>> index 000000000000..a7098d0ce7e1
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> >>>>> @@ -0,0 +1,101 @@
> >>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/display/panel/novatek,nt36523.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: Novatek NT36523 based DSI display Panels
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Jianhua Lu <lujianhua000@gmail.com>
> >>>>> +
> >>>>> +description: |
> >>>>> +  The nt36523 IC from Novatek is a generic DSI Panel IC used to drive dsi
> >>>>> +  panels.
> >>>>> +  Right now, only support cost and boe LCD display panels with the
> >>>>
> >>>> boe? both?
> >>> Boe Technology Group Co., Ltd
> >>
> >> Then what is "cost"? If both are names, then they start with capital
> >> letters or how the company officially spells itself.
> > both are company name, I will search offical name for it.
> 
> "cost" is company name? Then why do you call binding with different one?
"cost" is a typo error, real name is "csot".
> 
> >>
> >>>>
> >>>>> +  resolution of 1600x2560. It is a video mode DSI panel.
> >>>>
> >>>> The binding or hardware supports only 1600x2560? The how it can be
> >>>> "right now"? It's defined, isn't it?
> >>> Yes
> >>
> >> What yes? How it can be "right now"? It implies it will change, so how
> >> hardware can change?
> > sorry, my wrong. This binding only support 1600x2560.
> 
> How binding can support only 1600x2560? How does it exactly work for
> binding?
the driver of this binding support 1600x2560 and panels are 1600x2560.
> 
> 
> Best regards,
> Krzysztof
> 
