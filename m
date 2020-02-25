Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9793216EDA0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E35A6EB77;
	Tue, 25 Feb 2020 18:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994C66EB75
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:14:24 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z9so410467oth.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:14:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fzMstvFQHtiY1mtNKEHbS1tBWH2f5ubsJc5MbGcMIgE=;
 b=makj1EBVnsFfRgEgviQLV2f7CBtpQ3dkR9t+ZdEeZOtGEZnfViM58EMfyu/Jc7Pluv
 HnYsx/AGQbZd5xqEYz69P4vHT4AHqPCBvBPRFuBiMlyliLJBjdCPjmLQoiEjhltbjehE
 iEbpNKppDU5QSe0VOvClqawxwlr0ZZpqp4dYkbFpJUhWcdC+yRS7Ai+iPOoBFlnDd/6n
 MYq0vgqGWKhPsS8z4AAhnodwzhcugC1E/iK8vxwkyEm3YFLzrxL9Z8u9+WlB7YA6Zxsd
 qwhvv9qB/TvHpZWHscvx3Ys6Pdq4b0h6B6y/l5cOCiaEbw/AavJDkH7EOVnzNSchM6k3
 Yw7w==
X-Gm-Message-State: APjAAAXkNgxY/4zf+R0z/JlifNijCHWftIHizL29bQWyoQ/1hVqlcaex
 U50IpAyyaUNuTuM9uykE/A==
X-Google-Smtp-Source: APXvYqyGKyCpS5QVH0RlgQkGwt+azhBTDZOJ39HMNdZPpnFpagNcBAnEczZ6ez53W17xGffq9mb+tQ==
X-Received: by 2002:a05:6830:4c7:: with SMTP id
 s7mr45097888otd.359.1582654463904; 
 Tue, 25 Feb 2020 10:14:23 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o1sm5881508otl.49.2020.02.25.10.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:14:23 -0800 (PST)
Received: (nullmailer pid 32082 invoked by uid 1000);
 Tue, 25 Feb 2020 18:14:22 -0000
Date: Tue, 25 Feb 2020 12:14:22 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 01/89] dt-bindings: i2c: brcmstb: Convert the BRCMSTB
 binding  to a schema
Message-ID: <20200225181422.GA32044@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2020 10:06:03 +0100, Maxime Ripard wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
> 
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml | 59 +++++++-
>  Documentation/devicetree/bindings/i2c/i2c-brcmstb.txt       | 26 +---
>  MAINTAINERS                                                 |  2 +-
>  3 files changed, 60 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-brcmstb.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
