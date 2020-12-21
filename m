Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3142E00B6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 20:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0661889C52;
	Mon, 21 Dec 2020 19:10:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7FB89C52
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 19:10:02 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id i6so9816093otr.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 11:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uflh9aWjQjUACrrKIUHZ3D3HKPpGYANwFYyzpKEZfWY=;
 b=fZVy1gVReHgB3RalIQE8GKeRaQU17D+m4OOXUkfzBiRjGgD5N1Oa3zsTXsuXce28Gn
 cp3XYvuQfrSQ2fO52pU9XpgqUA/qE7kyIMiRzv2PvU6mq1Fp5BGqB1PNtPbu75FADBUL
 Tu9G6udDjpl07Ae1LnjlL3W5tRLkRBCgCjWkZvjkE6hSsKz7c0rLUKXQRig+Hwsf3w14
 c3ose91jcJ8tWKR8fc1ZEjq43i7ph2IdhBwDGADRrve7GHtXlT754ihAbJ07W2KNclW1
 ur+En6/PWMXpx60Fu4Et2ndo5XxUGLmhZ1S4OZx967Tk3RZFh9CxC9lb1hxOTClT4aht
 p0Qw==
X-Gm-Message-State: AOAM5328JewROFZzjsBsRg0QR8l3kWcwDxacK8R0JQWWYtGsYTRDeANu
 zUVFKCj+VGlFfoj6feQPrA==
X-Google-Smtp-Source: ABdhPJzk4N4FCaqCFlvX2+gDoZw1/MJMc70ppfBohNwet6wD2y4cn4zQDHGrY/ujUT2i4VWOyBryqA==
X-Received: by 2002:a05:6830:164d:: with SMTP id
 h13mr11021407otr.337.1608577801901; 
 Mon, 21 Dec 2020 11:10:01 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r10sm3879398oom.2.2020.12.21.11.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 11:10:00 -0800 (PST)
Received: (nullmailer pid 380370 invoked by uid 1000);
 Mon, 21 Dec 2020 19:09:56 -0000
Date: Mon, 21 Dec 2020 12:09:56 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v4 02/11] dt-bindings: net: btusb: change reference file
 name
Message-ID: <20201221190956.GA380319@robh.at.kernel.org>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201216093012.24406-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216093012.24406-2-chunfeng.yun@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Dec 2020 17:30:03 +0800, Chunfeng Yun wrote:
> Due to usb-device.txt is converted into usb-device.yaml,
> so modify reference file names at the same time.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v4: no changes
> ---
>  Documentation/devicetree/bindings/net/btusb.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
