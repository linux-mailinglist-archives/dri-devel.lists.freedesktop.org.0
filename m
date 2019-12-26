Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A3F12AFC0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2019 00:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE68F89D89;
	Thu, 26 Dec 2019 23:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6C389D89
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 23:28:33 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c16so22979660ioh.6
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 15:28:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P9UdJ2EHCBfkgfAjYdg3N8nSpHkPs/odiwnqsSsf3dg=;
 b=kd9qO9SDi4uBm4TvkLf6/YvH0ZtkeGxb/uNCIWLT1lS/1u3u2BpNVeiOhgGaiEe9IR
 ELG0sg3GIfR2mJA/IL14RZXTLq3Z9Edhc+3Bm6+31BGJs0DiTOBKlUWA5WKwt18UIMay
 EdgaiTkK6UxsZoaHMgkLagsm4rCcldfJggRaqzkPtVQtjMS4lHzrTSY5Gxr3tIeuq2ly
 u1b1btbOrKt0wy7RQ4Aare+R31BjP5cZCa+Y0Tiz6Q/wy6RpxX43ycKdceySBibwADxl
 qvuzJbkxKSP6daNHEfvrURTqRrGLCv6dWkXkAw1lNSewsleHWN/l4WFmcnPxMt8kOxvL
 Jyyg==
X-Gm-Message-State: APjAAAXTg2SWYC02j9oblMR+bD3K8aKh3H59oCNRx6JhcxL8Sd+kyPBc
 9H3iE6i+yf/Nu52lgaJTM84kGzo=
X-Google-Smtp-Source: APXvYqzCdBBCz4heOHZ1/P78xQ3mabWQ4T11IcgNKpy4cZMKFSpw5EpztaTxRlx7ILKDEPxJChsm6w==
X-Received: by 2002:a6b:7201:: with SMTP id n1mr29057420ioc.37.1577402912865; 
 Thu, 26 Dec 2019 15:28:32 -0800 (PST)
Received: from localhost ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id a7sm8946258iod.61.2019.12.26.15.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 15:28:32 -0800 (PST)
Date: Thu, 26 Dec 2019 16:28:31 -0700
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v4 2/3] dt-bindings: display: panel: Add binding document
 for  Leadtek LTK500HD1829
Message-ID: <20191226232831.GA7084@bogus>
References: <20191224112641.30647-1-heiko@sntech.de>
 <20191224112641.30647-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224112641.30647-2-heiko@sntech.de>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, maxime@cerno.tech,
 sam@ravnborg.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Dec 2019 12:26:40 +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> 
> The LTK500HD1829 is a 5.0" 720x1280 DSI display.
> 
> changes in v2:
> - fix id (Maxime)
> - drop port (Maxime)
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> ---
>  .../display/panel/leadtek,ltk500hd1829.yaml   | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
