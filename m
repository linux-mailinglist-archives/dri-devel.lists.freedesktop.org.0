Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454736776CF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 09:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A80610E325;
	Mon, 23 Jan 2023 08:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4483810E325
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:53:37 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso4166305wmb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 00:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MVf3AvujnaoCN2yeM/Xk1YpwQO0fOjy9SVB0LBEsLLc=;
 b=bQxrDKysn8Jf+5WIaotfiFymNB92cJIdwwBzt79u/JcE88nzW+nasQgxbyFDMwsjx0
 AUbK7OZnD5nW/AzPAC3tsazhFP0e3SHL0N2lEOSr4ew9LBAUI5ICsKESdtuEklDP1W0n
 /SEvfblneK85I0dnEnLSslp9mB2rF89B7+abjlM+1v5zoDWAZ0+wHaNezjnjfSLGauPU
 WEqnwBlZZwDUsZzBjw1mQTTON8hvB19cWqE/JL/OH8RDT+JUBu/KfC0Hn9C4yPP8eA6l
 OJ2ArZCvw7F46bQpFLYs9hquTCI0fOYkjyL8tbm0MyPw/jEX3owOVl1N9LHUk4TFTPk8
 8PJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MVf3AvujnaoCN2yeM/Xk1YpwQO0fOjy9SVB0LBEsLLc=;
 b=y7sVEm7Q6yqBEMTva3/Crg5z67tuFamz25a6PSWfV0qjz77mLCRUYYQKDn+YxaQ2P5
 +2r4azCOMKQ98PMGr76ROMgTP73Vghmr3k2cKiuQYiCBcW+7YAA4xlyLbsNpsZjNhYzc
 F9KCyL9greDYInb811XtIJ5mmA3/iVNN4Yo1M3Ntj125OjM0ckGx7MdeN08HNCrYKpK6
 +3qorPivE8hbo6M+vxL3iUm2L3ywe1o9caY0rCahtQgrMaxCf+T27KgGsCXwmPH4CP4H
 jGCt6IorlHMQ9Cpo7irsbHOju/pVL6fPB/PzNgetub2vUJGdLFqkd8rzvQApbnZiuCB4
 g+Sw==
X-Gm-Message-State: AFqh2kq2FmrKDRoVlRotOzLPn/L3J4VXKru79zen5fSYJ9DjIKEsLzlv
 ccfbgVaG3QLRxQErf4skSPXK5A==
X-Google-Smtp-Source: AMrXdXuvYhhXjbTCUdMrmc8i/3yBrY8fe6Vzlfg4CABMqtm9bGnF6nkCh6c242EgEpS7IeKE2atK8w==
X-Received: by 2002:a05:600c:3d14:b0:3da:f793:fff6 with SMTP id
 bh20-20020a05600c3d1400b003daf793fff6mr23044032wmb.16.1674464015780; 
 Mon, 23 Jan 2023 00:53:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a1c770d000000b003db0ee277b2sm10091201wmi.5.2023.01.23.00.53.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 00:53:35 -0800 (PST)
Message-ID: <bd5dd7b9-7704-ec40-2b42-8e3dfdddb7fd@linaro.org>
Date: Mon, 23 Jan 2023 09:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/2] dt-bindings: lcdif: Add i.MX93 LCDIF support
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230123072358.1060670-1-victor.liu@nxp.com>
 <20230123072358.1060670-2-victor.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123072358.1060670-2-victor.liu@nxp.com>
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 08:23, Liu Ying wrote:
> There is one LCDIF embedded in i.MX93 SoC to connect with
> MIPI DSI controller through LCDIF cross line pattern(controlled
> by mediamix blk-ctrl) or connect with LVDS display bridge(LDB)
> directly or connect with a parallel display through parallel
> display format(also controlled by mediamix blk-ctrl).  i.MX93
> LCDIF IP is essentially the same to i.MX8MP LCDIF IP.  Add device
> tree binding for i.MX93 LCDIF.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

