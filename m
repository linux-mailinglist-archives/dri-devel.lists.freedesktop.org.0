Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9262A9C03
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A11B6EAC2;
	Fri,  6 Nov 2020 18:25:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F046EABF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:25:41 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id p93so2226297edd.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W4e9xxWCUUkemhkYqMYZWqkqTifhMPb66C70SaoRt8w=;
 b=s+d178vPXs9S6psOnwwEp3FNn0Oe/bNREyY1r0vBPakHOfbUT5HxbE8keeYN8z2ZRc
 WN3O1+0UB3Uj1aBdbMwiLIhivfuGuaWSYwB8EFC2JS+m1Q4qXEiIiAyRwnwRi/3O561f
 DiuXaiHx/ytzT4qJ7k04SK8R1sU0MYqKShwHX0bfxgq+Ex4sWgKMOGLOVGADj2rjqbqL
 golXfj+KOEwFH4jwmykbwZxc2wo+vMkMEJ/dPuV121260VVQNIFjrP+XVGcf8xP2VhZW
 pxhMzEo5XkadBqD+3jrOXl6n3gEf4ogcXAeU7DGqo9lB8Yycl7qdOMVl2lygUf407u3c
 TtRg==
X-Gm-Message-State: AOAM530fXi8qSU/757rrHmrBSsdi42g7d2vuj6YEwNfZHr4qMn1bupZw
 QtJbZNCksLScVUGBIdyyFgA=
X-Google-Smtp-Source: ABdhPJwR2qKcQO2sO6AyYIsG/sCwIbE/ol0NFC503Fd5sXYO1Lhak+5D+Y+HdxZ8Y96i3i2KfUiW/w==
X-Received: by 2002:a50:99c3:: with SMTP id n3mr3432007edb.213.1604687139764; 
 Fri, 06 Nov 2020 10:25:39 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id cn8sm1580968edb.18.2020.11.06.10.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:25:38 -0800 (PST)
Date: Fri, 6 Nov 2020 19:25:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 03/47] soc/tegra: fuse: Add stub for tegra_sku_info
Message-ID: <20201106182537.GC65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-4-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:39PM +0300, Dmitry Osipenko wrote:
> Drivers that use tegra_sku_info and have COMPILE_TEST are failing to be
> build due to the missing stub for tegra_sku_info, thus add the missing
> stub.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/soc/tegra/fuse.h | 4 ++++

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
