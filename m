Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42075606226
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 15:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC6310F16D;
	Thu, 20 Oct 2022 13:47:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EFE10F16D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 13:47:36 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id i12so13538497qvs.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 06:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gfoaDvIHm+IYqFg1zUd7jQMQTXkElPWTcNgvljK5gOA=;
 b=XZcIHHMg1dkhD0LgOjy1iBpji/JY8TckG64n7iRLwcdhSP6mWFjkTQpve5ROlxVx9R
 z3ZyWgENFeFwmcNNpiAZ1rDDt9xTH7+vV+O6iybz68MR5IU+kPJ431BoBfarnd5CmCIh
 m75Z0BY/2hll7ZDl3b3Bh4n4rSxv4lRaLGtPBpTKUb2qvOdPzfWtblSDpGZaD0W4Mw2M
 z9gRZjdMTSNCJwui0gk4X6RdyStQm2ePgb6Lcfcv6MYPB6W0n8bmVA/ntbrAweNTsex0
 cXFzrKKM9b/6jfDMmxw59mkngKBzHtv3T/Z3jv2aNVReNceJF2AAp2FYF6w8Xx0cCk/X
 1YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gfoaDvIHm+IYqFg1zUd7jQMQTXkElPWTcNgvljK5gOA=;
 b=RXdcmk+E7C2m/+flogieX8OIZW3lnlKd8hqTN5jWw3jJavh36SPlyQ//CRIbd+XkjJ
 4qlauTH1GwKXYyAjfQ1lL7/tYSkocURDw9ONe+VBc0/UsNxZcnRi09E+w5ZJNGvIUfUQ
 gAlqGLsf6sKJx4b2iZ3kDjcGjEeX18EU43HJwks18hzHUUfh+vcFQJ3RPrptfzaRILuM
 2L1FZjbTNu05PJOuJsUjI5jR+SPfw+iWV6/jHhcrfPDawxtgHUNqZUi71xPpQAtT4oYL
 To+C+DimcNx3XstfmMb05O8kKWu35HivcZIXF4QI9tu5jLEffXn4LbS3wWFqfwQPgHrm
 6HFw==
X-Gm-Message-State: ACrzQf1oAn3yisdbOwqlATh93cUSuWgUmR2DzgqGEg7lPuDa1Cq94uax
 6SLxRLwjUSKi8J3+UAq/A/enIQ==
X-Google-Smtp-Source: AMsMyM5sOIvVtFC130aKpuulDJA8HBv+YuVvL3HoTNZOe6dhDsx7M2SccxP4xCX5/6e1vhY5fApY1w==
X-Received: by 2002:a05:6214:c68:b0:4b2:31c5:78bc with SMTP id
 t8-20020a0562140c6800b004b231c578bcmr11137347qvj.45.1666273656040; 
 Thu, 20 Oct 2022 06:47:36 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net.
 [72.83.177.149]) by smtp.gmail.com with ESMTPSA id
 gb11-20020a05622a598b00b00398d83256ddsm6107388qtb.31.2022.10.20.06.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 06:47:35 -0700 (PDT)
Message-ID: <883c9095-f304-1b8c-2f4f-a2151d8e1d1b@linaro.org>
Date: Thu, 20 Oct 2022 09:47:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2,1/2] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com
References: <1666266353-16670-1-git-send-email-xinlei.lee@mediatek.com>
 <1666266353-16670-2-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1666266353-16670-2-git-send-email-xinlei.lee@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/10/2022 07:45, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> For MT8188, the vdosys0 only supports 1T1P mode while the vdosys0 supports 2T1P mode in MT8195.
> 
> So we need to add dt-binding documentation of dpi for MediaTek MT8188 SoC.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

