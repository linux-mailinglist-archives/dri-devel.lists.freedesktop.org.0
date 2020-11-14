Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706212B2E18
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 16:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D936E932;
	Sat, 14 Nov 2020 15:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BBB6E931
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:38:31 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d12so13596282wrr.13
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:38:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=69qJWYnkpX9ioi+qZUPFiAO05y/pWbxM2in9qciZRJI=;
 b=HSFm+fP2Ont+A82KpY4Kfy52DxndlhgZPAdZ9vB8KzHXEb/MPku1sk+ItWQOgcdJFQ
 QJpLSkMqX7PkUxfDsL/jUK5gNhKUdUufQUREK+JVfYyvZGqhvxkZI4NA3exGLY+1c6sd
 Pp0/+Rqq2ialUb30JRrQj107A7TZMvGtWy/xNDHAC5z0pV7HeChC9Nk2EJFJp4HMXUUu
 CaJuiR1BUR7lthOR8gJnSCMzrmfC0h1daxigOnyGIvw0dAuPR1jms1f+oBFj1rwEpe9P
 OcJyuFxcG6Iv/yPpqi2n6ZZscn8BKfoxn+Hpd2Jb3lhMgpScVRdbVPJgfGRk9uTnmsfI
 58nA==
X-Gm-Message-State: AOAM532KLFFaXA8oJmPx1UDCGD52VMLGx0PzGEE95COpWRln4Y3R7O80
 XxFCOgl96QjeJD2xMqGyMgg=
X-Google-Smtp-Source: ABdhPJzGD2upHveWozj9/L9++omxHZy6/WMjZ1VlhkXJYpJnfssMc3CoHSdH0lNlmeAn5QKPbKBoCA==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr9923823wrv.243.1605368310239; 
 Sat, 14 Nov 2020 07:38:30 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id 30sm8374755wrd.88.2020.11.14.07.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:38:29 -0800 (PST)
Date: Sat, 14 Nov 2020 16:38:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 05/26] memory: tegra20-emc: Remove IRQ number from
 error message
Message-ID: <20201114153827.GD4106@kozik-lap>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-6-digetx@gmail.com>
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

On Wed, Nov 11, 2020 at 04:14:35AM +0300, Dmitry Osipenko wrote:
> Remove IRQ number from error message since it doesn't add any useful
> information, especially because this number is virtual.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
