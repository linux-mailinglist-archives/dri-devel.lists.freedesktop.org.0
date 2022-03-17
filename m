Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 431264DC011
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 08:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256C910EB98;
	Thu, 17 Mar 2022 07:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C3C10EB98
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 07:20:12 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CEA1B3F32D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 07:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647501609;
 bh=RoUeA1wG24c/Crhww+WUj9NHBvCMvLhd7U/GxxINFtE=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=fVVobd4gCRNPihPuzCiu25oChceSnklt3VejRxxD3I6gBzDO+mN2mr26nh1ag+K5b
 /iCCKdLGiEvlF7EINnhG5T7FmoAN5+NMlgOFEgVQxGWjdcEZ1Nb+3Vdlvk+KRLObBk
 ugHb3keaDyHjMuA8mZxZCC10+uJGrRxktSduPXOqTyNBQ1UKfgaEG7+tfDx20dIkDX
 J2dkSLUwkVlNXwv30xmcBioruy8uaP0LerednA+vBuwXAdoLgDdu8ihVolHG6xQswX
 RICLjEoTbFSyA4Z87y1tdJ5vQKcn07kzlxRbX02GPi8sykvcR7+03G0/sbi0tvEMdF
 lB4Z5d2SxCk6A==
Received: by mail-wm1-f71.google.com with SMTP id
 o10-20020a1c4d0a000000b0038c6e5fcbaeso1506267wmh.9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 00:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RoUeA1wG24c/Crhww+WUj9NHBvCMvLhd7U/GxxINFtE=;
 b=FIAcnGuabEd9Ye8e/BxKt6q0J61z3AiMmqCJpPi/ulIaEiYmur0/bPq6o/jLJdRc8T
 0hDcuHmeD8V1P+oI4iOVkAHx/TJxa8CyIC/uq5yW6C+nlnzPLRk/3KYMjY6GVEYnXT/y
 GtFoALiYF99mVqnSxLfrbweg3BKFm5o4jY0djm1kBNAC7bn6oABeh2r5mwRAmKxIWnAj
 jwaVmGxGJtP7BgCEkABQo/GdbpqP9VAnnpJxNnF7lBwMK8RMTroL40PBMUmHaEVaBBm+
 8QLI+uTgDB2Q0ZEUmK4exnTXuh54/9do2wRrCDXjR0nRzoyS1LuIOYy+MxEYovqzIOsM
 yOtA==
X-Gm-Message-State: AOAM531puGCPwHFfcJpqJmSWTXgjAWE0xtg9sdHzqsKIU7W6ZGVpLPwD
 IQTBzxwUR5SxZx9oKbohTXDBN5vXTKI3TL/sK80AeSpPVkSHIH8AxjrrYA4atWFcPOrSNSPKwuW
 EQea5eQirxVn+lkESMJ8H2pm8ucjP8sF0w9iRM6VbOky8tA==
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id
 b18-20020a5d5512000000b001ef5f0829fbmr2757882wrv.653.1647501609567; 
 Thu, 17 Mar 2022 00:20:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHbCVoeUsHyZ8wNSet5MR49AAhKrHaURXBuhyPImzMsALzcMVNd+fUfq5fTlEsXD2dGW/xxQ==
X-Received: by 2002:a5d:5512:0:b0:1ef:5f08:29fb with SMTP id
 b18-20020a5d5512000000b001ef5f0829fbmr2757858wrv.653.1647501609413; 
 Thu, 17 Mar 2022 00:20:09 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.googlemail.com with ESMTPSA id
 p4-20020a05600c358400b00389f61bce7csm5108647wmq.32.2022.03.17.00.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 00:20:08 -0700 (PDT)
Message-ID: <e4c85b2d-8546-1740-9f83-d4cf985949d1@canonical.com>
Date: Thu, 17 Mar 2022 08:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V9 1/5] dt-bindings: display: mediatek: add aal binding
 for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org
References: <20220317051831.7107-1-rex-bc.chen@mediatek.com>
 <20220317051831.7107-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220317051831.7107-2-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 yongqiang.niu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 fparent@baylibre.com, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/03/2022 06:18, Rex-BC Chen wrote:
> Add aal binding for MT8183.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml   | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
