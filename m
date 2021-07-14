Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5713C9218
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 22:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036A96E4F8;
	Wed, 14 Jul 2021 20:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F1D6E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 20:30:30 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id o8so2884862ilf.4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 13:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yeqH3519s9TR7u8H68VDtMcnBoL+fYSZSk2mtTvRFuU=;
 b=Ab9SVK/ylFF2yk0qzcjXe+kE/cj4tBvF9eIU6WAObYMRFG7gqYVv8ihGz5xz4CQ1Yy
 gXD0l5v7dxMtXzTTb/6xQMUzD3dplNCpK3h1giHBjnNuSHERs0r7BfSpf/V+L3Fgax3N
 YI/BJfDhadDkpwHSAmOeWZdiyIRA4qnNLPrrXk9Od+fOJczPXGQN2uNE2vgkBUIik8Dd
 nxjB8lpFaPUg7AHPlpxqDXM7u5smcR9wwYx54yrGqzDRZsErm8jFPLotLr23zpLaMvEv
 acBMa4nLv6Dt28NCpXGb/sZYX/umAwYCXBawDbgYtXb+07/AakshlP5ZZoydSe7GcWyy
 Ty9w==
X-Gm-Message-State: AOAM530bkY+jONiHdH9Q0scqE7HF4RetbMDz2mZyjq9SIH6wMQMMxQSe
 QXT7jeMuITZ8zX/mpXzllA==
X-Google-Smtp-Source: ABdhPJytuNpDn/33kY2kMBoOHeFD1ZZbC1vgPUMTXoRZDQ11PyuZ3uK32kK5pVfUKHhpW1D05/SOZQ==
X-Received: by 2002:a05:6e02:1a28:: with SMTP id
 g8mr1031391ile.128.1626294629908; 
 Wed, 14 Jul 2021 13:30:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id m1sm1883001iok.33.2021.07.14.13.30.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 13:30:29 -0700 (PDT)
Received: (nullmailer pid 3466710 invoked by uid 1000);
 Wed, 14 Jul 2021 20:30:27 -0000
Date: Wed, 14 Jul 2021 14:30:27 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Innolux EJ030NA
Message-ID: <20210714203027.GA3466681@robh.at.kernel.org>
References: <20210625121045.81711-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625121045.81711-1-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, Christophe Branchereau <cbranchereau@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 list@opendingux.net, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 25 Jun 2021 13:10:44 +0100, Paul Cercueil wrote:
> Add binding for the Innolux EJ030NA panel, which is a 320x480 3.0" 4:3
> 24-bit TFT LCD panel with non-square pixels and a delta-RGB 8-bit
> interface.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../display/panel/innolux,ej030na.yaml        | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innolux,ej030na.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
