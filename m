Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCEC16EDCE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92A26EB7D;
	Tue, 25 Feb 2020 18:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6086EB80
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:18:55 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 77so419493oty.6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RPJpzQ7qVLMRwYfQxH0mQ4XcwC515bx4Mj+WIiFTEM8=;
 b=Iw9ujuEsc+IXV+xuwxvRY7bc7NhI2N7Dqg3tV6F/rycRdNNfi1FM2NrpHTqjVkKbIf
 7gUtRTPrTz+bGaIQGtZCB2vhR0nBskQl8B5yQts8pcvDrNzAqt7gnTLfQKr3EARMgGQI
 Q/Io+YtIfjHcqRYI66vJYPRHwSGLbrU+uX6FcRHoUDkFE3OnRksDZsANQNyQ4FjUBgzC
 t9JHu36yvkygGFBwUFYvcIxEt70F+Pweu+Ll+bHKqb9TP6YioyGmqSQrJl3TSU/3q80x
 BS68GJTWjNDf1YWQ+q34DrUI5qrv8qWiCZUO3W1S2d1z/PlxRISMnuKBduEUG8hLLmc+
 6nQA==
X-Gm-Message-State: APjAAAW1VvFOupwSlKjCgNIYwVk9xsCUMdbFdIQkBMHe6xm2tBLNGGNQ
 E9FcCA/ED1vw6WhbTa3peQ==
X-Google-Smtp-Source: APXvYqwEScy4jWFHUW9DGv/Sg6SXMs0ZEWy29yqmpSnpIXZifq4TCxqdxvNoIQACN+DtxZDdqznkKA==
X-Received: by 2002:a9d:784b:: with SMTP id c11mr43420213otm.246.1582654734973; 
 Tue, 25 Feb 2020 10:18:54 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 9sm5897437otx.75.2020.02.25.10.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:18:54 -0800 (PST)
Received: (nullmailer pid 7004 invoked by uid 1000);
 Tue, 25 Feb 2020 18:18:53 -0000
Date: Tue, 25 Feb 2020 12:18:53 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 33/89] dt-bindings: display: vc4: Document BCM2711 VC5
Message-ID: <20200225181853.GA6954@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <d8df122abf3875d9924a20996673bea49174dbb1.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8df122abf3875d9924a20996673bea49174dbb1.1582533919.git-series.maxime@cerno.tech>
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

On Mon, 24 Feb 2020 10:06:35 +0100, Maxime Ripard wrote:
> The BCM2711 comes with a new VideoCore. Add a compatible for it.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
