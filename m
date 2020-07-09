Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C5721A93C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 22:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE726EB31;
	Thu,  9 Jul 2020 20:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7DB6EB31
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 20:42:54 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id r12so3219162ilh.4
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 13:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QRIStQyCkIoaSqHfpji8UZGXhFbUGYsTTZ730xKq2G4=;
 b=CYtseDrWOki25OZxbHZGkManWf5RzTUKCENZDj9VhAVbXdWPZEVLGlzQ+2Z0sl0phP
 83FZW3k0wLa7kUxU/QQyJ8gbqdUyigTcW2K+PQVXGtf7+HGb/I6GK6WIour1qO9K6DBf
 YLTMuQm+7Gp00AH/uMo9wA0Pg/PlyYQ8Ne1CKqpDs3vpQZzmm/LMLBCu+4AhISWlYaTy
 aopigvwmXDCe3O83B1hAPn2XW2NyHXzqhZ6uy6xzSLEMGeC0K8peJbl6JcnjYQYpX+6Z
 GsmtHyjnK6vVzxOAQm7GIfMmBo5Jkhbjq5eLghaWL9BVqCOaU4vBt6a7RdSBkCIFQ/gv
 hFYA==
X-Gm-Message-State: AOAM532MkL2u3WethWLdQuG9NcuFfPppTVTetwOLFAon9WpOHjRm622A
 OnbjcWLfQ6C0W8a7tE5gXg==
X-Google-Smtp-Source: ABdhPJxRpTkSd/WJSCFIsf6B49REhAYLdyj/koXazQPOq/svM5+yEgb4ot3AwlT930+WE7ERTMlHLg==
X-Received: by 2002:a92:1805:: with SMTP id 5mr45546138ily.127.1594327373701; 
 Thu, 09 Jul 2020 13:42:53 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id z20sm2690327iot.15.2020.07.09.13.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:42:53 -0700 (PDT)
Received: (nullmailer pid 853786 invoked by uid 1000);
 Thu, 09 Jul 2020 20:42:51 -0000
Date: Thu, 9 Jul 2020 14:42:51 -0600
From: Rob Herring <robh@kernel.org>
To: Vinay Simha BN <simhavcs@gmail.com>
Subject: Re: [PATCH v7 1/2] dt-binding: Add DSI/LVDS TC358775 bridge bindings
Message-ID: <20200709204251.GA853727@bogus>
References: <20200704092511.20856-1-simhavcs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200704092511.20856-1-simhavcs@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 04 Jul 2020 14:54:39 +0530, Vinay Simha BN wrote:
> - converted from .txt to .yaml
> - dual-link lvds port added and implemented
> - dsi data-lanes property removed, it will be picked
>   from dsi0 ports
> - VESA/JEIDA formats picked from panel-lvds dts
> - proper indentation
> - single-link and dual-link lvds description and
>   examples are added
> - license modified to (GPL-2.0-only OR BSD-2-Clause)
> 
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> 
> ---
> v1:
>  Initial version wast .txt file
> 
> v2:
>  From txt to yaml file format
> 
> v3:
> * Andrzej Hajda review comments incorporated
>   dual port lvds implemented
> 
> * Laurent Pinchart review comments incorporated
>   dsi lanes property removed and it is dynamically
>   picked from the dsi ports
>   VESA/JEIDA format picked from panel-lvds dts
> 
> v4:
> * Sam Ravnborg review comments incorporated
>   }' is indented properly in examples data-lanes
>   description for single-link and dual-link lvds
> 
> v5:
> * Sam Ravnborg review comments incorporated
>   license modified to (GPL-2.0-only OR BSD-2-Clause)
>   changelog added
> ---
>  .../display/bridge/toshiba,tc358775.yaml      | 215 ++++++++++++++++++
>  1 file changed, 215 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358775.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
