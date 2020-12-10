Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBD82D518A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 04:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2156E32F;
	Thu, 10 Dec 2020 03:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85B66E32F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 03:41:30 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id o11so3645816ote.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Dec 2020 19:41:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oHT+bpTlXmEcpnDhxLPen0vIHtK4d63RKLxr2Jz+ZqE=;
 b=YJcFRvbaoZa5cGzM/ozVV8sRJiblMqYlIngFSTffmfCDC3L2fCvo+y797W4Hv15xVt
 9EqpTAAEU73lg3qy1eJLZ4pg9y/ONfGd7d0ya16H9fqfgxmAUUI8gkA2nmZCzKAhFcyS
 nxLG2iUHdIeIIuIvT61YLIKqnvi+j7dPlePL5JQ9s9BNZO6pamhIC2boUy0ovgcYsbnJ
 uDYjoiCxD8eBRVDk+pRo4f4V+HwoNa0m68KxbTzpEDtYJuVnGdJypCt2JD0vzjeknBc+
 Q13tdwbD1ry73MLFWISmbdJQHiJplGHcsXIjTuQkqp429R93ej7Lyfg1BfBZTYb7soTr
 X2Jw==
X-Gm-Message-State: AOAM532oPdiWiQP4RM24ChZQqPZeAaR0BQE6ddCRPnWDbbTsgNxp3ufY
 HP0DgiBRz5xqY32ERcd/WQ==
X-Google-Smtp-Source: ABdhPJzpzWnBwKKImc0q9CG0zR2ZvstScdCgUPs86Y83ZnTGScsY/VaNWpQ4XF/7YdZht+RliCvBqA==
X-Received: by 2002:a9d:7851:: with SMTP id c17mr4572752otm.255.1607571690280; 
 Wed, 09 Dec 2020 19:41:30 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h62sm802199oia.9.2020.12.09.19.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:41:29 -0800 (PST)
Received: (nullmailer pid 1613254 invoked by uid 1000);
 Thu, 10 Dec 2020 03:41:28 -0000
Date: Wed, 9 Dec 2020 21:41:28 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: display: add #sound-dai-cells
 property to rockchip rk3066 hdmi
Message-ID: <20201210034128.GA1613204@robh.at.kernel.org>
References: <20201206133355.16007-1-jbx6244@gmail.com>
 <20201206133355.16007-2-jbx6244@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201206133355.16007-2-jbx6244@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hjc@rock-chips.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 06 Dec 2020 14:33:51 +0100, Johan Jonker wrote:
> '#sound-dai-cells' is required to properly interpret
> the list of DAI specified in the 'sound-dai' property.
> Add it to rockchip,rk3066-hdmi.yaml to document that the
> rk3066 HDMI TX also can be used to transmit some audio.
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
