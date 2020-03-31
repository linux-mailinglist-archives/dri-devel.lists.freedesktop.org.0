Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 393B219A1A2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 00:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47F36E370;
	Tue, 31 Mar 2020 22:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12D06E370
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 22:07:20 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id n13so13750574ilm.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 15:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gwWUAkb8abOTifbHiNXnwsQ9Dtd0p1eR1MIaYvko6Eo=;
 b=FrQ8qM9kfVEOOXJQ5keeOyhtWq2/ga2X0MgO8hNZn62WcUCbqeDk2Xn1T6KYwIMeoJ
 7j+pEEPBOuqvgzFte/KkN7nYBPKTFG9MsjXHwqRT8PLiPvj/FT12y/FdaTT1VUIpfkYg
 y4HSTCJevisCDrbwqKtzoec6oWldIfQuJBTHGYZkTOZlZV7VJethpWRF0TjTMFQ5B4nV
 xyL9FKkTsUVqMVHLTtmIiB5Xyvjmdncs8wlLHAADENzETL9Kqvit/0PDDHTNBWE7bFw5
 3dq0zxkBzumLI3e0GIlSe0AE9FOyOpx8927qHnuTcLbXmIoGHH2+N4cuWTEGp9ZIQNDO
 oi1w==
X-Gm-Message-State: ANhLgQ0sdxV7Uh7aNgQASeKEtCm5dMKI4Z7T4VrnsLIXKlNEd+I6ImQ0
 t7q0+8B9om+TzeOw5q/IlA==
X-Google-Smtp-Source: ADFU+vtDNeOnim0HaWP5CQDpX6NvB9k8NLTc28IoNQAKLHA3sOrQLqnEllJxTDgRB6tbM1TZC74HUw==
X-Received: by 2002:a92:5bd7:: with SMTP id c84mr19057734ilg.26.1585692440128; 
 Tue, 31 Mar 2020 15:07:20 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id g78sm50132ild.36.2020.03.31.15.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 15:07:19 -0700 (PDT)
Received: (nullmailer pid 32334 invoked by uid 1000);
 Tue, 31 Mar 2020 22:07:18 -0000
Date: Tue, 31 Mar 2020 16:07:18 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH] dt-bindings: display: meson-vpu: fix indentation of
 reg-names' "items"
Message-ID: <20200331220718.GA32235@bogus>
References: <20200328004157.1259385-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328004157.1259385-1-martin.blumenstingl@googlemail.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com,
 airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 28 Mar 2020 01:41:57 +0100, Martin Blumenstingl wrote:
> Use two spaces for indentation instead of one to be consistent with the
> rest of the file. No functional changes.
> 
> Fixes: 6b9ebf1e0e678b ("dt-bindings: display: amlogic, meson-vpu: convert to yaml")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
