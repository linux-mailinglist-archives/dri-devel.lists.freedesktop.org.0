Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F4F58D93D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 15:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E687CD5A11;
	Tue,  9 Aug 2022 13:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742CD9743E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 13:14:19 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso5904616wmq.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=YbYq10AH7DFyPthSKrztZodwwushB5t/2Y6IpnigFO4=;
 b=Z7YPedDXnLSgBPd9OMsLK57MpNaQ+Vcno0m+BuDTk72qpO7Aul44JeaGBXTzylLRf6
 nLlLx0AAopKc9yoMFkj+Q54hadriFobDH/c4+X0sfC9AHuazANM0RuLRgl7aIbp7cuqZ
 GuqgXlEc4WGquTmSK1cBzJuaCX2BX2TNLtrn0hY9FZo6tj0eSfsrMRlv0hloKxBdqAxe
 HzL7oWPVQvc9jYePBqrd3jAmn1hhsql6nZA98xDcQZHIrlEoh2Q1hNjtZQezpUCmpo7M
 blu04r+nOiSHk4MsGO4DyfiRnWD0AV/92wFDYDkXqtnn2T/ooJhtO/5AZzhil2k4tdEF
 DqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=YbYq10AH7DFyPthSKrztZodwwushB5t/2Y6IpnigFO4=;
 b=Y1ck0KVgQ6iic9L34DqB2YLnr0i4nK+HBYvUm5JaHMVUdNZut2L51Uu+QQdJqh5+o1
 6X+noA5pK2b/qNtc0065ZJqkruetsh+OWD2PW40ky+SSmvmN4t8cLc6fnj0pSVQrW/v+
 v2V3hY2853xa2aHWFEn3oqfYnmyqcUzoM93y7OrMkeaMiYyMN35fGW8Fy/DUVQsoDYLV
 vWQAoYnAdsmXl0dxtWLbtgoJjgeEh+Sv5qx69w6PDszOb1jA6tYltykXPU39rHT7K2Pv
 A2kNpfUTWVFSsBgqV/XnN7FUSy91bqi6Jv0FaEbFepj5+o3yqCqEOQ4gMQXzF5q0JTPS
 HK0A==
X-Gm-Message-State: ACgBeo2lwztTaQF9wy+vX2WGddDju3JKAs+LGf9dhvuRrsp/pAoeB9i1
 qBgDM6FepupH9K8jV4lzI5kQcA==
X-Google-Smtp-Source: AA6agR4/lo60i+WLJVLsgEtDWzhjrmVdxnP64JGuV05zhH+S6LHtffAoI85nP9uDE8F/o6OlDzl8sg==
X-Received: by 2002:a7b:c848:0:b0:3a5:41f6:4d37 with SMTP id
 c8-20020a7bc848000000b003a541f64d37mr5721352wml.23.1660050857317; 
 Tue, 09 Aug 2022 06:14:17 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 n2-20020a05600c4f8200b003a1980d55c4sm22561795wmq.47.2022.08.09.06.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 06:14:16 -0700 (PDT)
Date: Tue, 9 Aug 2022 14:14:14 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v7 06/13] dt-bindings: mfd: Add MediaTek MT6370
Message-ID: <YvJdpq0MWNPQZw5c@google.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-7-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805070610.3516-7-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 Lee Jones <lee@kernel.org>, robh+dt@kernel.org, andy.shevchenko@gmail.com,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, szunichen@gmail.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, chiaen_wu@richtek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 Aug 2022, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add MediaTek MT6370 binding documentation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
>  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
>  2 files changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h

Applied, thanks.

-- 
DEPRECATED: Please use lee@kernel.org
