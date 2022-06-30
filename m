Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA856226A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 20:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001EA10ED9F;
	Thu, 30 Jun 2022 18:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4857610ED9F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 18:59:06 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id sb34so40683656ejc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 11:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4q21ggPdTyeit3h5q0XZaKPf1WMDwmb/exUUFTFO1os=;
 b=Ccf9ma6E9UX3J8fQ3Ht1TewapbhoTIZR4BXkKnLYPdFBaJSW1ynJ06icNRRKF2dxgZ
 lmfzm/0MWjIQ3xSjA40Swp0uVjdLdgCD2dhndiGiqWgSzc/BAJVvrN7p3OQuERLKtPIh
 t6rsj9gCvH/MMYwXnTVDXeBHLzFx0TM2LuefZoLVEcUJFEXxKTbYAZmcnno65TyJXtbb
 /zwcoLzD0V+MgwherN5IypUJazdEa77OLJa+rvgClPgSCRh0XmwTx3ZyeQ7p15b/hWOy
 eHAyiQTf9rmC/VTYkVAdQfY2KO46iT07qTdPGJlYeueYwi2EwXfo5xg3hdNVft8pmB9Y
 Zh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4q21ggPdTyeit3h5q0XZaKPf1WMDwmb/exUUFTFO1os=;
 b=Yt1kL0uTyJNzPFA0ZRBqX+2VLdIH5stFaF+jIONPMjEPuhe4aKMpwMn3eKReNYgpYL
 XbdD8XFD5hl/bUkDbPUp6l5CQtudfY15Q31veoElFc79+aZV4nIi8Nc7BO2NWBxErr8v
 bct8xShcAuMMNtWv9jFif8K1z8bKb8clYnT7VHyGUp2l1WdRZb29sYOtpKfr9+QzELc9
 vIEuTa7jO19/3jES0MR7i9DABZvO2FikO9wD7dlCca7Pabd+lLDU+Qn4h9mzUtxNodMs
 VrpAjLLWloFr4sOaA4+no0AXDR4ZR5MOV8ZOHOgGJUnX0xTwJ8qYok+E3PtNr8Px0B8O
 T3Ug==
X-Gm-Message-State: AJIora8pxsUo7kP681RXhvGDFO5CsFsv2g4EvKzwyvj+g39xbca14t63
 6ed7jOZEtH5wMFGmLEIle5dJ/A==
X-Google-Smtp-Source: AGRyM1uE64dtWtGZMbzHs6M6S5fYap/RCGHDO9B10pekIM+vwNcayRqVPfpHlkOeAiMbW59r9xjd2g==
X-Received: by 2002:a17:907:948a:b0:726:f3d7:c7d6 with SMTP id
 dm10-20020a170907948a00b00726f3d7c7d6mr10467497ejc.2.1656615545858; 
 Thu, 30 Jun 2022 11:59:05 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 i13-20020a1709061e4d00b006fef51aa566sm9414673ejj.2.2022.06.30.11.59.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 11:59:04 -0700 (PDT)
Message-ID: <ff3caa0b-a248-d5ee-a3e5-c49fc41b8cff@linaro.org>
Date: Thu, 30 Jun 2022 20:59:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/7] dt-bindings: msm: dsi: Fix phy-name binding
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-2-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> The driver doesn't care about the name of the phy in DTS. msm8916 has since
> 2016 named the phy "dsi-phy" with later SoCs taking the name "dsi".
> 
> There's no reason to have a constraint on the name here, simply to have a
> name. Remove the redundant const in favour of maxItems: 1.

For single entry the names field could be as well removed. But if it is
there, let's make it specific, not generic. Therefore instead add
allOf:if:then restricting it per variants.

Best regards,
Krzysztof
