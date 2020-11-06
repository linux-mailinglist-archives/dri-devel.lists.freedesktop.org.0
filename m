Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDF02A9CF1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 20:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD356EAAF;
	Fri,  6 Nov 2020 19:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002876EAAF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 19:04:18 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id a15so2352401edy.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 11:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OYoeHJD5uO+sjh4LU5bBd2tSOxd4znP/rBtSzv6s3jE=;
 b=HFZjP3e4GAaGbOkD5HTofm8MDJA/b4gajYZyB1bIbiqkjwfquTcA4vp3yh467BOlGZ
 lpDHYU+wC6LzV727mFCBN1UIv58EF+sJSMm2zdBAH1p+Ip/dKUIw4Nsq5OmUedS2uRfI
 pzB0GcWywg0E+yMZPAbPnQ9lY+kXW6uEY4pBlOSTSGctFo6cFGoDpVwK1G5q2thfHDPC
 MOMTt3qBa5pCDqjDUnkks4Lxgyb1zNb1VIhXOlVVpUl+izYB4YvD2+i3eTgKWhPNuaRc
 QZx++iJbgXfKiTY0Lcphh8LJHlRmCbEm4IE205enGzLQYguP2enexjADP/u3kIPsuG08
 3cNQ==
X-Gm-Message-State: AOAM531waB+ZlnFlFvy+cua7X1IDcuGIf2T8/nAqIGbMjQ0khrtV/uQm
 txAxeC60lV6q3cvlPq7GKy0=
X-Google-Smtp-Source: ABdhPJweanm0OOnvcB9aFJuyXOJm4oH/48y7DTX2fQEoxC2KJiI8dXLP4F/k1VTns2KMJPkHkBngvA==
X-Received: by 2002:a50:c945:: with SMTP id p5mr3499724edh.55.1604689457685;
 Fri, 06 Nov 2020 11:04:17 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id e13sm1690688edc.9.2020.11.06.11.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 11:04:16 -0800 (PST)
Date: Fri, 6 Nov 2020 20:04:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 30/47] memory: tegra: Remove superfluous error
 messages around platform_get_irq()
Message-ID: <20201106190415.GV65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-31-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-31-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:49:06PM +0300, Dmitry Osipenko wrote:
> The platform_get_irq() prints error message telling that interrupt is
> missing, hence there is no need to duplicated that message in the drivers.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/mc.c          | 4 +---
>  drivers/memory/tegra/tegra20-emc.c | 1 -
>  drivers/memory/tegra/tegra30-emc.c | 5 ++---

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
