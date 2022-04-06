Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D264F61FF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 16:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2770110E2B9;
	Wed,  6 Apr 2022 14:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736E410E2B9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 14:46:07 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id p15so4748340ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 07:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xDSVxXfePuzg5H9akSGpqrt3EQAyFHRkATzzbCmNu4Q=;
 b=oc7fYa5LKG8ufWeEnZcEwfzJ5lpIHj9hFl2tWq7M6SBzlHKjff+4zqdYGau4afQ26F
 VJFIPUlzbtvqtStHIl7vAupTJduZuMrIsJj5WFVX4t80pT+CgEQTb4aFQB4K0LZQK+oT
 AQ4TlPPJLxK6pu+alTOr5MjlbijZ3I9iNnIEibjRn8AF9McXK56gvy6w4igQZbA7SlKN
 WQGYLfPg2A9mHkoqM/+Mg770Lid0eOx9+FqqS2uTdj1D1np0eBXZ4RZnxHuQMLlBt+v+
 Zp2doRxa3UpevU/5tcKXAvy0PamPFu6QEyUhrfRlC5l4/RwCKGfFiHr/9/pIs9/+WxTD
 9QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xDSVxXfePuzg5H9akSGpqrt3EQAyFHRkATzzbCmNu4Q=;
 b=wZ3KKQ1MDJvfiOB3qymHiN5Mnj4rsjLI8PUiiKwRqsPSz6nOpF1hQjN9TWlXKH/C+P
 zLirqKJ/twpe/0qzUx/cuIQGw0LRKu2JX4Jl1uJyvfJUma3ydiquvxRKV77FW+BCpNT0
 3MJTLiY/+B0ppRvZgZTg+ua1OhSQ+rFpjOLbTWPNte7j3HdFTDo2zfY/9aI8StzVoGSr
 Y15ag809far6ChbQKA0YS0E18ok2MgOUvkHXz8HPOur/AyFu0vLcPxsurUUsEXuxljMz
 /dUzYpb9FSBlm/Bu01pr26PlUe2pGTUI4BpUkVJ3FXv4MSrhQ3uMoz26gHLjYmkSExqm
 Gkig==
X-Gm-Message-State: AOAM5321cgbk5oisRvtjox6sEwfdVt9mxJ4IvbwOPsa1deHhf4zylMhY
 B2PEEGAW9/1zKZHrPwet+8MtJQ==
X-Google-Smtp-Source: ABdhPJw4gXYqy583VI6CGvVJfLyOfsByKyXlBbza+dyYyC5ApRWjpBZCtEODLtt59+/ES2G6ddhfaQ==
X-Received: by 2002:a17:906:7945:b0:6e0:19:5f7c with SMTP id
 l5-20020a170906794500b006e000195f7cmr8956964ejo.458.1649256366005; 
 Wed, 06 Apr 2022 07:46:06 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 lb4-20020a170907784400b006e0d13f65e5sm6606684ejc.167.2022.04.06.07.46.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:46:05 -0700 (PDT)
Message-ID: <e7face88-5069-c560-ad2b-a0a658fb8cef@linaro.org>
Date: Wed, 6 Apr 2022 16:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8192
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-4-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220406094654.29722-4-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/04/2022 11:46, Rex-BC Chen wrote:
> The driver data for MT8192 is the same with MT8183. Therefore, we
> correct it.

Driver data is Linux implementation specific so does not really matter
for bindings. Probably you want to say here that devices are fully
compatible? If so, please rephrase it. Also remove the wording "correct
it" in subject and here because there is no mistake here (at least you
did not describe it) and otherwise AUTOSEL might pick it up...

Best regards,
Krzysztof
