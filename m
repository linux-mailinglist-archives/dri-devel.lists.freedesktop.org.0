Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26163316DA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 19:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E9289DA8;
	Mon,  8 Mar 2021 18:59:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D963589DA8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 18:59:32 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id n14so11146400iog.3
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Mar 2021 10:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d/wMVNVlgeXsHNDoOPos1VXzlcySie+Bw+kV8ZOpozo=;
 b=I6kA9jGNI/86h9ZBaYF1JpfG+s+nlKRR38aRsokPRvfDCYLHMyjrqqV51ZMEobflYB
 2Ol3Wc+pbpdpJh3w0hRTofn3CmAE9Xi/W3FU7TgBEcW3sBD0fRPv0SiJdu/TrU2FULlc
 auABYIboh6k2Hy+RR8sRQ6HDpskp8fQW3h7c9eR0ZBEvrt0brjaC67q+7wUMnrX5+1RU
 Ho6FbiHxoGXZuLBp6vYReRnUc5k3uMcDWgDXuQlFaKgh0xQOkzz/tQ2wP/r6uRBKjH0c
 z/B1/HtHKSRX7Iq+Hwa7GGOvZNyC5qkv4ROSkt+bPSQUJTNVJ7nMaVHfItIwhV91A/Sq
 a3AQ==
X-Gm-Message-State: AOAM5324o/yduQP3oyVhCzyb9LuOsXb84f913fs5GL50L6KtR89XqGjw
 ScK60fGRxDm3huE+dqMhlw==
X-Google-Smtp-Source: ABdhPJw6RyzF1y6r+1o51v3mjB+0yXs2OCrY5Yao6MT2OKQLX/XIZkRNaeWhrvtEJRWCWWEj7PpHlA==
X-Received: by 2002:a05:6638:144e:: with SMTP id
 l14mr24629378jad.76.1615229972355; 
 Mon, 08 Mar 2021 10:59:32 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c19sm6441129ile.17.2021.03.08.10.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 10:59:31 -0800 (PST)
Received: (nullmailer pid 2788650 invoked by uid 1000);
 Mon, 08 Mar 2021 18:59:30 -0000
Date: Mon, 8 Mar 2021 11:59:30 -0700
From: Rob Herring <robh@kernel.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCHv2 4/6] dt-bindings: display: ti: ti, omap5-dss.txt: add
 cec clock
Message-ID: <20210308185930.GA2788568@robh.at.kernel.org>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-5-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302162403.983585-5-hverkuil-cisco@xs4all.nl>
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
Cc: devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 02 Mar 2021 17:24:01 +0100, Hans Verkuil wrote:
> The cec clock is required as well in order to support HDMI CEC,
> document this.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
