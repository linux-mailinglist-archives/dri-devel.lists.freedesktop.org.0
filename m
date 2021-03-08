Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C7331A9F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 00:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E356E6E323;
	Mon,  8 Mar 2021 23:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBA16E323
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 23:01:41 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id z13so11844081iox.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 15:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WJmddZ2DEjDqbbvXamr8sfWrsbudlvy5mUoyE/Urbwk=;
 b=rpAeMWhippQryyqLB8T5gHjYmhO607L2nL10xwuWtJIpCtC9xoEKQnM25oAN146CJu
 bmv6+ZrHnTtOjmtoelWMjGsgnmzQt76ZWl4yWoWAOGrW9x6zfUej2C0LgriMm/QoP76D
 OlVoI9JaJ0S3pyN+qC+PltjP1Oz5ZiZdvfqFyUfOW8iW+UQCIwSkhsix4GD5uBQboDpS
 9KrbHiom+K2GAdH6Ii0h2j3X07bydIE0Zn0UTFBxAB9Z9Mzj4fDzX489dgzvORHxTQGJ
 sgGNAgVblA7+AfYjVmIEV2xv0NhudqrRrmmMkEPbol3SAONAnOfCZpJ1M3v7D7hWnMlW
 3ymQ==
X-Gm-Message-State: AOAM533GxaSifSwIA/YK8lOzMSUzdEyFE51cEj91JwTG2QVpHjnegEb7
 NY+YUxrO+rkzvj415JbpPQ==
X-Google-Smtp-Source: ABdhPJxbA5Y8PpW0JsHWc7hK5dTHQqjaS/Lx+XPBoIg39S8RsNSu5u3TV1aD/g4RD+YXN3T4n1rbxg==
X-Received: by 2002:a02:c894:: with SMTP id m20mr26434884jao.80.1615244500974; 
 Mon, 08 Mar 2021 15:01:40 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c9sm6838929ilr.78.2021.03.08.15.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 15:01:40 -0800 (PST)
Received: (nullmailer pid 3110832 invoked by uid 1000);
 Mon, 08 Mar 2021 23:01:38 -0000
Date: Mon, 8 Mar 2021 16:01:38 -0700
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: panel/kingdisplay, kd035g6-54nt: Remove
 spi-cs-high
Message-ID: <20210308230138.GA3110798@robh.at.kernel.org>
References: <20210307192830.208245-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210307192830.208245-1-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, od@zcrc.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 07 Mar 2021 19:28:29 +0000, Paul Cercueil wrote:
> The NT39016 panel is a fun beast, even though the documentation states
> that the CS line is active-low, it will work just fine if the CS line is
> configured as active-high, but it won't work if the CS line is forced
> low or forced high.
> 
> Since it did actually work with the spi-cs-high property, this is not a
> bugfix, but we should nonetheless remove that property from the example
> to match the documentation.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/display/panel/kingdisplay,kd035g6-54nt.yaml         | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
