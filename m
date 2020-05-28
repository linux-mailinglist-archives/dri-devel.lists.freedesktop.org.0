Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9431E6C52
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 22:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852046E5CA;
	Thu, 28 May 2020 20:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFED56E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 20:17:30 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id d1so195912ila.8
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 13:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=89I7qlCTtqr412/2HNZ2mWAqiaX7Wsv+rz/qqSYUNPk=;
 b=EBaB6RDj8EevQLfHiu3FipI4+5iKJPZuEIGLjRQHjkAMDlEIS7nuC7KMcDQpElTUTX
 JvhVMGF7i3BvRqvEYlop9T4zq+2rJbO+VYFqViqrwROqdecerMQsbDpl3C6l5UizU2So
 WvoJ0Vwl5JLP3TyvGwIVN58+ZpeIcqRXyr84YI+c0k8S9pcodUbRRtVC9uuoOuWDVA5r
 IO4JPHARjKeK8npZZws/os5IwW5BeCcwpUyUcDLxPgSQtvW3mTuw9RzKJQ4iBeskO2Do
 DYmMFkycBxysW6Vgj1CoCak0RL74KBOjIbgKd7bAC5UK358W0VsSRErrv/zyOj+olZiT
 jWLg==
X-Gm-Message-State: AOAM5324HKlIvvMLLwwkVT98wqr+EdNXWRHeJc3To8FZlrCcry2bKTpC
 E6SUiv1jBvwbbzOuZnfhQg==
X-Google-Smtp-Source: ABdhPJw5xVvbW66Siyuk+HvVdcGCUwANpqhOcL7xjknAhMFGF/KmArF+e8Aj9e202XVt5qf+XKjY7Q==
X-Received: by 2002:a92:ce8e:: with SMTP id r14mr4563184ilo.265.1590697050149; 
 Thu, 28 May 2020 13:17:30 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id v15sm3828753ila.57.2020.05.28.13.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 13:17:29 -0700 (PDT)
Received: (nullmailer pid 608748 invoked by uid 1000);
 Thu, 28 May 2020 20:17:28 -0000
Date: Thu, 28 May 2020 14:17:28 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 01/12] dt-bindings: display: Convert ingenic,lcd.txt to
 YAML
Message-ID: <20200528201728.GA608691@bogus>
References: <20200516215057.392609-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200516215057.392609-1-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, od@zcrc.me,
 "Rafael J . Wysocki" <rafael@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 16 May 2020 23:50:46 +0200, Paul Cercueil wrote:
> Convert the ingenic,lcd.txt to a new ingenic,lcd.yaml file.
> 
> In the process, the new ingenic,jz4780-lcd compatible string has been
> added.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     This patch comes from a different patchset so it's effectively a V2.
> 
>     Changes were:
>     - lcd_pclk and lcd clocks are in the correct order now,
>     - Add 'port' and 'ports' properties, and document the valid ports.
> 
>  .../bindings/display/ingenic,lcd.txt          |  45 -------
>  .../bindings/display/ingenic,lcd.yaml         | 126 ++++++++++++++++++
>  2 files changed, 126 insertions(+), 45 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
