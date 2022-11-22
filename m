Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C963408A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 16:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC189D56;
	Tue, 22 Nov 2022 15:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF1F89D56
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 15:48:52 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d1so13237550wrs.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 07:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iejRpG5xmG3AVT59k2korzV+i4h+JxFeIQ6F9nhVYVE=;
 b=ERJaFk4RY2JkFY1qv6TQODE0AZ/ynMZlyKjqpHHZeLeGVUineTumgeSDCVdaBTDoCE
 k3JFmtpqgr2rwK2uCB+hzbXD4Lu+hEHgql6SJVCdw7yOg3rP2YZgXzJaDpEvv9VMzxEO
 envg5y6jmXVxTExN5qMcUhLl8tIAoNNfOCRXBoBRGS/MqWlfpz9kH9EYVqDHKh/deueG
 J9CNjTwJ5Bt6sLbAhD3sUZWhQF/yFlSocEihRmiNKnnbgdfeB+fWGAMd6rFZkji9ZWfB
 FDhyCf+fte3sj9Ss2mq8SnVDVPA45GnYCwfS2Gj/tGOYAEEbE2XxgXL9OmhNnlXIzQf1
 FVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iejRpG5xmG3AVT59k2korzV+i4h+JxFeIQ6F9nhVYVE=;
 b=ZM9l9imWoJ9DlatwhDfG+EtOmCHtydtdvnWRa2ZspmXkOxLgXKvgHtrDQov6G2WB3g
 wCAjxtPUfCFw8pbimieEZys+jhtDUJwUbLUU2gJOF4aHoNoOGIMkftUC77pE7A1J3qeY
 cnuGWacUVYr563iG93TIUL6Ziu6TCM5espkWaCVgD5HbjHDYbLh6Ez5177xFkNG3vCgf
 0ymqai5YPU9fD7IdXKd3l731d7A9WEmwOR9yHIckYDthTw81zUqQVfGEgiLtTDriv6Nw
 gzogCgQl0+ZryOCZKthvwdWPix1d7rCv5TipMx34mp2gqqn8KJeeaFQrZfl3dRh84XSZ
 UCmA==
X-Gm-Message-State: ANoB5pkEdhWhbWRtx7aU1ClYyJ6nKaVLRSS36/4+O5f0YPRla5tYLokM
 a9vN/1M7dS9sznV78TzBISU=
X-Google-Smtp-Source: AA0mqf5NEgw8nrH93u2bY10c05fdm/Tx+wCnuYxy3cVf0cNE/5kLDJeWbVYnyzre7ISbHsO3k7PUGQ==
X-Received: by 2002:adf:e84f:0:b0:22e:37c1:b225 with SMTP id
 d15-20020adfe84f000000b0022e37c1b225mr13795647wrn.428.1669132130446; 
 Tue, 22 Nov 2022 07:48:50 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a5d58fc000000b0022e36c1113fsm14161625wrd.13.2022.11.22.07.48.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:48:48 -0800 (PST)
Message-ID: <a5464d62-bb42-5bdf-e49e-5c3edef4b09b@gmail.com>
Date: Tue, 22 Nov 2022 16:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Content-Language: en-US
To: =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
 <c6297a1c-e282-4a18-f16c-fa2df08b440a@gmail.com>
 <f6d7eaa0b7e2a3ed6567692616ebc1304500806c.camel@mediatek.com>
 <fd6c1299-4ac9-6d51-247f-3a7b7e39052b@gmail.com>
 <de21390898759ce979da8d2ae76a93982f59c149.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <de21390898759ce979da8d2ae76a93982f59c149.camel@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/11/2022 11:51, Nancy Lin (林欣螢) wrote:
> Dear Matthias,
> 
> Thanks for the review.
> 
> On Thu, 2022-11-10 at 14:10 +0100, Matthias Brugger wrote:
>> 
>> On 09/11/2022 06:10, Jason-JH Lin (林睿祥) wrote:
>> > On Tue, 2022-11-08 at 18:46 +0100, Matthias Brugger wrote:
>> > > 
>> > > On 07/11/2022 08:22, Nancy.Lin wrote:
>> > > > Add vdosys1 mmsys compatible for MT8195 platform.
>> > > > 
>> > > > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines
>> > > > binding
>> > > > to
>> > > > 2 different power domains, different clock drivers and
>> > > > different
>> > > > mediatek-drm drivers.
>> > > > 
>> > > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>> > > > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > > > ---
>> > > >  
>> > > > .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      |
>> > > > 4
>> > > > +++-
>> > > >   1 file changed, 3 insertions(+), 1 deletion(-)
>> > > > 
>> > > > diff --git
>> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
>> > > > .yam
>> > > > l
>> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
>> > > > .yam
>> > > > l
>> > > > index 0711f1834fbd..aaabe2196185 100644
>> > > > ---
>> > > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
>> > > > .yam
>> > > > l
>> > > > +++
>> > > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys
>> > > > .yam
>> > > > l
>> > > > @@ -48,7 +48,9 @@ properties:
>> > > >             - const: syscon
>> > > >   
>> > > >         - items:
>> > > > -          - const: mediatek,mt8195-vdosys0
>> > > > +          - enum:
>> > > > +              - mediatek,mt8195-vdosys0
>> > > > +              - mediatek,mt8195-vdosys1
>> > > >             - const: mediatek,mt8195-mmsys
>> > > >             - const: syscon
>> > > >   
>> > > 
>> > > I think we had that several times already:
>> > > 
>> > 
>> > 
> https://lore.kernel.org/all/6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org/
>> > > 
>> > > We will something like this, but please check that this does not
>> > > give
>> > > any 
>> > > errors/warnings:
>> > > 
>> > > diff --git
>> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y
>> > > aml 
>> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y
>> > > aml
>> > > index eb451bec23d3d..8e9c4f4d7c389 100644
>> > > ---
>> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y
>> > > aml
>> > > +++
>> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.y
>> > > aml
>> > > @@ -32,13 +32,22 @@ properties:
>> > >                 - mediatek,mt8183-mmsys
>> > >                 - mediatek,mt8186-mmsys
>> > >                 - mediatek,mt8192-mmsys
>> > > -              - mediatek,mt8195-mmsys
>> > >                 - mediatek,mt8365-mmsys
>> > >             - const: syscon
>> > >         - items:
>> > >             - const: mediatek,mt7623-mmsys
>> > >             - const: mediatek,mt2701-mmsys
>> > >             - const: syscon
>> > > +      - items:
>> > > +          - const: mediatek,mt8195-vdosys0
>> > > +          - const: syscon
>> > > +      - items:
>> > > +          - const: mediatek,mt8195-vdosys1
>> > > +          - const: syscon
>> > > +      - items:
>> > > +          - const: mediatek,mt8195-mmsys
>> > > +          - const: syscon
>> > > +      deprecated: true
>> > > 
>> > >     reg:
>> > >       maxItems: 1
>> > 
>> > Hi Matthias,
>> > 
>> > As the vdosys0 previous reviewed patch:
>> > 
>> > 
> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220927152704.12018-2-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!zRdbIyyAsfqob2kapMAcKYATAguhEV0x0qE5cTOAcWUNhzeAbMHzZoos_2QzUCxS$
>> >  
>> > Should I modify the vdosys0 items format like your example?
>> > 
>> > Or should vdosys1 add items format like vdosys0's previous patch?
>> >      - items:
>> >          - const: mediatek,mt8195-vdosys1
>> >          - const: mediatek,mt8195-mmsys
>> >          - const: syscon
>> > 
>> 
>> No, vdosys1 must not have mediatek,mt8195-mmsys fallback.
>> 
>> Regards,
>> Matthias
>> 
> 
> I will fix it and add the following vdosys1 binding base on [1].
> 
>        - description: vdosys0 and vdosys1 are 2 display HW pipelines,
>                       so mt8195 binding should be deprecated.
>          deprecated: true
>          items:
>            - const: mediatek,mt8195-mmsys
>            - const: syscon
>        - items:
>            - const: mediatek,mt7623-mmsys
>            - const: mediatek,mt2701-mmsys
>            - const: syscon
>        - items:
>            - const: mediatek,mt8195-vdosys0
>            - const: mediatek,mt8195-mmsys
>            - const: syscon
>   +    - items:
>   +        - const: mediatek,mt8195-vdosys1
>   +        - const: syscon
> 

Looks good, thanks
Matthias

> [1]
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/matthias.bgg/linux/+/b237efd47df7d25b78c306e90b97c5aa0ff4c4fc/Documentation/devicetree/bindings/arm/mediatek/mediatek%2Cmmsys.yaml
> 
> Regards,
> Nancy
> 
> 
>> > Regards,
>> > Jason-JH.Lin
>> > 
>> > 
>> > 
>> > ************* MEDIATEK Confidentiality Notice
>> >   ********************
>> > The information contained in this e-mail message (including any
>> > attachments) may be confidential, proprietary, privileged, or
>> > otherwise
>> > exempt from disclosure under applicable laws. It is intended to be
>> > conveyed only to the designated recipient(s). Any use,
>> > dissemination,
>> > distribution, printing, retaining or copying of this e-mail
>> > (including its
>> > attachments) by unintended recipient(s) is strictly prohibited and
>> > may
>> > be unlawful. If you are not an intended recipient of this e-mail,
>> > or believe
>> >   
>> > that you have received this e-mail in error, please notify the
>> > sender
>> > immediately (by replying to this e-mail), delete any and all copies
>> > of
>> > this e-mail (including any attachments) from your system, and do
>> > not
>> > disclose the content of this e-mail to any other person. Thank you!
>> 
>> 
> 
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
