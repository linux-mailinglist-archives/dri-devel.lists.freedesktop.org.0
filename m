Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31203274E55
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 03:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC776E0C6;
	Wed, 23 Sep 2020 01:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828BC6E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 01:28:24 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id y2so8555610ila.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 18:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wOFsOWTjSL4FRYR4bymj2SkxEWR6B/1aPP2FtvhSKOI=;
 b=FPPTKQRuvbyDjU/3PFM5oV0HrVP/wxEMH/ggXARzoKJO0Wu9et/tKJREhUKbS/KhXr
 /Ich1EKcwWjWE1f7wNKd0glucVj9ytdHzvMEIHgy0Q1GwtkCQEiinqF8RaXwQtBclfIo
 cbesPqaEKuZj9+wStMy6fnFou/S4IoPx9ljokVZaUn9iuZQWKMfTBooNDN9G4KVrC4Lg
 Wh/5iVew8FgnL/Ykcmp3Abi4i1MxikMZkTYqpT63Fh9SpI9vszi6h1O+waX+lTkDUO+A
 F9iFU9F0d++wiacOMlqHF/+SAiZSyX4iUkiOgaj0tHUO9P98NVg0n2uGZjytj9lcpTYJ
 PxtA==
X-Gm-Message-State: AOAM5329kxGmsDwinvV2X07UepDDRm75k2Ozqcn/H2YDw226tIqaBtzq
 VYkgGSSKL8vfWjvGt/FLZQ==
X-Google-Smtp-Source: ABdhPJyH2nFFin5pTlEaPxsP4fOtHfm6oOn+qr9bRGNajCNvS0DOljj+PsMwGVw/ytYsc0e+Uq3tYQ==
X-Received: by 2002:a92:c7ac:: with SMTP id f12mr6724566ilk.2.1600824503966;
 Tue, 22 Sep 2020 18:28:23 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id u14sm9873738ilj.7.2020.09.22.18.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 18:28:23 -0700 (PDT)
Received: (nullmailer pid 3656192 invoked by uid 1000);
 Wed, 23 Sep 2020 01:28:22 -0000
Date: Tue, 22 Sep 2020 19:28:22 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: display: panel-simple-dsi: add
 optional reset gpio
Message-ID: <20200923012822.GA3656163@bogus>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
 <20200915121912.4347-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915121912.4347-3-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 linux-amlogic@lists.infradead.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Sep 2020 14:19:10 +0200, Neil Armstrong wrote:
> Simple DSI panels can also have a reset GPIO signal in addition/instead of an
> enable GPIO signal.
> 
> This adds an optional reset-gpios property.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml      | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
