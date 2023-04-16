Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F0C6E39C9
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 17:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9B10E250;
	Sun, 16 Apr 2023 15:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0FF10E250
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 15:25:41 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id q23so48413240ejz.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 08:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681658738; x=1684250738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rkr16/2uhjc5xAZo5cEHlNc3VpIEgJzarzHwERFHq0s=;
 b=haCdf9+BR/j8VQG3dCbrLnnCA31UGr+Aa4I9A4PoSXkSnVJACLUgsZ4QSDWdmOoLJD
 QPHeN2ybyOyUzFiPutyNO6gCu7KL+SAYlkB9LwSbh2rmWEMccsdPqYu+sPMTn6Fur3mg
 id33jhveF/A0GGFCpSlkXZ5ae348JtwL5g4AtY6kLpOgy+vCFPl0+nmMzMdow3ovSzhw
 alyVJnQihCV0erBSBIqrDOeNI0JkZRXhuzsWRIqkoazSHRRDQsp+1P6Rh9sjN7Ry4HwK
 EXsPRodppOWvl7Bq1bGFToTFqjpTitsEkNlp9Wib9HTdJ/UVMU/skVgyOP5qsN8trFgx
 qo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681658738; x=1684250738;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rkr16/2uhjc5xAZo5cEHlNc3VpIEgJzarzHwERFHq0s=;
 b=JFyGNlQzqYGdzijJXq0BgKQ/du1qljkdrrfPqiF+4trqA9l7rPkalhqOu7F/TyuKKo
 A6mCMkbEXoQ9OA19J5ftcBaSZ9X8xe7bUe+zVKUEmtwQopfrpvOgZWehg5w3TyczQINZ
 u7dj4AhAqyKDO+mvf0IlUyecb67+gJbLPp49X19TqYrHeBxldcjFt7Zn9tVdCJQPUayJ
 c+3H9vbZvec7EASxqq6QZ9NsmctanNaawC2MqgsMU7cZ4+THu8sWauGXQgM+l5NYhde0
 3IGWGFNFvgRiazSanQfuWK/641bDoZk4Us5QWlOLSUuhVx5C/oe6y+gbijH6+PDPQrT5
 uVMw==
X-Gm-Message-State: AAQBX9fJsQevA2niyJuEW/Z2nM6XAhbc3u7oKs8PmHqpMDFlSvTt+kTx
 HLAKrssqmWERLau9JxsmW0NgcQ==
X-Google-Smtp-Source: AKy350aQyYzT88ojqae6iSJ5BPreKSx12yrrdDie3wOuoF4ooIab9xHL7T/FyJ0Q9oL9tGurdDL62g==
X-Received: by 2002:a17:906:b202:b0:94e:d688:c36d with SMTP id
 p2-20020a170906b20200b0094ed688c36dmr4229913ejz.38.1681658738030; 
 Sun, 16 Apr 2023 08:25:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba4d:301c:484d:5c9?
 ([2a02:810d:15c0:828:ba4d:301c:484d:5c9])
 by smtp.gmail.com with ESMTPSA id
 hf3-20020a1709072c4300b0094f1b3eb42bsm2261976ejc.1.2023.04.16.08.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 08:25:37 -0700 (PDT)
Message-ID: <897f65ac-3aaf-b5c2-d888-c2100069d53a@linaro.org>
Date: Sun, 16 Apr 2023 17:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/5] dt-bindings: display: panel: nt36523: Allow 'port'
 instead of 'ports'
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230412-topic-lenovopanel-v2-0-055c3649788e@linaro.org>
 <20230412-topic-lenovopanel-v2-1-055c3649788e@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412-topic-lenovopanel-v2-1-055c3649788e@linaro.org>
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/04/2023 12:09, Konrad Dybcio wrote:
> Using 'port' instead of 'ports' for single-DSI usecases allows for saving
> a couple of DTS LoC, including a level of indentation. Allow that.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/panel/novatek,nt36523.yaml           | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> index 0039561ef04c..38f4f986aef1 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36523.yaml
> @@ -33,15 +33,26 @@ properties:
>      description: regulator that supplies the I/O voltage
>  
>    reg: true
> -  ports: true
>    backlight: true
>  
> +oneOf:
> +  - allOf:
> +      - properties:
> +          ports: true
> +      - required:
> +          - ports
> +
> +  - allOf:
> +      - properties:
> +          port: true
> +      - required:
> +          - port

If one is not connected, I still would prefer to have ports node as this
device in general supports two ports.

Best regards,
Krzysztof

