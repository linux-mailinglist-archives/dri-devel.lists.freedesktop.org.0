Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE976546C60
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 20:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C3B1123AE;
	Fri, 10 Jun 2022 18:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A83431123F0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 18:32:11 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id s23so26130250iog.13
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OVMxoy3v8YN9vjfenOL8+Mzp5/ikdw6ycfv3Coyc0HQ=;
 b=Un/VIwYOtQTnkray3NolLljk5HkOX0hMR3l4KghDZ0EnYFv5M2xUuuYBDYFbsNiaxn
 vYP9sNxSjutDt9N/I51wgxqswdyq/kVv/GjKw9uQ9p1AFDsXszCzM9SPPbghTIDo5ZFM
 pbdpRv91zIScLifdTKV5WbdZ5WjhkoH6UD8bQIuN1fyT7WPu5EJeHGCIbC+PH5QcCU/S
 OOL1jIWRC5fUXzhLgX/7gLsYYx+Hv1Zv6Eo9A+JGqMtPuTomz9CjL0JUXIzIdCmwfxw/
 2BjRRGRL8UQ76VneqHfrf9Fe52kLM12XGroQotX4/WHXRFZ8CvDUHY1gToKW3c1GztwO
 y4Xg==
X-Gm-Message-State: AOAM532isNBsQzfOl9QvE8ToAfglcPNimVmvgK3aM8SSTNdusVm9l2kL
 J75PMtD3z4f73NEfkdWakw==
X-Google-Smtp-Source: ABdhPJzrk+TFZQ8ye0z+1Q6GVMf6xVa4Vaq1QD2t1xc6NjS6VEHT9PgXPmwREY6KXZs17bPRjqebmg==
X-Received: by 2002:a6b:c801:0:b0:669:c93c:5a69 with SMTP id
 y1-20020a6bc801000000b00669c93c5a69mr147764iof.167.1654885930991; 
 Fri, 10 Jun 2022 11:32:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a023909000000b0033207c2cebesm2142424jaa.48.2022.06.10.11.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 11:32:10 -0700 (PDT)
Received: (nullmailer pid 1952880 invoked by uid 1000);
 Fri, 10 Jun 2022 18:32:08 -0000
Date: Fri, 10 Jun 2022 12:32:08 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH] dt-bindings: display: arm,malidp: remove bogus RQOS
 property
Message-ID: <20220610183208.GA1952788-robh@kernel.org>
References: <20220609162729.1441760-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609162729.1441760-1-andre.przywara@arm.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 09 Jun 2022 17:27:29 +0100, Andre Przywara wrote:
> As Liviu pointed out, the arm,malidp-arqos-high-level property
> mentioned in the original .txt binding was a mistake, and
> arm,malidp-arqos-value needs to take its place.
> 
> The binding commit ce6eb0253cba ("dt/bindings: display: Add optional
> property node define for Mali DP500") mentions the right name in the
> commit message, but has the wrong name in the diff.
> Commit d298e6a27a81 ("drm/arm/mali-dp: Add display QoS interface
> configuration for Mali DP500") uses the property in the driver, but uses
> the shorter name.
> 
> Remove the wrong property from the binding, and use the proper name in
> the example. The actual property was already documented properly.
> 
> Fixes: 2c8b082a3ab1 ("dt-bindings: display: convert Arm Mali-DP to DT schema")
> Link: https://lore.kernel.org/linux-arm-kernel/YnumGEilUblhBx8E@e110455-lin.cambridge.arm.com/
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reported-by: Liviu Dudau <liviu.dudau@arm.com>
> ---
>  Documentation/devicetree/bindings/display/arm,malidp.yaml | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

Applied, thanks!
