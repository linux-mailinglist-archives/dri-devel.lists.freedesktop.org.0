Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A92647659F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 23:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD70D10F9DC;
	Wed, 15 Dec 2021 22:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D349410F9DC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 22:27:33 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 r18-20020a4a7252000000b002c5f52d1834so6368785ooe.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 14:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=khz6XuxeDKafAUA9AHe6/aR/dP/aRvnjdJRNkKlCqTo=;
 b=E0E2Q773FtQlZiOKk3H7QgfFSFOaP/PiWkL6ySo+dGSeDLHA5BscuSmLvfkYZ7hK9i
 EUHyqlyHY2KOW5hNr2R/8OmSRj3ryKConYIF/jWL3+lJjl9EsgIwzObo0Z4QqLCvEWEI
 LWKSWDMNUbCf8q3T4NcAt0Cesty+F0hEBFq2xsL1od8MSUh1Los1wcLSxr6GXMAGViqs
 ChgLZZ6/zOpEMEvrdPKGXlxFJkQZP2GIWnI5W5Gg8U4kZa4VfH/hqKKh1CCz4JdNxzEA
 E3SHysT9QRADggNL1Xt3jmHczNncBNcKTvohwdqZyZ+sWNPVbepdiLPuLkpfOuAhP6lo
 q75g==
X-Gm-Message-State: AOAM533Jj9JWw55f/Ne0NIH1VUnc4r+JFo387L3CXGxIUoflGsgRh+mS
 tUAYSo1qaCWPYCzVMLorMg==
X-Google-Smtp-Source: ABdhPJzNVqqhvP0NPVYe+ULeBlpmR/5grGdaEFpeSYXa09aXA387KoadkmV5AG04I5FgiwIo+QcSUA==
X-Received: by 2002:a4a:ab05:: with SMTP id i5mr9069023oon.61.1639607252965;
 Wed, 15 Dec 2021 14:27:32 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bi20sm661315oib.29.2021.12.15.14.27.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 14:27:32 -0800 (PST)
Received: (nullmailer pid 1954728 invoked by uid 1000);
 Wed, 15 Dec 2021 22:27:28 -0000
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20211215152712.72502-1-david@ixit.cz>
References: <20211215152712.72502-1-david@ixit.cz>
Subject: Re: [PATCH] dt-bindings: display: bridge: document Toshiba TC358768
 cells and panel node
Date: Wed, 15 Dec 2021 16:27:28 -0600
Message-Id: <1639607248.090344.1954727.nullmailer@robh.at.kernel.org>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Dec 2021 16:27:12 +0100, David Heidelberg wrote:
> Properties #address-cells and #size-cells are valid.
> The bridge node can also contains panel node.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/bridge/toshiba,tc358768.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1568330


tc358778@e: compatible: Additional items are not allowed ('toshiba,tc358768' was unexpected)
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml

tc358778@e: compatible: ['toshiba,tc358778', 'toshiba,tc358768'] is too long
	arch/arm/boot/dts/am571x-idk.dt.yaml
	arch/arm/boot/dts/am572x-idk.dt.yaml
	arch/arm/boot/dts/am574x-idk.dt.yaml

