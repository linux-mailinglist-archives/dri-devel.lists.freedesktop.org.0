Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03643616ABA
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 18:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BBD10E0C9;
	Wed,  2 Nov 2022 17:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3EC10E0C9
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 17:29:22 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 l42-20020a9d1b2d000000b0066c6366fbc3so4068380otl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 10:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEpRB2dhc51/gCDHhrS4K+eUaEu05u03r4bcPUfjBNY=;
 b=uCOrOUfQzLosX+aQUWB9EcwfeL4B1JzP4WI6g2SLvejaFkCoIrYuBQ4xW9e+IqSsCS
 BZXhmWpoWsmw9hrzWJgZiU8VYdIjnobz98zKFAkTHNCn4cja4HuHTjVSOAaSbIZNA551
 M0E7jEAUhqtUSI9uRKwfGTsLBhOqRGZnzTg0LtiQIj/b0CesTn2SGZT7evWGyXuerXGw
 D6giYmH/L3Ba6Z5GGifkE0KI3w2CtLxi4NeJrZUe6diGpvbE7pPfVMSGLYtvanrm6VNP
 xreI3W1rSutc24vIVa+neOVrJv2R4zFhzWJzfvyRbnDlNogbVJo5xbHJq8iLAoCS0WND
 GYWA==
X-Gm-Message-State: ACrzQf3kMuYKZkBtOtlX1LgNBi70+0hFYnmYpeo55rUe2ykl0HK7m7oS
 z1cFe37iyUE+jVKISKaUNw==
X-Google-Smtp-Source: AMsMyM70U1ELYK0+O7pqLeORhCvc6X7y6ep05YXLtd19VAaeHVJOLJpBotoWzAb5C71Jea3ggzrG6Q==
X-Received: by 2002:a05:6830:6203:b0:65c:39a9:4007 with SMTP id
 cd3-20020a056830620300b0065c39a94007mr12686538otb.92.1667410161329; 
 Wed, 02 Nov 2022 10:29:21 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bl8-20020a056808308800b0035028730c90sm4724159oib.1.2022.11.02.10.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:29:20 -0700 (PDT)
Received: (nullmailer pid 4192956 invoked by uid 1000);
 Wed, 02 Nov 2022 17:29:22 -0000
Date: Wed, 2 Nov 2022 12:29:22 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: qcom-wled: Add PMI8950
 compatible
Message-ID: <166741016166.4192902.16881683175503637947.robh@kernel.org>
References: <20221101161801.1058969-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101161801.1058969-1-luca@z3ntu.xyz>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 01 Nov 2022 17:17:59 +0100, Luca Weiss wrote:
> Document the compatible for the wled block found in PMI8950.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes since v2:
> * New patch
> 
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
