Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD976F85F7
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 17:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8612610E628;
	Fri,  5 May 2023 15:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191ED10E628
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 15:37:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso13720455e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683301056; x=1685893056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MMQANphqIg54PwzmueerEA1nz6ede73K9wjbTi5bw3k=;
 b=a3xV0hgeH2+HOW7KQ0n46spF34Mt6cZU8UE6reMTk2Op3pdqgwaIFTbRbmk+e/aQE5
 RYAMOUEy+fGor1eIm/k7tig6rEzQMOVfL+NVK1QXrIVSfsQt571I3B/Zi3VXe1weaVC/
 4eomzoHkj+3Vi/NW1q3m/SEAtqWO3jFWjEISvcnd6qBERWdECqpy2CgdFDUJ+tyIH+2S
 TPs5UtZBwBc/Fnz+SGWOVXs6AsnX8fEaUzPGEI3GH/eyteKctZoFKyigjIjqhB+FSMKh
 k/g9upF9q7vnODKBoVtt7O8XVD8aYy+d5l91r51H/v49ETPGi28RYnTNUroqmb/D0HmJ
 jaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683301056; x=1685893056;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MMQANphqIg54PwzmueerEA1nz6ede73K9wjbTi5bw3k=;
 b=f7ypTXv4Md/yBZ5Vjow8G5Yj/fdt2WkDk9abcAVpeNrJR5hUJsJwe6SQlZkLWflW72
 CsgdO40iKa30Z8hgM2nTGzXbWHlOx1iI/230TPML/nn53CD1JK/s2iIE15N4zVtLrIHG
 /wvMopEd6uElD2lzhB1SREasEvscxkD/kQ+4sua0zidFXrv24vigO0BMxPrdvcmL77D4
 bQDfIEJkjIX9keKRyrMdpo+q4ZNehjiOhL++C9ABtqL2bZTj6LZtZbs8TAV3370LIPWC
 0NAaNQ3T22rizh/fWuSZjGYNccjB+zxIrh+5OPDCLtXKpFYgzv9cjskpjT6VzoZStlHe
 Gt7Q==
X-Gm-Message-State: AC+VfDyxX8ZOz6hUuCrhIEPCbl9QoNnkDbKJodVt0DreY5hRJlb9/CJB
 BwCYp7HAF4r7s1kv1rM3A+4=
X-Google-Smtp-Source: ACHHUZ6YF0JN2q50Mb4Rc5IWpAQlQaY8t82WbF1TW53ociZHjEHxERnMkxklnJoCQ9mt5l5ZwvQpug==
X-Received: by 2002:adf:f2c2:0:b0:306:3be9:6ab with SMTP id
 d2-20020adff2c2000000b003063be906abmr1905923wrp.54.1683301055966; 
 Fri, 05 May 2023 08:37:35 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a5d4bc8000000b0030631f199f9sm2696499wrt.34.2023.05.05.08.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 08:37:34 -0700 (PDT)
Message-ID: <db9c3190-28d8-199f-f4f0-a12524d0451e@gmail.com>
Date: Fri, 5 May 2023 17:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Content-Language: en-US, ca-ES, es-ES
To: Vinod Koul <vkoul@kernel.org>, Tom Rix <trix@redhat.com>
References: <20230414122253.3171524-1-trix@redhat.com>
 <ZFTMPWp8LhwA9uHz@matsya>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ZFTMPWp8LhwA9uHz@matsya>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kishon@kernel.org, chunkuang.hu@kernel.org, granquet@baylibre.com,
 llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nathan@kernel.org,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05/05/2023 11:28, Vinod Koul wrote:
> On 14-04-23, 08:22, Tom Rix wrote:
>> clang reports
>> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>>          if (ret)
>>              ^~~
>> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> 
> I have applied "phy: mediatek: hdmi: mt8195: fix uninitialized variable
> usage in pll_calc"

Thanks Vinod, that was on my list for today as well. I was a bit puzzled because 
you took the patch that added it, but I wasn't sure if you would take the fix. 
How do you want to handle things like this in the future?

Regards,
Matthias
