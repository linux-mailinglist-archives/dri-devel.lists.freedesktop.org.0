Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F83EBD83
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 22:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E1A6E8D9;
	Fri, 13 Aug 2021 20:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEFA6E8D5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 20:41:11 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id u25so17712357oiv.5
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Aug 2021 13:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0SsWZijZ/OzRMl6BiNQIDWPa6YRhMZn0k/FbWIlqlck=;
 b=R4pF9LVbeJlR+Vf5liLtg/wdvvoZArMO8l5/ild8N8Dd+1vE5/JZqh6X9FYJPwbVuR
 wk66Ji1MTQunIFvDekEA653oZpV+l6r89AuU9ICDSdeii/FgWOiULr2H0gwEqnA0mAPZ
 rrZ9BoNPhRgUfNqzy3+ZTcCsjfdPdR13hOXH83rZfBth4NenHQtihsq5Z+NX5OLjBWFw
 IDrHqfbc11ZWvoRbhqfVVblxuwX5POmT+11gj6NCCs9NvgkRjgK7Wx47Y1jlkCYyn8pI
 GnUzaSPVyrefHANSK8FC/hBy4kP5oQI5uNc3tvguwwENIS680Tr2J8ehC7AIAdIJMMmD
 huCA==
X-Gm-Message-State: AOAM5318r8ol7v7flLSHLqCNpZPZQeVcHibB+SEtLUpCZPmQerTM8xv4
 G2ZvFlr4iiGgDdiUzb4LMw==
X-Google-Smtp-Source: ABdhPJxIe0dRYdYroVcwOivLZ7rp/imyF64v62VnramgauO11+lTL97LS3Boj1WVh+q1Hvt6OnWYLg==
X-Received: by 2002:a05:6808:98c:: with SMTP id
 a12mr3573067oic.65.1628887270318; 
 Fri, 13 Aug 2021 13:41:10 -0700 (PDT)
Received: from robh.at.kernel.org
 (2603-8080-2a06-ed00-7254-0b80-dd3c-00c6.res6.spectrum.com.
 [2603:8080:2a06:ed00:7254:b80:dd3c:c6])
 by smtp.gmail.com with ESMTPSA id z23sm573865oib.36.2021.08.13.13.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 13:41:09 -0700 (PDT)
Received: (nullmailer pid 3992679 invoked by uid 1000);
 Fri, 13 Aug 2021 20:41:08 -0000
Date: Fri, 13 Aug 2021 15:41:08 -0500
From: Rob Herring <robh@kernel.org>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: thierry.reding@gmail.com, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, daniel@ffwll.ch,
 phone-devel@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, airlied@linux.ie
Subject: Re: [PATCH v2 1/2] drm/panel: Add DT bindings for Samsung S6D27A1
 display panel
Message-ID: <YRbY5OMjxQxA2CDb@robh.at.kernel.org>
References: <YQw7M7OF6OZLcLjk@ravnborg.org>
 <20210807133111.5935-1-markuss.broks@gmail.com>
 <20210807133111.5935-2-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210807133111.5935-2-markuss.broks@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 07 Aug 2021 16:31:10 +0300, Markuss Broks wrote:
> This adds device-tree bindings for the Samsung S6D27A1 RGB
> DPI display panel.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> 
> v1 -> v2:
> changed additionalProperties to unevaluatedProperties;
> added vci-supply and vccio-supply as required;
> ---
>  .../display/panel/samsung,s6d27a1.yaml        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
