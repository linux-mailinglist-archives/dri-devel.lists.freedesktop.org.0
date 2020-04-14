Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C381A881D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 19:59:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8926E15C;
	Tue, 14 Apr 2020 17:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBBF6E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 17:59:14 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id d7so6155497oif.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 10:59:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MbLt7+mg6Oetm1gbvDN0HE/9QqLc7vIPQSx4pz/IWko=;
 b=J50/tYO079nCkkegGXiRa3liG/NjbB+Zos9wGBiXYqIQk5w48ZKla8rkZdeJ0h912k
 0qBcODpQjIN+Z+B/TFwkvdbPm5JGAWMbYfq3ApCeaFZrl4GCpCO1D1UVQhGuvSZb5cT+
 vQq6Y445XMppQCTI1qNXodjh/TU10bO8o6PRZ/LXpmpb8Sgt0R3qWXS8LPKTDvb6JDAG
 KsB75yUOcyRCNpdoqkpj1MQnbsdFANcjrb6Qoc6UrWeawwXUs3i/tfttxU7hHSFf5uvr
 ZgXmQccf7TMsBvaoaxkY5dTAtm+Jauug+sS3pTyt0Gg4jcGzYcYxMRetq2ECuMfrRlsj
 Glug==
X-Gm-Message-State: AGi0PuaEOxnsYoOAKvfVrvBPMayWf6u0Yjm2QEQ869FJK96HDD92GMTx
 VJJwuZFQ036Tij7YI/EKMQ==
X-Google-Smtp-Source: APiQypJlaXG4zu9PmD/DgToYH3heydOg9ica+o6s8kLB78gY3Gm05N1iYUwxCQz5c3+ZNDu+sl4n8A==
X-Received: by 2002:aca:f491:: with SMTP id
 s139mr16592669oih.128.1586887153366; 
 Tue, 14 Apr 2020 10:59:13 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k64sm5691828oia.57.2020.04.14.10.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 10:59:12 -0700 (PDT)
Received: (nullmailer pid 4704 invoked by uid 1000);
 Tue, 14 Apr 2020 17:59:11 -0000
Date: Tue, 14 Apr 2020 12:59:11 -0500
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: convert rockchip rk3066 hdmi
 bindings to yaml
Message-ID: <20200414175911.GA4583@bogus>
References: <20200403133630.7377-1-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403133630.7377-1-jbx6244@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri,  3 Apr 2020 15:36:30 +0200, Johan Jonker wrote:
> Current dts files with 'hdmi' nodes for rk3066 are manually verified.
> In order to automate this process rockchip,rk3066-hdmi.txt
> has to be converted to yaml.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> Changes v2:
>   Fix irq.h already included in arm-gic.h
> ---
>  .../display/rockchip/rockchip,rk3066-hdmi.txt      |  72 -----------
>  .../display/rockchip/rockchip,rk3066-hdmi.yaml     | 140 +++++++++++++++++++++
>  2 files changed, 140 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
