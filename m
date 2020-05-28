Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B54E21E6CD9
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 22:49:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806186E7D0;
	Thu, 28 May 2020 20:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8DD6E7D0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 20:49:51 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id q18so325646ilm.5
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nSZ/8oTeGMv6mm5ev1BizJPaVqmDK8O3m6OqeHoCqSM=;
 b=uQPI+MnhgYMi6+Iib+WPxgWp5mvBA6O5gMDkEH9tXdEMV3ABK37G27QFz/PbZzlEAM
 lOpAF2RGwXh3iiwqfmbY+/2obwsmBsHGBnc/lM4PXqSHSiC9Wj1hC90CzHB4d97A2sfT
 xy4jmEV+m9g+YLUtvGFqm/ounIqqY/smTlVUpePB5ov+D9Y7fSwBcX1eqNvFtz9rWjGo
 G8yVyRymWZep6/6Hq12p9Fk7WSPPjcHLut5t/bTriTCnZDods8jVSL4bsfCWXaSKTJcf
 ssBNbHZLmh5aaxnilOi/FPFT/3FVO6iQSHChVmTHhVPH1kaXsjGWQiYkdLaKgJXqM/MR
 ub7A==
X-Gm-Message-State: AOAM531k0fW/jgiOzqAh+3jkuFlEUPS+bcaXNr3PPg2lELVYK+yd42kc
 UzH7EPw3H2IhHX/2siM8gQ==
X-Google-Smtp-Source: ABdhPJw7/NSMKWDXcM8J2GXfV1LVjCAv7PFbVY4HduH122XtdzecNPaZbBNJXvaB2WOxTkpJtUWWXQ==
X-Received: by 2002:a92:de02:: with SMTP id x2mr4659376ilm.267.1590698990861; 
 Thu, 28 May 2020 13:49:50 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id 129sm2825664ioy.0.2020.05.28.13.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 13:49:49 -0700 (PDT)
Received: (nullmailer pid 652010 invoked by uid 1000);
 Thu, 28 May 2020 20:49:47 -0000
Date: Thu, 28 May 2020 14:49:47 -0600
From: Rob Herring <robh@kernel.org>
To: dillon.minfei@gmail.com
Subject: Re: [PATCH v4 5/8] dt-bindings: display: panel: Add ilitek ili9341
 panel bindings
Message-ID: <20200528204947.GA651938@bogus>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-6-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1589800165-3271-6-git-send-email-dillon.minfei@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org, robh+dt@kernel.org,
 thierry.reding@gmail.com, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, sam@ravnborg.org,
 linux-clk@vger.kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 May 2020 19:09:22 +0800, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Add documentation for "ilitek,ili9341" panel.
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  .../bindings/display/panel/ilitek,ili9341.yaml     | 69 ++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
