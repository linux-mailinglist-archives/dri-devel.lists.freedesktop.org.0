Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D88243BDF5
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 01:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666726E4CF;
	Tue, 26 Oct 2021 23:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11A96E4CF
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 23:36:11 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id z126so897634oiz.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 16:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aL27fpyh+m4rC09TIGIfGG4t2Fp9eQL4JHIxdInBGZA=;
 b=ckPRBva3+0qZO82LwunxiHqY28NNG+qoeb9ioxuxrxboJF6RqEqPZHOdlLz5k/sujd
 tfCXu27Tlrhz8z8ePsu7NO4VI8CYYb47dj+f88cKvRXM4YEyy0OqwOoEcK2idvQDX/rR
 ydtbNGPU6ut3lxaMFDAR5Jw1WuPtKaWzXzBAdQPbprgAqRe48mchDOUMU0SI4CPSaBWz
 oDSqLndTk17jXM1pEHOYuE4sI0Igl+oiLza7Kn9EaOkEqgyzsI9BYw4IQyCs0F9I9KqV
 PRQ1XmbfwqW6uxc1PflHijEDaTk2NYxFwlltEFEGNlawRwf9Y/c3FKL6Pg8bMLd+Ev1c
 Lm7g==
X-Gm-Message-State: AOAM53320XbRS9+N056ZeSuNvc9uncWRdV/O2WRYvlEiF79hJYteMMfj
 fS1xWTVlNGNrS4MzuN0Dqw==
X-Google-Smtp-Source: ABdhPJyZ7JY+ahGPMk0kwlKWneszs92Rj1q/CcqeR9fru4UgGFV50VtR3x/IWVNI5i5R53ptJFSmjw==
X-Received: by 2002:a05:6808:14c2:: with SMTP id
 f2mr1324097oiw.99.1635291370941; 
 Tue, 26 Oct 2021 16:36:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w17sm5125073otm.50.2021.10.26.16.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:36:10 -0700 (PDT)
Received: (nullmailer pid 3536854 invoked by uid 1000);
 Tue, 26 Oct 2021 23:36:09 -0000
Date: Tue, 26 Oct 2021 18:36:09 -0500
From: Rob Herring <robh@kernel.org>
To: Xin Ji <xji@analogixsemi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, hsinyi@chromium.org, zhenli@analogixsemi.com,
 mripard@kernel.org, airlied@linux.ie, span@analogixsemi.com, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, bliang@analogixsemi.com, drinkcat@google.com,
 broonie@kernel.org, ricardo.canuelo@collabora.com, daniel@ffwll.ch,
 laurent.pinchart+renesas@ideasonboard.com
Subject: Re: [PATCH v11 1/4] dt-bindings:drm/bridge:anx7625:add vendor define
Message-ID: <YXiQ6Q8zhY+RZRue@robh.at.kernel.org>
References: <e5f8aed7556535aeaf07b148bdbca7f5aec28203.1628161369.git.xji@analogixsemi.com>
 <20211018030323.2055114-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211018030323.2055114-1-xji@analogixsemi.com>
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

On Mon, 18 Oct 2021 11:03:23 +0800, Xin Ji wrote:
> Add 'bus-type' and 'data-lanes' define for port0. Add DP tx lane0,
> lane1 swing register setting array, and audio enable flag.
> 
> The device which cannot pass DP tx PHY CTS caused by long PCB trace or
> embedded MUX, adjusting ANX7625 PHY parameters can pass the CTS test. The
> adjusting type include Pre-emphasis, Vp-p, Rterm(Resistor Termination)
> and Rsel(Driven Strength). Each lane has maximum 20 registers for
> these settings.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> ---
>  .../display/bridge/analogix,anx7625.yaml      | 65 ++++++++++++++++++-
>  1 file changed, 63 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
