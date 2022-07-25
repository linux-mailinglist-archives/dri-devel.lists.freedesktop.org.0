Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301A258084D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB3410ED38;
	Mon, 25 Jul 2022 23:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737C410ECA3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:34:20 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-10d867a8358so16742534fac.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=o3KszqdegW1rCrrRVqTd7TlbpUQq4Yc3Oli4GrEoXzA=;
 b=wtra7XcWuPeb655UYEAZ1dyffn8QCfughzYu0x2vORdNthxVtboBN6I/qyKIlz0WOH
 MnxnyG0Q/ENlVScxA3gNSVldHQw6ptKWl1u51sFMU7hvMDD2j8+oPu2UDWAnUhUlY8tx
 Eit6jW50BhRvH6EXLTjj88p4QWPsa3fs84zDCnil/0rcruO2FgwFBGA1J3fuC059DkBO
 iNzyAfDVOGSDr0bM/Jb9bSLKJmgycCugQgmsIiYH5lGNMBDHFnkAaQYC+qMH407MRuAb
 L37ksBhe5TW0lcGIydJ1BErnSe6Y7sEGfm3XJN1ivmdyIsoQvTOWqco/eNQpG+e1pOJO
 Xo7Q==
X-Gm-Message-State: AJIora8b7EGaKLCp/eucIaDFnnZgSyGM/vBQYtqxzs9v7kcByxzInKA6
 X9w9HljXYdVDNKy1mrnK3w==
X-Google-Smtp-Source: AGRyM1sDXy2v8NAiVOa9bbxVTTLHd5ACgO2mQ/fQXRcuaZx7fm8HXCrqReajq/upB1S3Z8FfpIcM/g==
X-Received: by 2002:a05:6870:1484:b0:10c:22a0:3e0a with SMTP id
 k4-20020a056870148400b0010c22a03e0amr15745813oab.71.1658792059616; 
 Mon, 25 Jul 2022 16:34:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a9d6d06000000b0061c309b1dc2sm5513945otp.39.2022.07.25.16.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 16:34:19 -0700 (PDT)
Received: (nullmailer pid 2966691 invoked by uid 1000);
 Mon, 25 Jul 2022 23:34:17 -0000
Date: Mon, 25 Jul 2022 17:34:17 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: sitronix,st7701: Add
 Densitron DMT028VGHMCMI-1A TFT
Message-ID: <20220725233417.GA2966657-robh@kernel.org>
References: <20220725151703.319939-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220725151703.319939-1-marex@denx.de>
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
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, robert.foss@linaro.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Jul 2022 17:17:02 +0200, Marek Vasut wrote:
> Add compatible string for Densitron DMT028VGHMCMI-1A TFT matrix.
> This is a DSI-attached 480x640 2.83 inch panel.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Guido Günther <agx@sigxcpu.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/display/panel/sitronix,st7701.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
