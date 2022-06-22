Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390E554DF3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 16:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D262112097;
	Wed, 22 Jun 2022 14:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5FF10E8BD
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 14:53:01 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id mf9so14474427ejb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WW5wittx5G93z/fxX3hONBF5yJMDD5Vb20PalWKZlwc=;
 b=xiUiZvtEaIGVWNVnRez41O11BTnN0TVeMjGeQ0uv6FabQWCJRCJtQTfjt70Y/C7sGH
 03hotucc5vivg7+i/Jn6k3NGEaSMS/8Nh78Cyy0VkUMAevQvBN7u4SOqq3hXmKdPy/y9
 zKEiK2xP1wYN671Vx8hD79QuVf3iZ99jqSXJIpXuzk3yBoTCzPGic/xwp3RSoLnhY6rP
 dEsDJ2fwU2UCzTv6141pm0oHxKP3MtR+jJO/SaQkcmyz1t0XhrEg6Q/QirYF92WUznhC
 XN1GmdctLZ31oInQNAoAQ03yiUjEl8kpchtnFeLKeIORdYSSb6CV4jDzO3aHulQeqshR
 KuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WW5wittx5G93z/fxX3hONBF5yJMDD5Vb20PalWKZlwc=;
 b=ckLLjL2YqrhV9EDuAt2uuG/MqggF0GcgOs94xjzjsSH1gvDhAn1Ysf2J1Oq1X6IKUV
 N4SuQZ6SdfhmoG2aUdiPfZcqfm7Oy2vj1LPUG6OENqFOfZwKxwragaZOGspJWMuGJBGa
 hbnTRpRU+HcgbRWLrvpH/5DR4nfg5HBCW+FXkccs+6mTdjvsBNeIv2YcX35BYQfKgF5J
 JSZxuxtnyAUFo+pYR71bXw+Ys/QuODeGIE+KC9EGXtOsyo7kUPkECWQCzAQ47qqhXjAA
 qhdq/OFLLBsPVvcr4IKIV1oQZNyK+wIXwAmnhXlvz7M6GiXrYibzuki4pcFkyj0spVV6
 gtyw==
X-Gm-Message-State: AJIora/xHcYi993qHvyo+eiCfKO0O9qv18FHRGOiYaQAj0DsJ9JoKZVx
 xHe9pEfG3VzbKjWlyE5WG5nwiw==
X-Google-Smtp-Source: AGRyM1uPgeut0y2Ppo8Aai3MFPCopfyBrMHoOygiSUD3tz424dyZas7hNdeqizhQQiP1tfLjUAuEPA==
X-Received: by 2002:a17:907:1b0c:b0:6fe:25bf:b3e5 with SMTP id
 mp12-20020a1709071b0c00b006fe25bfb3e5mr3427169ejc.689.1655909579662; 
 Wed, 22 Jun 2022 07:52:59 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906308600b006fec63e564bsm9485417ejv.30.2022.06.22.07.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:52:59 -0700 (PDT)
Message-ID: <9bb9cd5b-2a92-4fbd-c83a-a4a5e4e1d90e@linaro.org>
Date: Wed, 22 Jun 2022 16:52:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 3/7] dt-bindings: usb: Add Type-C switch binding
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <20220615172129.1314056-4-pmalani@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220615172129.1314056-4-pmalani@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, swboyd@chromium.org,
 Pin-Yen Lin <treapking@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/06/2022 19:20, Prashant Malani wrote:
> Introduce a binding which represents a component that can control the
> routing of USB Type-C data lines as well as address data line
> orientation (based on CC lines' orientation).
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
