Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30B55A152C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 17:04:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5816710E5E2;
	Thu, 25 Aug 2022 15:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09A2B10E5E9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 15:04:35 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id ay12so10397589wmb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=FjzfQgvp9Pt54PbuI+NrL+4+IIsBmjAlu5P//Rcqxr8=;
 b=W4RDP8KJqP48Z9qNlOeWmiPifiTsPzHAXkdP8Vn/obNsP5WU6TNCdwSnvxRiLesm6I
 uDrF/FAzWwGpvJJ4z6O31VFowRZY0oet/yZmZi0Qd1G8OPLQXyb6u6Yz+aZky7HWaxGa
 lwEyF666GErBM0pHd6T3diDRC+HSpHE4e0UJUkuQn2Udi9FubkZGO4dgeHrRieK5X7B5
 1ziTsch3E9h9GSIsP5Bjd9ivSDzeBkXv6Rq6AleqOc8I2EwwyBiXK4njSyfazrMm/qzi
 Y14lAYpYQraYdnrgaEYKX39AhQfaPGHe59qiCVbd74sld9MkkqeXZjjtJUk/776np0Ea
 /URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=FjzfQgvp9Pt54PbuI+NrL+4+IIsBmjAlu5P//Rcqxr8=;
 b=VGpM41RUy8MFHmmSKecBtYSopjGmPDnn4uCUR3RtVYU3mP5QAjW845nFs0wYi55szc
 IdX5Ic6aDB+p3DWC/fEN5MUnomNrgUitI+/7blweEZSiDtOn0iqLAibbyGYM8qwvNK7d
 zUiVJEDU3XOrKzPHglt7bC068kuWywAD1tRoGSdA1UbwC9m1fddGXyQhjI/7FOYhPWad
 5eqVGmI0dYtR89xbmK8Lt0KWBexv7HnbMRUCfiU+Wy+zKNsIrwo4Yglys6n2LDrVPjad
 lT2DlUdp72cSB5SgbwQXfqkXXcx4QrSrg7muuqpR9O6o9oXMYhk7vMeB5DrgJ8KD6NDo
 gdwg==
X-Gm-Message-State: ACgBeo3BMWnBGg9tiaaXYGiWSNf8tx6Xj8y1ZHvKX0X3GQUV8oJcGuHt
 apGxs7SzlXOVzKMu7ihYKd8=
X-Google-Smtp-Source: AA6agR6g4f+/nbB5a2H60OA7LKWWU9LDI4eXIcuSltTLoDctj9q1XvjqBYoYfQIjU7evtlSeCAWh7g==
X-Received: by 2002:a05:600c:1c9a:b0:3a6:1c85:7a0c with SMTP id
 k26-20020a05600c1c9a00b003a61c857a0cmr2539978wms.155.1661439873552; 
 Thu, 25 Aug 2022 08:04:33 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm19831396wrv.66.2022.08.25.08.04.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 08:04:32 -0700 (PDT)
Message-ID: <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
Date: Thu, 25 Aug 2022 17:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 xinlei.lee@mediatek.com
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
 <20220823201758.ffbgb5t5odoicgir@notapiano>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220823201758.ffbgb5t5odoicgir@notapiano>
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
Cc: chunkuang.hu@kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/08/2022 22:17, Nícolas F. R. A. Prado wrote:
> On Tue, Aug 23, 2022 at 02:38:22PM +0800, xinlei.lee@mediatek.com wrote:
>> From: Xinlei Lee <xinlei.lee@mediatek.com>
>>
>> Add mmsys function to manipulate dpi output format configuration for MT8186.
>>
>> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Patch looks fine, I'll wait for v4 as there is still some discussion on the DRM 
part. Please try to fix the threading problem you had in sending this series.

Thanks,
Matthias
