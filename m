Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA871528829
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 17:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593DB112495;
	Mon, 16 May 2022 15:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D7E112495
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 15:12:28 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so20421966fac.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 08:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=znK6Xi/ZZGwAG1mufIgwNSTMcdTMg6wUp+SUygn6ioI=;
 b=wuvMgDjA9hy6snvjbHnPt0xPx3RBFfjHoNfB5P/x50NyMMJicDQf+UOIBsSevYT4Ow
 euKszb2Hewpqe67B9oJBQBdpJyBtvyffDD99/yfkriEG46vgtLHBN8QTvQnyTnK5fBud
 YwPkSCmL4dtW8e2Aoaftsls2yVXLQBotMooB8igMgj/BU9wsJSfTLjX8d0XXwicitoz+
 MXcbyRneG4xFbvcMChhOrErYcPehDLjdlPSGltI8SQRbwf3OLaqDBqlg2ryZtXY8VyUY
 eCr1cNY/wX3qlum8SfegV03k5ESlBl49NeVqpXhT+XKeXDKih7J/KhE8TOPZH/kYiH7o
 ZSmA==
X-Gm-Message-State: AOAM531If/RqpZmNxAXmAf1tJq4qA0RxjgTfIS3noq+Jj3DP07n0ZVKe
 +cCX/7eezvoaHdmYgLwirqaYyMSD3g==
X-Google-Smtp-Source: ABdhPJxPwFMBKNVLxZpvbM0oKINdhczioV6MSSHnKVI7RMNwc5BdKvXqQN13cVGRLoewA3V9riVaNQ==
X-Received: by 2002:a05:6870:4596:b0:da:b3f:2b1d with SMTP id
 y22-20020a056870459600b000da0b3f2b1dmr16326831oao.188.1652713947847; 
 Mon, 16 May 2022 08:12:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r12-20020a056808210c00b00325cda1ff8fsm3826021oiw.14.2022.05.16.08.12.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:12:27 -0700 (PDT)
Received: (nullmailer pid 2653921 invoked by uid 1000);
 Mon, 16 May 2022 15:12:26 -0000
Date: Mon, 16 May 2022 10:12:26 -0500
From: Rob Herring <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: rockchip: make reg-names
 mandatory for VOP2
Message-ID: <20220516151226.GA2653888-robh@kernel.org>
References: <20220511082109.1110043-1-s.hauer@pengutronix.de>
 <20220511082109.1110043-2-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511082109.1110043-2-s.hauer@pengutronix.de>
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 11 May 2022 10:21:07 +0200, Sascha Hauer wrote:
> The VOP2 driver relies on reg-names properties, but these are not
> documented. Add the missing documentation, make reg-names mandatory
> and increase minItems to 2 as always both register spaces are needed.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Notes:
>     Changes since v1:
>     - Drop minItems
>     - Add reg-names properties to example
> 
>  .../bindings/display/rockchip/rockchip-vop2.yaml          | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
