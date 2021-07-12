Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1279A3C605A
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 18:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D51895B5;
	Mon, 12 Jul 2021 16:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7C3895B5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 16:22:05 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id x10so4579972ion.9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 09:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OQl5lHjb/OmsBGI/gFWR8f+atDzQ3WELfz4e0zefRf0=;
 b=S0Humas+tA1X8yCHOAN3JRq9bnrbu1vB9Z4CMorDrrOZk+31UXZsFgbYpBBxYn4sPr
 uh8iddLMiFJIx4Qq09QhNeNNPf9BOML9oDexzZwSZfqbMIS7iwNlqLAGYyETiVNhMGuh
 pck0QocjX+FrUaGFy5/z4HdaiHMafooEYXtbK/fpPyuRKiZJVBaawcSOvxyKtqvRqs+d
 1DSSc/s2h1T5HXaxVrUxC8Gp1QCMyfMVkt699BzLetWAkM5hPK4ep4vJzi0KBUCINgxQ
 RlcdSwdVTJqio4rigMVD8XzkpDnCWtxfL2LPQd3YBG3Y4omM8PP3ogsGvuDYhTss+u7h
 rFEg==
X-Gm-Message-State: AOAM530Xlyu5qpJqgjzV+80KdFyBkVGBn+eCTh4paZVBJFhVbs9w9I+i
 tRHlpz7N3M+WHd0FsdFcsg==
X-Google-Smtp-Source: ABdhPJyHGSGtKgV06NdfXbbA53qEMa67Bq7B7JXq4S+FQYGqUQKOvc+lJo/dXqUW5FAdXIcYbFJ0/g==
X-Received: by 2002:a05:6638:348c:: with SMTP id
 t12mr40409897jal.1.1626106924794; 
 Mon, 12 Jul 2021 09:22:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id z7sm2994991iox.4.2021.07.12.09.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 09:22:04 -0700 (PDT)
Received: (nullmailer pid 2050122 invoked by uid 1000);
 Mon, 12 Jul 2021 16:22:02 -0000
Date: Mon, 12 Jul 2021 10:22:02 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: rockchip: Add compatible
 for rk3568 HDMI
Message-ID: <20210712162202.GA2050063@robh.at.kernel.org>
References: <20210707120323.401785-1-benjamin.gaignard@collabora.com>
 <20210707120323.401785-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707120323.401785-2-benjamin.gaignard@collabora.com>
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
Cc: devicetree@vger.kernel.org, algea.cao@rock-chips.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 andy.yan@rock-chips.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Jul 2021 14:03:22 +0200, Benjamin Gaignard wrote:
> Define a new compatible for rk3568 HDMI.
> This version of HDMI hardware block needs two new clocks hclk_vio and hclk
> to provide phy reference clocks.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
> version 2:
> - Add the clocks needed for the phy.
> 
>  .../bindings/display/rockchip/rockchip,dw-hdmi.yaml         | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
