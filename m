Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D236F440C
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 14:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C8310E1BD;
	Tue,  2 May 2023 12:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF25510E1BD
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 12:44:59 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b5465fb99so2961021b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 05:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683031499; x=1685623499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7ySYJlTGoivPIC1fZq21ZetJk8Jlo1cqjNqLD3csp6I=;
 b=F/au09ewfQJ0ENuPr1s5Da4CfGnxUpQXrqQXVTlH0FSVwjo4FngZcv9A6xuNdPpk4w
 gi2HrfEaxAG3mlXFS7/WftW+ikJT1MIwalN2/gp2wc/97fMc3iicK2IRPDF5Q+XJN7Nx
 x/9OU1WSBe1AgnZG1DgyK92DAjXv0ywqLVR9wpw+sBSc5w6yz0bJ5ajkk1Siwv1ALgD1
 FvG7qy7cdRxxy412fOPEOzfXUR+jMgcmDhiwddZfX9pCVzbgZezCrIcDrvMDHvnVBiDS
 /mNcib9mGBqaqlj5vffRNOwexTQG4jcUOrX37QmoNuFzKmwbKiAoB6IIGrgrbBoG12y9
 Feug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683031499; x=1685623499;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ySYJlTGoivPIC1fZq21ZetJk8Jlo1cqjNqLD3csp6I=;
 b=bkMlo+HUGx8y3QV9k0Ej9r6fZMhXgQJPBbf9LU8u84mRMboBr6kXoYLvlRtZiNpbW9
 KE94iu5S97r5uXQVf7NjazwfOl5e8XDx88c+ebOIZaviJVGnZ0EU8xaBsgh6/cI3i6Pe
 RtjLqLDbIzYes8ch7POGWjTUW7C881JesahzUofl9jO7CIFft2T3N7hNZ99tqUOSDPrl
 TlNMUAwiTVJu4Tim9KLupYGIOt1UE+0QOyd0usNMG557tiQ3jW+Tne+O1LVFqpqum2if
 h9GrWKEuXi05eFyVFz+wKv9Nt5nhsIhijVWWe6vGBM45OXdU2gG9fZix7CKc1Juc6rn8
 la0w==
X-Gm-Message-State: AC+VfDx9pjYpVfXxU5r1QsjN7C0zq8JFzevWNBuddSJuhW6katlO7N3L
 GCvgwU1hWqoO9dnSc2wAmm0=
X-Google-Smtp-Source: ACHHUZ6SMTxteP+9Qd5Dins2aBjFT1JCB47wUqc5JYnqbgdgAF3WIqCIzVuGULGKIMfsn8vWAdSfcA==
X-Received: by 2002:a05:6a00:2485:b0:641:4d30:7922 with SMTP id
 c5-20020a056a00248500b006414d307922mr14315368pfv.4.1683031499107; 
 Tue, 02 May 2023 05:44:59 -0700 (PDT)
Received: from Gentoo (n220246252240.netvigator.com. [220.246.252.240])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a637e57000000b0050bf1d1cdc8sm18588053pgn.21.2023.05.02.05.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:44:58 -0700 (PDT)
Date: Tue, 2 May 2023 20:44:51 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: novatek,nt36523: define ports
Message-ID: <ZFEFwwU9_h36xFvd@Gentoo>
References: <20230502120036.47165-1-krzysztof.kozlowski@linaro.org>
 <20230502120036.47165-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502120036.47165-2-krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 02, 2023 at 02:00:36PM +0200, Krzysztof Kozlowski wrote:
>      description: regulator that supplies the I/O voltage
[..]
>  
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    required:
> +      - port@0
> +      - port@1
Konrad has added a single DSI panel to this bindings, so we should
drop port@1 to allow it.

See https://lore.kernel.org/lkml/20230412-topic-lenovopanel-v3-1-bcf9ba4de46f@linaro.org/

> +
>    reg: true
> -  ports: true
>    backlight: true
>  
>  required:
> -- 
> 2.34.1
> 
