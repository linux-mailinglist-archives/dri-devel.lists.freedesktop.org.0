Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C22909056
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 18:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC9010EDE4;
	Fri, 14 Jun 2024 16:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ewosrgSl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF4D10EDE3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 16:34:16 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ec0f3b9cfeso12885931fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718382854; x=1718987654; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GsvUggwl2iaq+7ID95/kPZJoKFES9T3PhHRwe3ICtG8=;
 b=ewosrgSllU93LwIFbTYEONVr89XctnAxnfA6GM2GTQ4UGzIDGt4eKVyRVzDrNQmwE1
 pm11b6VdlROqdKPPpUaovPd18/LU0sRLhR3exCQRO3rW9BsAMT17OamlruskzvLE7NiI
 4Y/Rg80bLrYEEIZxbEn5sYlOyUyJgkskbYJ28S63ChVp4PtQtmMmdlSV1PGlmBAzqSKg
 ulcSq+YW66JKHyv57NmkiX2n3pOz0DgtTfljBkcxE9KQGlQ0QMYAG5o0A9m4z3vwShmG
 inN7R5kh+jHKLOrmrxrev6WkHeA0ewtIRPWlYJJ1UFQfdKfhv4riNpwSGyzJOqGupUUl
 eRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718382854; x=1718987654;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GsvUggwl2iaq+7ID95/kPZJoKFES9T3PhHRwe3ICtG8=;
 b=bbCq2RuYGiEqv9vOjrg1A9BXyr9c22l6xAesPrfnTXwhYF01RJC3ElbkCi3VtNjiKn
 QHg6UA9vBCtMl4c3qEvyCjrYnSXqYcRUThqVnbVa2KWv8v2nsuj7wZ42W3RVvw2JAqC/
 7kXmxQKSHkqM60LBVj7HJ/pLNBi9kJQTZ2PQ9v6a9KhFuuYqhCJ7KRnkVjoF5ZBAyf6k
 xbL0tUmFKMrWJxt438CHUsBmxklFBzB/Nf7KWtspDwjXKyOFwoL/tFVPo8ApQmFlm9oo
 BTHs3NYgQtm0RNlV3+Cm2QTG7ElTMJOSAzc++q7k8x5g29sOVIQ3C7ADaEtlrxyRer9q
 bufA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOy2HnPGDINTVls6UKlMJeOfTWDG/tWLquFEtxn6NKxkCLR1ITJY8IWkeeIa0pdGFqZtPl/IE4ois2ZGhMLJANP5ih9NJsXjoeqaSXxSXi
X-Gm-Message-State: AOJu0YwvrN6WYKmCXOIy0gj8Qq3O/TAoOAjGGQX//t6UqUxSjMooKDMm
 LBK39u0uBK3ijZ6C/755ojM5CUcb7ftE8jjDFuwAIhESsVuLb7l/wE6PIg3cR5c=
X-Google-Smtp-Source: AGHT+IGWO/+8GdkVi0zVWi4kRTQ+VAxP+yfG1FPOfEgKx9zHhcN/3noH2wJkYSc+zOPvMmPFAKBvSA==
X-Received: by 2002:a2e:2281:0:b0:2ec:ff6:3bcc with SMTP id
 38308e7fff4ca-2ec0ff64128mr16860701fa.5.1718382854165; 
 Fri, 14 Jun 2024 09:34:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c061d3sm5763841fa.50.2024.06.14.09.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 09:34:13 -0700 (PDT)
Date: Fri, 14 Jun 2024 19:34:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jikos@kernel.org, 
 benjamin.tissoires@redhat.co, dianders@google.com, hsinyi@google.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: display: panel: Add compatible for
 kingdisplay-kd101ne3
Message-ID: <plucbf66gjhmt7bmtalqiopunqxnfjxljbt5flvjy3ssntx2vr@ou2pnejbvpg2>
References: <20240614145510.22965-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240614145510.22965-3-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614145510.22965-3-lvzhaoxiong@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 14, 2024 at 10:55:08PM GMT, Zhaoxiong Lv wrote:
> The kingdisplay-kd101ne3 is a 10.1" WXGA TFT-LCD panel with
> jadard-jd9365da controller. Hence, we add a new compatible
> with panel specific config.
> 
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Chage since V3:
> 
> - 1. Abandon the V2 patch and add kingdisplay kd101ne3-40ti binding to 
> -    jadard,jd9365da-h3.yaml again.
> 
> V2:https://lore.kernel.org/all/20240601084528.22502-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> Chage since V2:
> 
> -  Drop some properties that have already been defined in panel-common.
> -  The header file 'dt-bindings/gpio/gpio.h' is not used, delete it
> 
> V1: https://lore.kernel.org/all/20240418081548.12160-2-lvzhaoxiong@huaqin.corp-partner.google.com/
> 
> ---
>  .../devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml    | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> index 41eb7fbf7715..6138d853a15b 100644
> --- a/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/jadard,jd9365da-h3.yaml
> @@ -19,6 +19,7 @@ properties:
>            - chongzhou,cz101b4001
>            - radxa,display-10hd-ad001
>            - radxa,display-8hd-ad002
> +          - kingdisplay,kd101ne3-40ti

I think the list was sorted. Please keep it this way.

>        - const: jadard,jd9365da-h3
>  
>    reg: true
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry
