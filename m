Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CA52A9C45
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 19:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524D96EACC;
	Fri,  6 Nov 2020 18:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E7F6EACB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 18:32:52 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id t11so2227691edj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 10:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wlqnu3kh6XxuBopLwHKSesOZDYblr5mvOU662DmL/14=;
 b=pFaHp+8DhV5wnGZqEGQrPPd2xxuIeWR2IcUWdD6FdsMzsOjEEHgZHhkXXwz5MzHp0d
 wDyUL1dnMBTZ2Wid8aQJWhn2nxNzVTlFPWoXR0euWRmraXrx5RP0jlwCH4oERbhpvEzJ
 379KNtkT3viCWeIwxYH5uqZLHpimIYBkZ1XwpHk267Z7S9YyxERBNbsTgEwxlQPiAK6S
 +h2MHbw3eibDdmTjS2k180qC4WXwjxrI/WESBLubtAwaW9XSY7WCXhOWoPytVghJn2Df
 nQpAr0v6do5V1XH+2BdcYOHVH5fxfrf69r3IyYM7lrfA5MY/JhWqxvJDAVmndIGxfiqY
 tT2Q==
X-Gm-Message-State: AOAM531HNWvbtUP0ts8qKgMd+MGB4SFC7DuZ2Xm8zFHzreTdtmMign2Z
 ATfp/3FzeK35nrYf7K95M8o=
X-Google-Smtp-Source: ABdhPJysBETw2OKO/y2t2f3uzbaB0a2i9/BYSM2XsqM4nZRH6RmJYYAOOYFH9TJ10tsbJnv1RfwKKA==
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr3553775edt.13.1604687571150; 
 Fri, 06 Nov 2020 10:32:51 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id f19sm1627353edy.13.2020.11.06.10.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 10:32:49 -0800 (PST)
Date: Fri, 6 Nov 2020 19:32:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 11/47] dt-bindings: memory: tegra30: emc: Document OPP
 table and voltage regulator
Message-ID: <20201106183248.GK65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-12-digetx@gmail.com>
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

On Wed, Nov 04, 2020 at 07:48:47PM +0300, Dmitry Osipenko wrote:
> Document new OPP table and voltage regulator properties which are needed
> for supporting dynamic voltage-frequency scaling of the memory controller.
> Some boards may have a fixed core voltage regulator, hence it's optional
> because frequency scaling still may be desired.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra30-emc.yaml       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Thanks, applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
