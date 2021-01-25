Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482F3302D3E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 22:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1489E6E284;
	Mon, 25 Jan 2021 21:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115346E284
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 21:08:00 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id w8so16316766oie.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 13:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OyZ3sXxCLqUPY7JLsfpHINHMPH4aj75GZUw/7sIKEoM=;
 b=k6W++EctxBAAjWyf8KIm3qRLikaJSbrpMHJh0svMDIPHPfB5y09Ri719IXdUmZ5v/a
 8QKng3cdPrbt03i6ZEORRsX+KBny80Jt5aMp7Ra/deWBW1ezjUmxB9BejgxwRVFhgV9g
 4/v2Q+aBFR7tIF8ltaPsh7ru8AZ0GZToQPkf6seW+jjuAtWXaRy2GPKgOMhxq0Pz9SCt
 JqCm0ozkqXIUO9zDag3M9Psa5M0g7un0ixl3t4hnT7rLFYbG8jmFn304/SNIZfCu5d4G
 qNADJYI4CsUIMEfxHSd3bJTAfNMVi3NML/w6JUxmnTi6IzYlaN+we4WEXr1ViRbuf/hE
 rrHg==
X-Gm-Message-State: AOAM531KPPMUDwaaK46/Dqect8ghFrcOfCjqxK0Tvfg6yMiFmnDvRqUa
 B4wBCe3f3m3+D1Jzkbn/Rw==
X-Google-Smtp-Source: ABdhPJzykJRAMbLN4dd0cZ2cDPvP/gWeRpNuaqthhx4O5bB0tqNjiJ5dBnmXqclqbTa9ZAvggGELQw==
X-Received: by 2002:aca:5088:: with SMTP id e130mr1262763oib.78.1611608879364; 
 Mon, 25 Jan 2021 13:07:59 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l110sm2675851otc.25.2021.01.25.13.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 13:07:58 -0800 (PST)
Received: (nullmailer pid 994286 invoked by uid 1000);
 Mon, 25 Jan 2021 21:07:57 -0000
Date: Mon, 25 Jan 2021 15:07:57 -0600
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH V4] dt-bindings: gpu: Convert v3d to json-schema
Message-ID: <20210125210757.GA990430@robh.at.kernel.org>
References: <1610564917-11559-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610564917-11559-1-git-send-email-stefan.wahren@i2se.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021 20:08:37 +0100, Stefan Wahren wrote:
> This converts the v3d bindings to yaml format.
> 
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
> 
> Changes in V4:
> - define order for required reg-names
> - adapt example
> 
> Changes in V3:
> - drop redundant maxItems in case we already have items defined
> - fix order of reg-names enum
> - tag required items in description
> - add reg-names to required properties
> - drop clock-names
> 
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.txt       | 33 ----------
>  .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml      | 75 ++++++++++++++++++++++
>  2 files changed, 75 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/brcm,bcm-v3d.yaml
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
