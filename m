Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B56F0A7B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1244F10E090;
	Thu, 27 Apr 2023 17:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE0210E090
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 17:03:56 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-6a5dd070aa1so3422345a34.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 10:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682615036; x=1685207036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wC46zsAOw/V5ESWPegZro4CMY5VowLiZF8XH9gcabPY=;
 b=Y8ciL8O4k9NfQz72vtIdXCJsLkqHLRU/vR4ZlwfnTlH+AmSNQFdk+r/usvBucO19TW
 lSqdQIiW8OGHmZKtx8B3aa1B0nW8tIccQ55YW5SLcXQdhgvOPZdHqOvgMG69w8Eb/rn8
 w4Zcxpe/fp+w1f4wKDrMBWtnn2Nw++2yCmDyt0+eCfIS2kaKF+inDGj7ngQU2EgCnasj
 eWOU5uPOwl9mV3wphZ7IO42/7mOm4Jo6XhOR7hS7TeDolIAxEEX3YEkllNzK78kW0G/t
 Pk5EF+VtCsRPA+DClKEf6fj0DT/5wRBRbJAC4riqPq3TeQj+w4hw05IwYSutHUF+9Rmb
 YtOg==
X-Gm-Message-State: AC+VfDyNsn8sRRPqos+DgWgzmFNQosaBrHxYU6YLfraLAmMMtp4wsYpf
 Z4AhuC4PLwtKywTHfpxtYw==
X-Google-Smtp-Source: ACHHUZ5RUnCi8AoKLltmFAY7/AL0bgmWCcoCXJSj7xdDUJSp8Fc/76bbUfA6n5sACT4lLkIB91rAcg==
X-Received: by 2002:a05:6830:1d62:b0:6a5:dd6c:1daa with SMTP id
 l2-20020a0568301d6200b006a5dd6c1daamr1015264oti.22.1682615035560; 
 Thu, 27 Apr 2023 10:03:55 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d17-20020a056830045100b006a63283a9e5sm7205176otc.75.2023.04.27.10.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:03:54 -0700 (PDT)
Received: (nullmailer pid 3172049 invoked by uid 1000);
 Thu, 27 Apr 2023 17:03:54 -0000
Date: Thu, 27 Apr 2023 12:03:54 -0500
From: Rob Herring <robh@kernel.org>
To: Justin Chen <justinpopo6@gmail.com>
Subject: Re: [PATCH v2 net-next 1/6] dt-bindings: net: brcm,unimac-mdio: Add
 asp-v2.0
Message-ID: <20230427170354.GA3163369-robh@kernel.org>
References: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
 <1682535272-32249-2-git-send-email-justinpopo6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1682535272-32249-2-git-send-email-justinpopo6@gmail.com>
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch,
 linux@armlinux.org.uk, netdev@vger.kernel.org, richardcochran@gmail.com,
 hkallweit1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, justin.chen@broadcom.com, edumazet@google.com,
 opendmb@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, christian.koenig@amd.com,
 pabeni@redhat.com, sumit.semwal@linaro.org, davem@davemloft.net,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 11:54:27AM -0700, Justin Chen wrote:
> The ASP 2.0 Ethernet controller uses a brcm unimac.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> index 0be426ee1e44..6684810fcbf0 100644
> --- a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> +++ b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
> @@ -22,6 +22,8 @@ properties:
>        - brcm,genet-mdio-v3
>        - brcm,genet-mdio-v4
>        - brcm,genet-mdio-v5
> +      - brcm,asp-v2.0-mdio
> +      - brcm,asp-v2.1-mdio

How many SoCs does each of these correspond to? SoC specific compatibles 
are preferred to version numbers (because few vendors are disciplined 
at versioning and also not changing versions with every Soc). 

>        - brcm,unimac-mdio
>  
>    reg:
> -- 
> 2.7.4
> 
