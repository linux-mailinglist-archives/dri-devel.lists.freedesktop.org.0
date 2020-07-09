Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945E21ABB4
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 01:36:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D1D6EB4E;
	Thu,  9 Jul 2020 23:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101886EB4E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 23:36:23 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id o3so3505494ilo.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 16:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vy5gFIdZ6QSGlG4Cu3mgACyqBbE7i2Yobo53B4I5b5Y=;
 b=ofhkRq6ey7Z3Cb/ciVmAUzVmKbWP4Vu0gdVxK/qFg76yfl2SPNfSeoNkB549cVE9Si
 H4Sn2wXt0Ng5ium0Sd+Ny3uXljr/DnBPxIMkiQQA6U+do7QhuAMAfAEKs+YtSS3uvUvw
 CSqAMrZKJCEmPiqN26oPb7R35ueYHBMXfGs7COWa4VZUs8MiZhHLQUJR98YLe97OrlmM
 jF73A0d8oQF1LUYAqe+Eddq57hziBeJFodgEQstrNYkOiHhLmrhFGT42dNc/wKEmI7gf
 /Ai9dybUo0IWxM2uSIledenP5d4caAKU+5/cmV6H6w1bJ2J4X58YsOeA4XCNJVoRiuXx
 Ryzg==
X-Gm-Message-State: AOAM532lOore5XikyjCDfxzUAWheQhNGeA7NwFAVajIWJPBI0JHykpcA
 OQs3iNHa6dHnmF6Mbm9sDw==
X-Google-Smtp-Source: ABdhPJxU0lDMGaiFiH5P6n2Dqzw0pN2vG0zjwrwuf8K57itQWDWpHiR9YfWF3FBaVNt9bIFjoSGrzA==
X-Received: by 2002:a92:bac4:: with SMTP id t65mr51529586ill.138.1594337782464; 
 Thu, 09 Jul 2020 16:36:22 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id q2sm2596921ilp.82.2020.07.09.16.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 16:36:22 -0700 (PDT)
Received: (nullmailer pid 1112131 invoked by uid 1000);
 Thu, 09 Jul 2020 23:36:20 -0000
Date: Thu, 9 Jul 2020 17:36:20 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: display: convert samsung, s6e8aa0 to
 DT Schema
Message-ID: <20200709233620.GA1112038@bogus>
References: <20200704102806.735713-1-sam@ravnborg.org>
 <20200704102806.735713-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200704102806.735713-3-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Zhong <zyw@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 04 Jul 2020 12:28:05 +0200, Sam Ravnborg wrote:
> v2:
>   - Add missing types (Rob)
>   - Fix example to specify panel@0 (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/samsung,s6e8aa0.txt         |  56 ----------
>  .../display/panel/samsung,s6e8aa0.yaml        | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
