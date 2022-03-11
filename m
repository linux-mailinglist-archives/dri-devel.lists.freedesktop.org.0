Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304784D6434
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 15:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A6D89F45;
	Fri, 11 Mar 2022 14:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF4A10E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 14:59:12 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso10746765ooc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 06:59:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rlx1JW7lygTQGtLeTLatrd0STmwHhSb7akSrp1qNp2c=;
 b=xcL1nE3QUuOhUQ1vtOqMsl7utRySPbSAepO4siACYl8RkxxyaxwxqyZ76YuXMLIuPs
 uuhUToaMg8ubjQ1E7b8Myem20spqmLHp5YWY47p1mJCE9AxKxoc0+V42Of3iGw9tYSW7
 6fFIw4yYNmmKwQ4AVb73XfLmVY/a05kMklMNFlpgZXF9GZ5OF/9mu1ONt89XjqPfTCFS
 IKGrr7L/J/XfIxkdG0X6Z1r/5WLjnRadPUdpFbvtiM9gIhFQu+kgsqgiE+BqxpFbf8Of
 ccglNMCvEQ2qn92yb5AKfhnLkLx7mx96WP2pXXcYlJTQf0J+Lbb+lQIjGMdrbdQOO4g/
 GyFA==
X-Gm-Message-State: AOAM532O/TTdUU01DQj++1Dz+tmzOd2mIs1FF3SHc6ebdRvqvFncaZWx
 RKuvYYpkeNUUPq2KA7WtG4c7uEiO9A==
X-Google-Smtp-Source: ABdhPJzZqlxXCEjPjvwipUL3ApHB6wT089kVO6hV+r1oOvdK0tXoMUA9ddqGUbwnSZzC8ucRGYnOeg==
X-Received: by 2002:a05:6870:6024:b0:da:b3f:3207 with SMTP id
 t36-20020a056870602400b000da0b3f3207mr5574789oaa.183.1647010751924; 
 Fri, 11 Mar 2022 06:59:11 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 4-20020a056870004400b000dabe0c435bsm1483240oaz.7.2022.03.11.06.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 06:59:11 -0800 (PST)
Received: (nullmailer pid 3783608 invoked by uid 1000);
 Fri, 11 Mar 2022 14:59:10 -0000
Date: Fri, 11 Mar 2022 08:59:10 -0600
From: Rob Herring <robh@kernel.org>
To: Christophe Branchereau <cbranchereau@gmail.com>
Subject: Re: [PATCH v3 4/4] dt-bindings: display/panel: Add Leadtek
 ltk035c5444t
Message-ID: <YitjvmxpKHARVcYk@robh.at.kernel.org>
References: <20220311120453.163297-1-cbranchereau@gmail.com>
 <20220311120453.163297-5-cbranchereau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311120453.163297-5-cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 01:04:53PM +0100, Christophe Branchereau wrote:
> Add binding for the leadtek ltk035c5444t, which is a 640x480
> mipi-dbi over spi / 24-bit RGB panel based on the newvision
> NV03052C chipset.
> 
> It is found in the Anbernic RG350M mips handheld.
> 
> Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
> ---
>  .../display/panel/leadtek,ltk035c5444t.yaml   | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
> new file mode 100644
> index 000000000000..9e728f8ce0cd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0

Why did you change the license? It was correct before.

Rob
