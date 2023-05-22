Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146E70C506
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 20:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BEB710E1AA;
	Mon, 22 May 2023 18:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED9C10E1AA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 18:17:58 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f603ff9c02so11175195e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod.ie; s=google; t=1684779476; x=1687371476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q7P+DBBi+Cpf56qPunfuWd9Z9zfzbOV/OEECAbDuPS8=;
 b=Ee4VTVCP4jy7R9WxX+j5tVAlpJhGMDBcv3CT1skxCdyzrPx62chpLscHjIMwYGAJB3
 wrwqvGxMJxaiPopuXUboolfovc0wzwa9hIbBATh/w0XiFbWT80cyGwNdtz6kHMUgwrB3
 UCxYnUsrsMHDDh7w2nU0SViJ6AqMwoDptIpKL4tlqOt7dFHCT91TMgbe9pVqmWWbAnkR
 zPxUf05MRoTgoiuF29tk1G25LCaUWGTqIDPoqCNywD9HjyvnJGwxzczqodsYkEx9iETM
 NZXvj0d+vAjDz+Uun5iNHtViO4mQimTebuoca2g+rr+7YXdIm3nkCKke7or0VHuxRgxx
 7JfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684779476; x=1687371476;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q7P+DBBi+Cpf56qPunfuWd9Z9zfzbOV/OEECAbDuPS8=;
 b=SoWAsyj76eCzgm5Vnhy8FGtU8Z8cyGdsD/m8mI9F9qEHMIS2JJ7CCBqZfrXYaUCxbZ
 T/4n7AX0yRqpApCSp9tLmz9dnUXFNvOXPaDf2KP9XbWK65qrLsrSQHCvrBYOplz4NqL3
 Jio+4ygzPvAOPwoehL4X2u9/9DVMVVnF6EzMjRri34IZ4SnlpUq5VCkcPTbAUNv6EsVU
 rGjo7+n1ppNfLOJhg3EpJcwYzJCnIlKifxOa8uQ8P1GxCMgvss7JbmwXDQBRfgFNcCnU
 YjQkGRDh0PD3V+PdJpuPelOqLkroYngL1L29Pe4Dt8TPNXs9ZJwdU3CP5YeVFCAF0g/3
 k1Sw==
X-Gm-Message-State: AC+VfDytF0HWtFg+EkGPvoizxUb+cwzw+800u9aL6eCfmmQPWJ0RMnBG
 95PKN6h5xtS/nZzN9XwYrDgSvg==
X-Google-Smtp-Source: ACHHUZ5b3fcaOykV0SCUoXoLnAw7b7jZX2zv8R6gkhGbukcjSahYAvAxwwOdzoAPXg6RYwfEJecFKw==
X-Received: by 2002:adf:e409:0:b0:2d5:39d:514f with SMTP id
 g9-20020adfe409000000b002d5039d514fmr9646442wrm.65.1684779476291; 
 Mon, 22 May 2023 11:17:56 -0700 (PDT)
Received: from [192.168.2.9] ([51.37.135.152])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b00304adbeeabbsm8470252wro.99.2023.05.22.11.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 11:17:55 -0700 (PDT)
Message-ID: <2be2af5e-d117-fa2c-f960-e7f0c3ca3d0b@conchuod.ie>
Date: Mon, 22 May 2023 19:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next v3 1/6] dt-bindings: net: brcm,unimac-mdio: Add
 asp-v2.0
Content-Language: en-US
To: Justin Chen <justin.chen@broadcom.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com
References: <1684531184-14009-1-git-send-email-justin.chen@broadcom.com>
 <1684531184-14009-2-git-send-email-justin.chen@broadcom.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <1684531184-14009-2-git-send-email-justin.chen@broadcom.com>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 florian.fainelli@broadcom.com, christian.koenig@amd.com,
 richardcochran@gmail.com, linux@armlinux.org.uk, sumit.semwal@linaro.org,
 edumazet@google.com, robh+dt@kernel.org, justinpopo6@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 02:19:39PM -0700, Justin Chen wrote:
 > The ASP 2.0 Ethernet controller uses a brcm unimac.
 >
 > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
 > Signed-off-by: Justin Chen <justin.chen@broadcom.com>
 > ---
 >  Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 2 ++
 >  1 file changed, 2 insertions(+)
 >
 > diff --git 
a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml 
b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
 > index 0be426ee1e44..6684810fcbf0 100644
 > --- a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
 > +++ b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
 > @@ -22,6 +22,8 @@ properties:
 >        - brcm,genet-mdio-v3
 >        - brcm,genet-mdio-v4
 >        - brcm,genet-mdio-v5
 > +      - brcm,asp-v2.0-mdio
 > +      - brcm,asp-v2.1-mdio
 >        - brcm,unimac-mdio


 From V(N-1), there was some discussion between Rob & Florian:
 > > How many SoCs does each of these correspond to? SoC specific 
compatibles
 > > are preferred to version numbers (because few vendors are disciplined
 > > at versioning and also not changing versions with every Soc).
 >
 > So far there is a 1:1 mapping between the number of versions and the
 > number of SoCs, and the older SoC uses v2.0, while the newer one uses 
v2.1.

Rob's not around right now, but I don't really get why if there is a 1:1
mapping you don't just name these things after the SoCs?

Also, my mailer **refused** to let me reply to you because of something
to do with a garbage S/MIME signature? Dunno wtf is happening there.

Cheers,
Conor.
