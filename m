Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D0562E3C8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8349C10E663;
	Thu, 17 Nov 2022 18:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9681410E1B4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:08:01 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g7so4122048lfv.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ABvTsAaVT8uEdnB1wnBUP0233+pp89h9PKGzrpb1Gbw=;
 b=AFMMqZv66bqrJYFluWXzBw2qjrraX1EIjlIoZPqAZCgh4SUhVcd7ivqS6P5k/fcGHM
 xD/AyeELz57hPpT3juyz2QK8p6MCB/n1ZILs3fC/4RAxaRxUZ/r7n2fBAV4Cf9vvbQjX
 sNI6OR9Srz4amp8Q4sp4QaozyOHCj84Y6EXlGWJLb9mRogNyjnCOeDSmJek9fsYyFEvh
 KuG28+f2CZe2f+puIPGq3cZ0q4F+GMZzWIY0lSZ2rdoQ5TOPIJxH7GBjjZgOqzKYAnSa
 zT0fauHWNnrtxMYKR2aUgWI9AE7CUPGfg9HqQ6XWQLs195iUgSE/L675oNWHEBrONrjN
 lLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ABvTsAaVT8uEdnB1wnBUP0233+pp89h9PKGzrpb1Gbw=;
 b=YVt8NuA2U/cXP6s73GGWjAJ7v9KVTeGp0VOfHvB3cIiMHxP030kwwxSToKt16wSp4A
 qYRQha/OTQ3WBTPHFrQrzdZty8kUKFNtyoqwh9/8RphLnoiv6Hj9M3JQl+jhrGYjGmF2
 aoP/CaQ6wzENpDp3LzTn3vGutx0uOEyw9pJl4BtaKZXuUhcm2/T+mNP6uslLL+hjzcA/
 N4dsFvrHLzQapz8+DuuYRgleFTfAPJSUeJ0s296JSDe2iBi76R+o06VOB+MPkG6Ge+tI
 sVB/i+o4CUhcFU3CbxajEwyY3cASwUhWx4JTPWLmM/zKl1FNoKaJoy6Fm+gZwY9iGAFD
 pTEA==
X-Gm-Message-State: ANoB5pnxwak8RJZRDjXgP6a6wXGchCoQRjISYI9LFwAGp+LPrspzSb5i
 /xmENdo69Z5TRcxgpiEAL8DRbQ==
X-Google-Smtp-Source: AA0mqf6JCWdyhVYcx1o2AIifLbE4I5mtYp/W5qyGJV7q9ik8WmJ6EvWzInclK0E2rdzF+YWlaIPRNg==
X-Received: by 2002:a05:6512:a83:b0:4aa:f944:f7ec with SMTP id
 m3-20020a0565120a8300b004aaf944f7ecmr1234490lfu.467.1668708479905; 
 Thu, 17 Nov 2022 10:07:59 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i29-20020a196d1d000000b004a459799bc3sm254028lfc.283.2022.11.17.10.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 10:07:59 -0800 (PST)
Message-ID: <6f6386d0-4489-9e6e-355c-beb223c96684@linaro.org>
Date: Thu, 17 Nov 2022 19:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 2/8] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Add r8a779g0
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117122547.809644-3-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/11/2022 13:25, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Extend the Renesas DSI display bindings to support the r8a779g0 V4H.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

