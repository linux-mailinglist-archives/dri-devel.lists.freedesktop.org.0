Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C1F16EDBE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3D96EB7B;
	Tue, 25 Feb 2020 18:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FC66EB7B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:17:55 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id w6so454565otk.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:17:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cfeiAYk0sz6jKgpfGcPq2AbGtANcSLd4G7ZU9zGmlGY=;
 b=jstAgPxckk59YmXuWZHVcJiRyknKj9sFtSJxcoDbwM2WswXQU/r9OtTLauTCe5trm7
 lIwqFLVoLNZnvWePrNW9tL4tQPvenXxi9YWx1HT65HGs2tXVRjJ9QOMCRi09I6XW2lFe
 SztkaJW7BWysPDhBrmyd/CH+EM62B5qzQmYVoDtYZGnTw64SVkOsC3iwT/grqayKOFKi
 2Is9HWlHdIpgfY9lyUH/M05eju/Q9K9ZpJZ6zfBi5FtSqdhZzrC82apxPW8OJG1ZVwf5
 ManamcGR/SqiOVa7S6kzbd3rfvwptbRf27AsFYUiQ9EnXVfEJXs/m6JE1+Ox0IKuJR24
 2FGQ==
X-Gm-Message-State: APjAAAWplZDvkK3V+wiCBh6n7fcMKu9FZb3vIeGbrrCCUJbAf4Lt74Fl
 L8mDzMoZaluC87dtZ+5Vgqi7lic=
X-Google-Smtp-Source: APXvYqyfQgGOrT9ThsnJbQjUHaKtSnLHIPJhsBT8XMy6vzVDDAHDLigOB2OIEY8iBbOVlcXyZ2O+tw==
X-Received: by 2002:a05:6830:1657:: with SMTP id
 h23mr2287541otr.299.1582654674415; 
 Tue, 25 Feb 2020 10:17:54 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i7sm5569162oib.42.2020.02.25.10.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:17:53 -0800 (PST)
Received: (nullmailer pid 5252 invoked by uid 1000);
 Tue, 25 Feb 2020 18:17:53 -0000
Date: Tue, 25 Feb 2020 12:17:53 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 30/89] dt-bindings: display: vc4: dpi: Add missing
 clock-names property
Message-ID: <20200225181753.GA5213@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <042c8f676d3d863b55092bb58c1f15db95370782.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <042c8f676d3d863b55092bb58c1f15db95370782.1582533919.git-series.maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2020 10:06:32 +0100, Maxime Ripard wrote:
> While the device tree and the driver expected a clock-names property, it
> wasn't explicitly documented in the previous binding. Make sure it is now.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
