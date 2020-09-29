Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF04D27D7DC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 22:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFD7F89CB2;
	Tue, 29 Sep 2020 20:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBE389CB2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 20:17:44 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id c13so6915082oiy.6
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 13:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t59aWAhpZ67eszyLSCndlt/OHfuA01Ub+RG0vyS1B2E=;
 b=ZF7EF4wYI4udzlUiXyH+sWPinXirut5F6RZHfvrl8xntJXyTsM40dIKR3q+PQ9asq3
 oUHm5BPeKmwzEre8rYWmXisratrVJCxeNWsUK1pmTIKJTa0tKfx37cpqBTtbG84e/Qfq
 YKjEXZO6SjLSn6japyBCb3XdkIqVdqZJbxx7Nb+c4qCQ+mzeBNREjfTl0g0of+WOim7n
 KP1mZgODxqPmPI7BkG0JLOd+BKJ+E9x1BjaAzxttJn+NBL4skN7U+W1JTsz3UDN1slBP
 uu7amvF1v5QcW7L6TJlSdkCeInRQcCXbRUI2QmdItg+62eJRXmlo2AiDDVCo+Tf3K5lS
 gJoQ==
X-Gm-Message-State: AOAM532XL800eSt/fZZDX3u3uqr+RBo9EKT+H8Sg8Vf121Kq0vgbWZtD
 G6yS36Jk49kR9ATjro3dYw==
X-Google-Smtp-Source: ABdhPJw8oXYd5dk/F9BkkLRFREqhVnH4h9vwagRk0zBQyF0ATX6mu/B6LtNXUtj9G+uoPk7GzUntfw==
X-Received: by 2002:aca:8cb:: with SMTP id 194mr3505368oii.37.1601410664200;
 Tue, 29 Sep 2020 13:17:44 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m20sm3144986oof.23.2020.09.29.13.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 13:17:43 -0700 (PDT)
Received: (nullmailer pid 1093221 invoked by uid 1000);
 Tue, 29 Sep 2020 20:17:42 -0000
Date: Tue, 29 Sep 2020 15:17:42 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: sii902x: Add supply bindings
Message-ID: <20200929201742.GA1093186@bogus>
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
 <20200928173056.1674274-1-mr.nuke.me@gmail.com>
 <20200928173056.1674274-2-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928173056.1674274-2-mr.nuke.me@gmail.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Mark Brown <broonie@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 28 Sep 2020 12:30:54 -0500, Alexandru Gagniuc wrote:
> The sii902x chip family requires IO and core voltages to reach the
> correct voltage before chip initialization. Add binding for describing
> the two supplies.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
> Changes since v1:
>   * Nothing. version incremented to stay in sync with sii902x regulator patch
> 
>  Documentation/devicetree/bindings/display/bridge/sii902x.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
