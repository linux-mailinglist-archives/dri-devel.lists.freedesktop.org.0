Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25E880A454
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 14:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6748310E27A;
	Fri,  8 Dec 2023 13:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9453C10E27A
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 13:20:48 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3b9d8bfe845so1542396b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 05:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702041648; x=1702646448;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3GWkhChzBrVtOeU/3PYH7j47YZqHzJKDjxr8GAc4ZOw=;
 b=RqF+m7DmroxJPK3iSJnkFe5Av5CEw133j+z8hnwPkamR1TCs6DDCOgF23honp0hbJd
 D1Gr0R0pS9aMG3Y9C3Obnc28SfMk+pbR0jmq3KgeES6hedAhoMKKHOkEOiXnrLmMyD8z
 frCe+r9tm7eixpYewtJQmkCurcNzgKfkobkY4JZB5kSyY0/gs9T/l/AvVxodarPlryOL
 MuxopxHN11N2/LsiAvbFLmn5vyAzrh14XYlXxNnv9E1iAALoMlpuQDGen7Rj9m4zcgZA
 VGGvOKIgez4/mCfl3FUdBMyoJGR7LhAzfW3O/31i6v5fmvH/Oq0zIjfPOVrYGXjTB5Pt
 9Cyw==
X-Gm-Message-State: AOJu0YzaLQ9s4i+rJ9jBL6/VGMRFHtjEKiPAKWYbAn6zJPfJiSECownp
 Yo7ebCrL+zkbyqRyaYhLiNLftZSuJA==
X-Google-Smtp-Source: AGHT+IHhjOKdr82/KWEUNguAY8qA+GeFTCHpi9kCQS9Pri7WMQvh8Y+6EdYb1Ewkf9ZsVhlkwwY9cg==
X-Received: by 2002:a05:6808:17a7:b0:3b9:dddb:2921 with SMTP id
 bg39-20020a05680817a700b003b9dddb2921mr3108634oib.78.1702041647743; 
 Fri, 08 Dec 2023 05:20:47 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h6-20020a056808014600b003b9d5e265f1sm326913oie.2.2023.12.08.05.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 05:20:47 -0800 (PST)
Received: (nullmailer pid 1152053 invoked by uid 1000);
 Fri, 08 Dec 2023 13:20:46 -0000
Date: Fri, 8 Dec 2023 07:20:46 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/5] dt-bindings: gpu: samsung-rotator: drop redundant
 quotes
Message-ID: <170204154631.1150150.906529488412217486.robh@kernel.org>
References: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231112184403.3449-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 12 Nov 2023 19:43:59 +0100, Krzysztof Kozlowski wrote:
> Compatibles should not use quotes in the bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/gpu/samsung-rotator.yaml         | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 

Applied, thanks!

