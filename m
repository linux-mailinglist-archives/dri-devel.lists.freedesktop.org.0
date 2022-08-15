Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AB9592B5B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E245B0593;
	Mon, 15 Aug 2022 10:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0ADA7CEE
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:10:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id e27so3813246wra.11
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=b0BG6zqNuGD+/4ZeY3ZglvZEqAlCRmK7KBUEnJVhtZY=;
 b=x0cUGTaM7DOQAD+YM58GNbMGMtq1gCmQlmnmftzyBI29oKOvOdUlbgecFPFJ1BgZ2U
 tbjw+j+BNQVl5617D4uN38Xk/t/ozPQhcj0zP9x5zHbOMYz42hh6Y3uIIKlA1DIGv29l
 Zz9pRvJgziux1lNhfbSJCWACFx+5s1VuYbQpW2rlkcGeNAgJjmxfj6HcX6PPlGPCR3i+
 A54aV6J+phJTrjfuRVi5lDVuAFoJ0fxT74VtsF2UkDfld1p1oeL12QlyZUNVeQsme2Wq
 4mxzFzFw5aifvA0PRsOep8QRrYACpu7wzjecti+yimKmReAvpqzMnBQmO6/2lCno20F1
 ev2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=b0BG6zqNuGD+/4ZeY3ZglvZEqAlCRmK7KBUEnJVhtZY=;
 b=nObdwhOn44oNlDmr+yrBSkpAl5ial1ibmyBfXlPDXDpJh4iJHqnklzbc+pRneFp/QC
 oUBQ58LPs2wc7rZDPD1phoy+3Vj/F5fbmRSi6dXVUDkuwzi83NTwR+QrkKHA4XZjTrls
 cCWZyUj/0/cesCYy+noBdEyNdRX6a+9iOVEmiex+tsBupkGBWwVNMrbYhHMoE7e7kLvz
 1GK94qNqNG+1w3Px3ZFrTKOaO1f+ZG5b58LLs8QJpOHgrRNJ7iu6j7JcYTGfbkxPkVoN
 9na66XRb7Sz2gRqDOCk/ivGdV3hZcohIOg9+srAsibB5dB0AhE8n6sPFDmrN3roO2ic2
 l/eA==
X-Gm-Message-State: ACgBeo09f3CsVA1ezUerClsUqfN2Q2P4cJEhNEF0lDDO4KmoTq/IoDmw
 prVvLnURD/B9c8KPWzvuxdoBDg==
X-Google-Smtp-Source: AA6agR5hAfQyfMOqfODbwifOJptkZd3sU12ygFhz9rZ+qe8JD6bOzrF7GiV/dIjhd/OOaU2EJnS8Bw==
X-Received: by 2002:adf:fa81:0:b0:224:f260:2523 with SMTP id
 h1-20020adffa81000000b00224f2602523mr5305703wrr.26.1660558206570; 
 Mon, 15 Aug 2022 03:10:06 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 w5-20020adfee45000000b0020e6ce4dabdsm6693090wro.103.2022.08.15.03.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 03:10:06 -0700 (PDT)
Date: Mon, 15 Aug 2022 11:10:03 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [RESEND PATCH v8 05/12] dt-bindings: backlight: Add MediaTek
 MT6370 backlight
Message-ID: <20220815101003.ilgbrxhsqk53i7u3@maple.lan>
References: <20220815090125.27705-1-peterwu.pub@gmail.com>
 <20220815090125.27705-6-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815090125.27705-6-peterwu.pub@gmail.com>
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
 linux-iio@vger.kernel.org, broonie@kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org, deller@gmx.de, lee@kernel.org,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 mazziesaccount@gmail.com, szunichen@gmail.com, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 sre@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 15, 2022 at 05:01:18PM +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
>
> Add MT6370 backlight binding documentation.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
