Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F07D6615F7
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 15:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D8B10E1F1;
	Sun,  8 Jan 2023 14:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225F410E1F3
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 14:56:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bn26so5795614wrb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jan 2023 06:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=faUR7WXI3JJAlq5Fj/7y4nlra1VV+37QFyTpQC1/6Os=;
 b=UhMMC5LDsUxyd0s+U1tiT9D2xjSpDzkdVdvSkLIr4Nyf04n0IWW5JprfKC0gxkLFvF
 NnyOUGVPxWGC2OAqsoXhifV+cGpbPvdnpuaIyRIpPw0mb1c5hDIfsK7A8Pvd/A4ErLfA
 EmVn3SZhrBNAAtmzlMdYbz9eurNx/Lg8XPuXjbigIAigh9cd19NvIfQPCDj25KaMOnfu
 F1Ujoco3nSOEgTVmI5ZTfF/8tordADV1/A7i13oog3WRXMQPyHXX+LxeDCxniqCMNLoB
 0+7+mMamyDfmzgII9sLYWIxzJ1uaeaEBHJMp67wNb5TpseFlaPp+/KhKTyWwKMuGuHXL
 r25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=faUR7WXI3JJAlq5Fj/7y4nlra1VV+37QFyTpQC1/6Os=;
 b=NQDuIs1JWALX3DNyWkreO3igh6fSf48Rv48V6s648PD4POZOpNhx5XYoOQNh8aQSDD
 e//D3x8LojP+EqIFd2296dcWeeYdR6o153vmQfcLseO5N1zWymJC3YfaccTdtTnyN3P5
 MtxlmB47RFXUbWyshGfwYIpdHCgJ3pTP4PUV6e9yxiHB3QKgbOIRPDPegIazFPO9yAFX
 IJB+3enkL3euDglIXc7UeYB9+OH7lQ2aArVbvCZbKY+kuGf48JvKAGoDzvXNaUPbcDzG
 KMB5c4shhArvBTZQEBnQ6hcgfZF8MDUkMMUNdp0jqkIwv9/fu1Y9kieNskvsfnPSYgY+
 +PZw==
X-Gm-Message-State: AFqh2koZz1OIBnydJwXNFgt+qCFPEfRoiz3L/KoHxUYEcFg1Z4iP3l3r
 YczWzZVzp/fO7GSGH8jJdiPWWA==
X-Google-Smtp-Source: AMrXdXvypNaFaV4VApj/5n5B4KrLo6cyzJa/11iv0JfanR3VXSlrcyN4o5PjaNplkSLduvwAAY0GyA==
X-Received: by 2002:a05:6000:10f:b0:286:ad19:731f with SMTP id
 o15-20020a056000010f00b00286ad19731fmr24871172wrx.19.1673189775638; 
 Sun, 08 Jan 2023 06:56:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 v13-20020a5d678d000000b002bbe8686d6fsm2046811wru.117.2023.01.08.06.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 06:56:15 -0800 (PST)
Message-ID: <3f7e1afa-d445-453d-12fb-7c87b04c8756@linaro.org>
Date: Sun, 8 Jan 2023 15:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v8 4/9] dt-bindings: display: bridge: anx7625: Add
 mode-switch support
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
References: <20230107102231.23682-1-treapking@chromium.org>
 <20230107102231.23682-5-treapking@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230107102231.23682-5-treapking@chromium.org>
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
Cc: Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 devicetree@vger.kernel.org, Allen Chen <allen.chen@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, linux-acpi@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/01/2023 11:22, Pin-yen Lin wrote:
> Analogix 7625 can be used in systems to switch the DP traffic between
> two downstreams, which can be USB Type-C DisplayPort alternate mode
> lane or regular DisplayPort output ports.
> 
> Update the binding to accommodate this usage by introducing a
> data-lanes and a mode-switch property on endpoints.
> 
> Also include the link to the product brief in the bindings.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

