Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C28539E54
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 09:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02C010EEB8;
	Wed,  1 Jun 2022 07:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7B2112DFD
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 07:36:18 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id rq11so1954156ejc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0q3wt29aNZiv6jXypasXo5xqD+y2Dp/M8UIl5yGQ+OU=;
 b=EqmxQDYflsUcRFsBVf/C3LdLhNCWjjkgpV6d3FyTWbkOsrcS2A39iklfOv0rM7Dcsr
 ZRdPNxhAVzy9A0PBcWP+r849b7PsmV7Lfnj0rig+AgIFCXYaGYBX0R5lcfCIDptvbdBE
 Tp0zFqG7kZqXGeKPL8/WPYye5vZacc2NLr+yGZw8m+H/DUXabvU81+dQFiAyaa0k2K15
 b665tJpSN/mwuqMv6l+GAfNzMOytdKbvDfmKDBhef3zm7x4zrQdfzY1AqYEUFZFD82Vq
 zQrKkqgdLe7tfAeCmaW6ERzoNTgcj74viKMPs0J34io1jsptMuGJT2yN9/wTDSrilBkB
 WhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0q3wt29aNZiv6jXypasXo5xqD+y2Dp/M8UIl5yGQ+OU=;
 b=fyg/X8j/mv+ciMXE85scI6/6EoolEILVb/NwWR5e6kThqaCJXomKf/VTU76DWV9PNI
 nhEKG0ax4Pk8aRarGzhb+6EdamLhD73fl9Bx82RHhm+GDhmb59xrowKwO+i81RCMdeFV
 4+aH+v7jDUEKpSCjsJzHGhQN1LCL9mvpDQQ6slpLWuJYKug57zBVFv21Jb3NlSFeG1cV
 CuhJ55wjnH+e1rqRUPH+UqSBZYltb/vGkeXlIg0OpwDY4xNgSN+RxyJnYl2DJBOCYddr
 FC/wI7Xe/jQYGeioh6ggCZBr3r9Jl6zWs5m5LF93FOGUXZYxME+76VJlBILX1EYue8NR
 oyjw==
X-Gm-Message-State: AOAM5336vuBmsXaPVrlOBUgfS0K/8kiMh3KeOMIhdx+N49045+F5uhPV
 wUtCAS0243khol2v8Bhbs49IEg==
X-Google-Smtp-Source: ABdhPJygn1kSoBskFVxX1NTOvT9WDOZ5vbePTEPzYPwUrOV6DSTk5mMP3EMwBrRPRSlIzj9AM+6EXQ==
X-Received: by 2002:a17:907:7e84:b0:6fe:cded:7d1f with SMTP id
 qb4-20020a1709077e8400b006fecded7d1fmr42958260ejc.35.1654068976668; 
 Wed, 01 Jun 2022 00:36:16 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 o22-20020a170906601600b006fe8b456672sm382548ejj.3.2022.06.01.00.36.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 00:36:16 -0700 (PDT)
Message-ID: <2926e4f5-1322-f1c6-f43a-c4a09f5751de@linaro.org>
Date: Wed, 1 Jun 2022 09:36:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 01/14] dt-bindings: usb: Add Mediatek MT6370 TCPC binding
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-2-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-2-peterwu.pub@gmail.com>
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
 alice_chen@richtek.com, linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2022 13:18, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 TCPC binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>

Please apply my previous comments.


Best regards,
Krzysztof
