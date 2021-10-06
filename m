Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 654B04247FE
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 22:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4D096EE70;
	Wed,  6 Oct 2021 20:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04596EE70
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 20:35:00 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 u20-20020a9d7214000000b0054e170300adso4659344otj.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 13:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E7TG+Uac4bJI7YKY+TM3uFDkJ28g/4VdhiFymUZGx+g=;
 b=w6HRnjfIXnhzFNVSf0amJNkgX1LTrWNk808eYksN/q0w1/NAmzJW70Zik5m2ZqDdCe
 UM3cx/AWcXI2o+8TkHXXT1GAwiSWEaUKS0wHz8z78rW7Go/JT+QRe8rfq2IrT1lZNO2i
 Pd8c1TNjwaMi5NmLy4SEVkO0+21RtxU8hRgpw+IkuNQG061bQqzDFY6MMzQ3TbZLkidj
 d/q+KCKGMnHH8DBfR8iC3IJ8oQ6TrlToOyKQ0xvBz+JBTeWkyoojlgsi2vIAG59LNwxi
 O2yMwoMDE1ZBvF/c57f1XOPK8HgjnfcbBHS5CkdvefoNT3U3s8CTv/0iw/E4GVcMNYhB
 hlew==
X-Gm-Message-State: AOAM533V7AsP6tBPFckKl1zSLTkF6+zejiD2VxEajOqoNjRKTbkryP2p
 bHd9I5OAmoGWVfXiCxbsrA==
X-Google-Smtp-Source: ABdhPJxbEWwDH9gdxDVfwWllfZTAK9KZZ4LOqy8pBSoAuEChSsWJ4j6phpzKcAtlTbWut41rkvsvqQ==
X-Received: by 2002:a9d:17c5:: with SMTP id j63mr268795otj.191.1633552499973; 
 Wed, 06 Oct 2021 13:34:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w141sm315186oif.20.2021.10.06.13.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:34:59 -0700 (PDT)
Received: (nullmailer pid 2823957 invoked by uid 1000);
 Wed, 06 Oct 2021 20:34:58 -0000
Date: Wed, 6 Oct 2021 15:34:58 -0500
From: Rob Herring <robh@kernel.org>
To: Philip Chen <philipchen@chromium.org>
Cc: Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Balletbo i Serra <enric.balletbo@collabora.com>, dianders@chromium.org,
 Nicolas Boichat <drinkcat@chromium.org>, swboyd@chromium.org,
 LKML <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] dt-bindings: drm/bridge: ps8640: Add aux-bus child
Message-ID: <YV4IcnuERzAxckIV@robh.at.kernel.org>
References: <20210929173343.v2.1.Ib7e63ae17e827ce0636a09d5dec9796043e4f80a@changeid>
 <20210929173343.v2.2.I6050ba184b24d887e92692a72ee3054d643d6091@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929173343.v2.2.I6050ba184b24d887e92692a72ee3054d643d6091@changeid>
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

On Wed, 29 Sep 2021 17:34:57 -0700, Philip Chen wrote:
> dp-aux-bus.yaml says we can list an eDP panel as a child of
> an eDP controller node to represent the fact that the panel
> is connected to the controller's DP AUX bus.
> 
> Let's add it to the ps8640 bindings.
> 
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  .../bindings/display/bridge/ps8640.yaml       | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
