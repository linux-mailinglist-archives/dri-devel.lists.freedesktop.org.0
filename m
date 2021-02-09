Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F0731583B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 22:03:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814E36E52C;
	Tue,  9 Feb 2021 21:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BD96E52C
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 21:03:05 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id f1so26202oou.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 13:03:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VOtt3prjmqypaQTJ4pYSOiaPQHntAWw3Q/krYTfHSSk=;
 b=jIrGDj5bj5It2fC51OTCy41v4TmPaVMXD91OofhUXHojoaj3btZDQQreRqGLeWG9px
 qqOlUimQ88Ik6v3SeGCAAPECwZScIHhXv+k67ji15RaldCYqIHgAV9ZQ+jQACNRDH5z4
 6djBTOFFr0N4pp/Lp6bHcn2eBlUh1xjtuDlP9U6qD8FwT4nkpOsECm9XuV+vGNkKdQ28
 4hR0jQnUUdIPyMFnTZKqeYtHRCDzN9mNRH5hh5rXgYicyfAniGdhPpQ76XaDUKcFnVI8
 YdXVP4BOMo3viY/0IFbp0632jLyj9M1fNNF7ChJKOv34F8aCg5UhqDhC4SbqxdRXnHOh
 sEaw==
X-Gm-Message-State: AOAM5314J1eDsU4agMFXVLfQujhm80ODSbCPPCKLxve0rSeDB+2LSAeY
 +CsQddE5EKvZITUTf3B1FA==
X-Google-Smtp-Source: ABdhPJxZR0I7iOxekYCbNXoQvdkurgLtI6UNYp7oKlGrjOT91AqHiylCg2zCTplwkzqaYRmDj/mP3g==
X-Received: by 2002:a4a:b987:: with SMTP id e7mr17130855oop.92.1612904584869; 
 Tue, 09 Feb 2021 13:03:04 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v17sm4510401ott.7.2021.02.09.13.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 13:03:03 -0800 (PST)
Received: (nullmailer pid 178168 invoked by uid 1000);
 Tue, 09 Feb 2021 21:03:02 -0000
Date: Tue, 9 Feb 2021 15:03:02 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 2/6] dt-bindings: display: rockchip-dsi: add optional
 #phy-cells property
Message-ID: <20210209210302.GA178138@robh.at.kernel.org>
References: <20210202145632.1263136-1-heiko@sntech.de>
 <20210202145632.1263136-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202145632.1263136-3-heiko@sntech.de>
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
Cc: devicetree@vger.kernel.org, dafna.hirschfeld@collabora.com,
 cmuellner@linux.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 helen.koike@collabora.com, robh+dt@kernel.org, sebastian.fricke@posteo.net,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>, ezequiel@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 02 Feb 2021 15:56:28 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The Rockchip DSI controller on some SoCs also controls a bidrectional
> dphy, which would be connected to an Image Signal Processor as a phy
> in the rx configuration.
> 
> So allow a #phy-cells property for the dsi controller.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  .../bindings/display/rockchip/dw_mipi_dsi_rockchip.txt           | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
