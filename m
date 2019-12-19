Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BF7126ADD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 19:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4356E0A2;
	Thu, 19 Dec 2019 18:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AF66E0A2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 18:51:44 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id w1so8396307otg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:51:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jDKOiQm6CiWD+arXinOt70p97gMJaj5GatnJKvcbSa8=;
 b=t1o2NkfOGKFsZbp0njQnCr//jHCgJM7ElszdJWVlOwwZiSpI+cvmbNzcdVLZqBxGrK
 085Qzk9MG59fzeR1lP3RhBmxaIfAhWqJKJkL797LY+b1ftVr1SY54QoR3cAL3KQtKp1l
 tzg+eCAT/IXn3b1mtMo8G1Mps6GP4TGFYGRNKSKtvOQ4Nv92JRx7U+fNP+5zF7EfILvF
 T+78m2oBICIO9WHqsaa1bPf0Gy0yeJ/EgYJ0dtOFIsE0f0MlTxLguHTQUXAmdJo4qchv
 ipV0XRkPGQyVO+Ps2x3WvtL5GDtNvJwG0UNI8sjOq7Sfao+JzGNKCC27kQIG7LRvDqZu
 udWw==
X-Gm-Message-State: APjAAAVKQBndv3CwraW15bR1qBfM0FR/ZS+gjvEUyIKF8i756HFuigc2
 YKZZzGpXAb8jknAAfp4i7A==
X-Google-Smtp-Source: APXvYqyWxNLUP+RbaYbruoe6GyTJmpo9lUdUShr+XyCaG4pNGZfSjVIJwUXJQ6K1i5tp+MCBImVxkw==
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr10709067otq.281.1576781503951; 
 Thu, 19 Dec 2019 10:51:43 -0800 (PST)
Received: from localhost ([2607:fb90:bdf:98e:3549:d84c:9720:edb4])
 by smtp.gmail.com with ESMTPSA id a136sm2272824oib.28.2019.12.19.10.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 10:51:43 -0800 (PST)
Date: Thu, 19 Dec 2019 12:51:41 -0600
From: Rob Herring <robh@kernel.org>
To: Jyri Sarha <jsarha@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: DT schema for
 rocktech,rk101ii01d-ct panel
Message-ID: <20191219185141.GA31089@bogus>
References: <cover.1575903975.git.jsarha@ti.com>
 <60034f9cd4580bf3b7c8c5c87bb9247fdc3f345a.1575903975.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <60034f9cd4580bf3b7c8c5c87bb9247fdc3f345a.1575903975.git.jsarha@ti.com>
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
Cc: devicetree@vger.kernel.org, tomi.valkeinen@ti.com, thierry.reding@gmail.com,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Dec 2019 17:45:40 +0200, Jyri Sarha wrote:
> Add DT schema binding for Rocktech Displays Limited RK101II01D-CT
> 10.1" TFT 1280x800 Pixels with LVDS interface, LED Backlight and
> capacitive touch panel.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>  .../display/panel/rocktech,rk101ii01d-ct.yaml | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/rocktech,rk101ii01d-ct.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
