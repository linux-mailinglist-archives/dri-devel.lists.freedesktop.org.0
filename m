Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74ED254D062
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 19:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2C2112800;
	Wed, 15 Jun 2022 17:51:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13139112800
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 17:51:30 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id gd1so11902357pjb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XGLjS63dUzAW1Zo2zi7t3U1pShICtS96lOWIeEhU5mo=;
 b=lpQYopi0CgQAcKG+v+jImrlkuTJE1F5WMT7t0KYH0fvucudjwtBJJjq6vtnyd3Ec8p
 9pXQkLNI8Oc9J61ZgUslVUtfIMNiyLJ8felTz/mXvGKZUZ3m9+x8ulV6z3UEMExuMSiB
 2NzDllVXpV8Rl7njT/x3rihrMaWf8btUvJ8zcF3TvQzHeCBnnMMBR1Mhdt+RGunBnogV
 aUdQSgsE9RDZAb6azyJgO5ibHmcMJW+85U8gNqfAv5peDiNg6DX/pAa6oha9oTH063+S
 3MdYzebMRwyMlyFaSEuaorfkbp0lLUxjseOk46+6sDQP5R+8882mhkqO0tgNpzIJwUPX
 hnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XGLjS63dUzAW1Zo2zi7t3U1pShICtS96lOWIeEhU5mo=;
 b=FpAudmr5fzvT6shPdFAwiurDUP73ovRCablgfZpqan175RGV9yG/tZsDhWoreEPEWc
 Ydn+M7BmieFEfLCZMKZ5irCp2Ao4LUSlRdpMWbpSTo5VWSC0uXr9kA0+67rS++YjpgS7
 AtZHJVNpbdXPAdQvniMgSvhVLJfAoz2qz5a0DTgv07IPn8Duit69ty3thO9VM/Jxy8vD
 X83X7Ly1wAWzNGGTlNv4m4OzPTCwY9UgLFYKYvwsFNo6Vy5EFS2Tpb8IuihZ+siboUhM
 +PKB9JgUfwp5QQZPm3+I/++hbJjwaIHP0MxCjz/rFttP2Xa1s1s7UYZ0X0stYJAdJTUA
 Zgzw==
X-Gm-Message-State: AJIora8SkE+6rg/kFjfQU5oxfovminM/IZhrECXy8VaqH8sZ1N/eIseb
 ORoFe7jEf49BZwQ3oYkqLvfD7g==
X-Google-Smtp-Source: AGRyM1utGKyiREa4WVXSvBtvrEyoGENTUB491xhdN0Jo6qHBF7XUH5VzUDiIIM4B3tzwCaRcE420qg==
X-Received: by 2002:a17:902:8343:b0:167:8899:2f92 with SMTP id
 z3-20020a170902834300b0016788992f92mr878435pln.117.1655315489664; 
 Wed, 15 Jun 2022 10:51:29 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709026bcc00b00162037fbacdsm9544311plt.187.2022.06.15.10.51.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 10:51:29 -0700 (PDT)
Message-ID: <ff25e7ed-1074-3d90-75c0-d62f03825e3e@linaro.org>
Date: Wed, 15 Jun 2022 10:51:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch
 support
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <20220615172129.1314056-5-pmalani@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220615172129.1314056-5-pmalani@chromium.org>
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

On 15/06/2022 10:20, Prashant Malani wrote:
> Analogix 7625 can be used in systems to switch USB Type-C DisplayPort
> alternate mode lane traffic between 2 Type-C ports.
> 
> Update the binding to accommodate this usage by introducing a switch
> property.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v3:
> - Fix unevaluatedProperties usage.
> - Add additionalProperties to top level "switches" nodes.
> - Make quotes consistent.
> - Add '^..$' to regex.
> (All suggested by Krzysztof Kozlowski)

Looks good to me.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
