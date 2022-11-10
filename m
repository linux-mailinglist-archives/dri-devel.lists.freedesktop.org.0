Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861036242F3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DEA10E7A2;
	Thu, 10 Nov 2022 13:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EF910E7A2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:10:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso3357598wme.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 05:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yL0cVte9a939MoGJNQP240RI8HAcw+DjA5CbWcF3nS8=;
 b=kpAM4pLTdK+DDmTEcqYBEUujLnIVhP1g1eiHVMXQDqrYLsplAgE7ndh/HXd8ICRR/0
 7tLu7r9tovvtWxpkdIh+QCgxviJZUNgRf7ewNk6bTk+lc8Pm+efI4ZcepphVTd0yuPKZ
 Igt0Sl1RK3X57dWmllmDDePFjby9hnxHiuhODPFCWoct6i7TQz5Dv6RohFKL6SufUrBu
 QGjuCQ0TOyTCVqKtPLDY0OeefQ37a8uWTAvfNXLIQ5BjF+wpbyIEOKhk2sQ1Xuhv9rfo
 cJea/2l1QIGuiXHOetWojjSIB/PvgJ7owrxTQD98qWAMgoYxcisXxFZlOADaCcpAznIL
 4VlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yL0cVte9a939MoGJNQP240RI8HAcw+DjA5CbWcF3nS8=;
 b=aft2TPGCt0Pejv6nJQ41YwHROX2XdG7RxR7fH3ZxUJPwS9whEZ8MCVPhGY0GHujTGy
 e8JzP2lt6p6XlNvT034P2T7IS5+tcg94K45KNMAAQxHrSSG1aWRPnD6PQzntlN5lMneD
 D6uVY0W5F1R5F0d1GOKNPDV1l9RTr7Rjqz08QRLpnkvTP95z78Nrf4LPccogO8pYggr3
 t9DGZSF0lRrT9kcNFFWtHHIf8gbX2IemFzF7GXEvn+iF7aURxFrJwFddtYD1qTe3key2
 uVc5fBDqivt4WsRFt7b65i89EnsDPOqzfq6GZs9yNNqw79NEX53HPtnfbrs9BW/Tj7Vi
 O87g==
X-Gm-Message-State: ACrzQf2RN2PRcqvamWcUyYxzsVB0AVAg+HE2AFXY5WtiBnTcl1bDCYmq
 U/WXx1godfUlsRLZlpfsIjA=
X-Google-Smtp-Source: AMsMyM7whgHr0D/H8u9zXHEPDlzgmZkPEGOPT28zO0gppit6MnpSV8QY1AQRSIhHxQKMzTjPvvbxqA==
X-Received: by 2002:a05:600c:4ed0:b0:3cf:7fb1:e1ec with SMTP id
 g16-20020a05600c4ed000b003cf7fb1e1ecmr33337961wmq.181.1668085833736; 
 Thu, 10 Nov 2022 05:10:33 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05600c2f0800b003c701c12a17sm4928259wmn.12.2022.11.10.05.10.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 05:10:32 -0800 (PST)
Message-ID: <fd6c1299-4ac9-6d51-247f-3a7b7e39052b@gmail.com>
Date: Thu, 10 Nov 2022 14:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
 <c6297a1c-e282-4a18-f16c-fa2df08b440a@gmail.com>
 <f6d7eaa0b7e2a3ed6567692616ebc1304500806c.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <f6d7eaa0b7e2a3ed6567692616ebc1304500806c.camel@mediatek.com>
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



On 09/11/2022 06:10, Jason-JH Lin (林睿祥) wrote:
> On Tue, 2022-11-08 at 18:46 +0100, Matthias Brugger wrote:
>> 
>> On 07/11/2022 08:22, Nancy.Lin wrote:
>> > Add vdosys1 mmsys compatible for MT8195 platform.
>> > 
>> > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding
>> > to
>> > 2 different power domains, different clock drivers and different
>> > mediatek-drm drivers.
>> > 
>> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > ---
>> >   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4
>> > +++-
>> >   1 file changed, 3 insertions(+), 1 deletion(-)
>> > 
>> > diff --git
>> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>> > l
>> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>> > l
>> > index 0711f1834fbd..aaabe2196185 100644
>> > ---
>> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>> > l
>> > +++
>> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>> > l
>> > @@ -48,7 +48,9 @@ properties:
>> >             - const: syscon
>> >   
>> >         - items:
>> > -          - const: mediatek,mt8195-vdosys0
>> > +          - enum:
>> > +              - mediatek,mt8195-vdosys0
>> > +              - mediatek,mt8195-vdosys1
>> >             - const: mediatek,mt8195-mmsys
>> >             - const: syscon
>> >   
>> 
>> I think we had that several times already:
>> 
> https://lore.kernel.org/all/6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org/
>> 
>> We will something like this, but please check that this does not give
>> any 
>> errors/warnings:
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml 
>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> index eb451bec23d3d..8e9c4f4d7c389 100644
>> ---
>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> +++
>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> @@ -32,13 +32,22 @@ properties:
>>                 - mediatek,mt8183-mmsys
>>                 - mediatek,mt8186-mmsys
>>                 - mediatek,mt8192-mmsys
>> -              - mediatek,mt8195-mmsys
>>                 - mediatek,mt8365-mmsys
>>             - const: syscon
>>         - items:
>>             - const: mediatek,mt7623-mmsys
>>             - const: mediatek,mt2701-mmsys
>>             - const: syscon
>> +      - items:
>> +          - const: mediatek,mt8195-vdosys0
>> +          - const: syscon
>> +      - items:
>> +          - const: mediatek,mt8195-vdosys1
>> +          - const: syscon
>> +      - items:
>> +          - const: mediatek,mt8195-mmsys
>> +          - const: syscon
>> +      deprecated: true
>> 
>>     reg:
>>       maxItems: 1
> 
> Hi Matthias,
> 
> As the vdosys0 previous reviewed patch:
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220927152704.12018-2-jason-jh.lin@mediatek.com/
> Should I modify the vdosys0 items format like your example?
> 
> Or should vdosys1 add items format like vdosys0's previous patch?
>      - items:
>          - const: mediatek,mt8195-vdosys1
>          - const: mediatek,mt8195-mmsys
>          - const: syscon
> 

No, vdosys1 must not have mediatek,mt8195-mmsys fallback.

Regards,
Matthias

> Regards,
> Jason-JH.Lin
> 
> 
> 
> ************* MEDIATEK Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
