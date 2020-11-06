Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F462A9C54
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE1989996;
	Fri,  6 Nov 2020 18:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3101589996
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:34:44 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id w13so3241733eju.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:34:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FkzNqxSfyMo55uSFo/RaS7wC0Mk7oJJx/7MeeIEWsa4=;
 b=L1G2Bz/A/pQ7X2c0uO7i6aV4oP5x2yh8+sH/lUxxKTXIASgnhQcIUwpkm2L3oX+u5n
 bgAAWL7bvGbm9hC6NpRoIMvZinZTbTVt1gJDV/H+/fxWaynVGU673ha6U2GgASBogyd6
 j5gwpce4BiT5TqDnREgr9WLEnDO1jf4+bWl2qF06ABcDcK3bvOmpNYZTJV9nR4DVP5iA
 wuROgELyxkEAS4FuvLjXXj+2BmUBaTyvJzvGWV1Xww5qUDkEK/meTaCwJNeszfXZwQlL
 PEeDzn2+BJEnz02YRYbkcM0nbeUKIRFsMrDDFy8xFfw7OYp0cUc6dBq1sLjc2yqmRVpI
 cEXg==
X-Gm-Message-State: AOAM530MsKah0+jyGFsTKs0GVxRe+pYkpB/VDdA/8UZYtPxAUG/IjMUq
 d0n23g9X3+OTixKM+AMREkQ=
X-Google-Smtp-Source: ABdhPJy3Lu/emveh4xDrPGSELPBmtgh1n9Y46JBkYcuVt7osEk6IGboPfP6TMtvtKJf6JLY+T06mUg==
X-Received: by 2002:a17:906:934d:: with SMTP id
 p13mr3275824ejw.245.1604687682790; 
 Fri, 06 Nov 2020 10:34:42 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id t3sm1588459edv.59.2020.11.06.10.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:34:41 -0800 (PST)
Date: Fri, 6 Nov 2020 19:34:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 15/47] dt-bindings: tegra30-actmon: Document OPP and
 interconnect properties
Message-ID: <20201106183440.GN65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-16-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-16-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 07:48:51PM +0300, Dmitry Osipenko wrote:
> Document EMC DFS OPP table and interconnect paths that will be used
> for scaling of system's memory bandwidth based on memory utilization
> statistics. Previously ACTMON was supposed to drive EMC clock rate
> directly, but now it should do it using interconnect framework in order
> to support shared voltage scaling in addition to the frequency scaling.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../arm/tegra/nvidia,tegra30-actmon.txt       | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
