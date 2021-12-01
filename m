Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F3A465A05
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 00:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A17E6E937;
	Wed,  1 Dec 2021 23:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC246E937
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 23:50:58 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 i5-20020a05683033e500b0057a369ac614so16144950otu.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 15:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=janDAtSPhWlePGFNQ++EVF7JDjqdKemONodqemusei8=;
 b=0UI9EbxUT8tHnEYDjs3m9P4ZH5/mW7pR1aXxXBoItqHycSqO/ghGGU7ZuKnDH3eTQz
 KwQDrWCWFD3b4CdyNfKGByLCCHAju59oqy+Nr+Ur0j7vMkG6gsjp0exAGQOkOsB/FELQ
 cem0V7mPcxQFkloTwQFesz6PSQhd/NkFDkM1u7z0KFJA6f5fssUouZ9wEDdoOxTBK8QT
 D+HHMWKlNct2RtP2ZOSVWQdDVGvIVM9nOUhzCLdeGZcDSSGohcWm6iXjtgvquEmvK7UB
 r9ys3faEVx1tbL/mLkRzxvYBE+o/Q0drHaoOPrR9fY7d9hidHYVW48CuGGqkis4DUpzU
 5+Hg==
X-Gm-Message-State: AOAM532Ue69F3ge36UgfSmTaBpkDditbjEZirsjiFkRygCBfI+2eRA9F
 vDD5b3PF06EcMu0fbuQ9uQ==
X-Google-Smtp-Source: ABdhPJx5TFH68EuJ9T0gpn/g1grXRTeXYFnflCit2PV7CCMx8U7wAVQns9O50JdQkJLNhGx8FpK1Rg==
X-Received: by 2002:a9d:868:: with SMTP id 95mr8732322oty.211.1638402658107;
 Wed, 01 Dec 2021 15:50:58 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id e28sm624819oiy.10.2021.12.01.15.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 15:50:57 -0800 (PST)
Received: (nullmailer pid 3243259 invoked by uid 1000);
 Wed, 01 Dec 2021 23:50:56 -0000
Date: Wed, 1 Dec 2021 17:50:56 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 04/20] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Message-ID: <YagKYCbHw5BHAcdI@robh.at.kernel.org>
References: <20211126161807.15776-1-digetx@gmail.com>
 <20211126161807.15776-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211126161807.15776-5-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Agneli <poczt@protonmail.ch>,
 linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 26 Nov 2021 19:17:51 +0300, Dmitry Osipenko wrote:
> Document new optional sound-dai-cells property of HDMI node. This node will
> be used as endpoint of HDMI sound DAI graph.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
