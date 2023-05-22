Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9254570C526
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 20:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2A310E1F5;
	Mon, 22 May 2023 18:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE7310E1F5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 18:27:13 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9d1so63511805e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 11:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod.ie; s=google; t=1684780031; x=1687372031;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dde97R89Md6V2pF7Jo7GpR1OiPPYejdIL3uT2QHQik8=;
 b=PlSJAoHfBEl5jgtH2ajA5/RPOKBr6SWbVwyY33Ofq+2dix5Xbn1+G3fUhDAkQjJY7B
 NPf6s+tS5cKZyjn4MtChpInwyLvL1/73oMQQKQVaqlVaDPwmR1Z2J0B9L0PSpa3nY9K/
 0we1yo8L6/teOeoIraoaq0+6wV2jSoWZOORDFtjiGFmjsJIOukZsz3YDRJWLotL1QPIN
 Bd0ivnggzwl883J9bAigYwI3Dz/hnBuSBKuKuC0JF9ctZxGWadSR5KZ0e/PgVlwJnW4X
 XzxTfmgYVQuyucIHj9cu1DzyYdxkYi0IL7vzjn1fSAYYZi472WmSAhOMnmkBQJi+L6R+
 rvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684780031; x=1687372031;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dde97R89Md6V2pF7Jo7GpR1OiPPYejdIL3uT2QHQik8=;
 b=YqlSFO1UR+MNV4m2fgF35nw5Si3m/pMFbvMdo2YDUH3rREm/tJ7DPigfqJOzFFuSuU
 GY5ueEnPNdy6B5CCcsGhIytjNFDswUYAA1555Uv5dxXfNU8BK90kNBxiR4Krp8g5EflS
 6wjxiRIVodKVE0hvscCSg9uVwJGfdec1f+2rYuhPuOAU5K+1b2HHRvukQFBubsGOI11H
 spGzhBzRNh+OIvq+5cDejNyRdkWVdO4pjw2wH7o70Cy5kpwrWfoKPKgNvvcB3hJFC0jw
 7f9CazhDPG6x2k1cd/pmU3EGCATLoQ6hmVN1SAOCUnBKE3BFVN6WmMS0gYb5m/xQSwEy
 rLtw==
X-Gm-Message-State: AC+VfDyVa0tFG+TcgYgtVKGXJ+WVZRN1eraTQS876gXwYWej00R9peTp
 rTdm28FWUuAmb+LGrzPuo8JZSekkpBbbuy5IWWw=
X-Google-Smtp-Source: ACHHUZ6kWFfckNngKg+tH40+Yss9WOVsPO4kAvHw/TA+yOcWG6pouHhkoTCnCXnIaluKbsSv8gGSCg==
X-Received: by 2002:a1c:7c01:0:b0:3f5:db0f:4a74 with SMTP id
 x1-20020a1c7c01000000b003f5db0f4a74mr8447054wmc.21.1684780031389; 
 Mon, 22 May 2023 11:27:11 -0700 (PDT)
Received: from [192.168.2.9] ([51.37.135.152])
 by smtp.gmail.com with ESMTPSA id
 o9-20020adfeac9000000b0030633152664sm8573132wrn.87.2023.05.22.11.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 11:27:10 -0700 (PDT)
Message-ID: <d56f205c-dae8-a191-f2af-fed6bea060ad@conchuod.ie>
Date: Mon, 22 May 2023 19:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next v3 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Content-Language: en-US
To: Justin Chen <justin.chen@broadcom.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com
References: <1684531184-14009-1-git-send-email-justin.chen@broadcom.com>
 <1684531184-14009-3-git-send-email-justin.chen@broadcom.com>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <1684531184-14009-3-git-send-email-justin.chen@broadcom.com>
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

On Fri, May 19, 2023 at 02:19:40PM -0700, Justin Chen wrote:
 > From: Florian Fainelli <florian.fainelli@broadcom.com>
 >
 > Add a binding document for the Broadcom ASP 2.0 Ethernet controller.
 >
 > Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
 > Signed-off-by: Justin Chen <justin.chen@broadcom.com>
 > ---

Same deal here, usual mailer is refusing to reply cos of:
Problem signature from: 
1.2.840.113549.1.9.1=#6A757374696E2E6368656E4062726F6164636F6D2E636F6D,CN=Justin 
Chen,O=Broadcom Inc.,L=Bangalore,ST=Karnataka,C=IN
                    aka: <justin.chen@broadcom.com>
                created: Fri 19 May 2023 10:19:57 PM IST
                expires: Wed 10 Sep 2025 01:39:50 PM IST

 > v3
 >         - Minor formatting issues
 >         - Change channel prop to brcm,channel for vendor specific format
 >         - Removed redundant v2.0 from compat string
 >         - Fix ranges field
 >
 > v2
 >         - Minor formatting issues
 >
 >  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     | 145 
+++++++++++++++++++++
 >  1 file changed, 145 insertions(+)
 >  create mode 100644 
Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
 >
 > diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml 
b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
 > new file mode 100644
 > index 000000000000..a9fed957e1d6
 > --- /dev/null
 > +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
 > @@ -0,0 +1,145 @@
 > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 > +%YAML 1.2
 > +---
 > +$id: http://devicetree.org/schemas/net/brcm,asp-v2.0.yaml#
 > +$schema: http://devicetree.org/meta-schemas/core.yaml#
 > +
 > +title: Broadcom ASP 2.0 Ethernet controller
 > +
 > +maintainers:
 > +  - Justin Chen <justin.chen@broadcom.com>
 > +  - Florian Fainelli <florian.fainelli@broadcom.com>
 > +
 > +description: Broadcom Ethernet controller first introduced with 72165
 > +
 > +properties:
 > +  '#address-cells':
 > +    const: 1
 > +  '#size-cells':
 > +    const: 1
 > +
 > +  compatible:
 > +    enum:
 > +      - brcm,asp-v2.0
 > +      - brcm,bcm72165-asp
 > +      - brcm,asp-v2.1
 > +      - brcm,bcm74165-asp

One of Rob's questions on V(N-1) that seems to have been ignored/only
partly implemented:
 > You have 1 SoC per version, so what's the point of versions? If you have
 > more coming, then fine, but I'd expect it to be something like this:
 >
 > compatible = "brcm,bcm74165-asp-v2.1", "brcm,asp-v2.1";

You did drop the -v2.1 that he requested from the SoC compatible, but I
amn't sure why the above was not implemented (at least there's no
explanation in the previous thread's version, nor in the changelog
here...)

Cheers,
Conor
