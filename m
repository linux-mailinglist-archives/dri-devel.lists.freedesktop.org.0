Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6311A8A42
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE466E536;
	Tue, 14 Apr 2020 18:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6116E536
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:52:59 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f52so747580otf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:52:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vBZW4t/QR6QOLzl/ULJ1MHgp2jUs56TsnBvH3b8AW/Y=;
 b=pwACIvA62cLFZ7RUezSmVg3L1kaIJCe35MR8c3Uf98ngjJZO3NNOZg/r/4yjAoTntP
 iyMfmP6ndVg4/jcKEnBOit9pzHirCvOCbNMBTRshcGxhzMxhsrvV9E7G18mBHwbt0yJD
 dTP01qTHQAFEFNuacd1NUXIJ+g11TklVBzkXn2FjkYLCgiQ8wDjn7E6C2w5DpizRV24J
 ZhQJllYXt4DkzlZNRw2ZYOJxDFTjn9anvffCC0echig0etSh82NoUX1sl8FliGcz/nPX
 PpkJoVs09gBcp9PvkJhhyYgGcdrtNOHONJz1zIpQfdazjk9GRjWSChfbPmaoR4rK9xRZ
 sOyQ==
X-Gm-Message-State: AGi0PuYuXOYfSBd7B0p1iTACrk/RJIqNXEY8r0mS5WjWVobQ0qVpagv7
 gyQyHpaNhYG0p3Dujep30A==
X-Google-Smtp-Source: APiQypIvDthHOU9FMjetA2A+LsuxKXj3r8h27pVbxCJLM5178ny/A/1RuyJx24uUsw812iIqgdpnSw==
X-Received: by 2002:a9d:907:: with SMTP id 7mr19508096otp.312.1586890378740;
 Tue, 14 Apr 2020 11:52:58 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c81sm5537585oib.35.2020.04.14.11.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:52:58 -0700 (PDT)
Received: (nullmailer pid 7412 invoked by uid 1000);
 Tue, 14 Apr 2020 18:52:57 -0000
Date: Tue, 14 Apr 2020 13:52:57 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 27/36] dt-bindings: display: convert sitronix,st7789v
 to DT Schema
Message-ID: <20200414185257.GA7358@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-28-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-28-sam@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:51:00 +0200, Sam Ravnborg wrote:
> v2:
>     - dropped use of spi-slave.yaml (Maxime)
>     - added unevaluatedProperties (Maxime)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/panel/sitronix,st7789v.txt        | 37 -----------
>  .../display/panel/sitronix,st7789v.yaml       | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
