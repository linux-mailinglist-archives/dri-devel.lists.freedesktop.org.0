Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013851254CD
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 22:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FA96EA86;
	Wed, 18 Dec 2019 21:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502D36EA86
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 21:36:15 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id a15so4262186otf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 13:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=72VAfYuwXoJ1WVkCcjRKB4hbu6IUlbWCsYCwfnomH8c=;
 b=bH2BJ9oxDA8zJAgskbhW/Y7w0y+2l+NxM1Y114LxOikx4lPxw5wmuFpaQ37jc9zJw0
 zGz4tbw3woMW1ed5AU0xj+qKmG9s4bptuE9WMDr3NRlujlCsoZdFUZRn7lDwR33aFku/
 Yy+Bl/OA408W9gd7aE5u1mT90x4fFeZMg+q5rNLDJA5qhULFnm5txotgniwBVvPZxKPG
 cfEP36VoLo2TPL07DbEw1ekzTswB1VNuNhLGZ10ZtmpiLmsGcGjv6nD3Ci/s67Tfh/rM
 jaYI2Y044wG7EKWO2ziFr0y1jeTWE2RdmC48Z3SmdMuq447uBCfFhWTfQ86W+E2zygkL
 27gw==
X-Gm-Message-State: APjAAAXL8xjvi+LtZjFx6l24IB8Exnr/x7pIpiNWllVBuazqTTHaMFxc
 8kfP9JrK4QRjKtnoAa3Btg==
X-Google-Smtp-Source: APXvYqy7BIKZhbjHQz6b0xkP7HzpJe1AqV+DOsqDmUcyxYqd8NSDMqiKqNPha8X3aU1Lz45KQRfqzA==
X-Received: by 2002:a05:6830:1f95:: with SMTP id
 v21mr4939761otr.325.1576704974635; 
 Wed, 18 Dec 2019 13:36:14 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p83sm1235400oia.51.2019.12.18.13.36.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 13:36:14 -0800 (PST)
Date: Wed, 18 Dec 2019 15:36:13 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 2/3] dt-bindings: display: panel: Add binding document
 for Xinpeng XPP055C272
Message-ID: <20191218213613.GA29058@bogus>
References: <20191217222906.19943-1-heiko@sntech.de>
 <20191217222906.19943-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217222906.19943-2-heiko@sntech.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Dec 2019 23:29:05 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The XPP055C272 is a 5.5" 720x1280 DSI display.
> 
> changes in v4:
> - fix id (Maxime)
> - drop port (Maxime)
> changes in v2:
> - add size info into binding title (Sam)
> - add more required properties (Sam)
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/xinpeng,xpp055c272.yaml     | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
