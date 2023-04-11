Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7176DD25D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 08:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BBAA10E4B8;
	Tue, 11 Apr 2023 06:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE28E10E4B8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 06:06:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id ga37so17876408ejc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Apr 2023 23:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681193203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7RuGSEWbtWr4eU2VNJtutFDl4BvimrBoTwWCP7bAhk0=;
 b=LKFCpFiVWPt1C2PyKHhOkH7cOWiD688f1yUkghusUy5JIgo952wJp2u6v0Dy1KNj6F
 DyMahs4tzWfc02e3FBUKs+EQ9z0rD9ihCWBIiITUF5s954cQ+hjndy3F9Wo/D87sYtvk
 IYgxmj/rncEgx2Cg2zsLtkFzP+dsqqRj6YJYJIr+H39wybcaAsmwpJ2Hacdcwgup6NgP
 eu4GeHj8t8/cA+pr024H1r4By/bmdHfoHDGHL+DkPTTRtYyz7YLdfISkswf1AUEmwSGs
 kLucvjWI+fyBCdcrPv5aJRvvlqdv4VqioJUSE1nT0sHLu6vekvENhZjaoB+QCHULSSlH
 vZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681193203;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7RuGSEWbtWr4eU2VNJtutFDl4BvimrBoTwWCP7bAhk0=;
 b=Ezxoa0nB/aWh4TXyjfMNJfna/bsrc7IifA4CyWg7aN6PnvfWLLO4optu79rTAahZZt
 V1ODrD7/DgKyZ3hB7P7OoNMT/64/Lix+xvS2j6sm2ykTRQamqsCU45mZ0Y/7Rnwj5GiX
 gHWiWgDwkpbOfcI/IsH++d43oez37tAT8BbZhoTgw2leNxEFBxukQ19EdmW/CBSZlpau
 Ggi8Ob3qZN6VbNcTM20Ormb8ZJjF8T9mofnQekfMd5/D9xnEgLe8pGcm3ZEI8eTBxzxS
 C4jKVOFmCd5IhTwuEcz31PMhdD1FgRxaZFAIuilrWiNRsTuE/ruRcV+CFzQ1aU45Lx6V
 LkgA==
X-Gm-Message-State: AAQBX9fbaGsRUQjA1oPscqeZHXVosYS+d2gDeOP8zfZ35iFS9eeOf+hM
 T016lyCOuLyJCHQ3mFOMfeAhhw==
X-Google-Smtp-Source: AKy350aeV2/Y/zgxEs+xA/fMLd5DYGuG+h/tpM4592P5SpvtiXVajRdKLOY/98oVgqi14AxHuKtM2g==
X-Received: by 2002:a17:907:31cd:b0:94a:5d7e:d455 with SMTP id
 xf13-20020a17090731cd00b0094a5d7ed455mr7143926ejb.34.1681193202820; 
 Mon, 10 Apr 2023 23:06:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61?
 ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a170906364e00b0094a82a236cbsm1860935ejb.129.2023.04.10.23.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Apr 2023 23:06:42 -0700 (PDT)
Message-ID: <6ba8bbcf-0d72-4bb9-a014-85e9f3e22cdb@linaro.org>
Date: Tue, 11 Apr 2023 08:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: Add no-hpd property
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230405142440.191939-1-j-choudhary@ti.com>
 <20230405142440.191939-2-j-choudhary@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230405142440.191939-2-j-choudhary@ti.com>
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org, r-ravikumar@ti.com, rfoss@kernel.org, a-bhatia1@ti.com,
 javierm@redhat.com, jernej.skrabec@gmail.com, sjakhade@cadence.com,
 tzimmermann@suse.de, jonas@kwiboo.se, jani.nikula@intel.com,
 robh+dt@kernel.org, neil.armstrong@linaro.org, yamonkar@cadence.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/04/2023 16:24, Jayesh Choudhary wrote:
> From: Rahul T R <r-ravikumar@ti.com>
> 
> The mhdp bridge can work without its HPD pin hooked up to the connector,
> but the current bridge driver throws an error when hpd line is not
> connected to the connector. For such cases, we need an indication for
> no-hpd, using which we can bypass the hpd detection and instead use the
> auxiliary channels connected to the DP connector to confirm the
> connection.
> So add no-hpd property to the bindings, to disable hpd when not
> connected or unusable.

Your subject prefixes miss device specific part. You do not add no-hpd
to all bridges.

It's also not drm. It is a display directory.

> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../devicetree/bindings/display/bridge/cdns,mhdp8546.yaml   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> index c2b369456e4e..3a6c6d837593 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8546.yaml
> @@ -57,6 +57,12 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  cdns,no-hpd:

No improvements - use existing no-hpd name.



Best regards,
Krzysztof

