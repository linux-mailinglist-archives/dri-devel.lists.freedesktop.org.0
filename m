Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABACE75930B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 12:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C2D10E45F;
	Wed, 19 Jul 2023 10:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9230B10E45F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:29:51 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-991c786369cso868417866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689762588; x=1692354588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WYKICS704kD9PtU92fkBUyVsHU48WqaWA+RZLKCNWGM=;
 b=FQfy99c1KCMaGRIetKy7jxLRMdZK3v9rsQvfu9ZmIQUGdWny/tkmd63iehIcAlQc2g
 G6ClhS+AgS6CT8bZKuCU21l9hA1xXIZUin4LCggf3t6aKs6pnr+T/Z75njoFg2U2wm5b
 fUuiaI5AI+BXk+4cniuO2vKE7rcQYcI5NeOPrA+3YVh+lQS3//9ASi8SvSIP76bE0rGV
 XHLW0AvOiPJ/lzJYYYC14GQ5MLXQ60y/4VybeCJa+xq1h6rbXafJHQnr+yX2HMY+5f0P
 jJgmOmaS90BwBmo3p4k6XFsCPr7x1u05D2oDz7QYbs1PmmpQQORsEm26XyG2bYfjvGsn
 4MOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689762588; x=1692354588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WYKICS704kD9PtU92fkBUyVsHU48WqaWA+RZLKCNWGM=;
 b=A0wVm4bhODpD65bq0WbWH/cb5vrrzy4lnANuSie5/Qn2Tb2KXADu22xNUuSZA39zv/
 XOVtFJVPU6GxUFz5RSXaZzVJb3bHKfr4XZDxF2mfuap0iFcROSrI+K6FHdZMbrqDIeKY
 8fcOngAeyOJrE8VzALlKWnbOBY1+3tYHCorJC+RhoYASNSPmZLBVMlZQEjoUv42tmBoH
 /Q+lhyPDhhD0rvjS7Y8A2Fx2gluDkBuwyQtRqL/zD0opsavBo4syF1vASOsB7vRGD6gk
 TXOtJlzpnc69DmCTpbkFJ1oTcL+vfbr0aq+dGw/2oeUEmdf0VLRmPpM2JfDmgs7EUkHP
 1OCA==
X-Gm-Message-State: ABy/qLalpgRqwRJSAU171Yk4GbPrxZ8BJxi3qZWLgk70sLTDh2Doqad/
 QaQ0UUAZ/3zi7B8/IsbxD1RUdQ==
X-Google-Smtp-Source: APBJJlHbwks3MBRHNE3DXPbOv0VnHOqiWWpvuEJSNkYo5my6HtIg8X5+AbNKn9MxVffwxC3zfL068w==
X-Received: by 2002:a17:906:3192:b0:997:eab5:f1c3 with SMTP id
 18-20020a170906319200b00997eab5f1c3mr2000816ejy.73.1689762588776; 
 Wed, 19 Jul 2023 03:29:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a17090668d700b00993159ce075sm2123828ejr.210.2023.07.19.03.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jul 2023 03:29:48 -0700 (PDT)
Message-ID: <93efae97-4d8a-112b-e137-2f413954c2d6@linaro.org>
Date: Wed, 19 Jul 2023 12:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: ili9881c: Add TDO TL050HDV35 LCD panel
Content-Language: en-US
To: Matus Gajdos <matuszpd@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
References: <20230719102616.2259-1-matuszpd@gmail.com>
 <20230719102616.2259-2-matuszpd@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719102616.2259-2-matuszpd@gmail.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/07/2023 12:26, Matus Gajdos wrote:
> Add support for TDO TL050HDV35-H1311A LCD panel.
> 
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

