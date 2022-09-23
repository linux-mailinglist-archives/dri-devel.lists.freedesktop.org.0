Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B2D5E774F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 11:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8754710E7EF;
	Fri, 23 Sep 2022 09:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8590D10E82B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 09:36:10 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id u18so18871190lfo.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 02:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=xZardqzm0PQ0BwEDikq+bXXk6zHXw5HLd+Zlh682CZg=;
 b=mcu3yMDkzkOqWpb72+eQWf/7D7TbI3EkyYNzG9ZhLxD2RlVGikbCjAXG41pQYzvGW6
 g3p/6Q4L18OpBW3VZmBsmaZ4BHf9hdbfvaRj7yrbo3t9Qh8Lt8Hgedh9hMzLKEgknax4
 KLtz9gxXU3l75IlMDkEydAf/SH6ZC2vmqJuJovbwPRTz2I3Ifc1/9Q6t9aV7j7bFiWNn
 YOl4l5l1GbLrP83PSgY/aAq2KiJFlPmIi0Dx70Md/O015nZOQihRtmaA9uQvZfTnIJWO
 eQ/mxgB12wVVeSh8nZpwfI4XOqWKQGXgiQPP01f+GOujqeoHv/92xmFcLrITbM6xe/dh
 TLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=xZardqzm0PQ0BwEDikq+bXXk6zHXw5HLd+Zlh682CZg=;
 b=tL8ZK4gGcwlllzMgc0xOVhmS8oz3Jtq3rJwgOli2MdotTFTtUgOxIonFnGlbTsXdzB
 LwojbWfl85wg9dCZRglm2QQZLozPGHrSoxMFf8nS27IEKPDS3++cnfzBGNK40gegCqLB
 y5Q6K88vuADxW/WxpvNkNEuq1a3ntI4NHVJjxOyJsMFVgmrUS3G7fTTH6vs9JuoOMoY6
 Cx+MxsTcpRIJHv9ifewZO6qMN1df//OL7+v9w/PumM2JcmZsRQeVR3qQLdWLYlc//Saw
 yWBjuBksLRw09AIrjHiMbWpvDuREnK1B2rQ2j2NtCGXVkxBKoNyMdm57EB4L9SS2o8DZ
 k/PQ==
X-Gm-Message-State: ACrzQf31h52CWQ03iA4faeJwRdiytwqSbcPxouFUsnOuDORZi0IiaNK8
 yilA3ssUwuIWlvltfL3Fpb+Jhw==
X-Google-Smtp-Source: AMsMyM4grVVkVaVmdwZUlkTdjVCx4Ne2FBaiAhvziX1K9e4iP+nkA6l/z1NWFoG9xk905NGzqnDc9Q==
X-Received: by 2002:a05:6512:3ca2:b0:497:9db7:ec10 with SMTP id
 h34-20020a0565123ca200b004979db7ec10mr3134937lfv.350.1663925768687; 
 Fri, 23 Sep 2022 02:36:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 v25-20020a2e9259000000b0026c15d60ad1sm1281456ljg.132.2022.09.23.02.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Sep 2022 02:36:08 -0700 (PDT)
Message-ID: <69111370-d536-eb67-b528-f61a3b81de82@linaro.org>
Date: Fri, 23 Sep 2022 11:36:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] dt-bindings: display: mediatek: dsi: Add compatible for
 MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, rex-bc.chen@mediatek.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
References: <1663912657-28883-1-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1663912657-28883-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/09/2022 07:57, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dpi for MediaTek MT8188 SoC.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

