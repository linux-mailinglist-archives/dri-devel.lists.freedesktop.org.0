Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1938332FCE9
	for <lists+dri-devel@lfdr.de>; Sat,  6 Mar 2021 20:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED60E6E536;
	Sat,  6 Mar 2021 19:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7C46E536
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Mar 2021 19:57:43 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id y67so4608346pfb.2
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Mar 2021 11:57:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hmm575HorfyRVhowVRgdU0QCmJjP3xAhO8Ci7Hvo+XY=;
 b=poNrI0xyyKdrOQKbNfRiXD4z13pvyB4/SZAHAwBXFyKxMNwYNmMeGKJ0egpSQBUbx2
 2N9dkQLU4CE33yzs4frTiSf5DUWibI1/pBL4Adq71IkodWPzTuzNhLg3YfW8QP84spKj
 LVCQ8O56rgoqBT2illZ4cqS/IRA37A3afSvoboaYqqRDXBjOjwkyGa9OcyEeDkhEuTDk
 rRlJA3a4e7emVQB2qSfla28UcGjRtEn5ewfoxGvpYpiZp23vmQ1Zc5U51I/O/yO9T9os
 17Rrx/1tEt4qiZS9xVH9fS7xOCFfr4e4OdgBA5KFZQmubj0BbPJLqw+PoHTdcpf6evLV
 k+FQ==
X-Gm-Message-State: AOAM530GXdWBg3WudUWM7JHJBUFQi88uoo6p9LHX+1JdY0kkfnCOEn0W
 dS+1TMkreSzIxD45afyH0g==
X-Google-Smtp-Source: ABdhPJy7//cpr20o7A74RWsGhuPkp3ptB1ZhP+ZXC1RfZ5srLIqQv3UDqt7REpXOqtDX32CEDqfP6w==
X-Received: by 2002:a62:83ca:0:b029:1ed:78d1:531a with SMTP id
 h193-20020a6283ca0000b02901ed78d1531amr14563372pfe.56.1615060663350; 
 Sat, 06 Mar 2021 11:57:43 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id r13sm5902565pfh.159.2021.03.06.11.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 11:57:42 -0800 (PST)
Received: (nullmailer pid 1120672 invoked by uid 1000);
 Sat, 06 Mar 2021 19:57:28 -0000
Date: Sat, 6 Mar 2021 11:57:28 -0800
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCHv1 3/6] dt-bindings: vendor-prefixes: add congatec
Message-ID: <20210306195728.GA1120548@robh.at.kernel.org>
References: <20210222171247.97609-1-sebastian.reichel@collabora.com>
 <20210222171247.97609-4-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222171247.97609-4-sebastian.reichel@collabora.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alessandro Zummo <a.zummo@towertech.it>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, kernel@collabora.com,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Feb 2021 18:12:44 +0100, Sebastian Reichel wrote:
> Document binding for congatec.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
