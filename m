Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC4E80A983
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 17:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A0910EADB;
	Fri,  8 Dec 2023 16:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9666F10EADB
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 16:44:44 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-6d855efb920so1561364a34.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 08:44:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702053884; x=1702658684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQNz+xvqRdVvhqlnaesIupD2ZldVHm05D8bBXCEt6fE=;
 b=T6zXgRitTGMW+1ALMimYRU6cTm6y0RUWjhxrhfMZ67eNeY2Reu8lPsHvMXLlglcnh0
 RVpzYKWCx4vqskkNUur7CFc87xW0IcTH2Z4to1zXIe+a9snhYvwPx6i4JlIwrBQmVsWS
 9YrwzXnhaOtDRdYmsLVnpquGJninmNgtXbQShPRmpvKsXleLsmsmCLaVyyxlFc7MAONh
 MkdJTnJ/Q5sIuywF7CelTzQ9OWmn9VyvE3T9eqM7MvGBLierTypQRo6YIyzIdWi8/JLP
 A+Wk1vksa3zZDAlTbdnUQnvnnbyiRNIySZBxJeo8HCf59iy/jW9Q+ZmsHN5fxSpNOPUe
 pztw==
X-Gm-Message-State: AOJu0Yy6fmDW9WOyza/mlgrS6KeZxb7u2hAB6VRf3rpLwdd9FkgT1DSK
 dIaGnJUqzl2v2CJ5xqTE5Q==
X-Google-Smtp-Source: AGHT+IEElGzMDgsf5XKgsEJBooUGCELsszhJ/I7kKbKCN+yZO/mIQ5M8oB94icul6SeFg7QJKz8wzw==
X-Received: by 2002:a9d:6a4a:0:b0:6d9:a5ef:a2c7 with SMTP id
 h10-20020a9d6a4a000000b006d9a5efa2c7mr372426otn.9.1702053883797; 
 Fri, 08 Dec 2023 08:44:43 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w26-20020a056830061a00b006ce28044207sm349258oti.58.2023.12.08.08.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 08:44:43 -0800 (PST)
Received: (nullmailer pid 1748007 invoked by uid 1000);
 Fri, 08 Dec 2023 16:44:41 -0000
Date: Fri, 8 Dec 2023 10:44:41 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: drm: rockchip: convert
 inno_hdmi-rockchip.txt to yaml
Message-ID: <170205385847.1747356.13765108616438619401.robh@kernel.org>
References: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org, mripard@kernel.org,
 tzimmermann@suse.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 04 Dec 2023 18:39:03 +0100, Johan Jonker wrote:
> Convert inno_hdmi-rockchip.txt to yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Note for rob+dt:
>   Used enum to "soon" be able to add "rockchip,rk3128-inno-hdmi"
> 
> Changed V1:
>   Rename file to more common layout
>   Add/fix hdmi_out port example
> ---
>  .../display/rockchip/inno_hdmi-rockchip.txt   |  49 ---------
>  .../display/rockchip/rockchip,inno-hdmi.yaml  | 103 ++++++++++++++++++
>  2 files changed, 103 insertions(+), 49 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/inno_hdmi-rockchip.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,inno-hdmi.yaml
> 

Applied, thanks!

