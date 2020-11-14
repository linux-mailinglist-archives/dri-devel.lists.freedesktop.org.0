Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC472B2E2D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 16:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7320A6E937;
	Sat, 14 Nov 2020 15:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484D06E937
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:42:31 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r17so13670584wrw.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PrO8zrgJ3gvBSUp+SweUVPp30kkZs1tQ5BhIHJdVJfo=;
 b=hUmh1rp5YVgCdZjHZlhkmNHQvH0SpmyM7t2xgXqOo+1jqhHNsXn+HCCcGaU2ZywWLH
 sK3IsE83yKn0UAcClNW3NFRCXZWaP/8SVMHBRNuNypmIA6HVoo5GYp6fQnMqYp4j5jcm
 BQjJ1eM0F+mNKoDyBocjaSfmMJifUgfTJ3l5GcLpiayXqQ2UdRqGZon4FhiFvjwt0sLo
 3bhSlJ6kZhzQ7UTkzt1EuVn3q/yUQBkJL8zYSTjKISsZIoKn+2UQwx8eR8ApK3q91LeX
 2q1m78dpK7UP76mzS4rZ1pkIynhPXALh+I59ci25NAz3OnuQaIg0lCfNpJ7P34VA3skB
 Elyw==
X-Gm-Message-State: AOAM531PQW5ssROcc47M4InjEnp0U8SN0hZjXvtWnNYljaXMlr1+KzH+
 v0NewGi3Gnu3e5bjuk0WBvY=
X-Google-Smtp-Source: ABdhPJxsixStRZpfu+ROKa9+agmNLFBb2E78IpyswBNwtmauBjIC3Y9W+nEtEHk/WiAPf5usW7YVXw==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr10702468wrq.210.1605368549958; 
 Sat, 14 Nov 2020 07:42:29 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id o63sm13978032wmo.2.2020.11.14.07.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:42:28 -0800 (PST)
Date: Sat, 14 Nov 2020 16:42:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 08/26] memory: tegra30-emc: Continue probing if
 timings are missing in device-tree
Message-ID: <20201114154227.GB14208@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-9-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-9-digetx@gmail.com>
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
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 04:14:38AM +0300, Dmitry Osipenko wrote:
> EMC driver will become mandatory after turning it into interconnect
> provider because interconnect users, like display controller driver, will
> fail to probe using newer device-trees that have interconnect properties.
> Thus make EMC driver to probe even if timings are missing in device-tree.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)

Thanks, applied 1-8.  For the rest I see discussion on going, so I guess
there will be a v9.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
