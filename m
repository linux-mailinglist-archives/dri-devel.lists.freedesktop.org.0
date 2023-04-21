Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C109E6EAF72
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 18:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB0910E265;
	Fri, 21 Apr 2023 16:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 909F010E265
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 16:45:43 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-956ff2399b1so242971166b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 09:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682095541; x=1684687541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vnmiQ74ckbmCHzXsPF3khRNGWST2xYm7Uu52Oav4tVM=;
 b=bhlmxaKOXCCVEKNTkJGozcV/ndNqekoqUUD7wxypm14K6Ajrke8cV04HxxIrorS9y2
 owzU36YCZwD/rXEpGtDG9HXbPX3xEV4vLVpphDBJ5lOFg7rMNCmYIDVAHwGnhCVS/09V
 pwE7ocXB7vCj6zInIT2Cnaj1dSDiOdjkuQWTXhDi5zn5ALEuLy16bu3e7XBr5nhej5lG
 P4jNoB+jn8TSq+uUR6z5FF3vd0xt6CZRIMz08Y/88DyKtgHtJooTUT6Udm4qCjltuHc4
 Ta9/SwC7vn8Rxqw4IzlKD7O+WO92WPp6iWN+CnioiHesps9l8sAcrJ2gxYzrkdsAyvtU
 iu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095541; x=1684687541;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vnmiQ74ckbmCHzXsPF3khRNGWST2xYm7Uu52Oav4tVM=;
 b=PJmAk50D/SinDREwz+lnuaNtqfyhtW1X1KKR+ZqvG57NvsIM5WXt0KQ7o82H4ReoRr
 guypKXggx6HJqferwymYFbq8/CmqdIfDihZtcaAbJlhfaWAHsyS2DXZMwOsdnhjeCQ2I
 fuJKKBwi0/6nACLHvFrtXWKgAnb9Fj7l4CdYxWDJ/mptN2r5XLHGnLqT4LklJfmckNxH
 Y+EqpJ+9wYy2ONcfaEsxUsn5EAQw6KVyIk+Fent1L0cGBvU+FHv6LMGvvduNG/hBfzbL
 VT9Y+f8bqijv0Ia+tYNosI4s6Nij3oY60CMHIt7sEfACqkgn/NgWYdOHAqsdzIGioDth
 jLvw==
X-Gm-Message-State: AAQBX9fIJ0mQsvJjaBY77Y97sMvDS1EXklIcvUkTQetDyzqGCDV0dZHm
 jbBE+shhQJNsHwL0xQ45NyPA+A==
X-Google-Smtp-Source: AKy350a/T3bzp7xAMZP7/4+Ww9RoW1CuKYiHrcjkbeEKNilScolbMPJ2NDBvrevmBgyuxzGRAdY0DA==
X-Received: by 2002:a17:907:2da7:b0:94e:d7b0:64d4 with SMTP id
 gt39-20020a1709072da700b0094ed7b064d4mr3220771ejc.47.1682095541531; 
 Fri, 21 Apr 2023 09:45:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883?
 ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a170906361b00b0094e1026bc66sm2295111ejb.140.2023.04.21.09.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 09:45:41 -0700 (PDT)
Message-ID: <184f0a80-34bc-5ebf-58bb-82a310eb91f6@linaro.org>
Date: Fri, 21 Apr 2023 18:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RESEND v2 1/2] dt-bindings: display: simple: add support
 for InnoLux G070ACE-L01
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20230201-innolux-g070ace-v2-0-2371e251dd40@skidata.com>
 <20230201-innolux-g070ace-v2-1-2371e251dd40@skidata.com>
 <CAD=FV=XJCtqep+92h3gLfs4o2TwvL4MORjc9ydTSpZiZ0dsR0w@mail.gmail.com>
 <fb93e95f-181f-917d-9216-a81dec1a2959@linaro.org>
 <CAD=FV=Vs8UEfBZ56fYb3i1cmFbCSPrbgaedXB4+UvDTOyhzCzw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=Vs8UEfBZ56fYb3i1cmFbCSPrbgaedXB4+UvDTOyhzCzw@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, richard.leitner@linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Richard Leitner <richard.leitner@skidata.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 18:37, Doug Anderson wrote:
> Hi,
> 
> On Fri, Apr 21, 2023 at 9:26 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 21/04/2023 18:15, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Mon, Mar 13, 2023 at 12:51 AM <richard.leitner@linux.dev> wrote:
>>>>
>>>> From: Richard Leitner <richard.leitner@skidata.com>
>>>>
>>>> Add Innolux G070ACE-L01 7" WVGA (800x480) TFT LCD panel compatible
>>>> string.
>>>>
>>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>>>
>>> nit: as I understand it, ordering of tags is usually supposed to be
>>> chronological. You signed off on this patch before Krzysztof acked it,
>>> so the SoB should be above. I'll fix that when applying.
>>
>> Some people agree with this... but b4 disagrees, so I would say the
>> tools should implement the right process and right decisions. We should
>> not be correcting the tools' output, unless the tools are not correct -
>> then fix the tools.
> 
> Ah, interesting. I checked and as far as I could tell Richard had
> manually added the tag when sending v2, so I didn't assume it as a
> tool-added tag. I'm happy to let "b4" be the canonical thing that says
> what the order should be.
> 
> OK, so I just tried this and I'm confused. I ran:
> 
> b4 am -P_ 20230201-innolux-g070ace-v2-2-2371e251dd40@skidata.com
> 
> ...and when I check the patch that b4 spits out my "Reviewed-by" tag
> is _after_ the "Signed-off-by" tag, just like I asked for.
> 
> Just in case Acked-by was somehow different than Reviewed-by, I went
> back to the original version where you added the Acked-by:
> 
>  b4 am -P_ 20221118075856.401373-1-richard.leitner@linux.dev
> 
> ...and, again, it matches the order that I thought was right. In other
> words, the patch file generated says:
> 
>> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

We talk about `b4 trailers`, because the tag is applied by the
submitter, not by the maintainer.

> 
> Did I get something wrong in the above?

Your `b4 am` will of course put the tag later, because it is you who
applies the tag.

Best regards,
Krzysztof

