Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B1C2E032B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 01:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814A86E824;
	Tue, 22 Dec 2020 00:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D886E824
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 00:09:11 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id a109so10468140otc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 16:09:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ItdUMRfTDsdb0hqe14rohMJr65K3UQ/22dOQXCjLzFE=;
 b=NA9lBlTri6NUf9i2EJgEJe89265NZFzQdvpG1u+RlLB5OvxcmaV0XcFDw7DHAQh+a5
 D+xzccdS8iFHKAR01n0Dt4aD6hjIERkHU/efbMmdaJbs40VWDIpo1tmdRrl6IhxPu6BH
 06qv+GziYLorE4SFgOnOliIeNvHN+iRYDS3PYCezgmJIl6rRjFrIiagkEQMliaFQUibk
 NsIJjxHySBTSbuRckB+ghiWZrVZqohaB8pDQky0hSLzsHC92m54KzlC75609r9+plkF8
 PLuUxjTLSFRALlI1YEwq+Wd1dDVkQK9Rpv73Q7gmFJFUiNLCda+DCnIv0w3UxCrhZyAz
 byHg==
X-Gm-Message-State: AOAM530hjlzvVjsJKKjBoB82AU7XPEgoOFL9WF08/bfH6UjNzeKp461Q
 N7SE0noqqjcGhuIPEXowrw==
X-Google-Smtp-Source: ABdhPJy4jl6IQt5jJ5yPRdxdZBTTS1Nugckix9YOiNWPt3ntEL9GZvmZ7XQ1+laNFn9KbtQIJ5+hQA==
X-Received: by 2002:a9d:470f:: with SMTP id a15mr14177036otf.62.1608595750781; 
 Mon, 21 Dec 2020 16:09:10 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s77sm4075422oos.27.2020.12.21.16.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 16:09:09 -0800 (PST)
Received: (nullmailer pid 890725 invoked by uid 1000);
 Tue, 22 Dec 2020 00:09:04 -0000
Date: Mon, 21 Dec 2020 17:09:04 -0700
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 04/48] dt-bindings: host1x: Document OPP and power
 domain properties
Message-ID: <20201222000904.GA890651@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-5-digetx@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Dec 2020 21:05:54 +0300, Dmitry Osipenko wrote:
> Document new DVFS OPP table and power domain properties of the Host1x bus
> and devices sitting on the bus.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.txt   | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
